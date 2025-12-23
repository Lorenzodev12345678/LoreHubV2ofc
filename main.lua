-- [[ LoreHub v2 - Oficial Release 2025 ]]
-- [[ Desenvolvido por Lorenzodev12345678 ]]

-- Garantindo que o rblx carregou antes de abrir a UI
if not game:IsLoaded() then 
    game.Loaded:Wait() 
end
task.wait(0.5)

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
    Name = "LoreHub v2 | Universal", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "LoreHubV2", 
    IntroText = "LoreHub v2 - Bem-vindo, RLK!"
})

-- [[ ABA DE COMBATE ]]
local CombatTab = Window:MakeTab({
	Name = "Combate",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CombatTab:AddSection({
	Name = "Habilidades de Luta"
})

CombatTab:AddButton({
	Name = "Fatality Combo (R15)",
	Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if char and char:FindFirstChild("Humanoid") then
            -- Animação de ataque rápido
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://507770239" 
            local load = char.Humanoid:LoadAnimation(anim)
            load:Play()
            
            -- Notificação de Sucesso
            OrionLib:MakeNotification({
                Name = "Fatality Ativado",
                Content = "Combo de combate executado com sucesso!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Erro",
                Content = "Seu personagem precisa ser R15!",
                Time = 3
            })
        end
  	end    
})

-- [[ ABA DE OTIMIZAÇÃO ]]
local SettingsTab = Window:MakeTab({
	Name = "Otimização",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

SettingsTab:AddSection({
	Name = "Performance Booster"
})

SettingsTab:AddButton({
	Name = "Boost FPS (200+ Extreme)",
	Callback = function()
        -- Reduz qualidade gráfica interna
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        
        -- Remove sombras e efeitos visuais pesados
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 9e9
        
        -- Transforma materiais em plástico liso (tira o lag de textura)
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
            -- Remove Decals (adesivos/pixações que pesam)
            if v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end
        
        OrionLib:MakeNotification({
            Name = "FPS Booster",
            Content = "Otimização aplicada! Seu rbx agora está leve.",
            Image = "rbxassetid://4483345998",
            Time = 4
        })
  	end    
})

-- [[ ABA DE CRÉDITOS ]]
local InfoTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

InfoTab:AddLabel("Criador: Lorenzodev12345678")
InfoTab:AddLabel("Lançamento: 23/12/2025")
InfoTab:AddLabel("Status: 100% Funcional")

InfoTab:AddButton({
	Name = "Copiar Link do ScriptBlox",
	Callback = function()
		setclipboard("https://scriptblox.com/script/Universal-Script-LoreahubV2-77644")
        OrionLib:MakeNotification({Name = "Copiado!", Content = "Link copiado para a área de transferência.", Time = 2})
	end
})

-- Finaliza o script e mostra a janela
OrionLib:Init()
