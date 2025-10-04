--[[======================================================================
    自动火控
    v1.2.1 
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
        fire_side = "top", 
        fireCooldown = 0.2, 
        cannonOffset = { x = 0, y = 3, z = 0 }, 
        minPitchAngle = -45, 
        maxPitchAngle = 60, 
        minYawAngle = -90, 
        maxYawAngle = 90, -- 默认偏航禁区范围，以便增量绕行生效
        yawResetAngle = 0, 
        pitchResetAngle = 0,
        face = "west", 
        password = "123456", 
        inversion = false, 
        lock_yaw_range = 0, 
        lock_yaw_face = "east", 
        velocity = 160, 
        barrelLength = 8, 
        forecast = 4, -- Forecast 默认值改为 4 (实际计算时会乘以4，即 16)
        shellType = "standard", -- 新增炮弹类型设置，默认 "standard"
        yaw_torque = 50.0, 
        pitch_torque = 50.0, -- 平衡的扭矩默认值
        pid_p = 40.0, 
        pid_i = 0.0, 
        pid_d = 40.0, -- 设置PID为40, 0, 40
        invertYawMotor = false, 
        invertPitchMotor = false, 
        yawDirectionOffset = 0, -- 偏航校准偏移量，不影响复位角度
        pitchDirectionOffset = 0 -- 俯仰校准偏移量，不影响复位角度
    } 
end

-- 将对象写入文件进行持久化
function system.write(file, obj) 
    local f = io.open(file, "w"); 
    if f then f:write(textutils.serialise(obj)); f:close() end 
end

-- 更新持久化数据
function system.updatePersistentData() 
    system.write(system.fileName, properties) 
end

-- 初始化系统：加载或设置默认属性
function system.init() 
    local f = io.open(system.fileName, "r"); 
    if f then 
        local d = textutils.unserialise(f:read("a")); 
        f:close(); 
        properties = system.reset(); -- 首先加载默认值
        for k, v in pairs(properties) do -- 然后，用保存的值覆盖（如果存在）
            if d and d[k] ~= nil then properties[k] = d[k] end 
        end 
    else 
        properties = system.reset(); -- 如果没有文件，使用默认值
        system.updatePersistentData() 
    end 
end
system.init()

-- 外设初始化
local yawMotor, pitchMotor

-- 更新电机PID和扭矩参数的函数 (在UI更改后调用)
local function updateMotorParameters()
    -- 使用 tonumber(value) or 0 确保参数是数字，即使UI输入无效
    local p_val = tonumber(properties.pid_p) or 0
    local i_val = tonumber(properties.pid_i) or 0
    local d_val = tonumber(properties.pid_d) or 0
    local yaw_t_val = tonumber(properties.yaw_torque) or 0
    local pitch_t_val = tonumber(properties.pitch_torque) or 0

    if yawMotor then
        yawMotor.setPID(p_val, i_val, d_val)
        yawMotor.setOutputTorque(yaw_t_val)
        yawMotor.setIsAdjustingAngle(true) -- 确保模式是角度调整
    end
    if pitchMotor then
        pitchMotor.setPID(p_val, i_val, d_val)
        pitchMotor.setOutputTorque(pitch_t_val)
        pitchMotor.setIsAdjustingAngle(true) -- 确保模式是角度调整
    end
end

-- 选择俯仰电机的函数
local function selectPitchMotor(exclude) 
    term.clear(); term.setCursorPos(1, 1); print("--- Pitch Motor Selection ---"); 
    local motors = {}; 
    local names = peripheral.getNames(); 
    if names then 
        for _, n in ipairs(names) do 
            if peripheral.getType(n) == "servo" and n ~= exclude then table.insert(motors, n) end 
        end 
    end; 
    if #motors == 0 then print("Error: No other servo motors found!"); return nil end; 
    if #motors == 1 then print("Auto-selecting motor: '" .. motors[1] .. "'"); sleep(2); return peripheral.wrap(motors[1]) end; 
    print("Select motor for pitch:"); 
    for i, n in ipairs(motors) do print(i .. ": " .. n) end; 
    local choice; 
    while true do 
        write("Enter number: "); 
        local i = read(); 
        choice = tonumber(i); 
        if choice and choice >= 1 and choice <= #motors then break else print("Invalid.") end 
    end; 
    print("Selected '" .. motors[choice] .. "'"); sleep(1); return peripheral.wrap(motors[choice]) 
end

-- 初始化电机
local function initializeMotors() 
    term.clear(); term.setCursorPos(1, 1); print("--- Initializing motors... ---"); 
    yawMotor = peripheral.wrap("back"); 
    if not yawMotor then print("Fatal Error: Yaw motor 'back' not found!"); return false end; 
    -- 使用 properties 中的 PID 和 Torque 值，并确保是数字
    yawMotor.setPID(tonumber(properties.pid_p) or 0, tonumber(properties.pid_i) or 0, tonumber(properties.pid_d) or 0); 
    yawMotor.setIsAdjustingAngle(true); 
    yawMotor.setOutputTorque(tonumber(properties.yaw_torque) or 0); 
    print("Yaw motor OK."); 
    
    pitchMotor = selectPitchMotor("back"); 
    if not pitchMotor then print("Fatal Error: No pitch motor!"); return false end; 
    -- 使用 properties 中的 PID 和 Torque 值，并确保是数字
    pitchMotor.setPID(tonumber(properties.pid_p) or 0, tonumber(properties.pid_i) or 0, tonumber(properties.pid_d) or 0); 
    pitchMotor.setIsAdjustingAngle(true); 
    pitchMotor.setOutputTorque(tonumber(properties.pitch_torque) or 0); 
    print("Pitch motor OK."); 
    print("\n--- All motors ready ---"); sleep(2); return true 
end
if not initializeMotors() then return end

-- 数学与工具函数
local function wrapToPi(a) return (a + PI) % TWO_PI - PI end
local function quatMultiply(q1, q2) return {w=-q1.x*q2.x-q1.y*q2.y-q1.z*q2.z+q1.w*q2.w,x=q1.x*q2.w+q1.y*q2.z-q1.z*q2.y+q1.w*q2.x,y=-q1.x*q2.z+q1.y*q2.w+q1.z*q2.x+q1.w*q2.y,z=q1.x*q2.y-q1.y*q2.x+q1.z*q2.w+q1.w*q2.z} end
local function RotateVectorByQuat(q,v) local x,y,z=q.x*2,q.y*2,q.z*2;local xx,yy,zz=q.x*x,q.y*y,q.z*z;local xy,xz,yz=q.x*y,q.x*z,q.y*z;local wx,wy,wz=q.w*x,q.w*y,q.w*z;return{x=(1-(yy+zz))*v.x+(xy-wz)*v.y+(xz+wy)*v.z,y=(xy+wz)*v.x+(1-(xx+zz))*v.y+(yz-wx)*v.z,z=(xz-wy)*v.x+(yz+wx)*v.y+(1-(xx+yy))*v.z} end
local function negaQ(q) return {w=q.w,x=-q.x,y=-q.y,z=-q.z} end
local function getCannonPos() local w=ship.getWorldspacePosition();local y=ship.getShipyardPosition();local s=coordinate.getAbsoluteCoordinates();local o={x=y.x-s.x-0.5-properties.cannonOffset.x,y=y.y-s.y-0.5-properties.cannonOffset.y,z=y.z-s.z-0.5-properties.cannonOffset.z};o=RotateVectorByQuat(ship.getQuaternion(),o);return{x=w.x-o.x,y=w.y-o.y,z=w.z-o.z} end

-- 优化：将这些计算值提取为局部变量，在配置更新时刷新
local _barrelLength, _velocity_per_tick, _drag_factor, _gravity, _forecast
local _minPitchAngle_rad, _maxPitchAngle_rad, _minYawAngle_rad, _maxYawAngle_rad
local _yawResetAngle_rad, _pitchResetAngle_rad
local _yawDirectionOffset_rad, _pitchDirectionOffset_rad
local _lock_yaw_range_rad
local _fireCooldown

-- 刷新配置值，处理数字转换和默认值回退
local function refreshConfigValues()
    local defaults = system.reset() -- 获取默认值以备回退

    _barrelLength = tonumber(properties.barrelLength) or defaults.barrelLength
    _velocity_per_tick = (tonumber(properties.velocity) or defaults.velocity) / 20 -- 预先除以20
    _forecast = (tonumber(properties.forecast) or defaults.forecast) * 4 -- Forecast 输入值乘以 4

    -- 根据炮弹类型设置重力和阻力
    if properties.shellType == "standard" then
        _gravity = 0.05
        _drag_factor = 1 - 0.01 -- drag = 0.01
    elseif properties.shellType == "heavier" then
        _gravity = 0.15
        _drag_factor = 1 - 0.012 -- drag = 0.012
    else -- 默认值以防万一
        _gravity = 0.05
        _drag_factor = 1 - 0.01
    end

    _minPitchAngle_rad = math.rad(tonumber(properties.minPitchAngle) or defaults.minPitchAngle)
    _maxPitchAngle_rad = math.rad(tonumber(properties.maxPitchAngle) or defaults.maxPitchAngle)
    _minYawAngle_rad = math.rad(tonumber(properties.minYawAngle) or defaults.minYawAngle)
    _maxYawAngle_rad = math.rad(tonumber(properties.maxYawAngle) or defaults.maxYawAngle)
    _yawResetAngle_rad = math.rad(tonumber(properties.yawResetAngle) or defaults.yawResetAngle)
    _pitchResetAngle_rad = math.rad(tonumber(properties.pitchResetAngle) or defaults.pitchResetAngle)
    
    -- 校准偏移量，不影响复位角度
    _yawDirectionOffset_rad = math.rad(tonumber(properties.yawDirectionOffset) or defaults.yawDirectionOffset)
    _pitchDirectionOffset_rad = math.rad(tonumber(properties.pitchDirectionOffset) or defaults.pitchDirectionOffset)
    
    _lock_yaw_range_rad = math.rad(tonumber(properties.lock_yaw_range) or defaults.lock_yaw_range)
    _fireCooldown = tonumber(properties.fireCooldown) or defaults.fireCooldown
    
    -- Cannon Offset 也要进行安全转换
    properties.cannonOffset.x = tonumber(properties.cannonOffset.x) or defaults.cannonOffset.x
    properties.cannonOffset.y = tonumber(properties.cannonOffset.y) or defaults.cannonOffset.y
    properties.cannonOffset.z = tonumber(properties.cannonOffset.z) or defaults.cannonOffset.z
end
refreshConfigValues() -- 首次加载时刷新一次

local function getTime(d,p) 
    local bl=_barrelLength;local cP=math.abs(math.cos(p));d=d-bl*cP;local v0=_velocity_per_tick;local dr=_drag_factor;
    if dr<0.001 or dr>0.999 then return d/(cP*v0) else local la=1-d/(100*(cP*v0));if la<=0 then return math.huge else return math.abs(math.log(la)/(math.log(dr)/math.log(math.exp(1)))) end end 
end
local function getY2(t,y0,p) 
    if t>10000 then return 0 end;local g=_gravity;local sP=math.sin(p);local bl=_barrelLength;
    y0=bl*sP+y0;local v0=_velocity_per_tick;local Vy=v0*sP;local dr=_drag_factor;
    if dr<0.001 then dr=1 end;local i=1;local last=0;while i<t+1 do y0=y0+Vy;Vy=dr*Vy-g;if i==math.floor(t) then last=y0 end;i=i+1 end;local floor_t=math.floor(t);if floor_t<1 then return y0 end;return(y0-last)*(t%floor_t)+last 
end
local function ag_binary_search(arr,xD,y0,yD) 
    local l,h=1,#arr;local m,t,p,r=0,0,0,0;
    while l<=h do m=math.floor((l+h)/2);p=arr[m];t=getTime(xD,p);if t==math.huge then h=m-1 else r=yD-getY2(t,y0,p);if r>=-0.018 and r<=0.018 then return p,t end;if r>0 then l=m+1 else h=m-1 end end end;
    return nil,nil 
end

-- 辅助函数：检查一个角度是否在允许范围内 (不在禁区内)
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

-- 检查路径是否穿过禁区 (使用isAngleAllowed辅助函数)
local function doesPathCrossForbiddenZone(c,t,min,max) 
    local d=wrapToPi(t-c);
    -- 检查路径中间点是否在禁区内
    return not isAngleAllowed(c+d*0.25, min, max) or 
           not isAngleAllowed(c+d*0.5, min, max) or 
           not isAngleAllowed(c+d*0.75, min, max)
end

local function genStr(s,count) local result=""; for i=1,count do result=result..s end; return result end

-- 网络通信 
local controlCenter={tgPos={x=0,y=0,z=0},velocity={x=0,y=0,z=0},mode=2,fire=false}
local ct=20 -- 控制中心数据刷新计时器

-- 辅助函数：获取有效的控制中心ID（正整数）
local function getValidControlCenterId()
    local id_str = properties.controlCenterId
    local id_num = tonumber(id_str)
    if id_num and id_num >= 0 and math.floor(id_num) == id_num then -- 确保是正整数
        return id_num
    end
    return nil -- 返回nil表示ID无效
end

local cross_point={x=0,y=0,z=0}
-- 监听控制中心消息
local function listener() 
    while true do 
        local targetId = getValidControlCenterId()
        local id,msg=rednet.receive(protocol,2);
        if targetId and id==targetId then -- 只有当自身ID有效且消息ID匹配时才处理
            controlCenter=msg;ct=20 
        end 
    end 
end

-- 向控制中心发送请求
local function sendRequest() 
    local slug=ship and ship.getName()or nil;
    while true do 
        local targetId = getValidControlCenterId()
        if targetId then -- 只有当ID有效时才发送请求
            rednet.send(targetId,{name=properties.cannonName,pw=properties.password,slug=slug,bullets_count=0,cross_point=cross_point},request_protocol);
        end
        sleep(0.05)
    end 
end

-- 运行监听器和请求发送器
local function runListener() parallel.waitForAll(sendRequest,listener) end

-- 火炮主控制逻辑 
local cannonUtil={pos={x=0,y=0,z=0},velocity={x=0,y=0,z=0}}
function cannonUtil:getAtt() local v=ship.getVelocity();self.pos=getCannonPos();self.velocity={x=v.x/20,y=v.y/20,z=v.z/20} end
function cannonUtil:getNextPos(t) return{x=self.pos.x+self.velocity.x*t,y=self.pos.y+self.velocity.y*t,z=self.pos.z+self.velocity.z*t}end
local pitchList={};for i=-90,90,0.0375 do table.insert(pitchList,math.rad(i))end
local quatList={west={w=-1,x=0,y=0,z=0},south={w=-0.7071067811865476,x=0,y=-0.7071067811865476,z=0},east={w=0,x=0,y=-1,z=0},north={w=-0.7071067811865476,x=0,y=0.7071067811865476,z=0}}
local fire = false

-- 运行火炮控制主循环
local function runCt()
    local AIM_TOLERANCE_COSINE = 0.998 
    -- [[ 性能 ]] 在循环外预创建表格以复用
    local tgVec, tmpVec = {}, {}
    while true do
        local finalCommandYaw_rad, finalCommandPitch_rad
        if ct > 0 then
            ct = ct - 1
            cannonUtil:getAtt()
            local currentYaw_rad = yawMotor.getCurrentValue(); 
            local currentPitch_rad = pitchMotor.getCurrentValue()
            
            local cannonPos=cannonUtil:getNextPos(_forecast);
            local target=controlCenter.tgPos;target.y=target.y+0.5;
            
            -- 第一次预测目标位置
            tgVec.x, tgVec.y, tgVec.z = target.x-cannonPos.x, target.y-cannonPos.y, target.z-cannonPos.z
            local tmpT=(500-math.sqrt(tgVec.x^2+tgVec.y^2+tgVec.z^2))/500;tmpT=tmpT<0 and 0 or tmpT*8;
            target.x=target.x+controlCenter.velocity.x*tmpT;target.y=target.y+controlCenter.velocity.y*tmpT;target.z=target.z+controlCenter.velocity.z*tmpT;
            
            -- 第二次计算目标向量和俯仰角
            tgVec.x, tgVec.y, tgVec.z = target.x-cannonPos.x, target.y-cannonPos.y, target.z-cannonPos.z
            local xDis=math.sqrt(tgVec.x^2+tgVec.z^2);
            local tmpPitch,cTime=ag_binary_search(pitchList,xDis,0,tgVec.y);
            
            -- 如果有有效弹道时间，进行第三次预测
            if cTime and cTime>5 then 
                if controlCenter.mode>2 and tmpPitch then 
                    target.x=target.x+controlCenter.velocity.x*cTime;target.y=target.y+controlCenter.velocity.y*cTime;target.z=target.z+controlCenter.velocity.z*cTime;
                    tgVec.x, tgVec.y, tgVec.z = target.x-cannonPos.x, target.y-cannonPos.y, target.z-cannonPos.z;
                    xDis=math.sqrt(tgVec.x^2+tgVec.z^2);
                    tmpPitch,cTime=ag_binary_search(pitchList,xDis,0,tgVec.y)
                end;
                if tmpPitch then 
                    local _c=math.sqrt(tgVec.x^2+tgVec.z^2);
                    local allDis=math.sqrt(tgVec.x^2+tgVec.y^2+tgVec.z^2);
                    local cosP=math.cos(tmpPitch);
                    tmpVec={x=allDis*(tgVec.x/_c)*cosP,y=allDis*math.sin(tmpPitch),z=allDis*(tgVec.z/_c)*cosP}
                else 
                    tmpVec=tgVec 
                end 
            else 
                tmpVec=tgVec 
            end

            -- 转换为舰船局部坐标系
            local ship_local_vec=RotateVectorByQuat(negaQ(ship.getQuaternion()),tmpVec)
            local idealTargetYaw_rad=math.atan2(ship_local_vec.z,ship_local_vec.x)
            local mag=math.sqrt(ship_local_vec.x^2+ship_local_vec.y^2+ship_local_vec.z^2)
            local tgPitch_deg=mag>0.001 and math.deg(math.asin(ship_local_vec.y/mag))or 0
            
            -- 偏航锁定范围处理
            local localVec=RotateVectorByQuat(quatMultiply(quatList[properties.lock_yaw_face],negaQ(ship.getQuaternion())),tmpVec);
            local localYaw_rad=-math.atan2(localVec.z,-localVec.x);
            if math.abs(localYaw_rad)<_lock_yaw_range_rad then idealTargetYaw_rad=0 end
            
            -- 应用偏航校准偏移量
            local raw_ideal_yaw_rad=wrapToPi(idealTargetYaw_rad+_yawDirectionOffset_rad)
            local minYaw_rad=_minYawAngle_rad;
            local maxYaw_rad=_maxYawAngle_rad;
            local ultimate_target_yaw_rad;
            
            -- 步骤1：将原始目标偏航角钳制到允许范围内
            local wrapped_raw_ideal_yaw_rad = wrapToPi(raw_ideal_yaw_rad)
            if not isAngleAllowed(wrapped_raw_ideal_yaw_rad, minYaw_rad, maxYaw_rad) then
                -- 目标在禁区内，钳制到最近的边界
                local dist_to_min_boundary = angularDistance(wrapped_raw_ideal_yaw_rad, minYaw_rad)
                local dist_to_max_boundary = angularDistance(wrapped_raw_ideal_yaw_rad, maxYaw_rad)
                if dist_to_min_boundary < dist_to_max_boundary then
                    ultimate_target_yaw_rad = minYaw_rad
                else
                    ultimate_target_yaw_rad = maxYaw_rad
                end
            else
                ultimate_target_yaw_rad = wrapped_raw_ideal_yaw_rad
            end
            
            -- [[ 绕行逻辑 ]] 始终激活，如果路径穿过禁区则使用 'incremental' 方法
            if doesPathCrossForbiddenZone(currentYaw_rad, ultimate_target_yaw_rad, minYaw_rad, maxYaw_rad) then 
                -- 增量绕行方案
                local delta_rad = wrapToPi(ultimate_target_yaw_rad - currentYaw_rad);
                local safe_direction_sign = delta_rad >= 0 and -1 or 1; -- 如果目标在顺时针方向，则逆时针避让，反之亦然
                local proxy_step_rad = math.rad(15.0); -- 固定步长
                finalCommandYaw_rad = wrapToPi(currentYaw_rad + safe_direction_sign * proxy_step_rad)
            else 
                finalCommandYaw_rad = ultimate_target_yaw_rad 
            end
            
            -- 应用俯仰校准偏移量
            local pitch_offset_rad=_pitchDirectionOffset_rad;
            local ideal_pitch_rad=wrapToPi(math.rad(tgPitch_deg)+pitch_offset_rad);
            local minPitch_rad=_minPitchAngle_rad;
            local maxPitch_rad=_maxPitchAngle_rad;
            local clamped_pitch_rad=ideal_pitch_rad
            if clamped_pitch_rad<minPitch_rad then clamped_pitch_rad=minPitch_rad elseif clamped_pitch_rad>maxPitch_rad then clamped_pitch_rad=maxPitch_rad end
            finalCommandPitch_rad=clamped_pitch_rad
            
            fire=controlCenter.fire
            -- local calculated_pitch_rad=math.rad(tgPitch_deg)
            -- if calculated_pitch_rad<minPitch_rad or calculated_pitch_rad>maxPitch_rad then fire=false end -- 移除弹道俯仰禁区检查
            
            -- 开火条件：仅保留偏航对齐检查
            if fire then 
                local current_yaw_vector={x=math.cos(currentYaw_rad),z=math.sin(currentYaw_rad)};
                local final_target_vector_for_check={x=math.cos(finalCommandYaw_rad),z=math.sin(finalCommandYaw_rad)};
                local yaw_dot_product=current_yaw_vector.x*final_target_vector_for_check.x+current_yaw_vector.z*final_target_vector_for_check.z;
                if yaw_dot_product<AIM_TOLERANCE_COSINE then fire=false end 
                
                -- 移除俯仰对齐检查
                -- local current_pitch_vector_y = math.sin(currentPitch_rad)
                -- local current_pitch_vector_xz = math.cos(currentPitch_rad)
                -- local final_target_pitch_vector_y = math.sin(finalCommandPitch_rad)
                -- local final_target_pitch_vector_xz = math.cos(finalCommandPitch_rad)
                -- local pitch_dot_product = current_pitch_vector_y * final_target_pitch_vector_y + current_pitch_vector_xz * final_target_pitch_vector_xz
                -- if pitch_dot_product < AIM_TOLERANCE_COSINE then fire=false end
            end

            if tmpVec then 
                local tgDis=math.sqrt(tmpVec.x^2+tmpVec.y^2+tmpVec.z^2);
                if tgDis and tgDis>0 then 
                    local tgPoint={x=-tgDis,y=0,z=0};
                    local p_angle=currentPitch_rad/2;
                    local pitchQuat={w=math.cos(p_angle),x=0,y=0,z=math.sin(p_angle)};
                    local y_angle=-currentYaw_rad/2;
                    local yawQuat={w=math.cos(y_angle),x=0,y=math.sin(y_angle),z=0};
                    local final_turret_rotation=quatMultiply(yawQuat,pitchQuat);
                    cross_point=RotateVectorByQuat(final_turret_rotation,tgPoint);
                    cross_point=RotateVectorByQuat(ship.getQuaternion(),cross_point);
                    local selfpos=cannonUtil:getNextPos(1);
                    cross_point.x=cross_point.x+selfpos.x;cross_point.y=cross_point.y+selfpos.y;cross_point.z=cross_point.z+selfpos.z 
                else 
                    cross_point=nil 
                end 
            else 
                cross_point=nil 
            end
            sleep(0.05) -- 高频更新
        else
            -- [[ 性能 ]] 闲置时，仅执行重置逻辑并大幅增加休眠时间
            finalCommandYaw_rad = _yawResetAngle_rad
            finalCommandPitch_rad = _pitchResetAngle_rad
            cross_point=nil
            fire=false
            sleep(0.5) -- 低频更新
        end

        if properties.invertYawMotor then finalCommandYaw_rad = -finalCommandYaw_rad end
        if properties.invertPitchMotor then finalCommandPitch_rad = -finalCommandPitch_rad end
        yawMotor.setTargetValue(finalCommandYaw_rad)
        pitchMotor.setTargetValue(finalCommandPitch_rad)
    end
end

-- 检查开火条件并执行开火
local function checkFire()
    local lastFireTime=0
    while true do
        local cooldown=_fireCooldown;local currentTime=os.clock()
        if fire and ct>0 and(currentTime-lastFireTime>=cooldown)then
            redstone.setOutput(properties.fire_side,true);lastFireTime=currentTime;sleep(0.2);redstone.setOutput(properties.fire_side,false)
        end
        sleep(0.05)
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
        fireCooldown=newTextField(properties, "fireCooldown", 17, 3), 
        cannonOffset_x=newTextField(properties.cannonOffset,"x",19,4),
        cannonOffset_y=newTextField(properties.cannonOffset,"y",25,4),
        cannonOffset_z=newTextField(properties.cannonOffset,"z",31,4), 
        barrelLength=newTextField(properties,"barrelLength",17,5), -- 调整x坐标
        forecast=newTextField(properties,"forecast",40,5), -- 调整x坐标
        
        -- Pitch 调节选项 (左侧)
        minPitchAngle=newTextField(properties,"minPitchAngle",17,8), 
        maxPitchAngle=newTextField(properties,"maxPitchAngle",17,9),  
        pitchDirectionOffset=newTextField(properties, "pitchDirectionOffset", 17, 10), 
        pitchResetAngle=newTextField(properties, "pitchResetAngle", 17, 11), 
        pitch_torque = newTextField(properties, "pitch_torque", 15, 13), 

        -- Yaw 调节选项 (右侧)
        minYawAngle=newTextField(properties,"minYawAngle",40,8), 
        maxYawAngle=newTextField(properties,"maxYawAngle",40,9), 
        yawDirectionOffset=newTextField(properties, "yawDirectionOffset", 40, 10), 
        yawResetAngle=newTextField(properties,"yawResetAngle",40,11), 
        yaw_torque = newTextField(properties, "yaw_torque", 38, 13), 
        
        cannonName=newTextField(properties,"cannonName",14,15), 
        controlCenterId=newTextField(properties,"controlCenterId",12,16), 
        password=newTextField(properties,"password",37,16) 
    }
    local selectBoxTb={
        fire_side = newSelectBox(properties, "fire_side", 2, 11, 2, "top", "bottom", "left", "right", "front"), 
        shellType = newSelectBox(properties, "shellType", 2, 14, 6, "standard", "heavier"), 
        
        -- Pitch 调节选项 (左侧)
        invertPitchMotor=newSelectBox(properties,"invertPitchMotor",1,17,12,false,true), 
        
        -- Yaw 调节选项 (右侧)
        invertYawMotor=newSelectBox(properties,"invertYawMotor",1,40,12,false,true) 
    }
    
    -- 调整文本框长度
    fieldTb.barrelLength.len=3;fieldTb.forecast.len=5;fieldTb.cannonOffset_x.len=3;fieldTb.cannonOffset_y.len=3;fieldTb.cannonOffset_z.len=3;
    fieldTb.minPitchAngle.len=5;fieldTb.maxPitchAngle.len=5;fieldTb.minYawAngle.len=5;fieldTb.maxYawAngle.len=5;
    fieldTb.yawResetAngle.len=5;fieldTb.pitchResetAngle.len=5;fieldTb.fireCooldown.len = 5;
    fieldTb.pitchDirectionOffset.len = 5;fieldTb.yawDirectionOffset.len = 5;
    fieldTb.yaw_torque.len=5;fieldTb.pitch_torque.len=5;
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
                term.setCursorPos(2,2);term.write("Fire Side");
                term.setCursorPos(2,3);term.write("Fire Cooldown:");
                term.setCursorPos(2,4);term.write("Cannon Offset: x=    y=    z=");
                term.setCursorPos(2,5);term.write("Cannon Long:");term.setCursorPos(28,5);term.write("Power:"); -- 调整标签和位置
                term.setCursorPos(2,6);term.write("Shell Type:"); 
                
                -- Pitch 调节选项 (左侧)
                term.setCursorPos(2,8);term.write("Min Pitch Ang:"); 
                term.setCursorPos(2,9);term.write("Max Pitch Ang:"); 
                term.setCursorPos(2,10);term.write("Pitch Offset:"); 
                term.setCursorPos(2,11);term.write("Pitch Reset:"); 
                term.setCursorPos(2,12);term.write("Invert Pitch:"); 
                term.setCursorPos(2,13);term.write("Pitch Torque:"); 

                -- Yaw 调节选项 (右侧)
                term.setCursorPos(28,8);term.write("Min Yaw Ang:"); 
                term.setCursorPos(28,9);term.write("Max Yaw Ang:"); 
                term.setCursorPos(28,10);term.write("Yaw Offset:"); 
                term.setCursorPos(28,11);term.write("Yaw Reset:"); 
                term.setCursorPos(28,12);term.write("Invert Yaw: "); 
                term.setCursorPos(28,13);term.write("Yaw Torque:"); 

                term.setCursorPos(2,15);term.write("Cannon Name:"); 
                term.setCursorPos(2,16);term.write("Center ID:");term.setCursorPos(28,16);term.write("Password:"); 

                for k,v in pairs(fieldTb) do v:paint() end; 
                for k,v in pairs(selectBoxTb) do v:paint() end
                
                term.setCursorPos(2, 18); -- 状态行位置调整
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
local function runCannonControl() parallel.waitForAll(runCt,checkFire) end
local function run() parallel.waitForAll(runCannonControl,runTerm) end
parallel.waitForAll(run,runListener)
