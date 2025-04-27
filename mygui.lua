local GRABKNIFE_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/grab-knife/refs/heads/main/Grab%20V4.txt"
local AK47_URL = "https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/ak47"
local METALPIPE_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/metal-pip/refs/heads/main/metal%20pipe"
local SONIC_URL = "https://pastebin.com/raw/uacVtsWe"
local BACKDOORSCANNER_URL = "https://raw.githubusercontent.com/TempUserIdk18/robloxscripts/refs/heads/main/PogsBackdoor.lua"
local SGLITCHER_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/SCPECTRUMGLITCHER/refs/heads/main/SpectrumG%20(1).txt"
local C00LGUI_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/c00lgui/refs/heads/main/c00lguiv3rx.lua.txt"
local SINDRAGON_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/Fe_sin_dragon_music_customizado_final.lua"
local HANDRAVAGE_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/sin-dragon/refs/heads/main/hwnwvdFy"
local ENDERCONVERTED_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/ender-convert/refs/heads/main/ENDER%20CONVERTED.lua"
local JOHNDOE_URL = "https://raw.githubusercontent.com/nicolasbarbosa323/john-doe/refs/heads/main/john%20doe%20completed.lua"

local musicSound = nil

local function createGUI()
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "GalaxyFunGui"

    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 500, 0, 500)
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
    title.Text = "Galaxy Impact GUI"
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

    -- Função para criar botões de script
    local function createButton(text, posY, callback)
        local btn = Instance.new("TextButton", scrolling)
        btn.Size = UDim2.new(1, -20, 0, 30)
        btn.Position = UDim2.new(0, 10, 0, posY)
        btn.Font = Enum.Font.SourceSans
        btn.TextSize = 16
        btn.Text = text
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.MouseButton1Click:Connect(callback)
        return posY + 35
    end

    -- Adicionando Botões de Scripts
    local y = 130
    y = createButton("Grab Knife V4", y, function() loadstring(game:HttpGet(GRABKNIFE_URL))() end)
    y = createButton("AK-47", y, function() loadstring(game:HttpGet(AK47_URL))() end)
    y = createButton("Metal Pipe", y, function() loadstring(game:HttpGet(METALPIPE_URL))() end)
    y = createButton("Sonic", y, function() loadstring(game:HttpGet(SONIC_URL))() end)
    y = createButton("Backdoor Scanner", y, function() loadstring(game:HttpGet(BACKDOORSCANNER_URL))() end)
    y = createButton("Sglitcher", y, function() loadstring(game:HttpGet(SGLITCHER_URL))() end)
    y = createButton("c00lgui", y, function() loadstring(game:HttpGet(C00LGUI_URL))() end)
    y = createButton("sin dragon", y, function() loadstring(game:HttpGet(SINDRAGON_URL))() end)
    y = createButton("Hand Ravage", y, function() loadstring(game:HttpGet(HANDRAVAGE_URL))() end)
    y = createButton("Ender Converted", y, function() loadstring(game:HttpGet(ENDERCONVERTED_URL))() end)
    y = createButton("John Doe", y, function() loadstring(game:HttpGet(JOHNDOE_URL))() end)

    -- Função Morrer
    y = createButton("Executor", y, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/nicolasbarbosa323/custom-executor/refs/heads/main/executor))()

    -- Função Fix
    y = createButton("Fix", y, function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nicolasbarbosa323/fix-game/refs/heads/main/fix.lua"))()
    end)

    -- Função Reset
    y = createButton("Reset", y, function()
        local player = game.Players.LocalPlayer
        player:LoadCharacter() -- Resetar o personagem
    end)

    -- Função Minimizar
    minimize.MouseButton1Click:Connect(function()
        if isMinimized then
            mainFrame.Size = originalSize
            isMinimized = false
        else
            mainFrame.Size = UDim2.new(0, 200, 0, 30)
            isMinimized = true
        end
    end)

    -- Função Maximizar
    maximize.MouseButton1Click:Connect(function()
        mainFrame.Size = originalSize
        isMinimized = false
    end)

    -- Função Fechar
    close.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end

createGUI()

