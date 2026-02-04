-- ========== KEY SYSTEM ==========
local KEY_URL = "https://raw.githubusercontent.com/facedeath999-dev/Key-system/refs/heads/main/Key.txt?time=" .. os.time()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local validKey
local success = pcall(function()
    validKey = game:HttpGet(KEY_URL)
end)

if not success or not validKey then
    warn("Failed to load key.")
    return
end

validKey = string.gsub(validKey, "%s+", "")

-- Key GUI
local KeyGui = Instance.new("ScreenGui", playerGui)
KeyGui.ResetOnSpawn = false

local KFrame = Instance.new("Frame", KeyGui)
KFrame.Size = UDim2.new(0, 220, 0, 130)
KFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
KFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
KFrame.Active = true
KFrame.Draggable = true
Instance.new("UICorner", KFrame)

local KTitle = Instance.new("TextLabel", KFrame)
KTitle.Size = UDim2.new(1, -10, 0, 24)
KTitle.Position = UDim2.new(0, 8, 0, 0)
KTitle.BackgroundTransparency = 1
KTitle.Text = "🔑 AoE Key"
KTitle.Font = Enum.Font.GothamBold
KTitle.TextSize = 14
KTitle.TextXAlignment = Enum.TextXAlignment.Left
KTitle.TextColor3 = Color3.new(1,1,1)

local KBox = Instance.new("TextBox", KFrame)
KBox.Size = UDim2.new(0.9, 0, 0, 24)
KBox.Position = UDim2.new(0.05, 0, 0, 40)
KBox.PlaceholderText = "Enter key..."
KBox.Text = ""
KBox.Font = Enum.Font.Gotham
KBox.TextSize = 12
KBox.BackgroundColor3 = Color3.fromRGB(55,55,55)
KBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KBox)

local KBtn = Instance.new("TextButton", KFrame)
KBtn.Size = UDim2.new(0.9, 0, 0, 24)
KBtn.Position = UDim2.new(0.05, 0, 0, 75)
KBtn.Text = "Verify Key"
KBtn.Font = Enum.Font.Gotham
KBtn.TextSize = 12
KBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
KBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", KBtn)

local KStatus = Instance.new("TextLabel", KFrame)
KStatus.Size = UDim2.new(1,0,0,20)
KStatus.Position = UDim2.new(0,0,1,-20)
KStatus.BackgroundTransparency = 1
KStatus.Text = ""
KStatus.Font = Enum.Font.Gotham
KStatus.TextSize = 11
KStatus.TextColor3 = Color3.fromRGB(200,60,60)

local verified = false

KBtn.MouseButton1Click:Connect(function()
    local input = string.gsub(KBox.Text, "%s+", "")
    if input == validKey then
        KStatus.Text = "Key accepted"
        KStatus.TextColor3 = Color3.fromRGB(80,200,120)
        task.wait(0.3)
        verified = true
        KeyGui:Destroy()
    else
        KStatus.Text = "Invalid key"
        KStatus.TextColor3 = Color3.fromRGB(200,60,60)
    end
end)

repeat task.wait() until verified

-- ========== SETTINGS ==========
local ATTACK_RANGE = 200
local ATTACK_INTERVAL = 0.03
local IGNORE_EVASION = true

local IgnorePlayers = false
local IgnoreNPCs = false
local IgnoreTraining = false

local DEFAULT_WALKSPEED = 16

-- ========== CHARACTER ==========
local function waitForCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    local hum = char:WaitForChild("Humanoid")
    return char, hrp, hum
end

local char, root, humanoid = waitForCharacter()

-- ========== EQUIP ==========
local attackEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild("AttackV2")
local weaponsEvent = ReplicatedStorage:WaitForChild("Events"):FindFirstChild("WeaponsEvent")

local function hasEquippedTool(c)
    for _, obj in ipairs(c:GetChildren()) do
        if obj:IsA("Tool") then return true end
    end
end

local function getAnyBackpackTool()
    for _, t in ipairs(player.Backpack:GetChildren()) do
        if t:IsA("Tool") then return t end
    end
end

local function safeEquip()
    if not weaponsEvent then return end
    task.wait(0.5)
    pcall(function()
        weaponsEvent:FireServer("Equip/UnEquip")
    end)
    task.wait(0.2)
    if not hasEquippedTool(char) then
        local tool = getAnyBackpackTool()
        if tool then
            pcall(function()
                humanoid:EquipTool(tool)
            end)
        end
    end
end

safeEquip()

player.CharacterAdded:Connect(function()
    char, root, humanoid = waitForCharacter()
    task.defer(safeEquip)
end)

-- ========== TARGET FILTER ==========
local function isValidTarget(model)
    if not model or model == char then return false end

    local targetPlayer = Players:GetPlayerFromCharacter(model)
    local isTraining = model.Name == "TrainingPole"
    local isNPC = string.find(model.Name, "NPC")

    if targetPlayer and IgnorePlayers then return false end
    if isNPC and IgnoreNPCs then return false end
    if isTraining and IgnoreTraining then return false end
    if targetPlayer and player.Team == targetPlayer.Team then return false end

    local hum = model:FindFirstChildOfClass("Humanoid")
    local hrp = model:FindFirstChild("HumanoidRootPart")
    return hum and hrp and hum.Health > 0
end

-- ========== GUI ==========
local ScreenGui = Instance.new("ScreenGui", playerGui)
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0,200,0,230)
Frame.Position = UDim2.new(0.05,0,0.2,0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Active = true
Frame.Draggable = true
Instance.new("UICorner", Frame)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1,0,0,24)
Title.BackgroundTransparency = 1
Title.Text = "🔥 AoE 🔥"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0,8,0,0)

local HideBtn = Instance.new("TextButton", Frame)
HideBtn.Text = "-"
HideBtn.Size = UDim2.new(0,20,0,18)
HideBtn.Position = UDim2.new(1,-24,0,3)
HideBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", HideBtn)

local Skull = Instance.new("TextButton", ScreenGui)
Skull.Text = "💀"
Skull.Size = UDim2.new(0,38,0,38)
Skull.Position = UDim2.new(0.02,0,0.4,0)
Skull.Visible = false
Skull.BackgroundColor3 = Color3.fromRGB(40,40,40)
Skull.Draggable = true
Instance.new("UICorner", Skull)

HideBtn.MouseButton1Click:Connect(function()
    Frame.Visible = false
    Skull.Visible = true
end)

Skull.MouseButton1Click:Connect(function()
    Frame.Visible = true
    Skull.Visible = false
end)

local function createToggle(text,y,callback,default)
    local state = default
    local btn = Instance.new("TextButton", Frame)
    btn.Size = UDim2.new(0.9,0,0,20)
    btn.Position = UDim2.new(0.05,0,0,y)
    btn.BackgroundColor3 = Color3.fromRGB(55,55,55)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 12
    Instance.new("UICorner", btn)

    local function update()
        btn.Text = text.." : "..(state and "☑" or "☐")
        callback(state)
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        update()
    end)

    update()
end

local attackEnabled = false
createToggle("Auto Attack",32,function(v)
    attackEnabled = v
end,false)

createToggle("Ignore Players",58,function(v)
    IgnorePlayers = v
end,false)

createToggle("Ignore NPC",82,function(v)
    IgnoreNPCs = v
end,false)

createToggle("Ignore Training",106,function(v)
    IgnoreTraining = v
end,false)

local walkSpeedEnabled = false
createToggle("WalkSpeed 30",132,function(v)
    walkSpeedEnabled = v
    humanoid.WalkSpeed = v and 30 or DEFAULT_WALKSPEED
end,false)

task.spawn(function()
    while true do
        task.wait(0.1)
        if walkSpeedEnabled and humanoid.WalkSpeed ~= 30 then
            humanoid.WalkSpeed = 30
        end
    end
end)

-- ========== ATTACK LOOP ==========
task.spawn(function()
    while true do
        task.wait(ATTACK_INTERVAL)
        if not attackEnabled then continue end

        if humanoid.Health <= 0 then
            char, root, humanoid = waitForCharacter()
            safeEquip()
            continue
        end

        local container = workspace:FindFirstChild("Characters")
        if not container then continue end

        for _, t in ipairs(container:GetChildren()) do
            if isValidTarget(t) then
                local thrp = t:FindFirstChild("HumanoidRootPart")
                if thrp and (root.Position - thrp.Position).Magnitude <= ATTACK_RANGE then
                    pcall(function()
                        if IGNORE_EVASION then
                            attackEvent:FireServer(2,1,t,{IgnoreEvasion=true})
                        else
                            attackEvent:FireServer(2,1,t)
                        end
                    end)
                end
            end
        end
    end
end)