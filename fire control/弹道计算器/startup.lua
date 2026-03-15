--[[弹道计算器 2.3.0
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
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⢄⣠⣿⣿⣿⣿⣿⡀⠻⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠘⣿⣿⣿⣿⣟⣿⣷⣤⣬⣉⣉
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⢹⣿⣿⣿⣿⣦⣍⣉⠉⠉⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠻⠛⠿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⣀⣾⣿⣿⣿⣿⣿⣿
======================================================================]]

-- ==========================================
-- 配置文件
-- ==========================================
local CONFIG_FILE = "cbc_config.txt"
local cannons = {}     

local gunParams = { n="4", k="4" }

local shellData = {
    AP = { g="0.05", lambda="0.01" },
    HE = { g="0.05", lambda="0.01" } 
}
local currentMode = "AP" 

local cannonConfigs = {} 

local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local file = fs.open(CONFIG_FILE, "r")
        if file then
            local data = textutils.unserialize(file.readAll()) or {}
            file.close()
            if data.gunParams then gunParams = data.gunParams end
            if data.shells then shellData = data.shells end
            if data.cannons then cannonConfigs = data.cannons end
            
            if data.params and not data.gunParams then
                gunParams.n = data.params.n or "4"
                gunParams.k = data.params.k or "4"
            end
        end
    end
end

local function saveConfig()
    local data = { 
        gunParams = gunParams, 
        shells = shellData, 
        cannons = cannonConfigs 
    }
    local file = fs.open(CONFIG_FILE, "w")
    if file then
        file.write(textutils.serialize(data))
        file.close()
    end
end

-- ==========================================
-- 弹道运算
-- ==========================================
local math_pi, math_abs = math.pi, math.abs
local math_sin, math_cos = math.sin, math.cos
local math_rad, math_deg = math.rad, math.deg
local math_sqrt, math_log = math.sqrt, math.log
local math_huge = math.huge

local function calculateHeight(x, theta_deg, v, k, h, g, lambda)
    if lambda <= 0.0001 then lambda = 0.0001 end 
    local rad = math_rad(theta_deg)
    local cos_t, sin_t = math_cos(rad), math_sin(rad)
    if math_abs(cos_t) < 0.0001 then return nil end
    local tan_t = sin_t / cos_t
    local dx = x - k * cos_t
    local inner = 1 - (lambda * dx) / (v * cos_t)
    if inner <= 0.00001 then return -math_huge end 
    local term_linear = dx * (tan_t + g / (v * lambda * cos_t))
    local time_ticks = math_log(inner) / math_log(1 - lambda)
    local term_gravity = - (g / lambda) * time_ticks
    return h + k * sin_t + term_linear + term_gravity
end

local function solveDistance(pitch, v, k, h, g, lambda)
    local max_x = v * math_cos(math_rad(pitch)) / lambda
    if max_x <= 0.1 then return 0 end
    local step = 50 
    local prev_x, prev_y = 0, h
    local foundInterval = false
    local limit_x = max_x * 0.99 
    local hit_a, hit_b = 0, 0
    for x = step, limit_x, step do
        local y = calculateHeight(x, pitch, v, k, h, g, lambda)
        if not y or y == -math_huge then break end
        if prev_y > 0 and y <= 0 then
            hit_a, hit_b = prev_x, x; foundInterval = true; break
        end
        prev_x, prev_y = x, y
    end
    if not foundInterval then return 0 end
    local lb, rb = hit_a, hit_b
    for i = 1, 15 do 
        local m = (lb + rb) * 0.5
        local my = calculateHeight(m, pitch, v, k, h, g, lambda)
        if not my or my <= 0 then rb = m else lb = m end
    end
    return (lb + rb) * 0.5
end

local function findMaxRange(v, k, h, g, lambda)
    local maxDist = 0; local bestAngle = 0
    for a = 10, 50, 5 do 
        local d = solveDistance(a, v, k, h, g, lambda)
        if d > maxDist then maxDist = d; bestAngle = a end
    end
    for a = bestAngle - 5, bestAngle + 5, 1 do
         local d = solveDistance(a, v, k, h, g, lambda)
         if d > maxDist then maxDist = d; bestAngle = a end
    end
    return maxDist, bestAngle
end

-- ==========================================
--  UI 
-- ==========================================
local termUtil = {cpX=1, cpY=1}
local activeField = nil 
local mainFields = {}   
local configFields = {} 
local isConfigMode = false 

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
    term.blit(paddedStr, string.rep(string.format("%x", math.log(fg, 2)), self.len), string.rep(string.format("%x", math.log(bg, 2)), self.len))
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
            self.data[self.key] = newVal; termUtil.cpX = termUtil.cpX - 1; return true
        end
    elseif key == keys.delete then 
        if relX <= #val then
            local newVal = string.sub(val, 1, relX - 1) .. string.sub(val, relX + 1)
            self.data[self.key] = newVal; return true
        end
    elseif key == keys.left then
        if termUtil.cpX > self.x then termUtil.cpX = termUtil.cpX - 1; return true end
    elseif key == keys.right then
        if termUtil.cpX < self.x + #val and termUtil.cpX < self.x + self.len - 1 then termUtil.cpX = termUtil.cpX + 1; return true end
    elseif key == keys.enter then
        activeField = nil; saveConfig(); return true
    end
    return false
end

-- ==========================================
-- 逻辑
-- ==========================================
local function scanCannons()
    cannons = {}
    local periphs = peripheral.getNames()
    for _, name in pairs(periphs) do
        if string.find(name, "cbc_cannon") or string.find(name, "mount") then
            local mount = peripheral.wrap(name)
            if mount and mount.getPitch then
                if not cannonConfigs[name] then cannonConfigs[name] = { name = "Gun-"..(string.match(name, "%d+") or "?"), h = "0" }
                else if not cannonConfigs[name].h then cannonConfigs[name].h = "0" end end
                table.insert(cannons, { id = name, hw = mount })
            end
        end
    end
    table.sort(cannons, function(a,b) return a.id < b.id end)
end

local function manualCleanup()
    local w, h = term.getSize()
    term.setCursorPos(1, h); term.setBackgroundColor(colors.black); term.setTextColor(colors.orange)
    term.write("Cleaning...")
    local present = {}; for _, n in pairs(peripheral.getNames()) do present[n] = true end
    local dirty = false
    for id, _ in pairs(cannonConfigs) do
        if (id:find("cbc_cannon") or id:find("mount")) and not present[id] then
            cannonConfigs[id] = nil; dirty = true
        end
    end
    if dirty then saveConfig() end
    sleep(0.5)
end

-- ==========================================
-- 渲染绘制
-- ==========================================
local function initFields()
    mainFields = {}
    configFields = {}
    
    local activeShell = shellData[currentMode]
    
    table.insert(mainFields, TextField.new(gunParams, "n", 12, 3, 8, true))
    table.insert(mainFields, TextField.new(gunParams, "k", 12, 4, 8, true))
    
    table.insert(configFields, TextField.new(activeShell, "g", 15, 6, 8, true))
    table.insert(configFields, TextField.new(activeShell, "lambda", 15, 8, 8, true))
    
    -- 火炮列表
    for i, c in ipairs(cannons) do
        local config = cannonConfigs[c.id]
        table.insert(mainFields, TextField.new(config, "name", 6, 7+i, 9, false))
        table.insert(mainFields, TextField.new(config, "h", 19, 7+i, 5, true))
    end
end

local function drawTerminal()
    local w, h = term.getSize()
    term.setBackgroundColor(colors.black)
    term.clear()
    
    local modeColor = (currentMode == "HE") and colors.red or colors.blue
    
    if isConfigMode then
        term.setCursorPos(1,1); term.setTextColor(colors.yellow)
        term.write("Config Menu")
        
        local modeStr = "[EDIT:" .. currentMode .. "]"
        term.setCursorPos(w - #modeStr + 1, 1); term.setTextColor(modeColor); term.write(modeStr)
        
        term.setCursorPos(1,2); term.setTextColor(colors.gray)
        term.write(string.rep("-", w))
        
        term.setTextColor(colors.white)
        term.setCursorPos(4, 6); term.write("Gravity :")
        term.setCursorPos(4, 8); term.write("Drag(L) :")
        
        term.setCursorPos(w-10, h); term.setTextColor(colors.gray); term.write("TAB: Save")
        for _, f in pairs(configFields) do f:paint() end
    else

        term.setCursorPos(1,1); term.setTextColor(colors.yellow)
        term.write("Fire Control")
        
        local modeStr = "[SHELL:" .. currentMode .. "]"
        term.setCursorPos(w - #modeStr + 1, 1); term.setTextColor(modeColor); term.write(modeStr)
        
        term.setCursorPos(1,2); term.setTextColor(colors.gray)
        term.write(string.rep("-", w))
        
        term.setTextColor(colors.white)
        term.setCursorPos(2,3); term.write("Charges:") 
        term.setCursorPos(2,4); term.write("Barrel :") 
        
        term.setCursorPos(1, 7); term.setTextColor(colors.lightGray)
        term.write(" #  | Name     | High")
        term.setCursorPos(1, 8); term.setTextColor(colors.gray)
        term.write(string.rep("-", w))
        
        for i, c in ipairs(cannons) do
            local y = 7 + i 
            if y > h-1 then break end 
            term.setCursorPos(2, y); term.setTextColor(colors.gray)
            term.write(string.format("%d  |", i))
            term.setCursorPos(16, y); term.write("|")
        end
        
        term.setCursorPos(w-9, h); term.setTextColor(colors.gray); term.write("TAB: Conf")
        for _, f in pairs(mainFields) do f:paint() end
    end
    
    if not activeField and not isConfigMode then
        term.setCursorPos(1, h); term.setTextColor(colors.gray); term.write("Press 'C' to clean")
    end

    if activeField then
        term.setTextColor(colors.white) 
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
    mon.setBackgroundColor(colors.black); mon.clear()
    
    local activeShell = shellData[currentMode]
    local nVal, kVal = tonumber(gunParams.n) or 0, tonumber(gunParams.k) or 0
    local gVal, lVal = tonumber(activeShell.g) or 0.05, tonumber(activeShell.lambda) or 0.01
    local velocity = nVal * 2 
    
    mon.setCursorPos(1, 1); mon.setTextColor(colors.gray)
    mon.write("NAME    " .. currentMode .. "   DIST  MAX(Ang)") 
    
    for i, c in ipairs(cannons) do
        local y = i + 1 
        if y > h then break end
        
        local config = cannonConfigs[c.id]
        local hVal = tonumber(config.h) or 0
        local name = config.name
        if #name > 7 then name = string.sub(name, 1, 7) end
        
        mon.setCursorPos(1, y); mon.setTextColor(colors.white); mon.write(name)
        
        local pitch = 0; pcall(function() pitch = c.hw.getPitch() end)
        mon.setCursorPos(9, y); mon.setTextColor(colors.lightBlue); mon.write(string.format("%4.1f", pitch))
        mon.setCursorPos(15, y)
        if nVal > 0 then
            local dist = solveDistance(pitch, velocity, kVal, hVal, gVal, lVal)
            if dist > 0 then mon.setTextColor(colors.lime); mon.write(string.format("%.0fm", dist))
            else mon.setTextColor(colors.red); mon.write("MISS") end
            local maxD, bestA = findMaxRange(velocity, kVal, hVal, gVal, lVal)
            mon.setCursorPos(21, y); mon.setTextColor(colors.yellow); mon.write(string.format("%.0f(%.0f)", maxD, bestA))
        else mon.setTextColor(colors.gray); mon.write("WAIT") end
    end
end

-- ==========================================
-- 程序入口
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
            local redInput = redstone.getInput("front")
            local newMode = redInput and "HE" or "AP"
            
            if newMode ~= currentMode then
                currentMode = newMode
                activeField = nil
                saveConfig() 
                initFields() 
                shouldRedrawTerm = true
            end
            
            drawMonitor() 
            if not activeField then drawTerminal() end
            timerId = os.startTimer(0.1)
            
        elseif evt == "mouse_click" then
            local x, y = e[3], e[4]
            activeField = nil 
            local currentList = isConfigMode and configFields or mainFields
            for _, f in pairs(currentList) do
                if y == f.y and x >= f.x and x < f.x + f.len then
                    if f:click(x, y) then shouldRedrawTerm = true end
                    break
                end
            end
            shouldRedrawTerm = true
            
        elseif evt == "key" then
            local key = e[2]
            if key == keys.tab then
                activeField = nil
                saveConfig() 
                isConfigMode = not isConfigMode
                shouldRedrawTerm = true
            elseif activeField then
                if activeField:inputKey(key) then saveConfig(); shouldRedrawTerm = true end
            else
                if key == keys.c and not isConfigMode then
                    manualCleanup()
                    scanCannons(); initFields(); shouldRedrawTerm = true
                end
            end
            
        elseif evt == "char" then
            local char = e[2]
            if activeField then
                if activeField:inputChar(char) then saveConfig(); shouldRedrawTerm = true end
            end
            
        elseif evt == "peripheral" or evt == "peripheral_detach" then
            scanCannons(); initFields(); shouldRedrawTerm = true
        end
        
        if shouldRedrawTerm then drawTerminal() end
    end
end

term.clear()
print("System Initializing v20 (Monitor Compact)...")
main()
