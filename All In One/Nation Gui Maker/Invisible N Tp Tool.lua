local TpTool
local Players = game:GetService("Players")
local IYMouse = Players.LocalPlayer:GetMouse()
local Prr = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local charr = game:GetService("Players").LocalPlayer.Character
local bolet = charr:FindFirstChildOfClass("Humanoid")
local Noclipping = nil
local toggleNoclip = false
local Clip
local function randomString()
    local length = math.random(17,45)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

toggleNoclip = false
good = true
Noclipping = nil
local boolean2
local q_s = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local charr = game:GetService("Players").LocalPlayer.Character
local RunService = game:GetService("RunService")
local bolet = charr:FindFirstChildOfClass("Humanoid")
local Prr = game:GetService("Players").LocalPlayer

local LP = Players.LocalPlayer
local ScriptStarted = false
local Keybind = "E" --Set to whatever you want, has to be the name of a KeyCode Enum.
local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
local NoClip = false --Will make your fake character no clip.
local Player = game:GetService("Players").LocalPlayer
local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
local IsInvisible = false
RealCharacter.Archivable = true
local FakeCharacter = RealCharacter:Clone()
local Part
Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(200, 1, 200)
Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
Part.CanCollide = true
FakeCharacter.Parent = workspace
FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
for i, v in pairs(RealCharacter:GetChildren()) do
  if v:IsA("LocalScript") then
      local clone = v:Clone()
      clone.Disabled = true
      clone.Parent = FakeCharacter
  end
end
if Transparency then
  for i, v in pairs(FakeCharacter:GetDescendants()) do
      if v:IsA("BasePart") then
          v.Transparency = 0.9
      end
  end
end
local CanInvis = true
function RealCharacterDied()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
  CanInvis = false
  RealCharacter:Destroy()
  RealCharacter = Player.Character
  CanInvis = true
  isinvisible = false
  FakeCharacter:Destroy()
  workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
  RealCharacter.Archivable = true
  FakeCharacter = RealCharacter:Clone()
  Part:Destroy()
  Part = Instance.new("Part", workspace)
  Part.Anchored = true
  Part.Size = Vector3.new(200, 1, 200)
  Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
  Part.CanCollide = true
  FakeCharacter.Parent = workspace
  FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
  for i, v in pairs(RealCharacter:GetChildren()) do
      if v:IsA("LocalScript") then
          local clone = v:Clone()
          clone.Disabled = true
          clone.Parent = FakeCharacter
      end
  end
  if Transparency then
      for i, v in pairs(FakeCharacter:GetDescendants()) do
          if v:IsA("BasePart") then
              v.Transparency = 0.7
          end
      end
  end
 RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
 Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
end
RealCharacter.Humanoid.Died:Connect(function()
 RealCharacter:Destroy()
 FakeCharacter:Destroy()
 end)
Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
local PseudoAnchor
game:GetService "RunService".RenderStepped:Connect(
  function()
      if PseudoAnchor ~= nil then
          PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
      end
       if NoClip then
      FakeCharacter.Humanoid:ChangeState(11)
       end
  end
)
PseudoAnchor = FakeCharacter.HumanoidRootPart
local function Invisible()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
  if IsInvisible == false then
      StoredCF = RealCharacter.HumanoidRootPart.CFrame
      RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
      for i = 1,5 do FakeCharacter.HumanoidRootPart.CFrame = StoredCF end
      RealCharacter.Humanoid:UnequipTools()
      Player.Character = FakeCharacter
      workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
      PseudoAnchor = RealCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = false
          end
      end
      IsInvisible = true
  else
      StoredCF = FakeCharacter.HumanoidRootPart.CFrame
      FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame
      for i = 1,5 do RealCharacter.HumanoidRootPart.CFrame = StoredCF end
      FakeCharacter.Humanoid:UnequipTools()
      Player.Character = RealCharacter
      workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
      PseudoAnchor = FakeCharacter.HumanoidRootPart
      for i, v in pairs(FakeCharacter:GetChildren()) do
          if v:IsA("LocalScript") then
              v.Disabled = true
          end
      end
      IsInvisible = false
  end
end

time2 = false
time3 = false
local function tw(gui, targetPosition, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tween = game.TweenService:Create(gui, tweenInfo, { Position = targetPosition })

    tween:Play()
end

local function rdmString()
    local length = math.random(17,45)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(21, 48))
    end
    return table.concat(array)
end

local function UiCorner(gui, num1, num2)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(num1, num2)
    corner.Parent = gui
end

local gui = Instance.new("ScreenGui")
gui.Name = rdmString()
gui.Parent = game.CoreGui

local tamanhoBotao = UDim2.new(0, 80, 0, 40)

local botao = Instance.new("TextButton")
botao.Name = rdmString()
botao.Parent = gui
botao.Size = tamanhoBotao
botao.Position = UDim2.new(0.5, -40 / 1, 0, -33.8)
botao.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
botao.Text = "OFF"
botao.TextColor3 = Color3.new(111, 000, 000)
botao.TextSize = 21
botao.Font = Enum.Font.Fantasy
UiCorner(botao, 0.1, 0)

local gui = Instance.new("ScreenGui")
gui.Name = rdmString()
gui.Parent = game.CoreGui

local tamanhoFrame = UDim2.new(0, 40, 0, 40)

local frame = Instance.new("Frame")
frame.Name = rdmString()
frame.Parent = gui
frame.Size = tamanhoFrame
frame.Position = UDim2.new(0.5, -40 / 2, 0, 0)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
UiCorner(frame, 0.1, 0)

local imageButton = Instance.new("ImageButton")
imageButton.Name = rdmString()
imageButton.Parent = frame
imageButton.Size = tamanhoFrame
imageButton.Position = UDim2.new(0, 0, 0, 0)
imageButton.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
imageButton.Image = "rbxassetid://15433120142" 
imageButton.Transparency = 1

local function invis()
    wait(3)
    if time2 == true then return end
    frame.Transparency = 0.02
    imageButton.ImageTransparency = 0.02
    task.wait(0.05)
    frame.Transparency = 0.05
    imageButton.ImageTransparency = 0.05
    task.wait()
    frame.Transparency = 0.1
    imageButton.ImageTransparency = 0.1
    task.wait()
    frame.Transparency = 0.2
    imageButton.ImageTransparency = 0.2
    task.wait()
    frame.Transparency = 0.3
    imageButton.ImageTransparency = 0.3
    task.wait(0.05)
    frame.Transparency = 0.4
    imageButton.ImageTransparency = 0.4
    task.wait()
    frame.Transparency = 0.5
    imageButton.ImageTransparency = 0.5
    task.wait()
    frame.Transparency = 0.6
    imageButton.ImageTransparency = 0.6
    task.wait(0.05)
    frame.Transparency = 0.7
    imageButton.ImageTransparency = 0.7
    frame.Transparency = 0.75
    imageButton.ImageTransparency = 0.75
end

local function vis()
    time2 = true
    frame.Transparency = 0
    imageButton.ImageTransparency = 0
    task.wait()
    time2 = false
end

local TweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(
	0.3,
	Enum.EasingStyle.Linear, 
	Enum.EasingDirection.Out, 
	0,
	false,
	0
)

local girado = false
local time = true
floatName = randomString()
imageButton.MouseButton1Click:Connect(function()
    girado = not girado
    time = not time
    local angulo = girado and 180 or 0
    local Tween = TweenService:Create(imageButton, tweenInfo, {Rotation = angulo})
    Tween:Play() 
    if girado then
        tw(frame, UDim2.new(0.5, -40 / 2, 0, -33.8), 0.44)
        tw(botao, UDim2.new(0.5, -40 / 1, 0, -78.9), 0.44)
        task.spawn(function() invis() end)
    else
        tw(frame, UDim2.new(0.5, -40 / 2, 0, 0), 0.44)
        tw(botao, UDim2.new(0.5, -40 / 1, 0, -33.8), 0.44)
        task.spawn(function() while true do task.wait() if not girado then vis() end end end)
    end
end)

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

Clip = true
floatName = randomString()
local tnoclip

botao.MouseButton1Click:Connect(function()
    Players = game:GetService("Players")
    speaker = Players.LocalPlayer
    boolean = not boolean
    local cam = workspace.CurrentCamera.CFrame
    botao.Text = boolean and "ON" or "OFF"
    botao.TextColor3 = boolean and Color3.new(000, 111, 000) or Color3.new(111, 000, 000)
    task.spawn(function() Invisible() end)
    task.spawn(function()
        function TrueNoclip()
            Clip = false
        	task.wait(0.1)
        	local function NoclipLoop()
        		if Clip == false and speaker.Character ~= nil then
        			for _, child in pairs(speaker.Character:GetDescendants()) do
        				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
        					child.CanCollide = false
        				end
        			end
        		end
        	end
        	Noclipping = RunService.Stepped:Connect(NoclipLoop)
        end
        function FalseNoclip()
            if Noclipping then
                Noclipping:Disconnect()
            end
            Clip = true
        end
        function toggle()
            if Clip then
                tnoclip = true
            else
                tnoclip = false
            end
            return tnoclip
        end
        if toggle() then
            TrueNoclip()
        else
            FalseNoclip()
        end
    end)
    workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Wait()
    workspace.CurrentCamera.CFrame = cam
    task.spawn(function()
        task.wait(0.1)
        if not Clip then
            speaker.Character.Humanoid.WalkSpeed = q_s + 9.5
        else
            game.Players.LocalPlayer.Humanoid.WalkSpeed = q_s
        end
    end)
    if toggle() == false then
        TpTool = Instance.new("Tool")
    	TpTool.Name = "TP tool"
    	TpTool.RequiresHandle = false
    	TpTool.Parent = speaker.Backpack
    	TpTool.Activated:Connect(function()
    		local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
    		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
    		if not Char or not HRP then
    			return warn("Failed to find HumanoidRootPart")
    		end
    		HRP.CFrame = CFrame.new(IYMouse.Hit.X, IYMouse.Hit.Y + 3, IYMouse.Hit.Z, select(4, HRP.CFrame:components())) 
    	end)
    else
        TpTool:Destroy()
    end
end)

coroutine.wrap(function()
    wait(2)
    game.StarterGui:SetCore("SendNotification", {
        Title = "By Liver zMods";
        Text = "created by Brazilian!";
        Icon = "rbxthumb://type=Asset&id=11935866652&w=150&h=150";
        Duration = 45; 
    }) 
end)()

task.spawn(function()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
    local sc = (debug and debug.setconstant) or setconstant
	local gc = (debug and debug.getconstants) or getconstants
	if not sc or not getgc or not gc then
	    return
	end
	local pop = speaker.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end
end)

task.spawn(function()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
    speaker.CameraMaxZoomDistance = 9e9
end)

task.spawn(function()
    local Players = game:GetService("Players")
    local speaker = Players.LocalPlayer
    if speaker.CameraMode == "LockFirstPerson" then
        speaker.CameraMode = "Classic"
        speaker.CameraMinZoomDistance = 0
    end
end)
