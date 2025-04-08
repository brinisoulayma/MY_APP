from PyQt5.QtCore import QObject, pyqtProperty
from Controllers.auth_controller import AuthController

class MainController(QObject):
    def __init__(self):
        super().__init__()
        self._auth_controller = AuthController()
    
    @pyqtProperty(QObject, constant=True)
    def auth_controller(self):
        return self._auth_controller