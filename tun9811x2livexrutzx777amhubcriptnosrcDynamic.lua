local executor = identifyexecutor()
-- PC
if executor == "Wave" or executor == "AWP" or executor == "Synapse Z" or executor == "Seriality" or executor == "Argon" or executor == "Atlantis" or executor == "Xeno" or executor == "Solara" or executor == "Velocity" or executor == "Seliware" or executor == "Swift"
-- Mobile
or executor == "Fluxus" or executor == "Delta" or executor == "Arceus X" or executor == "Codex" or executor == "Cryptic" or executor == "Krnl"
then
print("Executor " .. identifyexecutor())
local webh =
"https://discord.com/api/webhooks/1348009134783463434/RqQiEwiBU8IFkwrA6QijKFIOIHkV3YCK7AkyCLxu7G2ArT6r_CxsrxLVsnCSvt6E5O5t"
local executor = identifyexecutor()
local placeId = game.PlaceId
local mapName = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local currentTime = os.date("%Y-%m-%d %H:%M:%S")
local player = game.Players.LocalPlayer
local playerName = player.Name
local playerDisplayName = player.DisplayName
local playerPosition = player.Character and player.Character.HumanoidRootPart.Position or "Unknown"
local clientId = game:GetService('RbxAnalyticsService'):GetClientId()

pcall(function()
    local data = {
        ["embeds"] = {
            {
                ["title"] = "Game Information",
                ["description"] = string.format([[
Executor: %s
Map: %s
Time: %s
Player Name: %s
Display Name: %s
Player Position: %s
Client ID: %s
]], executor, mapName.Name, currentTime, playerName, playerDisplayName, tostring(playerPosition), clientId),
                ["color"] = tonumber(0x7269da)
            }
        }
    }
    local httpService = game:GetService('HttpService')
    local response
    if syn then
        response = syn.request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif request then
        response = request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif http_request then
        response = http_request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    end
end)

local webh =
"https://discord.com/api/webhooks/1348879379186585710/HL6nj5UQrxSgDUzsgWHWhoGUbZCdb5Oj7dMZvrhI8XuBUY53-ImRh9LSylqR_zA7QZT6"
local httpService = game:GetService('HttpService')
local marketplaceService = game:GetService("MarketplaceService")
local notified = false
task.spawn(function()
    while true do
        if game.PrivateServerId == nil or game.PrivateServerId == "" then
            local playerCount = #game.Players:GetPlayers()
            if playerCount < 5 and not notified then
                local jobId = game.JobId
                local success, serverTime = pcall(function()
                    return game:GetService("Lighting"):GetMinutesAfterMidnight()
                end)
                local hours, minutes = 0, 0
                if success then
                    hours = math.floor(serverTime / 60)
                    minutes = math.floor(serverTime % 60)
                else
                end
                local formattedTime = string.format("%02d:%02d", hours, minutes)
                local placeId = game.PlaceId
                local placeInfo = { Name = "Unknown" }
                local success, info = pcall(function()
                    return marketplaceService:GetProductInfo(placeId)
                end)
                if success then
                    placeInfo = info
                else
                end
                local data = {
                    ["embeds"] = {
                        {
                            ["title"] = "Low Server",
                            ["fields"] = {
                                { ["name"] = "Players :",     ["value"] = string.format("```yaml\n%d/12\n```", playerCount),                                                                            ["inline"] = false },
                                { ["name"] = "Server Time :", ["value"] = string.format("```fix\n%s\n```", formattedTime),                                                                              ["inline"] = false },
                                { ["name"] = "Job-Id :",      ["value"] = string.format("```yaml\n%s\n```", jobId),                                                                                     ["inline"] = false },
                                { ["name"] = "game Name :",   ["value"] = string.format("```yaml\n%s\n```", placeInfo.Name),                                                                            ["inline"] = false },
                                { ["name"] = "Script :",      ["value"] = string.format("```lua\ngame:GetService(\"ReplicatedStorage\").__ServerBrowser:InvokeServer(\"teleport\", \"%s\")```", jobId), ["inline"] = false }
                            },
                            ["color"] = 0xFF0000
                        }
                    }
                }
                local success, response = pcall(function()
                    if syn then
                        return syn.request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif request then
                        return request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    elseif http_request then
                        return http_request({
                            Url = webh,
                            Method = 'POST',
                            Headers = { ['Content-Type'] = 'application/json' },
                            Body = httpService:JSONEncode(data),
                        })
                    else
                        return nil
                    end
                end)
                if success and response and response.StatusCode == 200 then
                    notified = true
                else
                end
            elseif playerCount >= 5 then
                if notified then
                end
                notified = false
            end
        else
        end
        task.wait(21600)
    end
end)
if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end
getgenv().Config = {
    Save_Member = true
}
_G.Check_Save_Setting = "CheckSaveSetting"
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not _G.Dis and not isfolder('Dynamic Hub Arise Crossover') then
        makefolder('Dynamic Hub Arise Crossover')
    end
    if not _G.Dis and not isfile('Dynamic Hub Arise Crossover/' .. Name .. '.json') then
        writefile('Dynamic Hub Arise Crossover/' .. Name .. '.json', JsonEncode(getgenv().Config))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Arise Crossover') and isfile('Dynamic Hub Arise Crossover/' .. Name .. '.json') then
        getgenv().Config = JsonDecode(readfile('Dynamic Hub Arise Crossover/' .. Name .. '.json'))
        return getgenv().Config
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if not _G.Dis and isfolder('Dynamic Hub Arise Crossover') and isfile('Dynamic Hub Arise Crossover/' .. Name .. '.json') then
        writefile('Dynamic Hub Arise Crossover/' .. Name .. '.json', JsonEncode(getgenv().Config))
    elseif not _G.Dis then
        Check_Setting(Name)
    end
end
Check_Setting(_G.Check_Save_Setting)
Get_Setting(_G.Check_Save_Setting)
if getgenv().Config.Save_Member then
    getgenv()['MyName'] = game.Players.LocalPlayer.Name
elseif getgenv().Config.Save_All_Member then
    getgenv()['MyName'] = "AllMember"
else
    getgenv()['MyName'] = "None"
    _G.Dis = true
end
Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])
getgenv().Config.Key = _G.wl_key
Update_Setting(getgenv()['MyName'])
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/main.lua"))()
local SaveManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tun9811/Fluent/refs/heads/main/InterfaceManager.lua"))()
--// Anti AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(180)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
--[[]
local L_3c2 = 200
function TP(Pos)
local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance <= 100 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
if Distance < 80 then
Speed11 = 275
elseif Distance < 120 then
Speed11 = 300
elseif Distance < 150 then
Speed11 = 800
elseif Distance < 230 then
Speed11 = 740
elseif Distance < 330 then
Speed11 = 640
elseif Distance < 440 then
Speed11 = 520
elseif Distance < 580 then
Speed11 = 410
elseif Distance < 700 then
Speed11 = 350
elseif Distance < 800 then
Speed11 = 300
elseif Distance < 900 then
Speed11 = 275
elseif Distance >= 1000 then
Speed11 = 275
end
local tweenInfo = TweenInfo.new(Distance / getgenv().Config["Tween Speed"], Enum.EasingStyle.Linear)
local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
tweenInfo, {
CFrame = Pos
})
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y,
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
if BypassTP and Distance >= 0 then
game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
end
tween:Play()
end
function TP(Pos)
    local Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local tweenInfo = TweenInfo.new(Distance / getgenv().Config["Tween Speed"], Enum.EasingStyle.Linear)
    local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,
        tweenInfo, {
            CFrame = Pos
        })
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X, Pos.Y,
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
    if BypassTP and Distance >= 1000 then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
    end
    tween:Play()
end
--]]
function TP(Pos)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  Pos
end
function TP1(Pos)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  Pos
end
function StopTween(target)
    if not target then
        _G.StopTween = true
        wait()
        TP(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        local humanoidRootPart = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
        if humanoidRootPart:FindFirstChild("BodyClip") then
            humanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
        _G.StopTween = false
        _G.Clip = false
        local character = game.Players.LocalPlayer.Character
        if character:FindFirstChild("Highlight") then
            character:FindFirstChild("Highlight"):Destroy()
        end
    end
end
function Rejoin()
    local TeleportService = game:GetService("TeleportService")
    local player = game.Players.LocalPlayer
    if player then
        pcall(function()
            TeleportService:Teleport(game.PlaceId, player)
        end)
    end
end
local VirtualInputManager = game:GetService("VirtualInputManager")
function Click()
    wait(0.1)
    VirtualInputManager:SendMouseButtonEvent(1280, 672, 0, true, game, 0)
    wait(0.05)
    VirtualInputManager:SendMouseButtonEvent(1280, 672, 0, false, game, 0)
end
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function isAutoEnabled()
    local keys_G = {
        "Auto Farm", "Auto Farm [ Nearest ]", "Auto Farm Bosses", "Auto Farm Dungeon",
        "Auto Farm Rank", "Auto Farm lnfernal Castle"
    }
    for _, key in ipairs(keys_G) do
        if getgenv().Config[key] then return true end
    end
    return false
end
--[[]
spawn(function()
    while wait() do
        if isAutoEnabled() then
            local hrp = Players.LocalPlayer.Character.HumanoidRootPart
            if not hrp:FindFirstChild("BodyClip") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "BodyClip"
                Noclip.Parent = hrp
                Noclip.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                Noclip.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)
--]]
RunService.Stepped:Connect(function()
    if isAutoEnabled() then
        for _, v in pairs(Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)
spawn(function()
    while wait() do
        if isAutoEnabled() then
            if not Players.LocalPlayer.Character:FindFirstChild("Highlight") then
                local Highlight = Instance.new("Highlight")
                Highlight.FillColor = Color3.fromRGB(81, 255, 60)
                Highlight.OutlineColor = Color3.fromRGB(81, 255, 60)
                Highlight.Parent = Players.LocalPlayer.Character
            end
        end
    end
end)
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local TweenService = game:GetService("TweenService")
_G.Logo = 83452741766028 --- เลข logo
if game.CoreGui:FindFirstChild("ImageButton") then
    game.CoreGui:FindFirstChild("ImageButton"):Destroy()
end
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Shadow = Instance.new("ImageLabel")
local ClickSound = Instance.new("Sound")
ScreenGui.Name = "ImageButton"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ImageButton.BackgroundTransparency = 0.8
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.49, 0, 0.010, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 45)
ImageButton.Draggable = false
ImageButton.Image = "http://www.roblox.com/asset/?id=" .. (_G.Logo)
ImageButton.ImageTransparency = 0.4
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
UIStroke.Parent = ImageButton
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 1
ClickSound.Parent = ImageButton
ClickSound.SoundId = "rbxassetid://130785805"
ClickSound.Volume = 1
local function playClickAnimation()
    local originalSize = ImageButton.Size
    local TweenSizeUp = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = UDim2.new(0, 50, 0, 45) })
    local TweenSizeDown = TweenService:Create(ImageButton, TweenInfo.new(0.1), { Size = originalSize })
    TweenSizeUp:Play()
    TweenSizeUp.Completed:Connect(function()
        TweenSizeDown:Play()
    end)
end
ImageButton.MouseButton1Down:Connect(function()
    ClickSound:Play()
    playClickAnimation()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "RightControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "RightControl", false, game)
end)
local Window = Fluent:CreateWindow({
    Title = "Arise Crossover - Dynamic Hub",
    SubTitle = "By x2Livex",
    TabWidth = 110,
    Size = UDim2.fromOffset(620, 420),
    --[[
Acrylic = true,
--]]
    Theme = "Lua Theme",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    AutoFarm = Window:AddTab({ Title = "Auto Farm", Icon = "swords" }),
    Dungeons = Window:AddTab({ Title = "Dungeons", Icon = "shield" }),
    Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    Miscellaneous = Window:AddTab({ Title = "Miscellaneous", Icon = "fingerprint" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local humanoidRootPart = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
Tabs.AutoFarm:AddSection("Farm Monster [ ⚔️ ]")
local Mob = {
    "Vermillion",
    "LongIn",
    "Anders",
    "Eminel",
    "Gonshee",
    "Monarch",
    "Largalgan",
    "Blossom",
    "Michille",
    "Genji",
    "Fyakuya",
    "Wind",
    "Red Ant",
    "Royal Red Ant",
    "Snake Man",
    "Shark Man",
    "Black Crow",
    "Daek",
    "Light Admiral",
    "Soondoo",
    "Sortudo",
    "Ant Queen",
    "Luryu",
    "Diablo",
    "Gosuke",
    "Golyne",
    "Heaven",
    "Ika",
    "Zere",
}
local ChoosedMob = Tabs.AutoFarm:AddDropdown("Select Monster", {
    Title = "Select Monster",
    Description = "",
    Values = Mob,
    Multi = false,
    Default = getgenv().Config["Select Monster"] or "N/A",
})
ChoosedMob:OnChanged(function(Value)
    _G['Select Monster'] = Value
    getgenv().Config["Select Monster"] = Value
    Update_Setting(getgenv()['MyName'])
end)
Tabs.AutoFarm:AddToggle("Auto Farm", {
    Title = "Auto Farm",
    Description = "",
    Default = getgenv().Config["Auto Farm"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm"])
    end
})
local pos = CFrame.new(0, 0, 1.5)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "LongIn" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(127.044884, 28.2794838, -157.648727, 0.98774296, 6.44023373e-07, -0.15608938,
                            -5.63040089e-07, 1, 5.63039805e-07, 0.15608938, -4.68254029e-07, 0.98774296))
                        if checkmon == "LongIn" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "LongIn" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Anders" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-463.020905, 28.2794552, -411.290924, -0.999969184, 2.94956124e-07,
                            -0.0078479629, 2.9266829e-07, 1, 2.92667892e-07, 0.0078479629, 2.9036201e-07,
                            -0.999969184))
                        if checkmon == "Anders" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Anders" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Eminel" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3224.47168, 57.1272964, -2113.38647, -0.934378147, 3.35049833e-07, -0.35628286,
                            2.59595538e-07, 1, 2.59595481e-07, 0.35628286, 1.50070889e-07, -0.934378147))
                        if checkmon == "Eminel" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Eminel" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Gonshee" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(593.034058, 28.6965714, -263.430786, 0.870460749, -9.81849766e-08, 0.492237836,
                            2.59595481e-07, 1, -2.59595424e-07, -0.492237836, 3.53750352e-07, 0.870460749))
                        if checkmon == "Gonshee" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Gonshee" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Largalgan" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-200.753998, 124.33831, -393.0047, 0.801707506, 1.63761307e-08, 0.59771657,
                            -3.80919545e-08, 1, 2.36942999e-08, -0.59771657, -4.17640891e-08, 0.801707506))
                        if checkmon == "Largalgan" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Largalgan" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Blossom" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3369.73804, 29.8264046, 2656.87427, -0.507923067, -1.99022992e-07,
                            -0.861402452, 5.63039634e-07, 1, -5.63039748e-07, 0.861402452, -7.70984627e-07,
                            -0.507923067))
                        if checkmon == "Blossom" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Blossom" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Michille" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(114.857445, 38.3894615, 4748.9043, -0.989949822, 2.93698122e-07, 0.141418859,
                            2.59595424e-07, 1, -2.59595254e-07, -0.141418859, -2.20274586e-07, -0.989949822))
                        if checkmon == "Michille" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Michille" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Genji" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3039.5625, 46.4275284, -3562.73877, 0.991612613, 2.90969609e-07, 0.129245594,
                            -2.59595367e-07, 1, -2.59595424e-07, -0.129245594, 2.2386655e-07, 0.991612613))
                        if checkmon == "Genji" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Genji" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Fyakuya" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(2965.23364, 68.8443527, -3046.39868, 0.741998315, -3.66652699e-07, -0.670401752,
                            2.59595481e-07, 1, -2.59595538e-07, 0.670401752, 1.85861921e-08, 0.741998315))
                        if checkmon == "Fyakuya" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Fyakuya" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Wind" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-52.0030823, 39.7340012, 5187.89209, -0.0513627008, 2.72586561e-07, 0.998680055,
                            2.59595396e-07, 1, -2.5959568e-07, -0.998680055, 2.4591921e-07, -0.0513627008))
                        if checkmon == "Wind" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Wind" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Red Ant" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(4067.44604, 63.5915413, 3323.4353, -0.859736979, 9.05987818e-08, -0.510737062,
                            2.59595481e-07, 1, -2.59595538e-07, 0.510737062, -3.55768918e-07, -0.859736979))
                        if checkmon == "Red Ant" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Red Ant" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Royal Red Ant" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3853.75659, 60.120388, 3014.19092, -0.0192575548, 0, 0.99981457, 0, 1, 0,
                            -0.99981457, 0, -0.0192575548))
                        if checkmon == "Royal Red Ant" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Royal Red Ant" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Snake Man" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3370.76904, 29.8883171, 2428.50684, 0.993787169, 2.29090219e-07, 0.111297131,
                            -2.59595282e-07, 1, 2.5959551e-07, -0.111297131, -2.86874894e-07, 0.993787169))
                        if checkmon == "Snake Man" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Snake Man" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Shark Man" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3026.64868, 62.0051117, -2146.23584, -0.768797994, 7.28044114e-08,
                            -0.639491677, 5.63038554e-07, 1, -5.63038611e-07, 0.639491677, -7.92921412e-07,
                            -0.768797994))
                        if checkmon == "Shark Man" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Shark Man" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Black Crow" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3477.64087, 34.8365059, 2755.87988, 0.680041194, 7.9569611e-07, -0.733173907,
                            -5.63039634e-07, 1, 5.63039691e-07, 0.733173907, 2.99157854e-08, 0.680041194))
                        if checkmon == "Black Crow" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Black Crow" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Daek" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-155.457108, 28.0835228, -73.7864227, -0.050371509, -2.7234222e-07, -0.99873054,
                            -2.59595311e-07, 1, -2.59595538e-07, 0.99873054, 2.46189558e-07, -0.050371509))
                        if checkmon == "Daek" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Daek" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Light Admiral" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3295.3457, 82.4939423, -2687.41919, -0.66240859, 0, -0.749142766, 0, 1, 0,
                            0.749142766, 0, -0.66240859))
                        if checkmon == "Light Admiral" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Light Admiral" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Soondoo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(550.000427, 30.50634, 77.0126038, 0.688838124, 7.27416599e-11, 0.724915147,
                            1.89673717e-08, 1, -1.8123762e-08, -0.724915147, 2.62340745e-08, 0.688838124))
                        if checkmon == "Soondoo" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Soondoo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Sortudo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(115.04454, 37.8531456, 4443.3999, -0.590509593, -1.22038728e-07, -0.807030618,
                            5.63636377e-07, 1, -5.63635922e-07, 0.807030618, -7.87704266e-07, -0.590509593))
                        if checkmon == "Sortudo" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Sortudo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Ant Queen" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3856.26758, 60.112114, 3035.34058, -0.988580704, -4.4252596e-14, -0.150692299,
                            -4.5195076e-14, 1, 2.82951483e-15, 0.150692299, 9.60775411e-15, -0.988580704))
                        if checkmon == "Ant Queen" then
                            if v.HumanoidRootPart.Size == Vector3.new(7, 7, 3.5) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Ant Queen" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Luryu" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(2701.74292, 45.4265251, -2708.96997, 0.391518474, 2.97651667e-07, -0.920170248, 5.63039691e-07, 1, 5.63039407e-07, 0.920170248, -7.38532719e-07, 0.391518474))
                        if checkmon == "Luryu" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Luryu" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Diablo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(4931.19482, 40.8220558, -417.42923, -0.627116263, 0, 0.778925657, 0, 1, 0,
                            -0.778925657, 0, -0.627116263))
                        if checkmon == "Diablo" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Diablo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Gosuke" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(5370.90137, 40.8220558, -314.188568, 0.882526755, 3.12897441e-07, 0.47026217,
                            -2.31298088e-07, 1, -2.3129796e-07, -0.47026217, 9.53558938e-08, 0.882526755))
                        if checkmon == "Gosuke" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Gosuke" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Golyne" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(5728.51855, 40.822052, -66.7568054, -0.928694725, 3.14090556e-07, -0.370845109,
                            5.63038498e-07, 1, -5.63039237e-07, 0.370845109, -7.31691671e-07, -0.928694725))
                        if checkmon == "Golyne" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Golyne" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Heaven" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(205.224228, 33.8965111, -4630.20361, -0.552298963, -6.69813868e-13,
                            -0.833646119, 3.27259887e-14, 1, -8.25156349e-13, 0.833646119, -4.83014887e-13,
                            -0.552298963))
                        if checkmon == "Heaven" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Heaven" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Ika" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(227.855453, 34.8954926, -5586.63623, -0.169608429, 4.59152602e-07, -0.985511541,
                            -5.62754394e-07, 1, 5.62753939e-07, 0.985511541, 6.50048776e-07, -0.169608429))
                        if checkmon == "Ika" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Ika" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] and _G['Select Monster'] == "Zere" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(195.154358, 33.8965111, -5072.82373, 0.939573467, 7.21771983e-07, 0.342347324,
                            -5.63039407e-07, 1, -5.63039578e-07, -0.342347324, 3.36262019e-07, 0.939573467))
                        if checkmon == "Zere" then
                            if v.HumanoidRootPart.Size == Vector3.new(2, 2, 1) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm"] or _G['Select Monster'] ~= "Zere" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddSection("Farm Bosses [ ⚔️ ]")
local Bosses = {
    "LongIn",
    "Soondoo",
    "Daek",
    "Anders",
    "Gonshee",
    "Largalgan",
    "Blossom",
    "Snake Man",
    "Black Crow",
    "Shark Man",
    "Eminel",
    "Light Admiral",
    "Luryu",
    "Fyakuya",
    "Genji",
    "Sortudo",
    "Michille",
    "Wind",
    "Ant King",
    "Golyne",
    "Gosuke",
    "Diablo",
    "Heaven",
    "Ika",
    "Zere",
}
local ChoosedBoss = Tabs.AutoFarm:AddDropdown("Select Bosses", {
    Title = "Select Bosses",
    Description = "",
    Values = Bosses,
    Multi = false,
    Default = getgenv().Config["Select Bosses"] or "N/A",
})
ChoosedBoss:OnChanged(function(Value)
    _G['Select Bosses'] = Value
    getgenv().Config["Select Bosses"] = Value
    Update_Setting(getgenv()['MyName'])
end)
Tabs.AutoFarm:AddToggle("Auto Farm Bosses", {
    Title = "Auto Farm Bosses",
    Description = "",
    Default = getgenv().Config["Auto Farm Bosses"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm Bosses"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm Bosses"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "LongIn" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(337.298462, 28.6598473, 22.8929119, -0.945551574, -7.15637043e-07, 0.325472265,
                            -5.63039862e-07, 1, 5.63039634e-07, -0.325472265, 3.49129124e-07, -0.945551574))
                        if checkmon == "LongIn" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "LongIn" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Soondoo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(381.941132, 28.0835171, -141.551773, -0.953227043, -3.66223333e-07, 0.302255124,
                            -5.62579373e-07, 1, -5.62579544e-07, -0.302255124, -7.06308583e-07, -0.953227043))
                        if checkmon == "Soondoo" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Soondoo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Daek" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(158.122314, 28.2794819, -53.1728096, 0.231696114, 6.09074882e-38, 0.972788215,
                            -1.39434424e-38, 1, -5.92902384e-38, -0.972788215, 0, 0.231696114))
                        if checkmon == "Daek" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Daek" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Anders" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(265.903046, 28.0835171, 291.24231, -0.205953047, -4.35009497e-07, 0.978561878,
                            5.63039521e-07, 1, 5.63039691e-07, -0.978561878, 6.66928713e-07, -0.205953047))
                        if checkmon == "Anders" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Anders" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Gonshee" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-548.728027, 28.0834923, -328.590637, -0.498816401, -2.05146321e-07,
                            -0.866707683, 5.57628425e-07, 1, -5.57628084e-07, 0.866707683, -7.61454885e-07,
                            -0.498816401))
                        if checkmon == "Gonshee" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Gonshee" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Largalgan" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(293.760956, 124.333252, -242.347153, 0.167818442, 1.48570334e-09, 0.985817909,
                            -6.71566969e-11, 1, -1.4956445e-09, -0.985817909, 1.84792459e-10, 0.167818442))
                        if checkmon == "Largalgan" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Largalgan" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Blossom" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3592.88989, 34.291256, 2741.00757, -0.439883649, 7.53264885e-07, 0.898054779,
                            5.63004107e-07, 1, -5.63004164e-07, -0.898054779, 2.57952223e-07, -0.439883649))
                        if checkmon == "Blossom" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Blossom" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Snake Man" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3159.70654, 44.4117355, 2887.75928, -0.80549556, -7.80857476e-07, -0.592601836,
                            -5.5851433e-07, 1, -5.58514444e-07, 0.592601836, -1.18904282e-07, -0.80549556))
                        if checkmon == "Snake Man" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Snake Man" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Black Crow" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3466.06177, 31.1063576, 2909.89917, -0.952053607, -7.08286564e-07, 0.3059313,
                            -5.63032586e-07, 1, 5.6303287e-07, -0.3059313, 3.63788189e-07, -0.952053607))
                        if checkmon == "Black Crow" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Black Crow" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Shark Man" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3101.74048, 61.2719383, -2168.64844, -0.2563169, -6.88546493e-07, 0.966592789,
                            -5.63039464e-07, 1, 5.63039521e-07, -0.966592789, -3.99913347e-07, -0.2563169))
                        if checkmon == "Shark Man" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Shark Man" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Eminel" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3051.69897, 56.4804459, -2395.51245, 0.744364321, -4.31234071e-08, 0.667773724,
                            5.63039521e-07, 1, -5.63039691e-07, -0.667773724, 7.95089647e-07, 0.744364321))
                        if checkmon == "Eminel" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Eminel" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Light Admiral" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(-3531.06787, 56.4716454, -2255.06836, -0.903998554, 1.33815178e-07, 0.427535534,
                            2.80851054e-07, 1, 2.80850969e-07, -0.427535534, 3.73962649e-07, -0.903998554))
                        if checkmon == "Light Admiral" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Light Admiral" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Luryu" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(2837.84253, 45.4265251, -2619.34546, -0.624081612, 8.85594957e-08, -0.781359136,
                            -5.63077037e-07, 1, 5.63077208e-07, 0.781359136, 7.91371519e-07, -0.624081612))
                        if checkmon == "Luryu" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Luryu" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Fyakuya" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3160.59204, 45.4265251, -2680.88013, 0.835139036, 1.60515114e-07, -0.550038934,
                            -5.63012918e-07, 1, -5.63012748e-07, 0.550038934, 7.79872948e-07, 0.835139036))
                        if checkmon == "Fyakuya" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Fyakuya" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Genji" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3259.47266, 45.4265251, -3403.26514, 0.894789875, -1.48554005e-08, -0.446487486,
                            2.95679286e-08, 1, 2.59843418e-08, 0.446487486, -3.6452235e-08, 0.894789875))
                        if checkmon == "Genji" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Genji" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Sortudo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(17.8078575, 38.3894615, 4514.37793, 0.126498997, -2.55685421e-07, 0.991966724,
                            -2.95430482e-07, 1, 2.9543034e-07, -0.991966724, -3.30428861e-07, 0.126498997))
                        if checkmon == "Sortudo" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Sortudo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Michille" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(340.151093, 37.8531151, 4579.06885, -0.31399861, 7.1135679e-07, -0.949423432,
                            5.63039862e-07, 1, 5.63039634e-07, 0.949423432, -3.57769579e-07, -0.31399861))
                        if checkmon == "Michille" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Michille" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Wind" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(99.631485, 39.7339172, 5281.9126, -0.643656731, 7.09105441e-09, -0.765314341,
                            6.50590266e-08, 1, -4.54514222e-08, 0.765314341, -7.90457193e-08, -0.643656731))
                        if checkmon == "Wind" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Wind" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Ant King" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(3853.75659, 60.120388, 3014.19092, -0.0192575548, 0, 0.99981457, 0, 1, 0,
                            -0.99981457, 0, -0.0192575548))
                        if checkmon == "Ant King" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Ant King" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Golyne" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(5021.55518, 42.3494492, -99.8139114, -0.197694629, 6.63237245e-07, 0.98026365,
                            5.63039805e-07, 1, -5.63039634e-07, -0.98026365, 4.40617526e-07, -0.197694629))
                        if checkmon == "Golyne" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Golyne" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Gosuke" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(5254.06299, 42.5919189, -268.24823, 0.186909959, 4.54264466e-07, 0.982377052,
                            5.71065925e-07, 1, -5.71066266e-07, -0.982377052, 6.67740039e-07, 0.186909959))
                        if checkmon == "Gosuke" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Gosuke" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Diablo" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(5505.86328, 42.3494301, -568.690796, -0.519175768, -7.73517741e-07, 0.854667485,
                            -5.63032188e-07, 1, 5.63031904e-07, -0.854667485, -1.88892784e-07, -0.519175768))
                        if checkmon == "Diablo" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Diablo" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Heaven" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(111.102547, 34.8954315, -4671.54346, -0.156150669, -4.67592798e-07, 0.987733245,
                            5.62293337e-07, 1, 5.62292769e-07, -0.987733245, 6.43198234e-07, -0.156150669))
                        if checkmon == "Heaven" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Heaven" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Ika" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(189.133453, 33.8965111, -4755.54883, 0.671566963, -7.95298888e-07, -0.740943909,
                            5.63039293e-07, 1, -5.63039009e-07, 0.740943909, -3.90621153e-08, 0.671566963))
                        if checkmon == "Ika" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Ika" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Bosses"] and _G['Select Bosses'] == "Zere" then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        local checkmon = v.HealthBar.Main.Title.Text
                        TP(CFrame.new(604.185364, 34.895504, -5270.18066, 0.346854508, 0, -0.937918961, 0, 1, 0,
                            0.937918961, 0, 0.346854508))
                        if checkmon == "Zere" then
                            if v.HumanoidRootPart.Size == Vector3.new(4, 4, 2) then
                                if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 650 then
                                    repeat
                                        task.wait()
                                        TP(v.HumanoidRootPart.CFrame * pos)
                                    until not getgenv().Config["Auto Farm Bosses"] or _G['Select Bosses'] ~= "Zere" or v.HealthBar.Enabled == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
--[[]
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] or getgenv().Config["Auto Farm Bosses"] or getgenv().Config["Auto Farm [ Nearest ]"] or getgenv().Config["Auto Farm Dungeon"] then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        v.Hitbox.Size = Vector3.new(20, 20, 20)
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Server["1"]:GetChildren()) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                        v.Size = Vector3.new(20, 20, 20)
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Server["2"]:GetChildren()) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                        v.Size = Vector3.new(20, 20, 20)
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Server["3"]:GetChildren()) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                        v.Size = Vector3.new(20, 20, 20)
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Server["4"]:GetChildren()) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                        v.Size = Vector3.new(20, 20, 20)
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Server["5"]:GetChildren()) do
                    if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                        v.Size = Vector3.new(20, 20, 20)
                    end
                end
            end)
        end
    end
end)
--]]
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm"] or getgenv().Config["Auto Farm Bosses"] or getgenv().Config["Auto Farm [ Nearest ]"] or getgenv().Config["Auto Farm Dungeon"] or getgenv().Config["Auto Farm Rank"] or getgenv().Config["Auto Farm lnfernal Castle"] then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetDescendants()) do
                    if v:IsA("BasePart") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 9999999999999999 then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddSection("Rank [ 🔥 ]")
Tabs.AutoFarm:AddToggle("Auto Farm Rank", {
    Title = "Auto Farm Rank",
    Description = "",
    Default = getgenv().Config["Auto Farm Rank"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm Rank"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm Rank"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Rank"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            if v.HealthBar.Enabled == true then
                                repeat
                                    task.wait()
                                    TP1(v.HumanoidRootPart.CFrame * pos)
                                until not getgenv().Config["Auto Farm Rank"] or v.HealthBar.Enabled == false or game.PlaceId ~= 128336380114944
                                StopTween(getgenv().Config["Auto Farm Rank"])
                                wait(0.4)
                            end
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Rank"] or v.HealthBar.Enabled == false or game.PlaceId ~= 128336380114944
                            StopTween(getgenv().Config["Auto Farm Rank"])
                            wait(0.4)
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Rank"] or v.HealthBar.Enabled == false or game.PlaceId ~= 128336380114944
                            StopTween(getgenv().Config["Auto Farm Rank"])
                            wait(0.4)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddToggle("Auto Join Rank", {
    Title = "Auto Join Rank",
    Description = "",
    Default = getgenv().Config["Auto Join Rank"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Join Rank"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Join Rank"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Join Rank"] and game.PlaceId ~= 128336380114944 then
            pcall(function()
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "DungeonAction",
                            ["Action"] = "TestEnter"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "DungeonAction",
                            ["Action"] = "TestEnter"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
            end)
        end
    end
end)
Tabs.AutoFarm:AddSection("Farm Nearest [ ⚔️ ]")
Tabs.AutoFarm:AddToggle("Auto Farm [ Nearest ]", {
    Title = "Auto Farm Nearest",
    Description = "",
    Default = getgenv().Config["Auto Farm [ Nearest ]"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm [ Nearest ]"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm [ Nearest ]"])
    end
})
Tabs.AutoFarm:AddSlider("Distance",
    {
        Title = "Distance",
        Description = "",
        Default = getgenv().Config["Distance"] or 200,
        Min = 50,
        Max = 1000,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Distance"] = Value
            Update_Setting(getgenv()['MyName'])
        end
    })
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm [ Nearest ]"] then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= getgenv().Config["Distance"] then
                        repeat
                            task.wait()
                            TP(v.HumanoidRootPart.CFrame * pos)
                        until not getgenv().Config["Auto Farm [ Nearest ]"] or v.HealthBar.Enabled == false
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddSection("Settings [ ⚙️ ]")
Tabs.AutoFarm:AddSlider("Tween Speed",
    {
        Title = "Tween Speed",
        Description = "",
        Default = getgenv().Config["Tween Speed"] or 200,
        Min = 200,
        Max = 1000,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Tween Speed"] = Value
            Update_Setting(getgenv()['MyName'])
        end
    })
Tabs.AutoFarm:AddToggle("Auto Destroy", {
    Title = "Auto Destroy",
    Description = "",
    Default = getgenv().Config["Auto Destroy"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Destroy"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Destroy"] and game.PlaceId ~= 128336380114944 then
            pcall(function()
                for i, v in ipairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") then
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        local DestroyPrompt = rootPart and rootPart:FindFirstChild("DestroyPrompt")
                        if DestroyPrompt then
                            DestroyPrompt:SetAttribute("MaxActivationDistance", 100000)
                            fireproximityprompt(DestroyPrompt)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddToggle("Auto Arise", {
    Title = "Auto Arise",
    Description = "",
    Default = getgenv().Config["Auto Arise"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Arise"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Arise"] and game.PlaceId ~= 128336380114944 then
            pcall(function()
                for i, v in ipairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") then
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        local DestroyPrompt = rootPart and rootPart:FindFirstChild("ArisePrompt")
                        if DestroyPrompt then
                            DestroyPrompt:SetAttribute("MaxActivationDistance", 100000)
                            fireproximityprompt(DestroyPrompt)
                        end
                    end
                end
            end)
        end
    end
end)
--[[]
Tabs.AutoFarm:AddToggle("Auto Equip Best", {
    Title = "Auto Equip Best",
    Description = "",
    Default = getgenv().Config["Auto Equip Best"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Equip Best"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Equip Best"] then
            pcall(function()
                for i,v in pairs(game:GetService("Players").LocalPlayer.leaderstats.Inventory.Pets:GetChildren()) do
                    for i = 1, 20 do
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Event"] = "EquipBest",
                                    ["Pets"] = {
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        
                                    }
                                },
                                [2] = "\5"
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Event"] = "EquipBest",
                                    ["Pets"] = {
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        
                                    }
                                },
                                [2] = "\4"
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Event"] = "EquipBest",
                                    ["Pets"] = {
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        
                                    }
                                },
                                [2] = "\n"
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Event"] = "EquipBest",
                                    ["Pets"] = {
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        [i] = v.Name,
                                        
                                    }
                                },
                                [2] = "\t"
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                    end
                end
            end)
        end
    end
end)
--]]
Tabs.AutoFarm:AddToggle("Auto Send Pet Attack", {
    Title = "Auto Send Pet Attack",
    Description = "",
    Default = getgenv().Config["Auto Send Pet Attack"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Send Pet Attack"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
local checkcccccc
spawn(function()
    while wait() do
        if getgenv().Config["Auto Send Pet Attack"] then
            pcall(function()
                for i, v in pairs(game:GetService("Players").LocalPlayer.leaderstats.Inventory.Pets:GetChildren()) do
                    for i, v2 in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                        if (v2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                            checkcccccc = 0
                            if v2.HealthBar.Enabled == true and checkcccccc == 0 then
                                repeat
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\7"
                                        }
                                    }

                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\7"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\5"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\n"
                                        }
                                    }

                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\t"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    checkcccccc = 1
                                    wait(2)
                                until not getgenv().Config["Auto Send Pet Attack"] or v2.HealthBar.Enabled == false or checkcccccc == 0  or getgenv().Config["Enabled Fast Pet Attack"]
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddToggle("Enabled Fast Pet Attack", {
    Title = "Enabled Fast Pet Attack",
    Description = "",
    Default = getgenv().Config["Enabled Fast Pet Attack"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Fast Pet Attack"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Send Pet Attack"] and getgenv().Config["Enabled Fast Pet Attack"] then
            pcall(function()
                for i, v in pairs(game:GetService("Players").LocalPlayer.leaderstats.Inventory.Pets:GetChildren()) do
                    for i, v2 in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                        if (v2.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 25 then
                            if v2.HealthBar.Enabled == true then
                                repeat
                                    wait(0.22)
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\7"
                                        }
                                    }

                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\7"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\5"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\n"
                                        }
                                    }

                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                    local args = {
                                        [1] = {
                                            [1] = {
                                                ["PetPos"] = {
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                    [v.Name] = v2.HumanoidRootPart.Position,
                                                },
                                                ["AttackType"] = "All",
                                                ["Event"] = "Attack",
                                                ["Enemy"] = v2.Name
                                            },
                                            [2] = "\t"
                                        }
                                    }
                                    game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                        "dataRemoteEvent"):FireServer(unpack(args))
                                until not getgenv().Config["Auto Send Pet Attack"] or v2.HealthBar.Enabled == false or not getgenv().Config["Enabled Fast Pet Attack"]
                            end
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.AutoFarm:AddToggle("Auto Punch", {
    Title = "Auto Punch",
    Description = "",
    Default = getgenv().Config["Auto Punch"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Punch"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Punch"] then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                        local args = {
                            [1] = {
                                [1] = {
                                    ["Event"] = "PunchAttack",
                                    ["Enemy"] = v.Name
                                },
                                [2] = "\4"
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                            "dataRemoteEvent"):FireServer(unpack(args))
                        for i, v in pairs(game.workspace.__Main.__Enemies.Server["1"]:GetChildren()) do
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["Event"] = "PunchAttack",
                                            ["Enemy"] = v.Name
                                        },
                                        [2] = "\4"
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                    "dataRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                        for i, v in pairs(game.workspace.__Main.__Enemies.Server["2"]:GetChildren()) do
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["Event"] = "PunchAttack",
                                            ["Enemy"] = v.Name
                                        },
                                        [2] = "\4"
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                    "dataRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                        for i, v in pairs(game.workspace.__Main.__Enemies.Server["3"]:GetChildren()) do
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["Event"] = "PunchAttack",
                                            ["Enemy"] = v.Name
                                        },
                                        [2] = "\4"
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                    "dataRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                        for i, v in pairs(game.workspace.__Main.__Enemies.Server["4"]:GetChildren()) do
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["Event"] = "PunchAttack",
                                            ["Enemy"] = v.Name
                                        },
                                        [2] = "\4"
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                    "dataRemoteEvent"):FireServer(unpack(args))
                            end
                        end
                        for i, v in pairs(game.workspace.__Main.__Enemies.Server["5"]:GetChildren()) do
                            if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 50 then
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["Event"] = "PunchAttack",
                                            ["Enemy"] = v.Name
                                        },
                                        [2] = "\4"
                                    }
                                }
                                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild(
                                    "dataRemoteEvent"):FireServer(unpack(args))
                                Click()
                            end
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Punch"] then
            pcall(function()
                Click()
            end)
        end
    end
end)
Tabs.Dungeons:AddSection("Dungeons [ 👑 ]")
Tabs.Dungeons:AddToggle("Auto Farm Dungeon", {
    Title = "Auto Farm Dungeon",
    Description = "",
    Default = getgenv().Config["Auto Farm Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm Dungeon"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Dungeon"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            if v.HealthBar.Enabled == true then
                                repeat
                                    task.wait()
                                    TP1(v.HumanoidRootPart.CFrame * pos)
                                until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                                StopTween(getgenv().Config["Auto Farm Dungeon"])
                                wait(0.4)
                            end
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                            StopTween(getgenv().Config["Auto Farm Dungeon"])
                            wait(0.4)
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                            StopTween(getgenv().Config["Auto Farm Dungeon"])
                            wait(0.4)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm Dungeon"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            if v.HealthBar.Enabled == true then
                                repeat
                                    task.wait()
                                    TP1(v.HumanoidRootPart.CFrame * pos)
                                until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                                StopTween(getgenv().Config["Auto Farm Dungeon"])
                                wait(0.4)
                            end
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                            StopTween(getgenv().Config["Auto Farm Dungeon"])
                            wait(0.4)
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm Dungeon"] or v.HealthBar.Enabled == false
                            StopTween(getgenv().Config["Auto Farm Dungeon"])
                            wait(0.4)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Dungeons:AddToggle("Enabled Instant Leave Dungeon", {
    Title = "Enabled Instant Leave Dungeon",
    Description = "",
    Default = getgenv().Config["Enabled Instant Leave Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Enabled Instant Leave Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Enabled Instant Leave Dungeon"] and game.PlaceId == 128336380114944 then
            pcall(function ()
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Hud.UpContanier:GetChildren()) do
                    if v.Name == "DungeonInfo" then
                        if string.find(v.Text, "Dungeon Ends in") then
                            game:GetService("TeleportService"):Teleport(87039211657390, game:GetService("Players").LocalPlayer)
                        end
                    end
                end
            end)
        end
    end
end)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local player = Players.LocalPlayer
local dungeonFolder = Workspace:WaitForChild("__Main"):WaitForChild("__Dungeon")
function createDungeon()
    local args1 = {
        [1] = {
            [1] = { ["Event"] = "DungeonAction", ["Action"] = "Create" },
            [2] = "\n"
        }
    }
    ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args1))

    local args2 = {
        [1] = {
            [1] = { ["Event"] = "DungeonAction", ["Action"] = "Create" },
            [2] = "\t"
        }
    }
    ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args2))
end
function startDungeon()
    local fakeID = tostring(math.random(100000, 999999))
    local args1 = {
        [1] = {
            [1] = { ["Dungeon"] = fakeID, ["Event"] = "DungeonAction", ["Action"] = "Start" },
            [2] = "\n"
        }
    }
    ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args1))
    local args2 = {
        [1] = {
            [1] = { ["Dungeon"] = fakeID, ["Event"] = "DungeonAction", ["Action"] = "Start" },
            [2] = "\t"
        }
    }
    ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args2))
end
function autoStartDungeon()
    while getgenv().Config["Auto Join Dungeon"] do
        createDungeon()
        task.wait(0.5)
        startDungeon()
        task.wait(3)
    end
end
Tabs.Dungeons:AddToggle("Auto Join Dungeon", {
    Title = "Auto Join Dungeon",
    Description = "",
    Default = getgenv().Config["Auto Join Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Join Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait(1) do
        if getgenv().Config["Auto Join Dungeon"] and game.PlaceId ~= 128336380114944 then
            pcall(autoStartDungeon)
        end
    end
end)
Tabs.Dungeons:AddToggle("Auto Rejoin Dungeon", {
    Title = "Auto Rejoin Dungeon",
    Description = "",
    Default = getgenv().Config["Auto Rejoin Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Rejoin Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while task.wait() do
        if getgenv().Config["Auto Rejoin Dungeon"] and game.PlaceId ~= 128336380114944 then
            pcall(function()
                local args = {
                    [1] = {
                        [1] = {
                            ["Type"] = "Gems",
                            ["Event"] = "DungeonAction",
                            ["Action"] = "BuyTicket"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Type"] = "Gems",
                            ["Event"] = "DungeonAction",
                            ["Action"] = "BuyTicket"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                startDungeon()
            end)
        end
    end
end)
Tabs.Dungeons:AddSection("lnfernal Castle [ 🔥 ]")
Tabs.Dungeons:AddSlider("Choose Room",
    {
        Title = "Choose Room",
        Description = "",
        Default = getgenv().Config["Choose Room"] or 25,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            getgenv().Config["Choose Room"] = Value
            Update_Setting(getgenv()['MyName'])
        end
    })
Tabs.Dungeons:AddToggle("Auto Farm lnfernal Castle", {
    Title = "Auto Farm lnfernal Castle",
    Description = "",
    Default = getgenv().Config["Auto Farm lnfernal Castle"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Farm lnfernal Castle"] = Value
        Update_Setting(getgenv()['MyName'])
        StopTween(getgenv().Config["Auto Farm lnfernal Castle"])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm lnfernal Castle"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            if v.HealthBar.Enabled == true then
                                repeat
                                    task.wait()
                                    TP1(v.HumanoidRootPart.CFrame * pos)
                                until not getgenv().Config["Auto Farm lnfernal Castle"] or v.HealthBar.Enabled == false
                                wait(0.4)
                            end
                        end
                    end
                end
                for i, v in pairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("HealthBar") then
                        if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 999999999999999999999999999 then
                            repeat
                                task.wait()
                                TP1(v.HumanoidRootPart.CFrame * pos)
                            until not getgenv().Config["Auto Farm lnfernal Castle"] or v.HealthBar.Enabled == false
                            wait(0.4)
                        end
                    end
                end
                for i,v in pairs(game.workspace.__Main.__World:GetDescendants()) do
                    if v.Name == "FirePortal" then
                        if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            repeat
                                task.wait()
                                TP1(v.CFrame)
                            until not getgenv().Config["Auto Farm lnfernal Castle"] or (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1500 or (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30
                            wait(0.4)
                        end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if getgenv().Config["Auto Farm lnfernal Castle"] then
            pcall(function()
                for i,v in pairs(game.workspace.__Main.__World:GetDescendants()) do
                    if v.Name == "ProximityPrompt" then
                        v:SetAttribute("MaxActivationDistance", 100000)
                        fireproximityprompt(v)
                    end
                end
            end)
        end
    end
end)
Tabs.Dungeons:AddToggle("Auto Join lnfernal Castle", {
    Title = "Auto Join lnfernal Castle",
    Description = "",
    Default = getgenv().Config["Auto Join lnfernal Castle"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Join lnfernal Castle"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Join lnfernal Castle"] and game.PlaceId ~= 128336380114944 then
            pcall(function()
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "JoinCastle"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "JoinCastle"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            end)
        end
    end
end)
Tabs.Dungeons:AddToggle("Auto Leave", {
    Title = "Auto Leave",
    Description = "",
    Default = getgenv().Config["Auto Leave"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Leave"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Leave"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Hud.UpContanier:GetChildren()) do
                    if v.Name == "Room" then
                        if v.Text == "Floor: " .. getgenv().Config["Choose Room"] .. "/100" then
                            game:GetService("TeleportService"):Teleport(87039211657390, game:GetService("Players").LocalPlayer)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Dungeons:AddSection("Settings [ ⚙️ ]")
Tabs.Dungeons:AddToggle("Auto Destroy Dungeon", {
    Title = "Auto Destroy Dungeon",
    Description = "",
    Default = getgenv().Config["Auto Destroy Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Destroy Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Destroy Dungeon"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in ipairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") then
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        local DestroyPrompt = rootPart and rootPart:FindFirstChild("DestroyPrompt")
                        if DestroyPrompt then
                            DestroyPrompt:SetAttribute("MaxActivationDistance", 100000)
                            fireproximityprompt(DestroyPrompt)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Dungeons:AddToggle("Auto Arise Dungeon", {
    Title = "Auto Arise Dungeon",
    Description = "",
    Default = getgenv().Config["Auto Arise Dungeon"] or false,
    Callback = function(Value)
        getgenv().Config["Auto Arise Dungeon"] = Value
        Update_Setting(getgenv()['MyName'])
    end
})
spawn(function()
    while wait() do
        if getgenv().Config["Auto Arise Dungeon"] and game.PlaceId == 128336380114944 then
            pcall(function()
                for i, v in ipairs(game.workspace.__Main.__Enemies.Client:GetChildren()) do
                    if v:IsA("Model") then
                        local rootPart = v:FindFirstChild("HumanoidRootPart")
                        local DestroyPrompt = rootPart and rootPart:FindFirstChild("ArisePrompt")
                        if DestroyPrompt then
                            DestroyPrompt:SetAttribute("MaxActivationDistance", 100000)
                            fireproximityprompt(DestroyPrompt)
                        end
                    end
                end
            end)
        end
    end
end)
Tabs.Teleport:AddButton({
    Title = "Teleport to Solo World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(577.961914, 28.434576, 261.457123, 1, 2.59595481e-07, 7.27989835e-10,
                -2.59595481e-07, 1, 2.59595424e-07, -7.27922445e-10, -2.59595424e-07, 1)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(577.961914, 28.434576,
                    261.457123, 1, 2.59595481e-07, 7.27989835e-10, -2.59595481e-07, 1, 2.59595424e-07,
                    -7.27922445e-10, -2.59595424e-07, 1)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "SoloWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "SoloWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Naruto World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(-3380.23608, 30.2604809, 2257.25879, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3380.23608, 30.2604809,
                    2257.25879, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "NarutoWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "NarutoWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to OP World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(-2851.12256, 49.3989372, -2011.39355, 0.740045071, 0, 0.672557294, 0, 1, 0,
                -0.672557294, 0, 0.740045071)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2851.12256, 49.3989372,
                    -2011.39355, 0.740045071, 0, 0.672557294, 0, 1, 0, -0.672557294, 0, 0.740045071)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "OPWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "OPWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Bleach World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(2641.79614, 45.4265251, -2645.07544, 0.780932724, 0, -0.624615133, 0, 1, 0,
                0.624615133, 0, 0.780932724)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2641.79614, 45.4265251,
                    -2645.07544, 0.780932724, 0, -0.624615133, 0, 1, 0, 0.624615133, 0, 0.780932724)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "BleachWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "BleachWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to BC World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(198.339813, 38.7076759, 4296.1123, 0.993158996, 6.24933818e-07, -0.116769925,
                -5.63039464e-07, 1, 5.63039464e-07, 0.116769925, -4.93441632e-07, 0.993158996)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(198.339813, 38.7076759,
                    4296.1123, 0.993158996, 6.24933818e-07, -0.116769925, -5.63039464e-07, 1, 5.63039464e-07,
                    0.116769925, -4.93441632e-07, 0.993158996)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "BCWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "BCWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Chainsaw World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(236.932678, 32.8960915, -4301.60547, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(236.932678, 32.8960915,
                    -4301.60547, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "ChainsawWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "ChainsawWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport to Jojo World",
    Description = "",
    Callback = function()
        pcall(function()
            local possw = CFrame.new(4816.31641, 29.9423389, -120.22998, 0, 0, 1, 0, 1, 0, -1, 0, 0)
            if (possw.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1500 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4816.31641, 29.9423389,
                    -120.22998, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "JojoWorld"
                        },
                        [2] = "\n"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                local args = {
                    [1] = {
                        [1] = {
                            ["Event"] = "ChangeSpawn",
                            ["Spawn"] = "JojoWorld"
                        },
                        [2] = "\t"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent")
                    :FireServer(unpack(args))
                game.Players.LocalPlayer.Character.Head:Destroy()
            else
                TP(possw)
            end
        end)
    end
})
Tabs.Shop:AddSection("Weapons [ ⚔️ ]")
local Weapons = {}
for i, v in pairs(game:GetService("ReplicatedStorage").__Assets.__Weapons:GetChildren()) do
    table.insert(Weapons, v.Name)
end
local ChoosedBoss = Tabs.Shop:AddDropdown("Select Weapons", {
    Title = "Select Weapons",
    Description = "",
    Values = Weapons,
    Multi = false,
    Default = getgenv().Config["Select Weapons"] or "N/A",
})
ChoosedBoss:OnChanged(function(Value)
    _G['Select Weapons'] = Value
    getgenv().Config["Select Weapons"] = Value
    Update_Setting(getgenv()['MyName'])
end)
Tabs.Shop:AddButton({
    Title = "Buy Weapons",
    Description = "",
    Callback = function()
        local args = {
            [1] = {
                [1] = {
                    ["Action"] = "Buy",
                    ["Shop"] = "WeaponShop1",
                    ["Item"] = _G['Select Weapons'],
                    ["Event"] = "ItemShopAction"
                },
                [2] = "\n"
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(
            unpack(args))
        local args = {
            [1] = {
                [1] = {
                    ["Action"] = "Buy",
                    ["Shop"] = "WeaponShop1",
                    ["Item"] = _G['Select Weapons'],
                    ["Event"] = "ItemShopAction"
                },
                [2] = "\t"
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(
            unpack(args))
    end
})
Tabs.Miscellaneous:AddSection("Gamepass [ 👑 ]")
Tabs.Miscellaneous:AddButton({
    Title = "Unlock Gamepass [ Auto Clicker ]",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerScripts.PlayerScripts.AutoClick.Disabled = true
    end
})
Tabs.Miscellaneous:AddButton({
    Title = "Unlock Gamepass [ Auto Arise ]",
    Description = "",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerScripts.PlayerScripts.AutoFarm.Disabled = true
    end
})
Tabs.Miscellaneous:AddSection("Local Player [ ⚙️ ]")
Tabs.Miscellaneous:AddToggle("Hide Name", {
    Title = "Hide Name",
    Description = "",
    Default = getgenv().Config["Hide Name"] or false,
    Callback = function(Value)
        getgenv().Config["Hide Name"] = Value
        Update_Setting(getgenv()['MyName'])
        if Value then
            game.Players.LocalPlayer.Character.HumanoidRootPart.PlayerTag.Enabled = false
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.PlayerTag.Enabled = true
        end
    end
})
Tabs.Miscellaneous:AddSection("Server [ ⚙️ ]")
Tabs.Miscellaneous:AddButton({
    Title = "Rejoin Server",
    Description = "",
    Callback = function()
        Rejoin()
    end
})
Tabs.Miscellaneous:AddButton({
    Title = "Hop Server",
    Description = "",
    Callback = function()
        Hop()
    end
})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                            game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
end

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
                PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0
        for i, v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _, Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID,
                            game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end

    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end

    Teleport()
end

Tabs.Miscellaneous:AddButton({
    Title = "Hop Server Low",
    Description = "",
    Callback = function()
        TPReturner()
    end
})
Time = 1
repeat wait() until game:IsLoaded()
wait(Time)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
    local Site
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' ..
            PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0
    for i, v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _, Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

Tabs.Miscellaneous:AddInput("ServerJopID", {
    Title = "Server Jop ID",
    Description = "",
    Default = nil,
    Placeholder = "Jop ID",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        jobId = Value
    end
})
Tabs.Miscellaneous:AddButton({
    Title = "Join Server",
    Description = "",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, jobId, game.Players.LocalPlayer)
    end
})
Tabs.Miscellaneous:AddButton({
    Title = "Copy Jop ID",
    Description = "",
    Callback = function()
        setclipboard(game.JobId)
    end
})
--[[]
Tabs.Miscellaneous:AddSection("Local Player")
Tabs.Miscellaneous:AddToggle("No Clip", {
Title = "No Clip",
Description = "",
Default = getgenv().Config["No Clip"] or false,
Callback = function(Value)
getgenv().Config["No Clip"] = Value
Update_Setting(getgenv()['MyName'])
end
})
sapwn(function()
while wait() do
if getgenv().Config["No Clip"] then
pcall(function()
for i ,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = false
end
end
end)
end
end
end)
sapwn(function()
while wait() do
if not getgenv().Config["No Clip"] then
pcall(function()
for i ,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide = true
end
end
end)
end
end
end)
--]]
Tabs.Miscellaneous:AddSection("Lighting [ ⚙️ ]")
Tabs.Miscellaneous:AddButton({
    Title = "FPS Boots",
    Description = "",
    Callback = function()
        local function FPSBooster()
            local decalsyeeted = true
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            pcall(function() sethiddenproperty(l, "Technology", 2) end)
            pcall(function() sethiddenproperty(t, "Decoration", false) end)
            t.WaterWaveSize = 0
            t.WaterWaveSpeed = 0
            t.WaterReflectance = 0
            t.WaterTransparency = 0
            l.GlobalShadows = false
            l.FogEnd = 9e9
            l.Brightness = 0
            pcall(function() settings().Rendering.QualityLevel = "Level01" end)
            for _, v in pairs(g:GetDescendants()) do
                pcall(function()
                    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    elseif v:IsA("MeshPart") then
                        v.Material = "Plastic"
                        v.Reflectance = 0
                        v.TextureID = 10385902758728957
                    end
                end)
            end
            for _, e in pairs(l:GetChildren()) do
                pcall(function()
                    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                        e.Enabled = false
                    end
                end)
            end
        end
        local success, errorMsg = pcall(FPSBooster)
        if not success then
            warn("Error occurred in FPSBooster: " .. errorMsg)
        end
    end
})
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
SaveManager:LoadAutoloadConfig()
else
local webh =
"https://discord.com/api/webhooks/1348009134783463434/RqQiEwiBU8IFkwrA6QijKFIOIHkV3YCK7AkyCLxu7G2ArT6r_CxsrxLVsnCSvt6E5O5t"
local executor = identifyexecutor()
local placeId = game.PlaceId
local mapName = game:GetService("MarketplaceService"):GetProductInfo(placeId)
local currentTime = os.date("%Y-%m-%d %H:%M:%S")
local player = game.Players.LocalPlayer
local playerName = player.Name
local playerDisplayName = player.DisplayName
local playerPosition = player.Character and player.Character.HumanoidRootPart.Position or "Unknown"
local clientId = game:GetService('RbxAnalyticsService'):GetClientId()

pcall(function()
    local data = {
        ["embeds"] = {
            {
                ["title"] = "Game Information",
                ["description"] = string.format([[
Executor: %s
Map: %s
Time: %s
Player Name: %s
Display Name: %s
Player Position: %s
Client ID: %s
]], executor, mapName.Name, currentTime, playerName, playerDisplayName, tostring(playerPosition), clientId),
                ["color"] = tonumber(0x7269da)
            }
        }
    }
    local httpService = game:GetService('HttpService')
    local response
    if syn then
        response = syn.request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif request then
        response = request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    elseif http_request then
        response = http_request({
            Url = webh,
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json'
            },
            Body = httpService:JSONEncode(data),
        })
    end
end)
game.Players.LocalPlayer:Kick("Script does not support " .. identifyexecutor())
end
