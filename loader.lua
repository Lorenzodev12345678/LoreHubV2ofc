-- [[ LoreHub v2 - Loader de Segurança ]]
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- Interface do Loader
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoreLoader"
ScreenGui.Parent = pgui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 260, 0, 170)
Frame.Position = UDim2.new(0.5, -130, 0.5, -85)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Corner = Instance.new("UICorner", Frame)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(80, 80, 255)
Stroke.Thickness = 2

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 45)
Title.Text = "LOREHUB | SISTEMA DE KEY"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.BackgroundTransparency = 1

local KeyBox = Instance.new("TextBox", Frame)
KeyBox.Size = UDim2.new(0.85, 0, 0, 35)
KeyBox.Position = UDim2.new(0.075, 0, 0.35, 0)
KeyBox.PlaceholderText = "Insira a Key aqui..."
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", KeyBox)

local VerifyBtn = Instance.new("TextButton", Frame)
VerifyBtn.Size = UDim2.new(0.85, 0, 0, 40)
VerifyBtn.Position = UDim2.new(0.075, 0, 0.65, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
VerifyBtn.Text = "VERIFICAR KEY"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", VerifyBtn)

-- Lógica de Injeção
VerifyBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "LORE_RLK_2025" then
        VerifyBtn.Text = "CARREGANDO MAIN..."
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        
        -- Pequeno delay para garantir que o Delta não feche
        task.wait(0.5)
        
        ScreenGui:Destroy()
        
        -- Chama o Main.lua atualizado com Skybox e HK416
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/main/main.lua'))()
        end)
        
        if not success then
            print("Erro ao carregar o script principal: " .. err)
        end
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "KEY ERRADA!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1)
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 255)
    end
end)
