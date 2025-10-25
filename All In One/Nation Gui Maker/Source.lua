-- // Nation Gui TEMPLATE \\ --
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 140)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 6)

Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "Nation Hub"
Title.TextColor3 = Color3.fromRGB(225, 0, 0)
Title.TextSize = 20

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 6)

local ButtonCount = 0

local function AddButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    Button.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 40))
    Button.Size = UDim2.new(0.9, 0, 0, 32)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.TextSize = 16
    
    local ButtonCorner = Instance.new("UICorner", Button)
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    
    Button.MouseButton1Click:Connect(callback)
    
    ButtonCount = ButtonCount + 1
    
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 40) + 10)
end

local function AddToggle(text, default, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = MainFrame
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    Toggle.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 40))
    Toggle.Size = UDim2.new(0.9, 0, 0, 32)
    Toggle.Font = Enum.Font.Gotham
    Toggle.Text = text .. ": OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
    Toggle.TextSize = 16
    
    local ToggleCorner = Instance.new("UICorner", Toggle)
    ToggleCorner.CornerRadius = UDim.new(0, 4)
    
    local toggled = default or false
    
    if toggled then
        Toggle.Text = text .. ": ON"
        Toggle.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
    end
    
    Toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            Toggle.Text = text .. ": ON"
            Toggle.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
        else
            Toggle.Text = text .. ": OFF"
            Toggle.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
        end
        callback(toggled)
    end)
    
    ButtonCount = ButtonCount + 1
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 40) + 10)
end


AddToggle("Speed Boost", false, function(value)
    if value then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    end
end)

-- Add your buttons here:
AddButton("High Gravity", function()
    workspace.Gravity = 5
end)
