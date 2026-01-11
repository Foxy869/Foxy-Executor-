
local FoxyGui = Instance.new("ScreenGui")
FoxyGui.Name = "FoxyExecutorV1"
FoxyGui.Parent = game:GetService("CoreGui")

-- FENÊTRE PRINCIPALE
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 550, 0, 320)
Main.Position = UDim2.new(0.5, -275, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = FoxyGui

-- Coins arrondis
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 10)
Corner.Parent = Main

-- BARRE DE TITRE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(45, 0, 0)
Title.Text = "  🦊 FOXY V1 - EXECUTOR"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main
local TitleCorner = Instance.new("UICorner")
TitleCorner.Parent = Title

-- ÉDITEUR DE TEXTE
local Editor = Instance.new("TextBox")
Editor.Size = UDim2.new(0, 380, 0, 200)
Editor.Position = UDim2.new(0, 155, 0, 50)
Editor.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Editor.TextColor3 = Color3.fromRGB(200, 200, 200)
Editor.Text = "-- Bienvenue dans Foxy V1\n-- Collez votre script ici..."
Editor.ClearTextOnFocus = false
Editor.MultiLine = true
Editor.TextYAlignment = Enum.TextYAlignment.Top
Editor.Font = Enum.Font.Code
Editor.TextSize = 14
Editor.Parent = Main

--- BOUTONS DE CONTRÔLE (Execute, Clear, Paste) ---

local function createControlBtn(name, pos, color, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 110, 0, 35)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.white
    btn.Font = Enum.Font.GothamBold
    btn.Parent = Main
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 6)
    bc.Parent = btn
    btn.MouseButton1Click:Connect(callback)
end

-- Execute
createControlBtn("EXECUTE", UDim2.new(0, 155, 0, 265), Color3.fromRGB(200, 0, 0), function()
    local func, err = loadstring(Editor.Text)
    if func then func() else warn("Erreur: "..err) end
end)

-- Clear
createControlBtn("CLEAR", UDim2.new(0, 285, 0, 265), Color3.fromRGB(50, 50, 50), function()
    Editor.Text = ""
end)

-- Paste (Simulation car Roblox limite le clipboard)
createControlBtn("PASTE", UDim2.new(0, 415, 0, 265), Color3.fromRGB(50, 50, 50), function()
    print("Paste cliqué - Utilisez Ctrl+V")
end)

--- SCRIPT HUB (Barre latérale) ---

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(0, 130, 0, 250)
Scroll.Position = UDim2.new(0, 10, 0, 50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 1.5, 0)
Scroll.ScrollBarThickness = 4
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Parent = Scroll
Layout.Padding = UDim.new(0, 5)

local function addHubBtn(text, loadstr)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -10, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = text
    b.TextColor3 = Color3.white
    b.Font = Enum.Font.Gotham
    b.TextSize = 12
    b.Parent = Scroll
    local ic = Instance.new("UICorner")
    ic.Parent = b
    
    b.MouseButton1Click:Connect(function()
        Editor.Text = "-- Loading " .. text .. "..."
        loadstring(game:HttpGet(loadstr))()
    end)
end)
