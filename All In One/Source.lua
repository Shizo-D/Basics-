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
