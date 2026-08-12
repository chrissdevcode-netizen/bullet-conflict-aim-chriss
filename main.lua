-- CHRISS HUB | KEY SYSTEM

local HttpService = game:GetService("HttpService")
local RbxAnalytics = game:GetService("RbxAnalyticsService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")


local DatabaseURL = "https://chrisshub-database-default-rtdb.firebaseio.com/"

-- Peticiones HTTP
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if not httprequest then
    game.Players.LocalPlayer:Kick("Tu ejecutor no soporta peticiones HTTP avanzadas.")
    return
end

-- Obtener HWID
local function GetHWID()
    local success, result = pcall(function() return RbxAnalytics:GetClientId() end)
    return success and result or tostring(game.Players.LocalPlayer.UserId .. "-FALLBACK")
end
local MyHWID = GetHWID()

-- 1. Efecto de Desenfoque Cinemático
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 0
BlurEffect.Parent = Lighting
TweenService:Create(BlurEffect, TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = 20}):Play()


-- INTERFAZ NEON🔥
local AuthGui = Instance.new("ScreenGui")
AuthGui.Name = "ChrissAuthSystemPremium"
AuthGui.ResetOnSpawn = false
AuthGui.Parent = CoreGui

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.new(1, 0, 1, 0)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 1
Overlay.BorderSizePixel = 0
Overlay.Parent = AuthGui
TweenService:Create(Overlay, TweenInfo.new(0.5), {BackgroundTransparency = 0.6}):Play()

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 0, 0, 0) 
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 13, 17)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = AuthGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(160, 80, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 1
UIStroke.Parent = MainFrame

local Glow = Instance.new("ImageLabel")
Glow.Size = UDim2.new(1, 60, 1, 60)
Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
Glow.AnchorPoint = Vector2.new(0.5, 0.5)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://5028857084"
Glow.ImageColor3 = Color3.fromRGB(160, 80, 255)
Glow.ImageTransparency = 1
Glow.ZIndex = 0
Glow.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 15)
Title.Text = "⚡ CHRISS HUB ⚡"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.TextTransparency = 1
Title.Parent = MainFrame

--  BOTÓN DE CERRAR 
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.Text = "×"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
CloseBtn.BackgroundTransparency = 1
CloseBtn.TextTransparency = 1
CloseBtn.Parent = MainFrame

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 80, 80)}):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)

CloseBtn.MouseButton1Click:Connect(function()
    -- Animación de cierre y destrucción
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(Overlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(BlurEffect, TweenInfo.new(0.5), {Size = 0}):Play()
    task.wait(0.5)
    AuthGui:Destroy()
    BlurEffect:Destroy()
end)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 48)
KeyInput.Position = UDim2.new(0.5, 0, 0.42, 0)
KeyInput.AnchorPoint = Vector2.new(0.5, 0.5)
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Ingresa tu Licencia VIP..."
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 13
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextTransparency = 1
KeyInput.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(60, 65, 80)
InputStroke.Thickness = 1.5
InputStroke.Parent = KeyInput

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0.5, 0, 0.62, 0)
StatusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
StatusLabel.Text = "Estado: Esperando validación"
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextSize = 11
StatusLabel.TextColor3 = Color3.fromRGB(120, 125, 140)
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextTransparency = 1
StatusLabel.Parent = MainFrame

local CheckBtn = Instance.new("TextButton")
CheckBtn.Size = UDim2.new(0.85, 0, 0, 45)
CheckBtn.Position = UDim2.new(0.5, 0, 0.82, 0)
CheckBtn.AnchorPoint = Vector2.new(0.5, 0.5)
CheckBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 255)
CheckBtn.Text = "INICIAR SESIÓN"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextSize = 14
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextTransparency = 1
CheckBtn.AutoButtonColor = false
CheckBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = CheckBtn

-- Animaciones de Entrada
local OpenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
TweenService:Create(MainFrame, OpenInfo, {Size = UDim2.new(0, 380, 0, 260)}):Play()
TweenService:Create(UIStroke, TweenInfo.new(0.8), {Transparency = 0}):Play()
TweenService:Create(Glow, TweenInfo.new(1), {ImageTransparency = 0.7}):Play()

task.wait(0.3)
local FadeInfo = TweenInfo.new(0.4)
TweenService:Create(Title, FadeInfo, {TextTransparency = 0}):Play()
TweenService:Create(CloseBtn, FadeInfo, {TextTransparency = 0}):Play()
TweenService:Create(KeyInput, FadeInfo, {TextTransparency = 0}):Play()
TweenService:Create(StatusLabel, FadeInfo, {TextTransparency = 0}):Play()
TweenService:Create(CheckBtn, FadeInfo, {TextTransparency = 0}):Play()

-- Efectos del Input y Botón
KeyInput.Focused:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(160, 80, 255)}):Play()
end)
KeyInput.FocusLost:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(60, 65, 80)}):Play()
end)

CheckBtn.MouseEnter:Connect(function()
    TweenService:Create(CheckBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 110, 255)}):Play()
end)
CheckBtn.MouseLeave:Connect(function()
    TweenService:Create(CheckBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(160, 80, 255)}):Play()
end)
CheckBtn.MouseButton1Down:Connect(function()
    TweenService:Create(CheckBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.82, 0, 0, 42)}):Play()
end)
CheckBtn.MouseButton1Up:Connect(function()
    TweenService:Create(CheckBtn, TweenInfo.new(0.1), {Size = UDim2.new(0.85, 0, 0, 45)}):Play()
end)


-- LÓGICA DE SERVIDOR Y VALIDACIÓN 
local isChecking = false

local function IniciarValidacion()
    if isChecking then return end
    local userKey = KeyInput.Text:gsub("%s+", "")
    
    if userKey == "" then
        StatusLabel.Text = "❌ Campo vacío, ingresa tu llave."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        
        local originalPos = MainFrame.Position
        for i = 1, 4 do
            MainFrame.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, 0)
            task.wait(0.05)
        end
        MainFrame.Position = originalPos
        return
    end

    isChecking = true
    StatusLabel.Text = "⏳ Conectando con el servidor..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    CheckBtn.Text = "VERIFICANDO..."
    
    local success, err = pcall(function()
        -- 1. Checar mantenimiento
        local sysReq = httprequest({Url = DatabaseURL .. "system_status.json", Method = "GET"})
        local sysStatus = HttpService:JSONDecode(sysReq.Body)

        -- 2. Descargar llave
        local keyReq = httprequest({Url = DatabaseURL .. "keys/" .. userKey .. ".json", Method = "GET"})
        local keyData = HttpService:JSONDecode(keyReq.Body)

        -- 3. Validaciones
        if not keyData or keyData == "null" then
            StatusLabel.Text = "❌ Llave inválida o eliminada."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            CheckBtn.Text = "INICIAR SESIÓN"
            isChecking = false
            return
        end

        if keyData.status == "paused" or (sysStatus and sysStatus.vip_paused and keyData.type == "VIP") then
            StatusLabel.Text = "⏸️ Sistema en Mantenimiento."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
            CheckBtn.Text = "INICIAR SESIÓN"
            isChecking = false
            return
        end

        if os.time() > keyData.expires_at then
            StatusLabel.Text = "🔴 Tu llave ha expirado."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
            CheckBtn.Text = "INICIAR SESIÓN"
            isChecking = false
            return
        end

        -- 4. HWID
        local used_hwids = keyData.used_hwids or {}
        local hwidEncontrado = false

        for _, v in pairs(used_hwids) do
            if v == MyHWID then
                hwidEncontrado = true
                break
            end
        end

        if not hwidEncontrado then
            if #used_hwids < keyData.hwid_limit then
                table.insert(used_hwids, MyHWID)
                local updateReq = httprequest({
                    Url = DatabaseURL .. "keys/" .. userKey .. "/used_hwids.json",
                    Method = "PUT",
                    Body = HttpService:JSONEncode(used_hwids),
                    Headers = {["Content-Type"] = "application/json"}
                })
                
                if updateReq.StatusCode ~= 200 then
                    StatusLabel.Text = "❌ Error al enlazar PC."
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                    CheckBtn.Text = "INICIAR SESIÓN"
                    isChecking = false
                    return
                end
            else
                StatusLabel.Text = "❌ Límite de HWID alcanzado."
                StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
                CheckBtn.Text = "INICIAR SESIÓN"
                isChecking = false
                return
            end
        end

        -- 5. ACCESO
        StatusLabel.Text = "✅ ¡Acceso Concedido! Cargando sistema..."
        StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
        CheckBtn.BackgroundColor3 = Color3.fromRGB(80, 255, 120)
        CheckBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        CheckBtn.Text = "ACCESO PERMITIDO"
        
        task.wait(1)
        TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(BlurEffect, TweenInfo.new(0.5), {Size = 0}):Play()
        
        task.wait(0.5)
        AuthGui:Destroy()
        BlurEffect:Destroy()
        
        -- Ejecuta tu script
        IniciarScriptPrincipal()
    end)

    if not success then
        StatusLabel.Text = "❌ Error de conexión."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        CheckBtn.Text = "INICIAR SESIÓN"
        isChecking = false
    end
end

CheckBtn.MouseButton1Click:Connect(IniciarValidacion)



function IniciarScriptPrincipal()





local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
if not Character then
    LocalPlayer.CharacterAdded:Wait()
    Character = LocalPlayer.Character
end

LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
end)
local Camera = workspace.CurrentCamera

-- Utilidad
local function GetSafeCharacter()
    local char = LocalPlayer.Character
    if not char then return nil, nil, nil end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    return char, hum, root
end

-- Dibujo del FOV
local FOVCircle
pcall(function()
    FOVCircle = Drawing.new("Circle")
    FOVCircle.Visible = false
    FOVCircle.Thickness = 1.5
    FOVCircle.Color = Color3.fromRGB(255, 255, 255)
    FOVCircle.Filled = false
end)

-- Configuración General
local Config = {
    -- Jugador
    SpeedValue = 16, 
    SpeedEnabled = false, 
    InfJump = false, 
    Noclip = false, 
    Fly = false, 
    SpinBot = false,      
    SpinSpeed = 30,       
    HideName = false,     
    
    -- Combate
    AimbotEnabled = false,
    SilentAim = false,
    FOVEnabled = false, 
    FOVRadius = 100,
    WallCheck = true,
    TargetPart ="HumanoidRootPart",
    
    -- Visuales 
    ESPBox = false, 
    ESPName = false, 
    ESPDist = false, 
    ESPHealth = false, 
    Traces = false,
    ESPGun = false, 
    ESPGunDist = false,
    ESPDroppedGuns = false,
    
    -- Mis
    LockUI = false,
    DeathPos = nil,
    AutoTPDeath = false 
}

-- Colores de la interfaz
local Theme = {
    Main = Color3.fromRGB(160, 80, 255), 
    Combat = Color3.fromRGB(160, 80, 255),
    Visuals = Color3.fromRGB(160, 80, 255),
    Misc = Color3.fromRGB(160, 80, 255)
}

-- Memoria de la última pestaña abierta
local CurrentTab = "Main"
 
-- Lógica para arrastrar ventanas fluidamente
local function MakeSmoothDrag(frame, dragHandle)
    local dragging = false
    local dragInput, dragStart, startPos
    local targetPos = frame.Position

    dragHandle.InputBegan:Connect(function(input)
        if Config.LockUI then return end 
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    dragHandle.InputChanged:Connect(function(input)
        if not Config.LockUI and dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and dragInput and not Config.LockUI then
            local delta = dragInput.Position - dragStart
            targetPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
        frame.Position = frame.Position:Lerp(targetPos, 0.15)
    end)
end

-- Contenedor Principal de la UI
local ScreenGui;
local success, err = pcall(function()
    ScreenGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules") 
        and Instance.new("ScreenGui", game:GetService("CoreGui"):FindFirstChild("RobloxGui"))
        or Instance.new("ScreenGui", game:GetService("CoreGui"))
end)
if not success or not ScreenGui then
    ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
end
ScreenGui.Name = "ViceCityV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

-- Menú Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 460, 0, 270)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -135)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 15, 18)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true 
MainFrame.Visible = false -- Inicia cerrado por defecto
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Main
MainStroke.Thickness = 1.6
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 14)
TopCorner.Parent = TopBar

local TopFix = Instance.new("Frame")
TopFix.Size = UDim2.new(1, 0, 0, 12)
TopFix.Position = UDim2.new(0, 0, 1, -12)
TopFix.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
TopFix.BorderSizePixel = 0
TopFix.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 16, 0, 0)
Title.Text = "CONFLICT BULLET👾"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -38, 0, 5)
CloseBtn.Text = "×" 
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 24
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Parent = TopBar

MakeSmoothDrag(MainFrame, TopBar)

local TabPanel = Instance.new("Frame")
TabPanel.Size = UDim2.new(0, 110, 1, -42)
TabPanel.Position = UDim2.new(0, 0, 0, 42)
TabPanel.BackgroundColor3 = Color3.fromRGB(17, 18, 22)
TabPanel.BorderSizePixel = 0
TabPanel.Parent = MainFrame

local TabCorner = Instance.new("UICorner")
TabCorner.CornerRadius = UDim.new(0, 14)
TabCorner.Parent = TabPanel

local TabFixLeft = Instance.new("Frame")
TabFixLeft.Size = UDim2.new(1, 0, 0, 15)
TabFixLeft.Position = UDim2.new(0, 0, 0, 0)
TabFixLeft.BackgroundColor3 = Color3.fromRGB(17, 18, 22)
TabFixLeft.BorderSizePixel = 0
TabFixLeft.ZIndex = 2
TabFixLeft.Parent = TabPanel

local TabList = Instance.new("UIListLayout")
TabList.Padding = UDim.new(0, 4)
TabList.Parent = TabPanel

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingTop = UDim.new(0, 10)
TabPadding.Parent = TabPanel

local PageContainer = Instance.new("Frame")
PageContainer.Size = UDim2.new(1, -110, 1, -42)
PageContainer.Position = UDim2.new(0, 110, 0, 42)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

-- Botón Flotante para abrir el menú
local OpenBtnFrame = Instance.new("Frame")
OpenBtnFrame.Name = "OpenBtnFrame"
OpenBtnFrame.Size = UDim2.new(0, 56, 0, 56) 
OpenBtnFrame.Position = UDim2.new(0.03, 0, 0.5, -28) 
OpenBtnFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
OpenBtnFrame.Visible = true -- Inicia visible por defecto
OpenBtnFrame.ClipsDescendants = true
OpenBtnFrame.Parent = ScreenGui

local OpenBtnCorner = Instance.new("UICorner")
OpenBtnCorner.CornerRadius = UDim.new(1, 0)
OpenBtnCorner.Parent = OpenBtnFrame

local OpenStroke = Instance.new("UIStroke")
OpenStroke.Color = Theme.Main
OpenStroke.Thickness = 1.8
OpenStroke.Parent = OpenBtnFrame

local OpenBtn = Instance.new("ImageButton")
OpenBtn.Name = "OpenButton"
OpenBtn.Size = UDim2.new(1, -6, 1, -6)
OpenBtn.Position = UDim2.new(0, 3, 0, 3)
OpenBtn.Image = "rbxassetid://122763495406604"
OpenBtn.BackgroundTransparency = 1
OpenBtn.AutoButtonColor = true
OpenBtn.Active = true
OpenBtn.Parent = OpenBtnFrame

local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(1, 0)
ImageCorner.Parent = OpenBtn

MakeSmoothDrag(OpenBtnFrame, OpenBtn)

RunService.RenderStepped:Connect(function(dt)
    if OpenBtnFrame.Visible then
        OpenBtn.Rotation = OpenBtn.Rotation + (dt * 120)
    end
end)

local Pages = {}
local TabButtons = {}
local isTweening = false

-- Lógica para cerrar el menú
CloseBtn.MouseButton1Click:Connect(function()
    if isTweening then return end
    isTweening = true
    
    local closeInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    
    local mainClose = TweenService:Create(MainFrame, closeInfo, {
        Size = UDim2.new(0, 430, 0, 250),
        BackgroundTransparency = 1
    })
    
    local strokeClose = TweenService:Create(MainStroke, closeInfo, {
        Transparency = 1
    })
    
    pcall(function()
        TweenService:Create(TopBar, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        TweenService:Create(Title, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
        TweenService:Create(CloseBtn, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
        TweenService:Create(TabPanel, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
        
        for _, p in pairs(Pages) do p.Visible = false end
        for _, btn in pairs(TabButtons) do
            TweenService:Create(btn, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
        end
    end)
    
    mainClose:Play()
    strokeClose:Play()
    
    mainClose.Completed:Connect(function()
        MainFrame.Visible = false
        OpenBtnFrame.Visible = true
        OpenBtnFrame.Size = UDim2.new(0, 56, 0, 56)
        OpenBtn.Size = UDim2.new(0, 0, 0, 0)
        
        local openAnim = TweenService:Create(OpenBtn, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, -6, 1, -6)
        })
        openAnim:Play()
        openAnim.Completed:Connect(function() isTweening = false end)
    end)
end)

-- Lógica para abrir el menú (con memoria de pestaña)
OpenBtn.MouseButton1Click:Connect(function()
    if isTweening then return end
    isTweening = true
    
    local hideTween = TweenService:Create(OpenBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0)
    })
    hideTween:Play()
    
    hideTween.Completed:Connect(function()
        OpenBtnFrame.Visible = false
        
        MainFrame.BackgroundTransparency = 0
        MainStroke.Transparency = 0
        pcall(function()
            TopBar.BackgroundTransparency = 0
            Title.TextTransparency = 0
            CloseBtn.TextTransparency = 0
            TabPanel.BackgroundTransparency = 0
            for _, btn in pairs(TabButtons) do
                TweenService:Create(btn, TweenInfo.new(0.1), {TextTransparency = 0}):Play()
            end
        end)
        
        -- Abre la última pestaña registrada
        if Pages[CurrentTab] then
            Pages[CurrentTab].Visible = true
        end
        
        MainFrame.Size = UDim2.new(0, 10, 0, 10) 
        MainFrame.BackgroundTransparency = 1
        MainStroke.Transparency = 1
        MainFrame.Visible = true
        
        local openInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        
        local mainOpen = TweenService:Create(MainFrame, openInfo, {
            Size = UDim2.new(0, 460, 0, 270),
            BackgroundTransparency = 0
        })
        
        local strokeOpen = TweenService:Create(MainStroke, openInfo, {
            Transparency = 0
        })
        
        mainOpen:Play()
        strokeOpen:Play()
        mainOpen.Completed:Connect(function() isTweening = false end)
    end)
end)

-- Sistema de creación de elementos UI
local function CreateTab(name, sectionColor)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 32)
    TabBtn.Text = name:upper()
    TabBtn.Font = Enum.Font.GothamBold
    TabBtn.TextSize = 11
    TabBtn.TextColor3 = Color3.fromRGB(100, 105, 115)
    TabBtn.BackgroundTransparency = 1
    TabBtn.Parent = TabPanel

    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 3
    Page.ScrollBarImageColor3 = sectionColor
    Page.Parent = PageContainer

    local PageList = Instance.new("UIListLayout")
    PageList.Padding = UDim.new(0, 6)
    PageList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Parent = Page

    local PagePad = Instance.new("UIPadding")
    PagePad.PaddingTop = UDim.new(0, 10)
    PagePad.PaddingBottom = UDim.new(0, 10)
    PagePad.Parent = Page
    
    PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 20)
    end)

    TabBtn.MouseButton1Click:Connect(function()
        CurrentTab = name -- Guarda la pestaña actual
        for n, p in pairs(Pages) do p.Visible = false end
        for btnName, btnObj in pairs(TabButtons) do 
            TweenService:Create(btnObj, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(100, 105, 115)}):Play()
        end
        Page.Visible = true
        TweenService:Create(MainStroke, TweenInfo.new(0.25), {Color = sectionColor}):Play()
        TweenService:Create(TabBtn, TweenInfo.new(0.2), {TextColor3 = sectionColor}):Play()
    end)

    Pages[name] = Page
    TabButtons[name] = TabBtn
    return Page
end

local function AddToggle(page, text, configKey, sectionColor)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0.92, 0, 0, 38)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = page

    local tc = Instance.new("UICorner")
    tc.CornerRadius = UDim.new(0, 6)
    tc.Parent = ToggleFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12.5
    Label.TextColor3 = Color3.fromRGB(220, 225, 235)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.Parent = ToggleFrame

    local OuterSwitch = Instance.new("TextButton")
    OuterSwitch.Size = UDim2.new(0, 38, 0, 20)
    OuterSwitch.Position = UDim2.new(1, -50, 0.5, -10)
    OuterSwitch.BackgroundColor3 = Config[configKey] and sectionColor or Color3.fromRGB(45, 48, 58)
    OuterSwitch.Text = ""
    OuterSwitch.Parent = ToggleFrame
    
    local osc = Instance.new("UICorner")
    osc.CornerRadius = UDim.new(1, 0)
    osc.Parent = OuterSwitch

    local InnerCircle = Instance.new("Frame")
    InnerCircle.Size = UDim2.new(0, 14, 0, 14)
    InnerCircle.Position = Config[configKey] and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    InnerCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    InnerCircle.BorderSizePixel = 0
    InnerCircle.Parent = OuterSwitch

    local icc = Instance.new("UICorner")
    icc.CornerRadius = UDim.new(1, 0)
    icc.Parent = InnerCircle

    OuterSwitch.MouseButton1Click:Connect(function()
        Config[configKey] = not Config[configKey]
        TweenService:Create(OuterSwitch, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {BackgroundColor3 = Config[configKey] and sectionColor or Color3.fromRGB(45, 48, 58)}):Play()
        TweenService:Create(InnerCircle, TweenInfo.new(0.25, Enum.EasingStyle.Back), {Position = Config[configKey] and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}):Play()
    end)
end

local function AddSlider(page, text, min, max, default, configKey, sectionColor)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(0.92, 0, 0, 48)
    SliderFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = page
    
    local sc = Instance.new("UICorner")
    sc.CornerRadius = UDim.new(0, 6)
    sc.Parent = SliderFrame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 0, 22)
    Label.Position = UDim2.new(0, 12, 0, 4)
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 12
    Label.TextColor3 = Color3.fromRGB(220, 225, 235)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.Parent = SliderFrame

    local ValLabel = Instance.new("TextLabel")
    ValLabel.Size = UDim2.new(0.3, 0, 0, 22)
    ValLabel.Position = UDim2.new(1, -48, 0, 4)
    ValLabel.Text = tostring(default)
    ValLabel.Font = Enum.Font.GothamBold
    ValLabel.TextSize = 12
    ValLabel.TextColor3 = sectionColor
    ValLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValLabel.BackgroundTransparency = 1
    ValLabel.Parent = SliderFrame

    local SlideBar = Instance.new("TextButton")
    SlideBar.Size = UDim2.new(1, -24, 0, 5)
    SlideBar.Position = UDim2.new(0, 12, 0.72, -2)
    SlideBar.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
    SlideBar.Text = ""
    SlideBar.Parent = SliderFrame
    
    local sbc = Instance.new("UICorner")
    sbc.CornerRadius = UDim.new(1, 0)
    sbc.Parent = SlideBar

    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
    Fill.BackgroundColor3 = sectionColor
    Fill.BorderSizePixel = 0
    Fill.Parent = SlideBar
    
    local fc = Instance.new("UICorner")
    fc.CornerRadius = UDim.new(1, 0)
    fc.Parent = Fill

    local function UpdateSlider(input)
        local percentage = math.clamp((input.Position.X - SlideBar.AbsolutePosition.X) / SlideBar.AbsoluteSize.X, 0, 1)
        TweenService:Create(Fill, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {Size = UDim2.new(percentage, 0, 1, 0)}):Play()
        local value = math.floor(min + (percentage * (max - min)))
        ValLabel.Text = tostring(value)
        Config[configKey] = value
    end

    local sliding = false
    SlideBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = true
            UpdateSlider(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            UpdateSlider(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            sliding = false
        end
    end)
end

local function AddButton(page, text, sectionColor)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.92, 0, 0, 36)
    Button.BackgroundColor3 = Color3.fromRGB(24, 27, 34)
    Button.Text = text
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 12
    Button.TextColor3 = sectionColor
    Button.Parent = page
    
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 6)
    bc.Parent = Button
    
    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(34, 38, 48)}):Play()
        end
    end)
    Button.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(24, 27, 34)}):Play()
        end
    end)
    return Button
end

-- Generación de Categorías del Menú
local TabMain = CreateTab("Main", Theme.Main)
local TabCheats = CreateTab("Player Cheats", Theme.Main) 
local TabCombat = CreateTab("Combat", Theme.Combat)
local TabVisuals = CreateTab("Visuals", Theme.Visuals)
local TabMisc = CreateTab("Misc", Theme.Misc)

-- Tarjeta de Perfil de Usuario
local ProfileCard = Instance.new("Frame")
ProfileCard.Size = UDim2.new(0.94, 0, 0, 70)
ProfileCard.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
ProfileCard.BorderSizePixel = 0
ProfileCard.Parent = TabMain

local pc_corner = Instance.new("UICorner")
pc_corner.CornerRadius = UDim.new(0, 10)
pc_corner.Parent = ProfileCard

local pc_stroke = Instance.new("UIStroke")
pc_stroke.Color = Color3.fromRGB(45, 50, 62)
pc_stroke.Thickness = 1.2
pc_stroke.Parent = ProfileCard

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 48, 0, 48)
AvatarImage.Position = UDim2.new(0, 12, 0, 11)
AvatarImage.BackgroundColor3 = Color3.fromRGB(28, 31, 38)
AvatarImage.Parent = ProfileCard

local avatar_corner = Instance.new("UICorner")
avatar_corner.CornerRadius = UDim.new(1, 0)
avatar_corner.Parent = AvatarImage

task.spawn(function()
    local content, isReady = Players:GetUserThumbnailAsync(
        LocalPlayer.UserId, 
        Enum.ThumbnailType.HeadShot, 
        Enum.ThumbnailSize.Size100x100
    )
    if isReady then AvatarImage.Image = content end
end)

local UserNameLabel = Instance.new("TextLabel")
UserNameLabel.Size = UDim2.new(1, -75, 0, 20)
UserNameLabel.Position = UDim2.new(0, 68, 0, 15)
UserNameLabel.Text = "@" .. LocalPlayer.Name
UserNameLabel.Font = Enum.Font.GothamBold
UserNameLabel.TextSize = 13
UserNameLabel.TextColor3 = Theme.Main
UserNameLabel.TextXAlignment = Enum.TextXAlignment.Left
UserNameLabel.BackgroundTransparency = 1
UserNameLabel.Parent = ProfileCard

local AccountAgeLabel = Instance.new("TextLabel")
AccountAgeLabel.Size = UDim2.new(1, -75, 0, 18)
AccountAgeLabel.Position = UDim2.new(0, 68, 0, 35)
AccountAgeLabel.Text = "📅 Cuenta: " .. tostring(LocalPlayer.AccountAge) .. " días"
AccountAgeLabel.Font = Enum.Font.Gotham
AccountAgeLabel.TextSize = 11
AccountAgeLabel.TextColor3 = Color3.fromRGB(170, 175, 185)
AccountAgeLabel.TextXAlignment = Enum.TextXAlignment.Left
AccountAgeLabel.BackgroundTransparency = 1
AccountAgeLabel.Parent = ProfileCard

-- Tarjeta de Rendimiento
local PerfCard = Instance.new("Frame")
PerfCard.Size = UDim2.new(0.94, 0, 0, 60)
PerfCard.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
PerfCard.BorderSizePixel = 0
PerfCard.Parent = TabMain

local perf_corner = Instance.new("UICorner")
perf_corner.CornerRadius = UDim.new(0, 10)
perf_corner.Parent = PerfCard

local perf_stroke = Instance.new("UIStroke")
perf_stroke.Color = Color3.fromRGB(45, 50, 62)
perf_stroke.Thickness = 1.2
perf_stroke.Parent = PerfCard

local PerfTitle = Instance.new("TextLabel")
PerfTitle.Size = UDim2.new(1, -20, 0, 18)
PerfTitle.Position = UDim2.new(0, 12, 0, 8)
PerfTitle.Text = "ESTADO Y RENDIMIENTO ⚡"
PerfTitle.Font = Enum.Font.GothamBold
PerfTitle.TextSize = 11
PerfTitle.TextColor3 = Color3.fromRGB(220, 225, 235)
PerfTitle.TextXAlignment = Enum.TextXAlignment.Left
PerfTitle.BackgroundTransparency = 1
PerfTitle.Parent = PerfCard

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Size = UDim2.new(1, -20, 0, 22)
StatsLabel.Position = UDim2.new(0, 12, 0, 28)
StatsLabel.Text = "FPS: -- | Ping: -- ms | Status: 🟢 ACTIVO"
StatsLabel.Font = Enum.Font.Gotham
StatsLabel.TextSize = 11
StatsLabel.TextColor3 = Color3.fromRGB(50, 255, 140)
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.BackgroundTransparency = 1
StatsLabel.Parent = PerfCard

local lastUpdate = tick()
local frameCount = 0
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    if tick() - lastUpdate >= 1 then
        local fps = frameCount
        frameCount = 0
        lastUpdate = tick()
        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        StatsLabel.Text = "FPS: " .. tostring(fps) .. "  |  Ping: " .. tostring(ping) .. "ms  |  Status: 🟢 ACTIVO"
    end
end)

-- Tarjeta de Redes Sociales
local SocialCard = Instance.new("Frame")
SocialCard.Size = UDim2.new(0.94, 0, 0, 110)
SocialCard.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
SocialCard.BorderSizePixel = 0
SocialCard.Parent = TabMain

local sc_corner = Instance.new("UICorner")
sc_corner.CornerRadius = UDim.new(0, 10)
sc_corner.Parent = SocialCard

local sc_stroke = Instance.new("UIStroke")
sc_stroke.Color = Color3.fromRGB(45, 50, 62)
sc_stroke.Thickness = 1.2
sc_stroke.Parent = SocialCard

local SocialTitle = Instance.new("TextLabel")
SocialTitle.Size = UDim2.new(1, -20, 0, 20)
SocialTitle.Position = UDim2.new(0, 12, 0, 8)
SocialTitle.Text = "REDES OFICIALES 🌐"
SocialTitle.Font = Enum.Font.GothamBold
SocialTitle.TextSize = 11
SocialTitle.TextColor3 = Color3.fromRGB(220, 225, 235)
SocialTitle.TextXAlignment = Enum.TextXAlignment.Left
SocialTitle.BackgroundTransparency = 1
SocialTitle.Parent = SocialCard

local WhatsAppBtn = Instance.new("TextButton")
WhatsAppBtn.Size = UDim2.new(1, -24, 0, 32)
WhatsAppBtn.Position = UDim2.new(0, 12, 0, 32)
WhatsAppBtn.BackgroundColor3 = Color3.fromRGB(26, 30, 38)
WhatsAppBtn.Text = "📲 CANAL DE WHATSAPP (COPIAR)"
WhatsAppBtn.Font = Enum.Font.GothamBold
WhatsAppBtn.TextSize = 10.5
WhatsAppBtn.TextColor3 = Theme.Main
WhatsAppBtn.Parent = SocialCard

local wbc = Instance.new("UICorner")
wbc.CornerRadius = UDim.new(0, 6)
wbc.Parent = WhatsAppBtn

WhatsAppBtn.MouseButton1Click:Connect(function()
    setclipboard("https://whatsapp.com/channel/0029VbC12x4GufIzNYfrPh3R")
    WhatsAppBtn.Text = "¡LINK COPIADO! ✅"
    task.wait(2)
    WhatsAppBtn.Text = "📲 CANAL DE WHATSAPP (COPIAR)"
end)

local TikTokBtn = Instance.new("TextButton")
TikTokBtn.Size = UDim2.new(1, -24, 0, 32)
TikTokBtn.Position = UDim2.new(0, 12, 0, 68)
TikTokBtn.BackgroundColor3 = Color3.fromRGB(26, 30, 38)
TikTokBtn.Text = "🎵 TIKTOK OFICIAL (COPIAR)"
TikTokBtn.Font = Enum.Font.GothamBold
TikTokBtn.TextSize = 10.5
TikTokBtn.TextColor3 = Theme.Main
TikTokBtn.Parent = SocialCard

local tkc = Instance.new("UICorner")
tkc.CornerRadius = UDim.new(0, 6)
tkc.Parent = TikTokBtn

TikTokBtn.MouseButton1Click:Connect(function()
    setclipboard("softworks32")
    TikTokBtn.Text = "¡USUARIO COPIADO! ✅"
    task.wait(2)
    TikTokBtn.Text = "🎵 TIKTOK OFICIAL (COPIAR)"
end)

-- Tarjeta de Novedades
local NewsCard = Instance.new("Frame")
NewsCard.Size = UDim2.new(0.94, 0, 0, 75)
NewsCard.BackgroundColor3 = Color3.fromRGB(18, 20, 24)
NewsCard.BorderSizePixel = 0
NewsCard.Parent = TabMain

local news_corner = Instance.new("UICorner")
news_corner.CornerRadius = UDim.new(0, 10)
news_corner.Parent = NewsCard

local news_stroke = Instance.new("UIStroke")
news_stroke.Color = Color3.fromRGB(45, 50, 62)
news_stroke.Thickness = 1.2
news_stroke.Parent = NewsCard

local NewsTitle = Instance.new("TextLabel")
NewsTitle.Size = UDim2.new(1, -20, 0, 18)
NewsTitle.Position = UDim2.new(0, 12, 0, 8)
NewsTitle.Text = "NOVEDADES V1.0 📢"
NewsTitle.Font = Enum.Font.GothamBold
NewsTitle.TextSize = 11
NewsTitle.TextColor3 = Color3.fromRGB(220, 225, 235)
NewsTitle.TextXAlignment = Enum.TextXAlignment.Left
NewsTitle.BackgroundTransparency = 1
NewsTitle.Parent = NewsCard

local NewsBody = Instance.new("TextLabel")
NewsBody.Size = UDim2.new(1, -24, 0, 42)
NewsBody.Position = UDim2.new(0, 12, 0, 28)
NewsBody.Text = "• Se corrigió el error del aimbot\n• Se añadió la función Hide Name\n• Menú optimizado sin animaciones molestas"
NewsBody.Font = Enum.Font.Gotham
NewsBody.TextSize = 10
NewsBody.TextColor3 = Color3.fromRGB(160, 165, 175)
NewsBody.TextXAlignment = Enum.TextXAlignment.Left
NewsBody.TextYAlignment = Enum.TextYAlignment.Top
NewsBody.BackgroundTransparency = 1
NewsBody.Parent = NewsCard

-- funciones del Menú
AddToggle(TabCheats, "Speed Hack", "SpeedEnabled", Theme.Main)
AddSlider(TabCheats, "Speed Power", 16, 100, 16, "SpeedValue", Theme.Main)
AddToggle(TabCheats, "Infinity Jump", "InfJump", Theme.Main)
AddToggle(TabCheats, "Noclip", "Noclip", Theme.Main)
AddToggle(TabCheats, "Fly (Vuelo)", "Fly", Theme.Main)
AddToggle(TabCheats, "Hide Name 👤", "HideName", Theme.Main)
AddToggle(TabCheats, "Spin Bot 🌀", "SpinBot", Theme.Main)
AddSlider(TabCheats, "Spin Speed", 10, 150, 30, "SpinSpeed", Theme.Main)
  
AddToggle(TabCombat, "Aimbot", "AimbotEnabled", Theme.Combat)
AddSlider(TabCombat, "FOV Radio", 30, 300, 100, "FOVRadius", Theme.Combat)
AddToggle(TabCombat, "Show FOV Anillo", "FOVEnabled", Theme.Combat)
AddToggle(TabCombat, "Silent Aim", "SilentAim", Theme.Combat)

AddToggle(TabVisuals, "ESP Box", "ESPBox", Theme.Visuals)
AddToggle(TabVisuals, "ESP Name", "ESPName", Theme.Visuals)
AddToggle(TabVisuals, "ESP Distancia", "ESPDist", Theme.Visuals)
AddToggle(TabVisuals, "ESP Health", "ESPHealth", Theme.Visuals)
AddToggle(TabVisuals, "Traces", "Traces", Theme.Visuals)
AddToggle(TabVisuals, "ESP Gun", "ESPGun", Theme.Visuals) 
AddToggle(TabVisuals, "ESP Gun Distancia", "ESPGunDist", Theme.Visuals) 
AddToggle(TabVisuals, "ESP Armas Tiradas", "ESPDroppedGuns", Theme.Visuals)

local BtnServerHop = AddButton(TabMisc, "Server Hop 🌐", Theme.Misc)
local BtnRejoin = AddButton(TabMisc, "Rejoin Server 🔄", Theme.Misc)
local BtnDeathTP = AddButton(TabMisc, "TP Última Muerte ☠️", Theme.Misc)
AddToggle(TabMisc, "Auto TP Muerte ☠️", "AutoTPDeath", Theme.Misc) 
AddToggle(TabMisc, "Bloquear Menú🌪️", "LockUI", Theme.Misc)



-- Advertencia UI para TP
local WarningFrame = Instance.new("Frame")
WarningFrame.Size = UDim2.new(0, 320, 0, 130)
WarningFrame.Position = UDim2.new(0.5, -160, 0.5, -65)
WarningFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 26)
WarningFrame.BorderSizePixel = 0
WarningFrame.Visible = false
WarningFrame.ZIndex = 50
WarningFrame.Parent = ScreenGui 

local WarningCorner = Instance.new("UICorner")
WarningCorner.CornerRadius = UDim.new(0, 10)
WarningCorner.Parent = WarningFrame

local WarningStroke = Instance.new("UIStroke")
WarningStroke.Color = Color3.fromRGB(255, 80, 80) 
WarningStroke.Thickness = 1.5
WarningStroke.Parent = WarningFrame

local WarningText = Instance.new("TextLabel")
WarningText.Size = UDim2.new(1, -20, 0.6, 0)
WarningText.Position = UDim2.new(0, 10, 0, 10)
WarningText.Text = "⚠️ ADVERTENCIA\nEsta función puede ocasionar baneo a tu cuenta.\nÚsala bajo tu propio riesgo."
WarningText.Font = Enum.Font.GothamBold
WarningText.TextSize = 13
WarningText.TextColor3 = Color3.fromRGB(220, 220, 220)
WarningText.TextWrapped = true
WarningText.BackgroundTransparency = 1
WarningText.ZIndex = 51
WarningText.Parent = WarningFrame

local BtnCancel = Instance.new("TextButton")
BtnCancel.Size = UDim2.new(0.4, 0, 0, 32)
BtnCancel.Position = UDim2.new(0.06, 0, 0.65, 0)
BtnCancel.BackgroundColor3 = Color3.fromRGB(45, 48, 58)
BtnCancel.Text = "Cancelar"
BtnCancel.Font = Enum.Font.GothamBold
BtnCancel.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnCancel.TextSize = 12
BtnCancel.ZIndex = 51
BtnCancel.Parent = WarningFrame

local BtnCancelCorner = Instance.new("UICorner")
BtnCancelCorner.CornerRadius = UDim.new(0, 6)
BtnCancelCorner.Parent = BtnCancel

local BtnConfirm = Instance.new("TextButton")
BtnConfirm.Size = UDim2.new(0.4, 0, 0, 32)
BtnConfirm.Position = UDim2.new(0.54, 0, 0.65, 0)
BtnConfirm.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
BtnConfirm.Text = "Confirmar"
BtnConfirm.Font = Enum.Font.GothamBold
BtnConfirm.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnConfirm.TextSize = 12
BtnConfirm.ZIndex = 51
BtnConfirm.Parent = WarningFrame

local BtnConfirmCorner = Instance.new("UICorner")
BtnConfirmCorner.CornerRadius = UDim.new(0, 6)
BtnConfirmCorner.Parent = BtnConfirm

-- Lógica de Interacciones
BtnServerHop.MouseButton1Click:Connect(function()
    BtnServerHop.Text = "Buscando servidor... 🔍"
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local PlaceId = game.PlaceId
    
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    end)
    
    if success and result and result.data then
        local targetServer
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                targetServer = server.id
                break
            end
        end
        
        if targetServer then
            TeleportService:TeleportToPlaceInstance(PlaceId, targetServer, LocalPlayer)
        else
            BtnServerHop.Text = "No hay otros servers ❌"
            task.wait(2)
            BtnServerHop.Text = "Server Hop 🌐"
        end
    else
        BtnServerHop.Text = "Error al buscar ❌"
        task.wait(2)
        BtnServerHop.Text = "Server Hop 🌐"
    end
end)

BtnDeathTP.MouseButton1Click:Connect(function()
    if Config.DeathPos then
        WarningFrame.Visible = true 
    else
        BtnDeathTP.Text = "No hay registro ❌"
        task.wait(2)
        BtnDeathTP.Text = "TP Última Muerte ☠️"
    end
end)

BtnCancel.MouseButton1Click:Connect(function()
    WarningFrame.Visible = false 
end)

BtnConfirm.MouseButton1Click:Connect(function()
    WarningFrame.Visible = false 
    local char, hum, root = GetSafeCharacter()
    if Config.DeathPos and char and root then
        root.CFrame = CFrame.new(Config.DeathPos + Vector3.new(0, 3, 0))
        BtnDeathTP.Text = "¡Teletransportado! ⚡"
        task.wait(2)
        BtnDeathTP.Text = "TP Última Muerte ☠️"
    end
end)


-- Visibilidad y Objetivos
local function VerificarParedVisibilidad(objetivoParte)
    if not Config.WallCheck then return true end 
    local origen = Camera.CFrame.Position
    local destino = objetivoParte.Position
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, objetivoParte.Parent}
    local resultado = workspace:Raycast(origen, destino - origen, raycastParams)
    return resultado == nil 
end

local function ObtenerEnemigoMasCercano()
    local objetivoCercano = nil
    local distanciaMinima = Config.FOVRadius
    local centroPantalla = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, jugador in ipairs(Players:GetPlayers()) do
        if jugador ~= LocalPlayer and jugador.Character and jugador.Character:FindFirstChild("Humanoid") and jugador.Character.Humanoid.Health > 0 then
            local parteObjetivo = jugador.Character:FindFirstChild(Config.TargetPart) or jugador.Character:FindFirstChild("Head")
            if parteObjetivo then
                local vector2, enPantalla = Camera:WorldToViewportPoint(parteObjetivo.Position)
                if enPantalla then
                    local distancia = (Vector2.new(vector2.X, vector2.Y) - centroPantalla).Magnitude
                    if distancia < distanciaMinima and VerificarParedVisibilidad(parteObjetivo) then
                        distanciaMinima = distancia
                        objetivoCercano = parteObjetivo
                    end
                end
            end
        end
    end
    return objetivoCercano
end

RunService.RenderStepped:Connect(function()
    if not Camera or not workspace.CurrentCamera then
        Camera = workspace.CurrentCamera
        return
    end
    
    local centroPantalla = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    if Config.FOVEnabled then
        FOVCircle.Visible = true
        FOVCircle.Radius = Config.FOVRadius
        FOVCircle.Position = centroPantalla
    else
        FOVCircle.Visible = false
    end
    
    if Config.AimbotEnabled or Config.FOVEnabled then
        local objetivo = ObtenerEnemigoMasCercano()
        if objetivo then
            FOVCircle.Color = Color3.fromRGB(0, 255, 0) 
            if Config.AimbotEnabled then
                local currentPos = Camera.CFrame.Position
                local targetCFrame = CFrame.lookAt(currentPos, objetivo.Position)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 0.6)
            end
        else
            FOVCircle.Color = Color3.fromRGB(255, 0, 0) 
        end
    end
end)



--  ESP DE LAS ARMÁS INCLUYENDO COLORES 
local WeaponColors = {
    ["AK47"] = Color3.fromRGB(255, 215, 0),
    ["AK47-Cosmetic"] = Color3.fromRGB(255, 215, 0),
    ["Anaconda"] = Color3.fromRGB(200, 0, 0),
    ["Barbed Baseball Bat"] = Color3.fromRGB(160, 32, 240),
    ["Combat Axe"] = Color3.fromRGB(160, 32, 240),
    ["DiamondMop"] = Color3.fromRGB(160, 32, 240),
    ["Double Barrel"] = Color3.fromRGB(160, 32, 240),
    ["Draco"] = Color3.fromRGB(160, 32, 240),
    ["EnergyShot"] = Color3.fromRGB(160, 32, 240),
    ["GoldMop"] = Color3.fromRGB(0, 122, 255),
    ["M16"] = Color3.fromRGB(255, 215, 0),
    ["Mop"] = Color3.fromRGB(128, 128, 128),
    ["MP5"] = Color3.fromRGB(255, 215, 0),
    ["Remington"] = Color3.fromRGB(255, 215, 0),
    ["RightGrip"] = Color3.fromRGB(255, 215, 0),
    ["RPG"] = Color3.fromRGB(255, 215, 0),
    ["RPG-ریموٹ فونکشن اصلی"] = Color3.fromRGB(255, 215, 0),
    ["SilverMop"] = Color3.fromRGB(160, 32, 240),
    ["sledgehammer"] = Color3.fromRGB(160, 32, 240),
    ["Tactical Axe"] = Color3.fromRGB(255, 215, 0)
}

local function GetPlayerTool(player)
    if player.Character then
        local tool = player.Character:FindFirstChildOfClass("Tool")
        if tool then return tool end
    end
    if player:FindFirstChild("Backpack") then
        local tool = player.Backpack:FindFirstChildOfClass("Tool")
        if tool then return tool end
    end
    return nil
end

local function CreateESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Thickness = 1.0     
    box.Color = Color3.fromRGB(255, 0, 0)
    box.Filled = false

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Center = true
    nameText.Outline = true
    nameText.Size = 13
    nameText.Font = 2
    nameText.Color = Color3.fromRGB(255, 255, 255)

    local distText = Drawing.new("Text")
    distText.Visible = false
    distText.Center = true
    distText.Outline = true
    distText.Size = 11
    distText.Font = 2
    distText.Color = Color3.fromRGB(220, 220, 220)

    local gunText = Drawing.new("Text")
    gunText.Visible = false
    gunText.Center = true
    gunText.Outline = true
    gunText.Size = 11
    gunText.Font = 2

    local healthBar = Drawing.new("Line")
    healthBar.Visible = false
    healthBar.Thickness = 2

    local traceLine = Drawing.new("Line")
    traceLine.Visible = false
    traceLine.Thickness = 1.0 
    traceLine.Color = Color3.fromRGB(255, 0, 0)

    local connection
    connection = RunService.RenderStepped:Connect(function()
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Head") and player.Character:FindFirstChildOfClass("Humanoid") then
            local character = player.Character
            local rootPart = character.HumanoidRootPart
            local head = character.Head
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local camera = workspace.CurrentCamera

            local vector, onScreen = camera:WorldToViewportPoint(rootPart.Position)
            
            if onScreen then
                local distance = (camera.CFrame.Position - rootPart.Position).Magnitude
                local topPos, topOnScreen = camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.8, 0))
                local bottomPos, bottomOnScreen = camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

                if topOnScreen and bottomOnScreen then
                    local boxHeight = math.abs(topPos.Y - bottomPos.Y)
                    local boxWidth = boxHeight * 0.60 

                    if Config.ESPBox then
                        box.Visible = true
                        box.Position = Vector2.new(vector.X - (boxWidth / 2), topPos.Y)
                        box.Size = Vector2.new(boxWidth, boxHeight)
                    else
                        box.Visible = false
                    end

                    if Config.ESPName then
                        nameText.Visible = true
                        nameText.Position = Vector2.new(vector.X, topPos.Y - 16)
                        nameText.Text = player.Name
                    else
                        nameText.Visible = false
                    end

                    local yOffset = bottomPos.Y + 4
                    if Config.ESPDist then
                        distText.Visible = true
                        distText.Position = Vector2.new(vector.X, yOffset)
                        distText.Text = string.format("[%d studs]", math.floor(distance))
                        yOffset = yOffset + 14
                    else
                        distText.Visible = false
                    end

                    if Config.ESPGun then
                        local currentTool = GetPlayerTool(player)
                        if currentTool then
                            local weaponName = currentTool.Name
                            gunText.Visible = true
                            gunText.Color = WeaponColors[weaponName] or Color3.fromRGB(255, 255, 255)
                            
                            if Config.ESPGunDist then
                                gunText.Text = string.format("%s [%d studs]", weaponName, math.floor(distance))
                            else
                                gunText.Text = weaponName
                            end
                            gunText.Position = Vector2.new(vector.X, yOffset)
                        else
                            gunText.Visible = false
                        end
                    else
                        gunText.Visible = false
                    end

                    if Config.ESPHealth then
                        healthBar.Visible = true
                        local healthPercentage = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
                        local barX = vector.X - (boxWidth / 2) - 6
                        
                        healthBar.From = Vector2.new(barX, bottomPos.Y)
                        healthBar.To = Vector2.new(barX, bottomPos.Y - (boxHeight * healthPercentage))
                        healthBar.Color = Color3.fromHSV((healthPercentage * 120) / 360, 1, 1)
                    else
                        healthBar.Visible = false
                    end

                    if Config.Traces then
                        traceLine.Visible = true
                        traceLine.From = Vector2.new(camera.ViewportSize.X / 2, 0)
                        traceLine.To = Vector2.new(vector.X, topPos.Y)
                    else
                        traceLine.Visible = false
                    end
                end
            else
                box.Visible = false
                nameText.Visible = false
                distText.Visible = false
                gunText.Visible = false
                healthBar.Visible = false
                traceLine.Visible = false
            end
        else
            box:Destroy()
            nameText:Destroy()
            distText:Destroy()
            gunText:Destroy()
            healthBar:Destroy()
            traceLine:Destroy()
            connection:Disconnect()
        end
    end)
end



-- M Jugadores
local function MonitorPlayer(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(character)
        local root = character:WaitForChild("HumanoidRootPart", 10)
        local head = character:WaitForChild("Head", 10)
        local humanoid = character:WaitForChild("Humanoid", 10)
        
        if root and head and humanoid then
            task.wait(0.2) 
            CreateESP(player)
        end
    end)

    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(MonitorPlayer)

for _, player in pairs(Players:GetPlayers()) do
    MonitorPlayer(player)
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if player ~= LocalPlayer then
            player.Character:WaitForChild("HumanoidRootPart", 5)
            player.Character:WaitForChild("UpperTorso", 5)
            CreateESP(player)
        end
    end)
end)

-- busca la  Última Muerte
local function TrackDeath(char)
    local hum = char:WaitForChild("Humanoid", 5)
    local root = char:WaitForChild("HumanoidRootPart", 5)
    
    if hum and root then
        hum.Died:Connect(function()
            Config.DeathPos = root.Position 
        end)
    end
end

if Character then
    TrackDeath(Character)
end
LocalPlayer.CharacterAdded:Connect(TrackDeath)

-- ESP de Armas en el Mapa
local function CreateDroppedGunESP(tool)
    if not tool:IsA("Tool") then return end
    
    local handle = tool:FindFirstChild("Handle") or tool:FindFirstChildWhichIsA("BasePart")
    if not handle then return end

    local weaponName = tool.Name
    local espColor = WeaponColors[weaponName] or Color3.fromRGB(255, 255, 255)

    local lootText = Drawing.new("Text")
    lootText.Visible = false
    lootText.Center = true
    lootText.Outline = true
    lootText.Size = 12
    lootText.Font = 2
    lootText.Color = espColor
    
    local lootBox = Drawing.new("Square")
    lootBox.Visible = false
    lootBox.Thickness = 1.2
    lootBox.Color = espColor
    lootBox.Filled = false

    local dropConnection
    dropConnection = RunService.RenderStepped:Connect(function()
        if Config.ESPDroppedGuns and tool.Parent == workspace and handle then
            local vector, onScreen = Camera:WorldToViewportPoint(handle.Position)
            
            if onScreen then
                local distance = (Camera.CFrame.Position - handle.Position).Magnitude
                local boxSize = math.clamp(1000 / distance, 15, 80)
                
                lootBox.Size = Vector2.new(boxSize, boxSize)
                lootBox.Position = Vector2.new(vector.X - (boxSize / 2), vector.Y - (boxSize / 2))
                lootBox.Visible = true
                
                lootText.Position = Vector2.new(vector.X, vector.Y + (boxSize / 2) + 2)
                lootText.Text = string.format("%s [%d studs]", weaponName, math.floor(distance))
                lootText.Visible = true
            else
                lootBox.Visible = false
                lootText.Visible = false
            end
        else
            lootBox.Visible = false
            lootText.Visible = false
            
            if not tool.Parent or tool.Parent ~= workspace then
                lootText:Remove()
                lootBox:Remove()
                dropConnection:Disconnect()
            end
        end
    end)
end

for _, obj in pairs(workspace:GetChildren()) do
    CreateDroppedGunESP(obj)
end
workspace.ChildAdded:Connect(CreateDroppedGunESP)

-- BYPASS
RunService.Stepped:Connect(function()
    local char, hum, root = GetSafeCharacter()
    if not char or not root or not hum then return end
    
    if Config.Fly or Config.SpeedEnabled then
        if Config.Fly and not hum.PlatformStand then
            hum.PlatformStand = true
        end

        local velocity = root.AssemblyLinearVelocity
        if velocity.Magnitude > 200 then
            local safeDirection = velocity.Unit
            root.AssemblyLinearVelocity = Vector3.new(
                safeDirection.X * 200, 
                math.clamp(velocity.Y, -200, 200), 
                safeDirection.Z * 200
            )
        end
    else
        if hum.PlatformStand then
            hum.PlatformStand = false
        end
    end
end)

-- SPEED HACK 
RunService.Heartbeat:Connect(function()
    local char, hum, root = GetSafeCharacter()
    if char and Config.SpeedEnabled then
        local moveDir = hum.MoveDirection
        if moveDir.Magnitude > 0 then
            local currentY = root.AssemblyLinearVelocity.Y
            local newVelocity = moveDir * Config.SpeedValue
            root.AssemblyLinearVelocity = Vector3.new(newVelocity.X, currentY, newVelocity.Z)
        end
    end
end)

-- FLY
local FlyAttachment, AlignOri, LinearVel
RunService.RenderStepped:Connect(function()
    local char, hum, root = GetSafeCharacter()
    if Config.Fly and char then
        if not FlyAttachment then
            FlyAttachment = Instance.new("Attachment")
            FlyAttachment.Name = "ViceFlyAtt" 
            FlyAttachment.Parent = root
            
            AlignOri = Instance.new("AlignOrientation")
            AlignOri.Name = "ViceFlyOri"
            AlignOri.Mode = Enum.OrientationAlignmentMode.OneAttachment
            AlignOri.Attachment0 = FlyAttachment
            AlignOri.MaxTorque = 9e9
            AlignOri.Responsiveness = 200 
            AlignOri.Parent = root
            
            LinearVel = Instance.new("LinearVelocity")
            LinearVel.Name = "ViceFlyVel"
            LinearVel.Attachment0 = FlyAttachment
            LinearVel.MaxForce = 9e9
            LinearVel.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
            LinearVel.Parent = root
        end
        
        local camera = workspace.CurrentCamera
        AlignOri.CFrame = camera.CFrame
        
        local moveDirection = hum.MoveDirection
        if moveDirection.Magnitude > 0 then
            local lookVector = camera.CFrame.LookVector
            local targetVelocity = moveDirection * 50 
            if lookVector.Y > 0.2 or lookVector.Y < -0.2 then
                targetVelocity = targetVelocity + Vector3.new(0, lookVector.Y * 40, 0)
            end
            LinearVel.VectorVelocity = targetVelocity
        else
            LinearVel.VectorVelocity = Vector3.new(0, 0, 0)
        end
    else
        if FlyAttachment then FlyAttachment:Destroy() end
        if AlignOri then AlignOri:Destroy() end
        if LinearVel then LinearVel:Destroy() end
        FlyAttachment, AlignOri, LinearVel = nil, nil, nil
    end
end)

-- NOCLIP 
RunService.Stepped:Connect(function()
    if Config.Noclip and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- SALTÓ INFINITO 
UserInputService.JumpRequest:Connect(function()
    if Config.InfJump then
        local char, hum, root = GetSafeCharacter()
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- SPIN BOT
RunService.RenderStepped:Connect(function()
    if Config.SpinBot then
        local char, hum, root = GetSafeCharacter()
        if root then
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(Config.SpinSpeed), 0)
        end
    end


  --HODE NAME      
    if Character then
        local hum = Character:FindFirstChildOfClass("Humanoid")
        if hum then
            if Config.HideName then
                hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            else
                hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    
        for _, obj in pairs(Character:GetDescendants()) do
            if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
                if Config.HideName then
                    obj.Enabled = false
                end
            end
        end
    end
end)
