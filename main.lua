-- [[ LoreHub v2 LITE - VERSÃO OFICIAL NOS EXECUTORES ]]
-- [[ Desenvolvido por Lorenzodev12345678 ]]

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local ButtonsHolder = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local PlusBtn = Instance.new("TextButton")
local PlusCorner = Instance.new("UICorner")

ScreenGui.Name = "LoreHubLiteV2"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- FRAME PRINCIPAL (Inicia invisível para a mensagem só contar no clique)
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(80, 80, 255)
UIStroke.Parent = MainFrame

-- TÍTULO
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOREHUB V2 | LITE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

-- BOTÃO "+" (LÓGICA DE ABRIR + MENSAGEM NO CHAT)
PlusBtn.Name = "PlusButton"
PlusBtn.Parent = ScreenGui
PlusBtn.Size = UDim2.new(0, 45, 0, 45)
PlusBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.TextSize = 25
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Active = true
PlusBtn.Draggable = true

PlusCorner.CornerRadius = UDim.new(1, 0)
PlusCorner.Parent = PlusBtn

local jaAvisou = false

PlusBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    
    -- Manda a mensagem apenas na primeira vez que abrir
    if not jaAvisou and MainFrame.Visible then
        jaAvisou = true
        local player = game.Players.LocalPlayer
        local msg = player.Name .. " está usando o LoreHub preparemmmmm"
        
        task.spawn(function()
            if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                local

