-- Example script cho việc tạo khóa cụ thể
-- Hoàn toàn viết bằng cú pháp Lua

local KeyGenerator = require("key_generator")

-- Hàm tạo khóa cho database
function generate_database_key()
    local db_key = KeyGenerator.generate_secure_key(64)
    print("Database Key: " .. db_key)
    return db_key
end

-- Hàm tạo khóa cho JWT
function generate_jwt_secret()
    local jwt_secret = KeyGenerator.generate_random_string(32)
    print("JWT Secret: " .. jwt_secret)
    return jwt_secret
end

-- Hàm tạo khóa cho session
function generate_session_key()
    local session_key = KeyGenerator.generate_hex_key(40)
    print("Session Key: " .. session_key)
    return session_key
end

-- Hàm tạo khóa cho encryption
function generate_encryption_key()
    local encryption_key = KeyGenerator.generate_secure_key(32)
    print("Encryption Key: " .. encryption_key)
    return encryption_key
end

-- Hàm tạo nhiều khóa API
function generate_api_keys_batch(count)
    print("Tạo " .. count .. " khóa API:")
    local api_keys = KeyGenerator.generate_multiple_keys(count, "api", 32)
    
    for i, key in ipairs(api_keys) do
        print("  API Key " .. i .. ": " .. key)
    end
    
    return api_keys
end

-- Hàm tạo khóa với thông tin chi tiết
function generate_key_with_info(key_type, length)
    local key
    
    if key_type == "random" then
        key = KeyGenerator.generate_random_string(length)
    elseif key_type == "hex" then
        key = KeyGenerator.generate_hex_key(length)
    elseif key_type == "uuid" then
        key = KeyGenerator.generate_uuid()
    elseif key_type == "secure" then
        key = KeyGenerator.generate_secure_key(length)
    else
        key = KeyGenerator.generate_random_string(length)
    end
    
    KeyGenerator.display_key_info(key)
    return key
end

-- Hàm demo mã hóa file
function demo_file_encryption()
    print("\n=== DEMO MÃ HÓA FILE ===")
    
    -- Tạo khóa mã hóa
    local encrypt_key = KeyGenerator.generate_secure_key(16)
    print("Khóa mã hóa: " .. encrypt_key)
    
    -- Văn bản mẫu
    local sample_text = "Đây là văn bản bí mật cần được mã hóa"
    print("Văn bản gốc: " .. sample_text)
    
    -- Mã hóa
    local encrypted = KeyGenerator.simple_encode(sample_text, encrypt_key)
    print("Văn bản mã hóa: " .. encrypted)
    
    -- Giải mã
    local decrypted = KeyGenerator.simple_decode(encrypted, encrypt_key)
    print("Văn bản giải mã: " .. decrypted)
    
    -- Lưu khóa vào file
    local success, message = KeyGenerator.save_key_to_file(encrypt_key, "encryption_key.txt")
    print("Lưu khóa: " .. message)
    
    return encrypt_key, encrypted
end

-- Hàm tạo config keys
function generate_config_keys()
    local config = {
        database_key = generate_database_key(),
        jwt_secret = generate_jwt_secret(),
        session_key = generate_session_key(),
        encryption_key = generate_encryption_key(),
        api_keys = generate_api_keys_batch(3)
    }
    
    return config
end

-- Hàm chính
function main()
    print("=== EXAMPLE: TẠO KHÓA BẰNG LUA ===")
    print("Các ví dụ cụ thể về việc tạo khóa\n")
    
    -- 1. Tạo khóa cho database
    print("1. Tạo khóa cho Database:")
    generate_database_key()
    print()
    
    -- 2. Tạo khóa JWT
    print("2. Tạo khóa JWT:")
    generate_jwt_secret()
    print()
    
    -- 3. Tạo khóa session
    print("3. Tạo khóa Session:")
    generate_session_key()
    print()
    
    -- 4. Tạo khóa encryption
    print("4. Tạo khóa Encryption:")
    generate_encryption_key()
    print()
    
    -- 5. Tạo nhiều khóa API
    print("5. Tạo nhiều khóa API:")
    generate_api_keys_batch(3)
    print()
    
    -- 6. Tạo khóa với thông tin chi tiết
    print("6. Tạo khóa với thông tin chi tiết:")
    generate_key_with_info("secure", 32)
    print()
    
    -- 7. Demo mã hóa file
    demo_file_encryption()
    print()
    
    -- 8. Tạo config keys
    print("8. Tạo config keys:")
    local config = generate_config_keys()
    print("Đã tạo xong tất cả các khóa cần thiết!")
    print()
    
    -- 9. Validate tất cả khóa
    print("9. Validate tất cả khóa:")
    local keys_to_validate = {
        config.database_key,
        config.jwt_secret,
        config.session_key,
        config.encryption_key
    }
    
    for i, key in ipairs(keys_to_validate) do
        local is_valid, message = KeyGenerator.validate_key(key)
        print("  Khóa " .. i .. ": " .. message)
    end
    
    -- 10. Tạo UUID batch
    print("\n10. Tạo UUID batch:")
    local uuids = KeyGenerator.generate_multiple_keys(5, "uuid", 0)
    for i, uuid in ipairs(uuids) do
        print("  UUID " .. i .. ": " .. uuid)
    end
    
    print("\n=== HOÀN THÀNH ===")
    print("Tất cả các khóa đã được tạo thành công!")
end

-- Chạy ví dụ
main()