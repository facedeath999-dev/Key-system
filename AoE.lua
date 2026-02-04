--[[ Protected by Lua Guard ]]

-- ========== KEY SYSTEM ==========
local _IIIIllIIIl = "https://raw.githubusercontent.com/facedeath999-dev/Key-system/refs/heads/main/Key.txt?time=" .. os.time()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local _llIlIlllIl = Players.LocalPlayer
local _IlIllIlIlI = _llIlIlllIl:WaitForChild("PlayerGui")

local _IIIIIIIIlI
local _IlIllllllI = pcall(function()
    _IIIIIIIIlI = game:HttpGet(_IIIIllIIIl)
end)

if not _IlIllllllI or not _IIIIIIIIlI then
    warn("Failed to load key.")
    return
end

_IIIIIIIIlI = string.gsub(_IIIIIIIIlI, "%s+", "")

-- Key GUI
local _IlIIIIIllI = Instance.new("ScreenGui", _IlIllIlIlI)
_IlIIIIIllI.ResetOnSpawn = false

local _IIlllIIlII = Instance.new("Frame", _IlIIIIIllI)
_IIlllIIlII.Size = UDim2.new(0, 220, 0, 130)
_IIlllIIlII.Position = UDim2.new(0.05, 0, 0.2, 0)
_IIlllIIlII.BackgroundColor3 = Color3.fromRGB(30,30,30)
_IIlllIIlII.Active = true
_IIlllIIlII.Draggable = true
Instance.new("UICorner", _IIlllIIlII)

local _lIIIIIIlll = Instance.new("TextLabel", _IIlllIIlII)
_lIIIIIIlll.Size = UDim2.new(1, -10, 0, 24)
_lIIIIIIlll.Position = UDim2.new(0, 8, 0, 0)
_lIIIIIIlll.BackgroundTransparency = 1
_lIIIIIIlll.Text = "🔑 AoE Key"
_lIIIIIIlll.Font = Enum.Font.GothamBold
_lIIIIIIlll.TextSize = 14
_lIIIIIIlll.TextXAlignment = Enum.TextXAlignment.Left
_lIIIIIIlll.TextColor3 = Color3.new(1,1,1)

local _lIIlIIllIl = Instance.new("TextBox", _IIlllIIlII)
_lIIlIIllIl.Size = UDim2.new(0.9, 0, 0, 24)
_lIIlIIllIl.Position = UDim2.new(0.05, 0, 0, 40)
_lIIlIIllIl.PlaceholderText = "Enter key..."
_lIIlIIllIl.Text = ""
_lIIlIIllIl.Font = Enum.Font.Gotham
_lIIlIIllIl.TextSize = 12
_lIIlIIllIl.BackgroundColor3 = Color3.fromRGB(55,55,55)
_lIIlIIllIl.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _lIIlIIllIl)

local _IlIlllllll = Instance.new("TextButton", _IIlllIIlII)
_IlIlllllll.Size = UDim2.new(0.9, 0, 0, 24)
_IlIlllllll.Position = UDim2.new(0.05, 0, 0, 75)
_IlIlllllll.Text = "Verify Key"
_IlIlllllll.Font = Enum.Font.Gotham
_IlIlllllll.TextSize = 12
_IlIlllllll.BackgroundColor3 = Color3.fromRGB(60,60,60)
_IlIlllllll.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", _IlIlllllll)

local _llIllllllI = Instance.new("TextLabel", _IIlllIIlII)
_llIllllllI.Size = UDim2.new(1,0,0,20)
_llIllllllI.Position = UDim2.new(0,0,1,-20)
_llIllllllI.BackgroundTransparency = 1
_llIllllllI.Text = ""
_llIllllllI.Font = Enum.Font.Gotham
_llIllllllI.TextSize = 11
_llIllllllI.TextColor3 = Color3.fromRGB(200,60,60)

local _lIIlIIIlll = false

_IlIlllllll.MouseButton1Click:Connect(function()
    local _llIllIlllI = string.gsub(_lIIlIIllIl.Text, "%s+", "")
    if _llIllIlllI == _IIIIIIIIlI then
        _llIllllllI.Text = "Key accepted"
        _llIllllllI.TextColor3 = Color3.fromRGB(80,200,120)
        task.wait(0.3)
        _lIIlIIIlll = true
        _IlIIIIIllI:Destroy()
    else
        _llIllllllI.Text = "Invalid key"
        _llIllllllI.TextColor3 = Color3.fromRGB(200,60,60)
    end
end)

repeat task.wait() until _lIIlIIIlll

-- ========== SETTINGS ==========
local _IIIllIllll = 200
local _IIllIIlIII = 0.03
local _IlIIIIIIlI = true

local _llIIIllIII = false
local _llIllIIIII = false
local _lIIIIlIIII = false

local _llllllIllI = 16

-- ========== CHARACTER ==========
local function _llIIIIlIII()
    local _llIlllIlll = _llIlIlllIl.Character or _llIlIlllIl.CharacterAdded:Wait()
    local _lIlllllIlI = _llIlllIlll:WaitForChild("HumanoidRootPart")
    local _lIIIllIllI = _llIlllIlll:WaitForChild("Humanoid")
    return _llIlllIlll, _lIlllllIlI, _lIIIllIllI
end

local _llIlllIlll, root, humanoid = _llIIIIlIII()

-- ========== EQUIP ==========
local _IllIlIllII = ReplicatedStorage:WaitForChild("Events"):WaitForChild("AttackV2")
local _IIlIlIlIIl = ReplicatedStorage:WaitForChild("Events"):FindFirstChild("WeaponsEvent")

local function _IlIlIIllll(c)
    for _, obj in ipairs(c:GetChildren()) do
        if obj:IsA("Tool") then return true end
    end
end

local function _lIIIIlIIll()
    for _, t in ipairs(_llIlIlllIl.Backpack:GetChildren()) do
        if t:IsA("Tool") then return t end
    end
end

local function _IlllIIlIlI()
    if not _IIlIlIlIIl then return end
    task.wait(0.5)
    pcall(function()
        _IIlIlIlIIl:FireServer("Equip/UnEquip")
    end)
    task.wait(0.2)
    if not _IlIlIIllll(_llIlllIlll) then
        local _IIIllllllI = _lIIIIlIIll()
        if _IIIllllllI then
            pcall(function()
                humanoid:EquipTool(_IIIllllllI)
            end)
        end
    end
end

_IlllIIlIlI()

_llIlIlllIl.CharacterAdded:Connect(function()
    _llIlllIlll, root, humanoid = _llIIIIlIII()
    task.defer(_IlllIIlIlI)
end)

-- ========== TARGET FILTER ==========
local function _lIIllIIlII(model)
    if not model or model == _llIlllIlll then return false end

    local _llIlllIllI = Players:GetPlayerFromCharacter(model)
    local _IlIlIIlIll = model.Name == "TrainingPole"
    local _IIIlllllll = string.find(model.Name, "NPC")

    if _llIlllIllI and _llIIIllIII then return false end
    if _IIIlllllll and _llIllIIIII then return false end
    if _IlIlIIlIll and _lIIIIlIIII then return false end
    if _llIlllIllI and _llIlIlllIl.Team == _llIlllIllI.Team then return false end

    local _lIIIllIllI = model:FindFirstChildOfClass("Humanoid")
    local _lIlllllIlI = model:FindFirstChild("HumanoidRootPart")
    return _lIIIllIllI and _lIlllllIlI and _lIIIllIllI.Health > 0
end

-- ========== GUI ==========
local _llIIIlllII = Instance.new("ScreenGui", _IlIllIlIlI)
_llIIIlllII.ResetOnSpawn = false

local _lIIllIIlIl = Instance.new("Frame", _llIIIlllII)
_lIIllIIlIl.Size = UDim2.new(0,200,0,230)
_lIIllIIlIl.Position = UDim2.new(0.05,0,0.2,0)
_lIIllIIlIl.BackgroundColor3 = Color3.fromRGB(30,30,30)
_lIIllIIlIl.Active = true
_lIIllIIlIl.Draggable = true
Instance.new("UICorner", _lIIllIIlIl)

local _IIllllllII = Instance.new("TextLabel", _lIIllIIlIl)
_IIllllllII.Size = UDim2.new(1,0,0,24)
_IIllllllII.BackgroundTransparency = 1
_IIllllllII.Text = "🔥 AoE 🔥"
_IIllllllII.Font = Enum.Font.GothamBold
_IIllllllII.TextColor3 = Color3.new(1,1,1)
_IIllllllII.TextSize = 14
_IIllllllII.TextXAlignment = Enum.TextXAlignment.Left
_IIllllllII.Position = UDim2.new(0,8,0,0)

local _IIIIllllII = Instance.new("TextButton", _lIIllIIlIl)
_IIIIllllII.Text = "-"
_IIIIllllII.Size = UDim2.new(0,20,0,18)
_IIIIllllII.Position = UDim2.new(1,-24,0,3)
_IIIIllllII.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("UICorner", _IIIIllllII)

local _llIIlIIllI = Instance.new("TextButton", _llIIIlllII)
_llIIlIIllI.Text = "💀"
_llIIlIIllI.Size = UDim2.new(0,38,0,38)
_llIIlIIllI.Position = UDim2.new(0.02,0,0.4,0)
_llIIlIIllI.Visible = false
_llIIlIIllI.BackgroundColor3 = Color3.fromRGB(40,40,40)
_llIIlIIllI.Draggable = true
Instance.new("UICorner", _llIIlIIllI)

_IIIIllllII.MouseButton1Click:Connect(function()
    _lIIllIIlIl.Visible = false
    _llIIlIIllI.Visible = true
end)

_llIIlIIllI.MouseButton1Click:Connect(function()
    _lIIllIIlIl.Visible = true
    _llIIlIIllI.Visible = false
end)

local function _IIIIllIlll(text,y,callback,default)
    local _IIllIlIlll = default
    local _llIllIIIIl = Instance.new("TextButton", _lIIllIIlIl)
    _llIllIIIIl.Size = UDim2.new(0.9,0,0,20)
    _llIllIIIIl.Position = UDim2.new(0.05,0,0,y)
    _llIllIIIIl.BackgroundColor3 = Color3.fromRGB(55,55,55)
    _llIllIIIIl.Font = Enum.Font.Gotham
    _llIllIIIIl.TextSize = 12
    Instance.new("UICorner", _llIllIIIIl)

    local function _lIllllIlII()
        _llIllIIIIl.Text = text.." : "..(_IIllIlIlll and "☑" or "☐")
        callback(_IIllIlIlll)
    end

    _llIllIIIIl.MouseButton1Click:Connect(function()
        _IIllIlIlll = not _IIllIlIlll
        _lIllllIlII()
    end)

    _lIllllIlII()
end

local _lllllIIIll = false
_IIIIllIlll("Auto Attack",32,function(v)
    _lllllIIIll = v
end,false)

_IIIIllIlll("Ignore Players",58,function(v)
    _llIIIllIII = v
end,false)

_IIIIllIlll("Ignore NPC",82,function(v)
    _llIllIIIII = v
end,false)

_IIIIllIlll("Ignore Training",106,function(v)
    _lIIIIlIIII = v
end,false)

local _lllIIllIII = false
_IIIIllIlll("WalkSpeed 30",132,function(v)
    _lllIIllIII = v
    humanoid.WalkSpeed = v and 30 or _llllllIllI
end,false)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _lllIIllIII and humanoid.WalkSpeed ~= 30 then
            humanoid.WalkSpeed = 30
        end
    end
end)

-- ========== ATTACK LOOP ==========
task.spawn(function()
    while true do
        task.wait(_IIllIIlIII)
        if not _lllllIIIll then continue end

        if humanoid.Health <= 0 then
            _llIlllIlll, root, humanoid = _llIIIIlIII()
            _IlllIIlIlI()
            continue
        end

        local _IIlIIlIIlI = workspace:FindFirstChild("Characters")
        if not _IIlIIlIIlI then continue end

        for _, t in ipairs(_IIlIIlIIlI:GetChildren()) do
            if _lIIllIIlII(t) then
                local _lIIIlIIllI = t:FindFirstChild("HumanoidRootPart")
                if _lIIIlIIllI and (root.Position - _lIIIlIIllI.Position).Magnitude <= _IIIllIllll then
                    pcall(function()
                        if _IlIIIIIIlI then
                            _IllIlIllII:FireServer(2,1,t,{IgnoreEvasion=true})
                        else
                            _IllIlIllII:FireServer(2,1,t)
                        end
                    end)
                end
            end
        end
    end
end)