# Hướng dẫn Scripting cho Game Demonology - Roblox

## Giới thiệu về Game Demonology

**Demonology** là một game horror phổ biến trên Roblox, được phát triển bởi Blaqk Magic Blue. Game này tương tự như Phasmophobia và Demonologist, cho phép người chơi săn ma cùng bạn bè hoặc chơi solo.

### Đặc điểm chính của game:
- **16 loại ma khác nhau** cần nhận diện
- Mỗi ma có **điểm mạnh và điểm yếu** riêng
- Sử dụng **các thiết bị và bằng chứng** để nhận diện ma
- Game mode hỗ trợ **single player và multiplayer**

## Các loại Ma trong Demonology

### 1. Spirit (Linh hồn)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Không có
- **Điểm yếu**: Không có
- **Bằng chứng**: Ghost Writing, Spirit Box, Handprints

### 2. Wraith (Oan hồn)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Hút 0.2% năng lượng của người chơi
- **Điểm yếu**: Tránh muối
- **Bằng chứng**: EMF Level 5, Spirit Box, Laser Projector

### 3. Ghoul (Quỷ ăn thịt)
- **Tốc độ**: Trung bình
- **Điểm mạnh**: Có thể bắt đầu hunt khi dùng Spirit Box
- **Điểm yếu**: Không thể tắt đồ điện tử
- **Bằng chứng**: Freezing Temps, Ghost Orbs, Spirit Box

### 4. Phantom (Bóng ma)
- **Tốc độ**: Nhanh
- **Điểm mạnh**: Di chuyển nhanh giữa các phòng
- **Điểm yếu**: Ít hunt khi có nhóm
- **Bằng chứng**: EMF Level 5, Handprints, Ghost Orbs

### 5. Shadow (Bóng đen)
- **Tốc độ**: Chậm-Nhanh (thay đổi theo ánh sáng)
- **Điểm mạnh**: Thay đổi nhiệt độ thấp
- **Điểm yếu**: Chậm hơn trong phòng sáng
- **Bằng chứng**: EMF Level 5, Ghost Writing, Laser Projector

### 6. Demon (Ác quỷ)
- **Tốc độ**: Trung bình
- **Điểm mạnh**: Hunt thường xuyên, cooldown thấp
- **Điểm yếu**: Không có
- **Bằng chứng**: EMF Level 5, Handprints, Freezing Temps

### 7. Specter (Ma quỷ)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Hay ném đồ vật
- **Điểm yếu**: Không lang thang nhiều
- **Bằng chứng**: EMF Level 5, Freezing Temps, Laser Projection

### 8. Entity (Thực thể)
- **Tốc độ**: Trung bình
- **Điểm mạnh**: Có thể teleport
- **Điểm yếu**: Ít ném đồ vật
- **Bằng chứng**: Spirit Box, Handprints, Laser Projection

### 9. Skinwalker (Quỷ biến hình)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Có thể fake Ghost Orbs
- **Điểm yếu**: Tương tác với đồ vật thường xuyên
- **Bằng chứng**: Freezing Temps, Ghost Writing, Spirit Box

### 10. Banshee (Nữ quỷ)
- **Tốc độ**: Trung bình
- **Điểm mạnh**: Phá kính thường xuyên
- **Điểm yếu**: Không có
- **Bằng chứng**: Ghost Orbs, Handprints, Freezing Temps

### 11. Wendigo (Quỷ đói)
- **Tốc độ**: Trung bình-Nhanh
- **Điểm mạnh**: Hunt gấp đôi tần suất
- **Điểm yếu**: Thích hunt nhóm
- **Bằng chứng**: Ghost Orbs, Ghost Writing, Laser Projection

### 12. Nightmare (Ác mộng)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Gây ảo giác
- **Điểm yếu**: Sợ ánh sáng
- **Bằng chứng**: EMF Level 5, Spirit Box, Ghost Orbs

### 13. Leviathan (Thủy quái)
- **Tốc độ**: Chậm-Trung bình
- **Điểm mạnh**: Tắt đèn, ném nhiều đồ vật
- **Điểm yếu**: Không có
- **Bằng chứng**: Ghost Orbs, Ghost Writing, Handprints

### 14. Oni (Quỷ Nhật)
- **Tốc độ**: Nhanh nhất
- **Điểm mạnh**: Cực kỳ nhanh khi hunt
- **Điểm yếu**: Xuất hiện nhiều trong Laser Projection
- **Bằng chứng**: Spirit Box, Freezing Temps, Laser Projection

### 15. Umbra (Bóng tối)
- **Tốc độ**: Trung bình-Nhanh
- **Điểm mạnh**: Không có tiếng chân
- **Điểm yếu**: Chậm hơn trong phòng sáng
- **Bằng chứng**: Ghost Orbs, Laser Projection, Handprints

### 16. Revenant (Xác sống)
- **Tốc độ**: Trung bình
- **Điểm mạnh**: Cooldown hunt thấp
- **Điểm yếu**: Dừng hunt khi giết được 1 người
- **Bằng chứng**: Ghost Writing, EMF Level 5, Freezing Temps

## Các loại Bằng chứng trong Game

### 1. EMF Level 5
- Phát hiện hoạt động điện từ mạnh
- Sử dụng EMF Reader

### 2. Spirit Box
- Giao tiếp trực tiếp với ma
- Hỏi câu hỏi và nhận phản hồi

### 3. Ghost Orbs
- Phát hiện orbs ma quỷ
- Sử dụng camera hoặc mắt thường

### 4. Handprints
- Dấu vân tay ma quỷ trên cửa sổ/cửa ra vào
- Sử dụng UV Light

### 5. Ghost Writing
- Ma viết trong sổ tay
- Đặt Ghost Writing Book

### 6. Freezing Temps
- Nhiệt độ dưới 0°C
- Sử dụng Thermometer

### 7. Laser Projection
- Phát hiện hình dạng ma
- Sử dụng Laser Projector

## Hướng dẫn Scripting cho Demonology

### 1. Cấu trúc cơ bản của Script

```lua
-- Demonology Helper Script
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Biến toàn cục
local isESPEnabled = false
local isAutoDetectEnabled = false
local detectedGhostType = "Unknown"
```

### 2. Script ESP (Extra Sensory Perception)

```lua
-- ESP Script cho Demonology
local function createESP()
    local function addESP(player)
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP"
            billboard.Adornee = player.Character.HumanoidRootPart
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.Parent = player.Character.HumanoidRootPart
            
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 1
            frame.Parent = billboard
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextScaled = true
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.Parent = frame
            
            local distanceLabel = Instance.new("TextLabel")
            distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
            distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
            distanceLabel.BackgroundTransparency = 1
            distanceLabel.Text = "0 studs"
            distanceLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            distanceLabel.TextScaled = true
            distanceLabel.Font = Enum.Font.SourceSans
            distanceLabel.Parent = frame
            
            -- Cập nhật khoảng cách
            local connection
            connection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
                and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - 
                                    player.Character.HumanoidRootPart.Position).Magnitude
                    distanceLabel.Text = math.floor(distance) .. " studs"
                else
                    connection:Disconnect()
                end
            end)
        end
    end
    
    -- Thêm ESP cho tất cả players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            addESP(player)
        end
    end
    
    -- Thêm ESP cho players mới
    Players.PlayerAdded:Connect(function(player)
        addESP(player)
    end)
end

-- Toggle ESP
local function toggleESP()
    isESPEnabled = not isESPEnabled
    if isESPEnabled then
        createESP()
        print("ESP Enabled")
    else
        -- Xóa ESP
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local esp = player.Character.HumanoidRootPart:FindFirstChild("ESP")
                if esp then
                    esp:Destroy()
                end
            end
        end
        print("ESP Disabled")
    end
end
```

### 3. Script Auto Ghost Detection

```lua
-- Auto Ghost Detection Script
local ghostData = {
    ["Spirit"] = {
        evidence = {"Ghost Writing", "Spirit Box", "Handprints"},
        speed = "Slow-Medium",
        strength = "None",
        weakness = "None"
    },
    ["Wraith"] = {
        evidence = {"EMF Level 5", "Spirit Box", "Laser Projector"},
        speed = "Slow-Medium",
        strength = "Depletes energy",
        weakness = "Avoids salt"
    },
    ["Demon"] = {
        evidence = {"EMF Level 5", "Handprints", "Freezing Temps"},
        speed = "Medium",
        strength = "Hunts frequently",
        weakness = "None"
    },
    ["Oni"] = {
        evidence = {"Spirit Box", "Freezing Temps", "Laser Projection"},
        speed = "Fastest",
        strength = "Very fast during hunts",
        weakness = "More visible in Laser Projection"
    }
    -- Thêm các loại ma khác...
}

local function detectGhost(evidenceList)
    for ghostType, data in pairs(ghostData) do
        local matches = 0
        for _, evidence in pairs(evidenceList) do
            for _, ghostEvidence in pairs(data.evidence) do
                if evidence == ghostEvidence then
                    matches = matches + 1
                    break
                end
            end
        end
        
        if matches >= 2 then -- Cần ít nhất 2 bằng chứng khớp
            return ghostType
        end
    end
    return "Unknown"
end

local function autoDetectGhost()
    local foundEvidence = {}
    
    -- Kiểm tra EMF Level 5
    local emfReader = LocalPlayer.Character:FindFirstChild("EMF Reader")
    if emfReader and emfReader.Value >= 5 then
        table.insert(foundEvidence, "EMF Level 5")
    end
    
    -- Kiểm tra Freezing Temps
    local thermometer = LocalPlayer.Character:FindFirstChild("Thermometer")
    if thermometer and thermometer.Value < 0 then
        table.insert(foundEvidence, "Freezing Temps")
    end
    
    -- Kiểm tra Spirit Box response
    local spiritBox = LocalPlayer.Character:FindFirstChild("Spirit Box")
    if spiritBox and spiritBox.HasResponse then
        table.insert(foundEvidence, "Spirit Box")
    end
    
    -- Phát hiện loại ma
    detectedGhostType = detectGhost(foundEvidence)
    
    return foundEvidence, detectedGhostType
end
```

### 4. GUI Script để điều khiển

```lua
-- GUI Script
local function createGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DemonologyHelper"
    screenGui.Parent = LocalPlayer.PlayerGui
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0, 10, 0, 10)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.BackgroundTransparency = 1
    title.Text = "Demonology Helper"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.SourceSansBold
    title.Parent = mainFrame
    
    -- ESP Button
    local espButton = Instance.new("TextButton")
    espButton.Size = UDim2.new(0.8, 0, 0, 30)
    espButton.Position = UDim2.new(0.1, 0, 0, 40)
    espButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    espButton.Text = "Toggle ESP"
    espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    espButton.TextScaled = true
    espButton.Font = Enum.Font.SourceSans
    espButton.Parent = mainFrame
    
    espButton.MouseButton1Click:Connect(function()
        toggleESP()
    end)
    
    -- Auto Detect Button
    local autoDetectButton = Instance.new("TextButton")
    autoDetectButton.Size = UDim2.new(0.8, 0, 0, 30)
    autoDetectButton.Position = UDim2.new(0.1, 0, 0, 80)
    autoDetectButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    autoDetectButton.Text = "Auto Detect Ghost"
    autoDetectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    autoDetectButton.TextScaled = true
    autoDetectButton.Font = Enum.Font.SourceSans
    autoDetectButton.Parent = mainFrame
    
    autoDetectButton.MouseButton1Click:Connect(function()
        local evidence, ghostType = autoDetectGhost()
        print("Evidence found:", table.concat(evidence, ", "))
        print("Detected ghost type:", ghostType)
    end)
    
    -- Ghost Info Display
    local ghostInfoLabel = Instance.new("TextLabel")
    ghostInfoLabel.Size = UDim2.new(0.8, 0, 0, 60)
    ghostInfoLabel.Position = UDim2.new(0.1, 0, 0, 120)
    ghostInfoLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ghostInfoLabel.Text = "Ghost Type: " .. detectedGhostType
    ghostInfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ghostInfoLabel.TextScaled = true
    ghostInfoLabel.Font = Enum.Font.SourceSans
    ghostInfoLabel.Parent = mainFrame
    
    -- Cập nhật thông tin ma
    RunService.Heartbeat:Connect(function()
        ghostInfoLabel.Text = "Ghost Type: " .. detectedGhostType
    end)
end

-- Tạo GUI
createGUI()
```

### 5. Script cho Equipment Helper

```lua
-- Equipment Helper Script
local equipmentList = {
    "EMF Reader",
    "Spirit Box", 
    "Thermometer",
    "UV Light",
    "Ghost Writing Book",
    "Laser Projector",
    "Crucifix",
    "Salt",
    "Flashlight"
}

local function autoEquipTools()
    local backpack = LocalPlayer.Backpack
    
    for _, toolName in pairs(equipmentList) do
        local tool = backpack:FindFirstChild(toolName)
        if tool then
            -- Auto equip essential tools
            if toolName == "EMF Reader" or toolName == "Thermometer" then
                LocalPlayer.Character.Humanoid:EquipTool(tool)
                wait(0.5)
            end
        end
    end
end

-- Hotkeys
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.E then
        toggleESP()
    elseif input.KeyCode == Enum.KeyCode.G then
        autoDetectGhost()
    elseif input.KeyCode == Enum.KeyCode.Q then
        autoEquipTools()
    end
end)
```

## Cách sử dụng Scripts

### 1. Executor cần thiết
- **Synapse X** (trả phí, ổn định nhất)
- **Krnl** (miễn phí, khá ổn định)
- **Arceus X** (mobile, miễn phí)

### 2. Cách inject script
1. Mở executor
2. Attach vào Roblox process
3. Copy paste script vào executor
4. Execute script

### 3. Hotkeys mặc định
- **E**: Toggle ESP
- **G**: Auto detect ghost
- **Q**: Auto equip tools

## Lưu ý quan trọng

### ⚠️ Rủi ro và Cảnh báo

1. **Sử dụng script có thể dẫn đến ban account**
2. **Luôn sử dụng alt account để test**
3. **Không abuse script trong game multiplayer**
4. **Tôn trọng các player khác**

### 🔧 Tối ưu hóa Script

1. **Sử dụng pcall() để tránh crash**
2. **Cleanup connections khi không cần**
3. **Sử dụng wait() hợp lý**
4. **Tránh spam functions**

## Kết luận

Script này giúp bạn:
- **Phát hiện player khác** qua ESP
- **Tự động nhận diện loại ma** dựa trên bằng chứng
- **Tối ưu hóa gameplay** và tiết kiệm thời gian
- **Học hỏi về Lua scripting** trong Roblox

Hãy nhớ sử dụng script một cách có trách nhiệm và tôn trọng cộng đồng game!

---

*Tài liệu này chỉ mang tính chất giáo dục. Tác giả không chịu trách nhiệm cho việc sử dụng sai mục đích.*