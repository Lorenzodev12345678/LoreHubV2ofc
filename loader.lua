-- [[ LoreHub v2 | Secure Loader ]]
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local VerifyBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "LoreHubLoader"

-- Frame Central
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Position = UDim2.new(0.5, -125, 0.5, -80)
Frame.Size = UDim2.new(0, 250, 0, 160)
Frame.Active = true
Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(80, 80, 255)
UIStroke.Parent = Frame

-- Título
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "LOREHUB V2 | LOGIN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.BackgroundTransparency = 1

-- Campo de Key (Blindado)
KeyInput.Parent = Frame
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyInput.PlaceholderText = "Insira sua Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", KeyInput).Color = Color3.fromRGB(60, 60, 60)

-- Botão de Verificação
VerifyBtn.Parent = Frame
VerifyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 40)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
VerifyBtn.Text = "VERIFICAR AGORA"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 14
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 6)

-- Lógica de Segurança
VerifyBtn.MouseButton1Click:Connect(function()
    -- A Key oficial que você definiu
    if KeyInput.Text == "LORE_RLK_2025" then
        VerifyBtn.Text = "ACESSO LIBERADO!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        task.wait(1)
        ScreenGui:Destroy()
        -- Carrega o Main.lua que a gente acabou de atualizar
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/main/main.lua'))()
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "KEY INVÁLIDA, MAN!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1)
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
    end
end)
