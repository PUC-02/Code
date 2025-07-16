#!/usr/bin/env lua

-- Main script để sử dụng KeyGenerator
-- Hoàn toàn viết bằng cú pháp Lua

-- Load module KeyGenerator
local KeyGenerator = require("key_generator")

-- Hàm main
function main()
    print("=== CHƯƠNG TRÌNH TẠO KHÓA BẰNG LUA ===")
    print("Chào mừng bạn đến với chương trình tạo khóa!")
    print("Hoàn toàn viết bằng cú pháp Lua")
    print("=====================================")
    
    -- Demo các chức năng
    print("\n--- DEMO CÁC CHỨC NĂNG ---")
    
    -- 1. Tạo khóa ngẫu nhiên
    print("\n1. Tạo khóa ngẫu nhiên:")
    local random_key = KeyGenerator.generate_random_string(16)
    print("   " .. random_key)
    
    -- 2. Tạo khóa hex
    print("\n2. Tạo khóa hex:")
    local hex_key = KeyGenerator.generate_hex_key(32)
    print("   " .. hex_key)
    
    -- 3. Tạo UUID
    print("\n3. Tạo UUID:")
    local uuid = KeyGenerator.generate_uuid()
    print("   " .. uuid)
    
    -- 4. Tạo khóa API
    print("\n4. Tạo khóa API:")
    local api_key = KeyGenerator.generate_api_key("MYAPP", 24)
    print("   " .. api_key)
    
    -- 5. Tạo khóa bảo mật
    print("\n5. Tạo khóa bảo mật:")
    local secure_key = KeyGenerator.generate_secure_key(32)
    print("   " .. secure_key)
    
    -- 6. Tạo nhiều khóa
    print("\n6. Tạo nhiều khóa:")
    local multiple_keys = KeyGenerator.generate_multiple_keys(3, "random", 12)
    for i, key in ipairs(multiple_keys) do
        print("   " .. i .. ". " .. key)
    end
    
    -- 7. Validate khóa
    print("\n7. Validate khóa:")
    local test_key = "TestKey123"
    local is_valid, message = KeyGenerator.validate_key(test_key)
    print("   Khóa: " .. test_key)
    print("   Kết quả: " .. message)
    
    -- 8. Demo mã hóa/giải mã
    print("\n8. Demo mã hóa/giải mã:")
    local text = "Hello World"
    local encode_key = "mypassword"
    local encoded = KeyGenerator.simple_encode(text, encode_key)
    local decoded = KeyGenerator.simple_decode(encoded, encode_key)
    print("   Văn bản gốc: " .. text)
    print("   Văn bản mã hóa: " .. encoded)
    print("   Văn bản giải mã: " .. decoded)
    
    -- 9. Lưu khóa vào file
    print("\n9. Lưu khóa vào file:")
    local save_key = KeyGenerator.generate_random_string(32)
    local success, save_message = KeyGenerator.save_key_to_file(save_key, "demo_key.txt")
    print("   " .. save_message)
    
    -- 10. Đọc khóa từ file
    print("\n10. Đọc khóa từ file:")
    local read_key, read_message = KeyGenerator.read_key_from_file("demo_key.txt")
    if read_key then
        print("   " .. read_message)
        print("   Khóa đã đọc: " .. read_key)
    end
    
    print("\n=== CHẠY CHƯƠNG TRÌNH TƯƠNG TÁC ===")
    print("Bạn có muốn chạy chương trình tương tác không? (y/n)")
    io.write("Nhập lựa chọn: ")
    local choice = io.read()
    
    if choice == "y" or choice == "Y" then
        KeyGenerator.run()
    else
        print("Cảm ơn bạn đã sử dụng chương trình!")
    end
end

-- Chạy chương trình chính
main()