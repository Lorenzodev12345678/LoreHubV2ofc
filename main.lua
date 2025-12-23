 -- [[ LoreHub v2 - FULL VERSION ]]
-- [[ Desenvolvido por Lorenzodev12345678 ]]

local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- Destruir versão antiga
if pgui:FindFirstChild("LoreHubLiteV2") then pgui:FindFirstChild("LoreHubLiteV2"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoreHubLiteV2"
ScreenGui.Parent = pgui
ScreenGui.ResetOnSpawn = false

-- [ BOTÃO DE + ]
local PlusBtn = Instance.new("TextButton", ScreenGui)
PlusBtn.Size = UDim2.new(0, 50, 0, 50)
PlusBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PlusBtn.Text = "+"
PlusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusBtn.TextSize = 30
PlusBtn.Font = Enum.Font.GothamBold
PlusBtn.Draggable = true
Instance.new("UICorner", PlusBtn).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", PlusBtn).Color = Color3.fromRGB(80, 80, 255)

-- [ FRAME PRINCIPAL ]
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 450) -- Aumentado para caber os novos botões
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(80, 80, 255)

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOREHUB V2 | FULL"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

-- Lógica de abrir e Mensagem no Chat
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
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
            end
        end)
    end
end)

-- Container de Botões
local ButtonsHolder = Instance.new("ScrollingFrame", MainFrame)
ButtonsHolder.Size = UDim2.new(1, -20, 1, -150)
ButtonsHolder.Position = UDim2.new(0, 10, 0, 55)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.ScrollBarThickness = 0
local UIList = Instance.new("UIListLayout", ButtonsHolder)
UIList.Padding = UDim.new(0, 8)

-- [[ SISTEMA DE SKYBOX ]]
local SkyInput = Instance.new("TextBox", MainFrame)
SkyInput.Size = UDim2.new(0.8, 0, 0, 30)
SkyInput.Position = UDim2.new(0.1, 0, 0.72, 0)
SkyInput.PlaceholderText = "ID da Imagem (Skybox)"
SkyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SkyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SkyInput)

local SkyBtn = Instance.new("TextButton", MainFrame)
SkyBtn.Size = UDim2.new(0.8, 0, 0, 30)
SkyBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
SkyBtn.Text = "APLICAR CÉU"
SkyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
SkyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SkyBtn)

SkyBtn.MouseButton1Click:Connect(function()
    local id = SkyInput.Text:match("%d+")
    if id then
        local asset = "rbxassetid://" .. id
        local sky = game.Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", game.Lighting)
        sky.SkyboxBk = asset sky.SkyboxDn = asset sky.SkyboxFt = asset
        sky.SkyboxLf = asset sky.SkyboxRt = asset sky.SkyboxUp = asset
    end
end)

-- [[ FUNÇÕES AUXILIARES ]]
local function AddOption(name, callback)
    local btn = Instance.
