# main_controller.py (updated)
from PyQt5.QtCore import QObject, pyqtProperty
from Controllers.navigation_controller import NavigationController
from Controllers.auth_controller import AuthController

class MainController(QObject):
    def __init__(self):
        super().__init__()
        self._navigation = NavigationController()
        self._auth = AuthController()

    # Expose as pyqtProperty instead of regular @property
    @pyqtProperty(QObject, constant=True)
    def nav(self):
        return self._navigation

    @pyqtProperty(QObject, constant=True)
    def auth(self):
        return self._auth