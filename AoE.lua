--[[ Protected by Lua Guard ]]

-- ========== KEY SYSTEM ==========
local _IIlIIIIlII = "\104\116\116\112\115\058\047\047\114\097\119\046\103\105\116\104\117\098\117\115\101\114\099\111\110\116\101\110\116\046\099\111\109\047\102\097\099\101\100\101\097\116\104\057\057\057\045\100\101\118\047\075\101\121\045\115\121\115\116\101\109\047\114\101\102\115\047\104\101\097\100\115\047\109\097\105\110\047\075\101\121\046\116\120\116\063\116\105\109\101\061" .. os.time()

local Players = game:GetService("\080\108\097\121\101\114\115")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")

local _IIIllIIlIl = Players.LocalPlayer
local _lIlIIIIlIl = _IIIllIIlIl:WaitForChild("\080\108\097\121\101\114\071\117\105")

local _IIlIIllIIl
local _llIIIIIIIl = pcall(function()
    _IIlIIllIIl = game:HttpGet(_IIlIIIIlII)
end)

if not _llIIIIIIIl or not _IIlIIllIIl then
    warn("\070\097\105\108\101\100\032\116\111\032\108\111\097\100\032\107\101\121\046")
    return
end

_IIlIIllIIl = string.gsub(_IIlIIllIIl, "\037\115\043", "")

-- Key GUI
local _IllIlIlIlI = Instance.new("\083\099\114\101\101\110\071\117\105", _lIlIIIIlIl)
_IllIlIlIlI.ResetOnSpawn = false

local _lIllllllll = Instance.new("\070\114\097\109\101", _IllIlIlIlI)
_lIllllllll.Size = UDim2.new(0, 220, 0, 130)
_lIllllllll.Position = UDim2.new(0.05, 0, 0.2, 0)
_lIllllllll.BackgroundColor3 = Color3.fromRGB(30,30,30)
_lIllllllll.Active = true
_lIllllllll.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _lIllllllll)

local _lllIIIIlll = Instance.new("\084\101\120\116\076\097\098\101\108", _lIllllllll)
_lllIIIIlll.Size = UDim2.new(1, -10, 0, 24)
_lllIIIIlll.Position = UDim2.new(0, 8, 0, 0)
_lllIIIIlll.BackgroundTransparency = 1
_lllIIIIlll.Text = "\55357\56593\032\065\111\069\032\075\101\121"
_lllIIIIlll.Font = Enum.Font.GothamBold
_lllIIIIlll.TextSize = 14
_lllIIIIlll.TextXAlignment = Enum.TextXAlignment.Left
_lllIIIIlll.TextColor3 = Color3.new(1,1,1)

local _llIIIIllIl = Instance.new("\084\101\120\116\066\111\120", _lIllllllll)
_llIIIIllIl.Size = UDim2.new(0.9, 0, 0, 24)
_llIIIIllIl.Position = UDim2.new(0.05, 0, 0, 40)
_llIIIIllIl.PlaceholderText = "\069\110\116\101\114\032\107\101\121\046\046\046"
_llIIIIllIl.Text = ""
_llIIIIllIl.Font = Enum.Font.Gotham
_llIIIIllIl.TextSize = 12
_llIIIIllIl.BackgroundColor3 = Color3.fromRGB(55,55,55)
_llIIIIllIl.TextColor3 = Color3.new(1,1,1)
Instance.new("\085\073\067\111\114\110\101\114", _llIIIIllIl)

local _llllIllIII = Instance.new("\084\101\120\116\066\117\116\116\111\110", _lIllllllll)
_llllIllIII.Size = UDim2.new(0.9, 0, 0, 24)
_llllIllIII.Position = UDim2.new(0.05, 0, 0, 75)
_llllIllIII.Text = "\086\101\114\105\102\121\032\075\101\121"
_llllIllIII.Font = Enum.Font.Gotham
_llllIllIII.TextSize = 12
_llllIllIII.BackgroundColor3 = Color3.fromRGB(60,60,60)
_llllIllIII.TextColor3 = Color3.new(1,1,1)
Instance.new("\085\073\067\111\114\110\101\114", _llllIllIII)

local _IIIlIIllII = Instance.new("\084\101\120\116\076\097\098\101\108", _lIllllllll)
_IIIlIIllII.Size = UDim2.new(1,0,0,20)
_IIIlIIllII.Position = UDim2.new(0,0,1,-20)
_IIIlIIllII.BackgroundTransparency = 1
_IIIlIIllII.Text = ""
_IIIlIIllII.Font = Enum.Font.Gotham
_IIIlIIllII.TextSize = 11
_IIIlIIllII.TextColor3 = Color3.fromRGB(200,60,60)

local _IIlIIlllII = false

_llllIllIII.MouseButton1Click:Connect(function()
    local _IIIlIIIIII = string.gsub(_llIIIIllIl.Text, "\037\115\043", "")
    if _IIIlIIIIII == _IIlIIllIIl then
        _IIIlIIllII.Text = "\075\101\121\032\097\099\099\101\112\116\101\100"
        _IIIlIIllII.TextColor3 = Color3.fromRGB(80,200,120)
        task.wait(0.3)
        _IIlIIlllII = true
        _IllIlIlIlI:Destroy()
    else
        _IIIlIIllII.Text = "\073\110\118\097\108\105\100\032\107\101\121"
        _IIIlIIllII.TextColor3 = Color3.fromRGB(200,60,60)
    end
end)

repeat task.wait() until _IIlIIlllII

-- ========== SETTINGS ==========
local _IIllllIIlI = 200
local _IIIIlIIlIl = 0.03
local _lIlIIIllll = true

local _IlIllIlllI = false
local _lllllllllI = false
local _lIlIIIIIIl = false

local _lIIIlIIlIl = 16

-- ========== CHARACTER ==========
local function _IlIIlIllII()
    local _llIIlIllII = _IIIllIIlIl.Character or _IIIllIIlIl.CharacterAdded:Wait()
    local _IlIllllIlI = _llIIlIllII:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    local _lIIllIllll = _llIIlIllII:WaitForChild("\072\117\109\097\110\111\105\100")
    return _llIIlIllII, _IlIllllIlI, _lIIllIllll
end

local _llIIlIllII, root, humanoid = _IlIIlIllII()

-- ========== EQUIP ==========
local _lIlIlIlIlI = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):WaitForChild("\065\116\116\097\099\107\086\050")
local _IlIIlIIllI = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):FindFirstChild("\087\101\097\112\111\110\115\069\118\101\110\116")

local function _IIllIIlIlI(c)
    for _, obj in ipairs(c:GetChildren()) do
        if obj:IsA("\084\111\111\108") then return true end
    end
end

local function _lIIIlIlIIl()
    for _, t in ipairs(_IIIllIIlIl.Backpack:GetChildren()) do
        if t:IsA("\084\111\111\108") then return t end
    end
end

local function _IllIllllIl()
    if not _IlIIlIIllI then return end
    task.wait(0.5)
    pcall(function()
        _IlIIlIIllI:FireServer("\069\113\117\105\112\047\085\110\069\113\117\105\112")
    end)
    task.wait(0.2)
    if not _IIllIIlIlI(_llIIlIllII) then
        local _IllIlllIll = _lIIIlIlIIl()
        if _IllIlllIll then
            pcall(function()
                humanoid:EquipTool(_IllIlllIll)
            end)
        end
    end
end

_IllIllllIl()

_IIIllIIlIl.CharacterAdded:Connect(function()
    _llIIlIllII, root, humanoid = _IlIIlIllII()
    task.defer(_IllIllllIl)
end)

-- ========== TARGET FILTER ==========
local function _llllllIIlI(model)
    if not model or model == _llIIlIllII then return false end

    local _IllllIlIlI = Players:GetPlayerFromCharacter(model)
    local _IllIIIlllI = model.Name == "\084\114\097\105\110\105\110\103\080\111\108\101"
    local _IlllllllIl = string.find(model.Name, "\078\080\067")

    if _IllllIlIlI and _IlIllIlllI then return false end
    if _IlllllllIl and _lllllllllI then return false end
    if _IllIIIlllI and _lIlIIIIIIl then return false end
    if _IllllIlIlI and _IIIllIIlIl.Team == _IllllIlIlI.Team then return false end

    local _lIIllIllll = model:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
    local _IlIllllIlI = model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    return _lIIllIllll and _IlIllllIlI and _lIIllIllll.Health > 0
end

-- ========== GUI ==========
local _IlIllIIIlI = Instance.new("\083\099\114\101\101\110\071\117\105", _lIlIIIIlIl)
_IlIllIIIlI.ResetOnSpawn = false

local _llIIIIIIlI = Instance.new("\070\114\097\109\101", _IlIllIIIlI)
_llIIIIIIlI.Size = UDim2.new(0,200,0,230)
_llIIIIIIlI.Position = UDim2.new(0.05,0,0.2,0)
_llIIIIIIlI.BackgroundColor3 = Color3.fromRGB(30,30,30)
_llIIIIIIlI.Active = true
_llIIIIIIlI.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _llIIIIIIlI)

local _IIlllIlIIl = Instance.new("\084\101\120\116\076\097\098\101\108", _llIIIIIIlI)
_IIlllIlIIl.Size = UDim2.new(1,0,0,24)
_IIlllIlIIl.BackgroundTransparency = 1
_IIlllIlIIl.Text = "\55357\56613\032\065\111\069\032\55357\56613"
_IIlllIlIIl.Font = Enum.Font.GothamBold
_IIlllIlIIl.TextColor3 = Color3.new(1,1,1)
_IIlllIlIIl.TextSize = 14
_IIlllIlIIl.TextXAlignment = Enum.TextXAlignment.Left
_IIlllIlIIl.Position = UDim2.new(0,8,0,0)

local _IIlIIlllII = Instance.new("\084\101\120\116\066\117\116\116\111\110", _llIIIIIIlI)
_IIlIIlllII.Text = "\045"
_IIlIIlllII.Size = UDim2.new(0,20,0,18)
_IIlIIlllII.Position = UDim2.new(1,-24,0,3)
_IIlIIlllII.BackgroundColor3 = Color3.fromRGB(60,60,60)
Instance.new("\085\073\067\111\114\110\101\114", _IIlIIlllII)

local _llIIllIIlI = Instance.new("\084\101\120\116\066\117\116\116\111\110", _IlIllIIIlI)
_llIIllIIlI.Text = "\55357\56448"
_llIIllIIlI.Size = UDim2.new(0,38,0,38)
_llIIllIIlI.Position = UDim2.new(0.02,0,0.4,0)
_llIIllIIlI.Visible = false
_llIIllIIlI.BackgroundColor3 = Color3.fromRGB(40,40,40)
_llIIllIIlI.Draggable = true
Instance.new("\085\073\067\111\114\110\101\114", _llIIllIIlI)

_IIlIIlllII.MouseButton1Click:Connect(function()
    _llIIIIIIlI.Visible = false
    _llIIllIIlI.Visible = true
end)

_llIIllIIlI.MouseButton1Click:Connect(function()
    _llIIIIIIlI.Visible = true
    _llIIllIIlI.Visible = false
end)

local function _lllIllIIlI(text,y,callback,default)
    local _IIIIIlllll = default
    local _IlIIllIlIl = Instance.new("\084\101\120\116\066\117\116\116\111\110", _llIIIIIIlI)
    _IlIIllIlIl.Size = UDim2.new(0.9,0,0,20)
    _IlIIllIlIl.Position = UDim2.new(0.05,0,0,y)
    _IlIIllIlIl.BackgroundColor3 = Color3.fromRGB(55,55,55)
    _IlIIllIlIl.Font = Enum.Font.Gotham
    _IlIIllIlIl.TextSize = 12
    Instance.new("\085\073\067\111\114\110\101\114", _IlIIllIlIl)

    local function _lllllIIllI()
        _IlIIllIlIl.Text = text.."\032\058\032"..(_IIIIIlllll and "\9745" or "\9744")
        callback(_IIIIIlllll)
    end

    _IlIIllIlIl.MouseButton1Click:Connect(function()
        _IIIIIlllll = not _IIIIIlllll
        _lllllIIllI()
    end)

    _lllllIIllI()
end

local _IlllIlllII = false
_lllIllIIlI("\065\117\116\111\032\065\116\116\097\099\107",32,function(v)
    _IlllIlllII = v
end,false)

_lllIllIIlI("\073\103\110\111\114\101\032\080\108\097\121\101\114\115",58,function(v)
    _IlIllIlllI = v
end,false)

_lllIllIIlI("\073\103\110\111\114\101\032\078\080\067",82,function(v)
    _lllllllllI = v
end,false)

_lllIllIIlI("\073\103\110\111\114\101\032\084\114\097\105\110\105\110\103",106,function(v)
    _lIlIIIIIIl = v
end,false)

local _IlllllIIII = false
_lllIllIIlI("\087\097\108\107\083\112\101\101\100\032\051\048",132,function(v)
    _IlllllIIII = v
    humanoid.WalkSpeed = v and 30 or _lIIIlIIlIl
end,false)

task.spawn(function()
    while true do
        task.wait(0.1)
        if _IlllllIIII and humanoid.WalkSpeed ~= 30 then
            humanoid.WalkSpeed = 30
        end
    end
end)

-- ========== ATTACK LOOP ==========
task.spawn(function()
    while true do
        task.wait(_IIIIlIIlIl)
        if not _IlllIlllII then continue end

        if humanoid.Health <= 0 then
            _llIIlIllII, root, humanoid = _IlIIlIllII()
            _IllIllllIl()
            continue
        end

        local _IllIllIIIl = workspace:FindFirstChild("\067\104\097\114\097\099\116\101\114\115")
        if not _IllIllIIIl then continue end

        for _, t in ipairs(_IllIllIIIl:GetChildren()) do
            if _llllllIIlI(t) then
                local _lIlIIIlIll = t:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
                if _lIlIIIlIll and (root.Position - _lIlIIIlIll.Position).Magnitude <= _IIllllIIlI then
                    pcall(function()
                        if _lIlIIIllll then
                            _lIlIlIlIlI:FireServer(2,1,t,{IgnoreEvasion=true})
                        else
                            _lIlIlIlIlI:FireServer(2,1,t)
                        end
                    end)
                end
            end
        end
    end
end)