
-- 🎣 AUTO FISH & SHOP 

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

-- Variables de Estado
local Config = {
    AutoFish = false,
    AutoRegular = false,
    AutoUltimate = false
}

--  INTERFAZ 
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AutoFarmStandalone"
ScreenGui.ResetOnSpawn = false

local success = pcall(function() ScreenGui.Parent = CoreGui end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 240, 0, 175) -- Más grande para que quepan los botones
MainFrame.Position = UDim2.new(0.5, -120, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(50, 255, 140)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.Text = "🎣 FARM & SHOP 🛒"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Función creadora de botones para ahorrar espacio
local function CreateToggle(yPos, text, configKey)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 30)
    Label.Position = UDim2.new(0, 15, 0, yPos)
    Label.Text = text
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 12
    Label.TextColor3 = Color3.fromRGB(200, 200, 200)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.Parent = MainFrame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 50, 0, 24)
    ToggleBtn.Position = UDim2.new(1, -65, 0, yPos + 3)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    ToggleBtn.Text = "OFF"
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.TextSize = 11
    ToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    ToggleBtn.Parent = MainFrame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(1, 0)
    BtnCorner.Parent = ToggleBtn

    ToggleBtn.MouseButton1Click:Connect(function()
        Config[configKey] = not Config[configKey]
        
        if Config[configKey] then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 140)
            ToggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleBtn.Text = "ON"
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
            ToggleBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            ToggleBtn.Text = "OFF"
        end
    end)
end

-- 🔘 AGREGAMOS LOS 3 BOTONES
CreateToggle(45, "Auto Pescar", "AutoFish")
CreateToggle(85, "Comprar Regular", "AutoRegular")
CreateToggle(125, "Comprar Ultimate", "AutoUltimate")


--  MOTOR  AUTO PESCA 
task.spawn(function()
    while task.wait(2.5) do
        if Config.AutoFish then
            pcall(function()
                local Remotes = ReplicatedStorage:WaitForChild("Remotes")
                Remotes:WaitForChild("FishingRE"):FireServer("StartFishing")
                task.wait(1) 
                Remotes:WaitForChild("QTERE"):FireServer("Success")
            end)
        end
    end
end)

--AUTO COMPRA
task.spawn(function()
    while task.wait(30) do 
        if Config.AutoRegular then
            pcall(function()
                
                ReplicatedStorage:WaitForChild("MopShopEvent"):FireServer("BUY", "WormtecRegular", 10)
                print("🛒 Comprados 10 WormtecRegular")
            end)
        end
        
        task.wait(1.5) 
        
        if Config.AutoUltimate then
            pcall(function()
                ReplicatedStorage:WaitForChild("MopShopEvent"):FireServer("BUY", "WormtecUltimate", 10)
                print("🛒 Comprados 10 WormtecUltimate")
            end)
        end
    end
end)
