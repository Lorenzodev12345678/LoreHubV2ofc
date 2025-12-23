-- [[ LoreHub v2 - Delta Edition ]]
-- [[ Desenvolvido por Lorenzodev12345678 ]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("LoreHub v2 | Universal", "Midnight") -- Tema Midnight combina com o Delta

-- ABA PRINCIPAL
local Main = Window:NewTab("Combate")
local MainSection = Main:NewSection("Habilidades RLK")

MainSection:NewButton("Fatality Combo (R15)", "Executa combo de ataque rápido", function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character
    if char and char:FindFirstChild("Humanoid") then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://507770239" 
        local load = char.Humanoid:LoadAnimation(anim)
        load:Play()
    end
end)

-- ABA OTIMIZAÇÃO
local Opti = Window:NewTab("Otimização")
local OptiSection = Opti:NewSection("Performance Booster")

OptiSection:NewButton("Boost FPS (200+)", "Remove lag e texturas", function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    game.Lighting.GlobalShadows = false
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
        end
        if v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        end
    end
end)

-- ABA INFO
local Info = Window:NewTab("Info")
local InfoSection = Info:NewSection("Criador: Lorenzodev12345678")
InfoSection:NewKeybind("Esconder Menu", "Fecha a UI", Enum.KeyCode.F, function()
	Library:ToggleLib()
end)
