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

ESP

-- Services
local RunService = game:GetService("RunService");
local PlayersService = game:GetService("Players");

-- Variables
local Camera = workspace.CurrentCamera;
local LastPos;
local Lines = {};
local Quads = {};

-- Functions
local function HasCharacter(Player)
    return Player.Character and Player.Character:FindFirstChild("HumanoidRootPart");
end;

local function DrawQuad(PosA, PosB, PosC, PosD)
    local PosAScreen, PosAVisible = Camera:WorldToViewportPoint(PosA);
    local PosBScreen, PosBVisible = Camera:WorldToViewportPoint(PosB);
    local PosCScreen, PosCVisible = Camera:WorldToViewportPoint(PosC);
    local PosDScreen, PosDVisible = Camera:WorldToViewportPoint(PosD);

    if (not PosAVisible and not PosBVisible and not PosCVisible and not PosDVisible) then return; end;

    local PosAVec = Vector2.new(PosAScreen.X, PosAScreen.Y);
    local PosBVec = Vector2.new(PosBScreen.X, PosBScreen.Y);
    local PosCVec = Vector2.new(PosCScreen.X, PosCScreen.Y);
    local PosDVec = Vector2.new(PosDScreen.X, PosDScreen.Y);

    local Quad = Drawing.new("Quad");
        Quad.Thickness = .5;
        Quad.Color = Color3.fromRGB(255, 255, 255);
        Quad.Transparency = .25;
        Quad.ZIndex = 1;
        Quad.Filled = true
        Quad.Visible = true;

        Quad.PointA = PosAVec;
        Quad.PointB = PosBVec;
        Quad.PointC = PosCVec;
        Quad.PointD = PosDVec;

    table.insert(Quads, Quad)
end

local function DrawLine(From, To)
    local FromScreen, FromVisible = Camera:WorldToViewportPoint(From);
    local ToScreen, ToVisible = Camera:WorldToViewportPoint(To);

    if (not FromVisible and not ToVisible) then return; end;

    local FromPos = Vector2.new(FromScreen.X, FromScreen.Y);
    local ToPos = Vector2.new(ToScreen.X, ToScreen.Y);

    local Line = Drawing.new("Line");
        Line.Thickness = 1;
        Line.From = FromPos
        Line.To = ToPos
        Line.Color = Color3.fromRGB(255, 255, 255);
        Line.Transparency = 1;
        Line.ZIndex = 1;
        Line.Visible = true;

    table.insert(Lines, Line)
end

-- Thank you Nahida#5000 for this function (GetCorners = GetVertices)
local function GetCorners(Part)
    local CF, Size, Corners = Part.CFrame, Part.Size / 2, {};
    for X = -1, 1, 2 do for Y = -1, 1, 2 do for Z = -1, 1, 2 do
        Corners[#Corners+1] = (CF * CFrame.new(Size * Vector3.new(X, Y, Z))).Position;      
    end; end; end;
    return Corners;
end;

local function DrawEsp(Player)
    local HRP = Player.Character.HumanoidRootPart;

    -- Constructing the 3d box.
    local CubeVertices = GetCorners({CFrame = HRP.CFrame * CFrame.new(0, -0.5, 0), Size = Vector3.new(3, 5, 3)});

    -- Drawing the 3d box.
        -- Bottom face:
        DrawLine(CubeVertices[1], CubeVertices[2]);
        DrawLine(CubeVertices[2], CubeVertices[6]);
        DrawLine(CubeVertices[6], CubeVertices[5]);
        DrawLine(CubeVertices[5], CubeVertices[1]);

        DrawQuad(CubeVertices[1], CubeVertices[2], CubeVertices[6], CubeVertices[5]);
       
        -- Side faces:
        DrawLine(CubeVertices[1], CubeVertices[3]);
        DrawLine(CubeVertices[2], CubeVertices[4]);
        DrawLine(CubeVertices[6], CubeVertices[8]);
        DrawLine(CubeVertices[5], CubeVertices[7]);

        DrawQuad(CubeVertices[2], CubeVertices[4], CubeVertices[8], CubeVertices[6]);
        DrawQuad(CubeVertices[1], CubeVertices[2], CubeVertices[4], CubeVertices[3]);
        DrawQuad(CubeVertices[1], CubeVertices[5], CubeVertices[7], CubeVertices[3]);
        DrawQuad(CubeVertices[5], CubeVertices[7], CubeVertices[8], CubeVertices[6]);

        -- Top face:
        DrawLine(CubeVertices[3], CubeVertices[4]);
        DrawLine(CubeVertices[4], CubeVertices[8]);
        DrawLine(CubeVertices[8], CubeVertices[7]);
        DrawLine(CubeVertices[7], CubeVertices[3]);
       
        DrawQuad(CubeVertices[3], CubeVertices[4], CubeVertices[8], CubeVertices[7]);
end;

local function BoxEsp()
    local Players = PlayersService:GetPlayers();

    for i = 1, #Lines do
        local Line = rawget(Lines, i);
        if (Line) then Line:Remove(); end;
    end;

    Lines = {};

    for i = 1, #Quads do
        local Quad = rawget(Quads, i);
        if (Quad) then Quad:Remove(); end;
    end;

    Quads = {};

    for i = 1, #Players do
        local Player = rawget(Players, i);
        if HasCharacter(Player) then
            DrawEsp(Player);
        end;
    end;
end;

-- Main
RunService.RenderStepped:Connect(BoxEsp);


CAMERA TRICKS
local camera = workspace.CurrentCamera

-- Zoom out FAR
camera.FieldOfView = 120 -- Default is 70

-- Lock to first person
player.CameraMode = Enum.CameraMode.LockFirstPerson

-- Unlock camera
player.CameraMode = Enum.CameraMode.Classic

-- Remove zoom limit
player.CameraMaxZoomDistance = 9999
player.CameraMinZoomDistance = 0
ANIMATIONS
-- Stop ALL animations (good for bypassing some stuff)
for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
    track:Stop()
end

-- Play custom animation
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://123456789" -- Animation ID
local track = humanoid:LoadAnimation(anim)
track:Play()
PLATFORM/PART UNDER YOU
-- Create invisible platform under you
local platform = Instance.new("Part")
platform.Size = Vector3.new(10, 1, 10)
platform.Anchored = true
platform.Transparency = 1
platform.CanCollide = true
platform.Parent = workspace

-- Keep it under you
spawn(function()
    while wait() do
        if character and hrp then
            platform.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
        end
    end
end)
CHECKING GAME NAME
-- Know what game you're in
local gameId = game.PlaceId
print("Game ID: " .. gameId)

-- Check if specific game
if game.PlaceId == 123456789 then
    print("You're in that game!")
end
TEAM CHECKING
-- Check your team
if player.Team then
    print("Your team: " .. player.Team.Name)
end

-- Check if same team as another player
local otherPlayer = game.Players:FindFirstChild("Username")
if otherPlayer and player.Team == otherPlayer.Team then
    print("Same team!")
end
RESPAWN YOURSELF
-- Method 1
player.Character:BreakJoints()

-- Method 2
humanoid.Health = 0

-- Method 3
player:LoadCharacter()
TOOLS/ITEMS
-- Get all tools in your backpack
for _, tool in pairs(player.Backpack:GetChildren()) do
    print(tool.Name)
end

-- Equip a tool
local tool = player.Backpack:FindFirstChild("ToolName")
if tool then
    humanoid:EquipTool(tool)
end

-- Unequip all tools
humanoid:UnequipTools()

-- Delete all your tools
for _, tool in pairs(player.Backpack:GetChildren()) do
    tool:Destroy()
end
FLING PLAYERS (PHYSICS)
-- Fling someone (works in some games)
local target = game.Players:FindFirstChild("Username")

if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
    local targetHRP = target.Character.HumanoidRootPart
    
    -- Save your position
    local oldPos = hrp.CFrame
    
    -- Go to them fast
    hrp.CFrame = targetHRP.CFrame
    wait(0.1)
    
    -- Create force
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 1000, 0)
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Parent = hrp
    
    wait(0.1)
    bodyVelocity:Destroy()
    
    -- Go back
    hrp.CFrame = oldPos
end
KICK YOURSELF (LEAVE GAME)
player:Kick("Leaving game...")
GET GAME STATS
-- FPS
local fps = workspace:GetRealPhysicsFPS()
print("FPS: " .. math.floor(fps))

-- Ping
local ping = player:GetNetworkPing()
print("Ping: " .. math.floor(ping * 1000) .. "ms")

-- How many players
local playerCount = #game.Players:GetPlayers()
print("Players in game: " .. playerCount)
TIME/DATE
-- Current time in game
local timeNow = tick()
print(timeNow)

-- Wait until specific time
local targetTime = os.time() + 10 -- 10 seconds from now
repeat wait() until os.time() >= targetTime
print("10 seconds passed!")
MAKE TRAILS BEHIND YOU
local trail = Instance.new("Trail")
local attachment0 = Instance.new("Attachment", hrp)
local attachment1 = Instance.new("Attachment", hrp)

attachment0.Position = Vector3.new(0, -2, 0)
attachment1.Position = Vector3.new(0, 2, 0)

trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
trail.Lifetime = 1
trail.Parent = hrp
CHANGE YOUR NAME (CLIENT SIDE ONLY)
-- Change your display name (only YOU see it)
player.DisplayName = "New Name"
player.Name = "New Name"
SPAM JUMP
spawn(function()
    while wait(0.1) do
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
SPIN CHARACTER
-- Spin yourself
spawn(function()
    while wait() do
        hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(10), 0)
    end
end)
AUTO CLICK (MOUSE)
local mouse = player:GetMouse()

spawn(function()
    while wait(0.1) do
        mouse1click() -- Auto clicks
    end
end)
FULLBRIGHT (SEE IN DARK)
-- Make everything bright
game.Lighting.Brightness = 2
game.Lighting.ClockTime = 12
game.Lighting.FogEnd = 100000
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
X-RAY VISION (SEE THROUGH WALLS)
-- Make all parts transparent
for _, part in pairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") then
        part.Transparency = 0.7
    end
end
FIND SPECIFIC ITEMS
-- Find all coins
local coins = {}

for _, item in pairs(workspace:GetDescendants()) do
    if item.Name == "Coin" then
        table.insert(coins, item)
    end
end

print("Found " .. #coins .. " coins!")
AUTO COLLECT ITEMS
-- Collect all coins
for _, coin in pairs(workspace:GetDescendants()) do
    if coin.Name == "Coin" and coin:IsA("BasePart") then
        -- Teleport coin to you
        coin.CFrame = hrp.CFrame
        wait(0.1)
    end
end
FIRE TOUCH INTEREST (TOUCH PARTS)
-- Touch a part without actually touching it
local part = workspace.Coin

firetouchinterest(hrp, part, 0) -- Start touch
wait(0.1)
firetouchinterest(hrp, part, 1) -- End touch
CHAT COMMANDS
player.Chatted:Connect(function(message)
    if message == "/speed" then
        humanoid.WalkSpeed = 100
    elseif message == "/jump" then
        humanoid.JumpPower = 200
    elseif message == "/reset" then
        humanoid.Health = 0
    elseif message:sub(1, 3) == "/tp" then
        local username = message:sub(5) -- Get name after "/tp "
        local target = game.Players:FindFirstChild(username)
        
        if target and target.Character then
            hrp.CFrame = target.Character.HumanoidRootPart.CFrame
        end
    end
end)
COPY CHARACTER APPEARANCE
-- Copy someone's look
local target = game.Players:FindFirstChild("Username")

if target and target.Character then
    for _, item in pairs(target.Character:GetChildren()) do
        if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") then
            item:Clone().Parent = character
        end
    end
end
REMOVE SPECIFIC PARTS
-- Remove all invisible parts
for _, part in pairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") and part.Transparency == 1 then
        part:Destroy()
    end
end

-- Remove all kill parts
for _, part in pairs(workspace:GetDescendants()) do
    if part.Name == "KillBrick" or part.Name == "Lava" then
        part:Destroy()
    end
end
LAG SWITCH (FREEZE EVERYONE)
-- Warning: Can get you kicked!
settings():GetService("NetworkSettings").IncomingReplicationLag = 1000
wait(5)
settings():GetService("NetworkSettings").IncomingReplicationLag = 0
