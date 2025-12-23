-- [[ LoreHub v2 - HK416 FIX & Skybox ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

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

-- Lógica de abrir e Mensagem no Chat
local jaAvisou = false
PlusBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if not jaAvisou and MainFrame.Visible then
        jaAvisou = true
        local msg = player.Name .. " está usando o LoreHub preparemmmmm"
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
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
SkyInput.Position = UDim2.new(0.1, 0, 0.75, 0)
SkyInput.PlaceholderText = "ID da Imagem (Skybox)"
SkyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SkyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", SkyInput)

local SkyBtn = Instance.new("TextButton", MainFrame)
SkyBtn.Size = UDim2.new(0.8, 0, 0, 30)
SkyBtn.Position = UDim2.new(0.1, 0, 0.85, 0)
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

-- [[ BOTÕES DE FUNÇÃO ]]
local function AddOption(name, callback)
    local btn = Instance.new("TextButton", ButtonsHolder)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

-- FIX DA HK416 (Tentativa de Handle)
AddOption("Pegar HK416 (Fix)", function()
    local objects = game:GetObjects("rbxassetid://2800627574")
    local tool = objects[1]
    if tool and tool:IsA("Tool") then
        -- Se não tiver Handle, tenta definir a primeira peça que achar
        if not tool:FindFirstChild("Handle") then
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") then
                    v.Name = "Handle"
                    break
                end
            end
        end
        tool.Parent = player.Backpack
    end
end)

AddOption("Fly (Câmera)", function()
    _G.Flying = not _G.Flying
    local hrp = player.Character.HumanoidRootPart
    if _G.Flying then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        task.spawn(function()
            while _G.Flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                task.wait()
            end
            bv:Destroy()
        end)
    end
end)

AddOption("Speed (100)", function() player.Character.Humanoid.WalkSpeed = 100 end)

print("LoreHub V2 Atualizada!")
