--[[弹道计算器
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
======================================================================]]

-- ==========================================
-- 基础配置
-- ==========================================
local CONFIG_FILE = "cbc_config.txt"
local cannons = {}     
local globalParams = { n="4", k="12", g="0.05", lambda="0.01" }
-- cannonConfigs 存储核心数据: [id] = { name="Gun-1", h="10" }
local cannonConfigs = {} 

-- 加载配置
local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local file = fs.open(CONFIG_FILE, "r")
        if file then
            local data = textutils.unserialize(file.readAll()) or {}
            file.close()
            -- 恢复全局参数
            if data.params then globalParams = data.params end
            -- 恢复火炮独立参数 (Name, H)
            if data.cannons then cannonConfigs = data.cannons end
        end
    end
end

-- 保存配置
local function saveConfig()
    local data = { params = globalParams, cannons = cannonConfigs }
    local file = fs.open(CONFIG_FILE, "w")
    if file then
        file.write(textutils.serialize(data))
        file.close()
    end
end

-- ==========================================
-- 运算核心
-- ==========================================
local function calculateHeight(x, theta_deg, n, k, h, g, lambda)
    if lambda <= 0.0001 then lambda = 0.0001 end 
    local rad = math.rad(theta_deg)
    local cos_t = math.cos(rad)
    local sin_t = math.sin(rad)
    if math.abs(cos_t) < 0.0001 then return nil end
    local tan_t = sin_t / cos_t
    local dx = x - k * cos_t
    local inner = 1 - (lambda * dx) / (n * cos_t)
    if inner <= 0.00001 then return -math.huge end 
    local term_linear = dx * (tan_t + g / (n * lambda * cos_t))
    local log_drag = math.log(1 - lambda)
    local time_ticks = math.log(inner) / log_drag
    local term_gravity = - (g / lambda) * time_ticks
    return h + k * sin_t + term_linear + term_gravity
end

local function solveDistance(theta_deg, n, k, h, g, lambda)
    theta_deg = math.abs(theta_deg) % 360
    if theta_deg > 90 and theta_deg < 270 then return 0 end 
    local rad = math.rad(theta_deg)
    local cosv = math.cos(rad)
    if math.abs(cosv) < 0.0001 then return 0 end
    local x_limit = (n / lambda) * cosv + k * cosv
    if x_limit < 0 then return 0 end
    local min_x = 0; local max_x = x_limit - 0.01
    local y_start = calculateHeight(0.1, theta_deg, n, k, h, g, lambda)
    if y_start and y_start < 0 then return 0 end
    for i = 1, 15 do 
        local mid_x = (min_x + max_x) / 2
        local y = calculateHeight(mid_x, theta_deg, n, k, h, g, lambda)
        if y == -math.huge then max_x = mid_x elseif y > 0 then min_x = mid_x else max_x = mid_x end
    end
    return (min_x + max_x) / 2
end

local function findMaxRange(n, k, h, g, lambda)
    local maxDist = 0; local bestAngle = 0
    for a = 10, 60, 2 do 
        local d = solveDistance(a, n, k, h, g, lambda)
        if d > maxDist then maxDist = d; bestAngle = a end
    end
    for a = bestAngle - 2, bestAngle + 2, 0.5 do
         local d = solveDistance(a, n, k, h, g, lambda)
         if d > maxDist then maxDist = d; bestAngle = a end
    end
    return maxDist, bestAngle
end

-- ==========================================
-- UI 组件
-- ==========================================
local termUtil = {cpX=1, cpY=1}
local activeField = nil 
local fieldList = {}

local TextField = {}
TextField.__index = TextField

function TextField.new(dataRef, key, x, y, len, isNum)
    return setmetatable({
        data = dataRef, key = key, 
        x = x, y = y, len = len, 
        isNum = isNum,
        txtColor = colors.white,
        bgColor = colors.black
    }, TextField)
end

function TextField:paint()
    local rawVal = tostring(self.data[self.key] or "")
    local isActive = (activeField == self)
    
    local fg = self.txtColor
    local bg = self.bgColor
    if isActive then bg = colors.gray; fg = colors.white end
    if not self.isNum and not isActive then fg = colors.cyan end 
    if self.key == "h" and not isActive then fg = colors.yellow end

    local displayStr = rawVal
    if #rawVal > self.len then displayStr = string.sub(rawVal, #rawVal - self.len + 1) end
    local paddedStr = displayStr .. string.rep(" ", math.max(0, self.len - #displayStr))
    
    term.setCursorPos(self.x, self.y)
    term.blit(
        paddedStr,
        string.rep(string.format("%x", math.log(fg, 2)), self.len),
        string.rep(string.format("%x", math.log(bg, 2)), self.len)
    )
end

function TextField:click(x, y)
    activeField = self
    local val = tostring(self.data[self.key] or "")
    local relX = x - self.x
    if relX > #val then relX = #val end
    termUtil.cpX = self.x + relX
    termUtil.cpY = self.y
    return true
end

function TextField:inputChar(char)
    local val = tostring(self.data[self.key] or "")
    if #val < self.len + 5 then 
        if self.isNum and not (char:match("[%d%.%-]")) then return false end
        local relX = termUtil.cpX - self.x + 1 
        local newVal = string.sub(val, 1, relX - 1) .. char .. string.sub(val, relX)
        self.data[self.key] = newVal
        termUtil.cpX = termUtil.cpX + 1
        return true
    end
    return false
end

function TextField:inputKey(key)
    local val = tostring(self.data[self.key] or "")
    local relX = termUtil.cpX - self.x + 1 

    if key == keys.backspace then 
        if relX > 1 then
            local newVal = string.sub(val, 1, relX - 2) .. string.sub(val, relX)
            self.data[self.key] = newVal
            termUtil.cpX = termUtil.cpX - 1
            return true
        end
    elseif key == keys.delete then 
        if relX <= #val then
            local newVal = string.sub(val, 1, relX - 1) .. string.sub(val, relX + 1)
            self.data[self.key] = newVal
            return true
        end
    elseif key == keys.left then
        if termUtil.cpX > self.x then termUtil.cpX = termUtil.cpX - 1; return true end
    elseif key == keys.right then
        if termUtil.cpX < self.x + #val and termUtil.cpX < self.x + self.len - 1 then
            termUtil.cpX = termUtil.cpX + 1; return true
        end
    elseif key == keys.enter then
        activeField = nil 
        saveConfig()
        return true
    end
    return false
end

-- ==========================================
-- 储存逻辑
-- ==========================================

local function scanCannons()
    cannons = {}
    local periphs = peripheral.getNames()
    for _, name in pairs(periphs) do
        if string.find(name, "cbc_cannon") or string.find(name, "mount") then
            local mount = peripheral.wrap(name)
            if mount and mount.getPitch then
                -- 如果配置中已有该ID,则加载名字和H,否则创建默认值
                if not cannonConfigs[name] then
                    cannonConfigs[name] = { name = "Gun-"..(string.match(name, "%d+") or "?"), h = "0" }
                else
                    -- 确保旧配置也有h字段
                    if not cannonConfigs[name].h then cannonConfigs[name].h = "0" end
                end
                table.insert(cannons, { id = name, hw = mount })
            end
        end
    end
    table.sort(cannons, function(a,b) return a.id < b.id end)
end

-- 手动清理
local function manualCleanup()
    local w, h = term.getSize()
    term.setCursorPos(1, h)
    term.setBackgroundColor(colors.black)
    term.setTextColor(colors.orange)
    term.write("Cleaning up data...")
    
    local presentDevices = {}
    for _, name in pairs(peripheral.getNames()) do
        presentDevices[name] = true
    end
    
    local removedCount = 0
    local dirty = false
    
    -- 遍历保存的配置，删除不在当前连接列表中的项
    for id, _ in pairs(cannonConfigs) do
        -- 只检查像是火炮ID的项
        if (id:find("cbc_cannon") or id:find("mount")) and not presentDevices[id] then
            cannonConfigs[id] = nil
            dirty = true
            removedCount = removedCount + 1
        end
    end
    
    if dirty then
        saveConfig()
        term.setCursorPos(1, h)
        term.clearLine()
        term.setTextColor(colors.lime)
        term.write("Removed " .. removedCount .. " old entries.")
    else
        term.setCursorPos(1, h)
        term.clearLine()
        term.setTextColor(colors.lightGray)
        term.write("Nothing to clean.")
    end
    sleep(1.0)
end

-- ==========================================
-- UI绘制
-- ==========================================
local function initFields()
    fieldList = {}
    table.insert(fieldList, TextField.new(globalParams, "n", 12, 3, 8, true))
    table.insert(fieldList, TextField.new(globalParams, "k", 12, 4, 8, true))
    table.insert(fieldList, TextField.new(globalParams, "g", 30, 3, 8, true))
    table.insert(fieldList, TextField.new(globalParams, "lambda", 30, 4, 8, true))
    
    for i, c in ipairs(cannons) do
        local config = cannonConfigs[c.id]
        table.insert(fieldList, TextField.new(config, "name", 6, 9+i, 9, false))
        table.insert(fieldList, TextField.new(config, "h", 19, 9+i, 5, true))
    end
end

local function drawTerminal()
    local w, h = term.getSize()
    term.setBackgroundColor(colors.black)
    term.clear()
    
    term.setCursorPos(1,1); term.setTextColor(colors.yellow)
    term.write("Fire Control")
    term.setCursorPos(1, 7); term.setTextColor(colors.gray)
    term.write(string.rep("-", w))
    
    term.setTextColor(colors.white)
    term.setCursorPos(2,3); term.write("Charges:") 
    term.setCursorPos(2,4); term.write("Barrel :") 
    term.setCursorPos(21,3); term.write("Gravity:") 
    term.setCursorPos(21,4); term.write("Drag   :") 
    
    term.setCursorPos(1, 8); term.setTextColor(colors.lightGray)
    term.write(" #  | Name     | High")
    term.setCursorPos(1, 9); term.setTextColor(colors.gray)
    term.write(string.rep("-", w))
    
    for i, c in ipairs(cannons) do
        local y = 9 + i
        if y > h then break end
        term.setCursorPos(2, y); term.setTextColor(colors.gray)
        term.write(string.format("%d  |", i))
        term.setCursorPos(16, y); term.write("|")
    end
    
    for _, f in pairs(fieldList) do f:paint() end
    
    -- 底部提示
    if not activeField then
        term.setCursorPos(1, h)
        term.setTextColor(colors.gray)
        term.write("Press 'C' to clean unused data")
    end

    if activeField then
        term.setTextColor(colors.white) -- 强制白色光标
        term.setCursorPos(termUtil.cpX, termUtil.cpY)
        term.setCursorBlink(true)
    else
        term.setCursorBlink(false)
    end
end

local function drawMonitor()
    local mon = peripheral.find("monitor")
    if not mon then return end
    mon.setTextScale(1) 
    local w, h = mon.getSize()
    mon.setBackgroundColor(colors.black)
    mon.clear()
    
    local nVal = tonumber(globalParams.n) or 0
    local kVal = tonumber(globalParams.k) or 0
    local gVal = tonumber(globalParams.g) or 0.05
    local lVal = tonumber(globalParams.lambda) or 0.01
    local velocity = nVal * 2 
    
    mon.setCursorPos(1, 1); mon.setTextColor(colors.gray)
    mon.write("NAME    ANG   DIST  MAX(Ang)")
    mon.setCursorPos(1, 2); mon.write(string.rep("-", w))
    
    for i, c in ipairs(cannons) do
        local y = i + 2
        if y > h then break end
        local config = cannonConfigs[c.id]
        local hVal = tonumber(config.h) or 0
        
        local name = config.name
        if #name > 7 then name = string.sub(name, 1, 7) end
        mon.setCursorPos(1, y); mon.setTextColor(colors.white)
        mon.write(name)
        
        local pitch = 0
        pcall(function() pitch = c.hw.getPitch() end)
        mon.setCursorPos(9, y); mon.setTextColor(colors.lightBlue)
        mon.write(string.format("%4.1f", pitch))
        
        mon.setCursorPos(15, y)
        if nVal > 0 then
            local dist = solveDistance(pitch, velocity, kVal, hVal, gVal, lVal)
            if dist > 0 then
                mon.setTextColor(colors.lime)
                mon.write(string.format("%.0fm", dist))
            else
                mon.setTextColor(colors.red)
                mon.write("MISS")
            end
            local maxD, bestA = findMaxRange(velocity, kVal, hVal, gVal, lVal)
            mon.setCursorPos(21, y); mon.setTextColor(colors.yellow)
            mon.write(string.format("%.0f(%.0f)", maxD, bestA))
        else
            mon.setTextColor(colors.gray); mon.write("WAIT")
        end
    end
end

-- ==========================================
-- 主程序入口
-- ==========================================
local function main()
    loadConfig() 
    scanCannons()
    initFields()
    
    drawTerminal()
    drawMonitor()
    
    local timerId = os.startTimer(0.1)
    
    while true do
        local e = {os.pullEvent()}
        local evt = e[1]
        local shouldRedrawTerm = false
        
        if evt == "timer" and e[2] == timerId then
            drawMonitor() 
            if not activeField then drawTerminal() end
            timerId = os.startTimer(0.1)
            
        elseif evt == "mouse_click" then
            local x, y = e[3], e[4]
            activeField = nil 
            for _, f in pairs(fieldList) do
                if y == f.y and x >= f.x and x < f.x + f.len then
                    if f:click(x, y) then shouldRedrawTerm = true end
                    break
                end
            end
            shouldRedrawTerm = true
            
        elseif evt == "key" then
            local key = e[2]
            if activeField then
                -- 正在输入时，处理输入逻辑
                if activeField:inputKey(key) then 
                    saveConfig() -- 实时保存每次按键修改
                    shouldRedrawTerm = true 
                end
            else
                -- 未输入时，按下 'C' 触发清理
                if key == keys.c then
                    manualCleanup()
                    scanCannons() -- 清理后重新扫描
                    initFields()  -- 重新绑定输入框
                    shouldRedrawTerm = true
                end
            end
            
        elseif evt == "char" then
            local char = e[2]
            if activeField then
                if activeField:inputChar(char) then 
                    saveConfig() -- 实时保存输入字符
                    shouldRedrawTerm = true 
                end
            end
            
        elseif evt == "peripheral" or evt == "peripheral_detach" then
            scanCannons()
            initFields()
            shouldRedrawTerm = true
        end
        
        if shouldRedrawTerm then
            drawTerminal()
        end
    end
end

term.clear()
print("System Initializing v16...")
main()
