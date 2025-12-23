-- [[ LoreHub v2 - Skybox & UI Custom ]]
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
MainFrame.Size = UDim2.new(0, 300, 0, 420)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)
Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(80, 80, 255)

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOREHUB V2 | LITE"
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
ButtonsHolder.Size = UDim2.new(1, -20, 1, -60)
ButtonsHolder.Position = UDim2.new(0, 10, 0, 55)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.ScrollBarThickness = 0
local UIList = Instance.new("UIListLayout", ButtonsHolder)
UIList.Padding = UDim.new(0, 10)

-- [[ SISTEMA DE SKYBOX COM TEXTBOX ]]
local SkySection = Instance.new("Frame", ButtonsHolder)
SkySection.Size = UDim2.new(1, 0, 0, 80)
SkySection.BackgroundTransparency = 1

local SkyInput = Instance.new("TextBox", SkySection)
SkyInput.Size = UDim2.new(1, 0, 0, 35)
SkyInput.PlaceholderText = "Digite o ID da Imagem..."
SkyInput.Text = ""
SkyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SkyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SkyInput)

local SkyBtn = Instance.new("TextButton", SkySection)
SkyBtn.Size = UDim2.new(1, 0, 0, 35)
SkyBtn.Position = UDim2.new(0, 0, 0, 40)
SkyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
SkyBtn.Text = "APLICAR SKYBOX"
SkyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SkyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SkyBtn)

local function MudarCeu(id)
    local cleanID = string.match(id, "%d+") -- Pega só os números caso o man cole link
    if cleanID then
        local asset = "rbxassetid://" .. cleanID
        local lighting = game:GetService("Lighting")
        local sky = lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", lighting)
        
        sky.SkyboxBk = asset
        sky.SkyboxDn = asset
        sky.SkyboxFt = asset
        sky.SkyboxLf = asset
        sky.SkyboxRt = asset
        sky.SkyboxUp = asset
        print("Skybox alterada para: " .. cleanID)
    end
end

SkyBtn.MouseButton1Click:Connect(function()
    MudarCeu(SkyInput.Text)
end)

SkyInput.FocusLost:Connect(function(enter)
    if enter then MudarCeu(SkyInput.Text) end
end)

-- [[ OUTRAS OPÇÕES ]]
local function AddOption(name, callback)
    local btn = Instance.new("TextButton", ButtonsHolder)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

AddOption("Pegar HK416 (Toolbox)", function()
    local tool = game:GetObjects("rbxassetid://2800627574")[1]
    if tool then tool.Parent = player.Backpack end
end)

AddOption("Fly (Câmera)", function()
    _G.FlyRLK = not _G.FlyRLK
    local hrp = player.Character.HumanoidRootPart
    if _G.FlyRLK then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        task.spawn(function()
            while _G.FlyRLK do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

AddOption("Speed (100)", function() player.Character.Humanoid.WalkSpeed = 100 end)
AddOption("Pulo (200)", function() player.Character.Humanoid.JumpPower = 200 end)

print("LoreHub Skybox Custom Carregado!")

