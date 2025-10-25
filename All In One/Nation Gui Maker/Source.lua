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





















--[[ BackUps for Elements ]] --

-- ========================================
-- ULTIMATE NATION GUI TEMPLATE
-- With: TextBox, Paragraph, Dropdown, Slider, Key System
-- Mobile + PC Compatible
-- ========================================

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- ========================================
-- KEY SYSTEM (Set your key here)
-- ========================================

local CORRECT_KEY = "NationHub2024" -- Change this to your key
local KEY_LINK = "https://nation-on-top.up.railway.app" -- Your website

-- ========================================
-- CREATE MAIN GUI
-- ========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if gethui then
    ScreenGui.Parent = gethui()
elseif protect_gui then
    protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
else
    ScreenGui.Parent = game.CoreGui
end

-- ========================================
-- KEY SYSTEM GUI
-- ========================================

local function CreateKeySystem()
    local KeyFrame = Instance.new("Frame")
    KeyFrame.Parent = ScreenGui
    KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    KeyFrame.Size = UDim2.new(0, 300, 0, 200)
    KeyFrame.Active = true
    KeyFrame.Draggable = true
    
    local KeyCorner = Instance.new("UICorner", KeyFrame)
    KeyCorner.CornerRadius = UDim.new(0, 8)
    
    -- Title
    local KeyTitle = Instance.new("TextLabel")
    KeyTitle.Parent = KeyFrame
    KeyTitle.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
    KeyTitle.Size = UDim2.new(1, 0, 0, 40)
    KeyTitle.Font = Enum.Font.GothamBold
    KeyTitle.Text = "🔐 Nation Hub - Key System"
    KeyTitle.TextColor3 = Color3.fromRGB(225, 0, 0)
    KeyTitle.TextSize = 16
    
    local KeyTitleCorner = Instance.new("UICorner", KeyTitle)
    KeyTitleCorner.CornerRadius = UDim.new(0, 8)
    
    -- Info Text
    local InfoText = Instance.new("TextLabel")
    InfoText.Parent = KeyFrame
    InfoText.BackgroundTransparency = 1
    InfoText.Position = UDim2.new(0, 10, 0, 50)
    InfoText.Size = UDim2.new(1, -20, 0, 40)
    InfoText.Font = Enum.Font.Gotham
    InfoText.Text = "Enter your key to access Nation Hub"
    InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    InfoText.TextSize = 12
    InfoText.TextWrapped = true
    InfoText.TextXAlignment = Enum.TextXAlignment.Left
    
    -- Key TextBox
    local KeyBox = Instance.new("TextBox")
    KeyBox.Parent = KeyFrame
    KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    KeyBox.Position = UDim2.new(0.05, 0, 0, 100)
    KeyBox.Size = UDim2.new(0.9, 0, 0, 35)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Enter key here..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextSize = 14
    KeyBox.ClearTextOnFocus = false
    
    local KeyBoxCorner = Instance.new("UICorner", KeyBox)
    KeyBoxCorner.CornerRadius = UDim.new(0, 6)
    
    -- Get Key Button
    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Parent = KeyFrame
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    GetKeyBtn.Position = UDim2.new(0.05, 0, 0, 145)
    GetKeyBtn.Size = UDim2.new(0.425, 0, 0, 35)
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
    GetKeyBtn.TextSize = 14
    
    local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
    GetKeyCorner.CornerRadius = UDim.new(0, 6)
    
    -- Submit Button
    local SubmitBtn = Instance.new("TextButton")
    SubmitBtn.Parent = KeyFrame
    SubmitBtn.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    SubmitBtn.Position = UDim2.new(0.525, 0, 0, 145)
    SubmitBtn.Size = UDim2.new(0.425, 0, 0, 35)
    SubmitBtn.Font = Enum.Font.GothamBold
    SubmitBtn.Text = "Submit"
    SubmitBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
    SubmitBtn.TextSize = 14
    
    local SubmitCorner = Instance.new("UICorner", SubmitBtn)
    SubmitCorner.CornerRadius = UDim.new(0, 6)
    
    -- Get Key Button Click
    GetKeyBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(KEY_LINK)
            InfoText.Text = "✅ Link copied! Get your key from the website"
            InfoText.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            InfoText.Text = "Link: " .. KEY_LINK
            InfoText.TextColor3 = Color3.fromRGB(255, 165, 0)
        end
    end)
    
    -- Submit Button Click
    SubmitBtn.MouseButton1Click:Connect(function()
        if KeyBox.Text == CORRECT_KEY then
            InfoText.Text = "✅ Key Correct! Loading..."
            InfoText.TextColor3 = Color3.fromRGB(0, 255, 0)
            task.wait(1)
            KeyFrame:Destroy()
            return true
        else
            InfoText.Text = "❌ Invalid Key! Try again"
            InfoText.TextColor3 = Color3.fromRGB(255, 0, 0)
            KeyBox.Text = ""
        end
    end)
    
    -- Wait for correct key
    repeat task.wait() until not KeyFrame.Parent
end

-- Show key system
CreateKeySystem()

-- ========================================
-- MAIN GUI SETUP
-- ========================================

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Size = UDim2.new(0, 400, 0, 140)
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel")
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

-- ========================================
-- ELEMENT FUNCTIONS
-- ========================================

-- 1. BUTTON
local function AddButton(text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = MainFrame
    Button.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    Button.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    Button.Size = UDim2.new(0.9, 0, 0, 35)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.TextSize = 16
    
    local ButtonCorner = Instance.new("UICorner", Button)
    ButtonCorner.CornerRadius = UDim.new(0, 4)
    
    Button.MouseButton1Click:Connect(callback)
    
    ButtonCount = ButtonCount + 1
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return Button
end

-- 2. TOGGLE
local function AddToggle(text, default, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = MainFrame
    Toggle.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    Toggle.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    Toggle.Size = UDim2.new(0.9, 0, 0, 35)
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
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return Toggle
end

-- 3. TEXTBOX
local function AddTextBox(placeholder, callback)
    local TextBox = Instance.new("TextBox")
    TextBox.Parent = MainFrame
    TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TextBox.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    TextBox.Size = UDim2.new(0.9, 0, 0, 35)
    TextBox.Font = Enum.Font.Gotham
    TextBox.PlaceholderText = placeholder
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = false
    
    local TextBoxCorner = Instance.new("UICorner", TextBox)
    TextBoxCorner.CornerRadius = UDim.new(0, 4)
    
    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(TextBox.Text)
        end
    end)
    
    ButtonCount = ButtonCount + 1
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return TextBox
end

-- 4. PARAGRAPH (Multi-line text display)
local function AddParagraph(title, text)
    local ParagraphFrame = Instance.new("Frame")
    ParagraphFrame.Parent = MainFrame
    ParagraphFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ParagraphFrame.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    ParagraphFrame.Size = UDim2.new(0.9, 0, 0, 60)
    
    local ParagraphCorner = Instance.new("UICorner", ParagraphFrame)
    ParagraphCorner.CornerRadius = UDim.new(0, 4)
    
    local ParagraphTitle = Instance.new("TextLabel")
    ParagraphTitle.Parent = ParagraphFrame
    ParagraphTitle.BackgroundTransparency = 1
    ParagraphTitle.Position = UDim2.new(0, 5, 0, 2)
    ParagraphTitle.Size = UDim2.new(1, -10, 0, 15)
    ParagraphTitle.Font = Enum.Font.GothamBold
    ParagraphTitle.Text = title
    ParagraphTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
    ParagraphTitle.TextSize = 12
    ParagraphTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local ParagraphText = Instance.new("TextLabel")
    ParagraphText.Parent = ParagraphFrame
    ParagraphText.BackgroundTransparency = 1
    ParagraphText.Position = UDim2.new(0, 5, 0, 18)
    ParagraphText.Size = UDim2.new(1, -10, 1, -20)
    ParagraphText.Font = Enum.Font.Gotham
    ParagraphText.Text = text
    ParagraphText.TextColor3 = Color3.fromRGB(200, 200, 200)
    ParagraphText.TextSize = 11
    ParagraphText.TextWrapped = true
    ParagraphText.TextXAlignment = Enum.TextXAlignment.Left
    ParagraphText.TextYAlignment = Enum.TextYAlignment.Top
    
    ButtonCount = ButtonCount + 1.5
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return ParagraphFrame
end

-- 5. DROPDOWN (Multi-Select)
local function AddDropdown(title, options, callback)
    local DropdownFrame = Instance.new("Frame")
    DropdownFrame.Parent = MainFrame
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    DropdownFrame.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    DropdownFrame.Size = UDim2.new(0.9, 0, 0, 35)
    DropdownFrame.ClipsDescendants = true
    
    local DropdownCorner = Instance.new("UICorner", DropdownFrame)
    DropdownCorner.CornerRadius = UDim.new(0, 4)
    
    local DropdownButton = Instance.new("TextButton")
    DropdownButton.Parent = DropdownFrame
    DropdownButton.BackgroundTransparency = 1
    DropdownButton.Size = UDim2.new(1, 0, 0, 35)
    DropdownButton.Font = Enum.Font.Gotham
    DropdownButton.Text = title .. " ▼"
    DropdownButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    DropdownButton.TextSize = 14
    
    local OptionsFrame = Instance.new("ScrollingFrame")
    OptionsFrame.Parent = DropdownFrame
    OptionsFrame.BackgroundTransparency = 1
    OptionsFrame.Position = UDim2.new(0, 0, 0, 35)
    OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
    OptionsFrame.ScrollBarThickness = 4
    OptionsFrame.CanvasSize = UDim2.new(0, 0, 0, #options * 30)
    
    local ListLayout = Instance.new("UIListLayout", OptionsFrame)
    ListLayout.Padding = UDim.new(0, 2)
    
    local selectedOptions = {}
    local isOpen = false
    
    DropdownButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        
        if isOpen then
            DropdownButton.Text = title .. " ▲"
            local targetSize = math.min(#options * 30 + 35, 150)
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.9, 0, 0, targetSize)}):Play()
            OptionsFrame.Size = UDim2.new(1, 0, 0, targetSize - 35)
        else
            DropdownButton.Text = title .. " ▼"
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = UDim2.new(0.9, 0, 0, 35)}):Play()
            OptionsFrame.Size = UDim2.new(1, 0, 0, 0)
        end
    end)
    
    for _, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Parent = OptionsFrame
        OptionButton.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
        OptionButton.Size = UDim2.new(1, -10, 0, 28)
        OptionButton.Font = Enum.Font.Gotham
        OptionButton.Text = "☐ " .. option
        OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        OptionButton.TextSize = 12
        OptionButton.TextXAlignment = Enum.TextXAlignment.Left
        
        local OptionCorner = Instance.new("UICorner", OptionButton)
        OptionCorner.CornerRadius = UDim.new(0, 3)
        
        local UIPadding = Instance.new("UIPadding", OptionButton)
        UIPadding.PaddingLeft = UDim.new(0, 10)
        
        OptionButton.MouseButton1Click:Connect(function()
            if selectedOptions[option] then
                selectedOptions[option] = nil
                OptionButton.Text = "☐ " .. option
                OptionButton.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
            else
                selectedOptions[option] = true
                OptionButton.Text = "☑ " .. option
                OptionButton.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
            end
            
            callback(selectedOptions)
        end)
    end
    
    ButtonCount = ButtonCount + 1
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return DropdownFrame
end

-- 6. SLIDER (Mobile + PC)
local function AddSlider(title, min, max, default, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Parent = MainFrame
    SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    SliderFrame.Position = UDim2.new(0.05, 0, 0, 45 + (ButtonCount * 45))
    SliderFrame.Size = UDim2.new(0.9, 0, 0, 45)
    
    local SliderCorner = Instance.new("UICorner", SliderFrame)
    SliderCorner.CornerRadius = UDim.new(0, 4)
    
    local SliderTitle = Instance.new("TextLabel")
    SliderTitle.Parent = SliderFrame
    SliderTitle.BackgroundTransparency = 1
    SliderTitle.Position = UDim2.new(0, 5, 0, 2)
    SliderTitle.Size = UDim2.new(0.7, 0, 0, 15)
    SliderTitle.Font = Enum.Font.Gotham
    SliderTitle.Text = title
    SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderTitle.TextSize = 12
    SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Parent = SliderFrame
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(0.7, 0, 0, 2)
    ValueLabel.Size = UDim2.new(0.3, -5, 0, 15)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    ValueLabel.TextSize = 12
    ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
    
    local SliderBar = Instance.new("Frame")
    SliderBar.Parent = SliderFrame
    SliderBar.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
    SliderBar.Position = UDim2.new(0, 5, 0, 23)
    SliderBar.Size = UDim2.new(1, -10, 0, 8)
    
    local SliderBarCorner = Instance.new("UICorner", SliderBar)
    SliderBarCorner.CornerRadius = UDim.new(1, 0)
    
    local SliderFill = Instance.new("Frame")
    SliderFill.Parent = SliderBar
    SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    
    local SliderFillCorner = Instance.new("UICorner", SliderFill)
    SliderFillCorner.CornerRadius = UDim.new(1, 0)
    
    local SliderButton = Instance.new("TextButton")
    SliderButton.Parent = SliderBar
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    SliderButton.Size = UDim2.new(0, 16, 0, 16)
    SliderButton.Text = ""
    SliderButton.AutoButtonColor = false
    
    local ButtonCorner = Instance.new("UICorner", SliderButton)
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    
    local currentValue = default
    local dragging = false
    
    local function updateSlider(input)
        local barPos = SliderBar.AbsolutePosition.X
        local barSize = SliderBar.AbsoluteSize.X
        local mousePos = input.Position.X
        
        local percent = math.clamp((mousePos - barPos) / barSize, 0, 1)
        currentValue = math.floor(min + (max - min) * percent)
        
        ValueLabel.Text = tostring(currentValue)
        SliderFill.Size = UDim2.new(percent, 0, 1, 0)
        SliderButton.Position = UDim2.new(percent, -8, 0.5, -8)
        
        callback(currentValue)
    end
    
    SliderButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateSlider(input)
        end
    end)
    
    SliderButton.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
           input.UserInputType == Enum.UserInputType.Touch) then
            updateSlider(input)
        end
    end)
    
    SliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or 
           input.UserInputType == Enum.UserInputType.Touch then
            updateSlider(input)
        end
    end)
    
    ButtonCount = ButtonCount + 1.2
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 45) + 10)
    
    return SliderFrame
end

-- ========================================
-- EXAMPLES - HOW TO USE
-- ========================================

AddParagraph("Welcome", "This is Nation Hub with all UI elements. Drag from the title bar!")

AddTextBox("Enter player name...", function(text)
    print("You entered:", text)
end)

AddToggle("Speed Boost", false, function(value)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value and 50 or 16
        end
    end
end)

AddSlider("Walkspeed", 16, 200, 50, function(value)
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
end)

AddDropdown("Select Features", {"ESP", "Aimbot", "Fly", "Noclip"}, function(selected)
    print("Selected options:")
    for option, _ in pairs(selected) do
        print("  -", option)
    end
end)

AddButton("High Gravity", function()
    workspace.Gravity = 300
    print("✅ High gravity!")
end)

































-- ========================================
-- PROTECTED NATION HUB GUI
-- This for Buckups Only
-- ========================================

print(" Loading Protected Nation Hub...")

-- ========================================
-- STEP 1: SETUP ALL PROTECTIONS FIRST
-- ========================================

-- Block all kick attempts
local old_namecall
old_namecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    
    -- Block kicks
    if method == "Kick" then
        warn("🛡️ Blocked kick attempt! Reason:", args[1] or "No reason")
        return nil
    end
    
    -- Block GUI detection remotes
    if method == "FireServer" or method == "InvokeServer" then
        local name = self.Name:lower()
        if name:find("detect") or name:find("check") or 
           name:find("gui") or name:find("flag") or name:find("log") then
            warn("🛡️ Blocked detection remote:", self.Name)
            return nil
        end
        
        -- Block if sending GUI data
        for _, arg in pairs(args) do
            if type(arg) == "table" then
                for k, v in pairs(arg) do
                    if type(v) == "userdata" and pcall(function() return v:IsA("ScreenGui") end) then
                        warn("🛡️ Blocked GUI data transmission")
                        return nil
                    end
                end
            end
        end
    end
    
    return old_namecall(self, ...)
end)

-- Hide GUI from scanners
local old_index
old_index = hookmetamethod(game, "__index", function(self, key)
    -- If anti-cheat tries to scan CoreGui/PlayerGui
    if key == "PlayerGui" or key == "CoreGui" then
        local caller = getcallingscript()
        if caller then
            local name = caller.Name:lower()
            if name:find("anti") or name:find("detect") or 
               name:find("check") or name:find("security") then
                warn("🛡️ Blocked GUI scan from:", caller.Name)
                return Instance.new("Folder")
            end
        end
    end
    
    return old_index(self, key)
end)

print("✅ Protection hooks active!")

-- Wait for anti-cheat initial scan to finish
task.wait(2)

-- ========================================
-- STEP 2: CREATE PROTECTED GUI
-- ========================================

local ScreenGui = Instance.new("ScreenGui")

-- CRITICAL: Random name to avoid detection
ScreenGui.Name = game:GetService("HttpService"):GenerateGUID(false):gsub("-", "")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

-- Use best protection method available
if gethui then
    ScreenGui.Parent = gethui()
    print("✅ GUI hidden in gethui()")
elseif syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
    print("✅ GUI protected with Synapse")
elseif protect_gui then
    protect_gui(ScreenGui)
    ScreenGui.Parent = game.CoreGui
    print("✅ GUI protected")
else
    ScreenGui.Parent = game.CoreGui
    print("⚠️ GUI in CoreGui (basic protection)")
end

-- ========================================
-- STEP 3: CREATE GUI ELEMENTS
-- ========================================

local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

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
Title.Text = "Nation Hub 🛡️"
Title.TextColor3 = Color3.fromRGB(225, 0, 0)
Title.TextSize = 20

local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 6)

-- Add close button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Title
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 2.5)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

local CloseCorner = Instance.new("UICorner", CloseButton)
CloseCorner.CornerRadius = UDim.new(0, 4)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    print("❌ Nation Hub closed")
end)

local ButtonCount = 0

-- ========================================
-- BUTTON FUNCTIONS
-- ========================================

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
    
    -- Add click animation
    Button.MouseButton1Click:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(80, 40, 40)
        task.wait(0.1)
        Button.BackgroundColor3 = Color3.fromRGB(60, 26, 25)
        
        -- Wrap callback in pcall for safety
        local success, err = pcall(callback)
        if not success then
            warn("❌ Error in button:", text, "-", err)
        end
    end)
    
    ButtonCount = ButtonCount + 1
    
    -- Auto resize the frame
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 40) + 10)
    
    return Button
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
        
        -- Wrap callback in pcall for safety
        local success, err = pcall(function()
            callback(toggled)
        end)
        if not success then
            warn("❌ Error in toggle:", text, "-", err)
        end
    end)
    
    ButtonCount = ButtonCount + 1
    MainFrame.Size = UDim2.new(0, 400, 0, 45 + (ButtonCount * 40) + 10)
    
    return Toggle
end

-- ========================================
-- ADD YOUR FEATURES HERE
-- ========================================

-- Speed Toggle with anti-detection
AddToggle("Speed Boost", false, function(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        if value then
            humanoid.WalkSpeed = 50
            print("✅ Speed: ON")
        else
            humanoid.WalkSpeed = 16
            print("❌ Speed: OFF")
        end
    end
end)

-- Fly Toggle
AddToggle("Fly", false, function(value)
    local player = game.Players.LocalPlayer
    
    if value then
        -- Enable fly (using BodyVelocity method from earlier)
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        
        local bodyVel = Instance.new("BodyVelocity")
        bodyVel.Name = "FlyVelocity"
        bodyVel.MaxForce = Vector3.new(100000, 100000, 100000)
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.Parent = hrp
        
        local bodyGyro = Instance.new("BodyGyro")
        bodyGyro.Name = "FlyGyro"
        bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
        bodyGyro.P = 10000
        bodyGyro.Parent = hrp
        
        print("✅ Fly: ON (Use WASD + Space/Shift)")
        
        -- Movement handled by RunService in background
        _G.FlyConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not value then return end
            
            local moveVector = Vector3.new(0, 0, 0)
            local cam = workspace.CurrentCamera
            local speed = 50
            
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                moveVector = moveVector + (cam.CFrame.LookVector * speed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                moveVector = moveVector - (cam.CFrame.LookVector * speed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                moveVector = moveVector - (cam.CFrame.RightVector * speed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                moveVector = moveVector + (cam.CFrame.RightVector * speed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                moveVector = moveVector + Vector3.new(0, speed, 0)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                moveVector = moveVector - Vector3.new(0, speed, 0)
            end
            
            bodyVel.Velocity = moveVector
            bodyGyro.CFrame = cam.CFrame
        end)
    else
        -- Disable fly
        local character = player.Character
        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                if hrp:FindFirstChild("FlyVelocity") then
                    hrp.FlyVelocity:Destroy()
                end
                if hrp:FindFirstChild("FlyGyro") then
                    hrp.FlyGyro:Destroy()
                end
            end
        end
        
        if _G.FlyConnection then
            _G.FlyConnection:Disconnect()
        end
        
        print("❌ Fly: OFF")
    end
end)

-- ESP Toggle
AddToggle("Player ESP", false, function(value)
    if value then
        -- Simple ESP
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESP_Highlight"
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Parent = player.Character
            end
        end
        print("✅ ESP: ON")
    else
        -- Remove ESP
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local highlight = player.Character:FindFirstChild("ESP_Highlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end
        print("❌ ESP: OFF")
    end
end)

-- Gravity Button
AddButton("Low Gravity", function()
    workspace.Gravity = 50
    print("✅ Low Gravity activated!")
end)

AddButton("High Gravity", function()
    workspace.Gravity = 300
    print("✅ High Gravity activated!")
end)

AddButton("Normal Gravity", function()
    workspace.Gravity = 196.2
    print("✅ Normal Gravity restored!")
end)

-- Infinite Jump Toggle
AddToggle("Infinite Jump", false, function(value)
    if value then
        _G.InfJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end
        end)
        print("✅ Infinite Jump: ON")
    else
        if _G.InfJumpConnection then
            _G.InfJumpConnection:Disconnect()
        end
        print("❌ Infinite Jump: OFF")
    end
end)
