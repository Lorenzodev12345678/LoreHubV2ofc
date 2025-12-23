-- [[ LoreHub v2 - Loader Oficial ]]
-- [[ Desenvolvido por Lorenzodev12345678 ]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("LoreHub v2 | Verificação", "Midnight")

-- Criando a aba de Login
local Tab = Window:NewTab("Sistema de Key")
local Section = Tab:NewSection("Insira sua Key de RLK")

_G.Key = "LORE_RLK_2025"
local KeyInput = ""

Section:NewTextbox("Key", "Digite a key oficial aqui", function(txt)
    KeyInput = txt
end)

Section:NewButton("Verificar Key", "Libera o acesso ao script", function()
    if KeyInput == _G.Key then
        -- Aviso de sucesso
        print("LoreHub: Key correta!")
        
        -- Fecha a janela de verificação para abrir o script principal
        Library:ToggleLib() 
        
        -- PUXA O SEU MAIN.LUA ATUALIZADO (KAVO UI)
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lorenzodev12345678/LoreHubV2ofc/main/main.lua'))()
    else
        print("LoreHub: Key errada, man!")
    end
end)

Section:NewButton("Copiar Link da Key", "Pega o link para gerar a key", function()
    setclipboard("https://scriptblox.com/script/Universal-Script-LoreahubV2-77644")
    -- Como a Kavo não tem notificação nativa igual a Orion, usamos o print ou o console
end)
