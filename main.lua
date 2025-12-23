-- [[ LoreHub v2 LITE - FIX DE VISIBILIDADE ]]

local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui") -- Mudança para PlayerGui para garantir que aparece

-- Verifica se já existe para não duplicar
if pgui:FindFirstChild("LoreHubLiteV2") then
    pgui:FindFirstChild("LoreHubLiteV2"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoreHubLiteV2"
ScreenGui.Parent = pgui -- Definindo o parent aqui
ScreenGui.ResetOnSpawn = false -- Para o menu não sumir quando você morrer
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
local PlusBtn = Instance.new("TextButton")

-- [ BOTÃO DE + ] - Criamos ele primeiro para garantir que você veja algo
PlusBtn.Name = "PlusButton"
PlusBtn.Parent = ScreenGui
PlusBtn.Size = UDim2.new(0, 50, 0, 50)
PlusBtn.Position = UDim2.new(0.1, 0, 0.2, 0) -- Posição um pouco mais para baixo
PlusBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.TextSize = 30
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Active = true
PlusBtn.Draggable = true
PlusBtn.ZIndex = 10 -- Garante que fica em cima de tudo

local PlusCorner = Instance.new("UICorner", PlusBtn)
PlusCorner.CornerRadius = UDim.new(1, 0)

local PlusStroke = Instance.new("UIStroke", PlusBtn)
PlusStroke.Thickness = 2
PlusStroke.Color = Color3.fromRGB(80, 80, 255)

-- [ FRAME PRINCIPAL ]
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Visible = false -- Começa invisível
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(80, 80, 255)

-- Lógica de Abrir e Mensagem
local jaAvisou = false
PlusBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    
    if not jaAvisou and MainFrame.Visible then
        jaAvisou = true
        local msg = player.Name .. " está usando o LoreHub preparemmmmm"
        task.spawn(function()
            if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                local channel = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
                if channel then channel:SendAsync(msg) end
            else
                local chatEvent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
                if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
                    chatEvent.SayMessageRequest:FireServer(msg, "All")
                end
            end
        end)
    end
end)

-- TÍTULO E BOTÕES (O restante do código continua igual abaixo...)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOREHUB V2 | LITE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

local ButtonsHolder = Instance.new("ScrollingFrame", MainFrame)
ButtonsHolder.Position = UDim2.new(0, 10, 0, 60)
ButtonsHolder.Size = UDim2.new(1, -20, 1, -70)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.CanvasSize = UDim2.new(0, 0, 2, 0)
ButtonsHolder.ScrollBarThickness = 0

local UIListLayout = Instance.new("UIListLayout", ButtonsHolder)
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function AddOption(name, callback)
    local Btn = Instance.new("TextButton", ButtonsHolder)
    Btn.Size = UDim2.new(0.95, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.Gotham
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
    local st = Instance.new("UIStroke", Btn)
    st.Color = Color3.fromRGB(70, 70, 70)
    st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Btn.MouseButton1Click:Connect(callback)
end

-- Adiciona as opções rapidamente
AddOption("Combate RLK", function() print("Ativo") end)
AddOption("Fly", function() print("Fly") end)
AddOption("Velocidade (50)", function() player.Character.Humanoid.WalkSpeed = 50 end)
AddOption("Infinite Yield", function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end)

print("LoreHub Lite: Interface Forçada!")
