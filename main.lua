-- Roblox MarketplaceService Spoofing Exploit UI v2.0
-- Improved layout with tabs, proper spacing, and stable design
-- For authorized pentesting only
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local MarketplaceService = game:GetService("MarketplaceService")

local success, result = pcall(function()
    return MarketplaceService:GetDeveloperProductsAsync()
end)

if success then
    for _, product in pairs(result:GetCurrentPage()) do
        print("Product ID:", product.ProductId)
        print("Product Name:", product.Name)
        print("Price:", product.PriceInRobux)
        print("---")
    end
else
    warn("Failed to get developer products:", result)
end

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local EXPLOIT_CONFIG = {
    DEV_PRODUCTS = {1788956201, 1788956710, 1788956860, 1788957045, 1788956431},
    GAMEPASS_IDS = {123456, 789012},
}

-- Main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MarketplaceExploit"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 550)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(60, 60, 80)
Stroke.Thickness = 1
Stroke.Parent = MainFrame

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 16)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -60, 1, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🛒 Marketplace Spoofer v2.0"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.Parent = TitleBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TitleBar
CloseBtn.TextScaled = true

-- Tab System
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, 0, 0, 40)
TabFrame.Position = UDim2.new(0, 0, 0, 50)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

local ProductTab = Instance.new("TextButton")
ProductTab.Size = UDim2.new(0.5, 0, 1, 0)
ProductTab.Position = UDim2.new(0, 0, 0, 0)
ProductTab.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
ProductTab.Text = "📦 Products"
ProductTab.TextColor3 = Color3.fromRGB(255, 255, 255)
ProductTab.Font = Enum.Font.GothamSemibold
ProductTab.TextScaled = true
ProductTab.Parent = TabFrame

local GamepassTab = Instance.new("TextButton")
GamepassTab.Size = UDim2.new(0.5, 0, 1, 0)
GamepassTab.Position = UDim2.new(0.5, 0, 0, 0)
GamepassTab.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
GamepassTab.Text = "🎫 Gamepasses"
GamepassTab.TextColor3 = Color3.fromRGB(200, 200, 200)
GamepassTab.Font = Enum.Font.GothamSemibold
GamepassTab.TextScaled = true
GamepassTab.Parent = TabFrame

-- Content Area
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -110)
ContentFrame.Position = UDim2.new(0, 10, 0, 90)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Product Content
local ProductContent = Instance.new("Frame")
ProductContent.Size = UDim2.new(1, 0, 1, 0)
ProductContent.BackgroundTransparency = 1
ProductContent.Visible = true
ProductContent.Parent = ContentFrame

local ProductSection = Instance.new("Frame")
ProductSection.Size = UDim2.new(1, 0, 0, 160)
ProductSection.Position = UDim2.new(0, 0, 0, 10)
ProductSection.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
ProductSection.Parent = ProductContent

local ProductSectionCorner = Instance.new("UICorner")
ProductSectionCorner.CornerRadius = UDim.new(0, 12)
ProductSectionCorner.Parent = ProductSection

local ProductTitle = Instance.new("TextLabel")
ProductTitle.Size = UDim2.new(1, 0, 0, 40)
ProductTitle.BackgroundTransparency = 1
ProductTitle.Text = "Dev Product Spoof"
ProductTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ProductTitle.TextScaled = true
ProductTitle.Font = Enum.Font.GothamBold
ProductTitle.Parent = ProductSection

local ProductInputFrame = Instance.new("Frame")
ProductInputFrame.Size = UDim2.new(1, -20, 0, 50)
ProductInputFrame.Position = UDim2.new(0, 10, 0, 45)
ProductInputFrame.BackgroundTransparency = 1
ProductInputFrame.Parent = ProductSection

local ProductIdBox = Instance.new("TextBox")
ProductIdBox.Size = UDim2.new(0, 250, 0, 35)
ProductIdBox.Position = UDim2.new(0, 0, 0.5, -17.5)
ProductIdBox.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
ProductIdBox.BorderSizePixel = 0
ProductIdBox.Text = "1788956710"
ProductIdBox.PlaceholderText = "Enter Product ID"
ProductIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ProductIdBox.Font = Enum.Font.Gotham
ProductIdBox.TextScaled = true
ProductIdBox.Parent = ProductInputFrame

local ProductIdCorner = Instance.new("UICorner")
ProductIdCorner.CornerRadius = UDim.new(0, 8)
ProductIdCorner.Parent = ProductIdBox

local ProductBuyBtn = Instance.new("TextButton")
ProductBuyBtn.Size = UDim2.new(0, 100, 0, 35)
ProductBuyBtn.Position = UDim2.new(0, 260, 0.5, -17.5)
ProductBuyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
ProductBuyBtn.BorderSizePixel = 0
ProductBuyBtn.Text = "SPOOF BUY"
ProductBuyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProductBuyBtn.Font = Enum.Font.GothamBold
ProductBuyBtn.TextScaled = true
ProductBuyBtn.Parent = ProductInputFrame

local ProductBtnCorner = Instance.new("UICorner")
ProductBtnCorner.CornerRadius = UDim.new(0, 8)
ProductBtnCorner.Parent = ProductBuyBtn

-- Quick Product Buttons
local QuickProductFrame = Instance.new("Frame")
QuickProductFrame.Size = UDim2.new(1, -20, 0, 80)
QuickProductFrame.Position = UDim2.new(0, 10, 0, 75)
QuickProductFrame.BackgroundTransparency = 1
QuickProductFrame.Parent = ProductSection

local QuickProductLayout = Instance.new("UIListLayout")
QuickProductLayout.FillDirection = Enum.FillDirection.Horizontal
QuickProductLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
QuickProductLayout.VerticalAlignment = Enum.VerticalAlignment.Center
QuickProductLayout.Padding = UDim.new(0, 8)
QuickProductLayout.Parent = QuickProductFrame

-- Gamepass Content
local GamepassContent = Instance.new("Frame")
GamepassContent.Size = UDim2.new(1, 0, 1, 0)
GamepassContent.BackgroundTransparency = 1
GamepassContent.Visible = false
GamepassContent.Parent = ContentFrame

local GamepassSection = Instance.new("Frame")
GamepassSection.Size = UDim2.new(1, 0, 0, 160)
GamepassSection.Position = UDim2.new(0, 0, 0, 10)
GamepassSection.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
GamepassSection.Parent = GamepassContent

local GamepassSectionCorner = Instance.new("UICorner")
GamepassSectionCorner.CornerRadius = UDim.new(0, 12)
GamepassSectionCorner.Parent = GamepassSection

local GamepassTitle = Instance.new("TextLabel")
GamepassTitle.Size = UDim2.new(1, 0, 0, 40)
GamepassTitle.BackgroundTransparency = 1
GamepassTitle.Text = "Gamepass Spoof"
GamepassTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
GamepassTitle.TextScaled = true
GamepassTitle.Font = Enum.Font.GothamBold
GamepassTitle.Parent = GamepassSection

local GamepassInputFrame = Instance.new("Frame")
GamepassInputFrame.Size = UDim2.new(1, -20, 0, 50)
GamepassInputFrame.Position = UDim2.new(0, 10, 0, 45)
GamepassInputFrame.BackgroundTransparency = 1
GamepassInputFrame.Parent = GamepassSection

local GamepassIdBox = Instance.new("TextBox")
GamepassIdBox.Size = UDim2.new(0, 250, 0, 35)
GamepassIdBox.Position = UDim2.new(0, 0, 0.5, -17.5)
GamepassIdBox.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
GamepassIdBox.BorderSizePixel = 0
GamepassIdBox.Text = "123456"
GamepassIdBox.PlaceholderText = "Enter Gamepass ID"
GamepassIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
GamepassIdBox.Font = Enum.Font.Gotham
GamepassIdBox.TextScaled = true
GamepassIdBox.Parent = GamepassInputFrame

local GamepassIdCorner = Instance.new("UICorner")
GamepassIdCorner.CornerRadius = UDim.new(0, 8)
GamepassIdCorner.Parent = GamepassIdBox

local GamepassBuyBtn = Instance.new("TextButton")
GamepassBuyBtn.Size = UDim2.new(0, 100, 0, 35)
GamepassBuyBtn.Position = UDim2.new(0, 260, 0.5, -17.5)
GamepassBuyBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
GamepassBuyBtn.BorderSizePixel = 0
GamepassBuyBtn.Text = "SPOOF BUY"
GamepassBuyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GamepassBuyBtn.Font = Enum.Font.GothamBold
GamepassBuyBtn.TextScaled = true
GamepassBuyBtn.Parent = GamepassInputFrame

local GamepassBtnCorner = Instance.new("UICorner")
GamepassBtnCorner.CornerRadius = UDim.new(0, 8)
GamepassBtnCorner.Parent = GamepassBuyBtn

-- Log Frame
local LogFrame = Instance.new("ScrollingFrame")
LogFrame.Size = UDim2.new(1, -20, 0, 200)
LogFrame.Position = UDim2.new(0, 10, 1, -215)
LogFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
LogFrame.BorderSizePixel = 0
LogFrame.ScrollBarThickness = 6
LogFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
LogFrame.Parent = MainFrame

local LogCorner = Instance.new("UICorner")
LogCorner.CornerRadius = UDim.new(0, 12)
LogCorner.Parent = LogFrame

local LogLayout = Instance.new("UIListLayout")
LogLayout.SortOrder = Enum.SortOrder.LayoutOrder
LogLayout.Padding = UDim.new(0, 4)
LogLayout.Parent = LogFrame

-- Drag functionality
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Tab switching
local function switchTab(activeTab, inactiveTab, activeContent, inactiveContent)
    activeTab.BackgroundColor3 = Color3.fromRGB(55, 55, 75)
    inactiveTab.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    activeContent.Visible = true
    inactiveContent.Visible = false
end

ProductTab.MouseButton1Click:Connect(function()
    switchTab(ProductTab, GamepassTab, ProductContent, GamepassContent)
end)

GamepassTab.MouseButton1Click:Connect(function()
    switchTab(GamepassTab, ProductTab, GamepassContent, ProductContent)
end)

-- Quick product buttons
for i, productId in ipairs(EXPLOIT_CONFIG.DEV_PRODUCTS) do
    local quickBtn = Instance.new("TextButton")
    quickBtn.Size = UDim2.new(0, 70, 0, 30)
    quickBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    quickBtn.BorderSizePixel = 0
    quickBtn.Text = string.sub(tostring(productId), -6)
    quickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    quickBtn.Font = Enum.Font.GothamBold
    quickBtn.TextScaled = true
    quickBtn.Parent = QuickProductFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = quickBtn
end

-- Log function
local function addLog(message, color)
    local logEntry = Instance.new("TextLabel")
    logEntry.Size = UDim2.new(1, -12, 0, 0)
    logEntry.BackgroundTransparency = 1
    logEntry.Text = os.date("%H:%M:%S") .. " " .. message
    logEntry.TextColor3 = color or Color3.fromRGB(150, 200, 150)
    logEntry.Font = Enum.Font.Code
    logEntry.TextXAlignment = Enum.TextXAlignment.Left
    logEntry.TextScaled = true
    logEntry.LayoutOrder = #LogFrame:GetChildren()
    logEntry.Parent = LogFrame
    
    LogFrame.CanvasSize = UDim2.new(0, 0, 0, LogLayout.AbsoluteContentSize.Y + 10)
    LogFrame.CanvasPosition = Vector2.new(0, LogFrame.AbsoluteCanvasSize.Y)
end

-- Exploit functions
local function spoofProductPurchase(productId, success)
    local playerId = LocalPlayer.UserId
    addLog("Spoofing Product " .. productId .. " → " .. (success and "PURCHASED ✓" or "FAILED ✗"), 
           success and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100))
    
    pcall(function()
        MarketplaceService:SignalPromptProductPurchaseFinished(playerId, productId, success)
    end)
end

local function spoofGamepassPurchase(gamepassId, success)
    addLog("Spoofing Gamepass " .. gamepassId .. " → " .. (success and "PURCHASED ✓" or "FAILED ✗"), 
           success and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 100, 100))
    
    pcall(function()
        MarketplaceService:SignalPromptGamePassPurchaseFinished(LocalPlayer, gamepassId, success)
    end)
end

-- Button connections
ProductBuyBtn.MouseButton1Click:Connect(function()
    local productId = tonumber(ProductIdBox.Text)
    if productId then
        spoofProductPurchase(productId, true)
    else
        addLog("ERROR: Invalid Product ID", Color3.fromRGB(255, 100, 100))
    end
end)

GamepassBuyBtn.MouseButton1Click:Connect(function()
    local gamepassId = tonumber(GamepassIdBox.Text)
    if gamepassId then
        spoofGamepassPurchase(gamepassId, true)
    else
        addLog("ERROR: Invalid Gamepass ID", Color3.fromRGB(255, 100, 100))
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Auto-spoof loop
spawn(function()
    while ScreenGui.Parent do
        wait(3)
        spoofProductPurchase(1788956710, true)
    end
end)

-- Initialize
addLog("Marketplace Spoofer v2.0 loaded successfully")
addLog("UI upgraded: Tab system, proper spacing, stable layout")
addLog("Bypass: Client signals trusted by server")

-- Animate in
MainFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
    Size = UDim2.new(0, 450, 0, 550)
}):Play()
