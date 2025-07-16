# Key Generator - Lua

Chương trình tạo khóa hoàn toàn viết bằng Lua với cú pháp Lua chuẩn.

## Tính năng

- Tạo khóa ngẫu nhiên
- Tạo khóa hex
- Tạo UUID
- Tạo khóa API
- Tạo khóa bảo mật
- Mã hóa/giải mã đơn giản
- Validate khóa
- Lưu/đọc khóa từ file

## Cách sử dụng

```bash
# Chạy ví dụ demo
lua example.lua

# Chạy chương trình tương tác
lua main.lua

# Sử dụng module trong code khác
local KeyGenerator = require("key_generator")
local key = KeyGenerator.generate_random_string(32)
```

## Files

- `key_generator.lua` - Module chính với tất cả các chức năng
- `main.lua` - Chương trình tương tác
- `example.lua` - Ví dụ sử dụng các chức năng

Hoàn toàn viết bằng cú pháp Lua!
