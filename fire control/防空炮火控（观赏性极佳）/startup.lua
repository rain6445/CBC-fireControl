--[[======================================================================
    自动火控 (随机瞄准)
    v1.1.0
======================================================================
    改动日志:
    - [配置]：加入了可爱的miku
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠈⠀⠀⠈⠁⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡔⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠁⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢰⠀⠀⠀⠀⠀⠠⣶⣿⣿⡄⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠚⠛⠛⠁⠀⠀⢷⣶⣿⣿⣇⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢹⣿⣿⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⡠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡆⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠟⠛⠛⠛⠉⠉⠁⠀⠀⠀⢀⣠⡾⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢀⣴⣿⡿⠁⠀⠀⠀⠀⠀⠀⣴⣿⠀⠀⢸⣿⣿⣿⡆⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿
        ⣿⣿⡿⠋⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣐⣮⣵⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠀⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠑⡀⠙⢿⣿⣿⣿
        ⣿⡿⠀⣠⠾⠋⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⣿⣿⣿⣿⡀⡀⠀⠀⠀⠈⠀⠀⠙⢿⣿
        ⡟⠀⠀⠁⠀⠀⠀⢠⣶⣿⣿⣿⣿⣿⣿⣯⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⠀⠀⠀⢙⣛⡻⣿⣷⢸⡄⠀⠀⠀⠀⠀⠀⠀⠙
        ⠁⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠈⣿⣿⢸⣿⣷⡳⠀⠀⠀⠀⠀⠀⠀⠀
        ⡀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⠀⠀⠀⠀⠰⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠹⢋⣾⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀
        ⡗⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⡀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⢠⣈⡁⠀⠀⠀⠀⢙⣻⣿⣿⣿⣿⣿⡄⢧⡀⠀⠀⠀
        ⡇⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣶⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣧⡀⠀⠀⢀⡐⣬⣿⣿⣿⣿⣿⣿⡘⣿⡄⠀⠀
        ⡇⢠⠀⠀⠀⠀⣄⣀⣉⣭⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣾⣿⣧⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⢿⠀⠀
        ⣿⡌⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠃⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀
        ⣿⣿⣄⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠐⠀⠀⢰⠀⠀⠨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
        ⣿⣿⣿⣿⣦⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⡿⣫⣿⣿⣿⣿⣿⣧⠀⠀⠀⡀⠀⠀⠈⠛⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀
        ⣿⣿⣿⣿⣿⣧⡀⠈⢶⣤⣤⣀⣀⣤⣀⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣆⣀⡀⢀⠀⠀⢤⣄⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
        ⣿⣿⣿⣿⣿⣿⣿⣶⣤⣉⠻⠿⠿⠿⢛⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠉⠆⠀⠀⢻⣿⣿⣿⣿⠏⣴⣿⣿⣿⣿⣿⣿⠁
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⢄⣠⣿⣿⣿⣿⣿⡀⠻⣿⣿⣿⣿⠿⠋⠀
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠘⣿⣿⣿⣿⣟⣿⣷⣤⣬⣉⣉⠁⠀⠀⠀
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⢹⣿⣿⣿⣿⣦⣍⣉⠉⠉⠀⢀⣀⣤⣾
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠻⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
======================================================================]]
math.randomseed(os.time())

-- 全局常量 (仅保留必要的)
local PI, TWO_PI = math.pi, 2 * math.pi 

-- Chinese Comment: 数据持久化
local properties, system = {}, { fileName = "motor_cycler_dat", file = nil } -- Chinese Comment: 更改文件名以避免冲突

-- Chinese Comment: 全局标志，指示红石信号是否激活，从而控制电机是否运行和脉冲是否发出
local is_redstone_active = false 

-- Chinese Comment: 重置系统属性为默认值
function system.reset() 
    return { 
        minAngleRad = 0.44, 
        maxAngleRad = 2.7, 
        -- Chinese Comment: 这里的延迟范围现在只作为默认值，实际运行时的延迟由红石信号控制
        minDelaySec = 8,    
        maxDelaySec = 16,   
        pid_p = 40.0, 
        pid_i = 0.0, 
        pid_d = 40.0, 
        torque = 1.0,
        calibrationOffsets = {} -- Chinese Comment: 新增：用于存储每个电机的校准角度（度，以字符串形式）
    } 
end

-- Chinese Comment: 将对象写入文件进行持久化
function system.write(file, obj) 
    local f = io.open(file, "w"); 
    if f then f:write(textutils.serialise(obj)); f:close() end 
end

-- Chinese Comment: 更新持久化数据
function system.updatePersistentData() 
    system.write(system.fileName, properties) 
end

-- Chinese Comment: 初始化系统：加载或设置默认属性
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
        system.updatePersistentData() -- Chinese Comment: 首次创建文件时保存默认值
    end 
end
system.init() -- Chinese Comment: 首次运行或加载时初始化属性

-- UI界面相关工具函数和类定义 (严格参考火控程序)
local termUtil={cpX=1,cpY=1};
local absTextField={x=1,y=1,len=15,text="",textCorlor="0",backgroundColor="8"};

-- 辅助函数：生成重复字符串 (火控程序中也有)
local function genStr(s,count) local result=""; for i=1,count do result=result..s end; return result end

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
    term.setCursorPos(self.x,self.y); -- Chinese Comment: 文本框的起始坐标由 newTextField 传入
    term.blit(str,genStr(self.textCorlor,#str),genStr(self.backgroundColor,#str)) 
end;

-- 处理文本框字符输入 (严格参考火控程序)
function absTextField:inputChar(char) 
    local xPos,yPos=term.getCursorPos();xPos=xPos-self.x+1;local field=tostring(self.key[self.value]);
    if #field < self.len then
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
end;

-- 处理文本框按键输入 (例如退格、左右箭头) (严格参考火控程序)
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

-- 处理文本框点击事件 (设置光标位置) (严格参考火控程序)
function absTextField:click(x,y) local xPos=self.x;if x>=xPos then if x<=xPos+#tostring(self.key[self.value]) then termUtil.cpX,termUtil.cpY=x,y else termUtil.cpX,termUtil.cpY=xPos+#tostring(self.key[self.value]),y end end end;

-- 创建新的文本框实例 (严格参考火控程序，不接受 customType)
local function newTextField(key,value,x,y) 
    return setmetatable({key=key,value=value,type=type(key[value]),x=x,y=y},{__index=absTextField}) 
end;

local selfId=os.getComputerID() -- Chinese Comment: 确保 selfId 正确获取电脑ID，它是数字

-- Chinese Comment: 存储所有找到并包装好的电机外设的列表。
local connectedMotors = {}

-- Chinese Comment: 刷新配置值，处理数字转换和默认值回退
local function refreshConfigValues()
    local defaults = system.reset() -- 获取默认值以备回退

    properties.minAngleRad = tonumber(properties.minAngleRad) or defaults.minAngleRad
    properties.maxAngleRad = tonumber(properties.maxAngleRad) or defaults.maxAngleRad
    properties.pid_p = tonumber(properties.pid_p) or defaults.pid_p
    properties.pid_i = tonumber(properties.pid_i) or defaults.pid_i
    properties.pid_d = tonumber(properties.pid_d) or defaults.pid_d
    properties.torque = tonumber(properties.torque) or defaults.torque

    -- 确保 min <= max
    if properties.minAngleRad > properties.maxAngleRad then
        properties.minAngleRad, properties.maxAngleRad = properties.maxAngleRad, properties.minAngleRad
    end
    
    -- Chinese Comment: 确保 calibrationOffsets 中的值是字符串，如果不是则转换为 "0.0"
    for motorName, offsetDeg in pairs(properties.calibrationOffsets) do
        if type(offsetDeg) ~= "string" then
            properties.calibrationOffsets[motorName] = tostring(offsetDeg)
        end
    end
end
refreshConfigValues() -- Chinese Comment: 首次加载时刷新一次

-- Chinese Comment: 更新电机PID和扭矩参数的函数 (在静默模式下，只在启动时调用一次)
local function updateMotorParameters()
    for _, motor in ipairs(connectedMotors) do
        pcall(function() motor.setPID(properties.pid_p, properties.pid_i, properties.pid_d) end)
        pcall(function() motor.setOutputTorque(properties.torque) end)
    end
end

-- Chinese Comment: 扫描所有外设，找到并包装 "servo" 类型电机。
local function initializeMotors()
    local peripheralNames = peripheral.getNames()
    if peripheralNames then
        for _, peripheralName in ipairs(peripheralNames) do
            local peripheralType = peripheral.getType(peripheralName)
            if peripheralType == "servo" then
                local p = peripheral.wrap(peripheralName)
                if p then
                    p.name = peripheralName -- Chinese Comment: 将电机名称存储在电机对象上，方便后续查找
                    table.insert(connectedMotors, p)
                    -- Chinese Comment: 初始化该电机的校准偏移量，如果不存在则设为 "0.0" (字符串)
                    if properties.calibrationOffsets[peripheralName] == nil then
                        properties.calibrationOffsets[peripheralName] = "0.0"
                    end
                end
            end
        end
    end

    if #connectedMotors == 0 then
        -- Chinese Comment: 如果没有找到电机，则显示提示并退出
        term.clear()
        term.setCursorPos(1,1)
        term.setTextColor(colors.red)
        term.write("Error: No servo motors found. Exiting.")
        sleep(3)
        return false
    end

    -- Chinese Comment: 遍历所有连接的电机，进行初始化。
    for _, motor in ipairs(connectedMotors) do
        -- Chinese Comment: 1. 初始化电机参数 (PID, Torque, Mode)。
        pcall(function() motor.setPID(properties.pid_p, properties.pid_i, properties.pid_d) end)
        pcall(function() motor.setOutputTorque(properties.torque) end)
        pcall(function() motor.setIsAdjustingAngle(true) end)

        -- Chinese Comment: 2. 检查电机是否锁定，并尝试解锁。
        local success_is_locked, isLocked_val = pcall(function() return motor.isLocked() end)
        if (success_is_locked and isLocked_val) then 
            pcall(function() motor.unlock() end)
        end
    end
    return true
end

-- Chinese Comment: 为每个电机定义一个独立的随机循环函数。
local function doMotorRandomCycle(motor)
    -- Chinese Comment: 主循环，使该电机每随机时间切换一次目标角度。
    while true do
        -- Chinese Comment: 检查全局红石激活标志
        if not is_redstone_active then
            sleep(0.1) -- Chinese Comment: 如果红石未激活，则短暂暂停并继续检查
            goto continue_motor_loop -- Chinese Comment: 跳过当前循环的电机动作
        end

        -- Chinese Comment: 从全局 properties 读取当前配置的范围。
        local minRad = properties.minAngleRad
        local maxRad = properties.maxAngleRad 
        -- Chinese Comment: 延迟范围现在由红石状态直接决定
        local minDelay = 2 -- Chinese Comment: 红石激活时的延迟下限
        local maxDelay = 4 -- Chinese Comment: 红石激活时的延迟上限

        -- Chinese Comment: 生成 minRad 到 maxRad 弧度之间的随机角度。
        local randomAngleRad = math.random() * (maxRad - minRad) + minRad
        
        -- Chinese Comment: 获取并应用该电机的校准偏移量 (从度转换为弧度)。
        -- Chinese Comment: tonumber 转换失败时默认为 0
        local calibrationDeg = tonumber(properties.calibrationOffsets[motor.name]) or 0
        local calibrationRad = math.rad(calibrationDeg)
        
        -- Chinese Comment: 设置电机目标值，加上校准偏移量。
        pcall(function() motor.setTargetValue(randomAngleRad + calibrationRad) end)
        
        -- Chinese Comment: 增加一个短暂的延迟，以防Java端更新需要微秒级时间。
        sleep(0.05) 
        
        -- Chinese Comment: 生成随机延迟时间。
        local randomDelay = math.random() * (maxDelay - minDelay) + minDelay 
        sleep(randomDelay) -- Chinese Comment: 暂停随机秒数。

        ::continue_motor_loop:: -- Chinese Comment: goto 标签
    end
end

-- Chinese Comment: 运行所有电机控制线程
local function runMotorControl()
    local tasks = {}
    for _, motor in ipairs(connectedMotors) do
        table.insert(tasks, function() doMotorRandomCycle(motor) end)
    end

    if #tasks > 0 then
        parallel.waitForAll(unpack(tasks))
    else
        -- Chinese Comment: 如果没有电机，这个线程会立即退出，UI会继续运行。
    end
end

-- Chinese Comment: 红石输入监控功能，更新全局 is_redstone_active 标志
local function runRedstoneMonitor()
    local last_input_active = nil -- Chinese Comment: 追踪上一次的红石输入状态

    while true do
        -- Chinese Comment: 检查电脑正面是否接收到红石信号
        local current_input_active = redstone.getInput("front")
        
        -- Chinese Comment: 只有当红石输入状态改变时才更新全局标志
        if current_input_active ~= last_input_active then
            is_redstone_active = current_input_active
            last_input_active = current_input_active -- Chinese Comment: 更新上一次的状态
        end
        
        sleep(0.05) -- Chinese Comment: 避免CPU占用过高，每0.05秒检查一次
    end
end

-- Chinese Comment: 新增：单个面红石脉冲生成器
local function doSingleSideRedstonePulse(side)
    while true do
        if is_redstone_active then
            -- Chinese Comment: 生成随机延迟 (0.3s 到 2.0s)
            local randomDelay = math.random() * (2.0 - 0.3) + 0.3 -- 已修改
            sleep(randomDelay)
            
            -- Chinese Comment: 发出脉冲
            redstone.setOutput(side, true)
            sleep(0.04) -- Chinese Comment: 脉冲持续时间
            redstone.setOutput(side, false)
        else
            redstone.setOutput(side, false) -- Chinese Comment: 确保红石信号关闭
            sleep(0.1) -- Chinese Comment: 如果红石未激活，短暂暂停并继续检查
        end
    end
end

-- Chinese Comment: 新增：红石脉冲控制功能，为每个指定面启动独立线程
local function runRedstonePulseControl()
    -- Chinese Comment: 定义需要发出脉冲的四个面
    local sides_to_pulse = {"top", "bottom", "left", "right"}
    local pulse_tasks = {}

    -- Chinese Comment: 为每个面创建一个独立的脉冲任务
    for _, side in ipairs(sides_to_pulse) do
        table.insert(pulse_tasks, function() doSingleSideRedstonePulse(side) end)
    end

    -- Chinese Comment: 并行运行所有脉冲任务
    parallel.waitForAll(unpack(pulse_tasks))
    -- Chinese Comment: 这个函数会在这里阻塞，直到所有子任务结束 (它们是无限循环，所以不会结束)
end


-- Chinese Comment: 运行终端UI界面 (严格参考火控程序)
local function runUI()
    local fieldTb = {}
    local startY = 3 -- Chinese Comment: 第一个电机从 Y=3 开始显示
    
    -- Chinese Comment: 修正：健壮地获取终端尺寸，避免nil值报错
    local termWidth, termHeight = term.getSize()
    if not termWidth or not termHeight or termHeight < startY then
        termWidth = termWidth or 51 -- ComputerCraft 默认宽度
        termHeight = termHeight or 19 -- ComputerCraft 默认高度
        if termHeight < startY then termHeight = startY end -- 确保高度至少能显示第一行
    end

    local motorsPerColumn = termHeight - startY + 1 -- Chinese Comment: 每列可容纳的电机数量

    -- Chinese Comment: 预先计算每个电机的位置并创建输入框对象
    local currentY_calc = startY
    local currentX_label_calc = 3  -- Chinese Comment: 第一列标签起始X
    local currentX_input_calc = 13 -- Chinese Comment: 第一列输入框起始X
    local motorCountInCurrentColumn = 0

    for i, motor in ipairs(connectedMotors) do
        -- Chinese Comment: 检查是否需要换列
        if motorCountInCurrentColumn >= motorsPerColumn then
            currentY_calc = startY -- Chinese Comment: 重置Y坐标
            currentX_label_calc = 15 -- Chinese Comment: 第二列标签起始X
            currentX_input_calc = 25 -- Chinese Comment: 第二列输入框起始X (15 + 8(标签最大长度) + 1(:) + 1(空格) = 25)
            motorCountInCurrentColumn = 0
        end

        local motorName = motor.name
        -- Chinese Comment: 动态调整标签最大长度以适应当前列的布局
        local maxLabelLength = currentX_input_calc - currentX_label_calc - 2 
        local displayMotorName = motorName
        if #displayMotorName > maxLabelLength then 
            displayMotorName = string.sub(displayMotorName, 1, maxLabelLength) .. "..."
        end
        -- Chinese Comment: 在这里直接绘制标签，因为后面的fieldTb只处理输入框
        term.setCursorPos(currentX_label_calc, currentY_calc); term.write(displayMotorName .. ":")
        
        -- Chinese Comment: 创建文本框，存储其计算出的位置
        fieldTb[motorName] = newTextField(properties.calibrationOffsets, motorName, currentX_input_calc, currentY_calc)
        fieldTb[motorName].len = 8 -- Chinese Comment: 校准角度输入框长度 (例如：-180.00)
        
        currentY_calc = currentY_calc + 1
        motorCountInCurrentColumn = motorCountInCurrentColumn + 1
    end
    
    -- Chinese Comment: 默认将光标定位到第一个字段 (如果存在电机)
    if #connectedMotors > 0 then
        local firstMotorName = connectedMotors[1].name
        termUtil.cpX = fieldTb[firstMotorName].x
        termUtil.cpY = fieldTb[firstMotorName].y
    else
        -- Chinese Comment: 如果没有电机，将光标定位到一个默认位置，例如 (1,1)
        termUtil.cpX = 1
        termUtil.cpY = 1
    end

    -- Chinese Comment: 直接进入主UI循环
    while true do
        local eventData={os.pullEvent()};local event=eventData[1]
        if event=="mouse_up" or event=="key_up" or event=="alarm" or event=="mouse_click" or event=="mouse_drag" or event=="key" or event=="char" then
            term.clear();
            term.setTextColor(colors.white); 
            term.setBackgroundColor(colors.black); 
            
            -- Chinese Comment: Self ID 显示坐标 (18, 1)
            term.setCursorPos(18,1);print(string.format("Self ID: %d",selfId)) 
            
            -- Chinese Comment: 重新绘制所有电机标签和输入框
            local redrawY = startY
            local redrawX_label = 3
            local redrawX_input = 13
            local redrawMotorCount = 0

            for _, motor in ipairs(connectedMotors) do
                -- Chinese Comment: 检查是否需要换列
                if redrawMotorCount >= motorsPerColumn then
                    redrawY = startY
                    redrawX_label = 15
                    redrawX_input = 25
                    redrawMotorCount = 0
                end

                local motorName = motor.name
                -- Chinese Comment: 动态调整标签最大长度以适应当前列的布局
                local maxLabelLength = redrawX_input - redrawX_label - 2 
                local displayMotorName = motorName
                if #displayMotorName > maxLabelLength then 
                    displayMotorName = string.sub(displayMotorName, 1, maxLabelLength) .. "..."
                end
                -- Chinese Comment: 电机名称标签坐标
                term.setCursorPos(redrawX_label, redrawY); term.write(displayMotorName .. ":")
                
                -- Chinese Comment: 绘制对应的输入框
                if fieldTb[motorName] then
                    -- Chinese Comment: 更新文本框的x,y属性，以防其位置因换列而改变
                    fieldTb[motorName].x = redrawX_input
                    fieldTb[motorName].y = redrawY
                    fieldTb[motorName]:paint()
                end
                redrawY = redrawY + 1
                redrawMotorCount = redrawMotorCount + 1
            end

            -- Chinese Comment: 严格遵守规则，删除状态信息行。
            
            term.setCursorPos(termUtil.cpX,termUtil.cpY)
            
            if event=="mouse_click" then 
                term.setCursorBlink(true);
                local x,y=eventData[3],eventData[4];
                for k,v in pairs(fieldTb) do 
                    -- Chinese Comment: 点击事件需要使用更新后的文本框坐标
                    if y==v.y and x>=v.x and x<=v.x+v.len then v:click(x,y) end 
                end;
            elseif event=="key" then 
                local key=eventData[2];
                for k,v in pairs(fieldTb) do 
                    -- Chinese Comment: 键盘事件需要使用更新后的文本框坐标
                    if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then v:inputKey(key) end 
                end
            elseif event=="char" then 
                local char=eventData[2];
                for k,v in pairs(fieldTb) do 
                    -- Chinese Comment: 字符输入事件需要使用更新后的文本框坐标
                    if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then v:inputChar(char) end 
                end
            end;
            system.updatePersistentData() -- 每次UI事件后保存数据
        end
    end
end

-- Chinese Comment: 程序入口
local function main()
    if not initializeMotors() then 
        return -- initializeMotors() 会显示错误并退出
    end
    updateMotorParameters() -- 初始化电机参数

    -- Chinese Comment: 参照火控代码的并行模式，让 runMotorControl, runUI, runRedstoneMonitor 和 runRedstonePulseControl 同时运行。
    parallel.waitForAll(runMotorControl, runUI, runRedstoneMonitor, runRedstonePulseControl)
end

main()
