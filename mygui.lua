local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local SGLITCHER_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/SCPECTRUMGLITCHER/refs/heads/main/SpectrumG%20(1).txt"
local C00LGUI_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/c00lgui/refs/heads/main/c00lguiv3rx.lua.txt"
local SINDRAGON_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/Fe_sin_dragon_music.lua"
local HANDRAVAGE_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/hwnwvdFy"
local ENDERCONVERTED_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/ender-convert/refs/heads/main/ENDER%20CONVERTED.lua"
local JOHNDOE_URL = "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/John%20Doe.lua"

local musicSound = nil

local function createGUI()
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "GalaxyFunGui"

    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 500, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
    mainFrame.Active = true
    mainFrame.Draggable = true

    local isMinimized = false
    local originalSize = mainFrame.Size

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, -90, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    title.BorderSizePixel = 0
    title.Text = "GUI de Galaxy Impact (CLIENT REPLICATION)"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18

    local minimize = Instance.new("TextButton", mainFrame)
    minimize.Size = UDim2.new(0, 30, 0, 30)
    minimize.Position = UDim2.new(1, -90, 0, 0)
    minimize.Text = "-"
    minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local maximize = Instance.new("TextButton", mainFrame)
    maximize.Size = UDim2.new(0, 30, 0, 30)
    maximize.Position = UDim2.new(1, -60, 0, 0)
    maximize.Text = "◻"
    maximize.TextColor3 = Color3.fromRGB(255, 255, 255)
    maximize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local close = Instance.new("TextButton", mainFrame)
    close.Size = UDim2.new(0, 30, 0, 30)
    close.Position = UDim2.new(1, -30, 0, 0)
    close.Text = "X"
    close.TextColor3 = Color3.fromRGB(255, 255, 255)
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local scrolling = Instance.new("ScrollingFrame", mainFrame)
    scrolling.Size = UDim2.new(1, 0, 1, -30)
    scrolling.Position = UDim2.new(0, 0, 0, 30)
    scrolling.CanvasSize = UDim2.new(0, 0, 0, 600)
    scrolling.ScrollBarThickness = 8
    scrolling.BackgroundTransparency = 1

    local function styleButton(btn)
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        btn.BorderSizePixel = 1
        btn.BorderColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end)
    end

    local function createButton(text, posY, callback)
        local btn = Instance.new("TextButton", scrolling)
        btn.Size = UDim2.new(1, -20, 0, 30)
        btn.Position = UDim2.new(0, 10, 0, posY)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 16
        btn.Text = text
        styleButton(btn)
        btn.MouseButton1Click:Connect(callback)
        return posY + 35
    end

    local y = 0
    y = createButton("Sglitcher", y, function() loadstring(game:HttpGet(SGLITCHER_URL))() end)
    y = createButton("c00lgui", y, function() loadstring(game:HttpGet(C00LGUI_URL))() end)
    y = createButton("sin dragon", y, function() loadstring(game:HttpGet(SINDRAGON_URL))() end)
    y = createButton("Hand Ravage", y, function() loadstring(game:HttpGet(HANDRAVAGE_URL))() end)
    y = createButton("Ender Converted", y, function() loadstring(game:HttpGet(ENDERCONVERTED_URL))() end)

    -- Adicionando botão de "Morrer"
    y = createButton("Morrer", y, function()
        if musicSound then
            musicSound:Stop()  -- Parar a música quando o jogador morrer
        end
        LocalPlayer.Character:BreakJoints()
    end)

    -- Adicionando botão de "Fix"
    y = createButton("Fix", y, function()
        -- Função de Fix pode ser definida aqui, por exemplo, corrigir alguma falha ou erro no jogo
        -- Exemplo de fix: restaurar a saúde do jogador
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            humanoid.Health = humanoid.MaxHealth
        end
    end)

    -- Adicionando botão de "John Doe"
    y = createButton("John Doe", y, function()
        -- Tocar a música com ID 1848354536 no volume 0.7 em loop
        musicSound = Instance.new("Sound")
        musicSound.SoundId = "rbxassetid://1848354536"
        musicSound.Volume = 2
        musicSound.Looped = true
        musicSound.Parent = game.Workspace
        musicSound:Play()

        -- Executar o script John Doe
        loadstring(game:HttpGet(JOHNDOE_URL))()
    end)

    -- Funções de minimizar, maximizar e fechar
    minimize.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            scrolling.Visible = false
            mainFrame.Size = UDim2.new(0, 500, 0, 30)
        else
            scrolling.Visible = true
            mainFrame.Size = originalSize
        end
    end)

    maximize.MouseButton1Click:Connect(function()
        if mainFrame.Size == UDim2.new(1, 0, 1, 0) then
            mainFrame.Size = originalSize
            mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
        else
            mainFrame.Size = UDim2.new(1, 0, 1, 0)
            mainFrame.Position = UDim2.new(0, 0, 0, 0)
        end
    end)

    close.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end

createGUI()
