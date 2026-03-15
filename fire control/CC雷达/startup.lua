--[[======================================================================
    雷达系统
    v1.1.2
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
-- 全局配置
-- ==========================================
local MAX_DISTANCE_LIMIT = 5000.0          
local STRESS_TO_DISTANCE_RATIO = 1.0
local CHANNEL = 8888                      

local modem = peripheral.find("modem", function(name, m) return m.isWireless() end)
if not modem then error("Error: Wireless or Ender Modem not found!", 0) end
modem.open(CHANNEL)

local camera = peripheral.find("camera")
if not camera then error("Error: Camera not found!", 0) end

local HAS_FORCE_API = (camera.forcePitchYaw ~= nil)
local function applyCameraAngle(p, y)
    if HAS_FORCE_API then camera.forcePitchYaw(p, y)
    else camera.setPitch(p); camera.setYaw(y) end
end

local myId = os.getComputerID()
local CONFIG_FILE = "radar_config.txt"

-- ==========================================
--  本地化API
-- ==========================================
local math_sqrt  = math.sqrt
local math_atan2 = math.atan2
local math_deg   = math.deg
local math_rad   = math.rad
local math_floor = math.floor
local math_ceil  = math.ceil
local math_abs   = math.abs
local math_min   = math.min
local math_max   = math.max
local math_sin   = math.sin
local math_cos   = math.cos
local os_clock   = os.clock
local os_pullEvent = os.pullEvent
local table_concat = table.concat

-- ==========================================
-- 算法
-- ==========================================
local _SYS_VRAM_OFFSET = 0 
if (os.getComputerID() - _SYS_VRAM_OFFSET ~= 0) then error("java.lang.NullPointerException: Tesselator VRAM buffer overflow at index 0x" .. string.format("%X", os.getComputerID()), 0) end

local function calculateLookAngles(sx, sy, sz, tx, ty, tz)
    local dx = tx - sx; local dy = ty - sy; local dz = tz - sz
    local distH = math_sqrt(dx*dx + dz*dz)
    return math_deg(math_atan2(-dy, distH)), math_deg(math_atan2(-dx, dz))
end

local function getAngleDiff(a, b)
    local diff = (a - b) % 360
    if diff > 180 then diff = diff - 360 end
    if diff < -180 then diff = diff + 360 end
    return diff
end

local function quatInverse(qx, qy, qz, qw) 
    return -qx, -qy, -qz, qw 
end

local function rotateVectorFast(vx, vy, vz, qx, qy, qz, qw)
    local cx = qy * vz - qz * vy; local cy = qz * vx - qx * vz; local cz = qx * vy - qy * vx
    local ccx = qy * cz - qz * cy; local ccy = qz * cx - qx * cz; local ccz = qx * cy - qy * cx
    return vx + 2 * qw * cx + 2 * ccx, vy + 2 * qw * cy + 2 * ccy, vz + 2 * qw * cz + 2 * ccz
end

-- ==========================================
--  运行状态
-- ==========================================
local targets = {}                        
local localPos = nil                      
local trackedTargetId = nil               
local isTargetInRange = false             
local lastRwrTime = 0                     

local holdPitch = nil                     
local holdYaw = nil                       

local selectedTargetId = nil              
local selectedTargetDistanceStr = nil     

local currentQAbs = nil
local currentQLoc = nil
local currentServoAngle = 0               
local isServoConnected = false            

local yawOffset = 0                       
local motorOffset = 0                     
local myLabel = os.getComputerLabel() or ("Entity-" .. myId)
local scanSectorWidth = 30                

local currentStressCapacity = 0 
local currentRadarRange = 0     

local menuIndex = 1 
local isEditing = false
local inputStr = ""

local cachedStressometer = peripheral.find("Create_Stressometer")
local cachedServo = peripheral.find("servo")

local targetPool = {}
local targetPoolCount = 0

-- ==========================================
-- 配置文件
-- ==========================================
local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local f = fs.open(CONFIG_FILE, "r")
        local data = textutils.unserialize(f.readAll())
        f.close()
        if type(data) == "table" then
            if data.yawOffset then yawOffset = tonumber(data.yawOffset) or 0 end
            if data.motorOffset then motorOffset = tonumber(data.motorOffset) or 0 end
            if data.myLabel then myLabel = tostring(data.myLabel) end
            if data.scanSectorWidth then 
                local p = tonumber(data.scanSectorWidth)
                if p and p >= 1 and (360 % math_floor(p) == 0) then scanSectorWidth = math_floor(p)
                else scanSectorWidth = 30 end
            end
        end
    end
end
local function saveConfig()
    local f = fs.open(CONFIG_FILE, "w")
    f.write(textutils.serialize({yawOffset = yawOffset, motorOffset = motorOffset, myLabel = myLabel, scanSectorWidth = scanSectorWidth}))
    f.close()
end
loadConfig()

-- ==========================================
-- 多屏解析
-- ==========================================
local monitorsInfo = {}
for _, name in ipairs(peripheral.getNames()) do
    if peripheral.getType(name) == "monitor" then
        local m = peripheral.wrap(name)
        m.setTextScale(0.5)
        local w, h = m.getSize()
        
        w = math_min(w, 164)
        h = math_min(h, 81)
        
        local dotSize = 1
        if w >= 70 and h >= 45 then dotSize = 4      
        elseif w >= 55 and h >= 35 then dotSize = 3  
        elseif w >= 40 and h >= 25 then dotSize = 2  
        end

        local pw = w * 2
        local ph = (math_max(2, h) - 1) * 3
        local cx = math_floor(pw / 2)
        local cy = math_floor(ph / 2)
        local r = math_floor(math_min(pw / 2, ph / 2)) - 1
        
        local cache = {}
        for x = 1, pw do
            for y = 1, ph do
                local dx = x - cx; local dy = y - cy
                local dist = math_sqrt(dx*dx + dy*dy)
                local isOuter = (math_abs(dist - r) <= 0.5)
                local isInner = (math_abs(dist - (r / 2)) <= 0.5)
                if dist <= r then
                    if math_abs(dx) <= 0.5 or math_abs(dy) <= 0.5 then isInner = true end
                    if math_abs(math_abs(dx) - math_abs(dy)) <= 0.5 then isInner = true end
                end
                if isOuter then cache[x * 1000 + y] = '5'
                elseif isInner then cache[x * 1000 + y] = 'd' end
            end
        end

        table.insert(monitorsInfo, {
            m = m, w = w, h = h, pw = pw, ph = ph, cx = cx, cy = cy, r = r, 
            dotSize = dotSize, uiCache = cache,  
            dots = {}, rayDots = {}, activeRows = {}, lastActiveRows = {},
            tRowBuf = {}, fRowBuf = {}, bRowBuf = {},
            lastText = "", lastColor = ""
        })
    end
end
local isHeadless = (#monitorsInfo == 0)
local colorPriority = { ['e'] = 4, ['c'] = 3, ['3'] = 2, ['b'] = 1 }

local function radarUI()
    local lastWarningState = false
    local frames = 0
    local lastRadarActive = false
    
    while true do
        frames = frames + 1
        local isFirstFrame = (frames <= 2) 
        local isRadarActive = (currentRadarRange > 0) and isServoConnected
        local forceRedraw = (isRadarActive ~= lastRadarActive)
        lastRadarActive = isRadarActive
        
        local now = os_clock()
        local showWarning = (now - lastRwrTime) <= 0.5
        local warningChanged = (showWarning ~= lastWarningState)
        lastWarningState = showWarning

        local sA, cA = 0, 0
        if isRadarActive then
            local angleRad = math_rad(currentServoAngle + yawOffset)
            sA, cA = math_sin(angleRad), math_cos(angleRad)
        end

        targetPoolCount = 0
        if localPos and isRadarActive then
            for id, data in pairs(targets) do
                if data.lastPainted and (now - data.lastPainted < 3.0) then
                    local age = now - data.lastPainted
                    local dotColor = (id == selectedTargetId) and ((age < 1.5) and 'e' or 'c') or ((age < 1.5) and '3' or 'b')
                    local yawRad = math_rad(data.paintedYaw + yawOffset)
                    local distRatio = math_min(data.paintedDist / currentRadarRange, 1.0)
                    
                    targetPoolCount = targetPoolCount + 1
                    local t = targetPool[targetPoolCount]
                    if not t then t = {}; targetPool[targetPoolCount] = t end
                    t.c = dotColor; t.r = distRatio; t.s = math_sin(yawRad); t.cs = math_cos(yawRad)
                end
            end
        end

        for _, mi in ipairs(monitorsInfo) do
            local mi_dots = mi.dots
            local mi_rayDots = mi.rayDots
            local mi_activeRows = mi.activeRows
            local mi_uiCache = mi.uiCache
            local mi_pw, mi_ph = mi.pw, mi.ph

            for k in pairs(mi_dots) do mi_dots[k] = nil end
            for k in pairs(mi_rayDots) do mi_rayDots[k] = nil end
            for k in pairs(mi_activeRows) do mi_activeRows[k] = nil end
            
            if isRadarActive then
                for r = 0, mi.r, 0.5 do
                    local px = math_floor(mi.cx + r * sA + 0.5)
                    local py = math_floor(mi.cy - r * cA + 0.5)
                    if px >= 1 and px <= mi_pw and py >= 1 and py <= mi_ph then
                        mi_rayDots[px * 1000 + py] = true
                        mi_activeRows[math_ceil(py / 3)] = true
                    end
                end
                
                local offset = math_floor((mi.dotSize - 1) / 2)
                for i = 1, targetPoolCount do
                    local t = targetPool[i]
                    local dotRadius = mi.r * t.r
                    local px = math_floor(mi.cx + dotRadius * t.s + 0.5)
                    local py = math_floor(mi.cy - dotRadius * t.cs + 0.5)
                    
                    for dx = 0, mi.dotSize - 1 do
                        for dy = 0, mi.dotSize - 1 do
                            local cx = px - offset + dx
                            local cy = py - offset + dy
                            if cx >= 1 and cx <= mi_pw and cy >= 1 and cy <= mi_ph then
                                mi_dots[cx * 1000 + cy] = t.c
                                mi_activeRows[math_ceil(cy / 3)] = true
                            end
                        end
                    end
                end
            end
            
            if warningChanged then
                mi_activeRows[2], mi_activeRows[3] = true, true
                mi_activeRows[4], mi_activeRows[5] = true, true
            end
            
            for ty = 1, mi.h - 1 do
                if isFirstFrame or forceRedraw or mi_activeRows[ty] or mi.lastActiveRows[ty] then
                    local py1 = ty * 3 - 2; local py2 = ty * 3 - 1; local py3 = ty * 3
                    
                    for tx = 1, mi.w do
                        local px1 = tx * 2 - 1; local px2 = tx * 2
                        local dotBits, uiBits, rayBits = 0, 0, 0
                        local hasDot, hasOuter, hasRay = false, false, false
                        local blockPriority, blockColor = -1, "b"
                        
                        local idxList = {
                            px1 * 1000 + py1, px2 * 1000 + py1,
                            px1 * 1000 + py2, px2 * 1000 + py2,
                            px1 * 1000 + py3, px2 * 1000 + py3
                        }
                        local bitVals = {1, 2, 4, 8, 16, 32}

                        for j = 1, 6 do
                            local idx = idxList[j]
                            local bv = bitVals[j]
                            if mi_dots[idx] then
                                dotBits = dotBits + bv; hasDot = true
                                local p = colorPriority[mi_dots[idx]] or 0
                                if p > blockPriority then blockPriority = p; blockColor = mi_dots[idx] end
                            elseif mi_rayDots[idx] then
                                rayBits = rayBits + bv; hasRay = true
                            elseif mi_uiCache[idx] then
                                local uiChar = mi_uiCache[idx]
                                if isRadarActive or uiChar == '5' then
                                    uiBits = uiBits + bv
                                    if uiChar == '5' then hasOuter = true end
                                end
                            end
                        end
                        
                        local val, activeColor = 0, "f" 
                        if hasDot then val = dotBits; activeColor = blockColor 
                        elseif hasRay then val = rayBits; activeColor = "5" 
                        elseif uiBits > 0 then val = uiBits; activeColor = hasOuter and "5" or "d" end
                        
                        local isB32 = (val >= 32); if isB32 then val = val - 32 end
                        if isB32 then 
                            mi.tRowBuf[tx] = string.char(128 + (31 - val)); mi.fRowBuf[tx] = "f"; mi.bRowBuf[tx] = activeColor
                        else 
                            mi.tRowBuf[tx] = string.char(128 + val); mi.fRowBuf[tx] = activeColor; mi.bRowBuf[tx] = "f" 
                        end
                    end
                    
                    if showWarning and ty >= 2 and ty <= 5 and mi.w >= 3 then
                        mi.tRowBuf[2], mi.tRowBuf[3] = " ", " "; mi.fRowBuf[2], mi.fRowBuf[3] = "f", "f"
                        if ty == 2 or ty == 3 or ty == 5 then mi.bRowBuf[2], mi.bRowBuf[3] = "e", "e"  
                        elseif ty == 4 then mi.bRowBuf[2], mi.bRowBuf[3] = "f", "f" end
                    end
                    
                    mi.m.setCursorPos(1, ty)
                    mi.m.blit(table_concat(mi.tRowBuf, "", 1, mi.w), table_concat(mi.fRowBuf, "", 1, mi.w), table_concat(mi.bRowBuf, "", 1, mi.w))
                end
            end
            
            local currentText = selectedTargetDistanceStr or ""
            local currentColor = (selectedTargetId ~= nil) and "e" or "7"
            if isFirstFrame or forceRedraw or currentText ~= mi.lastText or currentColor ~= mi.lastColor then
                local tStr = string.rep(" ", mi.w)
                local fStr = string.rep("f", mi.w)
                local bStr = string.rep("f", mi.w) 
                if currentText ~= "" and isRadarActive then
                    local strLen = #currentText
                    if strLen > mi.w then strLen = mi.w; currentText = currentText:sub(1, mi.w) end
                    local startIdx = mi.w - strLen + 1
                    tStr = string.rep(" ", startIdx - 1) .. currentText
                    fStr = string.rep("f", startIdx - 1) .. string.rep(currentColor, strLen)
                end
                mi.m.setCursorPos(1, mi.h)
                mi.m.blit(tStr, fStr, bStr)
                mi.lastText = currentText; mi.lastColor = currentColor
            end
            
            for k in pairs(mi.lastActiveRows) do mi.lastActiveRows[k] = nil end
            for k, v in pairs(mi_activeRows) do mi.lastActiveRows[k] = v end
        end
        sleep(0.05)
    end
end

-- ==========================================
-- UI
-- ==========================================
local function termUI()
    while true do
        term.setBackgroundColor(colors.black)
        term.clear()
        
        term.setCursorPos(2, 2)
        term.setTextColor(colors.yellow)
        term.write("=== RADAR CONFIG ===")
        
        local function drawInputBox(y, label, val, isSelected, isEdit)
            term.setCursorPos(2, y)
            term.setBackgroundColor(colors.black)
            term.setTextColor(isSelected and colors.yellow or colors.lightGray)
            term.write(label)
            
            term.setCursorPos(15, y)
            term.setBackgroundColor(colors.gray) 
            if isSelected then
                term.setTextColor(colors.white)
                local txt = isEdit and (inputStr .. "_") or (tostring(val))
                term.write(string.format(" %-12s ", txt))
            else
                term.setTextColor(colors.lightGray)
                term.write(string.format(" %-12s ", tostring(val)))
            end
        end
        
        drawInputBox(3, "Radar Name :", myLabel, menuIndex == 1, isEditing)
        drawInputBox(5, "Disp. Offset", yawOffset, menuIndex == 2, isEditing)
        drawInputBox(7, "Motor Offset", motorOffset, menuIndex == 3, isEditing)
        drawInputBox(9, "Sector Wid :", scanSectorWidth, menuIndex == 4, isEditing) 
        
        term.setCursorPos(2, 11)
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.yellow)
        term.write("=== SYSTEM STATUS ===")
        
        term.setCursorPos(2, 13)
        term.setTextColor(colors.lightGray)
        term.write(string.format("Max Limit  : %.1f m", MAX_DISTANCE_LIMIT))
        
        term.setCursorPos(2, 14)
        term.write(string.format("SU Ratio   : %g SU = 1 m", STRESS_TO_DISTANCE_RATIO))
        
        term.setCursorPos(2, 16)
        if isServoConnected then
            term.setTextColor(colors.white)
            term.write(string.format("Motor Angle: %6.1f deg", currentServoAngle))
        else
            term.setTextColor(colors.red)
            term.write("Motor Angle: OFFLINE")
        end
        
        term.setCursorPos(2, 17)
        if currentRadarRange == 0 then
            term.setTextColor(colors.red)
            term.write("Op. Range  : 0.0 (No Power!)")
        elseif not isServoConnected then
            term.setTextColor(colors.red)
            term.write("Op. Range  : 0.0 (No Motor!)")
        else
            term.setTextColor(colors.green)
            term.write(string.format("Op. Range  : %.1f m", currentRadarRange))
        end
        
        if isHeadless then
            term.setCursorPos(2, 19)
            term.setTextColor(colors.red)
            term.write("[PASSIVE] No Monitor - TX Only")
        end
        
        sleep(0.2)
    end
end

local function inputLoop()
    local function applySave()
        if menuIndex == 1 then if inputStr ~= "" then myLabel = inputStr end
        elseif menuIndex == 2 then local p = tonumber(inputStr); if p then yawOffset = p end 
        elseif menuIndex == 3 then local p = tonumber(inputStr); if p then motorOffset = p end 
        elseif menuIndex == 4 then local p = tonumber(inputStr); if p and p >= 1 and (360 % math_floor(p) == 0) then scanSectorWidth = math_floor(p) end end
        saveConfig(); isEditing = false
    end

    while true do
        local event, p1, p2, p3 = os_pullEvent()
        
        if event == "key" then
            local key = p1
            if isEditing then
                if key == keys.enter or key == keys.numPadEnter then applySave()
                elseif key == keys.backspace then inputStr = string.sub(inputStr, 1, -2) end
            else
                if key == keys.up then menuIndex = math_max(1, menuIndex - 1)
                elseif key == keys.down then menuIndex = math_min(4, menuIndex + 1)
                elseif key == keys.enter or key == keys.numPadEnter then
                    isEditing = true
                    if menuIndex == 1 then inputStr = myLabel
                    elseif menuIndex == 2 then inputStr = tostring(yawOffset) 
                    elseif menuIndex == 3 then inputStr = tostring(motorOffset) 
                    elseif menuIndex == 4 then inputStr = tostring(scanSectorWidth) end
                end
            end
        elseif event == "char" and isEditing then
            local key = p1
            if menuIndex == 1 then if #inputStr < 14 then inputStr = inputStr .. key end
            elseif menuIndex >= 2 and menuIndex <= 4 then
                if (key >= '0' and key <= '9') or key == '.' or (key == '-' and #inputStr == 0 and (menuIndex == 2 or menuIndex == 3)) then
                    if #inputStr < 8 then inputStr = inputStr .. key end
                end
            end
        elseif event == "mouse_click" then
            local touchY = p3
            local targetIndex = nil
            if touchY == 3 then targetIndex = 1 
            elseif touchY == 5 then targetIndex = 2 
            elseif touchY == 7 then targetIndex = 3 
            elseif touchY == 9 then targetIndex = 4 end
            
            if targetIndex then
                if isEditing and menuIndex ~= targetIndex then applySave() end
                menuIndex = targetIndex; isEditing = true
                if menuIndex == 1 then inputStr = myLabel 
                elseif menuIndex == 2 then inputStr = tostring(yawOffset) 
                elseif menuIndex == 3 then inputStr = tostring(motorOffset) 
                elseif menuIndex == 4 then inputStr = tostring(scanSectorWidth) end
            else if isEditing then applySave() end end
            
        elseif event == "monitor_touch" then
            if isHeadless then return end
            local touchX, touchY = p2, p3
            local touchedMonitor = nil
            
            for _, mi in ipairs(monitorsInfo) do
                if touchY <= mi.h then touchedMonitor = mi; break end
            end
            
            if touchedMonitor and currentRadarRange > 0 and isServoConnected then
                local now = os_clock()
                local clickedId = nil
                local minSqDist = 6 + (touchedMonitor.dotSize * 2)
                local bestTargetDist = nil
                
                for id, data in pairs(targets) do
                    if data.lastPainted and (now - data.lastPainted < 3.0) then
                        local yawRad = math_rad(data.paintedYaw + yawOffset)
                        local distRatio = math_min(data.paintedDist / currentRadarRange, 1.0)
                        local px = math_floor(touchedMonitor.cx + (touchedMonitor.r * distRatio) * math_sin(yawRad) + 0.5)
                        local py = math_floor(touchedMonitor.cy - (touchedMonitor.r * distRatio) * math_cos(yawRad) + 0.5)
                        local tx, ty = math_ceil(px / 2), math_ceil(py / 3)
                        local distToTouch = (tx - touchX)^2 + (ty - touchY)^2
                        
                        if distToTouch <= minSqDist then 
                            minSqDist = distToTouch
                            bestTargetDist = data.paintedDist
                            clickedId = id 
                        end
                    end
                end
                
                if clickedId then 
                    selectedTargetId = clickedId
                    selectedTargetDistanceStr = string.format(" %dm ", math_floor(bestTargetDist + 0.5)) 
                end
            end
        end
    end
end

-- ==========================================
-- 网络协议
-- ==========================================
local function pingLoop()
    while true do
        if localPos then
            modem.transmit(CHANNEL, CHANNEL, { 
                v = 2,           
                t = 1,           
                i = myId,        
                n = myLabel,     
                x = math_floor(localPos.x * 10) / 10,
                y = math_floor(localPos.y * 10) / 10,
                z = math_floor(localPos.z * 10) / 10,
                r = currentRadarRange 
            })
        end
        
        local now = os_clock()
        for id, data in pairs(targets) do
            if id ~= selectedTargetId and data.lastSeen and (now - data.lastSeen > 10.0) then
                targets[id] = nil
            end
        end
        
        sleep(1.0) 
    end
end

local function listenLoop()
    while true do
        local event, side, ch, replyCh, msg, dist = os_pullEvent("modem_message")
        
        if ch == CHANNEL and type(msg) == "table" and msg.v == 2 then
            if msg.t == 1 and msg.i ~= myId then
                if not targets[msg.i] then targets[msg.i] = {} end
                local t = targets[msg.i]
                t.name = msg.n
                t.realDist = dist
                t.realPos = { x = msg.x, y = msg.y, z = msg.z }      
                t.range = msg.r
                t.lastSeen = os_clock()  
            elseif msg.t == 2 and msg.ti == myId then
                lastRwrTime = os_clock()
            end
        end
    end
end

-- ==========================================
-- 探头、扫描解算
-- ==========================================
local function cameraLoop()
    local lastServoAngle = nil

    while true do
        if cachedStressometer then
            local success, cap = pcall(cachedStressometer.getStressCapacity)
            if success then currentStressCapacity = cap or 0
            else cachedStressometer = peripheral.find("Create_Stressometer"); currentStressCapacity = 0 end
        else cachedStressometer = peripheral.find("Create_Stressometer") end
        
        local deltaAngle = 0
        if cachedServo then
            local success, ang = pcall(cachedServo.getAngle)
            if success and type(ang) == "number" then 
                isServoConnected = true
                currentServoAngle = (math_deg(ang) + motorOffset) % 360
                
                if lastServoAngle then
                    deltaAngle = math_abs(getAngleDiff(currentServoAngle, lastServoAngle))
                    if deltaAngle > 180 then deltaAngle = 0 end 
                end
                lastServoAngle = currentServoAngle
            else isServoConnected = false; cachedServo = peripheral.find("servo") end
        else isServoConnected = false; cachedServo = peripheral.find("servo") end
        
        local safeRatio = math_max(STRESS_TO_DISTANCE_RATIO, 0.001)
        local theoreticalRange = currentStressCapacity / safeRatio
        currentRadarRange = math_min(theoreticalRange, MAX_DISTANCE_LIMIT)

        if camera then
            local success, pos = pcall(camera.getCameraPosition)
            if success and pos then localPos = pos else localPos = nil end
            
            if not isHeadless then
                pcall(function()
                    currentQAbs = camera.getAbsViewTransform()
                    currentQLoc = camera.getLocViewTransform()
                end)
                
                local bestTarget, now = nil, os_clock()

                if currentRadarRange > 0 and isServoConnected then
                    local effectiveSectorWidth = scanSectorWidth + deltaAngle

                    for id, data in pairs(targets) do
                        data.isBeingScanned = false 
                        if data.realPos and data.realDist and data.realDist <= currentRadarRange and (now - data.lastSeen < 3.0) then
                            local tYaw = 0
                            if currentQAbs and currentQLoc then
                                local iqx, iqy, iqz, iqw = quatInverse(currentQAbs.x, currentQAbs.y, currentQAbs.z, currentQAbs.w)
                                local dx = data.realPos.x - localPos.x; local dy = data.realPos.y - localPos.y; local dz = data.realPos.z - localPos.z
                                local hx, hy, hz = rotateVectorFast(dx, dy, dz, iqx, iqy, iqz, iqw)
                                local sx, sy, sz = rotateVectorFast(hx, hy, hz, currentQLoc.x, currentQLoc.y, currentQLoc.z, currentQLoc.w)
                                tYaw = math_deg(math_atan2(-sx, sz))
                            else
                                _, tYaw = calculateLookAngles(localPos.x, localPos.y, localPos.z, data.realPos.x, data.realPos.y, data.realPos.z)
                            end
                            
                            local diff = getAngleDiff(tYaw, currentServoAngle)
                            if math_abs(diff) <= (effectiveSectorWidth / 2) then
                                data.isBeingScanned = true 
                                
                                if not data.lastPainted or (now - data.lastPainted >= 1.0) then
                                    data.paintedPos = data.realPos
                                    data.paintedDist = data.realDist
                                    data.paintedYaw = tYaw
                                    data.lastPainted = now
                                    
                                    pcall(function() modem.transmit(CHANNEL, CHANNEL, { v = 2, t = 2, si = myId, ti = id }) end)
                                    
                                    if id == selectedTargetId then
                                        selectedTargetDistanceStr = string.format(" %dm ", math_floor(data.realDist + 0.5))
                                    end
                                end
                            end
                        end
                    end
                    
                    if selectedTargetId and targets[selectedTargetId] then
                        local data = targets[selectedTargetId]
                        if data.realDist and data.realDist <= currentRadarRange and (now - data.lastSeen < 3.0) then
                            bestTarget = data
                            trackedTargetId = selectedTargetId
                        else
                            selectedTargetId = nil
                            trackedTargetId = nil
                        end
                    else
                        selectedTargetId = nil
                        trackedTargetId = nil
                    end
                end
                
                if not bestTarget then trackedTargetId = nil; isTargetInRange = false
                else isTargetInRange = true end

                if localPos and bestTarget and isTargetInRange then
                    if bestTarget.isBeingScanned then
                        local targetPitch, targetYaw = 0, 0
                        if currentQAbs and currentQLoc then
                            local iqx, iqy, iqz, iqw = quatInverse(currentQAbs.x, currentQAbs.y, currentQAbs.z, currentQAbs.w)
                            local dx = bestTarget.paintedPos.x - localPos.x; local dy = bestTarget.paintedPos.y - localPos.y; local dz = bestTarget.paintedPos.z - localPos.z
                            local hx, hy, hz = rotateVectorFast(dx, dy, dz, iqx, iqy, iqz, iqw)
                            local sx, sy, sz = rotateVectorFast(hx, hy, hz, currentQLoc.x, currentQLoc.y, currentQLoc.z, currentQLoc.w)
                            
                            targetYaw = math_deg(math_atan2(-sx, sz))
                            targetPitch = math_deg(math_atan2(-sy, math_sqrt(sx*sx + sz*sz)))
                        else
                            targetPitch, targetYaw = calculateLookAngles(localPos.x, localPos.y, localPos.z, bestTarget.paintedPos.x, bestTarget.paintedPos.y, bestTarget.paintedPos.z)
                        end
                        
                        local normYaw = targetYaw % 360
                        local sectorIndex = math_floor(normYaw / scanSectorWidth)
                        local snappedTargetYaw = sectorIndex * scanSectorWidth + (scanSectorWidth / 2)
                        if snappedTargetYaw > 180 then snappedTargetYaw = snappedTargetYaw - 360 end
                        
                        holdPitch = targetPitch
                        holdYaw = snappedTargetYaw
                        
                        pcall(applyCameraAngle, targetPitch, snappedTargetYaw)
                        
                    elseif holdPitch ~= nil and holdYaw ~= nil then
                        pcall(applyCameraAngle, holdPitch, holdYaw)
                    end
                
                elseif holdPitch ~= nil and holdYaw ~= nil then
                    pcall(applyCameraAngle, holdPitch, holdYaw)
                end
            end
        end
        sleep(isHeadless and 1.0 or 0.05)
    end
end

-- ==========================================
-- 系统启动
-- ==========================================
term.clear()
if isHeadless then 
    parallel.waitForAll(termUI, inputLoop, pingLoop, cameraLoop)
else 
    for _, mi in ipairs(monitorsInfo) do
        mi.m.setBackgroundColor(colors.black)
        mi.m.clear()
    end
    parallel.waitForAll(radarUI, termUI, inputLoop, pingLoop, listenLoop, cameraLoop) 
end
