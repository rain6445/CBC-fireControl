-- ==========================================
-- 1. 配置与外设初始化 (Hardware Setup)
-- ==========================================
local ANGLE_TO_SPEED = 26.6666666666666666667
local MAX_SPEED = 256
local INVERT_PITCH = false -- 如果方向反了改成 true

-- 查找外设 (增加错误提示)
local gear = peripheral.find("Create_RotationSpeedController")
local cannon = peripheral.find("cbc_cannon_mount")

if not gear then error("Motor not found! Check 'Create_RotationSpeedController'") end
if not cannon then error("Cannon not found! Check 'cbc_cannon_mount'") end

-- 全局控制变量
local targetPitch = 0
local debugSpeed = 0 -- 用于UI显示当前指令速度

-- ==========================================
-- 2. 火炮控制循环 (后台进程)
-- ==========================================
local function resetAngelRange(angle)
    local function copysign(n1, n2)
        n1 = math.abs(n1)
        return n2 > 0 and n1 or -n1
    end
    if (math.abs(angle) > 180) then
        angle = math.abs(angle) >= 360 and angle % 360 or angle
        return -copysign(360 - math.abs(angle), angle)
    else
        return angle
    end
end

local function controlLoop()
    while true do
        local currentPitch = cannon.getPitch()
        
        -- 计算误差
        local errorVal = 0
        if INVERT_PITCH then
            errorVal = resetAngelRange(targetPitch - currentPitch)
        else
            errorVal = resetAngelRange(currentPitch - targetPitch)
        end

        -- 死区检测
        if math.abs(errorVal) < 0.05 then
            gear.setTargetSpeed(0)
            debugSpeed = 0
        else
            -- P控制计算
            local speed = math.floor(errorVal * ANGLE_TO_SPEED / 2 + 0.5)
            
            -- 速度限制
            local function copysign(n1, n2) return n2>0 and math.abs(n1) or -math.abs(n1) end
            if math.abs(speed) > MAX_SPEED then
                speed = copysign(MAX_SPEED, speed)
            end
            
            gear.setTargetSpeed(speed)
            debugSpeed = speed
        end
        
        sleep(0.05) -- 20 ticks/sec
    end
end

-- ==========================================
-- 3. UI 框架 (UI Framework)
-- ==========================================
local termUtil = {cpX=1, cpY=1}
local absTextField = {x=1, y=1, len=15, text="", textCorlor="0", backgroundColor="8"}

function absTextField:paint() 
    local str = ""
    local rawVal = self.key[self.value] or ""
    local text = tostring(rawVal)
    for i=1, self.len, 1 do 
        local tmp = string.sub(text, i, i)
        str = str .. (#tmp > 0 and tmp or " ")
    end
    if #str < self.len then str = str .. string.rep(" ", self.len - #str) end
    term.setCursorPos(self.x, self.y)
    term.blit(str, string.rep(self.textCorlor, #str), string.rep(self.backgroundColor, #str))
end

function absTextField:inputChar(char) 
    local xPos, _ = term.getCursorPos()
    xPos = xPos - self.x + 1
    local field = tostring(self.key[self.value] or "")
    if #field < self.len then
        if (char >= '0' and char <= '9') or char == '.' or char == '-' then
            local isValid = true
            if char == '.' and string.find(field, "%.") then isValid = false end
            if char == '-' and (xPos ~= 1 or string.find(field, "-")) then isValid = false end
            if isValid then
                self.key[self.value] = string.sub(field, 1, xPos-1) .. char .. string.sub(field, xPos, #field)
                termUtil.cpX = termUtil.cpX + 1
                return true -- 指示发生了更改
            end
        end
    end
    return false
end

function absTextField:inputKey(key) 
    local xPos, _ = term.getCursorPos()
    local field = tostring(self.key[self.value] or "")
    if key == 259 and xPos > self.x then -- Backspace
        termUtil.cpX = termUtil.cpX - 1
        if #field > 0 then
            local idx = termUtil.cpX - self.x + 1
            self.key[self.value] = string.sub(field, 1, idx-1) .. string.sub(field, idx+1, #field)
            return true
        end
    elseif key == 262 then 
        termUtil.cpX = math.min(termUtil.cpX + 1, self.x + #field)
    elseif key == 263 then 
        termUtil.cpX = math.max(termUtil.cpX - 1, self.x)
    end
    return false
end

function absTextField:click(x, y) 
    local textLen = #tostring(self.key[self.value] or "")
    termUtil.cpX = math.min(x, self.x + textLen)
    termUtil.cpY = y 
    return true
end

local function newTextField(key, value, x, y, len) 
    return setmetatable({key=key, value=value, x=x, y=y, len=len}, {__index=absTextField})
end

-- ==========================================
-- 4. 数学逻辑 (Math Logic)
-- ==========================================
local function height(t, x, n, k, h)
    local rad = t * math.pi / 180
    local cosv = math.cos(rad)
    if cosv == 0 then return nil end
    local sec = 1 / cosv
    local inner = 1 - ((x * sec) - k) / (100 * n)
    if inner <= 0 then return nil end
    return ((14 * sec) / n + math.tan(rad)) * x + 1400 * math.log(inner) - (14 * k) / n + h
end

local function solveBisection(x, n, k, h, a, b)
    local fa = height(a, x, n, k, h)
    local fb = height(b, x, n, k, h)
    if not fa or not fb or fa * fb > 0 then return nil end
    for i = 1, 40 do
        local m = 0.5 * (a + b)
        local fm = height(m, x, n, k, h)
        if not fm then b=m; fb=fm elseif fa*fm <= 0 then b=m; fb=fm else a=m; fa=fm end
    end
    return 0.5 * (a + b)
end

local function findSolutions(x, n, k, h)
    local sols = {}
    local prevT, prevY = nil, nil
    for t = 1, 89, 1 do
        local y = height(t, x, n, k, h)
        if y then
            if prevY and prevY * y < 0 then
                local root = solveBisection(x, n, k, h, prevT, t)
                if root then table.insert(sols, root) end
            end
            prevT, prevY = t, y
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
    end
    return minDist
end

-- ==========================================
-- 5. 主界面逻辑 (UI Loop)
-- ==========================================
local properties = { n = "1", k = "0", x = "100", h = "2" }

local function runUI()
    local fieldTb = {
        newTextField(properties, "n", 12, 4, 10),
        newTextField(properties, "k", 12, 5, 10),
        newTextField(properties, "x", 12, 6, 10),
        newTextField(properties, "h", 12, 7, 10)
    }
    local lastState = {n=nil, k=nil, h=nil}
    local cachedMaxRange = 0
    
    -- 初始化屏幕和光标
    term.clear()
    term.setCursorBlink(true) -- 【修复】开启光标闪烁
    
    -- 定义重绘函数
    local function redraw()
        -- 绘制静态文本
        term.setBackgroundColor(colors.black)
        term.setTextColor(colors.white)
        term.setCursorPos(1, 1); term.clearLine()
        term.setTextColor(colors.yellow); term.write("=== Auto Fire Control ===")
        
        -- 绘制电机状态
        term.setCursorPos(28, 1)
        if math.abs(debugSpeed) > 0 then
            term.setTextColor(colors.orange); term.write("[MOVING]")
        else
            term.setTextColor(colors.gray); term.write("[IDLE]  ")
        end
        term.setTextColor(colors.white)

        term.setCursorPos(2, 4); term.write("Param n :")
        term.setCursorPos(2, 5); term.write("Param k :")
        term.setCursorPos(2, 6); term.write("Dist  x :")
        term.setCursorPos(2, 7); term.write("Height h:")
        term.setCursorPos(1, 9); term.write(string.rep("-", 40))

        -- 绘制输入框
        for _, v in pairs(fieldTb) do v:paint() end
        
        -- 计算部分
        local nVal = tonumber(properties.n)
        local kVal = tonumber(properties.k)
        local hVal = tonumber(properties.h)
        local xVal = tonumber(properties.x)
        
        -- 最大射程更新
        if nVal and kVal and hVal and nVal > 0 then
            if nVal ~= lastState.n or kVal ~= lastState.k or hVal ~= lastState.h then
                term.setCursorPos(2, 8); term.write("Calc Max...") 
                cachedMaxRange = calculateMaxRange(nVal, kVal, hVal)
                lastState.n, lastState.k, lastState.h = nVal, kVal, hVal
                term.setCursorPos(2, 8); term.clearLine() 
            end
            term.setCursorPos(2, 8); term.setTextColor(colors.cyan)
            term.write(string.format("Max Range: %.1f", cachedMaxRange))
        else
            cachedMaxRange = 0
        end
        
        -- 解算与控制
        term.setCursorPos(2, 10); term.setTextColor(colors.white); term.write("Target: ")
        
        if nVal and kVal and xVal and hVal and nVal > 0 then
            if xVal > cachedMaxRange then
                term.setTextColor(colors.red); term.write("OUT OF RANGE!  ")
                targetPitch = 0 
            else
                local sols = findSolutions(xVal, nVal, kVal, hVal)
                if #sols > 0 then
                    local angle = sols[1] -- 默认低弹道
                    if angle > 45 then 
                         term.setTextColor(colors.orange)
                         term.write("Angle > 45! (Wait)")
                         -- 即使大于45度也更新目标，让用户决定是否通过 n 调整
                         targetPitch = angle 
                    else
                        targetPitch = angle -- 【关键】更新全局目标角度
                        term.setTextColor(colors.lime)
                        term.write(string.format("%.4f deg [AUTO]", angle))
                    end
                else
                    term.setTextColor(colors.red); term.write("No Solution.   ")
                end
            end
        else
            term.setTextColor(colors.gray); term.write("Waiting Input...")
        end
        
        -- 显示底部调试信息
        term.setCursorPos(2, 12); term.setTextColor(colors.lightGray)
        term.clearLine()
        term.write(string.format("C:%.2f T:%.2f Spd:%d", cannon.getPitch(), targetPitch, debugSpeed))

        -- 恢复光标到输入框位置
        term.setTextColor(colors.white)
        term.setCursorPos(termUtil.cpX, termUtil.cpY)
    end

    -- 首次绘制
    redraw()
    
    local refreshTimer = os.startTimer(0.2) -- 降低刷新频率到 5fps，节省性能
    
    while true do
        local eventData = {os.pullEvent()}
        local event = eventData[1]
        local shouldRedraw = false
        
        if event == "timer" then
            -- 【修复】只有当是我们自己的刷新定时器时，才重绘
            if eventData[2] == refreshTimer then
                shouldRedraw = true
                refreshTimer = os.startTimer(0.2)
            end
            -- 如果是其他 timer (比如 controlLoop 的 sleep)，直接忽略，不重绘
            
        elseif event == "mouse_click" then
            local x, y = eventData[3], eventData[4]
            for _, v in pairs(fieldTb) do 
                if y == v.y and x >= v.x and x <= v.x + v.len then 
                    v:click(x, y)
                    shouldRedraw = true
                end 
            end
            
        elseif event == "key" then
            local key = eventData[2]
            for _, v in pairs(fieldTb) do 
                if termUtil.cpY == v.y and termUtil.cpX >= v.x and termUtil.cpX <= v.x + v.len + 1 then 
                    if v:inputKey(key) then shouldRedraw = true end
                end 
            end
            shouldRedraw = true -- 按键总是触发重绘以更新光标
            
        elseif event == "char" then
            local char = eventData[2]
            for _, v in pairs(fieldTb) do 
                if termUtil.cpY == v.y and termUtil.cpX >= v.x and termUtil.cpX <= v.x + v.len + 1 then 
                    if v:inputChar(char) then shouldRedraw = true end
                end 
            end
        end
        
        if shouldRedraw then
            redraw()
        end
    end
end

-- ==========================================
-- 6. 程序入口
-- ==========================================
parallel.waitForAll(runUI, controlLoop)
