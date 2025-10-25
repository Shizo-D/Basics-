--[[
Nations Coordinate 
--]]
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

if gethui then
    ScreenGui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
else
    ScreenGui.Parent = game.CoreGui
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "CoordTool"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.1, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 120)
MainFrame.Active = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.GothamBold
Title.Text = "Coordinate Tool By Nation | HuB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 12
Title.TextXAlignment = Enum.TextXAlignment.Center

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 8)

local CoordDisplay = Instance.new("TextLabel")
CoordDisplay.Parent = MainFrame
CoordDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CoordDisplay.Position = UDim2.new(0.05, 0, 0, 40)
CoordDisplay.Size = UDim2.new(0.9, 0, 0, 35)
CoordDisplay.BorderSizePixel = 0
CoordDisplay.Font = Enum.Font.Code
CoordDisplay.Text = "X: 0, Y: 0, Z: 0"
CoordDisplay.TextColor3 = Color3.fromRGB(0, 255, 0)
CoordDisplay.TextSize = 11
CoordDisplay.TextXAlignment = Enum.TextXAlignment.Center

local CoordCorner = Instance.new("UICorner", CoordDisplay)
CoordCorner.CornerRadius = UDim.new(0, 6)

local CopyButton = Instance.new("TextButton")
CopyButton.Parent = MainFrame
CopyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CopyButton.Position = UDim2.new(0.05, 0, 0, 82)
CopyButton.Size = UDim2.new(0.9, 0, 0, 30)
CopyButton.BorderSizePixel = 0
CopyButton.Font = Enum.Font.GothamBold
CopyButton.Text = "Copy Tween Code"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextSize = 13

local CopyCorner = Instance.new("UICorner", CopyButton)
CopyCorner.CornerRadius = UDim.new(0, 6)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- ========================================
-- REAL-TIME COORDINATE UPDATE
-- ========================================

local RunService = game:GetService("RunService")
local currentCoords = Vector3.new(0, 0, 0)

RunService.RenderStepped:Connect(function()
    local character = player.Character
    if character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            currentCoords = pos
            CoordDisplay.Text = string.format("X: %.1f, Y: %.1f, Z: %.1f", pos.X, pos.Y, pos.Z)
        end
    end
end)

-- ========================================
-- COPY BUTTON - GENERATES WORKING CODE
-- ========================================

CopyButton.MouseButton1Click:Connect(function()
    local pos = currentCoords
    
    -- Generate complete working tween code
    local code = string.format([[
-- Auto-generated Tween Code by Nation Hub
local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

-- Target Position
local targetCFrame = CFrame.new(%.2f, %.2f, %.2f)

-- Tween Settings (Fast & Smooth)
local tweenInfo = TweenInfo.new(
    1, -- Duration (seconds)
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.Out
)

-- Create and play tween
local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
tween:Play()
print("Teleporting to coordinates...")
]], pos.X, pos.Y, pos.Z)
    
  
    if setclipboard then
        setclipboard(code)
        
        
        CopyButton.Text = " Copied!"
        CopyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        task.wait(1)
        
        CopyButton.Text = "📋 Copy Tween Code"
        CopyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print(" Tween code copied to clipboard!")
        print(" Coordinates:", pos)
        print(" Paste and execute to teleport!")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
    else
        -- If no setclipboard, print to console
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print(" Clipboard not supported by executor")
        print(" Copy this code manually:")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
        print(code)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
        
        CopyButton.Text = " Check Console"
        CopyButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        
        task.wait(2)
        
        CopyButton.Text = " Copy Tween Code"
        CopyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

CopyButton.MouseEnter:Connect(function()
    CopyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
end)

CopyButton.MouseLeave:Connect(function()
    CopyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)
