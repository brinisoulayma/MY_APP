from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine

class MainController(QObject):
    def __init__(self, engine):
        super().__init__()
        self.engine = engine  # Store the QML engine for loading views
        
    @Slot()
    def show_login(self):
        """Show the login screen"""
        self.engine.clearComponentCache()  # Clear cache to ensure latest version is loaded
        self.engine.load("views/login.qml")
        
    @Slot()
    def show_home(self):
        """Show the home screen"""
        self.engine.clearComponentCache()
        self.engine.load("views/home.qml")

    @Slot()
    def show_signup(self):
        """Show the signup screen"""
        self.engine.clearComponentCache()
        self.engine.load("views/signup.qml")

    @Slot()
    def show_forgot_password(self):
        """Show the forgot password screen"""
        self.engine.clearComponentCache()
        self.engine.load("views/forgot_password.qml")
        
    @Slot()
    def show_converter(self):
        """Show the converter screen"""
        self.engine.clearComponentCache()
        self.engine.load("views/ConverterView.qml")