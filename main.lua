local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local ButtonsHolder = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local OpenCloseBtn = Instance.new("TextButton")
local OpenCorner = Instance.new("UICorner")

-- Configurações da ScreenGui
ScreenGui.Name = "LoreHubCustom"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame Principal (O Painel)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true -- Faz o painel mover

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(50, 50, 50)
UIStroke.Parent = MainFrame

-- Título
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "LoreHub v2 | RLK"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- Botão de "+" (Para abrir/fechar e mover junto)
OpenCloseBtn.Name = "PlusButton"
OpenCloseBtn.Parent = ScreenGui -- Deixamos no Gui para não sumir se fechar o frame
OpenCloseBtn.Size = UDim2.new(0, 40, 0, 40)
OpenCloseBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
OpenCloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OpenCloseBtn.Text = "+"
OpenCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenCloseBtn.TextSize = 25
OpenCloseBtn.Font = Enum.Font.GothamBold
OpenCloseBtn.Active = true
OpenCloseBtn.Draggable = true

OpenCorner.CornerRadius = UDim.new(1, 0) -- Deixa redondo
OpenCorner.Parent = OpenCloseBtn

-- Função para abrir/fechar
OpenCloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Container dos Botões
ButtonsHolder.Parent = MainFrame
ButtonsHolder.Position = UDim2.new(0, 10, 0, 50)
ButtonsHolder.Size = UDim2.new(1, -20, 1, -60)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
ButtonsHolder.ScrollBarThickness = 2

UIListLayout.Parent = ButtonsHolder
UIListLayout.Padding = UDim.new(0, 8)

-- Função para criar botão com borda
local function CreateButton(name, callback)
    local Btn = Instance.new("TextButton")
    local BtnCorner = Instance.new("UICorner")
    local BtnStroke = Instance.new("UIStroke")

    Btn.Name = name
    Btn.Parent = ButtonsHolder
    Btn.Size = UDim2.new(1, -5, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14

    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn

    BtnStroke.Thickness = 1
    BtnStroke.Color = Color3.fromRGB(100, 100, 100)
    BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    BtnStroke.Parent = Btn

    Btn.MouseButton1Click:Connect(callback)
end

-- ADICIONANDO AS 8 OPÇÕES (Basta seguir o padrão)
CreateButton("Fatality Combo", function() print("Combo!") end)
CreateButton("FPS Booster", function() print("Liso!") end)
CreateButton("WalkSpeed", function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50 end)
CreateButton("JumpPower", function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100 end)
CreateButton("Fly", function() print("Voando!") end)
CreateButton("Auto-Click", function() print("Click!") end)
CreateButton("Anti-AFK", function() print("Ativo!") end)
CreateButton("Esp Universal", function() print("Vendo tudo!") end)

print("LoreHub v2 Custom Carregada!")
