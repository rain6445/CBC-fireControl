--[[======================================================================
    火炮主控 v4.2
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
local CONFIG_FILE = ".cbc_config"
local ANGLE_TO_SPEED = 26.6666666666666666667
local MAX_SPEED = 256
-- 移除了硬编码的 INVERT_PITCH，改为由 persistentData 控制

-- 硬件初始化
local gear = peripheral.find("Create_RotationSpeedController")
local cannon = peripheral.find("cbc_cannon_mount")
local modem = peripheral.find("modem")

if not gear then error("Error: Motor not found!") end
if not cannon then error("Error: Cannon not found!") end

-- === 1. 数据结构 ===
local persistentData = {
    n = "1", k = "0", h = "2", channel = "555",
    name = "Cannon-" .. os.getComputerID(),
    highArc = false,
    invert = false -- [新增] 反转设置
}
local tempData = { x = "100" }

local currentMaxRange = 0
local targetPitch = 0
local isAligned = false
local lastCmdSource = "MANUAL" 

-- === 2. 配置管理 ===
local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local file = fs.open(CONFIG_FILE, "r")
        local data = textutils.unserialize(file.readAll())
        file.close()
        if data then
            for k,v in pairs(data) do 
                -- 处理布尔值
                if k == "highArc" or k == "invert" then 
                    persistentData[k] = v 
                else 
                    persistentData[k] = tostring(v) 
                end
            end
        end
    end
end
local function saveConfig()
    local file = fs.open(CONFIG_FILE, "w")
    file.write(textutils.serialize(persistentData))
    file.close()
end
loadConfig()

local currentChannel = tonumber(persistentData.channel) or 555
if modem then modem.open(currentChannel) end

-- === 3. 核心控制 ===
local function resetAngelRange(angle)
    local function copysign(n1, n2) n1=math.abs(n1); return n2>0 and n1 or -n1 end
    if (math.abs(angle) > 180) then
        angle = math.abs(angle) >= 360 and angle % 360 or angle
        return -copysign(360 - math.abs(angle), angle)
    else return angle end
end

local function controlLoop()
    while true do
        local currentPitch = cannon.getPitch()
        local errorVal = 0
        
        -- [修改] 使用 persistentData.invert 动态控制方向
        if persistentData.invert then 
            errorVal = resetAngelRange(targetPitch - currentPitch)
        else 
            errorVal = resetAngelRange(currentPitch - targetPitch) 
        end

        if math.abs(errorVal) < 0.1 then
            gear.setTargetSpeed(0)
            isAligned = true
        else
            isAligned = false
            local speed = math.floor(errorVal * ANGLE_TO_SPEED / 2 + 0.5)
            local function copysign(n1, n2) return n2>0 and math.abs(n1) or -math.abs(n1) end
            if math.abs(speed) > MAX_SPEED then speed = copysign(MAX_SPEED, speed) end
            gear.setTargetSpeed(speed)
        end
        sleep(0.05)
    end
end

-- === 4. 状态广播 ===
local function broadcastStatusLoop()
    while true do
        if modem then
            local statusPayload = {
                protocol = "CBC_STATUS",
                id = os.getComputerID(),
                name = persistentData.name,
                maxRange = currentMaxRange,
                pitch = cannon.getPitch(),
                target = targetPitch,
                aligned = isAligned
            }
            modem.transmit(currentChannel, currentChannel, statusPayload)
        end
        sleep(1)
    end
end

-- === 5. UI 系统 ===
local termUtil = {cpX=1, cpY=1}
local absTextField = {x=1, y=1, len=15, text="", textCorlor="0", backgroundColor="8", isBool=false}

function absTextField:paint() 
    if self.isBool then
        local val = self.table[self.key]
        term.setCursorPos(self.x, self.y)
        term.setTextColor(colors.white)
        
        -- 分别处理 HighArc 和 Invert 的显示逻辑
        if self.key == "highArc" then
            if val then
                term.setBackgroundColor(colors.red); term.write("[HIGH ARC]")
            else
                term.setBackgroundColor(colors.green); term.write("[LOW  ARC]")
            end
        elseif self.key == "invert" then
            if val then
                term.setBackgroundColor(colors.orange); term.write("[ROT:INV]")
            else
                term.setBackgroundColor(colors.blue); term.write("[ROT:NML]")
            end
        end
        term.setBackgroundColor(colors.black)
    else
        local str = ""; local rawVal = self.table[self.key] or ""; local text = tostring(rawVal)
        for i=1, self.len, 1 do local tmp=string.sub(text,i,i); str=str..(#tmp>0 and tmp or " ") end
        if #str<self.len then str=str..string.rep(" ",self.len-#str) end
        term.setCursorPos(self.x,self.y); term.blit(str,string.rep(self.textCorlor,#str),string.rep(self.backgroundColor,#str))
    end
end

function absTextField:inputChar(char)
    if self.isBool then return false end
    local xPos = term.getCursorPos() - self.x + 1; local field = tostring(self.table[self.key] or "")
    if #field < self.len then
        if self.key == "name" or ((char>='0' and char<='9') or char=='.') then
            self.table[self.key] = string.sub(field,1,xPos-1)..char..string.sub(field,xPos,#field)
            termUtil.cpX = termUtil.cpX + 1; return true
        end
    end return false
end

function absTextField:inputKey(key)
    if self.isBool then return false end
    local xPos = term.getCursorPos(); local field = tostring(self.table[self.key] or "")
    if key==259 and xPos>self.x then
        termUtil.cpX=termUtil.cpX-1; self.table[self.key]=string.sub(field,1,termUtil.cpX-self.x)..string.sub(field,termUtil.cpX-self.x+2,#field); return true
    elseif key==262 then termUtil.cpX=math.min(termUtil.cpX+1,self.x+#field)
    elseif key==263 then termUtil.cpX=math.max(termUtil.cpX-1,self.x) end return false
end

function absTextField:click(x,y) 
    if self.isBool then
        self.table[self.key] = not self.table[self.key]
        return true
    else
        termUtil.cpX=math.min(x,self.x+#tostring(self.table[self.key] or "")); termUtil.cpY=y; return true 
    end
end

local function newTextField(tbl, key, x, y, len) return setmetatable({table=tbl,key=key,x=x,y=y,len=len,isBool=false},{__index=absTextField}) end
local function newToggle(tbl, key, x, y) return setmetatable({table=tbl,key=key,x=x,y=y,len=9,isBool=true},{__index=absTextField}) end

-- === 6. 弹道解算 ===
local function height(t, x, n, k, h)
    local rad = t * math.pi / 180; local cosv = math.cos(rad)
    if cosv == 0 then return nil end
    local sec = 1 / cosv; local inner = 1 - ((x * sec) - k) / (100 * n)
    if inner <= 0 then return nil end
    return ((14 * sec) / n + math.tan(rad)) * x + 1400 * math.log(inner) - (14 * k) / n + h
end
local function solveBisection(x, n, k, h, a, b)
    local fa = height(a, x, n, k, h); local fb = height(b, x, n, k, h)
    if not fa or not fb or fa * fb > 0 then return nil end
    for i = 1, 40 do
        local m = 0.5 * (a + b); local fm = height(m, x, n, k, h)
        if not fm then b=m; fb=fm elseif fa*fm <= 0 then b=m; fb=fm else a=m; fa=fm end
    end return 0.5 * (a + b)
end
local function findSolutions(x, n, k, h)
    local sols = {}; local prevT, prevY = nil, nil
    for t = -10, 45, 1 do
        local y = height(t, x, n, k, h)
        if y then
            if prevY and prevY * y < 0 then
                local root = solveBisection(x, n, k, h, prevT, t)
                if root and root >= -10 and root <= 45 then table.insert(sols, root) end
            end prevT, prevY = t, y
        else prevT, prevY = nil, nil end
    end
    table.sort(sols)
    return sols
end
local function calculateMaxRange(n, k, h)
    local minDist, maxDist = 0, 100 * n + k
    for i = 1, 15 do
        local mid = (minDist + maxDist) / 2
        if #findSolutions(mid, n, k, h) > 0 then minDist = mid else maxDist = mid end
    end return minDist
end

-- === 7. UI 主循环 ===
local function runUI()
    local fieldTb = {
        n = newTextField(persistentData, "n", 6, 3, 6),
        k = newTextField(persistentData, "k", 6, 4, 6),
        h = newTextField(persistentData, "h", 6, 5, 6),
        ch = newTextField(persistentData, "channel", 28, 3, 5),
        nm = newTextField(persistentData, "name", 28, 4, 10),
        x = newTextField(tempData, "x", 9, 8, 8),
        arc = newToggle(persistentData, "highArc", 22, 8),
        -- [新增] 反转按钮，放置在第6行的分隔线上，位置 x=28
        inv = newToggle(persistentData, "invert", 28, 6) 
    }
    
    term.clear(); term.setCursorBlink(true)
    
    local function redraw()
        term.setBackgroundColor(colors.black); term.setTextColor(colors.white)
        term.clear()
        
        -- Header
        term.setCursorPos(1,1); term.clearLine()
        term.setTextColor(colors.yellow); term.write("=== CBC Fire Control v4.2 ===")
        term.setTextColor(colors.white)
        
        -- Wireless
        term.setCursorPos(35, 1)
        if modem then term.setTextColor(colors.blue); term.write("[W]")
        else term.setTextColor(colors.red); term.write("[X]") end

        -- Layout Labels
        term.setTextColor(colors.lightGray)
        term.setCursorPos(2,3); term.write("n: "); term.setCursorPos(2,4); term.write("k: "); term.setCursorPos(2,5); term.write("h: ")
        term.setCursorPos(18,3); term.write("| Ch: "); term.setCursorPos(18,4); term.write("| Id: ")
        
        -- Separator Line
        term.setCursorPos(1,6); term.write(string.rep("-", 39))
        
        term.setCursorPos(2,8); term.write("Dist X: ")
        
        -- Paint Fields (Buttons will overlay the separator line if needed)
        for _, v in pairs(fieldTb) do v:paint() end
        
        local nVal, kVal, hVal = tonumber(persistentData.n), tonumber(persistentData.k), tonumber(persistentData.h)
        local xVal, chVal = tonumber(tempData.x), tonumber(persistentData.channel)

        if chVal and chVal ~= currentChannel then
            if modem then modem.close(currentChannel); modem.open(chVal) end
            currentChannel = chVal; saveConfig()
        end

        if nVal and kVal and hVal and nVal > 0 then
            currentMaxRange = calculateMaxRange(nVal, kVal, hVal)
            term.setCursorPos(18,5); term.setTextColor(colors.cyan)
            term.write(string.format("| Max: %.0f", currentMaxRange))
        end

        term.setCursorPos(2, 10); term.setTextColor(colors.white); term.write("Sol: ")
        if nVal and kVal and hVal and xVal and nVal > 0 then
            saveConfig()
            local sols = findSolutions(xVal, nVal, kVal, hVal)
            if #sols > 0 then
                if persistentData.highArc then targetPitch = sols[#sols] else targetPitch = sols[1] end
                
                term.setTextColor(colors.white)
                term.write(string.format("%.2f deg", targetPitch))
                
                if #sols > 1 then
                    term.setTextColor(colors.gray); term.write(string.format(" (%d opts)", #sols))
                end
            else
                term.setTextColor(colors.red); term.write("Out of Reach / Limit")
            end
        else term.setTextColor(colors.gray); term.write("Waiting Input...") end
        
        -- Footer
        term.setCursorPos(1, 12); term.setBackgroundColor(colors.gray); term.clearLine()
        
        local statusText = isAligned and "READY" or "MOVING"
        if isAligned then term.setTextColor(colors.lime) else term.setTextColor(colors.orange) end
        
        term.write(string.format(" %s ", statusText))
        term.setTextColor(colors.lightGray)
        term.write(string.format("P:%.1f ", cannon.getPitch()))
        term.write(string.format("[%s]", lastCmdSource))

        term.setBackgroundColor(colors.black); term.setTextColor(colors.white)
        term.setCursorPos(termUtil.cpX, termUtil.cpY)
    end

    redraw()
    
    while true do
        local eventData = {os.pullEvent()}
        local event = eventData[1]
        local shouldRedraw = false
        
        if event == "modem_message" then
            local ch, msg = eventData[3], eventData[5]
            if ch == currentChannel and type(msg) == "table" and msg.protocol == "CBC_CMD" then
                local isForMe = false
                if not msg.targetName or msg.targetName == "" or msg.targetName == "*" then
                    isForMe = true; lastCmdSource = "NET-ALL"
                elseif msg.targetName == persistentData.name then
                    isForMe = true; lastCmdSource = "NET-ONE"
                end
                
                if isForMe and msg.distance then
                    tempData.x = tostring(msg.distance)
                    shouldRedraw = true
                end
            end
        elseif event == "mouse_click" then
            local x,y = eventData[3], eventData[4]
            for _,v in pairs(fieldTb) do 
                if y==v.y and x>=v.x and x<=v.x+v.len then 
                    v:click(x,y); lastCmdSource="MANUAL"; shouldRedraw=true 
                end 
            end
        elseif event == "key" then
            for _,v in pairs(fieldTb) do if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then if v:inputKey(eventData[2]) then lastCmdSource="MANUAL"; shouldRedraw=true end end end
            shouldRedraw = true
        elseif event == "char" then
             for _,v in pairs(fieldTb) do if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then if v:inputChar(eventData[2]) then lastCmdSource="MANUAL"; shouldRedraw=true end end end
        end
        if shouldRedraw then redraw() end
    end
end

parallel.waitForAll(runUI, controlLoop, broadcastStatusLoop)
