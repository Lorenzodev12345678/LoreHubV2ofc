-- [[ LoreHub v2 LITE - OFICIAL ]]
-- [[ Versão Blindada para Delta/Mobile ]]

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

-- PAINEL PRINCIPAL
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
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

-- BOTÃO DE "+" (MOVE O PAINEL E ABRE/FECHA)
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

PlusBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- CONTAINER DE BOTÕES
ButtonsHolder.Parent = MainFrame
ButtonsHolder.Position = UDim2.new(0, 10, 0, 60)
ButtonsHolder.Size = UDim2.new(1, -20, 1, -70)
ButtonsHolder.BackgroundTransparency = 1
ButtonsHolder.CanvasSize = UDim2.new(0, 0, 1.8, 0)
ButtonsHolder.ScrollBarThickness = 0

UIListLayout.Parent = ButtonsHolder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- FUNÇÃO PARA CRIAR OPÇÕES (Com Borda e Corner)
local function AddOption(name, callback)
    local Btn = Instance.new("TextButton")
    local Corner = Instance.new("UICorner")
    local Stroke = Instance.new("UIStroke")

    Btn.Name = name
    Btn.Parent = ButtonsHolder
    Btn.Size = UDim2.new(0.95, 0, 0, 40)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14

    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Btn

    Stroke.Thickness = 1.5
    Stroke.Color = Color3.fromRGB(70, 70, 70)
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Stroke.Parent = Btn

    Btn.MouseButton1Click:Connect(callback)
end

-- [[ AS 8+ OPÇÕES CORRIGIDAS ]]

-- 1. COMBATE (Auto Attack/Clicker)
AddOption("Combate RLK (Auto-Attack)", function()
    local lp = game.Players.LocalPlayer
    _G.AutoAttack = not _G.AutoAttack
    task.spawn(function()
        while _G.AutoAttack do
            local char = lp.Character
            local tool = char and char:FindFirstChildOfClass("Tool")
            if tool then
                tool:Activate()
            end
            task.wait(0.1)
        end
    end)
end)

-- 2. FLY (Voo Lite)
AddOption("Fly (Voo)", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    _G.Flying = not _G.Flying
    local bv = hrp:FindFirstChild("FlyBV") or Instance.new("BodyVelocity")
    bv.Name = "FlyBV"
    bv.Parent = hrp
    bv.MaxForce = _G.Flying and Vector3.new(1e9, 1e9, 1e9) or Vector3.new(0,0,0)
    
    task.spawn(function()
        while _G.Flying do
            bv.Velocity = player:GetMouse().Hit.LookVector * 50
            task.wait()
        end
        bv:Destroy()
    end)
end)

-- 3. BOOST FPS
AddOption("Boost FPS (Extreme)", function()
    settings().Rendering.QualityLevel = 1
    game.Lighting.GlobalShadows = false
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
        end
    end
end)

-- 4. WALKSPEED
AddOption("Velocidade (50)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

-- 5. JUMPPOWER
AddOption("Pulo Alto (100)", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)

-- 6. INFINITE YIELD
AddOption("Infinite Yield (Admin)", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

-- 7. ESP (Ver Jogadores)
AddOption("ESP (Universal)", function()
    print("ESP Ativado") -- Aqui você pode por seu script de ESP favorito
end)

-- 8. ANTI-AFK
AddOption("Anti-AFK (RLK)", function()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

print("LoreHub Lite V2 Carregada com sucesso!")
