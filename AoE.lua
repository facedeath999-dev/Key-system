--[[ Protected by Lua Guard ]]

-- ========== KEY SYSTEM ==========
local KEY_URL = "\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\102\097\099\101\100\101\097\116\104\057\057\057\045\100\101\118\047\075\101\121\045\115\121\115\116\101\109\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\075\101\121\046\116\120\116\063\116\105\109\101\061" .. os.time()

local Players = game:GetService("\080\108\097\121\101\114\115")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("\080\108\097\121\101\114\071\117\105")

local validKey
local success = pcall(function()
    validKey = game:HttpGet(KEY_URL)
end)

if not success or not validKey then
    warn("\070\097\105\108\101\100\032\116\111\032\108\111\097\100\032\107\101\121\046")
    return
end

validKey = string.gsub(validKey, "\037\115\043", "")

-- Key GUI
local KeyGui = Instance.new("\083\099\114\101\101\110\071\117\105", playerGui)
KeyGui.ResetOnSpawn = false

local KFrame = Instance.new("\070\114\097\109\101", KeyGui)
KFrame.Size = UDim2.new(0x0, 0xDC, 0x0, 0x82)
KFrame.Position = UDim2.new(0.05, 0x0, 0.2, 0x0)
KFrame.BackgroundColor3 = Color3.fromRGB(0x1E,0x1E,0x1E)
KFrame.Active = true
KFrame.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", KFrame)

local KTitle = Instance.new("\084\101\120\116\076\097\098\101\108", KFrame)
KTitle.Size = UDim2.new(0x1, -0xA, 0x0, 0x18)
KTitle.Position = UDim2.new(0x0, 0x8, 0x0, 0x0)
KTitle.BackgroundTransparency = 0x1
KTitle.Text = "\55357\56593\032\065\111\069\032\075\101\121"
KTitle.Font = Enum.Font.GothamBold
KTitle.TextSize = 0xE
KTitle.TextXAlignment = Enum.TextXAlignment.Left
KTitle.TextColor3 = Color3.new(0x1,0x1,0x1)

local KBox = Instance.new("\084\101\120\116\066\111\120", KFrame)
KBox.Size = UDim2.new(0.9, 0x0, 0x0, 0x18)
KBox.Position = UDim2.new(0.05, 0x0, 0x0, 0x28)
KBox.PlaceholderText = "\069\110\116\101\114\032\107\101\121\046\046\046"
KBox.Text = ""
KBox.Font = Enum.Font.Gotham
KBox.TextSize = 0xC
KBox.BackgroundColor3 = Color3.fromRGB(0x37,0x37,0x37)
KBox.TextColor3 = Color3.new(0x1,0x1,0x1)
Instance.new("\085\073\067\111\114\110\101\114", KBox)

local KBtn = Instance.new("\084\101\120\116\066\117\116\116\111\110", KFrame)
KBtn.Size = UDim2.new(0.9, 0x0, 0x0, 0x18)
KBtn.Position = UDim2.new(0.05, 0x0, 0x0, 0x4B)
KBtn.Text = "\086\101\114\105\102\121\032\075\101\121"
KBtn.Font = Enum.Font.Gotham
KBtn.TextSize = 0xC
KBtn.BackgroundColor3 = Color3.fromRGB(0x3C,0x3C,0x3C)
KBtn.TextColor3 = Color3.new(0x1,0x1,0x1)
Instance.new("\085\073\067\111\114\110\101\114", KBtn)

local KStatus = Instance.new("\084\101\120\116\076\097\098\101\108", KFrame)
KStatus.Size = UDim2.new(0x1,0x0,0x0,0x14)
KStatus.Position = UDim2.new(0x0,0x0,0x1,-0x14)
KStatus.BackgroundTransparency = 0x1
KStatus.Text = ""
KStatus.Font = Enum.Font.Gotham
KStatus.TextSize = 0xB
KStatus.TextColor3 = Color3.fromRGB(0xC8,0x3C,0x3C)

local verified = false

KBtn.MouseButton1Click:Connect(function()
    local input = string.gsub(KBox.Text, "\037\115\043", "")
    if input == validKey then
        KStatus.Text = "\075\101\121\032\097\099\099\101\112\116\101\100"
        KStatus.TextColor3 = Color3.fromRGB(0x50,0xC8,0x78)
        task.wait(0.3)
        verified = true
        KeyGui:Destroy()
    else
        KStatus.Text = "\073\110\118\097\108\105\100\032\107\101\121"
        KStatus.TextColor3 = Color3.fromRGB(0xC8,0x3C,0x3C)
    end
end)

repeat task.wait() until verified

-- ========== SETTINGS ==========
local ATTACK_RANGE = 0xC8
local ATTACK_INTERVAL = 0.03
local IGNORE_EVASION = true

local IgnorePlayers = false
local IgnoreNPCs = false
local IgnoreTraining = false

local DEFAULT_WALKSPEED = 0x10

-- ========== CHARACTER ==========
local function waitForCharacter()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    local hum = char:WaitForChild("\072\117\109\097\110\111\105\100")
    return char, hrp, hum
end

local char, root, humanoid = waitForCharacter()

-- ========== EQUIP ==========
local attackEvent = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):WaitForChild("\065\116\116\097\099\107\086\050")
local weaponsEvent = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):FindFirstChild("\087\101\097\112\111\110\115\069\118\101\110\116")

local function hasEquippedTool(c)
    for _, obj in ipairs(c:GetChildren()) do
        if obj:IsA("\084\111\111\108") then return true end
    end
end

local function getAnyBackpackTool()
    for _, t in ipairs(player.Backpack:GetChildren()) do
        if t:IsA("\084\111\111\108") then return t end
    end
end

local function safeEquip()
    if not weaponsEvent then return end
    task.wait(0.5)
    pcall(function()
        weaponsEvent:FireServer("\069\113\117\105\112\047\085\110\069\113\117\105\112")
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
    local isTraining = model.Name == "\084\114\097\105\110\105\110\103\080\111\108\101"
    local isNPC = string.find(model.Name, "\078\080\067")

    if targetPlayer and IgnorePlayers then return false end
    if isNPC and IgnoreNPCs then return false end
    if isTraining and IgnoreTraining then return false end
    if targetPlayer and player.Team == targetPlayer.Team then return false end

    local hum = model:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
    local hrp = model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    return hum and hrp and hum.Health > 0x0
end

-- ========== GUI ==========
local ScreenGui = Instance.new("\083\099\114\101\101\110\071\117\105", playerGui)
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("\070\114\097\109\101", ScreenGui)
Frame.Size = UDim2.new(0x0,0xC8,0x0,0xE6)
Frame.Position = UDim2.new(0.05,0x0,0.2,0x0)
Frame.BackgroundColor3 = Color3.fromRGB(0x1E,0x1E,0x1E)
Frame.Active = true
Frame.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", Frame)

local Title = Instance.new("\084\101\120\116\076\097\098\101\108", Frame)
Title.Size = UDim2.new(0x1,0x0,0x0,0x18)
Title.BackgroundTransparency = 0x1
Title.Text = "\55357\56613\032\065\111\069\032\55357\56613"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(0x1,0x1,0x1)
Title.TextSize = 0xE
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0x0,0x8,0x0,0x0)

local HideBtn = Instance.new("\084\101\120\116\066\117\116\116\111\110", Frame)
HideBtn.Text = "\045"
HideBtn.Size = UDim2.new(0x0,0x14,0x0,0x12)
HideBtn.Position = UDim2.new(0x1,-0x18,0x0,0x3)
HideBtn.BackgroundColor3 = Color3.fromRGB(0x3C,0x3C,0x3C)
Instance.new("\085\073\067\111\114\110\101\114", HideBtn)

local Skull = Instance.new("\084\101\120\116\066\117\116\116\111\110", ScreenGui)
Skull.Text = "\55357\56448"
Skull.Size = UDim2.new(0x0,0x26,0x0,0x26)
Skull.Position = UDim2.new(0.02,0x0,0.4,0x0)
Skull.Visible = false
Skull.BackgroundColor3 = Color3.fromRGB(0x28,0x28,0x28)
Skull.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", Skull)

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
    local btn = Instance.new("\084\101\120\116\066\117\116\116\111\110", Frame)
    btn.Size = UDim2.new(0.9,0x0,0x0,0x14)
    btn.Position = UDim2.new(0.05,0x0,0x0,y)
    btn.BackgroundColor3 = Color3.fromRGB(0x37,0x37,0x37)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 0xC
    Instance.new("\085\073\067\111\114\110\101\114", btn)

    local function update()
        btn.Text = text.."\032\058\032"..(state and "\9745" or "\9744")
        callback(state)
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        update()
    end)

    update()
end

local attackEnabled = false
createToggle("\065\117\116\111\032\065\116\116\097\099\107",0x20,function(v)
    attackEnabled = v
end,false)

createToggle("\073\103\110\111\114\101\032\080\108\097\121\101\114\115",0x3A,function(v)
    IgnorePlayers = v
end,false)

createToggle("\073\103\110\111\114\101\032\078\080\067",0x52,function(v)
    IgnoreNPCs = v
end,false)

createToggle("\073\103\110\111\114\101\032\084\114\097\105\110\105\110\103",0x6A,function(v)
    IgnoreTraining = v
end,false)

local walkSpeedEnabled = false
createToggle("\087\097\108\107\083\112\101\101\100\032\051\048",0x84,function(v)
    walkSpeedEnabled = v
    humanoid.WalkSpeed = v and 0x1E or DEFAULT_WALKSPEED
end,false)

task.spawn(function()
    while true do
        task.wait(0.1)
        if walkSpeedEnabled and humanoid.WalkSpeed ~= 0x1E then
            humanoid.WalkSpeed = 0x1E
        end
    end
end)

-- ========== ATTACK LOOP ==========
task.spawn(function()
    while true do
        task.wait(ATTACK_INTERVAL)
        if not attackEnabled then continue end

        if humanoid.Health <= 0x0 then
            char, root, humanoid = waitForCharacter()
            safeEquip()
            continue
        end

        local container = workspace:FindFirstChild("\067\104\097\114\097\099\116\101\114\115")
        if not container then continue end

        for _, t in ipairs(container:GetChildren()) do
            if isValidTarget(t) then
                local thrp = t:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
                if thrp and (root.Position - thrp.Position).Magnitude <= ATTACK_RANGE then
                    pcall(function()
                        if IGNORE_EVASION then
                            attackEvent:FireServer(0x2,0x1,t,{IgnoreEvasion=true})
                        else
                            attackEvent:FireServer(0x2,0x1,t)
                        end
                    end)
                end
            end
        end
    end
end)