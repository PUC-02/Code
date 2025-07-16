class SimpleGhostTracker:
    def __init__(self):
        # Trạng thái ON/OFF cho từng equipment
        self.equipment_status = {
            "laser_projector": False,
            "emf_reader": False,
            "flower_pot": False,
            "spirit_book": False,
            "spirit_box": False,
            "handprints": False,
            "footprints": False
        }
        
        # EMF level riêng biệt (0-5)
        self.emf_level = 0
    
    # === TRIGGER FUNCTIONS === #
    def laser_ghost_interaction(self):
        """Ma tác động lên laser projector"""
        self.equipment_status["laser_projector"] = True
        return True
    
    def emf_detected(self, level):
        """Cập nhật EMF level (1-5)"""
        self.emf_level = level
        if level == 5:
            self.equipment_status["emf_reader"] = True
            return True
        return False
    
    def flower_withered(self):
        """Hoa héo do ma"""
        self.equipment_status["flower_pot"] = True
        return True
    
    def ghost_writing(self):
        """Ma viết lên spirit book"""
        self.equipment_status["spirit_book"] = True
        return True
    
    def spirit_response(self):
        """Ma nói chuyện qua spirit box"""
        self.equipment_status["spirit_box"] = True
        return True
    
    def handprints_found(self):
        """Tìm thấy handprints"""
        self.equipment_status["handprints"] = True
        return True
    
    def footprints_found(self):
        """Tìm thấy footprints"""
        self.equipment_status["footprints"] = True
        return True
    
    # === STATUS FUNCTIONS === #
    def is_equipment_on(self, equipment_name):
        """Kiểm tra equipment có đang ON không"""
        return self.equipment_status.get(equipment_name, False)
    
    def get_emf_level(self):
        """Lấy EMF level hiện tại"""
        return self.emf_level
    
    def get_active_count(self):
        """Đếm số equipment đang active"""
        return sum(1 for status in self.equipment_status.values() if status)
    
    def get_menu_display(self):
        """Trả về dict cho menu display"""
        return {
            "laser_projector": "ON" if self.equipment_status["laser_projector"] else "OFF",
            "emf_reader": f"ON (Level {self.emf_level})" if self.equipment_status["emf_reader"] else f"OFF (Level {self.emf_level})",
            "flower_pot": "ON" if self.equipment_status["flower_pot"] else "OFF",
            "spirit_book": "ON" if self.equipment_status["spirit_book"] else "OFF",
            "spirit_box": "ON" if self.equipment_status["spirit_box"] else "OFF",
            "handprints": "ON" if self.equipment_status["handprints"] else "OFF",
            "footprints": "ON" if self.equipment_status["footprints"] else "OFF"
        }
    
    def reset_all(self):
        """Reset tất cả về trạng thái ban đầu"""
        for equipment in self.equipment_status:
            self.equipment_status[equipment] = False
        self.emf_level = 0
    
    def print_status(self):
        """In ra trạng thái hiện tại"""
        print("=== GHOST EVIDENCE STATUS ===")
        menu = self.get_menu_display()
        for equipment, status in menu.items():
            print(f"{equipment.upper()}: {status}")
        print(f"Active Evidence: {self.get_active_count()}/7")
        print("============================")

# === EXAMPLE USAGE === #
def demo():
    tracker = SimpleGhostTracker()
    
    print("Ghost Evidence Tracker Demo")
    print("Simulating ghost interactions...\n")
    
    # Simulate various ghost interactions
    tracker.laser_ghost_interaction()
    tracker.emf_detected(3)
    tracker.emf_detected(5)  # This will turn EMF ON
    tracker.spirit_response()
    tracker.handprints_found()
    
    # Display current status
    tracker.print_status()
    
    print("\nMenu Display Format:")
    menu = tracker.get_menu_display()
    for equipment, status in menu.items():
        print(f"  {equipment}: {status}")
    
    print(f"\nEMF Level: {tracker.get_emf_level()}")
    print(f"Active Equipment Count: {tracker.get_active_count()}")

if __name__ == "__main__":
    demo()