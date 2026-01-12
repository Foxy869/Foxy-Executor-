local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7Lib/UI-Libraries/main/Venyx/Source.lua"))()
local Window = Library.new("FOXY V1", 5013109572)

-- ON CRÉE LES ONGLETS
local Tab1 = Window:addPage("Principal", 5012544693)
local Section1 = Tab1:addSection("Mouvement")

-- BOUTON VITESSE
Section1:addButton("Vitesse (Speed)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
    print("Vitesse activée !")
end)

-- BOUTON SAUT
Section1:addButton("Super Saut", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
    print("Super Saut activé !")
end)

-- NOTIFICATION DE BIENVENUE
Library:Notify("FOXY V1", "Script chargé avec succès !", 5012544693)
