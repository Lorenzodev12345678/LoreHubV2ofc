local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "LoreHub | Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyBox.PlaceholderText = "Cole a Key aqui..."
KeyBox.Parent = Frame

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(0.8, 0, 0, 35)
Btn.Position = UDim2.new(0.1, 0, 0.7, 0)
Btn.Text = "ENTRAR"
Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Parent = Frame

Btn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "LORE_RLK_2025" then
        ScreenGui:Destroy()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/main/main.lua'))()
    end
end)
