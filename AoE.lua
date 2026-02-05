--[[ Protected by Lua Guard ]]

-- ========== KEY SYSTEM ==========
local _lIIIllllII = "\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\102\097\099\101\100\101\097\116\104\057\057\057\045\100\101\118\047\075\101\121\045\115\121\115\116\101\109\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\075\101\121\046\116\120\116\063\116\105\109\101\061" .. os.time()

local Players = game:GetService("\080\108\097\121\101\114\115")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")

local _lIlIIIlIII = Players.LocalPlayer
local _lIIIlllIll = _lIlIIIlIII:WaitForChild("\080\108\097\121\101\114\071\117\105")

local _IllIlIllll
local _lllllIlIIl = pcall(function()
    _IllIlIllll = game:HttpGet(_lIIIllllII)
end)

if not _lllllIlIIl or not _IllIlIllll then
    warn("\070\097\105\108\101\100\032\116\111\032\108\111\097\100\032\107\101\121\046")
    return
end

_IllIlIllll = string.gsub(_IllIlIllll, "\037\115\043", "")

-- Key GUI
local _IlllIlIIll = Instance.new("\083\099\114\101\101\110\071\117\105", _lIIIlllIll)
_IlllIlIIll.ResetOnSpawn = false

local _llIlIllIlI = Instance.new("\070\114\097\109\101", _IlllIlIIll)
_llIlIllIlI.Size = UDim2.new(0, 220, 0, 130)
_llIlIllIlI.Position = UDim2.new(0.05, 0, 0.2, 0)
_llIlIllIlI.BackgroundColor3 = Color3.fromRGB(30,30,30)
_llIlIllIlI.Active = true
_llIlIllIlI.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _llIlIllIlI)

local _IllIIlIIll = Instance.new("\084\101\120\116\076\097\098\101\108", _llIlIllIlI)
_IllIIlIIll.Size = UDim2.new(1, -10, 0, 24)
_IllIIlIIll.Position = UDim2.new(0, 8, 0, 0)
_IllIIlIIll.BackgroundTransparency = 1
_IllIIlIIll.Text = "\55357\56593\032\065\111\069\032\075\101\121"
_IllIIlIIll.Font = Enum.Font.GothamBold
_IllIIlIIll.TextSize = 14
_IllIIlIIll.TextXAlignment = Enum.TextXAlignment.Left
_IllIIlIIll.TextColor3 = Color3.new(1,1,1)

local _IIIIIllllI = Instance.new("\084\101\120\116\066\111\120", _llIlIllIlI)
_IIIIIllllI.Size = UDim2.new(0.9, 0, 0, 24)
_IIIIIllllI.Position = UDim2.new(0.05, 0, 0, 40)
_IIIIIllllI.PlaceholderText = "\069\110\116\101\114\032\107\101\121\046\046\046"
_IIIIIllllI.Text = ""
_IIIIIllllI.Font = Enum.Font.Gotham
_IIIIIllllI.TextSize = 12
_IIIIIllllI.BackgroundColor3 = Color3.fromRGB(55,55,55)
_IIIIIllllI.TextColor3 = Color3.new(1,1,1)
Instance.new("\085\073\067\111\114\110\101\114", _IIIIIllllI)

local _lIIIIIIIIl = Instance.new("\084\101\120\116\066\117\116\116\111\110", _llIlIllIlI)
_lIIIIIIIIl.Size = UDim2.new(0.9, 0, 0, 24)
_lIIIIIIIIl.Position = UDim2.new(0.05, 0, 0, 75)
_lIIIIIIIIl.Text = "\086\101\114\105\102\121\032\075\101\121"
_lIIIIIIIIl.Font = Enum.Font.Gotham
_lIIIIIIIIl.TextSize = 12
_lIIIIIIIIl.BackgroundColor3 = Color3.fromRGB(60,60,60)
_lIIIIIIIIl.TextColor3 = Color3.new(1,1,1)
Instance.new("\085\073\067\111\114\110\101\114", _lIIIIIIIIl)

local _IIIIllllll = Instance.new("\084\101\120\116\076\097\098\101\108", _llIlIllIlI)
_IIIIllllll.Size = UDim2.new(1,0,0,20)
_IIIIllllll.Position = UDim2.new(0,0,1,-20)
_IIIIllllll.BackgroundTransparency = 1
_IIIIllllll.Text = ""
_IIIIllllll.Font = Enum.Font.Gotham
_IIIIllllll.TextSize = 11
_IIIIllllll.TextColor3 = Color3.fromRGB(200,60,60)

local _IIlIlllllI = false

_lIIIIIIIIl.MouseButton1Click:Connect(function()
    local _IIlIIlIIlI = string.gsub(_IIIIIllllI.Text, "\037\115\043", "")
    if _IIlIIlIIlI == _IllIlIllll then
        _IIIIllllll.Text = "\075\101\121\032\097\099\099\101\112\116\101\100"
        _IIIIllllll.TextColor3 = Color3.fromRGB(80,200,120)
        task.wait(0.3)
        _IIlIlllllI = true
        _IlllIlIIll:Destroy()
    else
        _IIIIllllll.Text = "\073\110\118\097\108\105\100\032\107\101\121"
        _IIIIllllll.TextColor3 = Color3.fromRGB(200,60,60)
    end
end)

repeat task.wait() until _IIlIlllllI

-- ========== SETTINGS ==========
local _IlIllIllII = 200
local _llIIllIlIl = 0.03
local _IllIlIlIlI = true

local _IIllllIIII = false
local _lIlIIlIllI = false
local _llIIIlllIl = false

local _lIlllIlIIl = 16

-- ========== CHARACTER ==========
local function _IlllllIlII()
    local _IlIlIIIIII = _lIlIIIlIII.Character or _lIlIIIlIII.CharacterAdded:Wait()
    local _IIIIllIllI = _IlIlIIIIII:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    local _IIIIllIlII = _IlIlIIIIII:WaitForChild("\072\117\109\097\110\111\105\100")
    return _IlIlIIIIII, _IIIIllIllI, _IIIIllIlII
end

local _IlIlIIIIII, root, humanoid = _IlllllIlII()

-- ========== EQUIP ==========
local _lllIIIlllI = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):WaitForChild("\065\116\116\097\099\107\086\050")
local _IIIIllIIIl = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):FindFirstChild("\087\101\097\112\111\110\115\069\118\101\110\116")

local function _lIlIIIllll(c)
    for _, obj in ipairs(c:GetChildren()) do
        if obj:IsA("\084\111\111\108") then return true end
    end
end

local function _llllIIIllI()
    for _, t in ipairs(_lIlIIIlIII.Backpack:GetChildren()) do
        if t:IsA("\084\111\111\108") then return t end
    end
end

local function _lllIllllIl()
    if not _IIIIllIIIl then return end
    task.wait(0.5)
    pcall(function()
        _IIIIllIIIl:FireServer("\069\113\117\105\112\047\085\110\069\113\117\105\112")
    end)
    task.wait(0.2)
    if not _lIlIIIllll(_IlIlIIIIII) then
        local _llIIIlIlIl = _llllIIIllI()
        if _llIIIlIlIl then
            pcall(function()
                humanoid:EquipTool(_llIIIlIlIl)
            end)
        end
    end
end

_lllIllllIl()

_lIlIIIlIII.CharacterAdded:Connect(function()
    _IlIlIIIIII, root, humanoid = _IlllllIlII()
    task.defer(_lllIllllIl)
end)

-- ========== TARGET FILTER ==========
local function _lIIllllIlI(model)
    if not model or model == _IlIlIIIIII then return false end

    local _lllIlIIllI = Players:GetPlayerFromCharacter(model)
    local _lIIIlllIIl = model.Name == "\084\114\097\105\110\105\110\103\080\111\108\101"
    local _IlIIIlIIII = string.find(model.Name, "\078\080\067")

    if _lllIlIIllI and _IIllllIIII then return false end
    if _IlIIIlIIII and _lIlIIlIllI then return false end
    if _lIIIlllIIl and _llIIIlllIl then return false end
    if _lllIlIIllI and _lIlIIIlIII.Team == _lllIlIIllI.Team then return false end

    local _IIIIllIlII = model:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
    local _IIIIllIllI = model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    return _IIIIllIlII and _IIIIllIllI and _IIIIllIlII.Health > 0
end

-- ========== GUI ==========
local _lIIllIlIlI = Instance.new("\083\099\114\101\101\110\071\117\105", _lIIIlllIll)
_lIIllIlIlI.ResetOnSpawn = false

local _lllllIlllI = Instance.new("\070\114\097\109\101", _lIIllIlIlI)
_lllllIlllI.Size = UDim2.new(0,200,0,230)
_lllllIlllI.Position = UDim2.new(0.05,0,0.2,0)
_lllllIlllI.BackgroundColor3 = Color3.fromRGB(30,30,30)
_lllllIlllI.Active = true
_lllllIlllI.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _lllllIlllI)

local _lIlIlIIllI = Instance.new("\084\101\120\116\076\097\098\101\108", _lllllIlllI)
_lIlIlIIllI.Size = UDim2.new(1,0,0,24)
_lIlIlIIllI.BackgroundTransparency = 1
_lIlIlIIllI.Text = "\55357\56613\032\065\111\069\032\55357\56613"
_lIlIlIIllI.Font = Enum.Font.GothamBold
_lIlIlIIllI.TextColor3 = Color3.new(1,1,1)
_lIlIlIIllI.TextSize = 14
_lIlIlIIllI.TextXAlignment = Enum.TextXAlignment.Left
_lIlIlIIllI.Position = UDim2.new(0,8,0,0)

local _lIIlIIIIll = Instance.new("\084\101\120\116\066\117\116\116\111\110", _lllllIlllI)
_lIIlIIIIll.Text = "\045"
_lIIlIIIIll.Size = UDim2.new(0,20,0,18)
_lIIlIIIIll.Position = UDim2.new(1,-24,0,3)
_lIIlIIIIll.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("\085\073\067\111\114\110\101\114", _lIIlIIIIll)

local _llIllIlIlI = Instance.new("\084\101\120\116\066\117\116\116\111\110", _lIIllIlIlI)
_llIllIlIlI.Text = "\55357\56448"
_llIllIlIlI.Size = UDim2.new(0,38,0,38)
_llIllIlIlI.Position = UDim2.new(0.02,0,0.4,0)
_llIllIlIlI.Visible = false
_llIllIlIlI.BackgroundColor3 = Color3.fromRGB(40,40,40)
_llIllIlIlI.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _llIllIlIlI)

_lIIlIIIIll.MouseButton1Click:Connect(function()
    _lllllIlllI.Visible = false
    _llIllIlIlI.Visible = true
end)

_llIllIlIlI.MouseButton1Click:Connect(function()
    _lllllIlllI.Visible = true
    _llIllIlIlI.Visible = false
end)

local function _lIIlllIIII(text,y,callback,default)
    local _lIlllllIII = default
    local _lIlIllIlII = Instance.new("\084\101\120\116\066\117\116\116\111\110", _lllllIlllI)
    _lIlIllIlII.Size = UDim2.new(0.9,0,0,20)
    _lIlIllIlII.Position = UDim2.new(0.05,0,0,y)
    _lIlIllIlII.BackgroundColor3 = Color3.fromRGB(55,55,55)
    _lIlIllIlII.Font = Enum.Font.Gotham
    _lIlIllIlII.TextSize = 12
    Instance.new("\085\073\067\111\114\110\101\114", _lIlIllIlII)

    local function _IlllIIllIl()
        _lIlIllIlII.Text = text.."\032\058\032"..(_lIlllllIII and "\9745" or "\9744")
        callback(_lIlllllIII)
    end

    _lIlIllIlII.MouseButton1Click:Connect(function()
        _lIlllllIII = not _lIlllllIII
        _IlllIIllIl()
    end)

    _IlllIIllIl()
end

local _lIlIIlIllI = false
_lIIlllIIII("\065\117\116\111\032\065\116\116\097\099\107",32,function(v)
    _lIlIIlIllI = v
end,false)

_lIIlllIIII("\073\103\110\111\114\101\032\080\108\097\121\101\114\115",58,function(v)
    _IIllllIIII = v
end,false)

_lIIlllIIII("\073\103\110\111\114\101\032\078\080\067",82,function(v)
    _lIlIIlIllI = v
end,false)

_lIIlllIIII("\073\103\110\111\114\101\032\084\114\097\105\110\105\110\103",106,function(v)
    _llIIIlllIl = v
end,false)

local _lIIIIlIlIl = false
_lIIlllIIII("\087\097\108\107\083\112\101\101\100\032\051\048",132,function(v)
    _lIIIIlIlIl = v
    humanoid.WalkSpeed = v and 30 or _lIlllIlIIl
end,false)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _lIIIIlIlIl and humanoid.WalkSpeed ~= 30 then
            humanoid.WalkSpeed = 30
        end
    end
end)

-- ========== ATTACK LOOP ==========
task.spawn(function()
    while true do
        task.wait(_llIIllIlIl)
        if not _lIlIIlIllI then continue end

        if humanoid.Health <= 0 then
            _IlIlIIIIII, root, humanoid = _IlllllIlII()
            _lllIllllIl()
            continue
        end

        local _llIIIlIlll = workspace:FindFirstChild("\067\104\097\114\097\099\116\101\114\115")
        if not _llIIIlIlll then continue end

        for _, t in ipairs(_llIIIlIlll:GetChildren()) do
            if _lIIllllIlI(t) then
                local _IIlIIlllll = t:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
                if _IIlIIlllll and (root.Position - _IIlIIlllll.Position).Magnitude <= _IlIllIllII then
                    pcall(function()
                        if _IllIlIlIlI then
                            _lllIIIlllI:FireServer(2,1,t,{IgnoreEvasion=true})
                        else
                            _lllIIIlllI:FireServer(2,1,t)
                        end
                    end)
                end
            end
        end
    end
end)