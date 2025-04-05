from PySide6.QtCore import QObject, Slot
from PySide6.QtQml import QQmlApplicationEngine

class MainController:
    def __init__(self, engine):
        super().__init__()
        self.engine = engine  # Store the QML engine for loading views

    @Slot()
    def show_signup(self):
        self.engine.load("views/signup.qml")

    @Slot()
    def show_forgot_password(self):
        self.engine.load("views/forgot_password.qml")