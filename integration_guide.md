# Ghost Evidence Tracker - Hướng dẫn tích hợp

## Logic hoạt động của các equipment

### 1. **Laser Projector** 
- **Khi hoạt động**: Ma tác động làm laser dots bị gián đoạn
- **Code**: `tracker.laser_ghost_interaction()`
- **Kết quả**: Status = ON

### 2. **EMF Reader**
- **Khi hoạt động**: EMF đạt level 5
- **Code**: `tracker.emf_detected(level)` 
- **Đặc biệt**: Luôn hiển thị level hiện tại (1-5), chỉ ON khi level = 5
- **Kết quả**: Status = ON (Level 5) hoặc OFF (Level 1-4)

### 3. **Flower Pot**
- **Khi hoạt động**: Hoa héo do ma
- **Code**: `tracker.flower_withered()`
- **Kết quả**: Status = ON

### 4. **Spirit Book**
- **Khi hoạt động**: Ma viết lên sách
- **Code**: `tracker.ghost_writing()`
- **Kết quả**: Status = ON

### 5. **Spirit Box**
- **Khi hoạt động**: Ma nói chuyện qua radio
- **Code**: `tracker.spirit_response()`
- **Kết quả**: Status = ON

### 6. **Handprints**
- **Khi hoạt động**: Tìm thấy dấu tay ma
- **Code**: `tracker.handprints_found()`
- **Kết quả**: Status = ON

### 7. **Footprints**
- **Khi hoạt động**: Tìm thấy dấu chân ma
- **Code**: `tracker.footprints_found()`
- **Kết quả**: Status = ON

## Cách tích hợp vào script của bạn

### 1. Import class
```python
from simple_ghost_tracker import SimpleGhostTracker

# Khởi tạo tracker
tracker = SimpleGhostTracker()
```

### 2. Khi phát hiện ghost interaction, gọi hàm tương ứng
```python
# Khi laser bị gián đoạn
tracker.laser_ghost_interaction()

# Khi EMF có reading
tracker.emf_detected(3)  # Level 1-5
tracker.emf_detected(5)  # Level 5 = evidence confirmed

# Khi hoa héo
tracker.flower_withered()

# Khi ma viết
tracker.ghost_writing()

# Khi spirit box có response
tracker.spirit_response()

# Khi tìm thấy handprints
tracker.handprints_found()

# Khi tìm thấy footprints
tracker.footprints_found()
```

### 3. Hiển thị trạng thái trong menu của bạn
```python
# Lấy trạng thái để hiển thị
menu_display = tracker.get_menu_display()

# menu_display sẽ có dạng:
# {
#     "laser_projector": "ON" hoặc "OFF",
#     "emf_reader": "ON (Level 5)" hoặc "OFF (Level 3)",
#     "flower_pot": "ON" hoặc "OFF",
#     "spirit_book": "ON" hoặc "OFF",
#     "spirit_box": "ON" hoặc "OFF",
#     "handprints": "ON" hoặc "OFF",
#     "footprints": "ON" hoặc "OFF"
# }

# Hiển thị trong menu
for equipment, status in menu_display.items():
    print(f"{equipment}: {status}")
```

### 4. Kiểm tra trạng thái riêng lẻ
```python
# Kiểm tra equipment có ON không
if tracker.is_equipment_on("laser_projector"):
    print("Laser projector detected ghost!")

# Lấy EMF level hiện tại
current_emf = tracker.get_emf_level()
print(f"EMF Level: {current_emf}")

# Đếm số evidence active
active_count = tracker.get_active_count()
print(f"Active Evidence: {active_count}/7")
```

### 5. Reset khi bắt đầu game mới
```python
# Reset tất cả về trạng thái ban đầu
tracker.reset_all()
```

## Example tích hợp vào game loop

```python
from simple_ghost_tracker import SimpleGhostTracker

def main_game_loop():
    tracker = SimpleGhostTracker()
    
    while True:
        # Game logic của bạn...
        
        # Khi phát hiện ghost interaction
        if laser_disrupted:
            tracker.laser_ghost_interaction()
        
        if emf_reading > 0:
            tracker.emf_detected(emf_reading)
        
        if flowers_withered:
            tracker.flower_withered()
        
        if ghost_wrote_book:
            tracker.ghost_writing()
        
        if spirit_box_responded:
            tracker.spirit_response()
        
        if handprints_detected:
            tracker.handprints_found()
        
        if footprints_detected:
            tracker.footprints_found()
        
        # Hiển thị menu với trạng thái hiện tại
        display_menu(tracker.get_menu_display())
        
        # Kiểm tra nếu đủ evidence để xác định loại ma
        if tracker.get_active_count() >= 3:
            print("Enough evidence to identify ghost type!")
```

## Lợi ích

1. **Tránh nhầm lẫn**: Không bao giờ quên evidence nào đã trigger
2. **Theo dõi EMF**: Luôn biết level EMF hiện tại
3. **Tự động hóa**: Chỉ cần gọi hàm khi phát hiện ghost interaction
4. **Dễ tích hợp**: Code đơn giản, dễ nhúng vào script có sẵn
5. **Chống lỗi**: Tránh chọn sai evidence type và thua game

## Files

- `simple_ghost_tracker.py`: Version đơn giản để tích hợp
- `ghost_evidence_tracker.py`: Version đầy đủ với logging và timestamp
- `integration_guide.md`: Hướng dẫn này

Chúc bạn thành công với script phá đảo game! 🎮👻