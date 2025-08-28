--[[
    DEMONOLOGY VIP PROFESSIONAL SCRIPT
    Advanced Ghost Detection & ESP System
    Author: VIP Pro Developer
    Version: 2.0 Premium
    Features:
    - Ghost Type Identification
    - Item ESP
    - Ghost ESP with Distance
    - Professional UI
    - Anti-Detection System
]]--

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

-- Variables
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Camera = Workspace.CurrentCamera

-- Script Configuration
local Config = {
    ESP = {
        Enabled = true,
        GhostESP = true,
        ItemESP = true,
        Distance = true,
        MaxDistance = 1000,
        TextSize = 14,
        BoxESP = true
    },
    
    Colors = {
        Ghost = Color3.fromRGB(255, 0, 0),
        Item = Color3.fromRGB(0, 255, 255),
        Evidence = Color3.fromRGB(255, 255, 0),
        Important = Color3.fromRGB(255, 165, 0)
    },
    
    GhostTypes = {
        ["Banshee"] = {color = Color3.fromRGB(128, 0, 128), evidence = {"EMF Level 5", "Fingerprints", "Freezing Temperatures"}},
        ["Demon"] = {color = Color3.fromRGB(139, 0, 0), evidence = {"Fingerprints", "Ghost Writing", "Freezing Temperatures"}},
        ["Jinn"] = {color = Color3.fromRGB(0, 255, 255), evidence = {"EMF Level 5", "Fingerprints", "Spirit Box"}},
        ["Mare"] = {color = Color3.fromRGB(25, 25, 112), evidence = {"Spirit Box", "Ghost Orbs", "Freezing Temperatures"}},
        ["Oni"] = {color = Color3.fromRGB(255, 69, 0), evidence = {"EMF Level 5", "Spirit Box", "Ghost Writing"}},
        ["Phantom"] = {color = Color3.fromRGB(75, 0, 130), evidence = {"EMF Level 5", "Ghost Orbs", "Freezing Temperatures"}},
        ["Poltergeist"] = {color = Color3.fromRGB(50, 205, 50), evidence = {"Spirit Box", "Fingerprints", "Ghost Orbs"}},
        ["Revenant"] = {color = Color3.fromRGB(220, 20, 60), evidence = {"EMF Level 5", "Fingerprints", "Ghost Writing"}},
        ["Shade"] = {color = Color3.fromRGB(105, 105, 105), evidence = {"EMF Level 5", "Ghost Orbs", "Ghost Writing"}},
        ["Spirit"] = {color = Color3.fromRGB(255, 255, 255), evidence = {"Spirit Box", "Fingerprints", "Ghost Writing"}},
        ["Wraith"] = {color = Color3.fromRGB(72, 61, 139), evidence = {"Spirit Box", "Fingerprints", "Freezing Temperatures"}},
        ["Yurei"] = {color = Color3.fromRGB(123, 104, 238), evidence = {"Ghost Orbs", "Freezing Temperatures", "Ghost Writing"}}
    },
    
    Items = {
        "EMF Reader", "Spirit Box", "Flashlight", "UV Flashlight", "Camera", 
        "Video Camera", "Crucifix", "Smudge Sticks", "Salt", "Candle",
        "Lighter", "Key", "Thermometer", "Strong Flashlight", "Head Mounted Camera",
        "Infrared Light Sensor", "Parabolic Microphone", "Glowstick", "Motion Sensor",
        "Sound Sensor", "Photo Camera", "Tripod", "Sanity Pills"
    }
}

-- ESP Storage
local ESPObjects = {}
local Connections = {}

-- Utility Functions
local function CreateDrawing(type, properties)
    local drawing = Drawing.new(type)
    for property, value in pairs(properties) do
        drawing[property] = value
    end
    return drawing
end

local function GetDistance(part1, part2)
    if part1 and part2 then
        return (part1.Position - part2.Position).Magnitude
    end
    return math.huge
end

local function WorldToViewportPoint(position)
    local vector, onScreen = Camera:WorldToViewportPoint(position)
    return Vector2.new(vector.X, vector.Y), onScreen
end

-- Ghost Detection System
local function IdentifyGhostType(ghostModel)
    if not ghostModel then return "Unknown" end
    
    local ghostName = ghostModel.Name:lower()
    
    -- Advanced ghost detection based on model characteristics
    for ghostType, data in pairs(Config.GhostTypes) do
        if ghostName:find(ghostType:lower()) then
            return ghostType
        end
    end
    
    -- Fallback detection based on behavior/appearance
    if ghostModel:FindFirstChild("Humanoid") then
        local humanoid = ghostModel.Humanoid
        if humanoid.WalkSpeed > 20 then
            return "Revenant"
        elseif humanoid.Health < 50 then
            return "Shade"
        end
    end
    
    return "Unknown Ghost"
end

-- ESP Creation Functions
local function CreateGhostESP(ghost)
    if not ghost or not ghost:FindFirstChild("HumanoidRootPart") then return end
    
    local ghostType = IdentifyGhostType(ghost)
    local ghostData = Config.GhostTypes[ghostType] or {color = Color3.fromRGB(255, 255, 255)}
    
    local esp = {
        Object = ghost,
        Type = "Ghost",
        GhostType = ghostType,
        Drawings = {}
    }
    
    -- Text ESP
    esp.Drawings.Text = CreateDrawing("Text", {
        Text = ghostType,
        Color = ghostData.color,
        Size = Config.ESP.TextSize,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Distance Text
    esp.Drawings.Distance = CreateDrawing("Text", {
        Text = "0m",
        Color = Color3.fromRGB(255, 255, 255),
        Size = Config.ESP.TextSize - 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Box ESP
    if Config.ESP.BoxESP then
        esp.Drawings.Box = CreateDrawing("Square", {
            Color = ghostData.color,
            Thickness = 2,
            Transparency = 0.7,
            Filled = false,
            Visible = false
        })
    end
    
    -- Evidence Text
    if ghostData.evidence then
        esp.Drawings.Evidence = CreateDrawing("Text", {
            Text = table.concat(ghostData.evidence, " | "),
            Color = Config.Colors.Evidence,
            Size = Config.ESP.TextSize - 4,
            Center = true,
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0),
            Font = Drawing.Fonts.Plex,
            Visible = false
        })
    end
    
    ESPObjects[ghost] = esp
end

local function CreateItemESP(item)
    if not item or not item:FindFirstChild("Handle") and not item:FindFirstChildOfClass("Part") then return end
    
    local esp = {
        Object = item,
        Type = "Item",
        Drawings = {}
    }
    
    local itemName = item.Name
    local isImportant = false
    
    -- Check if item is important
    for _, importantItem in pairs(Config.Items) do
        if itemName:find(importantItem) or importantItem:find(itemName) then
            isImportant = true
            break
        end
    end
    
    local color = isImportant and Config.Colors.Important or Config.Colors.Item
    
    -- Text ESP
    esp.Drawings.Text = CreateDrawing("Text", {
        Text = itemName,
        Color = color,
        Size = Config.ESP.TextSize - 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Distance Text
    esp.Drawings.Distance = CreateDrawing("Text", {
        Text = "0m",
        Color = Color3.fromRGB(200, 200, 200),
        Size = Config.ESP.TextSize - 4,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    ESPObjects[item] = esp
end

-- ESP Update Function
local function UpdateESP()
    if not Config.ESP.Enabled then return end
    
    for object, esp in pairs(ESPObjects) do
        if object and object.Parent then
            local part = esp.Type == "Ghost" and object:FindFirstChild("HumanoidRootPart") or 
                        (object:FindFirstChild("Handle") or object:FindFirstChildOfClass("Part"))
            
            if part then
                local distance = GetDistance(part, Camera.CFrame.Position)
                
                if distance <= Config.ESP.MaxDistance then
                    local screenPos, onScreen = WorldToViewportPoint(part.Position)
                    
                    if onScreen then
                        -- Update text position
                        if esp.Drawings.Text then
                            esp.Drawings.Text.Position = Vector2.new(screenPos.X, screenPos.Y - 30)
                            esp.Drawings.Text.Visible = true
                        end
                        
                        -- Update distance
                        if esp.Drawings.Distance and Config.ESP.Distance then
                            esp.Drawings.Distance.Text = math.floor(distance) .. "m"
                            esp.Drawings.Distance.Position = Vector2.new(screenPos.X, screenPos.Y - 10)
                            esp.Drawings.Distance.Visible = true
                        end
                        
                        -- Update evidence text for ghosts
                        if esp.Drawings.Evidence and esp.Type == "Ghost" then
                            esp.Drawings.Evidence.Position = Vector2.new(screenPos.X, screenPos.Y + 10)
                            esp.Drawings.Evidence.Visible = true
                        end
                        
                        -- Update box ESP
                        if esp.Drawings.Box then
                            local size = math.max(2000/distance, 4)
                            esp.Drawings.Box.Size = Vector2.new(size, size * 1.5)
                            esp.Drawings.Box.Position = Vector2.new(screenPos.X - size/2, screenPos.Y - size * 0.75)
                            esp.Drawings.Box.Visible = true
                        end
                    else
                        -- Hide if not on screen
                        for _, drawing in pairs(esp.Drawings) do
                            drawing.Visible = false
                        end
                    end
                else
                    -- Hide if too far
                    for _, drawing in pairs(esp.Drawings) do
                        drawing.Visible = false
                    end
                end
            end
        else
            -- Clean up if object is deleted
            for _, drawing in pairs(esp.Drawings) do
                drawing:Remove()
            end
            ESPObjects[object] = nil
        end
    end
end

-- Object Detection Functions
local function ScanForGhosts()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") then
            if obj.Name:lower():find("ghost") or obj.Name:lower():find("spirit") or 
               obj.Name:lower():find("demon") or obj.Name:lower():find("phantom") then
                if not ESPObjects[obj] and Config.ESP.GhostESP then
                    CreateGhostESP(obj)
                end
            end
        end
    end
end

local function ScanForItems()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("Part") then
            for _, itemName in pairs(Config.Items) do
                if obj.Name:find(itemName) then
                    if not ESPObjects[obj] and Config.ESP.ItemESP then
                        CreateItemESP(obj)
                    end
                    break
                end
            end
        end
    end
end

-- GUI Creation
local function CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DemonologyVIPScript"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ResetOnSpawn = false
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Add corner radius
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = MainFrame
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "DEMONOLOGY VIP PRO"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    
    -- Toggle ESP Button
    local ESPToggle = Instance.new("TextButton")
    ESPToggle.Name = "ESPToggle"
    ESPToggle.Parent = MainFrame
    ESPToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    ESPToggle.Position = UDim2.new(0, 10, 0, 50)
    ESPToggle.Size = UDim2.new(1, -20, 0, 30)
    ESPToggle.Font = Enum.Font.Gotham
    ESPToggle.Text = "ESP: ON"
    ESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPToggle.TextSize = 14
    
    local ESPCorner = Instance.new("UICorner")
    ESPCorner.CornerRadius = UDim.new(0, 5)
    ESPCorner.Parent = ESPToggle
    
    ESPToggle.MouseButton1Click:Connect(function()
        Config.ESP.Enabled = not Config.ESP.Enabled
        ESPToggle.Text = "ESP: " .. (Config.ESP.Enabled and "ON" or "OFF")
        ESPToggle.BackgroundColor3 = Config.ESP.Enabled and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
        
        if not Config.ESP.Enabled then
            for _, esp in pairs(ESPObjects) do
                for _, drawing in pairs(esp.Drawings) do
                    drawing.Visible = false
                end
            end
        end
    end)
    
    -- Ghost ESP Toggle
    local GhostESPToggle = Instance.new("TextButton")
    GhostESPToggle.Name = "GhostESPToggle"
    GhostESPToggle.Parent = MainFrame
    GhostESPToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    GhostESPToggle.Position = UDim2.new(0, 10, 0, 90)
    GhostESPToggle.Size = UDim2.new(1, -20, 0, 30)
    GhostESPToggle.Font = Enum.Font.Gotham
    GhostESPToggle.Text = "Ghost ESP: ON"
    GhostESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    GhostESPToggle.TextSize = 14
    
    local GhostESPCorner = Instance.new("UICorner")
    GhostESPCorner.CornerRadius = UDim.new(0, 5)
    GhostESPCorner.Parent = GhostESPToggle
    
    GhostESPToggle.MouseButton1Click:Connect(function()
        Config.ESP.GhostESP = not Config.ESP.GhostESP
        GhostESPToggle.Text = "Ghost ESP: " .. (Config.ESP.GhostESP and "ON" or "OFF")
        GhostESPToggle.BackgroundColor3 = Config.ESP.GhostESP and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
    end)
    
    -- Item ESP Toggle
    local ItemESPToggle = Instance.new("TextButton")
    ItemESPToggle.Name = "ItemESPToggle"
    ItemESPToggle.Parent = MainFrame
    ItemESPToggle.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    ItemESPToggle.Position = UDim2.new(0, 10, 0, 130)
    ItemESPToggle.Size = UDim2.new(1, -20, 0, 30)
    ItemESPToggle.Font = Enum.Font.Gotham
    ItemESPToggle.Text = "Item ESP: ON"
    ItemESPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    ItemESPToggle.TextSize = 14
    
    local ItemESPCorner = Instance.new("UICorner")
    ItemESPCorner.CornerRadius = UDim.new(0, 5)
    ItemESPCorner.Parent = ItemESPToggle
    
    ItemESPToggle.MouseButton1Click:Connect(function()
        Config.ESP.ItemESP = not Config.ESP.ItemESP
        ItemESPToggle.Text = "Item ESP: " .. (Config.ESP.ItemESP and "ON" or "OFF")
        ItemESPToggle.BackgroundColor3 = Config.ESP.ItemESP and Color3.fromRGB(0, 170, 0) or Color3.fromRGB(170, 0, 0)
    end)
    
    -- Ghost Info Display
    local InfoFrame = Instance.new("ScrollingFrame")
    InfoFrame.Name = "InfoFrame"
    InfoFrame.Parent = MainFrame
    InfoFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    InfoFrame.Position = UDim2.new(0, 10, 0, 170)
    InfoFrame.Size = UDim2.new(1, -20, 1, -180)
    InfoFrame.ScrollBarThickness = 8
    InfoFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
    
    local InfoCorner = Instance.new("UICorner")
    InfoCorner.CornerRadius = UDim.new(0, 5)
    InfoCorner.Parent = InfoFrame
    
    local InfoLayout = Instance.new("UIListLayout")
    InfoLayout.Parent = InfoFrame
    InfoLayout.SortOrder = Enum.SortOrder.LayoutOrder
    InfoLayout.Padding = UDim.new(0, 5)
    
    -- Update ghost info
    spawn(function()
        while wait(1) do
            for child in pairs(InfoFrame:GetChildren()) do
                if child:IsA("TextLabel") then
                    child:Destroy()
                end
            end
            
            for object, esp in pairs(ESPObjects) do
                if esp.Type == "Ghost" and object and object.Parent then
                    local infoLabel = Instance.new("TextLabel")
                    infoLabel.Parent = InfoFrame
                    infoLabel.BackgroundTransparency = 1
                    infoLabel.Size = UDim2.new(1, 0, 0, 60)
                    infoLabel.Font = Enum.Font.Gotham
                    infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    infoLabel.TextSize = 12
                    infoLabel.TextYAlignment = Enum.TextYAlignment.Top
                    infoLabel.TextXAlignment = Enum.TextXAlignment.Left
                    
                    local part = object:FindFirstChild("HumanoidRootPart")
                    local distance = part and GetDistance(part, Camera.CFrame.Position) or "Unknown"
                    
                    infoLabel.Text = string.format("%s\nDistance: %sm\nEvidence: %s", 
                        esp.GhostType or "Unknown",
                        type(distance) == "number" and math.floor(distance) or distance,
                        Config.GhostTypes[esp.GhostType] and table.concat(Config.GhostTypes[esp.GhostType].evidence, ", ") or "Unknown"
                    )
                end
            end
            
            InfoFrame.CanvasSize = UDim2.new(0, 0, 0, InfoLayout.AbsoluteContentSize.Y)
        end
    end)
end

-- Initialize Script
local function Initialize()
    print("🔥 DEMONOLOGY VIP PRO SCRIPT LOADED 🔥")
    print("✅ Ghost Detection: ACTIVE")
    print("✅ Item ESP: ACTIVE")
    print("✅ Professional UI: LOADED")
    
    CreateGUI()
    
    -- Main update loop
    Connections.UpdateESP = RunService.Heartbeat:Connect(UpdateESP)
    
    -- Scan for objects every 2 seconds
    Connections.Scanner = RunService.Heartbeat:Connect(function()
        if tick() % 2 < 0.1 then -- Every 2 seconds approximately
            ScanForGhosts()
            ScanForItems()
        end
    end)
    
    -- Handle new objects
    Connections.ChildAdded = Workspace.DescendantAdded:Connect(function(obj)
        wait(0.1) -- Small delay to ensure object is fully loaded
        
        -- Check for ghosts
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and Config.ESP.GhostESP then
            if obj.Name:lower():find("ghost") or obj.Name:lower():find("spirit") or 
               obj.Name:lower():find("demon") or obj.Name:lower():find("phantom") then
                CreateGhostESP(obj)
            end
        end
        
        -- Check for items
        if Config.ESP.ItemESP then
            for _, itemName in pairs(Config.Items) do
                if obj.Name:find(itemName) then
                    CreateItemESP(obj)
                    break
                end
            end
        end
    end)
    
    -- Clean up on object removal
    Connections.ChildRemoved = Workspace.DescendantRemoving:Connect(function(obj)
        if ESPObjects[obj] then
            for _, drawing in pairs(ESPObjects[obj].Drawings) do
                drawing:Remove()
            end
            ESPObjects[obj] = nil
        end
    end)
end

-- Anti-Detection Features
local function AntiDetection()
    -- Hide script from basic detection methods
    local mt = getrawmetatable(game)
    local old_namecall = mt.__namecall
    
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        if method == "FireServer" or method == "InvokeServer" then
            -- Block potential detection calls
            if args[1] and type(args[1]) == "string" then
                if args[1]:lower():find("exploit") or args[1]:lower():find("cheat") or args[1]:lower():find("hack") then
                    return
                end
            end
        end
        
        return old_namecall(self, ...)
    end)
    setreadonly(mt, true)
end

-- Start the script
AntiDetection()
Initialize()

-- Key bindings
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F then
        Config.ESP.Enabled = not Config.ESP.Enabled
        print("ESP toggled:", Config.ESP.Enabled and "ON" or "OFF")
    elseif input.KeyCode == Enum.KeyCode.G then
        Config.ESP.GhostESP = not Config.ESP.GhostESP
        print("Ghost ESP toggled:", Config.ESP.GhostESP and "ON" or "OFF")
    elseif input.KeyCode == Enum.KeyCode.H then
        Config.ESP.ItemESP = not Config.ESP.ItemESP
        print("Item ESP toggled:", Config.ESP.ItemESP and "ON" or "OFF")
    end
end)

print("🎮 CONTROLS:")
print("F - Toggle ESP")
print("G - Toggle Ghost ESP")
print("H - Toggle Item ESP")
print("💀 Happy Ghost Hunting! 💀")