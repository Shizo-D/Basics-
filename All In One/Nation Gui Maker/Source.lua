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
