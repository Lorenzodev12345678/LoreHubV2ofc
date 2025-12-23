-- [[ LoreHub v2 - Loader para UI Custom ]]
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui

-- Janela de Login
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

UIStroke.Color = Color3.fromRGB(100, 100, 255) -- Borda azulada
UIStroke.Thickness = 2
UIStroke.Parent = Frame

Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "LoreHub | Login"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1

-- Campo da Key
KeyBox.Parent = Frame
KeyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.PlaceholderText = "Insira a Key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)

Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 5)

-- Botão Verificar
VerifyBtn.Parent = Frame
VerifyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 35)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 5)

-- Lógica da Key
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "LORE_RLK_2025" then
        print("Acesso Permitido!")
        ScreenGui:Destroy() -- Fecha o login
        -- CARREGA O MAIN NOVO
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/main/main.lua'))()
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "KEY ERRADA!"
    end
end)
