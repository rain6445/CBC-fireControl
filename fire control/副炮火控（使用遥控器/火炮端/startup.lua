--[[======================================================================
    副炮火控
    v1.0.1
======================================================================
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠈⠀⠀⠈⠁⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⡔⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠁⠀⠀⠀⠀⠀⠀⠀⠀⢀⣧⠀⠀ ⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⢰⠀⠀⠀⠀⠀⠠⣶⣿⣿⡄⠀ ⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
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
[优化]:加入了角度校准
======================================================================]]

-- 尝试打开调制解调器，这是进行红石网络通信的前提
peripheral.find("modem", rednet.open)

-- 全局常量定义
local REQUEST_PROTOCOL = "CBCcenter"  -- 用于注册请求的协议名称
local DATA_PROTOCOL = "CBCNumber"     -- 用于接收数字数据的协议名称
local RESET_PROTOCOL = "CBCReset"     -- 用于接收重置信号的协议名称
local CENTER_PASSWORD = "123456"      -- 与火控中心匹配的密码
local PI = math.pi                    -- 圆周率π
local TWO_PI = 2 * PI                 -- 2π，用于角度规范化
local _BYPASS_STEP_RAD = math.rad(30) -- 固定绕行步长，转换为弧度 (30度)
local ANGLE_TOLERANCE = math.rad(1.0) -- 角度容差，用于判断是否“在边缘”或“停靠” (1度)
local ANGLE_OFFSET_FOR_SAFE_EDGE = math.rad(0.5) -- 离开禁区边缘的微小偏移量，确保停在禁区外 (0.5度)

-- 数据持久化系统
local properties, system = {}, { fileName = "receiver_dat", file = nil } 

-- 重置系统属性为默认值
function system.reset() 
    return { 
        controlCenterId = "",   -- 火控中心电脑ID，默认空字符串
        receiverName = "MyReceiver", -- 本接收器的名称，用于注册，不在UI显示
        initialAngle = "0.0",   -- 初始角度 (度，UI输入)
        forbiddenMinAngle = "-10.0", -- 禁区最小角度 (度，UI输入)
        forbiddenMaxAngle = "10.0",  -- 禁区最大角度 (度，UI输入)
        calibrationOffset = "0.0", -- 校准角度 (度，UI输入)
    } 
end

-- 将对象写入文件进行持久化
function system.write(file, obj) 
    local f = io.open(file, "w"); 
    if f then f:write(textutils.serialise(obj)); f:close() end 
end

-- 更新持久化数据到文件
function system.updatePersistentData() 
    system.write(system.fileName, properties) 
end

-- 初始化系统：加载或设置默认属性
function system.init() 
    local f = io.open(system.fileName, "r"); 
    local loaded_data = nil
    if f then 
        loaded_data = textutils.unserialise(f:read("a")); 
        f:close(); 
    end 
    
    properties = system.reset(); -- 总是从默认值开始
    local defaults = system.reset() -- 获取默认值用于验证
    
    -- 用加载的数据覆盖默认值，并验证数值型字符串
    if loaded_data then
        for k, v in pairs(properties) do
            if loaded_data[k] ~= nil then
                if k == "controlCenterId" or k == "receiverName" then
                    properties[k] = tostring(loaded_data[k])
                elseif k == "initialAngle" or k == "forbiddenMinAngle" or k == "forbiddenMaxAngle" or k == "calibrationOffset" then
                    -- 验证数值型字符串：如果加载的值不是有效数字字符串，则使用默认字符串
                    if tonumber(loaded_data[k]) ~= nil then
                        properties[k] = tostring(loaded_data[k])
                    else
                        properties[k] = defaults[k] -- 如果加载值无效，使用默认字符串
                    end
                else
                    properties[k] = loaded_data[k] -- 对于其他属性，直接覆盖
                end
            end 
        end 
    end
    
    -- 确保所有相关属性都是字符串类型（用于UI）且是有效的数值字符串
    properties.controlCenterId = tostring(properties.controlCenterId)
    properties.initialAngle = tostring(tonumber(properties.initialAngle) or tonumber(defaults.initialAngle))
    properties.forbiddenMinAngle = tostring(tonumber(properties.forbiddenMinAngle) or tonumber(defaults.forbiddenMinAngle))
    properties.forbiddenMaxAngle = tostring(tonumber(properties.forbiddenMaxAngle) or tonumber(defaults.forbiddenMaxAngle))
    properties.calibrationOffset = tostring(tonumber(properties.calibrationOffset) or tonumber(defaults.calibrationOffset))

    system.updatePersistentData() -- 确保在初始化后写入一个有效的文件
end
system.init() -- 首次运行或加载时初始化属性

-- 辅助函数：生成重复字符串
local function genStr(s, count)
    local result = ""
    for i = 1, count, 1 do
        result = result .. s
    end
    return result
end

-- 辅助函数：获取有效的控制中心ID（正整数）
local function getValidControlCenterId()
    local id_str = properties.controlCenterId
    local id_num = tonumber(id_str)
    if id_num and id_num >= 0 and math.floor(id_num) == id_num then -- 确保是正整数
        return id_num
    end
    return nil -- 返回nil表示ID无效
end

-- UI界面相关工具函数和类定义
local termUtil = {
    cpX = 1,
    cpY = 1,
    fieldTb = nil,
    selectBoxTb = nil
}

local absTextField = {
    x = 1, y = 1, len = 15, text = "", textCorlor = "0", backgroundColor = "8"
}

-- 绘制文本框
function absTextField:paint()
    local str = ""
    for i = 1, self.len, 1 do
        local text = tostring(self.key[self.value])
        local tmp = string.sub(text, i, i)
        if #tmp > 0 then
            str = str .. tmp
        else
            local tmp2 = ""
            for j = 0, self.len - i, 1 do
                tmp2 = tmp2 .. " "
            end
            str = str .. tmp2
            break
        end
    end
    term.setCursorPos(self.x, self.y)
    term.blit(str, genStr(self.textCorlor, #str), genStr(self.backgroundColor, #str))
end

-- 处理文本框字符输入 (支持数字、小数点、负号)
function absTextField:inputChar(char)
    local xPos, yPos = term.getCursorPos()
    xPos = xPos - self.x + 1
    local field = tostring(self.key[self.value])
    if #field < self.len then
        local current_field_str = field
        local new_field_str = current_field_str

        -- 检查字段类型，如果是数字类型，则允许小数点和负号
        if self.value == "controlCenterId" then -- Center ID 的特殊处理 (仅限数字)
            if (char >= '0' and char <= '9') then
                new_field_str = string.sub(current_field_str,1,xPos-1)..char..string.sub(current_field_str,xPos,#current_field_str)
            end
        else -- 通用数字字段 (允许数字、一个小数点、一个前导负号)
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
        end
        
        if new_field_str ~= current_field_str then -- 如果添加了有效字符
            self.key[self.value] = new_field_str -- 作为字符串存储
            termUtil.cpX=termUtil.cpX+1
        end
    end
end;

-- 处理文本框按键输入 (例如退格、左右箭头)
function absTextField:inputKey(key)
    local xPos, yPos = term.getCursorPos()
    local field = tostring(self.key[self.value])
    local minXp = self.x
    
    if key == 259 then -- 退格键
        if xPos > minXp then
            termUtil.cpX = termUtil.cpX - 1
            local current_field_str = tostring(self.key[self.value])
            local index = termUtil.cpX - minXp + 1 -- 转换为字符串的索引
            if index >= 1 and index <= #current_field_str then
                self.key[self.value] = string.sub(current_field_str, 1, index - 1) .. string.sub(current_field_str, index + 1, #current_field_str)
            end
        end
    elseif key == 262 then termUtil.cpX = termUtil.cpX + 1 -- 右箭头
    elseif key == 263 then termUtil.cpX = termUtil.cpX - 1 -- 左箭头
    end
    
    -- 重新计算maxXp并进行光标位置钳制
    local current_text_len = #tostring(self.key[self.value])
    local maxXp_after_edit = minXp + current_text_len
    termUtil.cpX = termUtil.cpX > maxXp_after_edit and maxXp_after_edit or termUtil.cpX
    termUtil.cpX = termUtil.cpX < minXp and minXp or termUtil.cpX
end

-- 处理文本框点击事件 (设置光标位置)
function absTextField:click(x, y)
    local xPos = self.x
    if x >= xPos then
        if x <= xPos + #tostring(self.key[self.value]) then
            termUtil.cpX, termUtil.cpY = x, y
        else
            termUtil.cpX, termUtil.cpY = xPos + #tostring(self.key[self.value]), y
        end
    end
end

local newTextField = function(key, value, x, y)
    return setmetatable({
        key = key, value = value, type = type(key[value]), x = x, y = y
    }, {
        __index = absTextField
    })
end

-- 全局状态变量
local selfId = os.getComputerID()
local lastReceivedValue = nil     -- 最后接收到的原始数字 (弧度)
local lastReceivedNumberDisplay = "N/A" -- 用于UI显示最后接收到的数字 (度)
local motorTargetAngle = 0.0     -- 电机当前的目标角度 (弧度，内部使用)

-- 电机PID和扭矩设置
local DEFAULT_MOTOR_PID_P = 300.0
local DEFAULT_MOTOR_PID_I = 0.0
local DEFAULT_MOTOR_PID_D = 40.0
local DEFAULT_MOTOR_TORQUE = 50.0

local connectedMotors = {}       -- 存储所有连接的电机外设对象
local pid_set_once = false       -- 标记PID是否已设置过
local is_registered = false      -- 标志：是否已成功注册到中心
local reset_pending = false      -- 标志：是否收到重置信号待处理

-- 内部使用的角度值（弧度），从 UI 的度数转换而来
local _initialAngle_rad = 0.0
local _forbiddenMinAngle_rad = 0.0
local _forbiddenMaxAngle_rad = 0.0
local _calibrationOffset_rad = 0.0 -- 校准角度的弧度值

-- 辅助函数：将角度规范化到 [-PI, PI] 范围
local function wrapToPi(angle)
    return (angle + PI) % TWO_PI - PI
end

-- 辅助函数：检查一个角度是否在禁区内
local function isAngleInForbiddenZone(angle_rad, min_forbidden_rad, max_forbidden_rad)
    local wrapped_angle = wrapToPi(angle_rad)
    local wrapped_min = wrapToPi(min_forbidden_rad)
    local wrapped_max = wrapToPi(max_forbidden_rad)

    if wrapped_min <= wrapped_max then -- 禁区是连续的，例如 [-PI/2, PI/2]
        return wrapped_angle >= wrapped_min and wrapped_angle <= wrapped_max
    else -- 禁区是环绕的，例如 [3*PI/4, PI) U (-PI, -3*PI/4]
        return wrapped_angle >= wrapped_min or wrapped_angle <= wrapped_max
    end
end

-- 辅助函数：计算两个角度之间的最短距离
local function angularDistance(angle1, angle2)
    local diff = wrapToPi(angle2 - angle1)
    return math.abs(diff)
end

-- 辅助函数：检查路径是否穿过禁区 (起点和终点均在禁区外，但中间有禁区)
local function doesPathCrossForbiddenZone(current_rad, target_rad, forbidden_min_rad, forbidden_max_rad)
    -- 如果起点或终点在禁区内，则不认为“路径穿过”，而是由其他优先级更高的逻辑处理
    if isAngleInForbiddenZone(current_rad, forbidden_min_rad, forbidden_max_rad) or
       isAngleInForbiddenZone(target_rad, forbidden_min_rad, forbidden_max_rad) then
        return false
    end

    local d = wrapToPi(target_rad - current_rad);
    -- 检查路径中间点。如果任何一个点在禁区内，则路径穿过禁区。
    local num_path_checks = 5 -- 增加检查点数量以提高准确性
    for i = 1, num_path_checks do
        local interpolated_angle = wrapToPi(current_rad + d * (i / (num_path_checks + 1)))
        if isAngleInForbiddenZone(interpolated_angle, forbidden_min_rad, forbidden_max_rad) then
            return true
        end
    end
    return false
end

-- 刷新所有数值型 properties，将其从字符串（UI输入）转换为内部弧度值
local function refreshNumericProperties()
    local defaults = system.reset() -- 获取默认值以备回退

    _initialAngle_rad = math.rad(tonumber(properties.initialAngle) or tonumber(defaults.initialAngle))
    _forbiddenMinAngle_rad = math.rad(tonumber(properties.forbiddenMinAngle) or tonumber(defaults.forbiddenMinAngle))
    _forbiddenMaxAngle_rad = math.rad(tonumber(properties.forbiddenMaxAngle) or tonumber(defaults.forbiddenMaxAngle))
    _calibrationOffset_rad = math.rad(tonumber(properties.calibrationOffset) or tonumber(defaults.calibrationOffset))
end
refreshNumericProperties() -- 首次加载时刷新一次

-- 查找并初始化所有电机
local function initializeAllMotors()
    local peripheralNames = peripheral.getNames()
    if peripheralNames then
        for _, peripheralName in ipairs(peripheralNames) do
            local peripheralType = peripheral.getType(peripheralName)
            if peripheralType == "servo" then -- 根据提供的API，电机类型是 "servo"
                local p = peripheral.wrap(peripheralName)
                if p then
                    table.insert(connectedMotors, p)
                end
            end
        end
    end

    if #connectedMotors == 0 then
        term.clear()
        term.setCursorPos(1,1)
        term.setTextColor(colors.red)
        term.write("Error: No servo motors found. Exiting.")
        sleep(3)
        return false
    end

    -- 遍历所有连接的电机，进行初始化和PID设置。
    for _, motor in ipairs(connectedMotors) do
        pcall(function() motor.setIsAdjustingAngle(true) end) -- 确保电机处于角度调整模式
        
        if not pid_set_once then -- PID和扭矩只在首次连接时设置一次
            pcall(function() motor.setPID(DEFAULT_MOTOR_PID_P, DEFAULT_MOTOR_PID_I, DEFAULT_MOTOR_PID_D) end)
            pcall(function() motor.setOutputTorque(DEFAULT_MOTOR_TORQUE) end)
        end
        -- 设置初始目标角度 (弧度) 并应用校准
        pcall(function() motor.setTargetValue(wrapToPi(_initialAngle_rad + _calibrationOffset_rad)) end) 
    end
    pid_set_once = true -- 标记PID已设置
    motorTargetAngle = _initialAngle_rad -- 更新全局目标角度为初始角度 (弧度) (这里motorTargetAngle是程序1给的原始目标，校准是最后一步)
    return true
end

-- UI初始化
function termUtil:init()
    termUtil.fieldTb = {
        controlCenterId = newTextField(properties, "controlCenterId", 12, 2), -- Center ID输入框的精确坐标 (Y=2)
        initialAngle = newTextField(properties, "initialAngle", 17, 3),    -- 初始角度 (Y=3)
        forbiddenMinAngle = newTextField(properties, "forbiddenMinAngle", 17, 4), -- 禁区最小角度 (Y=4)
        forbiddenMaxAngle = newTextField(properties, "forbiddenMaxAngle", 17, 5), -- 禁区最大角度 (Y=5)
        calibrationOffset = newTextField(properties, "calibrationOffset", 21, 6), -- 校准角度 (Y=6)
    }
    termUtil.fieldTb.controlCenterId.len = 5 
    termUtil.fieldTb.initialAngle.len = 6
    termUtil.fieldTb.forbiddenMinAngle.len = 6
    termUtil.fieldTb.forbiddenMaxAngle.len = 6
    termUtil.fieldTb.calibrationOffset.len = 6

    termUtil.cpX = termUtil.fieldTb.controlCenterId.x -- 默认将光标设置到Center ID输入框
    termUtil.cpY = termUtil.fieldTb.controlCenterId.y
end

-- 刷新UI显示
function termUtil:refresh()
    term.clear()
    term.setTextColor(colors.white)
    term.setBackgroundColor(colors.black)

    -- UI布局 (压缩到19行以内)
    term.setCursorPos(1, 1)
    term.write(string.format("Receiver ID: %d", selfId))

    term.setCursorPos(1, 2)
    term.write("Center ID:") 
    termUtil.fieldTb.controlCenterId:paint() 

    term.setCursorPos(1, 3)
    term.write("Initial Angle:") 
    termUtil.fieldTb.initialAngle:paint()

    term.setCursorPos(1, 4)
    term.write("Forbidden Min:") 
    termUtil.fieldTb.forbiddenMinAngle:paint()

    term.setCursorPos(1, 5)
    term.write("Forbidden Max:") 
    termUtil.fieldTb.forbiddenMaxAngle:paint()
    
    term.setCursorPos(1, 6)
    term.write("Calibration Angle:") 
    termUtil.fieldTb.calibrationOffset:paint()

    term.setCursorPos(1, 8)
    term.write(string.format("Last Received Number: %s", lastReceivedNumberDisplay)) 
    
    term.setCursorPos(1, 9)
    term.write(string.format("Motor Target Angle: %.2f deg", math.deg(motorTargetAngle)))

    -- 底部信息
    term.setCursorPos(1, 18) -- 第18行
    term.write(string.format("Connected Motors: %d", #connectedMotors)) 

    term.setCursorPos(1, 19) -- 第19行，颜色强调
    if is_registered then
        term.setTextColor(colors.green)
        term.write("Registered: Yes")
    else
        term.setTextColor(colors.red)
        term.write("Registered: No (Sending requests...)")
    end
    term.setTextColor(colors.white) -- 重置颜色，避免影响后续输出

    term.setCursorPos(termUtil.cpX, termUtil.cpY) -- 确保光标在正确位置
end

-- 核心逻辑函数

-- 周期性地向中心发送注册请求，直到成功
local function sendRegistration()
    while not is_registered do -- 持续发送，直到注册成功
        local targetId = getValidControlCenterId()
        if targetId then
            rednet.send(targetId, {name = properties.receiverName, pw = CENTER_PASSWORD}, REQUEST_PROTOCOL)
        end
        sleep(1) -- 每1秒发送一次注册请求
    end
    while true do
        sleep(60) -- 注册成功后，此任务进入休眠，避免忙循环
    end
end

-- 监听来自中心的数据消息和重置信号
local function receiveData()
    local RECEIVE_TIMEOUT = 0.05 
    while true do
        local targetId = getValidControlCenterId()
        local id, msg, protocol_received = rednet.receive(nil, RECEIVE_TIMEOUT) -- 监听所有协议

        if targetId and id == targetId then
            if protocol_received == DATA_PROTOCOL and type(msg) == "table" and msg.value ~= nil and msg.step ~= nil then 
                lastReceivedValue = msg.value -- 接收到的原始弧度值
                motorTargetAngle = msg.value   -- 更新内部目标角度
                lastReceivedNumberDisplay = string.format("%.2f deg", math.deg(lastReceivedValue)) -- 显示时转换为度数
                is_registered = true -- 收到数据即表示注册成功
                reset_pending = false -- 收到新数据，取消重置待处理状态
            elseif protocol_received == RESET_PROTOCOL then
                -- 收到重置信号，将目标角度设置为初始角度，并设置重置待处理标志
                motorTargetAngle = _initialAngle_rad
                lastReceivedNumberDisplay = string.format("RESET: %.2f deg", math.deg(_initialAngle_rad)) -- 显示时转换为度数
                reset_pending = true
            end
        end
    end
end

-- 独立的电机目标更新任务 (处理禁区绕行逻辑)
local function updateMotorTarget()
    local MOTOR_UPDATE_FREQUENCY = 0.05 

    while true do
        -- 获取当前电机物理角度 (弧度)
        local success, physical_current_angle_rad = pcall(function() return connectedMotors[1].getAngle() end)
        physical_current_angle_rad = success and physical_current_angle_rad or 0.0 

        -- **关键修改：将物理角度转换为逻辑角度，用于所有禁区和路径判断**
        local logical_current_angle_rad = wrapToPi(physical_current_angle_rad - _calibrationOffset_rad)

        local final_logical_angle_to_set_rad = logical_current_angle_rad -- 默认保持当前逻辑角度，直到计算出新目标

        -- 优先级1: 重置模式
        if reset_pending then
            -- 如果当前逻辑角度已经非常接近初始逻辑角度，则保持不动，否则移动到初始逻辑角度
            if angularDistance(logical_current_angle_rad, _initialAngle_rad) < ANGLE_TOLERANCE then
                final_logical_angle_to_set_rad = logical_current_angle_rad
            else
                final_logical_angle_to_set_rad = _initialAngle_rad
            end
        else
            -- 从接收到的数据中获取原始目标逻辑角度 (弧度)
            local target_from_center_rad = motorTargetAngle 
            
            local current_in_forbidden_zone = isAngleInForbiddenZone(logical_current_angle_rad, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad)
            local target_from_center_in_forbidden_zone = isAngleInForbiddenZone(target_from_center_rad, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad)

            -- 优先级2: 如果当前电机已在禁区内，必须尝试逃离
            if current_in_forbidden_zone then
                local target_for_escape_rad
                -- 找出最近的“安全区边缘”作为逃离目标 (逻辑角度)
                local dist_to_min_boundary = angularDistance(logical_current_angle_rad, _forbiddenMinAngle_rad)
                local dist_to_max_boundary = angularDistance(logical_current_angle_rad, _forbiddenMaxAngle_rad)
                
                if dist_to_min_boundary < dist_to_max_boundary then
                    target_for_escape_rad = wrapToPi(_forbiddenMinAngle_rad - ANGLE_OFFSET_FOR_SAFE_EDGE)
                else
                    target_for_escape_rad = wrapToPi(_forbiddenMaxAngle_rad + ANGLE_OFFSET_FOR_SAFE_EDGE)
                end

                -- 尝试绕行到逃离目标
                local delta_to_escape = wrapToPi(target_for_escape_rad - logical_current_angle_rad)
                local bypass_direction = (delta_to_escape >= 0) and -1 or 1 -- 如果目标在顺时针方向，则逆时针避让，反之亦然
                local attempted_bypass_angle = wrapToPi(logical_current_angle_rad + (bypass_direction * _BYPASS_STEP_RAD))

                -- 如果绕行尝试的目标仍然在禁区内，则尝试反方向绕行
                if isAngleInForbiddenZone(attempted_bypass_angle, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                    final_logical_angle_to_set_rad = wrapToPi(logical_current_angle_rad - (bypass_direction * _BYPASS_STEP_RAD))
                    -- 如果反方向仍然在禁区内，则直接冲向安全边缘
                    if isAngleInForbiddenZone(final_logical_angle_to_set_rad, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                        final_logical_angle_to_set_rad = target_for_escape_rad
                    end
                else
                    final_logical_angle_to_set_rad = attempted_bypass_angle
                end
                
            -- 优先级3: 当前电机不在禁区内，但程序1发送的目标角度在禁区内
            elseif target_from_center_in_forbidden_zone then
                -- 将目标钳制到最近的禁区边缘（安全侧） (逻辑角度)
                local clamped_safe_edge_rad
                local dist_to_min_boundary = angularDistance(target_from_center_rad, _forbiddenMinAngle_rad)
                local dist_to_max_boundary = angularDistance(target_from_center_rad, _forbiddenMaxAngle_rad)
                
                if dist_to_min_boundary < dist_to_max_boundary then
                    clamped_safe_edge_rad = wrapToPi(_forbiddenMinAngle_rad - ANGLE_OFFSET_FOR_SAFE_EDGE)
                else
                    clamped_safe_edge_rad = wrapToPi(_forbiddenMaxAngle_rad + ANGLE_OFFSET_FOR_SAFE_EDGE)
                end

                -- 如果当前逻辑角度已经非常接近这个安全边缘，则保持当前逻辑角度（停止移动）
                if angularDistance(logical_current_angle_rad, clamped_safe_edge_rad) < ANGLE_TOLERANCE then
                    final_logical_angle_to_set_rad = logical_current_angle_rad
                else
                    -- 否则，检查从当前逻辑位置到最近安全禁区边缘的路径是否穿过禁区（即需要绕行）
                    if doesPathCrossForbiddenZone(logical_current_angle_rad, clamped_safe_edge_rad, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                        local delta_to_clamped_edge = wrapToPi(clamped_safe_edge_rad - logical_current_angle_rad)
                        local bypass_direction = (delta_to_clamped_edge >= 0) and -1 or 1 -- 尝试与目标方向相反的方向绕行

                        local attempted_bypass_angle = wrapToPi(logical_current_angle_rad + (bypass_direction * _BYPASS_STEP_RAD))
                        
                        -- 如果绕行尝试的目标仍然在禁区内，则尝试另一个方向
                        if isAngleInForbiddenZone(attempted_bypass_angle, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                            final_logical_angle_to_set_rad = wrapToPi(logical_current_angle_rad - (bypass_direction * _BYPASS_STEP_RAD))
                        else
                            final_logical_angle_to_set_rad = attempted_bypass_angle
                        end
                    else
                        -- 路径安全，直接移动到最近的安全禁区边缘
                        final_logical_angle_to_set_rad = clamped_safe_edge_rad
                    end
                end
            -- 优先级4: 当前电机和程序1的目标角度都在禁区外，但从当前逻辑位置到目标的路径穿过禁区
            elseif doesPathCrossForbiddenZone(logical_current_angle_rad, target_from_center_rad, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                local delta_to_target = wrapToPi(target_from_center_rad - logical_current_angle_rad)
                local bypass_direction_for_path = (delta_to_target >= 0) and -1 or 1 -- 尝试与目标方向相反的方向绕行

                local attempted_bypass_angle = wrapToPi(logical_current_angle_rad + (bypass_direction_for_path * _BYPASS_STEP_RAD))
                
                -- 如果绕行尝试的目标仍然在禁区内，则尝试另一个方向
                if isAngleInForbiddenZone(attempted_bypass_angle, _forbiddenMinAngle_rad, _forbiddenMaxAngle_rad) then
                    final_logical_angle_to_set_rad = wrapToPi(logical_current_angle_rad - (bypass_direction_for_path * _BYPASS_STEP_RAD))
                else
                    final_logical_angle_to_set_rad = attempted_bypass_angle
                end
            -- 优先级5: 一切正常，直接前往程序1发送的目标逻辑角度
            else
                final_logical_angle_to_set_rad = target_from_center_rad
            end
        end

        -- **最终步骤：在设置给电机前，将计算出的逻辑角度加上校准偏移，转换为物理角度**
        local calibrated_angle_to_set_rad = wrapToPi(final_logical_angle_to_set_rad + _calibrationOffset_rad)

        -- 将最终计算出的角度设置给所有电机 (弧度)
        for _, motor in ipairs(connectedMotors) do 
            pcall(function() motor.setTargetValue(calibrated_angle_to_set_rad) end)
        end
        sleep(MOTOR_UPDATE_FREQUENCY)
    end
end

-- UI刷新任务
local function controlMotorAndUI() 
    local UI_REFRESH_INTERVAL = 0.5 
    
    while true do
        termUtil:refresh() 
        sleep(UI_REFRESH_INTERVAL)
    end
end

-- UI交互任务
local function runTerm()
    termUtil:refresh() 
    term.setCursorBlink(true) 

    while true do
        local eventData = {os.pullEvent()}
        local event = eventData[1]

        if event == "mouse_click" or event == "key" or event == "char" then
            if event == "mouse_click" then
                local x, y = eventData[3], eventData[4]
                if y == termUtil.fieldTb.controlCenterId.y and x >= termUtil.fieldTb.controlCenterId.x and x <= termUtil.fieldTb.controlCenterId.x + termUtil.fieldTb.controlCenterId.len then
                    termUtil.fieldTb.controlCenterId:click(x, y)
                end
                if y == termUtil.fieldTb.initialAngle.y and x >= termUtil.fieldTb.initialAngle.x and x <= termUtil.fieldTb.initialAngle.x + termUtil.fieldTb.initialAngle.len then
                    termUtil.fieldTb.initialAngle:click(x, y)
                end
                if y == termUtil.fieldTb.forbiddenMinAngle.y and x >= termUtil.fieldTb.forbiddenMinAngle.x and x <= termUtil.fieldTb.forbiddenMinAngle.x + termUtil.fieldTb.forbiddenMinAngle.len then
                    termUtil.fieldTb.forbiddenMinAngle:click(x, y)
                end
                if y == termUtil.fieldTb.forbiddenMaxAngle.y and x >= termUtil.fieldTb.forbiddenMaxAngle.x and x <= termUtil.fieldTb.forbiddenMaxAngle.x + termUtil.fieldTb.forbiddenMaxAngle.len then
                    termUtil.fieldTb.forbiddenMaxAngle:click(x, y)
                end
                if y == termUtil.fieldTb.calibrationOffset.y and x >= termUtil.fieldTb.calibrationOffset.x and x <= termUtil.fieldTb.calibrationOffset.x + termUtil.fieldTb.calibrationOffset.len then
                    termUtil.fieldTb.calibrationOffset:click(x, y)
                end
            elseif event == "key" then
                local key = eventData[2]
                if termUtil.cpY == termUtil.fieldTb.controlCenterId.y and termUtil.cpX >= termUtil.fieldTb.controlCenterId.x and termUtil.cpX <= termUtil.fieldTb.controlCenterId.x + termUtil.fieldTb.controlCenterId.len + 1 then
                    termUtil.fieldTb.controlCenterId:inputKey(key)
                end
                if termUtil.cpY == termUtil.fieldTb.initialAngle.y and termUtil.cpX >= termUtil.fieldTb.initialAngle.x and termUtil.cpX <= termUtil.fieldTb.initialAngle.x + termUtil.fieldTb.initialAngle.len + 1 then
                    termUtil.fieldTb.initialAngle:inputKey(key)
                end
                if termUtil.cpY == termUtil.fieldTb.forbiddenMinAngle.y and termUtil.cpX >= termUtil.fieldTb.forbiddenMinAngle.x and termUtil.cpX <= termUtil.fieldTb.forbiddenMinAngle.x + termUtil.fieldTb.forbiddenMinAngle.len + 1 then
                    termUtil.fieldTb.forbiddenMinAngle:inputKey(key)
                end
                if termUtil.cpY == termUtil.fieldTb.forbiddenMaxAngle.y and termUtil.cpX >= termUtil.fieldTb.forbiddenMaxAngle.x and termUtil.cpX <= termUtil.fieldTb.forbiddenMaxAngle.x + termUtil.fieldTb.forbiddenMaxAngle.len + 1 then
                    termUtil.fieldTb.forbiddenMaxAngle:inputKey(key)
                end
                if termUtil.cpY == termUtil.fieldTb.calibrationOffset.y and termUtil.cpX >= termUtil.fieldTb.calibrationOffset.x and termUtil.cpX <= termUtil.fieldTb.calibrationOffset.x + termUtil.fieldTb.calibrationOffset.len + 1 then
                    termUtil.fieldTb.calibrationOffset:inputKey(key)
                end
            elseif event == "char" then
                local char = eventData[2]
                if termUtil.cpY == termUtil.fieldTb.controlCenterId.y and termUtil.cpX >= termUtil.fieldTb.controlCenterId.x and termUtil.cpX <= termUtil.fieldTb.controlCenterId.x + termUtil.fieldTb.controlCenterId.len + 1 then
                    termUtil.fieldTb.controlCenterId:inputChar(char)
                end
                if termUtil.cpY == termUtil.fieldTb.initialAngle.y and termUtil.cpX >= termUtil.fieldTb.initialAngle.x and termUtil.cpX <= termUtil.fieldTb.initialAngle.x + termUtil.fieldTb.initialAngle.len + 1 then
                    termUtil.fieldTb.initialAngle:inputChar(char)
                end
                if termUtil.cpY == termUtil.fieldTb.forbiddenMinAngle.y and termUtil.cpX >= termUtil.fieldTb.forbiddenMinAngle.x and termUtil.cpX <= termUtil.fieldTb.forbiddenMinAngle.x + termUtil.fieldTb.forbiddenMinAngle.len + 1 then
                    termUtil.fieldTb.forbiddenMinAngle:inputChar(char)
                end
                if termUtil.cpY == termUtil.fieldTb.forbiddenMaxAngle.y and termUtil.cpX >= termUtil.fieldTb.forbiddenMaxAngle.x and termUtil.cpX <= termUtil.fieldTb.forbiddenMaxAngle.x + termUtil.fieldTb.forbiddenMaxAngle.len + 1 then
                    termUtil.fieldTb.forbiddenMaxAngle:inputChar(char)
                end
                if termUtil.cpY == termUtil.fieldTb.calibrationOffset.y and termUtil.cpX >= termUtil.fieldTb.calibrationOffset.x and termUtil.cpX <= termUtil.fieldTb.calibrationOffset.x + termUtil.fieldTb.calibrationOffset.len + 1 then
                    termUtil.fieldTb.calibrationOffset:inputChar(char)
                end
            end
            system.updatePersistentData() 
            refreshNumericProperties() -- UI编辑后刷新数值型属性
            termUtil:refresh() 
        end
    end
end

-- 主程序入口
local function main()
    term.clear()
    term.setCursorPos(1, 1)
    term.write("Starting 副炮火控...")
    sleep(1)

    if not initializeAllMotors() then -- 在启动时立即查找并初始化所有电机
        return -- 如果没有找到电机，程序退出
    end
    
    termUtil:init() 
    parallel.waitForAll(sendRegistration, receiveData, updateMotorTarget, controlMotorAndUI, runTerm) 
end

main()
