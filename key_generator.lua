-- Key Generator Module
-- Mô-đun tạo khóa hoàn toàn bằng Lua

local KeyGenerator = {}

-- Hàm tạo số ngẫu nhiên
function KeyGenerator.generate_random_number(min, max)
    math.randomseed(os.time())
    return math.random(min, max)
end

-- Hàm tạo chuỗi ngẫu nhiên
function KeyGenerator.generate_random_string(length)
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local result = ""
    
    math.randomseed(os.time() + os.clock() * 1000000)
    
    for i = 1, length do
        local random_index = math.random(1, #charset)
        result = result .. string.sub(charset, random_index, random_index)
    end
    
    return result
end

-- Hàm tạo khóa hex
function KeyGenerator.generate_hex_key(length)
    local hex_chars = "0123456789ABCDEF"
    local result = ""
    
    math.randomseed(os.time() + os.clock() * 1000000)
    
    for i = 1, length do
        local random_index = math.random(1, #hex_chars)
        result = result .. string.sub(hex_chars, random_index, random_index)
    end
    
    return result
end

-- Hàm tạo UUID đơn giản
function KeyGenerator.generate_uuid()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    local result = ""
    
    math.randomseed(os.time() + os.clock() * 1000000)
    
    for i = 1, #template do
        local c = string.sub(template, i, i)
        if c == "x" then
            result = result .. string.format("%x", math.random(0, 15))
        elseif c == "y" then
            result = result .. string.format("%x", math.random(8, 11))
        else
            result = result .. c
        end
    end
    
    return result
end

-- Hàm tạo khóa API
function KeyGenerator.generate_api_key(prefix, length)
    prefix = prefix or "API"
    length = length or 32
    
    local key_part = KeyGenerator.generate_random_string(length)
    return prefix .. "_" .. key_part
end

-- Hàm tạo khóa bảo mật
function KeyGenerator.generate_secure_key(length)
    length = length or 64
    local secure_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*"
    local result = ""
    
    math.randomseed(os.time() + os.clock() * 1000000)
    
    for i = 1, length do
        local random_index = math.random(1, #secure_chars)
        result = result .. string.sub(secure_chars, random_index, random_index)
    end
    
    return result
end

-- Hàm validate khóa
function KeyGenerator.validate_key(key, min_length, max_length)
    min_length = min_length or 8
    max_length = max_length or 128
    
    if not key or type(key) ~= "string" then
        return false, "Khóa phải là chuỗi"
    end
    
    if #key < min_length then
        return false, "Khóa quá ngắn (tối thiểu " .. min_length .. " ký tự)"
    end
    
    if #key > max_length then
        return false, "Khóa quá dài (tối đa " .. max_length .. " ký tự)"
    end
    
    return true, "Khóa hợp lệ"
end

-- Hàm mã hóa đơn giản (XOR)
function KeyGenerator.simple_encode(text, key)
    local result = ""
    local key_length = #key
    
    for i = 1, #text do
        local char = string.byte(text, i)
        local key_char = string.byte(key, ((i - 1) % key_length) + 1)
        local encoded_char = char ~ key_char  -- XOR operation
        result = result .. string.char(encoded_char)
    end
    
    return result
end

-- Hàm giải mã đơn giản (XOR)
function KeyGenerator.simple_decode(encoded_text, key)
    return KeyGenerator.simple_encode(encoded_text, key)  -- XOR là hoạt động đối xứng
end

-- Hàm lưu khóa vào file
function KeyGenerator.save_key_to_file(key, filename)
    filename = filename or "generated_key.txt"
    
    local file = io.open(filename, "w")
    if not file then
        return false, "Không thể tạo file " .. filename
    end
    
    file:write(key)
    file:close()
    
    return true, "Đã lưu khóa vào " .. filename
end

-- Hàm đọc khóa từ file
function KeyGenerator.read_key_from_file(filename)
    filename = filename or "generated_key.txt"
    
    local file = io.open(filename, "r")
    if not file then
        return nil, "Không thể đọc file " .. filename
    end
    
    local key = file:read("*all")
    file:close()
    
    return key, "Đã đọc khóa từ " .. filename
end

-- Hàm hiển thị thông tin khóa
function KeyGenerator.display_key_info(key)
    print("=== THÔNG TIN KHÓA ===")
    print("Khóa: " .. key)
    print("Độ dài: " .. #key .. " ký tự")
    print("Loại: " .. type(key))
    
    local is_valid, message = KeyGenerator.validate_key(key)
    print("Trạng thái: " .. message)
    print("=====================")
end

-- Hàm tạo nhiều khóa
function KeyGenerator.generate_multiple_keys(count, key_type, length)
    count = count or 5
    key_type = key_type or "random"
    length = length or 16
    
    local keys = {}
    
    for i = 1, count do
        local key
        if key_type == "hex" then
            key = KeyGenerator.generate_hex_key(length)
        elseif key_type == "uuid" then
            key = KeyGenerator.generate_uuid()
        elseif key_type == "api" then
            key = KeyGenerator.generate_api_key("API", length)
        elseif key_type == "secure" then
            key = KeyGenerator.generate_secure_key(length)
        else
            key = KeyGenerator.generate_random_string(length)
        end
        
        table.insert(keys, key)
    end
    
    return keys
end

-- Hàm menu chính
function KeyGenerator.main_menu()
    print("=== CHƯƠNG TRÌNH TẠO KHÓA ===")
    print("1. Tạo khóa ngẫu nhiên")
    print("2. Tạo khóa hex")
    print("3. Tạo UUID")
    print("4. Tạo khóa API")
    print("5. Tạo khóa bảo mật")
    print("6. Tạo nhiều khóa")
    print("7. Validate khóa")
    print("8. Mã hóa/Giải mã")
    print("9. Thoát")
    print("============================")
    
    io.write("Chọn lựa chọn (1-9): ")
    local choice = io.read()
    
    return tonumber(choice)
end

-- Hàm chạy chương trình
function KeyGenerator.run()
    while true do
        local choice = KeyGenerator.main_menu()
        
        if choice == 1 then
            io.write("Nhập độ dài khóa (mặc định 16): ")
            local length = tonumber(io.read()) or 16
            local key = KeyGenerator.generate_random_string(length)
            KeyGenerator.display_key_info(key)
            
        elseif choice == 2 then
            io.write("Nhập độ dài khóa hex (mặc định 32): ")
            local length = tonumber(io.read()) or 32
            local key = KeyGenerator.generate_hex_key(length)
            KeyGenerator.display_key_info(key)
            
        elseif choice == 3 then
            local key = KeyGenerator.generate_uuid()
            KeyGenerator.display_key_info(key)
            
        elseif choice == 4 then
            io.write("Nhập prefix (mặc định 'API'): ")
            local prefix = io.read()
            if prefix == "" then prefix = "API" end
            io.write("Nhập độ dài (mặc định 32): ")
            local length = tonumber(io.read()) or 32
            local key = KeyGenerator.generate_api_key(prefix, length)
            KeyGenerator.display_key_info(key)
            
        elseif choice == 5 then
            io.write("Nhập độ dài khóa bảo mật (mặc định 64): ")
            local length = tonumber(io.read()) or 64
            local key = KeyGenerator.generate_secure_key(length)
            KeyGenerator.display_key_info(key)
            
        elseif choice == 6 then
            io.write("Nhập số lượng khóa (mặc định 5): ")
            local count = tonumber(io.read()) or 5
            io.write("Nhập loại khóa (random/hex/uuid/api/secure): ")
            local key_type = io.read()
            if key_type == "" then key_type = "random" end
            io.write("Nhập độ dài (mặc định 16): ")
            local length = tonumber(io.read()) or 16
            
            local keys = KeyGenerator.generate_multiple_keys(count, key_type, length)
            print("=== DANH SÁCH KHÓA ===")
            for i, key in ipairs(keys) do
                print(i .. ". " .. key)
            end
            print("======================")
            
        elseif choice == 7 then
            io.write("Nhập khóa cần validate: ")
            local key = io.read()
            local is_valid, message = KeyGenerator.validate_key(key)
            print("Kết quả: " .. message)
            
        elseif choice == 8 then
            io.write("Nhập văn bản: ")
            local text = io.read()
            io.write("Nhập khóa mã hóa: ")
            local key = io.read()
            local encoded = KeyGenerator.simple_encode(text, key)
            print("Văn bản mã hóa: " .. encoded)
            local decoded = KeyGenerator.simple_decode(encoded, key)
            print("Văn bản giải mã: " .. decoded)
            
        elseif choice == 9 then
            print("Tạm biệt!")
            break
            
        else
            print("Lựa chọn không hợp lệ!")
        end
        
        print("\nNhấn Enter để tiếp tục...")
        io.read()
    end
end

-- Trả về module
return KeyGenerator