import time
import json
from datetime import datetime
from enum import Enum

class EvidenceType(Enum):
    LASER_PROJECTOR = "laser_projector"
    EMF_READER = "emf_reader"
    FLOWER_POT = "flower_pot"
    SPIRIT_BOOK = "spirit_book"
    SPIRIT_BOX = "spirit_box"
    HANDPRINTS = "handprints"
    FOOTPRINTS = "footprints"

class GhostEvidenceTracker:
    def __init__(self):
        self.evidence_states = {
            EvidenceType.LASER_PROJECTOR: {
                "active": False,
                "ghost_interaction": False,
                "last_trigger": None,
                "description": "Laser dots disrupted by ghost"
            },
            EvidenceType.EMF_READER: {
                "active": False,
                "level": 0,
                "max_level": 5,
                "last_trigger": None,
                "description": "EMF Level 5 reading"
            },
            EvidenceType.FLOWER_POT: {
                "active": False,
                "withered": False,
                "last_trigger": None,
                "description": "Flowers withered by ghost"
            },
            EvidenceType.SPIRIT_BOOK: {
                "active": False,
                "ghost_writing": False,
                "last_trigger": None,
                "description": "Ghost writing appeared"
            },
            EvidenceType.SPIRIT_BOX: {
                "active": False,
                "ghost_response": False,
                "last_trigger": None,
                "description": "Ghost responded through spirit box"
            },
            EvidenceType.HANDPRINTS: {
                "active": False,
                "detected": False,
                "last_trigger": None,
                "description": "Ghost handprints detected"
            },
            EvidenceType.FOOTPRINTS: {
                "active": False,
                "detected": False,
                "last_trigger": None,
                "description": "Ghost footprints detected"
            }
        }
    
    def trigger_laser_projector(self):
        """Kích hoạt khi ma tác động lên laser projector"""
        self.evidence_states[EvidenceType.LASER_PROJECTOR]["active"] = True
        self.evidence_states[EvidenceType.LASER_PROJECTOR]["ghost_interaction"] = True
        self.evidence_states[EvidenceType.LASER_PROJECTOR]["last_trigger"] = datetime.now()
        print("🔴 LASER PROJECTOR: Ghost interaction detected!")
    
    def update_emf_level(self, level):
        """Cập nhật level EMF (1-5)"""
        if 1 <= level <= 5:
            self.evidence_states[EvidenceType.EMF_READER]["level"] = level
            if level == 5:
                self.evidence_states[EvidenceType.EMF_READER]["active"] = True
                self.evidence_states[EvidenceType.EMF_READER]["last_trigger"] = datetime.now()
                print(f"📡 EMF READER: Level {level} - EVIDENCE CONFIRMED!")
            else:
                print(f"📡 EMF READER: Level {level}")
    
    def trigger_flower_pot(self):
        """Kích hoạt khi hoa héo"""
        self.evidence_states[EvidenceType.FLOWER_POT]["active"] = True
        self.evidence_states[EvidenceType.FLOWER_POT]["withered"] = True
        self.evidence_states[EvidenceType.FLOWER_POT]["last_trigger"] = datetime.now()
        print("🌸 FLOWER POT: Flowers withered by ghost!")
    
    def trigger_spirit_book(self):
        """Kích hoạt khi ma viết lên spirit book"""
        self.evidence_states[EvidenceType.SPIRIT_BOOK]["active"] = True
        self.evidence_states[EvidenceType.SPIRIT_BOOK]["ghost_writing"] = True
        self.evidence_states[EvidenceType.SPIRIT_BOOK]["last_trigger"] = datetime.now()
        print("📖 SPIRIT BOOK: Ghost writing detected!")
    
    def trigger_spirit_box(self):
        """Kích hoạt khi ma nói chuyện qua spirit box"""
        self.evidence_states[EvidenceType.SPIRIT_BOX]["active"] = True
        self.evidence_states[EvidenceType.SPIRIT_BOX]["ghost_response"] = True
        self.evidence_states[EvidenceType.SPIRIT_BOX]["last_trigger"] = datetime.now()
        print("📻 SPIRIT BOX: Ghost response detected!")
    
    def trigger_handprints(self):
        """Kích hoạt khi phát hiện handprints"""
        self.evidence_states[EvidenceType.HANDPRINTS]["active"] = True
        self.evidence_states[EvidenceType.HANDPRINTS]["detected"] = True
        self.evidence_states[EvidenceType.HANDPRINTS]["last_trigger"] = datetime.now()
        print("👋 HANDPRINTS: Ghost handprints detected!")
    
    def trigger_footprints(self):
        """Kích hoạt khi phát hiện footprints"""
        self.evidence_states[EvidenceType.FOOTPRINTS]["active"] = True
        self.evidence_states[EvidenceType.FOOTPRINTS]["detected"] = True
        self.evidence_states[EvidenceType.FOOTPRINTS]["last_trigger"] = datetime.now()
        print("👣 FOOTPRINTS: Ghost footprints detected!")
    
    def get_active_evidence(self):
        """Lấy danh sách evidence đang active"""
        active_evidence = []
        for evidence_type, state in self.evidence_states.items():
            if state["active"]:
                active_evidence.append({
                    "type": evidence_type.value,
                    "description": state["description"],
                    "timestamp": state["last_trigger"]
                })
        return active_evidence
    
    def get_emf_level(self):
        """Lấy level EMF hiện tại"""
        return self.evidence_states[EvidenceType.EMF_READER]["level"]
    
    def reset_all_evidence(self):
        """Reset tất cả evidence về trạng thái ban đầu"""
        for evidence_type in self.evidence_states:
            self.evidence_states[evidence_type]["active"] = False
            self.evidence_states[evidence_type]["last_trigger"] = None
            
            # Reset specific states
            if evidence_type == EvidenceType.LASER_PROJECTOR:
                self.evidence_states[evidence_type]["ghost_interaction"] = False
            elif evidence_type == EvidenceType.EMF_READER:
                self.evidence_states[evidence_type]["level"] = 0
            elif evidence_type == EvidenceType.FLOWER_POT:
                self.evidence_states[evidence_type]["withered"] = False
            elif evidence_type == EvidenceType.SPIRIT_BOOK:
                self.evidence_states[evidence_type]["ghost_writing"] = False
            elif evidence_type == EvidenceType.SPIRIT_BOX:
                self.evidence_states[evidence_type]["ghost_response"] = False
            elif evidence_type == EvidenceType.HANDPRINTS:
                self.evidence_states[evidence_type]["detected"] = False
            elif evidence_type == EvidenceType.FOOTPRINTS:
                self.evidence_states[evidence_type]["detected"] = False
        
        print("🔄 All evidence reset!")
    
    def display_status(self):
        """Hiển thị trạng thái hiện tại của tất cả equipment"""
        print("\n" + "="*50)
        print("GHOST EVIDENCE TRACKER STATUS")
        print("="*50)
        
        for evidence_type, state in self.evidence_states.items():
            status = "ON" if state["active"] else "OFF"
            emoji = "🟢" if state["active"] else "🔴"
            
            if evidence_type == EvidenceType.EMF_READER:
                level = state["level"]
                print(f"{emoji} {evidence_type.value.upper()}: {status} (Level: {level}/5)")
            else:
                print(f"{emoji} {evidence_type.value.upper()}: {status}")
        
        print("="*50)
    
    def save_evidence_log(self, filename="evidence_log.json"):
        """Lưu log evidence vào file"""
        log_data = {
            "timestamp": datetime.now().isoformat(),
            "evidence_states": {}
        }
        
        for evidence_type, state in self.evidence_states.items():
            log_data["evidence_states"][evidence_type.value] = {
                "active": state["active"],
                "last_trigger": state["last_trigger"].isoformat() if state["last_trigger"] else None
            }
            
            if evidence_type == EvidenceType.EMF_READER:
                log_data["evidence_states"][evidence_type.value]["level"] = state["level"]
        
        with open(filename, 'w') as f:
            json.dump(log_data, f, indent=2)
        
        print(f"📄 Evidence log saved to {filename}")

# Example usage và testing
def main():
    tracker = GhostEvidenceTracker()
    
    print("Ghost Evidence Tracker Started!")
    print("Simulating ghost interactions...")
    
    # Simulate ghost interactions
    time.sleep(1)
    tracker.trigger_laser_projector()
    
    time.sleep(1)
    tracker.update_emf_level(3)
    
    time.sleep(1)
    tracker.update_emf_level(5)  # This should trigger evidence
    
    time.sleep(1)
    tracker.trigger_spirit_box()
    
    time.sleep(1)
    tracker.trigger_handprints()
    
    # Display current status
    tracker.display_status()
    
    # Show active evidence
    active = tracker.get_active_evidence()
    print(f"\nActive Evidence Count: {len(active)}")
    for evidence in active:
        print(f"- {evidence['type']}: {evidence['description']}")
    
    # Save log
    tracker.save_evidence_log()

if __name__ == "__main__":
    main()