--[[======================================================================
    火控终端 v3.2
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
local CONFIG_FILE = ".remote_config"
local modem = peripheral.find("modem")
if not modem then error("Error: Wireless Modem not found!") end

-- 数据结构
local persistentData = { channel = "555" }
local tempData = { x = "100", targetName = "" }

-- === 配置管理 (核心修改) ===
local function loadConfig()
    if fs.exists(CONFIG_FILE) then
        local file = fs.open(CONFIG_FILE, "r")
        local data = textutils.unserialize(file.readAll())
        file.close()
        if data then persistentData.channel = tostring(data.channel) end
    end
end
local function saveConfig()
    local file = fs.open(CONFIG_FILE, "w")
    file.write(textutils.serialize(persistentData))
    file.close()
end

-- 启动时加载配置
loadConfig()
local currentChannel = tonumber(persistentData.channel) or 555
modem.open(currentChannel)

local cannonStatus = {} 

-- === UI 框架 ===
local termUtil = {cpX=1, cpY=1}
local absTextField = {x=1, y=1, len=15, text="", textCorlor="0", backgroundColor="8"}
function absTextField:paint() 
    local str = ""; local rawVal = self.table[self.key] or ""; local text = tostring(rawVal)
    for i=1, self.len, 1 do local tmp=string.sub(text,i,i); str=str..(#tmp>0 and tmp or " ") end
    if #str<self.len then str=str..string.rep(" ",self.len-#str) end
    term.setCursorPos(self.x,self.y); term.blit(str,string.rep(self.textCorlor,#str),string.rep(self.backgroundColor,#str))
end
function absTextField:inputChar(char)
    local xPos = term.getCursorPos() - self.x + 1; local field = tostring(self.table[self.key] or "")
    if #field < self.len and ((char>='0' and char<='9') or char=='.') then
        self.table[self.key] = string.sub(field,1,xPos-1)..char..string.sub(field,xPos,#field)
        termUtil.cpX = termUtil.cpX + 1; return true
    end return false
end
function absTextField:inputKey(key)
    local xPos = term.getCursorPos(); local field = tostring(self.table[self.key] or "")
    if key==259 and xPos>self.x then
        termUtil.cpX=termUtil.cpX-1; self.table[self.key]=string.sub(field,1,termUtil.cpX-self.x)..string.sub(field,termUtil.cpX-self.x+2,#field); return true
    elseif key==262 then termUtil.cpX=math.min(termUtil.cpX+1,self.x+#field)
    elseif key==263 then termUtil.cpX=math.max(termUtil.cpX-1,self.x) end return false
end
function absTextField:click(x,y) termUtil.cpX=math.min(x,self.x+#tostring(self.table[self.key] or "")); termUtil.cpY=y; return true end
local function newTextField(tbl, key, x, y, len) return setmetatable({table=tbl,key=key,x=x,y=y,len=len},{__index=absTextField}) end

-- === 主程序 ===
local function runTerm()
    local fieldTb = {
        ch = newTextField(persistentData, "channel", 12, 3, 6),
        x  = newTextField(tempData, "x", 12, 5, 10)
    }
    
    term.clear(); term.setCursorBlink(true)
    local refreshTimer = os.startTimer(0.5)
    local sendFeedbackTimer = nil
    
    local function redraw()
        term.setBackgroundColor(colors.black); term.clear()
        
        -- 顶部状态栏
        term.setCursorPos(1,1); term.clearLine()
        if tempData.targetName == "" then
            term.setTextColor(colors.yellow)
            term.write("=== REMOTE: BROADCAST MODE ===")
        else
            term.setTextColor(colors.blue)
            term.write("=== REMOTE: SINGLE MODE ===")
            term.setCursorPos(28, 1); term.setTextColor(colors.lightBlue)
            local tName = tempData.targetName
            if #tName > 10 then tName = string.sub(tName,1,10) end
            term.write("["..tName.."]")
        end
        
        term.setTextColor(colors.white)
        term.setCursorPos(2, 3); term.write("Channel :")
        term.setCursorPos(2, 5); term.write("Distance:")
        
        for _,v in pairs(fieldTb) do v:paint() end
        
        -- 发送反馈
        term.setCursorPos(25, 5)
        if sendFeedbackTimer then
            term.setTextColor(colors.lime); term.write(">> SENT <<")
        elseif tonumber(tempData.x) then
            term.setTextColor(colors.gray); term.write("[Enter] Send")
        end
        
        -- 列表
        term.setCursorPos(1, 7); term.setTextColor(colors.lightGray)
        term.write("Name      Status    Angle  MaxR")
        term.setCursorPos(1, 8); term.write(string.rep("-", 39))
        
        local row = 9
        local now = os.clock()
        local sortedIDs = {}
        for id in pairs(cannonStatus) do table.insert(sortedIDs, id) end
        table.sort(sortedIDs)
        
        for _, id in ipairs(sortedIDs) do
            local info = cannonStatus[id]
            if now - info.lastSeen > 5 then
                cannonStatus[id] = nil
            else
                term.setCursorPos(1, row)
                local name = info.name or ("ID:"..id)
                if tempData.targetName == name then
                    term.setTextColor(colors.cyan); term.write(">")
                else
                    term.setTextColor(colors.white); term.write(" ")
                end
                
                if #name > 9 then name = string.sub(name, 1, 9) end
                term.write(string.format("%-10s", name))
                
                if info.aligned then term.setTextColor(colors.lime); term.write("READY    ")
                else term.setTextColor(colors.orange); term.write("MOVING   ") end
                
                term.setTextColor(colors.white)
                term.write(string.format("%5.1f  ", info.pitch))
                
                local dist = tonumber(tempData.x) or 0
                if dist > (info.maxRange or 0) then term.setTextColor(colors.red)
                else term.setTextColor(colors.cyan) end
                term.write(string.format("%4d", math.floor(info.maxRange or 0)))
                
                row = row + 1
            end
        end
        term.setCursorPos(termUtil.cpX, termUtil.cpY); term.setTextColor(colors.white)
    end
    
    redraw()
    
    while true do
        local eventData = {os.pullEvent()}
        local event = eventData[1]
        local shouldRedraw = false
        
        if event == "modem_message" then
            local ch, msg = eventData[3], eventData[5]
            if ch == currentChannel and type(msg) == "table" and msg.protocol == "CBC_STATUS" then
                cannonStatus[msg.id] = {
                    name = msg.name,
                    maxRange = msg.maxRange,
                    pitch = msg.pitch,
                    aligned = msg.aligned,
                    lastSeen = os.clock()
                }
                shouldRedraw = true
            end
            
        elseif event == "timer" then
            if eventData[2] == refreshTimer then shouldRedraw = true; refreshTimer = os.startTimer(0.5)
            elseif eventData[2] == sendFeedbackTimer then sendFeedbackTimer = nil; shouldRedraw = true end
            
        elseif event == "key" then
            local key = eventData[2]
            if key == 257 then -- Enter 发送
                local dist, ch = tonumber(tempData.x), tonumber(persistentData.channel)
                if dist and ch then
                    -- 确保使用最新的频道
                    if ch ~= currentChannel then 
                        modem.close(currentChannel); modem.open(ch); currentChannel=ch; 
                        saveConfig() -- 再次确保保存
                    end
                    
                    local payload = { protocol="CBC_CMD", distance=dist }
                    if tempData.targetName ~= "" then payload.targetName = tempData.targetName end
                    
                    modem.transmit(currentChannel, currentChannel, payload)
                    sendFeedbackTimer = os.startTimer(1.0); shouldRedraw = true
                end
            else
                for k,v in pairs(fieldTb) do 
                    if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then 
                        if v:inputKey(key) then 
                            -- 【新增】如果是频道框被修改，立即保存
                            if k == "ch" then saveConfig() end
                            shouldRedraw = true 
                        end 
                    end 
                end
            end
            
        elseif event == "char" then
             for k,v in pairs(fieldTb) do 
                if termUtil.cpY==v.y and termUtil.cpX>=v.x and termUtil.cpX<=v.x+v.len+1 then 
                    if v:inputChar(eventData[2]) then 
                        -- 【新增】如果是频道框被修改，立即保存
                        if k == "ch" then saveConfig() end
                        shouldRedraw=true 
                    end 
                end 
            end
             
        elseif event == "mouse_click" then
             local x,y=eventData[3],eventData[4]
             local clickedField = false
             for _,v in pairs(fieldTb) do if y==v.y and x>=v.x and x<=v.x+v.len then v:click(x,y); clickedField=true; shouldRedraw=true end end
             
             if not clickedField and y >= 9 then
                 local sortedIDs = {}
                 for id in pairs(cannonStatus) do table.insert(sortedIDs, id) end
                 table.sort(sortedIDs)
                 local index = y - 8
                 if index <= #sortedIDs then
                    local id = sortedIDs[index]
                    local name = cannonStatus[id].name or ("ID:"..id)
                    if tempData.targetName == name then tempData.targetName = "" else tempData.targetName = name end
                    shouldRedraw = true
                 end
             end
        end
        if shouldRedraw then redraw() end
    end
end

runTerm()
