# controllers/home_controller.py
from PySide6.QtCore import QObject, Signal, Slot

class HomeController(QObject):
    # Define signals
    statusMessage = Signal(str)
    
    def __init__(self):
        super().__init__()
        self.current_mode = "sign_to_text"  # or "speech_to_sign"
    
    @Slot(str)
    def set_conversion_mode(self, mode):
        """Set the current conversion mode"""
        if mode in ["sign_to_text", "speech_to_sign"]:
            self.current_mode = mode
            self.statusMessage.emit(f"Mode changed to {mode}")
        else:
            self.statusMessage.emit("Invalid mode selection")
    
    @Slot()
    def start_camera(self):
        """Start the camera for sign language detection"""
        # This would integrate with your sign language detection model
        self.statusMessage.emit("Camera started")
    
    @Slot()
    def stop_camera(self):
        """Stop the camera"""
        self.statusMessage.emit("Camera stopped")
    
    @Slot(str)
    def convert_text_to_sign(self, text):
        """Convert text to sign language animation"""
        if not text:
            self.statusMessage.emit("Please enter text to convert")
            return
            
        # This would integrate with your text-to-sign converter model
        self.statusMessage.emit(f"Converting: {text}")
    
    @Slot()
    def start_speech_recording(self):
        """Start recording speech for conversion"""
        self.statusMessage.emit("Speech recording started")
    
    @Slot()
    def stop_speech_recording(self):
        """Stop recording speech"""
        self.statusMessage.emit("Speech recording stopped")