# controllers/main_controller.py
from PySide6.QtCore import QObject, Signal, Slot, Property, QUrl

class MainController(QObject):
    def __init__(self, engine):
        super().__init__()
        self.engine = engine
        self.current_view = None
    
    @Slot()
    def show_login(self):
        """Switch to the login view"""
        self.engine.clearComponentCache()
        self.engine.load(QUrl("views/login.qml"))
        
    @Slot()
    def show_main(self):
        """Switch to the main application view"""
        self.engine.clearComponentCache()
        self.engine.load(QUrl("views/main.qml"))