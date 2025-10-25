PLAYER STUFF:
-- Get Local Player
local player = game.Players.LocalPlayer

-- Get Character
local character = player.Character or player.CharacterAdded:Wait()

-- Get Humanoid
local humanoid = character:WaitForChild("Humanoid")

-- Get HumanoidRootPart (main body part)
local hrp = character:WaitForChild("HumanoidRootPart")
MOVEMENT:
-- WalkSpeed (default is 16)
humanoid.WalkSpeed = 50

-- JumpPower (default is 50)
humanoid.JumpPower = 100

-- JumpHeight (newer games use this instead)
humanoid.JumpHeight = 20

-- Disable Jump
humanoid.JumpPower = 0
HEALTH:
-- Set Health
humanoid.Health = 100

-- Set Max Health
humanoid.MaxHealth = 200

-- Kill Player
humanoid.Health = 0

-- God Mode
humanoid.MaxHealth = math.huge
humanoid.Health = math.huge
TELEPORTATION:
-- Teleport to Position
hrp.CFrame = CFrame.new(0, 50, 0)

-- Teleport to Another Player
local targetPlayer = game.Players:FindFirstChild("PlayerName")
if targetPlayer and targetPlayer.Character then
    hrp.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
end
WORKSPACE:
-- Gravity (default is 196.2)
workspace.Gravity = 50

-- Time of Day
game.Lighting.ClockTime = 12 -- noon
game.Lighting.ClockTime = 0 -- midnight

-- Brightness
game.Lighting.Brightness = 5

-- Fog
game.Lighting.FogEnd = 100
NOCLIP:
-- Simple Noclip
local noclip = false
local player = game.Players.LocalPlayer

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Toggle noclip
noclip = true -- or false
FLY:
local flying = false
local speed = 50
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}

local mouse = game.Players.LocalPlayer:GetMouse()
local character = game.Players.LocalPlayer.Character
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local function Fly()
    local bg = Instance.new("BodyGyro", hrp)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = hrp.CFrame
    
    local bv = Instance.new("BodyVelocity", hrp)
    bv.velocity = Vector3.new(0, 0.1, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    
    repeat wait()
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed + 0.5
            if speed > 50 then
                speed = 50
            end
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
            speed = speed - 1
            if speed < 0 then
                speed = 0
            end
        end
        
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * speed
        else
            bv.velocity = Vector3.new(0, 0.1, 0)
        end
        
        bg.cframe = workspace.CurrentCamera.CoordinateFrame
    until not flying
    
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
    humanoid.PlatformStand = false
end

mouse.KeyDown:Connect(function(key)
    if key:lower() == "e" then
        if flying then
            flying = false
        else
            flying = true
            Fly()
        end
    elseif key:lower() == "w" then
        ctrl.f = 1
    elseif key:lower() == "s" then
        ctrl.b = -1
    elseif key:lower() == "a" then
        ctrl.l = -1
    elseif key:lower() == "d" then
        ctrl.r = 1
    end
end)

mouse.KeyUp:Connect(function(key)
    if key:lower() == "w" then
        ctrl.f = 0
    elseif key:lower() == "s" then
        ctrl.b = 0
    elseif key:lower() == "a" then
        ctrl.l = 0
    elseif key:lower() == "d" then
        ctrl.r = 0
    end
end)
REMOVE TOOLS:
-- Remove all tools
player.Character.Humanoid:UnequipTools()
for _, tool in pairs(player.Backpack:GetChildren()) do
    tool:Destroy()
end
INFINITE JUMP:
local InfiniteJump = true
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJump then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
LOOP FUNCTIONS:
-- Loop every frame
game:GetService("RunService").Heartbeat:Connect(function()
    -- code here
end)

-- Loop with wait
while wait(1) do
    -- runs every 1 second
end

-- Spawn (runs code without stopping script)
spawn(function()
    -- code here
end)
FIND PLAYERS:
-- Get all players
for _, player in pairs(game.Players:GetPlayers()) do
    print(player.Name)
end

-- Find specific player
local targetPlayer = game.Players:FindFirstChild("Username")

-- Get nearest player
local nearestPlayer = nil
local shortestDistance = math.huge
for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer and player.Character then
        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
        if distance < shortestDistance then
            shortestDistance = distance
            nearestPlayer = player
        end
    end
end
NOTIFICATIONS:
game.StarterGui:SetCore("SendNotification", {
    Title = "Title";
    Text = "Message here";
    Duration = 5;
})

GET PLAYER/CHARACTER:
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
SPEED & JUMP:
-- WalkSpeed
humanoid.WalkSpeed = 100

-- JumpPower
humanoid.JumpPower = 150

-- Or JumpHeight (some games use this)
humanoid.JumpHeight = 50
GOD MODE:
-- Method 1
humanoid.MaxHealth = math.huge
humanoid.Health = math.huge

-- Method 2 (better)
humanoid:GetPropertyChangedSignal("Health"):Connect(function()
    humanoid.Health = humanoid.MaxHealth
end)
NOCLIP:
local noclip = true
game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end)
TELEPORT:
-- Teleport to position
hrp.CFrame = CFrame.new(0, 50, 0)

-- Teleport to player
local target = game.Players:FindFirstChild("Username")
if target and target.Character then
    hrp.CFrame = target.Character.HumanoidRootPart.CFrame
end

-- Teleport with offset
hrp.CFrame = CFrame.new(Vector3.new(0, 50, 0)) * CFrame.Angles(0, math.rad(180), 0)
INFINITE JUMP:
game:GetService("UserInputService").JumpRequest:Connect(function()
    if character and humanoid then
        humanoid:ChangeState("Jumping")
    end
end)
WORKSPACE:
-- Gravity
workspace.Gravity = 10

-- FOV
workspace.CurrentCamera.FieldOfView = 120
FIND PLAYERS:
-- All players
for _, plr in pairs(game.Players:GetPlayers()) do
    print(plr.Name)
end

-- Nearest player
local function GetNearestPlayer()
    local nearest = nil
    local shortestDist = math.huge
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (hrp.Position - plr.Character.HumanoidRootPart.Position).Magnitude
            if dist < shortestDist then
                shortestDist = dist
                nearest = plr
            end
        end
    end
    
    return nearest
end
LOOP TO ALL PLAYERS:
-- Teleport to all players (kill all)
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = plr.Character.HumanoidRootPart.CFrame
        wait(0.5)
    end
end
AUTO FARM LOOPS:
local farming = true

spawn(function()
    while farming and wait(0.1) do
        -- Your farming code here
        print("Farming...")
    end
end)

-- To stop: farming = false
KEYBINDS:
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        print("E pressed!")
    elseif input.KeyCode == Enum.KeyCode.Q then
        print("Q pressed!")
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        print("Left Ctrl pressed!")
    end
end)
REMOVE STUFF:
-- Delete all parts named "Wall"
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Wall" and v:IsA("BasePart") then
        v:Destroy()
    end
end

-- Delete barriers
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") and v.Transparency == 1 and v.CanCollide == true then
        v:Destroy()
    end
end
ESP (SIMPLE VERSION):
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character then
        local highlight = Instance.new("Highlight")
        highlight.Parent = plr.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    end
end
BRING PARTS TO YOU:
-- Bring all coins to you
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Coin" and v:IsA("BasePart") then
        v.CFrame = hrp.CFrame
    end
end
FIRE REMOTES:
-- FireServer
game:GetService("ReplicatedStorage").RemoteName:FireServer()

-- With arguments
game:GetService("ReplicatedStorage").RemoteName:FireServer("arg1", 100, true)

-- InvokeServer
game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer()
SPIN FARM:
local spinning = true

spawn(function()
    while spinning and wait() do
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(20), 0)
    end
end)
AUTO COLLECT:
-- Auto collect items (firetouchinterest)
for _, v in pairs(workspace:GetDescendants()) do
    if v.Name == "Coin" and v:IsA("BasePart") then
        firetouchinterest(hrp, v, 0)
        wait()
        firetouchinterest(hrp, v, 1)
    end
end
ANTI-AFK:
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
CHAT SPAM:
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sayMessage = ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")

while wait(1) do
    sayMessage:FireServer("Your message here", "All")
end
PART PROPERTIES YOU'LL USE:
part.Transparency = 1 -- invisible
part.CanCollide = false -- no collision
part.Anchored = true -- can't move
part.Size = Vector3.new(10, 10, 10)
part.Position = Vector3.new(0, 50, 0)
part.CFrame = CFrame.new(0, 50, 0)
MATH YOU'LL ACTUALLY USE:
-- Random
math.random(1, 100)

-- Distance
(pos1 - pos2).Magnitude

-- Angles (for spinning)
math.rad(180) -- degrees to radians
