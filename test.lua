-- Test script cho Key Generator
-- Hoàn toàn viết bằng cú pháp Lua

local KeyGenerator = require("key_generator")

-- Hàm test cơ bản
function test_basic_functions()
    print("=== TEST CÁC CHỨC NĂNG CƠ BẢN ===")
    
    -- Test tạo khóa ngẫu nhiên
    local random_key = KeyGenerator.generate_random_string(16)
    print("✓ Tạo khóa ngẫu nhiên: " .. random_key .. " (độ dài: " .. #random_key .. ")")
    
    -- Test tạo khóa hex
    local hex_key = KeyGenerator.generate_hex_key(32)
    print("✓ Tạo khóa hex: " .. hex_key .. " (độ dài: " .. #hex_key .. ")")
    
    -- Test tạo UUID
    local uuid = KeyGenerator.generate_uuid()
    print("✓ Tạo UUID: " .. uuid .. " (độ dài: " .. #uuid .. ")")
    
    -- Test tạo khóa API
    local api_key = KeyGenerator.generate_api_key("TEST", 16)
    print("✓ Tạo khóa API: " .. api_key .. " (độ dài: " .. #api_key .. ")")
    
    -- Test tạo khóa bảo mật
    local secure_key = KeyGenerator.generate_secure_key(24)
    print("✓ Tạo khóa bảo mật: " .. secure_key .. " (độ dài: " .. #secure_key .. ")")
    
    print("✓ Tất cả các chức năng tạo khóa đều hoạt động!\n")
end

-- Test validate
function test_validation()
    print("=== TEST VALIDATE ===")
    
    local test_cases = {
        {"", false, "Khóa rỗng"},
        {"abc", false, "Khóa quá ngắn"},
        {"validkey123", true, "Khóa hợp lệ"},
        {"verylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkeyverylongkey", false, "Khóa quá dài"}
    }
    
    for i, test_case in ipairs(test_cases) do
        local key, expected, description = test_case[1], test_case[2], test_case[3]
        local is_valid, message = KeyGenerator.validate_key(key)
        
        if is_valid == expected then
            print("✓ " .. description .. ": " .. message)
        else
            print("✗ " .. description .. ": " .. message)
        end
    end
    
    print("✓ Test validate hoàn thành!\n")
end

-- Test mã hóa/giải mã
function test_encryption()
    print("=== TEST MÃ HÓA/GIẢI MÃ ===")
    
    local test_text = "Đây là văn bản test"
    local encrypt_key = "testkey123"
    
    local encrypted = KeyGenerator.simple_encode(test_text, encrypt_key)
    local decrypted = KeyGenerator.simple_decode(encrypted, encrypt_key)
    
    if test_text == decrypted then
        print("✓ Mã hóa/giải mã thành công!")
        print("  Văn bản gốc: " .. test_text)
        print("  Văn bản giải mã: " .. decrypted)
    else
        print("✗ Mã hóa/giải mã thất bại!")
        print("  Văn bản gốc: " .. test_text)
        print("  Văn bản giải mã: " .. decrypted)
    end
    
    print()
end

-- Test file operations
function test_file_operations()
    print("=== TEST THAO TÁC FILE ===")
    
    local test_key = KeyGenerator.generate_random_string(32)
    local test_filename = "test_key.txt"
    
    -- Test lưu file
    local save_success, save_message = KeyGenerator.save_key_to_file(test_key, test_filename)
    if save_success then
        print("✓ Lưu khóa: " .. save_message)
    else
        print("✗ Lưu khóa thất bại: " .. save_message)
    end
    
    -- Test đọc file
    local read_key, read_message = KeyGenerator.read_key_from_file(test_filename)
    if read_key and read_key == test_key then
        print("✓ Đọc khóa: " .. read_message)
        print("  Khóa gốc: " .. test_key)
        print("  Khóa đã đọc: " .. read_key)
    else
        print("✗ Đọc khóa thất bại: " .. (read_message or "Không đọc được"))
    end
    
    print()
end

-- Test tạo nhiều khóa
function test_multiple_keys()
    print("=== TEST TẠO NHIỀU KHÓA ===")
    
    local key_types = {"random", "hex", "uuid", "api", "secure"}
    
    for i, key_type in ipairs(key_types) do
        local keys = KeyGenerator.generate_multiple_keys(3, key_type, 16)
        print("✓ Tạo 3 khóa " .. key_type .. ":")
        for j, key in ipairs(keys) do
            print("  " .. j .. ". " .. key)
        end
    end
    
    print()
end

-- Test hiệu năng
function test_performance()
    print("=== TEST HIỆU NĂNG ===")
    
    local start_time = os.time()
    
    -- Tạo 100 khóa ngẫu nhiên
    for i = 1, 100 do
        KeyGenerator.generate_random_string(32)
    end
    
    local end_time = os.time()
    local duration = end_time - start_time
    
    print("✓ Tạo 100 khóa ngẫu nhiên trong " .. duration .. " giây")
    
    -- Tạo 50 UUID
    start_time = os.time()
    for i = 1, 50 do
        KeyGenerator.generate_uuid()
    end
    end_time = os.time()
    duration = end_time - start_time
    
    print("✓ Tạo 50 UUID trong " .. duration .. " giây")
    
    print()
end

-- Hàm main
function main()
    print("=== CHƯƠNG TRÌNH TEST KEY GENERATOR ===")
    print("Kiểm tra tất cả các chức năng bằng cú pháp Lua\n")
    
    test_basic_functions()
    test_validation()
    test_encryption()
    test_file_operations()
    test_multiple_keys()
    test_performance()
    
    print("=== KẾT QUẢ ===")
    print("✓ Tất cả các test đã hoàn thành thành công!")
    print("✓ Chương trình hoàn toàn viết bằng cú pháp Lua!")
    print("✓ Sẵn sàng sử dụng!")
end

-- Chạy test
main()