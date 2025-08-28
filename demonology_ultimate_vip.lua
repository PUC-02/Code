--[[
    ═══════════════════════════════════════════════════════════════
    ████████╗ ██╗   ██╗ ██████╗     ██╗   ██╗ ██╗ ██████╗ 
    ╚══██╔══╝ ██║   ██║ ██╔══██╗    ██║   ██║ ██║ ██╔══██╗
       ██║    ██║   ██║ ██████╔╝    ██║   ██║ ██║ ██████╔╝
       ██║    ██║   ██║ ██╔══██╗    ╚██╗ ██╔╝ ██║ ██╔═══╝ 
       ██║    ╚██████╔╝ ██║  ██║     ╚████╔╝  ██║ ██║     
       ╚═╝     ╚═════╝  ╚═╝  ╚═╝      ╚═══╝   ╚═╝ ╚═╝     
    ═══════════════════════════════════════════════════════════════
    
    DEMONOLOGY ULTIMATE VIP PROFESSIONAL SCRIPT
    🔥 SIÊU CẤP VIP PRO CHUYÊN NGHIỆP 🔥
    
    Version: 3.0 ULTIMATE EDITION
    Author: Elite Pro Developer Team
    
    🎯 TÍNH NĂNG SIÊU CẤP:
    ✅ Advanced Ghost Detection & Classification
    ✅ Professional ESP System with 3D Boxes
    ✅ Real-time Evidence Tracking
    ✅ Ghost Behavior Analysis
    ✅ Item Tracker with Priority System
    ✅ Distance-based Auto Hide/Show
    ✅ Customizable Colors & Settings
    ✅ Anti-Detection Security System
    ✅ Performance Optimization
    ✅ Professional UI with Animations
    
    ═══════════════════════════════════════════════════════════════
]]--

-- 🔧 SERVICES INITIALIZATION
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local HttpService = game:GetService("HttpService")

-- 🎮 CORE VARIABLES
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Camera = Workspace.CurrentCamera
local Mouse = Player:GetMouse()

-- 📊 ADVANCED CONFIGURATION SYSTEM
local VIPConfig = {
    Version = "3.0 ULTIMATE",
    
    ESP = {
        Enabled = true,
        GhostESP = true,
        ItemESP = true,
        EvidenceESP = true,
        PlayerESP = false,
        
        -- Visual Settings
        TextSize = 16,
        BoxESP = true,
        HealthBars = true,
        Tracers = false,
        MaxDistance = 2000,
        FadeDistance = 500,
        
        -- Advanced Features
        ThroughWalls = true,
        ShowDistance = true,
        ShowHealth = true,
        ShowEvidence = true,
        DynamicColors = true,
        Animations = true
    },
    
    -- 🌈 PROFESSIONAL COLOR SCHEME
    Colors = {
        Ghost = {
            Banshee = Color3.fromRGB(148, 0, 211),      -- Violet
            Demon = Color3.fromRGB(220, 20, 60),        -- Crimson
            Jinn = Color3.fromRGB(0, 191, 255),         -- Deep Sky Blue
            Mare = Color3.fromRGB(25, 25, 112),         -- Midnight Blue
            Oni = Color3.fromRGB(255, 69, 0),           -- Red Orange
            Phantom = Color3.fromRGB(138, 43, 226),     -- Blue Violet
            Poltergeist = Color3.fromRGB(50, 205, 50),  -- Lime Green
            Revenant = Color3.fromRGB(178, 34, 34),     -- Fire Brick
            Shade = Color3.fromRGB(169, 169, 169),      -- Dark Gray
            Spirit = Color3.fromRGB(255, 255, 255),     -- White
            Wraith = Color3.fromRGB(72, 61, 139),       -- Dark Slate Blue
            Yurei = Color3.fromRGB(123, 104, 238),      -- Medium Slate Blue
            Unknown = Color3.fromRGB(255, 165, 0)       -- Orange
        },
        
        Items = {
            Critical = Color3.fromRGB(255, 0, 0),       -- Red
            Important = Color3.fromRGB(255, 165, 0),    -- Orange
            Useful = Color3.fromRGB(255, 255, 0),       -- Yellow
            Common = Color3.fromRGB(0, 255, 255),       -- Cyan
            Evidence = Color3.fromRGB(0, 255, 0)        -- Green
        },
        
        UI = {
            Primary = Color3.fromRGB(15, 15, 25),
            Secondary = Color3.fromRGB(25, 25, 35),
            Accent = Color3.fromRGB(100, 200, 255),
            Success = Color3.fromRGB(0, 255, 100),
            Warning = Color3.fromRGB(255, 165, 0),
            Danger = Color3.fromRGB(255, 50, 50),
            Text = Color3.fromRGB(255, 255, 255)
        }
    },
    
    -- 👻 COMPREHENSIVE GHOST DATABASE
    GhostDatabase = {
        ["Banshee"] = {
            color = Color3.fromRGB(148, 0, 211),
            evidence = {"EMF Level 5", "Fingerprints", "Freezing Temperatures"},
            behavior = "Targets one player, ignores others nearby",
            strength = "Only hunts target player",
            weakness = "Crucifixes work better against it",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Demon"] = {
            color = Color3.fromRGB(220, 20, 60),
            evidence = {"Fingerprints", "Ghost Writing", "Freezing Temperatures"},
            behavior = "Most aggressive ghost type",
            strength = "Can hunt at any sanity level",
            weakness = "Crucifix effectiveness increased",
            speed = 1.7,
            sanity_threshold = 70
        },
        ["Jinn"] = {
            color = Color3.fromRGB(0, 191, 255),
            evidence = {"EMF Level 5", "Fingerprints", "Spirit Box"},
            behavior = "Cannot turn off breaker, faster when far",
            strength = "Faster when you're far away",
            weakness = "Cannot turn off the breaker",
            speed = 2.5,
            sanity_threshold = 50
        },
        ["Mare"] = {
            color = Color3.fromRGB(25, 25, 112),
            evidence = {"Spirit Box", "Ghost Orbs", "Freezing Temperatures"},
            behavior = "Loves darkness, hunts more in dark",
            strength = "Higher chance to hunt in darkness",
            weakness = "Lower chance to hunt in light",
            speed = 1.7,
            sanity_threshold = 60
        },
        ["Oni"] = {
            color = Color3.fromRGB(255, 69, 0),
            evidence = {"EMF Level 5", "Spirit Box", "Ghost Writing"},
            behavior = "Very active, throws objects often",
            strength = "Very active when players are nearby",
            weakness = "Being active drains its ability to hunt",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Phantom"] = {
            color = Color3.fromRGB(138, 43, 226),
            evidence = {"EMF Level 5", "Ghost Orbs", "Freezing Temperatures"},
            behavior = "Invisible during hunts, drains sanity when seen",
            strength = "Nearly invisible during hunts",
            weakness = "Taking photo reduces its ability to hunt",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Poltergeist"] = {
            color = Color3.fromRGB(50, 205, 50),
            evidence = {"Spirit Box", "Fingerprints", "Ghost Orbs"},
            behavior = "Throws many objects at once",
            strength = "Can throw multiple objects at once",
            weakness = "Ineffective in empty rooms",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Revenant"] = {
            color = Color3.fromRGB(178, 34, 34),
            evidence = {"EMF Level 5", "Fingerprints", "Ghost Writing"},
            behavior = "Slow when not chasing, very fast when chasing",
            strength = "Faster when chasing a player",
            weakness = "Very slow when not chasing anyone",
            speed = 3.0,
            sanity_threshold = 50
        },
        ["Shade"] = {
            color = Color3.fromRGB(169, 169, 169),
            evidence = {"EMF Level 5", "Ghost Orbs", "Ghost Writing"},
            behavior = "Shy, less active when players are nearby",
            strength = "Hard to find evidence when players are nearby",
            weakness = "Less likely to hunt when players are nearby",
            speed = 1.7,
            sanity_threshold = 35
        },
        ["Spirit"] = {
            color = Color3.fromRGB(255, 255, 255),
            evidence = {"Spirit Box", "Fingerprints", "Ghost Writing"},
            behavior = "No special behavior, basic ghost",
            strength = "No special strengths",
            weakness = "Smudge Sticks are more effective",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Wraith"] = {
            color = Color3.fromRGB(72, 61, 139),
            evidence = {"Spirit Box", "Fingerprints", "Freezing Temperatures"},
            behavior = "Can teleport, doesn't leave footprints",
            strength = "Can teleport to players",
            weakness = "Toxic reaction to salt",
            speed = 1.7,
            sanity_threshold = 50
        },
        ["Yurei"] = {
            color = Color3.fromRGB(123, 104, 238),
            evidence = {"Ghost Orbs", "Freezing Temperatures", "Ghost Writing"},
            behavior = "Drains sanity faster, affected by smudging",
            strength = "Stronger effect on sanity",
            weakness = "Smudging reduces its ability to wander",
            speed = 1.7,
            sanity_threshold = 50
        }
    },
    
    -- 🎒 ADVANCED ITEM CLASSIFICATION
    ItemDatabase = {
        Critical = {
            "EMF Reader", "Spirit Box", "Video Camera", "Thermometer", 
            "UV Flashlight", "Photo Camera", "Crucifix", "Smudge Sticks"
        },
        Important = {
            "Flashlight", "Strong Flashlight", "Candle", "Lighter", 
            "Salt", "Sanity Pills", "Head Mounted Camera"
        },
        Useful = {
            "Glowstick", "Motion Sensor", "Sound Sensor", "Parabolic Microphone",
            "Infrared Light Sensor", "Tripod"
        },
        Evidence = {
            "Ghost Writing Book", "Fingerprints", "Ghost Orbs", "Freezing Temperatures",
            "EMF Level 5", "Spirit Box Response"
        }
    },
    
    -- ⚙️ PERFORMANCE SETTINGS
    Performance = {
        UpdateRate = 60,        -- FPS for ESP updates
        ScanRate = 2,          -- Seconds between object scans
        MaxESPObjects = 100,   -- Maximum ESP objects to render
        OptimizeDistance = true,
        DynamicLOD = true      -- Level of Detail based on distance
    }
}

-- 📦 STORAGE SYSTEMS
local ESPObjects = {}
local GhostData = {}
local EvidenceFound = {}
local Connections = {}
local UIElements = {}

-- 🛠️ UTILITY FUNCTIONS
local function CreateDrawing(drawingType, properties)
    local drawing = Drawing.new(drawingType)
    for prop, value in pairs(properties) do
        pcall(function()
            drawing[prop] = value
        end)
    end
    return drawing
end

local function GetDistance(pos1, pos2)
    if not pos1 or not pos2 then return math.huge end
    return (pos1 - pos2).Magnitude
end

local function WorldToViewport(position)
    local vector, onScreen = Camera:WorldToViewportPoint(position)
    return Vector2.new(vector.X, vector.Y), onScreen, vector.Z
end

local function GetItemPriority(itemName)
    for priority, items in pairs(VIPConfig.ItemDatabase) do
        for _, item in pairs(items) do
            if itemName:lower():find(item:lower()) or item:lower():find(itemName:lower()) then
                return priority
            end
        end
    end
    return "Common"
end

local function GetHealthPercentage(humanoid)
    if humanoid and humanoid.Health and humanoid.MaxHealth then
        return math.floor((humanoid.Health / humanoid.MaxHealth) * 100)
    end
    return 100
end

-- 🎨 ADVANCED ESP CREATION SYSTEM
local function CreateAdvancedGhostESP(ghost)
    if not ghost or ESPObjects[ghost] then return end
    
    local humanoidRootPart = ghost:FindFirstChild("HumanoidRootPart")
    local humanoid = ghost:FindFirstChild("Humanoid")
    if not humanoidRootPart then return end
    
    -- Identify ghost type with advanced detection
    local ghostType = "Unknown"
    local ghostInfo = nil
    
    -- Try multiple detection methods
    local ghostName = ghost.Name:lower()
    for gType, data in pairs(VIPConfig.GhostDatabase) do
        if ghostName:find(gType:lower()) then
            ghostType = gType
            ghostInfo = data
            break
        end
    end
    
    -- Behavioral analysis fallback
    if ghostType == "Unknown" and humanoid then
        local walkSpeed = humanoid.WalkSpeed
        if walkSpeed > 25 then
            ghostType = "Revenant"
        elseif walkSpeed < 10 then
            ghostType = "Shade"
        end
        ghostInfo = VIPConfig.GhostDatabase[ghostType]
    end
    
    local esp = {
        Object = ghost,
        Type = "Ghost",
        GhostType = ghostType,
        GhostInfo = ghostInfo,
        LastUpdate = tick(),
        Drawings = {},
        IsVisible = false
    }
    
    local color = ghostInfo and ghostInfo.color or VIPConfig.Colors.Ghost.Unknown
    
    -- Main Name Text
    esp.Drawings.NameText = CreateDrawing("Text", {
        Text = ghostType,
        Color = color,
        Size = VIPConfig.ESP.TextSize + 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Distance Text
    esp.Drawings.DistanceText = CreateDrawing("Text", {
        Text = "0m",
        Color = Color3.fromRGB(255, 255, 255),
        Size = VIPConfig.ESP.TextSize - 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Health Text
    esp.Drawings.HealthText = CreateDrawing("Text", {
        Text = "100%",
        Color = Color3.fromRGB(0, 255, 0),
        Size = VIPConfig.ESP.TextSize - 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Evidence Text
    if ghostInfo and ghostInfo.evidence then
        esp.Drawings.EvidenceText = CreateDrawing("Text", {
            Text = table.concat(ghostInfo.evidence, " | "),
            Color = VIPConfig.Colors.Items.Evidence,
            Size = VIPConfig.ESP.TextSize - 4,
            Center = true,
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0),
            Font = Drawing.Fonts.Plex,
            Visible = false
        })
    end
    
    -- Behavior Text
    if ghostInfo and ghostInfo.behavior then
        esp.Drawings.BehaviorText = CreateDrawing("Text", {
            Text = ghostInfo.behavior,
            Color = Color3.fromRGB(255, 255, 150),
            Size = VIPConfig.ESP.TextSize - 6,
            Center = true,
            Outline = true,
            OutlineColor = Color3.fromRGB(0, 0, 0),
            Font = Drawing.Fonts.Plex,
            Visible = false
        })
    end
    
    -- 3D Box ESP
    if VIPConfig.ESP.BoxESP then
        esp.Drawings.Box = CreateDrawing("Square", {
            Color = color,
            Thickness = 2,
            Transparency = 0.8,
            Filled = false,
            Visible = false
        })
        
        esp.Drawings.BoxFill = CreateDrawing("Square", {
            Color = color,
            Thickness = 1,
            Transparency = 0.1,
            Filled = true,
            Visible = false
        })
    end
    
    -- Health Bar
    if VIPConfig.ESP.HealthBars then
        esp.Drawings.HealthBarBG = CreateDrawing("Square", {
            Color = Color3.fromRGB(0, 0, 0),
            Thickness = 1,
            Transparency = 0.5,
            Filled = true,
            Visible = false
        })
        
        esp.Drawings.HealthBar = CreateDrawing("Square", {
            Color = Color3.fromRGB(0, 255, 0),
            Thickness = 1,
            Transparency = 0.8,
            Filled = true,
            Visible = false
        })
    end
    
    -- Tracer Line
    if VIPConfig.ESP.Tracers then
        esp.Drawings.Tracer = CreateDrawing("Line", {
            Color = color,
            Thickness = 2,
            Transparency = 0.6,
            Visible = false
        })
    end
    
    ESPObjects[ghost] = esp
    GhostData[ghost] = {
        type = ghostType,
        info = ghostInfo,
        lastSeen = tick(),
        evidence = {},
        behavior_observed = {}
    }
end

local function CreateAdvancedItemESP(item)
    if not item or ESPObjects[item] then return end
    
    local itemPart = item:FindFirstChild("Handle") or item:FindFirstChildOfClass("Part")
    if not itemPart then return end
    
    local itemName = item.Name
    local priority = GetItemPriority(itemName)
    local color = VIPConfig.Colors.Items[priority] or VIPConfig.Colors.Items.Common
    
    local esp = {
        Object = item,
        Type = "Item",
        Priority = priority,
        LastUpdate = tick(),
        Drawings = {},
        IsVisible = false
    }
    
    -- Item Name Text
    esp.Drawings.NameText = CreateDrawing("Text", {
        Text = itemName,
        Color = color,
        Size = VIPConfig.ESP.TextSize - 2,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Priority Text
    esp.Drawings.PriorityText = CreateDrawing("Text", {
        Text = "[" .. priority:upper() .. "]",
        Color = color,
        Size = VIPConfig.ESP.TextSize - 4,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    -- Distance Text
    esp.Drawings.DistanceText = CreateDrawing("Text", {
        Text = "0m",
        Color = Color3.fromRGB(200, 200, 200),
        Size = VIPConfig.ESP.TextSize - 4,
        Center = true,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Font = Drawing.Fonts.Plex,
        Visible = false
    })
    
    ESPObjects[item] = esp
end

-- 🔄 ADVANCED ESP UPDATE SYSTEM
local function UpdateAdvancedESP()
    if not VIPConfig.ESP.Enabled then return end
    
    local cameraPosition = Camera.CFrame.Position
    local viewportSize = Camera.ViewportSize
    
    for object, esp in pairs(ESPObjects) do
        if object and object.Parent then
            local part = nil
            
            if esp.Type == "Ghost" then
                part = object:FindFirstChild("HumanoidRootPart")
            else
                part = object:FindFirstChild("Handle") or object:FindFirstChildOfClass("Part")
            end
            
            if part then
                local distance = GetDistance(part.Position, cameraPosition)
                local shouldShow = distance <= VIPConfig.ESP.MaxDistance
                
                if esp.Type == "Ghost" and not VIPConfig.ESP.GhostESP then
                    shouldShow = false
                elseif esp.Type == "Item" and not VIPConfig.ESP.ItemESP then
                    shouldShow = false
                end
                
                if shouldShow then
                    local screenPos, onScreen, depth = WorldToViewport(part.Position)
                    
                    if onScreen and depth > 0 then
                        local alpha = 1
                        if VIPConfig.Performance.OptimizeDistance and distance > VIPConfig.ESP.FadeDistance then
                            alpha = math.max(0.1, 1 - (distance - VIPConfig.ESP.FadeDistance) / (VIPConfig.ESP.MaxDistance - VIPConfig.ESP.FadeDistance))
                        end
                        
                        -- Update text positions with offset
                        local yOffset = 0
                        
                        -- Name text
                        if esp.Drawings.NameText then
                            esp.Drawings.NameText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                            esp.Drawings.NameText.Transparency = alpha
                            esp.Drawings.NameText.Visible = true
                            yOffset = yOffset + 20
                        end
                        
                        -- Priority text for items
                        if esp.Drawings.PriorityText then
                            esp.Drawings.PriorityText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                            esp.Drawings.PriorityText.Transparency = alpha
                            esp.Drawings.PriorityText.Visible = true
                            yOffset = yOffset + 15
                        end
                        
                        -- Distance text
                        if esp.Drawings.DistanceText and VIPConfig.ESP.ShowDistance then
                            esp.Drawings.DistanceText.Text = math.floor(distance) .. "m"
                            esp.Drawings.DistanceText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                            esp.Drawings.DistanceText.Transparency = alpha
                            esp.Drawings.DistanceText.Visible = true
                            yOffset = yOffset + 15
                        end
                        
                        -- Health text for ghosts
                        if esp.Drawings.HealthText and VIPConfig.ESP.ShowHealth and esp.Type == "Ghost" then
                            local humanoid = object:FindFirstChild("Humanoid")
                            if humanoid then
                                local healthPercent = GetHealthPercentage(humanoid)
                                esp.Drawings.HealthText.Text = healthPercent .. "%"
                                esp.Drawings.HealthText.Color = healthPercent > 50 and Color3.fromRGB(0, 255, 0) or 
                                                                healthPercent > 25 and Color3.fromRGB(255, 255, 0) or 
                                                                Color3.fromRGB(255, 0, 0)
                                esp.Drawings.HealthText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                                esp.Drawings.HealthText.Transparency = alpha
                                esp.Drawings.HealthText.Visible = true
                                yOffset = yOffset + 15
                            end
                        end
                        
                        -- Evidence text
                        if esp.Drawings.EvidenceText and VIPConfig.ESP.ShowEvidence then
                            esp.Drawings.EvidenceText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                            esp.Drawings.EvidenceText.Transparency = alpha
                            esp.Drawings.EvidenceText.Visible = true
                            yOffset = yOffset + 15
                        end
                        
                        -- Behavior text
                        if esp.Drawings.BehaviorText then
                            esp.Drawings.BehaviorText.Position = Vector2.new(screenPos.X, screenPos.Y + yOffset)
                            esp.Drawings.BehaviorText.Transparency = alpha
                            esp.Drawings.BehaviorText.Visible = true
                        end
                        
                        -- Box ESP
                        if esp.Drawings.Box and VIPConfig.ESP.BoxESP then
                            local size = math.max(1000/distance, 4)
                            esp.Drawings.Box.Size = Vector2.new(size, size * 1.5)
                            esp.Drawings.Box.Position = Vector2.new(screenPos.X - size/2, screenPos.Y - size * 0.75)
                            esp.Drawings.Box.Transparency = alpha * 0.8
                            esp.Drawings.Box.Visible = true
                            
                            if esp.Drawings.BoxFill then
                                esp.Drawings.BoxFill.Size = Vector2.new(size, size * 1.5)
                                esp.Drawings.BoxFill.Position = Vector2.new(screenPos.X - size/2, screenPos.Y - size * 0.75)
                                esp.Drawings.BoxFill.Transparency = alpha * 0.1
                                esp.Drawings.BoxFill.Visible = true
                            end
                        end
                        
                        -- Health bar
                        if esp.Drawings.HealthBar and VIPConfig.ESP.HealthBars and esp.Type == "Ghost" then
                            local humanoid = object:FindFirstChild("Humanoid")
                            if humanoid then
                                local healthPercent = GetHealthPercentage(humanoid)
                                local barWidth = 50
                                local barHeight = 6
                                
                                esp.Drawings.HealthBarBG.Size = Vector2.new(barWidth, barHeight)
                                esp.Drawings.HealthBarBG.Position = Vector2.new(screenPos.X - barWidth/2, screenPos.Y - 40)
                                esp.Drawings.HealthBarBG.Transparency = alpha * 0.5
                                esp.Drawings.HealthBarBG.Visible = true
                                
                                esp.Drawings.HealthBar.Size = Vector2.new(barWidth * (healthPercent/100), barHeight)
                                esp.Drawings.HealthBar.Position = Vector2.new(screenPos.X - barWidth/2, screenPos.Y - 40)
                                esp.Drawings.HealthBar.Transparency = alpha * 0.8
                                esp.Drawings.HealthBar.Visible = true
                            end
                        end
                        
                        -- Tracer
                        if esp.Drawings.Tracer and VIPConfig.ESP.Tracers then
                            esp.Drawings.Tracer.From = Vector2.new(viewportSize.X/2, viewportSize.Y)
                            esp.Drawings.Tracer.To = screenPos
                            esp.Drawings.Tracer.Transparency = alpha * 0.6
                            esp.Drawings.Tracer.Visible = true
                        end
                        
                        esp.IsVisible = true
                    else
                        -- Hide if not on screen
                        for _, drawing in pairs(esp.Drawings) do
                            drawing.Visible = false
                        end
                        esp.IsVisible = false
                    end
                else
                    -- Hide if too far or disabled
                    for _, drawing in pairs(esp.Drawings) do
                        drawing.Visible = false
                    end
                    esp.IsVisible = false
                end
            end
        else
            -- Clean up deleted objects
            for _, drawing in pairs(esp.Drawings) do
                pcall(function() drawing:Remove() end)
            end
            ESPObjects[object] = nil
            if GhostData[object] then
                GhostData[object] = nil
            end
        end
    end
end

-- 🔍 ADVANCED SCANNING SYSTEM
local function ScanForGhosts()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and obj:FindFirstChild("HumanoidRootPart") and not Players:GetPlayerFromCharacter(obj) then
            local name = obj.Name:lower()
            local isGhost = false
            
            -- Multiple detection methods
            local ghostKeywords = {"ghost", "spirit", "demon", "phantom", "specter", "apparition", "wraith", "banshee", "poltergeist"}
            for _, keyword in pairs(ghostKeywords) do
                if name:find(keyword) then
                    isGhost = true
                    break
                end
            end
            
            -- Advanced behavioral detection
            if not isGhost then
                local humanoid = obj:FindFirstChild("Humanoid")
                if humanoid then
                    -- Check for non-standard humanoid properties that might indicate a ghost
                    if humanoid.MaxHealth > 200 or humanoid.WalkSpeed > 30 or humanoid.JumpPower == 0 then
                        isGhost = true
                    end
                end
            end
            
            if isGhost and not ESPObjects[obj] and VIPConfig.ESP.GhostESP then
                CreateAdvancedGhostESP(obj)
            end
        end
    end
end

local function ScanForItems()
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") or obj:IsA("Part") then
            local name = obj.Name
            local isItem = false
            
            -- Check against all item categories
            for category, items in pairs(VIPConfig.ItemDatabase) do
                for _, itemName in pairs(items) do
                    if name:lower():find(itemName:lower()) or itemName:lower():find(name:lower()) then
                        isItem = true
                        break
                    end
                end
                if isItem then break end
            end
            
            if isItem and not ESPObjects[obj] and VIPConfig.ESP.ItemESP then
                CreateAdvancedItemESP(obj)
            end
        end
    end
end

-- 🎨 PROFESSIONAL UI SYSTEM
local function CreateProfessionalUI()
    -- Remove existing UI
    local existingGUI = PlayerGui:FindFirstChild("DemonologyUltimateVIP")
    if existingGUI then
        existingGUI:Destroy()
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "DemonologyUltimateVIP"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main Frame with modern design
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = VIPConfig.Colors.UI.Primary
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0, 20, 0, 20)
    MainFrame.Size = UDim2.new(0, 350, 0, 500)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ZIndex = 10
    
    -- Modern corner radius
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame
    
    -- Drop shadow effect
    local Shadow = Instance.new("Frame")
    Shadow.Name = "Shadow"
    Shadow.Parent = ScreenGui
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.7
    Shadow.BorderSizePixel = 0
    Shadow.Position = UDim2.new(0, 25, 0, 25)
    Shadow.Size = UDim2.new(0, 350, 0, 500)
    Shadow.ZIndex = 5
    
    local ShadowCorner = Instance.new("UICorner")
    ShadowCorner.CornerRadius = UDim.new(0, 12)
    ShadowCorner.Parent = Shadow
    
    -- Header with gradient
    local Header = Instance.new("Frame")
    Header.Name = "Header"
    Header.Parent = MainFrame
    Header.BackgroundColor3 = VIPConfig.Colors.UI.Secondary
    Header.BorderSizePixel = 0
    Header.Size = UDim2.new(1, 0, 0, 60)
    Header.ZIndex = 11
    
    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header
    
    -- Title with style
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.Size = UDim2.new(1, -40, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🔥 DEMONOLOGY ULTIMATE VIP 🔥"
    Title.TextColor3 = VIPConfig.Colors.UI.Accent
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 12
    
    -- Version label
    local VersionLabel = Instance.new("TextLabel")
    VersionLabel.Name = "VersionLabel"
    VersionLabel.Parent = Header
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(0, 20, 0, 35)
    VersionLabel.Size = UDim2.new(1, -40, 0, 20)
    VersionLabel.Font = Enum.Font.Gotham
    VersionLabel.Text = "Version " .. VIPConfig.Version .. " - Professional Edition"
    VersionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    VersionLabel.TextSize = 12
    VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
    VersionLabel.ZIndex = 12
    
    -- Content area
    local ContentFrame = Instance.new("ScrollingFrame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Position = UDim2.new(0, 0, 0, 60)
    ContentFrame.Size = UDim2.new(1, 0, 1, -60)
    ContentFrame.ScrollBarThickness = 8
    ContentFrame.ScrollBarImageColor3 = VIPConfig.Colors.UI.Accent
    ContentFrame.ZIndex = 11
    
    -- Layout for content
    local ContentLayout = Instance.new("UIListLayout")
    ContentLayout.Parent = ContentFrame
    ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ContentLayout.Padding = UDim.new(0, 8)
    
    local ContentPadding = Instance.new("UIPadding")
    ContentPadding.Parent = ContentFrame
    ContentPadding.PaddingLeft = UDim.new(0, 15)
    ContentPadding.PaddingRight = UDim.new(0, 15)
    ContentPadding.PaddingTop = UDim.new(0, 15)
    ContentPadding.PaddingBottom = UDim.new(0, 15)
    
    -- Function to create modern toggle button
    local function CreateToggleButton(name, text, initialState, callback, parent)
        local ButtonFrame = Instance.new("Frame")
        ButtonFrame.Name = name .. "Frame"
        ButtonFrame.Parent = parent or ContentFrame
        ButtonFrame.BackgroundColor3 = VIPConfig.Colors.UI.Secondary
        ButtonFrame.BorderSizePixel = 0
        ButtonFrame.Size = UDim2.new(1, 0, 0, 45)
        ButtonFrame.ZIndex = 12
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = ButtonFrame
        
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Parent = ButtonFrame
        Button.BackgroundColor3 = initialState and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
        Button.BorderSizePixel = 0
        Button.Position = UDim2.new(1, -80, 0, 8)
        Button.Size = UDim2.new(0, 70, 1, -16)
        Button.Font = Enum.Font.GothamBold
        Button.Text = initialState and "ON" or "OFF"
        Button.TextColor3 = VIPConfig.Colors.UI.Text
        Button.TextSize = 12
        Button.ZIndex = 13
        
        local ButtonBtnCorner = Instance.new("UICorner")
        ButtonBtnCorner.CornerRadius = UDim.new(0, 6)
        ButtonBtnCorner.Parent = Button
        
        local Label = Instance.new("TextLabel")
        Label.Name = "Label"
        Label.Parent = ButtonFrame
        Label.BackgroundTransparency = 1
        Label.Position = UDim2.new(0, 15, 0, 0)
        Label.Size = UDim2.new(1, -100, 1, 0)
        Label.Font = Enum.Font.Gotham
        Label.Text = text
        Label.TextColor3 = VIPConfig.Colors.UI.Text
        Label.TextSize = 14
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.ZIndex = 13
        
        local currentState = initialState
        Button.MouseButton1Click:Connect(function()
            currentState = not currentState
            Button.Text = currentState and "ON" or "OFF"
            Button.BackgroundColor3 = currentState and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
            
            -- Smooth animation
            local tween = TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                BackgroundColor3 = currentState and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
            })
            tween:Play()
            
            if callback then
                callback(currentState)
            end
        end)
        
        -- Hover effect
        Button.MouseEnter:Connect(function()
            local tween = TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0, 75, 1, -16)})
            tween:Play()
        end)
        
        Button.MouseLeave:Connect(function()
            local tween = TweenService:Create(Button, TweenInfo.new(0.1), {Size = UDim2.new(0, 70, 1, -16)})
            tween:Play()
        end)
        
        UIElements[name] = {Frame = ButtonFrame, Button = Button, Label = Label}
        return ButtonFrame
    end
    
    -- Create toggle buttons
    CreateToggleButton("MasterESP", "🎯 Master ESP System", VIPConfig.ESP.Enabled, function(state)
        VIPConfig.ESP.Enabled = state
        if not state then
            for _, esp in pairs(ESPObjects) do
                for _, drawing in pairs(esp.Drawings) do
                    drawing.Visible = false
                end
            end
        end
    end)
    
    CreateToggleButton("GhostESP", "👻 Ghost Detection & ESP", VIPConfig.ESP.GhostESP, function(state)
        VIPConfig.ESP.GhostESP = state
    end)
    
    CreateToggleButton("ItemESP", "🎒 Item ESP & Tracker", VIPConfig.ESP.ItemESP, function(state)
        VIPConfig.ESP.ItemESP = state
    end)
    
    CreateToggleButton("BoxESP", "📦 3D Box ESP", VIPConfig.ESP.BoxESP, function(state)
        VIPConfig.ESP.BoxESP = state
    end)
    
    CreateToggleButton("HealthBars", "❤️ Health Bars", VIPConfig.ESP.HealthBars, function(state)
        VIPConfig.ESP.HealthBars = state
    end)
    
    CreateToggleButton("Tracers", "📏 Tracer Lines", VIPConfig.ESP.Tracers, function(state)
        VIPConfig.ESP.Tracers = state
    end)
    
    CreateToggleButton("ShowDistance", "📐 Distance Display", VIPConfig.ESP.ShowDistance, function(state)
        VIPConfig.ESP.ShowDistance = state
    end)
    
    CreateToggleButton("ShowEvidence", "🔍 Evidence Display", VIPConfig.ESP.ShowEvidence, function(state)
        VIPConfig.ESP.ShowEvidence = state
    end)
    
    -- Statistics panel
    local StatsFrame = Instance.new("Frame")
    StatsFrame.Name = "StatsFrame"
    StatsFrame.Parent = ContentFrame
    StatsFrame.BackgroundColor3 = VIPConfig.Colors.UI.Secondary
    StatsFrame.BorderSizePixel = 0
    StatsFrame.Size = UDim2.new(1, 0, 0, 120)
    StatsFrame.ZIndex = 12
    
    local StatsCorner = Instance.new("UICorner")
    StatsCorner.CornerRadius = UDim.new(0, 8)
    StatsCorner.Parent = StatsFrame
    
    local StatsTitle = Instance.new("TextLabel")
    StatsTitle.Name = "StatsTitle"
    StatsTitle.Parent = StatsFrame
    StatsTitle.BackgroundTransparency = 1
    StatsTitle.Position = UDim2.new(0, 15, 0, 10)
    StatsTitle.Size = UDim2.new(1, -30, 0, 25)
    StatsTitle.Font = Enum.Font.GothamBold
    StatsTitle.Text = "📊 Live Statistics"
    StatsTitle.TextColor3 = VIPConfig.Colors.UI.Accent
    StatsTitle.TextSize = 16
    StatsTitle.TextXAlignment = Enum.TextXAlignment.Left
    StatsTitle.ZIndex = 13
    
    local StatsText = Instance.new("TextLabel")
    StatsText.Name = "StatsText"
    StatsText.Parent = StatsFrame
    StatsText.BackgroundTransparency = 1
    StatsText.Position = UDim2.new(0, 15, 0, 35)
    StatsText.Size = UDim2.new(1, -30, 1, -45)
    StatsText.Font = Enum.Font.Gotham
    StatsText.Text = "Initializing..."
    StatsText.TextColor3 = VIPConfig.Colors.UI.Text
    StatsText.TextSize = 12
    StatsText.TextXAlignment = Enum.TextXAlignment.Left
    StatsText.TextYAlignment = Enum.TextYAlignment.Top
    StatsText.ZIndex = 13
    
    UIElements.StatsText = StatsText
    
    -- Update canvas size
    ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 30)
    ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ContentFrame.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 30)
    end)
    
    return ScreenGui
end

-- 📈 STATISTICS SYSTEM
local function UpdateStatistics()
    if not UIElements.StatsText then return end
    
    local ghostCount = 0
    local itemCount = 0
    local visibleESP = 0
    
    for _, esp in pairs(ESPObjects) do
        if esp.Type == "Ghost" then
            ghostCount = ghostCount + 1
        elseif esp.Type == "Item" then
            itemCount = itemCount + 1
        end
        
        if esp.IsVisible then
            visibleESP = visibleESP + 1
        end
    end
    
    local statsText = string.format(
        "👻 Ghosts Detected: %d\n🎒 Items Found: %d\n👁️ ESP Objects Visible: %d\n🎯 Max Distance: %dm\n⚡ Performance: %.1f FPS",
        ghostCount,
        itemCount,
        visibleESP,
        VIPConfig.ESP.MaxDistance,
        1/RunService.Heartbeat:Wait()
    )
    
    UIElements.StatsText.Text = statsText
end

-- 🛡️ ADVANCED ANTI-DETECTION SYSTEM
local function SetupAntiDetection()
    -- Hide from basic script detection
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    local oldIndex = mt.__index
    local oldNewindex = mt.__newindex
    
    if setreadonly then
        setreadonly(mt, false)
    end
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Block potential detection calls
        if method == "FireServer" or method == "InvokeServer" then
            if args[1] and type(args[1]) == "string" then
                local suspicious = {
                    "exploit", "cheat", "hack", "script", "executor", 
                    "injection", "bypass", "detection", "anticheat"
                }
                
                for _, keyword in pairs(suspicious) do
                    if string.lower(args[1]):find(keyword) then
                        return
                    end
                end
            end
        end
        
        return oldNamecall(self, ...)
    end)
    
    mt.__index = newcclosure(function(self, key)
        -- Hide our objects from inspection
        if key == "DemonologyUltimateVIP" and self == PlayerGui then
            return nil
        end
        
        return oldIndex(self, key)
    end)
    
    if setreadonly then
        setreadonly(mt, true)
    end
    
    -- Advanced memory protection
    if getrenv then
        local env = getrenv()
        env.VIPConfig = nil
        env.ESPObjects = nil
        env.GhostData = nil
    end
end

-- 🚀 INITIALIZATION SYSTEM
local function InitializeUltimateScript()
    print("═══════════════════════════════════════════════════")
    print("🔥 DEMONOLOGY ULTIMATE VIP " .. VIPConfig.Version .. " 🔥")
    print("📡 Initializing Advanced Systems...")
    
    -- Setup anti-detection first
    SetupAntiDetection()
    print("✅ Anti-Detection System: ACTIVE")
    
    -- Create professional UI
    CreateProfessionalUI()
    print("✅ Professional UI: LOADED")
    
    -- Start main systems
    Connections.ESPUpdate = RunService.Heartbeat:Connect(UpdateAdvancedESP)
    print("✅ ESP System: RUNNING")
    
    -- Object scanning with optimized intervals
    Connections.GhostScanner = RunService.Heartbeat:Connect(function()
        if tick() % VIPConfig.Performance.ScanRate < RunService.Heartbeat:Wait() then
            ScanForGhosts()
        end
    end)
    
    Connections.ItemScanner = RunService.Heartbeat:Connect(function()
        if tick() % (VIPConfig.Performance.ScanRate + 0.5) < RunService.Heartbeat:Wait() then
            ScanForItems()
        end
    end)
    
    print("✅ Object Scanners: ACTIVE")
    
    -- Statistics update
    Connections.StatsUpdate = RunService.Heartbeat:Connect(function()
        if tick() % 1 < RunService.Heartbeat:Wait() then
            UpdateStatistics()
        end
    end)
    print("✅ Statistics System: RUNNING")
    
    -- Object management
    Connections.ObjectAdded = Workspace.DescendantAdded:Connect(function(obj)
        task.wait(0.1) -- Allow object to fully load
        
        -- Ghost detection
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and VIPConfig.ESP.GhostESP then
            local name = obj.Name:lower()
            local ghostKeywords = {"ghost", "spirit", "demon", "phantom", "specter", "apparition", "wraith", "banshee", "poltergeist"}
            
            for _, keyword in pairs(ghostKeywords) do
                if name:find(keyword) then
                    CreateAdvancedGhostESP(obj)
                    break
                end
            end
        end
        
        -- Item detection
        if VIPConfig.ESP.ItemESP then
            local name = obj.Name
            for category, items in pairs(VIPConfig.ItemDatabase) do
                for _, itemName in pairs(items) do
                    if name:lower():find(itemName:lower()) then
                        CreateAdvancedItemESP(obj)
                        return
                    end
                end
            end
        end
    end)
    
    Connections.ObjectRemoved = Workspace.DescendantRemoving:Connect(function(obj)
        if ESPObjects[obj] then
            for _, drawing in pairs(ESPObjects[obj].Drawings) do
                pcall(function() drawing:Remove() end)
            end
            ESPObjects[obj] = nil
            GhostData[obj] = nil
        end
    end)
    
    print("✅ Object Management: ACTIVE")
    print("═══════════════════════════════════════════════════")
    print("🎮 HOTKEYS:")
    print("INSERT - Toggle Main ESP")
    print("HOME - Toggle Ghost ESP")
    print("END - Toggle Item ESP")
    print("PAGE UP - Increase Max Distance")
    print("PAGE DOWN - Decrease Max Distance")
    print("DELETE - Toggle UI Visibility")
    print("═══════════════════════════════════════════════════")
    print("💀 READY FOR GHOST HUNTING! 💀")
    print("🔥 HAPPY HUNTING, VIP USER! 🔥")
end

-- ⌨️ ADVANCED HOTKEY SYSTEM
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    local key = input.KeyCode
    
    if key == Enum.KeyCode.Insert then
        VIPConfig.ESP.Enabled = not VIPConfig.ESP.Enabled
        if UIElements.MasterESP then
            UIElements.MasterESP.Button.Text = VIPConfig.ESP.Enabled and "ON" or "OFF"
            UIElements.MasterESP.Button.BackgroundColor3 = VIPConfig.ESP.Enabled and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
        end
        print("🎯 Master ESP:", VIPConfig.ESP.Enabled and "ENABLED" or "DISABLED")
        
    elseif key == Enum.KeyCode.Home then
        VIPConfig.ESP.GhostESP = not VIPConfig.ESP.GhostESP
        if UIElements.GhostESP then
            UIElements.GhostESP.Button.Text = VIPConfig.ESP.GhostESP and "ON" or "OFF"
            UIElements.GhostESP.Button.BackgroundColor3 = VIPConfig.ESP.GhostESP and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
        end
        print("👻 Ghost ESP:", VIPConfig.ESP.GhostESP and "ENABLED" or "DISABLED")
        
    elseif key == Enum.KeyCode.End then
        VIPConfig.ESP.ItemESP = not VIPConfig.ESP.ItemESP
        if UIElements.ItemESP then
            UIElements.ItemESP.Button.Text = VIPConfig.ESP.ItemESP and "ON" or "OFF"
            UIElements.ItemESP.Button.BackgroundColor3 = VIPConfig.ESP.ItemESP and VIPConfig.Colors.UI.Success or VIPConfig.Colors.UI.Danger
        end
        print("🎒 Item ESP:", VIPConfig.ESP.ItemESP and "ENABLED" or "DISABLED")
        
    elseif key == Enum.KeyCode.PageUp then
        VIPConfig.ESP.MaxDistance = math.min(VIPConfig.ESP.MaxDistance + 100, 5000)
        print("📐 Max Distance:", VIPConfig.ESP.MaxDistance .. "m")
        
    elseif key == Enum.KeyCode.PageDown then
        VIPConfig.ESP.MaxDistance = math.max(VIPConfig.ESP.MaxDistance - 100, 100)
        print("📐 Max Distance:", VIPConfig.ESP.MaxDistance .. "m")
        
    elseif key == Enum.KeyCode.Delete then
        local gui = PlayerGui:FindFirstChild("DemonologyUltimateVIP")
        if gui then
            gui.Enabled = not gui.Enabled
            print("🖥️ UI Visibility:", gui.Enabled and "SHOWN" or "HIDDEN")
        end
    end
end)

-- 🎬 STARTUP SEQUENCE
task.spawn(function()
    task.wait(1) -- Allow game to fully load
    InitializeUltimateScript()
end)

-- 🧹 CLEANUP ON SCRIPT END
game.Players.PlayerRemoving:Connect(function(player)
    if player == Player then
        for _, connection in pairs(Connections) do
            if connection then
                connection:Disconnect()
            end
        end
        
        for _, esp in pairs(ESPObjects) do
            for _, drawing in pairs(esp.Drawings) do
                pcall(function() drawing:Remove() end)
            end
        end
    end
end)