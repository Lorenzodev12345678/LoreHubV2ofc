local OrionLib = loadstring(game:HttpGet('raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local ChaveCorreta = "LORE_RLK_2025" -- Sua chave aqui
local ChaveInserida = ""

local KeyWindow = OrionLib:MakeWindow({Name = "LoreHub v2 | Sistema de Key", HidePremium = false, SaveConfig = false})

local KeyTab = KeyWindow:MakeTab({Name = "Verificação", Icon = "rbxassetid://4483345998"})

KeyTab:AddTextbox({
    Name = "Insira a Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value) ChaveInserida = Value end	  
})

KeyTab:AddButton({
    Name = "Verificar",
    Callback = function()
        if ChaveInserida == ChaveCorreta then
            OrionLib:MakeNotification({Name = "Sucesso", Content = "Carregando Script...", Time = 2})
            KeyWindow:Destroy()
            -- AQUI ESTÁ O SEGREDO: Ele puxa o seu main.lua se a key estiver certa
            loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/refs/heads/main/main.lua'))()
        else
            OrionLib:MakeNotification({Name = "Erro", Content = "Chave errada, man!", Time = 3})
        end
    end    
})
