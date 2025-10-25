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


HITBOX EXPANDER (MAKE PLAYERS BIGGER TO HIT)
-- Make all players have HUGE hitboxes
for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer and player.Character then
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = Vector3.new(20, 20, 20) -- HUGE
            hrp.Transparency = 0.8
            hrp.CanCollide = false
        end
    end
end
REMOVE DEATH BARRIERS
-- Delete all kill parts
for _, part in pairs(workspace:GetDescendants()) do
    if part:IsA("BasePart") and part:FindFirstChild("TouchInterest") then
        -- Check if it kills you
        if part.Name:lower():find("kill") or 
           part.Name:lower():find("death") or 
           part.Name:lower():find("lava") or
           part.Name:lower():find("void") then
            part:Destroy()
        end
    end
end
SILENT AIM (AUTO AIM)
-- Gets closest player for aiming
local function GetClosestPlayerToMouse()
    local closest = nil
    local shortestDistance = math.huge
    local mouse = player:GetMouse()
    
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            local pos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.Position)
            
            if onScreen then
                local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                
                if distance < shortestDistance then
                    shortestDistance = distance
                    closest = plr
                end
            end
        end
    end
    
    return closest
end
HEALTH BAR ESP
-- Show health bars above players
for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
        local head = plr.Character.Head
        
        local billboard = Instance.new("BillboardGui")
        billboard.Parent = head
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(4, 0, 1, 0)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        
        local frame = Instance.new("Frame")
        frame.Parent = billboard
        frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        frame.Size = UDim2.new(1, 0, 0.1, 0)
        frame.BorderSizePixel = 0
        
        local text = Instance.new("TextLabel")
        text.Parent = billboard
        text.Size = UDim2.new(1, 0, 1, 0)
        text.BackgroundTransparency = 1
        text.TextColor3 = Color3.fromRGB(255, 255, 255)
        text.TextStrokeTransparency = 0
        text.Font = Enum.Font.GothamBold
        
        -- Update health
        spawn(function()
            while plr.Character and wait(0.1) do
                local hum = plr.Character:FindFirstChild("Humanoid")
                if hum then
                    text.Text = math.floor(hum.Health) .. " HP"
                    frame.Size = UDim2.new(hum.Health / hum.MaxHealth, 0, 0.1, 0)
                end
            end
        end)
    end
end
WAYPOINT SYSTEM
-- Save positions
local waypoints = {}

-- Save current position
local function SaveWaypoint(name)
    waypoints[name] = hrp.CFrame
    print("Saved waypoint: " .. name)
end

-- Teleport to saved position
local function GoToWaypoint(name)
    if waypoints[name] then
        hrp.CFrame = waypoints[name]
        print("Teleported to: " .. name)
    else
        print("Waypoint not found!")
    end
end

-- Usage:
SaveWaypoint("spawn")
SaveWaypoint("shop")
GoToWaypoint("spawn")
SPEED INDICATORS
-- Show your current speed
local speedLabel = Instance.new("ScreenGui")
speedLabel.Parent = game.CoreGui

local label = Instance.new("TextLabel")
label.Parent = speedLabel
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0.5, -100, 0, 10)
label.BackgroundTransparency = 0.5
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextSize = 20
label.Font = Enum.Font.GothamBold

spawn(function()
    while wait(0.1) do
        if hrp then
            local speed = hrp.Velocity.Magnitude
            label.Text = "Speed: " .. math.floor(speed)
        end
    end
end)
FLY (BETTER VERSION)
local flying = false
local speed = 50
local bodyVelocity
local bodyGyro

local function startFlying()
    flying = true
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Parent = hrp
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Parent = hrp
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.P = 9e4
    
    repeat wait()
        local cam = workspace.CurrentCamera
        local direction = Vector3.new(0, 0, 0)
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            direction = direction + cam.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            direction = direction - cam.CFrame.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            direction = direction - cam.CFrame.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            direction = direction + cam.CFrame.RightVector
        end
        
        bodyVelocity.Velocity = direction * speed
        bodyGyro.CFrame = cam.CFrame
    until not flying
    
    bodyVelocity:Destroy()
    bodyGyro:Destroy()
end

-- Toggle with E
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.E then
        if flying then
            flying = false
        else
            startFlying()
        end
    end
end)
AUTO ATTACK NEAREST
local autoAttack = true

spawn(function()
    while autoAttack and wait(0.5) do
        local target = nil
        local shortestDist = math.huge
        
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (hrp.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                if dist < shortestDist and dist < 50 then
                    shortestDist = dist
                    target = plr
                end
            end
        end
        
        if target then
            -- Fire your attack remote here
            print("Attacking: " .. target.Name)
        end
    end
end)
TRACERS (LINES TO PLAYERS)
local tracers = {}

for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local line = Drawing.new("Line")
        line.Visible = true
        line.Color = Color3.fromRGB(255, 0, 0)
        line.Thickness = 2
        line.Transparency = 1
        
        tracers[plr] = line
        
        spawn(function()
            while plr.Character and wait() do
                local hrpPos = plr.Character.HumanoidRootPart.Position
                local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(hrpPos)
                
                if onScreen then
                    line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
                    line.To = Vector2.new(screenPos.X, screenPos.Y)
                    line.Visible = true
                else
                    line.Visible = false
                end
            end
        end)
    end
end
BLOCK/PARRY SPAM
-- Spam block (change remote to your game's block)
spawn(function()
    while wait(0.01) do
        -- Replace with your game's block remote
        game:GetService("ReplicatedStorage").Block:FireServer(true)
    end
end)
REMOVE TEXTURES (BETTER FPS)
-- Remove all textures for FPS boost
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("Texture") or obj:IsA("Decal") then
        obj:Destroy()
    end
end
ANTI-RAGDOLL
-- Prevent ragdolling
humanoid.StateChanged:Connect(function(old, new)
    if new == Enum.HumanoidStateType.FallingDown or 
       new == Enum.HumanoidStateType.Ragdoll then
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)
WALK ON AIR
-- Create invisible platform you can walk on
local airWalk = false
local platform = Instance.new("Part")
platform.Size = Vector3.new(10, 0.5, 10)
platform.Transparency = 1
platform.Anchored = true
platform.CanCollide = true
platform.Parent = workspace

spawn(function()
    while wait() do
        if airWalk and hrp then
            platform.CFrame = hrp.CFrame * CFrame.new(0, -3.5, 0)
        else
            platform.CFrame = CFrame.new(0, -1000, 0)
        end
    end
end)

-- Toggle with Q
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Q then
        airWalk = not airWalk
    end
end)
ORBIT PLAYERS
-- Orbit around a player
local orbiting = false
local targetPlayer = nil
local angle = 0
local radius = 10

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.R then
        orbiting = not orbiting
        if orbiting then
            targetPlayer = GetNearestPlayer() -- Use the function from before
        end
    end
end)

spawn(function()
    while wait() do
        if orbiting and targetPlayer and targetPlayer.Character then
            angle = angle + 0.1
            local targetHRP = targetPlayer.Character.HumanoidRootPart
            local x = targetHRP.Position.X + radius * math.cos(angle)
            local z = targetHRP.Position.Z + radius * math.sin(angle)
            hrp.CFrame = CFrame.new(x, targetHRP.Position.Y, z)
        end
    end
end)
SPAM ALL REMOTES (TESTING)
-- Fire ALL remotes (use carefully!)
for _, remote in pairs(game:GetDescendants()) do
    if remote:IsA("RemoteEvent") then
        remote:FireServer()
    elseif remote:IsA("RemoteFunction") then
        pcall(function()
            remote:InvokeServer()
        end)
    end
end
REJOIN SERVER
-- Rejoin same server
local TeleportService = game:GetService("TeleportService")
TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
SERVER HOP
-- Join a different server
local TeleportService = game:GetService("TeleportService")
TeleportService:Teleport(game.PlaceId, player)
COPY CHAT MESSAGES
-- See all chat messages
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
    print(data.FromSpeaker .. ": " .. data.Message)
end)
REMOVE JUMP COOLDOWN
-- Jump instantly without cooldown
humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
    if humanoid.JumpPower ~= 50 then
        humanoid.JumpPower = 50
    end
end)
ANTI-VOID (AUTO RESPAWN)
-- Respawn if you fall below a certain height
spawn(function()
    while wait(0.5) do
        if hrp and hrp.Position.Y < -100 then
            hrp.CFrame = CFrame.new(0, 50, 0) -- Teleport up
        end
    end
end)
CHANGE TIME OF DAY
-- Make it daytime
game.Lighting.ClockTime = 12

-- Make it night
game.Lighting.ClockTime = 0

-- Sunrise
game.Lighting.ClockTime = 6

-- Sunset
game.Lighting.ClockTime = 18


TWEENING (SMOOTH MOVEMENT)
Tweening = Moving smoothly from point A to point B (not instant teleport)
local TweenService = game:GetService("TweenService")

-- Basic tween to a position
local targetPosition = CFrame.new(0, 50, 0) -- Where you want to go

local tweenInfo = TweenInfo.new(
    2, -- Time (2 seconds)
    Enum.EasingStyle.Linear, -- Style (Linear = constant speed)
    Enum.EasingDirection.Out -- Direction
)

local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetPosition})
tween:Play()
SIMPLE VERSION:
local TweenService = game:GetService("TweenService")

-- Tween to position (X, Y, Z)
local goal = {CFrame = CFrame.new(100, 10, 50)}
local tweenInfo = TweenInfo.new(2) -- 2 seconds
local tween = TweenService:Create(hrp, tweenInfo, goal)
tween:Play()
TWEEN TO ANOTHER PLAYER
local TweenService = game:GetService("TweenService")

-- Find player
local target = game.Players:FindFirstChild("Username")

if target and target.Character then
    local targetPos = target.Character.HumanoidRootPart.CFrame
    
    -- Tween to them smoothly
    local tweenInfo = TweenInfo.new(1) -- 1 second
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetPos})
    tween:Play()
end
TWEEN TO NEAREST PLAYER
local TweenService = game:GetService("TweenService")

-- Get nearest player
local function GetNearest()
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

-- Tween to nearest
local nearest = GetNearest()
if nearest then
    local tweenInfo = TweenInfo.new(1.5) -- 1.5 seconds
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = nearest.Character.HumanoidRootPart.CFrame})
    tween:Play()
end
TWEEN SPEED (FAST/SLOW)
local TweenService = game:GetService("TweenService")

-- FAST tween (0.5 seconds)
local tweenInfo = TweenInfo.new(0.5)
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()

-- SLOW tween (5 seconds)
local tweenInfo = TweenInfo.new(5)
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()
DIFFERENT TWEEN STYLES
local TweenService = game:GetService("TweenService")

-- Linear = constant speed (straight line)
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)

-- Quad = slow start, fast end (smooth acceleration)
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Quad)

-- Bounce = bounces at the end
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Bounce)

-- Elastic = springy movement
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Elastic)

local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()
WAIT FOR TWEEN TO FINISH
local TweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()

tween.Completed:Wait() -- Wait until tween is done
print("Tween finished!")
LOOP TWEEN TO ALL PLAYERS
local TweenService = game:GetService("TweenService")

for _, plr in pairs(game.Players:GetPlayers()) do
    if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local tweenInfo = TweenInfo.new(1)
        local tween = TweenService:Create(hrp, tweenInfo, {CFrame = plr.Character.HumanoidRootPart.CFrame})
        tween:Play()
        tween.Completed:Wait() -- Wait for this tween to finish before next
        wait(0.5) -- Small delay
    end
end
TWEEN WITH OFFSET
local TweenService = game:GetService("TweenService")

-- Tween to player but 5 studs away
local target = game.Players:FindFirstChild("Username")

if target and target.Character then
    local targetPos = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5) -- 5 studs in front
    
    local tweenInfo = TweenInfo.new(1)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetPos})
    tween:Play()
end
CFRAME BASICS
CFrame = Position + Rotation
-- Just position
local pos = CFrame.new(10, 20, 30) -- X, Y, Z

-- Position with rotation
local pos = CFrame.new(10, 20, 30) * CFrame.Angles(0, math.rad(90), 0) -- Turn 90 degrees

-- Move forward 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -5)

-- Move backward 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, 5)

-- Move left 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(-5, 0, 0)

-- Move right 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(5, 0, 0)

-- Move up 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(0, 5, 0)

-- Move down 5 studs
hrp.CFrame = hrp.CFrame * CFrame.new(0, -5, 0)
ROTATE CHARACTER
-- Turn 90 degrees to the right
hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(90), 0)

-- Turn 180 degrees (turn around)
hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(180), 0)

-- Face a player
local target = game.Players:FindFirstChild("Username")
if target and target.Character then
    hrp.CFrame = CFrame.new(hrp.Position, target.Character.HumanoidRootPart.Position)
end
VECTOR3 BASICS
Vector3 = 3D Position (X, Y, Z)
-- Create position
local pos = Vector3.new(10, 20, 30)

-- Get distance between two positions
local pos1 = Vector3.new(0, 0, 0)
local pos2 = Vector3.new(10, 0, 0)
local distance = (pos1 - pos2).Magnitude
print("Distance: " .. distance) -- 10 studs

-- Move position
local newPos = pos + Vector3.new(5, 0, 0) -- Move 5 studs right
GET PLAYER POSITION
-- Your position
local myPos = hrp.Position
print(myPos.X, myPos.Y, myPos.Z)

-- Another player's position
local target = game.Players:FindFirstChild("Username")
if target and target.Character then
    local targetPos = target.Character.HumanoidRootPart.Position
    print(targetPos)
end
CHECK DISTANCE TO PLAYER
local target = game.Players:FindFirstChild("Username")

if target and target.Character then
    local distance = (hrp.Position - target.Character.HumanoidRootPart.Position).Magnitude
    print("Distance: " .. math.floor(distance) .. " studs")
    
    if distance < 10 then
        print("Very close!")
    elseif distance < 50 then
        print("Medium distance")
    else
        print("Far away")
    end
end
TWEEN MULTIPLE THINGS AT ONCE
local TweenService = game:GetService("TweenService")

-- Tween position AND speed at same time
local tweenInfo = TweenInfo.new(2)

-- Tween character position
local tween1 = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})

-- Tween speed
local tween2 = TweenService:Create(humanoid, tweenInfo, {WalkSpeed = 100})

tween1:Play()
tween2:Play()
TWEEN GUI (BONUS)
local TweenService = game:GetService("TweenService")

-- Make GUI bigger smoothly
local frame = script.Parent -- Your GUI frame

local tweenInfo = TweenInfo.new(1)
local tween = TweenService:Create(frame, tweenInfo, {Size = UDim2.new(0, 300, 0, 300)})
tween:Play()

-- Move GUI position
local tween = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)})
tween:Play()
CANCEL/STOP TWEEN
local TweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(5) -- 5 second tween
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()

wait(2) -- Wait 2 seconds

tween:Cancel() -- Stop the tween
print("Tween stopped!")
REPEAT TWEEN (LOOP BACK AND FORTH)
local TweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(
    2, -- Time
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out,
    -1, -- -1 = repeat forever
    true -- true = reverse (go back and forth)
)

local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()
SIMPLE AUTO FARM WITH TWEEN
local TweenService = game:GetService("TweenService")

-- Farm all coins
for _, coin in pairs(workspace:GetDescendants()) do
    if coin.Name == "Coin" and coin:IsA("BasePart") then
        -- Tween to coin
        local tweenInfo = TweenInfo.new(0.5)
        local tween = TweenService:Create(hrp, tweenInfo, {CFrame = coin.CFrame})
        tween:Play()
        tween.Completed:Wait()
        
        wait(0.1) -- Small delay before next coin
    end
end
TWEEN COMPARISON
-- INSTANT TELEPORT (no tween)
hrp.CFrame = CFrame.new(0, 50, 0)

-- SLOW TWEEN (smooth)
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(2)
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(0, 50, 0)})
tween:Play()






    -- ========================================
-- EASY & USEFUL ROBLOX EXPLOIT SCRIPTS
-- Copy and paste these to learn!
-- ========================================

-- ============================================
-- 1. SIMPLE REMOTE SPY (Find Game Exploits)
-- ============================================
-- This shows you EVERY remote that fires in the game
-- Use this FIRST on any game to find exploits!

print("=== REMOTE SPY STARTED ===")
print("Do actions in-game to see what remotes fire!")

local old_namecall
old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if method == "FireServer" or method == "InvokeServer" then
        warn("━━━━━━━━━━━━━━━━━━━━")
        print("📡 Remote:", self.Name)
        print("📍 Path:", self:GetFullName())
        print("🔧 Method:", method)
        print("📦 Args:", table.concat(args, ", "))
        warn("━━━━━━━━━━━━━━━━━━━━")
    end
    
    return old_namecall(self, ...)
end)

-- ============================================
-- 2. AUTO-COLLECT ANYTHING (Universal)
-- ============================================
-- Automatically collects coins, orbs, money, etc
-- Change "Coin" to whatever the game uses

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

print("🤖 Auto-Collect Started!")

while task.wait(0.5) do
    for _, item in pairs(workspace:GetDescendants()) do
        -- Change these names based on what you see in workspace
        if item.Name == "Coin" or item.Name == "Orb" or item.Name == "Cash" then
            if item:IsA("BasePart") then
                -- Method 1: Firetouchinterest (most common)
                pcall(function()
                    firetouchinterest(hrp, item, 0)
                    task.wait()
                    firetouchinterest(hrp, item, 1)
                end)
            end
        end
    end
end

-- ============================================
-- 3. SAFE AUTO-FARM NPCs/MOBS
-- ============================================
-- Farms NPCs without getting detected
-- Adjust the folder path based on the game

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local farming = true
local attackCooldown = 0.5 -- Seconds between attacks
local lastAttack = 0

print("⚔️ Auto-Farm Started!")

RunService.Heartbeat:Connect(function()
    if not farming then return end
    
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Find closest NPC (change "NPCs" to whatever folder the game uses)
    local closest = nil
    local closestDist = math.huge
    
    local npcFolder = workspace:FindFirstChild("NPCs") or workspace:FindFirstChild("Enemies") or workspace:FindFirstChild("Mobs")
    
    if npcFolder then
        for _, npc in pairs(npcFolder:GetChildren()) do
            if npc:FindFirstChild("Humanoid") and npc.Humanoid.Health > 0 then
                local dist = (hrp.Position - npc.HumanoidRootPart.Position).Magnitude
                if dist < closestDist and dist < 100 then
                    closestDist = dist
                    closest = npc
                end
            end
        end
    end
    
    -- Attack closest NPC
    if closest and tick() - lastAttack >= attackCooldown then
        -- Teleport near it (not directly on it - less sus)
        hrp.CFrame = closest.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
        
        -- Click to attack (most games use mouse click)
        mouse1click()
        
        lastAttack = tick()
    end
end)

-- ============================================
-- 4. SMART REMOTE EXPLOITER
-- ============================================
-- Use this AFTER you find remotes with the spy
-- Replace the remote path with what you found

-- Example 1: Money exploit
local MoneyRemote = game.ReplicatedStorage.Remotes:FindFirstChild("GiveMoney")
if MoneyRemote then
    for i = 1, 10 do -- Fire 10 times
        MoneyRemote:FireServer(1000) -- Try different amounts
        task.wait(0.5) -- Wait between fires to avoid detection
    end
    print("💰 Money exploit executed!")
end

-- Example 2: Quest completion
local QuestRemote = game.ReplicatedStorage.Remotes:FindFirstChild("CompleteQuest")
if QuestRemote then
    local quests = {"Quest1", "Quest2", "Quest3"} -- Change based on game
    for _, quest in pairs(quests) do
        QuestRemote:FireServer(quest)
        task.wait(1)
    end
    print("✅ Quests completed!")
end

-- Example 3: Item duplication
local ItemRemote = game.ReplicatedStorage.Remotes:FindFirstChild("ClaimItem")
if ItemRemote then
    for i = 1, 50 do
        ItemRemote:FireServer("Sword") -- Change item name
        task.wait(0.3)
    end
    print("📦 Items duplicated!")
end

-- ============================================
-- 5. ANTI-KICK BYPASS
-- ============================================
-- Prevents the game from kicking you

local old_namecall
old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    -- Block kick remotes
    if method == "Kick" then
        warn("🛡️ Blocked kick attempt!")
        return nil
    end
    
    return old_namecall(self, ...)
end)

print("🛡️ Anti-Kick Active!")

-- ============================================
-- 6. UNIVERSAL ESP (See Players Through Walls)
-- ============================================
-- Simple ESP that works on most games

local function createESP(player)
    if player == game.Players.LocalPlayer then return end
    
    local function addESP(character)
        -- Remove old ESP
        if character:FindFirstChild("ESP_Highlight") then
            character.ESP_Highlight:Destroy()
        end
        
        -- Create highlight
        local highlight = Instance.new("Highlight")
        highlight.Name = "ESP_Highlight"
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = character
    end
    
    if player.Character then
        addESP(player.Character)
    end
    
    player.CharacterAdded:Connect(addESP)
end

for _, player in pairs(game.Players:GetPlayers()) do
    createESP(player)
end

game.Players.PlayerAdded:Connect(createESP)

print("👁️ ESP Active!")

-- ============================================
-- 7. SAFE TELEPORT (Anti-Detection)
-- ============================================
-- Teleports without triggering anti-cheat

local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer

function safeTeleport(targetCFrame, speed)
    speed = speed or 50 -- studs per second
    
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local distance = (hrp.Position - targetCFrame.Position).Magnitude
    local time = distance / speed
    
    local tween = TweenService:Create(hrp, TweenInfo.new(time, Enum.EasingStyle.Linear), {
        CFrame = targetCFrame
    })
    
    tween:Play()
    tween.Completed:Wait()
end

-- Usage:
-- safeTeleport(CFrame.new(100, 50, 100), 50)

print("🚀 Safe teleport function loaded!")

-- ============================================
-- 8. AUTO-REBIRTH/AUTO-PRESTIGE
-- ============================================
-- Automatically rebirths/prestiges when available

local RebirthRemote = game.ReplicatedStorage.Remotes:FindFirstChild("Rebirth")

if RebirthRemote then
    spawn(function()
        while task.wait(5) do
            pcall(function()
                RebirthRemote:FireServer()
                print("🔄 Auto-rebirth attempted!")
            end)
        end
    end)
end

-- ============================================
-- 9. SPEED HACK (Anti-Detection Safe)
-- ============================================
-- Increases speed without triggering anti-cheat

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Method 1: Normal walkspeed (detectable in some games)
humanoid.WalkSpeed = 50 -- Default is 16

-- Method 2: CFrame manipulation (harder to detect)
local speed = 2 -- Multiplier
game:GetService("RunService").Heartbeat:Connect(function()
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        local hrp = character:FindFirstChild("HumanoidRootPart")
        
        if humanoid and hrp and humanoid.MoveDirection.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * speed)
        end
    end
end)

print("⚡ Speed hack active!")

-- ============================================
-- 10. FULL AUTO-FARM TEMPLATE
-- ============================================
-- Combine everything: ESP, Auto-Farm, Anti-Kick, Remote Spy

print("🔥 FULL AUTO-FARM ACTIVATED 🔥")

-- Settings
local CONFIG = {
    AUTO_COLLECT = true,
    AUTO_FARM_NPCS = true,
    ESP_ENABLED = true,
    ANTI_KICK = true,
    SAFE_MODE = true, -- Slower but safer
    ATTACK_COOLDOWN = 0.5
}

-- Your full script logic here combining all the above techniques

print("✅ All features loaded! Check settings above to customize.")
print("💡 TIP: Use the Remote Spy first to find game-specific exploits!")
print("⚠️ Remember: Don't spam remotes or you'll get detected!")


-- ========================================
-- ANTI-RUBBERBAND / POSITION CORRECTION BYPASS
-- The most reliable method for most games
-- ========================================

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

print("🚀 Anti-Rubberband Bypass Loading...")

-- ========================================
-- METHOD 1: BodyMover Bypass (Most Reliable)
-- ========================================

local flying = false
local speed = 50 -- Adjust this (lower = safer, higher = faster but risky)
local bodyVel, bodyGyro

function enableFly()
    flying = true
    
    -- Remove old movers
    if hrp:FindFirstChild("CustomVelocity") then
        hrp.CustomVelocity:Destroy()
    end
    if hrp:FindFirstChild("CustomGyro") then
        hrp.CustomGyro:Destroy()
    end
    
    -- Create BodyVelocity
    bodyVel = Instance.new("BodyVelocity")
    bodyVel.Name = "CustomVelocity"
    bodyVel.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVel.Velocity = Vector3.new(0, 0, 0)
    bodyVel.Parent = hrp
    
    -- Create BodyGyro
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Name = "CustomGyro"
    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
    bodyGyro.P = 10000
    bodyGyro.Parent = hrp
    
    print("✅ Fly enabled! WASD to move, Space/Shift for up/down")
end

function disableFly()
    flying = false
    
    if bodyVel then bodyVel:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    
    print("❌ Fly disabled!")
end

-- Movement loop
RunService.Heartbeat:Connect(function()
    if not flying then return end
    
    local moveVector = Vector3.new(0, 0, 0)
    local cam = workspace.CurrentCamera
    
    -- WASD movement
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveVector = moveVector + (cam.CFrame.LookVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveVector = moveVector - (cam.CFrame.LookVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveVector = moveVector - (cam.CFrame.RightVector * speed)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveVector = moveVector + (cam.CFrame.RightVector * speed)
    end
    
    -- Up/Down
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveVector = moveVector + Vector3.new(0, speed, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveVector = moveVector - Vector3.new(0, speed, 0)
    end
    
    -- Apply movement
    if bodyVel then
        bodyVel.Velocity = moveVector
    end
    if bodyGyro then
        bodyGyro.CFrame = cam.CFrame
    end
end)

-- Toggle fly with E key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        if flying then
            disableFly()
        else
            enableFly()
        end
    end
    
    -- Speed controls
    if input.KeyCode == Enum.KeyCode.Equal then -- + key
        speed = speed + 10
        print("Speed:", speed)
    end
    if input.KeyCode == Enum.KeyCode.Minus then -- - key
        speed = math.max(10, speed - 10)
        print("Speed:", speed)
    end
end)

-- ========================================
-- METHOD 2: Position Spoof Hook (Backup)
-- ========================================

local old_namecall
old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- Block position validation remotes (common names)
    if method == "FireServer" then
        local remoteName = self.Name:lower()
        if remoteName:find("position") or 
           remoteName:find("validate") or
           remoteName:find("check") or
           remoteName:find("anticheat") then
            -- Don't send real position
            return nil
        end
    end
    
    return old_namecall(self, ...)
end)

-- ========================================
-- METHOD 3: Humanoid State Manipulation
-- ========================================

-- Disable states that trigger position checks
humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)

-- ========================================
-- METHOD 4: Safe Teleport Function
-- ========================================

function safeTeleport(targetCFrame)
    local currentPos = hrp.Position
    local targetPos = targetCFrame.Position
    local direction = (targetPos - currentPos).Unit
    local distance = (targetPos - currentPos).Magnitude
    
    -- Calculate safe steps
    local maxStepDistance = 5 -- studs per step (adjust for game)
    local steps = math.ceil(distance / maxStepDistance)
    
    print("📍 Teleporting", distance, "studs in", steps, "steps")
    
    for i = 1, steps do
        local progress = i / steps
        local newPos = currentPos:Lerp(targetPos, progress)
        hrp.CFrame = CFrame.new(newPos) * (targetCFrame - targetCFrame.Position)
        task.wait(0.05) -- Small delay between steps
    end
    
    print("✅ Teleport complete!")
end

-- ========================================
-- METHOD 5: Network Ownership (if supported)
-- ========================================

pcall(function()
    hrp:SetNetworkOwner(player)
    print("🌐 Network ownership claimed!")
end)

-- ========================================
-- CONTROLS & INFO
-- ========================================

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🎮 CONTROLS:")
print("E - Toggle Fly")
print("WASD - Move")
print("Space - Up")
print("Shift - Down")
print("+ - Increase Speed")
print("- - Decrease Speed")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("💡 TIP: If you still rubberband, lower the speed!")
print("Current speed:", speed)
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- Example: Use safe teleport instead of instant
-- safeTeleport(CFrame.new(100, 50, 100))


-- ========================================
-- ANTI-CHEAT DETECTOR & INSTANT DISABLER
-- Finds and neutralizes anti-cheat systems
-- ========================================

print("🔍 Scanning for anti-cheat systems...")

local foundAntiCheats = {}

-- ========================================
-- STEP 1: FIND ANTI-CHEAT SCRIPTS
-- ========================================

function scanForAntiCheat()
    local suspiciousScripts = {}
    
    -- Common anti-cheat locations
    local locations = {
        game.ReplicatedStorage,
        game.ReplicatedFirst,
        game.StarterPlayer.StarterPlayerScripts,
        game.StarterPlayer.StarterCharacterScripts,
        game.Players.LocalPlayer.PlayerScripts,
        game.Players.LocalPlayer.PlayerGui
    }
    
    -- Anti-cheat keywords to look for
    local keywords = {
        "anticheat", "anti", "cheat", "detect", "ban", 
        "kick", "exploit", "check", "validate", "verify",
        "security", "protection", "guard", "shield",
        "monitor", "watch", "inspect", "scan"
    }
    
    for _, location in pairs(locations) do
        for _, obj in pairs(location:GetDescendants()) do
            if obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
                local name = obj.Name:lower()
                
                -- Check if name contains anti-cheat keywords
                for _, keyword in pairs(keywords) do
                    if name:find(keyword) then
                        table.insert(suspiciousScripts, obj)
                        table.insert(foundAntiCheats, {
                            Name = obj.Name,
                            Path = obj:GetFullName(),
                            Type = obj.ClassName
                        })
                        break
                    end
                end
            end
        end
    end
    
    return suspiciousScripts
end

-- ========================================
-- STEP 2: SCAN FOR ANTI-CHEAT REMOTES
-- ========================================

function scanForAntiCheatRemotes()
    local suspiciousRemotes = {}
    
    local keywords = {
        "kick", "ban", "flag", "detect", "check",
        "validate", "report", "log", "anticheat", "ac"
    }
    
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
            local name = obj.Name:lower()
            
            for _, keyword in pairs(keywords) do
                if name:find(keyword) then
                    table.insert(suspiciousRemotes, obj)
                    table.insert(foundAntiCheats, {
                        Name = obj.Name,
                        Path = obj:GetFullName(),
                        Type = obj.ClassName
                    })
                    break
                end
            end
        end
    end
    
    return suspiciousRemotes
end

-- ========================================
-- STEP 3: DETECT ANTI-CHEAT CONNECTIONS
-- ========================================

function detectAntiCheatConnections()
    local player = game.Players.LocalPlayer
    local character = player.Character
    
    -- Check for suspicious Humanoid connections
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            -- These are commonly hooked by anti-cheats
            local properties = {
                "WalkSpeed", "JumpPower", "Health",
                "MaxHealth", "HipHeight"
            }
            
            for _, prop in pairs(properties) do
                -- Try to detect if property is being monitored
                local connections = getconnections(humanoid:GetPropertyChangedSignal(prop))
                if #connections > 0 then
                    print("⚠️ Detected monitoring on Humanoid." .. prop)
                    table.insert(foundAntiCheats, {
                        Name = "Humanoid." .. prop .. " Monitor",
                        Path = "Character.Humanoid",
                        Type = "Connection"
                    })
                end
            end
        end
    end
end

-- ========================================
-- STEP 4: DISABLE FOUND ANTI-CHEATS
-- ========================================

function disableScript(script)
    pcall(function()
        script.Disabled = true
        script:Destroy()
    end)
end

function blockRemote(remote)
    -- Hook the remote to do nothing
    local old_namecall
    old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
        if self == remote then
            return nil -- Block it
        end
        return old_namecall(self, ...)
    end)
end

function disableConnections(obj, property)
    pcall(function()
        local connections = getconnections(obj:GetPropertyChangedSignal(property))
        for _, connection in pairs(connections) do
            connection:Disable()
        end
    end)
end

-- ========================================
-- STEP 5: UNIVERSAL ANTI-CHEAT BYPASS HOOKS
-- ========================================

function setupUniversalBypass()
    print("🛡️ Setting up universal bypass hooks...")
    
    -- Hook 1: Block all kick attempts
    local old_namecall
    old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        
        -- Block kicks
        if method == "Kick" then
            warn("🛡️ Blocked kick attempt!")
            return nil
        end
        
        -- Block suspicious remotes
        if (method == "FireServer" or method == "InvokeServer") then
            local name = self.Name:lower()
            if name:find("kick") or name:find("ban") or 
               name:find("flag") or name:find("log") or
               name:find("detect") then
                warn("🛡️ Blocked anti-cheat remote:", self.Name)
                return nil
            end
        end
        
        return old_namecall(self, ...)
    end)
    
    -- Hook 2: Spoof detection checks
    local old_index
    old_index = hookmetamethod(game, "__index", function(self, key)
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        -- Spoof humanoid properties to look legit
        if character and self == character:FindFirstChild("Humanoid") then
            if key == "WalkSpeed" then
                return 16 -- Return normal speed to anti-cheat
            end
            if key == "JumpPower" then
                return 50 -- Return normal jump
            end
        end
        
        -- Spoof HumanoidRootPart position
        if character and self == character:FindFirstChild("HumanoidRootPart") then
            if key == "Position" or key == "CFrame" then
                -- Return a "safe" position if being checked
                -- (You can make this smarter)
            end
        end
        
        return old_index(self, key)
    end)
    
    -- Hook 3: Block console logging (some AC logs to console)
    local old_warn = warn
    local old_error = error
    
    warn = function(...)
        local args = {...}
        local text = tostring(args[1]):lower()
        
        -- Don't log anti-cheat warnings
        if text:find("detect") or text:find("cheat") or 
           text:find("exploit") or text:find("ban") then
            return
        end
        
        return old_warn(...)
    end
    
    error = function(...)
        local args = {...}
        local text = tostring(args[1]):lower()
        
        -- Don't throw anti-cheat errors
        if text:find("detect") or text:find("cheat") or text:find("exploit") then
            return
        end
        
        return old_error(...)
    end
end

-- ========================================
-- STEP 6: DISABLE HEARTBEAT CHECKS
-- ========================================

function disableHeartbeatChecks()
    print("💓 Disabling Heartbeat anti-cheat checks...")
    
    local RunService = game:GetService("RunService")
    
    -- Get all heartbeat connections
    local connections = getconnections(RunService.Heartbeat)
    
    for i, connection in pairs(connections) do
        -- Disable suspicious connections
        pcall(function()
            local func = debug.getinfo(connection.Function)
            if func then
                -- Check if it looks like anti-cheat code
                -- (This is a simplified check)
                connection:Disable()
                print("Disabled Heartbeat connection #" .. i)
            end
        end)
    end
end

-- ========================================
-- STEP 7: GARBAGE COLLECTION SCAN
-- ========================================

function scanGarbageCollection()
    print("🗑️ Scanning garbage collection for anti-cheat...")
    
    -- Scan all functions in memory
    for _, func in pairs(getgc(true)) do
        if type(func) == "function" then
            local info = debug.getinfo(func)
            if info and info.name then
                local name = info.name:lower()
                
                -- Check for anti-cheat function names
                if name:find("anticheat") or name:find("detect") or 
                   name:find("check") or name:find("validate") then
                    
                    -- Try to hook/disable it
                    pcall(function()
                        hookfunction(func, function() return end)
                    end)
                    
                    print("🎯 Hooked suspicious function:", info.name)
                end
            end
        end
    end
end

-- ========================================
-- EXECUTE FULL SCAN AND DISABLE
-- ========================================

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("🔍 ANTI-CHEAT SCANNER v1.0")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- Scan for anti-cheats
local scripts = scanForAntiCheat()
local remotes = scanForAntiCheatRemotes()

-- Setup universal bypasses
setupUniversalBypass()

-- Disable found anti-cheats
print("\n📋 Found", #foundAntiCheats, "potential anti-cheat components:")
for i, ac in pairs(foundAntiCheats) do
    print(i .. ".", ac.Type, "-", ac.Name)
    print("   Path:", ac.Path)
end

print("\n🔨 Disabling anti-cheats...")

-- Disable scripts
for _, script in pairs(scripts) do
    disableScript(script)
    print("✅ Disabled:", script.Name)
end

-- Block remotes
for _, remote in pairs(remotes) do
    blockRemote(remote)
    print("✅ Blocked:", remote.Name)
end

-- Disable connections
detectAntiCheatConnections()

-- Disable heartbeat checks
if disableHeartbeatChecks then
    pcall(disableHeartbeatChecks)
end

-- Scan garbage collection
if getgc and hookfunction then
    pcall(scanGarbageCollection)
end

print("\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("✅ Anti-cheat bypass complete!")
print("🛡️ Protection active!")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- ========================================
-- MANUAL DISABLE FUNCTION
-- ========================================

-- If auto-detection missed something, use this:
function manualDisable(path)
    local obj = game
    for _, name in pairs(path:split(".")) do
        obj = obj:FindFirstChild(name)
        if not obj then
            warn("❌ Could not find:", path)
            return
        end
    end
    
    if obj:IsA("LocalScript") or obj:IsA("ModuleScript") then
        disableScript(obj)
        print("✅ Manually disabled:", path)
    elseif obj:IsA("RemoteEvent") or obj:IsA("RemoteFunction") then
        blockRemote(obj)
        print("✅ Manually blocked:", path)
    end
end

-- Usage example:
-- manualDisable("ReplicatedStorage.AntiCheat.MainScript")

print("\n💡 TIP: If detection missed something, use:")
print('manualDisable("Path.To.AntiCheat")')
print("\n⚠️ WARNING: Some games use server-side anti-cheat")
print("Those CANNOT be bypassed from client!")
