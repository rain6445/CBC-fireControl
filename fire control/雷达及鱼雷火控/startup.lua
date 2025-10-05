--[[======================================================================
    自动火控 (仅偏航电机控制)
    v2.4.3
======================================================================]]

-- 尝试打开 modem
peripheral.find("modem", rednet.open)

-- 全局常量
local protocol, request_protocol = "CBCNetWork", "CBCcenter"
local PI, TWO_PI = math.pi, 2 * math.pi

-- 数据持久化
local properties, system = {}, { fileName = "dat", file = nil }

-- 重置系统属性为默认值
function system.reset() 
    return { 
        cannonName = "CBC", 
        controlCenterId = "", -- 默认Center ID为空字符串，避免无效发送
        redstoneOutputSide = "top", -- 新增：默认红石输出面
        redstoneCooldown = 0.5, -- 新增：红石输出冷却时间，默认0.5秒
        minRedstoneYawAngle = -10, -- 新增：红石禁区最小偏航角，默认-10度
        maxRedstoneYawAngle = 10,  -- 新增：红石禁区最大偏航角，默认10度
        cannonOffset = { x = 0, y = 3, z = 0 }, -- 保留用于校准偏航电机在船体上的物理位置，y轴固定为3
        minYawAngle = -90, 
        maxYawAngle = 90, -- 默认偏航禁区范围，以便增量绕行生效
        yawResetAngle = 0, 
        face = "west", 
        password = "123456", 
        lock_yaw_range = 0, 
        lock_yaw_face = "east", 
        yaw_torque = 50.0, 
        pid_p = 300.0, -- 默认值 P
        pid_i = 0.0,   -- 默认值 I
        pid_d = 40.0,  -- 默认值 D
        invertYawMotor = false, 
        yawDirectionOffset = 0 -- 偏航校准偏移量，不影响复位角度
    } 
end

-- 将对象写入文件进行持久化
-- **修改：在写入时，过滤掉PID参数**
function system.write(file, obj) 
    local f = io.open(file, "w"); 
    if f then 
        local obj_to_save = {}
        for k, v in pairs(obj) do
            -- 排除PID参数
            if k ~= "pid_p" and k ~= "pid_i" and k ~= "pid_d" then
                obj_to_save[k] = v
            end
        end
        f:write(textutils.serialise(obj_to_save)); 
        f:close() 
    end 
end

-- 更新持久化数据
function system.updatePersistentData() 
    system.write(system.fileName, properties) 
end

-- 初始化系统：加载或设置默认属性
-- **修改：在加载时，跳过PID参数**
function system.init() 
    local f = io.open(system.fileName, "r"); 
    if f then 
        local d = textutils.unserialise(f:read("a")); 
        f:close(); 
        properties = system.reset(); -- 首先加载默认值 (包含新的PID默认值)
        for k, v in pairs(properties) do 
            -- **修改：仅当键不是PID参数时才从文件中覆盖**
            if k ~= "pid_p" and k ~= "pid_i" and k ~= "pid_d" then
                if d and d[k] ~= nil then properties[k] = d[k] end 
            end
        end 
    else 
        properties = system.reset(); -- 如果没有文件，使用默认值
        system.updatePersistentData() 
    end 
end
system.init()

-- 外设初始化
local yawMotor

-- 更新电机PID和扭矩参数的函数 (在UI更改后调用)
local function updateMotorParameters()
    -- 使用 tonumber(value) or 0 确保参数是数字，即使UI输入无效
    local p_val = tonumber(properties.pid_p) or 0
    local i_val = tonumber(properties.pid_i) or 0
    local d_val = tonumber(properties.pid_d) or 0
    local yaw_t_val = tonumber(properties.yaw_torque) or 0

    if yawMotor then
        yawMotor.setPID(p_val, i_val, d_val)
        yawMotor.setOutputTorque(yaw_t_val)
        yawMotor.setIsAdjustingAngle(true) -- 确保模式是角度调整
    end
end

-- 初始化电机
local function initializeMotors() 
    term.clear(); term.setCursorPos(1, 1); print("--- Initializing Yaw Motor... ---"); 
    yawMotor = peripheral.wrap("back"); 
    if not yawMotor then print("Fatal Error: Yaw motor 'back' not found!"); return false end; 
    -- 使用 properties 中的 PID 和 Torque 值，并确保是数字
    yawMotor.setPID(tonumber(properties.pid_p) or 0, tonumber(properties.pid_i) or 0, tonumber(properties.pid_d) or 0); 
    yawMotor.setIsAdjustingAngle(true); 
    yawMotor.setOutputTorque(tonumber(properties.yaw_torque) or 0); 
    print("Yaw motor OK."); 
    print("\n--- Yaw motor ready ---"); sleep(2); return true 
end
if not initializeMotors() then return end

-- 数学与工具函数
local function wrapToPi(a) return (a + PI) % TWO_PI - PI end
local function quatMultiply(q1, q2) return {w=-q1.x*q2.x-q1.y*q2.y-q1.z*q2.z+q1.w*q2.w,x=q1.x*q2.w+q1.y*q2.z-q1.z*q2.y+q1.w*q2.x,y=-q1.x*q2.z+q1.y*q2.w+q1.z*q2.x+q1.w*q2.y,z=q1.x*q2.y-q1.y*q2.x+q1.z*q2.w+q1.w*q2.z} end
local function RotateVectorByQuat(q,v) local x,y,z=q.x*2,q.y*2,q.z*2;local xx,yy,zz=q.x*x,q.y*y,q.z*z;local xy,xz,yz=q.x*y,q.x*z,q.y*z;local wx,wy,wz=q.w*x,q.w*y,q.w*z;return{x=(1-(yy+zz))*v.x+(xy-wz)*v.y+(xz+wy)*v.z,y=(xy+wz)*v.x+(1-(xx+zz))*v.y+(yz-wx)*v.z,z=(xz-wy)*v.x+(yz+wx)*v.y+(1-(xx+yy))*v.z} end
local function negaQ(q) return {w=q.w,x=-q.x,y=-q.y,z=-q.z} end
-- getCannonPos 现在是获取偏航电机在世界坐标系中的位置
local function getCannonPos() 
    local w=ship.getWorldspacePosition();
    local y=ship.getShipyardPosition();
    local s=coordinate.getAbsoluteCoordinates();
    -- cannonOffset.y 仍然用于计算，但不再从UI调整
    local o={x=y.x-s.x-0.5-properties.cannonOffset.x,y=y.y-s.y-0.5-properties.cannonOffset.y,z=y.z-s.z-0.5-properties.cannonOffset.z};
    o=RotateVectorByQuat(ship.getQuaternion(),o);
    return{x=w.x-o.x,y=w.y-o.y,z=w.z-o.z} 
end

-- 优化：将这些计算值提取为局部变量，在配置更新时刷新
local _minYawAngle_rad, _maxYawAngle_rad
local _yawResetAngle_rad
local _yawDirectionOffset_rad
local _lock_yaw_range_rad
local _redstoneCooldown -- 红石冷却时间
local _minRedstoneYawAngle_rad, _maxRedstoneYawAngle_rad -- 新增：红石禁区角度

-- 刷新配置值，处理数字转换和默认值回退
local function refreshConfigValues()
    local defaults = system.reset() -- 获取默认值以备回退

    _minYawAngle_rad = math.rad(tonumber(properties.minYawAngle) or defaults.minYawAngle)
    _maxYawAngle_rad = math.rad(tonumber(properties.maxYawAngle) or defaults.maxYawAngle)
    _yawResetAngle_rad = math.rad(tonumber(properties.yawResetAngle) or defaults.yawResetAngle)
    
    -- 校准偏移量
    _yawDirectionOffset_rad = math.rad(tonumber(properties.yawDirectionOffset) or defaults.yawDirectionOffset)
    
    _lock_yaw_range_rad = math.rad(tonumber(properties.lock_yaw_range) or defaults.lock_yaw_range)
    
    -- Cannon Offset 的 x 和 z 也要进行安全转换
    properties.cannonOffset.x = tonumber(properties.cannonOffset.x) or defaults.cannonOffset.x
    -- properties.cannonOffset.y 不再从UI调整，保持其在properties中的数字值
    properties.cannonOffset.z = tonumber(properties.cannonOffset.z) or defaults.cannonOffset.z
    
    -- redstoneOutputSide 是字符串，无需 tonumber
    _redstoneCooldown = tonumber(properties.redstoneCooldown) or defaults.redstoneCooldown
    _minRedstoneYawAngle_rad = math.rad(tonumber(properties.minRedstoneYawAngle) or defaults.minRedstoneYawAngle)
    _maxRedstoneYawAngle_rad = math.rad(tonumber(properties.maxRedstoneYawAngle) or defaults.maxRedstoneYawAngle)
end
refreshConfigValues() -- 首次加载时刷新一次

-- 辅助函数：检查一个角度是否在允许范围内 (不在禁区内)
-- 注意：这里的 min_rad 和 max_rad 定义的是“允许”的范围
local function isAngleAllowed(angle_rad, min_rad, max_rad)
    local wrapped_angle = wrapToPi(angle_rad)
    if min_rad < max_rad then -- 允许范围是 [min, max]
        return wrapped_angle >= min_rad and wrapped_angle <= max_rad
    else -- 允许范围是环绕的，例如 [min, PI) U (-PI, max]
        return wrapped_angle >= min_rad or wrapped_angle <= max_rad
    end
end

-- 辅助函数：计算最短角距离
local function angularDistance(a1, a2)
    local d = wrapToPi(a2 - a1)
    return math.abs(d)
end

-- 辅助函数：获取离一个角度最近的允许边界
local function getClosestAllowedBoundary(angle, min_allowed, max_allowed)
    local wrapped_angle = wrapToPi(angle)
    if isAngleAllowed(wrapped_angle, min_allowed, max_allowed) then
        return wrapped_angle -- 已经允许，返回自身
    end

    -- 角度在禁区内，找到最近的允许边界
    local dist_to_min = angularDistance(wrapped_angle, min_allowed);
    local dist_to_max = angularDistance(wrapped_angle, max_allowed);

    if dist_to_min < dist_to_max then
        return min_allowed;
    else
        return max_allowed;
    end
end

-- 检查路径是否穿过禁区 (这里指的是电机操作的允许范围之外的区域)
-- 如果最短路径的中间点有任何一个在“不允许”的区域，则认为路径穿过禁区
local function doesPathCrossForbiddenZone(c,t,min_allowed,max_allowed) 
    local d=wrapToPi(t-c);
    -- 检查路径中间点是否在不允许的区域
    -- 检查点数量可以调整，更多点更精确，但性能开销更大
    return not isAngleAllowed(c+d*0.25, min_allowed, max_allowed) or 
           not isAngleAllowed(c+d*0.5, min_allowed, max_allowed) or 
           not isAngleAllowed(c+d*0.75, min_allowed, max_allowed)
end

-- 辅助函数：检查一个角度是否在红石禁区内 (与电机允许范围是两回事)
local function isAngleInRedstoneForbiddenZone(angle_rad, min_forbidden_rad, max_forbidden_rad)
    local wrapped_angle = wrapToPi(angle_rad)
    if min_forbidden_rad < max_forbidden_rad then -- 禁区是 [min, max]
        return wrapped_angle >= min_forbidden_rad and wrapped_angle <= max_forbidden_rad
    else -- 禁区是环绕的，例如 [min, PI) U (-PI, max]
        return wrapped_angle >= min_forbidden_rad or wrapped_angle <= max_forbidden_rad
    end
end

local function genStr(s,count) local result=""; for i=1,count do result=result..s end; return result end

-- 网络通信 
-- controlCenter 结构体简化，不再包含 fire 和 mode
local controlCenter={tgPos={x=0,y=0,z=0},velocity={x=0,y=0,z=0}} 
local ct=20 -- 控制中心数据刷新计时器

-- 辅助函数：获取有效的控制中心ID（非负整数）
local function getValidControlCenterId()
    local id_str = properties.controlCenterId
    local id_num = tonumber(id_str)
    -- 确保是数字，且是非负整数 (包含 0)
    if id_num and id_num >= 0 and math.floor(id_num) == id_num then 
        return id_num
    end
    return nil -- 返回nil表示ID无效
end

-- 监听控制中心消息
local function listener() 
    while true do 
        local targetId = getValidControlCenterId()
        local id,msg=rednet.receive(protocol,2);
        -- 仅处理 tgPos 和 velocity，忽略 mode 和 fire
        if targetId ~= nil and id == targetId then 
            controlCenter.tgPos = msg.tgPos or {x=0,y=0,z=0}
            controlCenter.velocity = msg.velocity or {x=0,y=0,z=0}
            ct=20 
        end 
    end 
end

-- 向控制中心发送请求
local function sendRequest() 
    local slug=ship and ship.getName()or nil;
    while true do 
        local targetId = getValidControlCenterId()
        if targetId ~= nil then -- 只有当ID有效时才发送请求
            -- 移除 bullets_count 和 cross_point
            rednet.send(targetId,{name=properties.cannonName,pw=properties.password,slug=slug},request_protocol);
        end
        sleep(0.05) -- 保持此处的发送频率不变，因为这是火控向CC报告自身状态的频率
    end 
end

-- 运行监听器和请求发送器
local function runListener() parallel.waitForAll(sendRequest,listener) end

-- 偏航电机主控制逻辑 
local yawMotorUtil={pos={x=0,y=0,z=0},velocity={x=0,y=0,z=0}}
function yawMotorUtil:getAtt() local v=ship.getVelocity();self.pos=getCannonPos();self.velocity={x=v.x/20,y=v.y/20,z=v.z/20} end
-- getNextPos 不再需要，因为没有弹道预测

local quatList={west={w=-1,x=0,y=0,z=0},south={w=-0.7071067811865476,x=0,y=-0.7071067811865476,z=0},east={w=0,x=0,y=-1,z=0},north={w=-0.7071067811865476,x=0,y=0.7071067811865476,z=0}}

-- 运行偏航电机控制主循环
local function runCt()
    -- [[ 性能 ]] 在循环外预创建表格以复用
    local tgVec = {}
    while true do
        local finalCommandYaw_rad -- 最终发送给电机作为目标的值
        if ct > 0 then
            ct = ct - 1
            yawMotorUtil:getAtt()
            local currentYaw_rad = yawMotor.getCurrentValue(); 
            
            local yawMotorPos = yawMotorUtil.pos; 
            local target=controlCenter.tgPos;
            target.y = target.y + 0.5; -- 目标方块中心

            -- 计算从偏航电机到目标点的向量
            tgVec.x, tgVec.y, tgVec.z = target.x-yawMotorPos.x, target.y-yawMotorPos.y, target.z-yawMotorPos.z
            
            -- 转换为舰船局部坐标系
            local ship_local_vec=RotateVectorByQuat(negaQ(ship.getQuaternion()),tgVec)
            local idealTargetYaw_rad=math.atan2(ship_local_vec.z,ship_local_vec.x)
            
            -- 偏航锁定范围处理
            local localVec=RotateVectorByQuat(quatMultiply(quatList[properties.lock_yaw_face],negaQ(ship.getQuaternion())),tgVec);
            local localYaw_rad=-math.atan2(localVec.z,-localVec.x);
            if math.abs(localYaw_rad)<_lock_yaw_range_rad then idealTargetYaw_rad=0 end
            
            -- 应用偏航校准偏移量，得到原始期望角度
            local raw_desired_yaw_rad = wrapToPi(idealTargetYaw_rad + _yawDirectionOffset_rad);
            
            local min_allowed_rad = _minYawAngle_rad; -- 电机允许范围的最小角度
            local max_allowed_rad = _maxYawAngle_rad; -- 电机允许范围的最大角度
            
            local current_wrapped = wrapToPi(currentYaw_rad);

            -- **改进的禁区绕行逻辑**
            local ultimate_target_rad; -- 最终希望到达的目标角度 (可能被钳制到允许边界)

            -- Step 1: 钳制原始目标角度，确保它在允许范围内
            if not isAngleAllowed(raw_desired_yaw_rad, min_allowed_rad, max_allowed_rad) then
                ultimate_target_rad = getClosestAllowedBoundary(raw_desired_yaw_rad, min_allowed_rad, max_allowed_rad);
            else
                ultimate_target_rad = raw_desired_yaw_rad;
            end

            -- Step 2: 处理火控当前位置在禁区内的情况 (优先级最高：尽快离开禁区)
            if not isAngleAllowed(current_wrapped, min_allowed_rad, max_allowed_rad) then
                finalCommandYaw_rad = getClosestAllowedBoundary(current_wrapped, min_allowed_rad, max_allowed_rad);
                
                -- 如果火控正好卡在边界上，给一个微小的推动以确保它开始移动
                local delta_to_boundary = wrapToPi(finalCommandYaw_rad - current_wrapped);
                if math.abs(delta_to_boundary) < math.rad(0.1) then -- 如果非常接近目标边界
                    -- 推动它离开边界，方向与目标方向一致
                    finalCommandYaw_rad = wrapToPi(finalCommandYaw_rad + math.rad(1.0) * (delta_to_boundary >= 0 and 1 or -1));
                end
            else
                -- 火控当前位置在允许区域内
                -- Step 3: 检查从当前位置到最终目标的**最短路径**是否穿过禁区
                if doesPathCrossForbiddenZone(current_wrapped, ultimate_target_rad, min_allowed_rad, max_allowed_rad) then
                    -- 最短路径被禁区阻挡，需要增量引导绕行
                    local delta_to_ultimate = wrapToPi(ultimate_target_rad - current_wrapped);
                    -- 确定绕行方向：与最短路径方向相反
                    local safe_direction_sign = (delta_to_ultimate >= 0) and -1 or 1; -- 如果最短路径是顺时针，则逆时针绕行；反之亦然
                    local proxy_step_rad = math.rad(30.0); -- **已修改：每次移动的增量步长，用于引导，现在是30度**
                    finalCommandYaw_rad = wrapToPi(current_wrapped + safe_direction_sign * proxy_step_rad);
                else
                    -- 最短路径清晰，直接瞄准最终目标
                    finalCommandYaw_rad = ultimate_target_rad;
                end
            end
            -- **禁区绕行逻辑结束**
            
            finalCommandYaw_rad = wrapToPi(finalCommandYaw_rad); -- 确保最终指令角度在 [-PI, PI] 范围内
            sleep(0.1) -- 活动状态下每 0.1 秒更新一次
        else
            -- [[ 性能 ]] 闲置时，仅执行重置逻辑并大幅增加休眠时间
            finalCommandYaw_rad = _yawResetAngle_rad
            sleep(0.5) -- 低频更新
        end

        if properties.invertYawMotor then finalCommandYaw_rad = -finalCommandYaw_rad end
        yawMotor.setTargetValue(finalCommandYaw_rad)
    end
end

-- 新增：红石输入/输出控制函数
local function runRedstoneControl()
    local all_sides = {"top", "bottom", "left", "right", "front"} -- 排除 "back"
    local lastOutputTime = 0 -- 记录上次输出脉冲开始的时间，用于冷却
    local isOutputOn = false -- 标记输出是否正在进行中 (0.2秒脉冲)
    local pulseStartTime = 0 -- 记录当前脉冲开始的时间

    while true do
        local output_side = properties.redstoneOutputSide
        local signal_detected = false
        local currentYaw_rad = yawMotor.getCurrentValue() -- 获取当前偏航角度

        -- 检查所有输入面
        for _, side in ipairs(all_sides) do
            if side ~= output_side then -- 这是一个输入面
                if redstone.getInput(side) then
                    signal_detected = true
                    break -- 只要检测到一个信号就够了
                end
            end
        end
        
        local currentTime = os.clock()

        -- 检查是否在红石禁区内
        local inRedstoneForbiddenZone = isAngleInRedstoneForbiddenZone(currentYaw_rad, _minRedstoneYawAngle_rad, _maxRedstoneYawAngle_rad)

        -- 如果在禁区内，强制关闭输出并阻止新脉冲
        if inRedstoneForbiddenZone then
            if redstone.getOutput(output_side) then -- 如果当前是开着的，就关掉
                redstone.setOutput(output_side, false)
            end
            isOutputOn = false -- 确保不在输出状态
            -- 禁区内不触发冷却，因为没有实际输出
        else
            -- 处理脉冲结束
            if isOutputOn and (currentTime - pulseStartTime >= 0.2) then
                redstone.setOutput(output_side, false)
                isOutputOn = false
            end

            -- 处理脉冲开始 (如果检测到信号，不在输出中，且冷却时间已过)
            if signal_detected and not isOutputOn and (currentTime - lastOutputTime >= _redstoneCooldown) then
                redstone.setOutput(output_side, true)
                isOutputOn = true
                pulseStartTime = currentTime
                lastOutputTime = currentTime -- 冷却时间从脉冲开始时计算
            end
        end
        
        sleep(0.1) -- **已修改：每 0.1 秒检查一次红石输入/输出**
    end
end

-- UI界面相关工具函数和类定义
local termUtil={cpX=1,cpY=1};
local absTextField={x=1,y=1,len=15,text="",textCorlor="0",backgroundColor="8"};

-- 绘制文本框
function absTextField:paint() 
    local str="";
    for i=1,self.len,1 do 
        local text=tostring(self.key[self.value]);
        local tmp=string.sub(text,i,i);
        if #tmp>0 then 
            str=str..tmp 
        else 
            local tmp2="";
            for j=0,self.len-i,1 do tmp2=tmp2.." " end;
            str=str..tmp2;
            break 
        end 
    end;
    term.setCursorPos(self.x,self.y);
    term.blit(str,genStr(self.textCorlor,#str),genStr(self.backgroundColor,#str)) 
end;

-- 处理文本框字符输入
function absTextField:inputChar(char) 
    local xPos,yPos=term.getCursorPos();xPos=xPos-self.x+1;local field=tostring(self.key[self.value]);
    if #field < self.len then
        if self.type == "number" then
            if self.value == "controlCenterId" then -- Center ID 的特殊处理 (仅限数字)
                if char >= '0' and char <= '9' then
                    field = string.sub(field,1,xPos-1)..char..string.sub(field,xPos,#field)
                    self.key[self.value] = field -- 作为字符串存储
                    termUtil.cpX=termUtil.cpX+1
                end
            else -- 通用数字字段 (允许数字、一个小数点、一个前导负号)
                local current_field_str = field
                local new_field_str = current_field_str

                if (char >= '0' and char <= '9') then
                    new_field_str = string.sub(current_field_str,1,xPos-1)..char..string.sub(current_field_str,xPos,#current_field_str)
                elseif char == '.' then
                    if not current_field_str:find('.') then -- 只允许一个小数点
                        new_field_str = string.sub(current_field_str,1,xPos-1)..char..string.sub(current_field_str,xPos,#current_field_str)
                    end
                elseif char == '-' then
                    if xPos == 1 and not current_field_str:find('-') then -- 只允许一个前导负号
                        new_field_str = char..current_field_str
                    end
                end
                
                if new_field_str ~= current_field_str then -- 如果添加了有效字符
                    self.key[self.value] = new_field_str -- 作为字符串存储
                    termUtil.cpX=termUtil.cpX+1
                end
            end
        elseif self.type == "string" then
            local strEnd=string.sub(field,xPos,#field);field=string.sub(field,1,xPos-1)..char..strEnd;self.key[self.value]=field;termUtil.cpX=termUtil.cpX+1
        end
    end
end;

-- 处理文本框按键输入 (例如退格、左右箭头)
function absTextField:inputKey(key) 
    local xPos,yPos=term.getCursorPos();local field=tostring(self.key[self.value]);local minXp=self.x;local maxXp=minXp+#field;
    if key==259 then -- 退格键
        if xPos>minXp then
            termUtil.cpX=termUtil.cpX-1;
            if #field>0 and termUtil.cpX>=self.x then
                local index=termUtil.cpX-self.x+1;
                field=string.sub(field,1,index-1)..string.sub(field,index+1,#field)
            end;
            self.key[self.value]=field -- 作为字符串存储
        end
    elseif key==262 then termUtil.cpX=termUtil.cpX+1 -- 右箭头
    elseif key==263 then termUtil.cpX=termUtil.cpX-1 -- 左箭头
    end;
    termUtil.cpX=termUtil.cpX>maxXp and maxXp or termUtil.cpX;
    termUtil.cpX=termUtil.cpX<minXp and minXp or termUtil.cpX
end;

-- 处理文本框点击事件 (设置光标位置)
function absTextField:click(x,y) local xPos=self.x;if x>=xPos then if x<=xPos+#tostring(self.key[self.value]) then termUtil.cpX,termUtil.cpY=x,y else termUtil.cpX,termUtil.cpY=xPos+#tostring(self.key[self.value]),y end end end;

-- 创建新的文本框实例
local function newTextField(key,value,x,y) return setmetatable({key=key,value=value,type=type(key[value]),x=x,y=y},{__index=absTextField}) end;

local absSelectBox={x=1,y=1,label="",contents={},count=0,interval=0,fontColor="8",backgroundColor="f",selectColor="e"};

-- 绘制选择框
function absSelectBox:paint() 
    term.setCursorPos(self.x,self.y);
    local select=tostring(self.key[self.value]);
    for i=1,#self.contents,1 do 
        local str=tostring(self.contents[i]);
        if select==str then 
            term.blit(str,genStr(self.backgroundColor,#str),genStr(self.selectColor,#str)) 
        else 
            term.blit(str,genStr(self.fontColor,#str),genStr(self.backgroundColor,#str)) 
        end;
        for j=1,self.interval,1 do term.write(" ") end 
    end 
end;

-- 处理选择框点击事件
function absSelectBox:click(x,y) 
    local xPos=x+1-self.x;
    local index=0;
    for i=1,#self.contents,1 do 
        if xPos>=index and xPos<=index+#tostring(self.contents[i]) then 
            self.key[self.value]=self.contents[i];
            break 
        end;
        index=index+#tostring(self.contents[i])+self.interval 
    end 
end;

-- 创建新的选择框实例
local function newSelectBox(key,value,interval,x,y,...) return setmetatable({key=key,value=value,interval=interval,x=x,y=y,type=type(key[value]),contents={...}},{__index=absSelectBox}) end

local selfId=os.getComputerID()

-- 运行终端UI界面
local function runTerm()
    local fieldTb={
        -- 红石输出冷却时间
        redstoneCooldown = newTextField(properties, "redstoneCooldown", 17, 3), 
        -- 红石禁区角度
        minRedstoneYawAngle = newTextField(properties, "minRedstoneYawAngle", 17, 5), 
        maxRedstoneYawAngle = newTextField(properties, "maxRedstoneYawAngle", 17, 6), 
        
        -- 仅保留 Cannon Offset 的 x 和 z 用于校准偏航电机位置
        cannonOffset_x=newTextField(properties.cannonOffset,"x",25,7), 
        cannonOffset_z=newTextField(properties.cannonOffset,"z",31,7), 
        
        -- Yaw 调节选项
        minYawAngle=newTextField(properties,"minYawAngle",17,9), 
        maxYawAngle=newTextField(properties,"maxYawAngle",17,10), 
        yawDirectionOffset=newTextField(properties, "yawDirectionOffset", 17, 11), 
        yawResetAngle=newTextField(properties,"yawResetAngle",17,12), 
        yaw_torque = newTextField(properties, "yaw_torque", 17, 14), 
        
        cannonName=newTextField(properties,"cannonName",14,16), 
        controlCenterId=newTextField(properties,"controlCenterId",12,17), 
        password=newTextField(properties,"password",37,17) 
    }
    local selectBoxTb={
        redstoneOutputSide = newSelectBox(properties, "redstoneOutputSide", 2, 17, 2, "top", "bottom", "left", "right", "front"), 
        -- Yaw 调节选项
        invertYawMotor=newSelectBox(properties,"invertYawMotor",1,17,13,false,true) 
    }
    
    -- 调整文本框长度
    fieldTb.redstoneCooldown.len = 5; 
    fieldTb.minRedstoneYawAngle.len = 5; 
    fieldTb.maxRedstoneYawAngle.len = 5; 
    fieldTb.cannonOffset_x.len=3;fieldTb.cannonOffset_z.len=3;
    fieldTb.minYawAngle.len=5;fieldTb.maxYawAngle.len=5;
    fieldTb.yawResetAngle.len=5;fieldTb.yawDirectionOffset.len = 5;
    fieldTb.yaw_torque.len=5;
    fieldTb.controlCenterId.len=5;fieldTb.password.len=14;

    local alarm_flag=false;term.clear();term.setCursorPos(15,8);term.write("Press any key to continue")
    while true do
        local eventData={os.pullEvent()};local event=eventData[1]
        if event=="mouse_up" or event=="key_up" or event=="alarm" or event=="mouse_click" or event=="mouse_drag" or event=="key" or event=="char" then
            if not alarm_flag then alarm_flag=true
            else
                term.clear();
                term.setTextColor(colors.white); -- 设置默认文本颜色为白色
                term.setBackgroundColor(colors.black); -- 设置默认背景颜色为黑色
                
                term.setCursorPos(18,1);print(string.format("Self ID: %d",selfId))
                
                -- UI布局调整后的标签位置
                term.setCursorPos(2,2);term.write("Redstone Output:"); 
                term.setCursorPos(2,3);term.write("Redstone Cooldown:"); 
                term.setCursorPos(2,5);term.write("RS Min Yaw Ang:"); 
                term.setCursorPos(2,6);term.write("RS Max Yaw Ang:"); 
                term.setCursorPos(2,7);term.write("Yaw Position Offset: x=    z="); 
                
                -- Yaw 调节选项
                term.setCursorPos(2,9);term.write("Min Yaw Ang:"); 
                term.setCursorPos(2,10);term.write("Max Yaw Ang:"); 
                term.setCursorPos(2,11);term.write("Yaw Offset:"); 
                term.setCursorPos(2,12);term.write("Yaw Reset:"); 
                term.setCursorPos(2,13);term.write("Invert Yaw: "); 
                term.setCursorPos(2,14);term.write("Yaw Torque:"); 
                -- **移除PID的UI标签，改为显示当前值**
                term.setCursorPos(2,15);term.write(string.format("PID: P=%.1f I=%.1f D=%.1f", properties.pid_p, properties.pid_i, properties.pid_d)); -- 显示当前PID值，但不允许修改

                term.setCursorPos(2,16);term.write("Cannon Name:"); 
                term.setCursorPos(2,17);term.write("Center ID:");term.setCursorPos(28,17);term.write("Password:"); 

                for k,v in pairs(fieldTb) do v:paint() end; 
                for k,v in pairs(selectBoxTb) do v:paint() end
                
                term.setCursorPos(2, 19); -- 状态行位置调整
                term.setTextColor(colors.lime); -- 仅状态信息使用绿色
                term.write("Status: OK. All systems running.")
                term.setTextColor(colors.white); -- 状态信息后重置为白色
                
                term.setCursorPos(termUtil.cpX,termUtil.cpY)
                
                if event=="mouse_click" then 
                    term.setCursorBlink(true);
                    local x,y=eventData[3],eventData[4];
                    for k,v in pairs(fieldTb) do if y==v.y and x>=v.x and x<=v.x+v.len then v:click(x,y) end end;
                    for k,v in pairs(selectBoxTb) do if y==v.y then v:click(x,y) end end
                elseif event=="key" then 
                    local key=eventData[2];
                    for k,v in pairs(fieldTb) do if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then v:inputKey(key) end end
                elseif event=="char" then 
                    local char=eventData[2];
                    for k,v in pairs(fieldTb) do if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then v:inputChar(char) end end
                end;
                system.updatePersistentData()
                refreshConfigValues() -- 配置更改后刷新预计算值
                updateMotorParameters() -- 配置更改后更新电机参数
            end
        end
    end
end

-- 程序入口
local function runCannonControl() parallel.waitForAll(runCt) end 
local function run() parallel.waitForAll(runCannonControl,runTerm,runRedstoneControl) end -- 将 runRedstoneControl 添加到并行任务中
parallel.waitForAll(run,runListener)
