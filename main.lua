-- [[ LoreHub v2 - FULL VERSION ]]
-- [[ Botão com Imagem Circular & Skybox Agressivo ]]

local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- Destruir versão antiga para não bugar
if pgui:FindFirstChild("LoreHubLiteV2") then pgui:FindFirstChild("LoreHubLiteV2"):Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoreHubLiteV2"
ScreenGui.Parent = pgui
ScreenGui.ResetOnSpawn = false

-- [ BOTÃO CIRCULAR COM A SUA IMAGEM ]
local PlusBtn = Instance.new("ImageButton", ScreenGui)
PlusBtn.Name = "MainButton"
PlusBtn.Size = UDim2.new(0, 45, 0, 45)
PlusBtn.Position = UDim2.new(0.1, 0, 0.2, 0)
PlusBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
PlusBtn.Image = "rbxassetid://110311797595334" -- Sua imagem aplicada
PlusBtn.Draggable = true
PlusBtn.Active = true

local Corner = Instance.new("UICorner", PlusBtn)
Corner.CornerRadius = UDim.new(1, 0)

local Stroke = Instance.new("UIStroke", PlusBtn)
Stroke.Color = Color3.fromRGB(0, 0, 0) -- Stroke PRETO
Stroke.Thickness = 2

-- [ FRAME PRINCIPAL ]
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 450)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Visible = false
MainFrame.Draggable = true
MainFrame.Active = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 0, 0) -- Stroke preto no painel
MainStroke.Thickness = 2

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "LOREHUB V2 | FULL"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

-- Abrir/Fechar
PlusBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Container de Botões
local ButtonsHolder = Instance.new("ScrollingFrame", MainFrame)
ButtonsHolder.Size = UDim2.new(1, -20, 1, -150)
ButtonsHolder.Position = UDim2.new(0, 10, 0, 55)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.ScrollBarThickness = 0
local UIList = Instance.new("UIListLayout", ButtonsHolder)
UIList.Padding = UDim.new(0, 8)

local function AddOption(name, callback)
    local btn = Instance.new("TextButton", ButtonsHolder)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
end

-- [[ SISTEMA DE SKYBOX "LIMPA TUDO" ]]
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
SkyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SkyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SkyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", SkyBtn)

SkyBtn.MouseButton1Click:Connect(function()
    local id = SkyInput.Text:match("%d+")
    if id then
        local asset = "rbxassetid://" .. id
        local lighting = game:GetService("Lighting")
        
        -- Remove tudo o que pode atrapalhar o céu
        for _, v in pairs(lighting:GetChildren()) do
            if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("Clouds") then
                v:Destroy()
            end
        end
        
        -- Cria nova Skybox
        local newSky = Instance.new("Sky")
        newSky.Name = "LoreSkybox"
        newSky.SkyboxBk = asset
        newSky.SkyboxDn = asset
        newSky.SkyboxFt = asset
        newSky.SkyboxLf = asset
        newSky.SkyboxRt = asset
        newSky.SkyboxUp = asset
        newSky.SunAngularSize = 0 -- Tira o sol pra foto aparecer melhor
        newSky.MoonAngularSize = 0
        newSky.Parent = lighting
        print("Skybox aplicada e antiga removida!")
    end
end)

-- [[ FUNÇÕES ]]

AddOption("NoClip (Atravessar)", function()
    _G.Noclip = true
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Noclip and player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end)
end)

AddOption("UnClip (Normal)", function()
    _G.Noclip = false
    if player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = true end
        end
    end
end)

AddOption("Fly (Câmera)", function()
    _G.Flying = not _G.Flying
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        if _G.Flying then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "LoreFly"
            bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            task.spawn(function()
                while _G.Flying do
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
                    task.wait()
                end
                bv:Destroy()
            end)
        end
    end
end)

AddOption("Pegar HK416 (Fix)", function()
    local success, objects = pcall(function() return game:GetObjects("rbxassetid://2800627574") end)
    if success and objects[1] then
        local tool = objects[1]
        for _, v in pairs(tool:GetDescendants()) do
            if v:IsA("BasePart") and not tool:FindFirstChild("Handle") then
                v.Name = "Handle"
                break
            end
        end
        tool.Parent = player.Backpack
    end
end)

AddOption("Speed (100)", function() 
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 100 
    end
end)

print("LoreHub V2 - Sistema de Skybox Fixado!")
