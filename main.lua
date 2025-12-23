-- [[ LoreHub v2 | Universal & Direct Access ]] --
-- Dev: LoreHub Team (RLK)

local OrionLib = loadstring(game:HttpGet('raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

-- JANELA PRINCIPAL (ABRE DIRETO)
local Window = OrionLib:MakeWindow({
    Name = "LoreHub Admin v2 👑", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "LoreHubAdminV2"
})

-- ABA ADMIN (UNIVERSAL / BROOKHAVEN)
local AdminTab = Window:MakeTab({
    Name = "Admin Universal",
    Icon = "rbxassetid://4483350003",
    PremiumOnly = false
})

AdminTab:AddTextbox({
    Name = "Nick do Alvo",
    Default = "",
    TextDisappear = false,
    Callback = function(Value) _G.TargetName = Value end	  
})

AdminTab:AddButton({
    Name = "Executar: Fatality Combo (R15)",
    Callback = function()
        local targetPlayer = nil
        for _, v in pairs(game.Players:GetPlayers()) do
            if string.find(string.lower(v.Name), string.lower(_G.TargetName)) or string.find(string.lower(v.DisplayName), string.lower(_G.TargetName)) then
                targetPlayer = v
                break
            end
        end

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local lp = game.Players.LocalPlayer
            local myChar = lp.Character

            -- Dash para o alvo
            myChar.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            
            -- Animação e Dano
            pcall(function()
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://3023469887"
                local loadAnim = myChar.Humanoid:LoadAnimation(anim)
                loadAnim:Play()
            end)

            task.spawn(function()
                for i = 1, 10 do
                    if targetPlayer.Character:FindFirstChild("Humanoid") then
                        targetPlayer.Character.Humanoid.Health = targetPlayer.Character.Humanoid.Health - 10
                    end
                    task.wait(0.1)
                end
            end)
            
            OrionLib:MakeNotification({Name = "LoreHub", Content = "Combo aplicado no alvo!", Time = 3})
        end
    end    
})

-- ABA OTIMIZAÇÃO (FPS BOOSTER 200)
local BoostTab = Window:MakeTab({
    Name = "Otimização",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

BoostTab:AddButton({
    Name = "FPS Booster (Focar 200 FPS)",
    Callback = function()
        -- Destrava o FPS no executor
        if setfpscap then setfpscap(200) end
        
        -- Limpeza de Gráficos Pesados (Remoção de Lag)
        for i, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
        
        OrionLib:MakeNotification({
            Name = "Booster Ativado",
            Content = "O rbx vai rodar liso agora!",
            Time = 3
        })
    end    
})

OrionLib:Init()
