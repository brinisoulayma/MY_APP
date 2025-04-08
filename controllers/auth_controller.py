from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
from Models.user_model import UserModel
import hashlib
import re

class AuthController(QObject):
    loginSuccess = pyqtSignal(str)
    signupSuccess = pyqtSignal()
    passwordResetSuccess = pyqtSignal()
    errorOccurred = pyqtSignal(str)

    def __init__(self):
        super().__init__()
        self.user_model = UserModel()

    def _validate_password(self, password):
        return {
            'length': len(password) >= 8,
            'upper': bool(re.search(r'[A-Z]', password)),
            'lower': bool(re.search(r'[a-z]', password)),
            'number': bool(re.search(r'[0-9]', password)),
            'special': bool(re.search(r'[^A-Za-z0-9]', password))
        }

    @pyqtSlot(str, str, str, str, str, str)
    def signup(self, username, password, q1, a1, q2, a2):
        if not all([username, password, q1, a1, q2, a2]):
            self.errorOccurred.emit("Please fill all fields")
            return
            
        if self.user_model.user_exists(username):
            self.errorOccurred.emit("Username already exists")
            return
            
        validation = self._validate_password(password)
        if not all(validation.values()):
            self.errorOccurred.emit("Password doesn't meet requirements")
            return
            
        self.user_model.create_user(username, 
                                  hashlib.sha256(password.encode()).hexdigest(),
                                  q1, a1.lower(), q2, a2.lower())
        self.signupSuccess.emit()