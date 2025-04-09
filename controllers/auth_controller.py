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

    @pyqtSlot(str, str)
    def login(self, username, password):
        hashed = self._hash_password(password)
        if self.user_model.verify_user(username, hashed):
            self.loginSuccess.emit(username)
        else:
            self.errorOccurred.emit("Invalid credentials")

    @pyqtSlot(str, str, str, str, str, str)
    def signup(self, username, password, q1, a1, q2, a2):
        if not all([username, password, q1, a1, q2, a2]):
            self.errorOccurred.emit("Please fill all fields")
            return
            
        if self.user_model.user_exists(username):
            self.errorOccurred.emit(f"Username '{username}' is already registered")
            return
            
        validation = self._validate_password(password)
        if not all(validation.values()):
            self.errorOccurred.emit("Password doesn't meet requirements")
            return
            
        hashed = self._hash_password(password)
        if self.user_model.create_user(username, hashed, q1, a1.lower(), q2, a2.lower()):
            self.signupSuccess.emit()

    def _validate_password(self, password):
        return {
            'length': len(password) >= 8,
            'upper': bool(re.search(r'[A-Z]', password)),
            'lower': bool(re.search(r'[a-z]', password)),
            'number': bool(re.search(r'[0-9]', password)),
            'special': bool(re.search(r'[^A-Za-z0-9]', password))
        }

    @pyqtSlot(str, result='QVariantMap')
    def validate_password(self, password):
        return {
            'length': len(password) >= 8,
            'upper': bool(re.search(r'[A-Z]', password)),
            'lower': bool(re.search(r'[a-z]', password)),
            'number': bool(re.search(r'[0-9]', password)),
            'special': bool(re.search(r'[^A-Za-z0-9]', password))
        }

    @pyqtSlot(str, str, str, str)
    def reset_password(self, username, new_password, answer1, answer2):
        # Implement actual password reset logic here
        try:
            # Example implementation:
            user = self.user_model.get_user(username)
            if user and (answer1.lower() == user[3]) and (answer2.lower() == user[5]):
                hashed = self._hash_password(new_password)
                self.user_model.update_password(username, hashed)
                self.passwordResetSuccess.emit()
            else:
                self.errorOccurred.emit("Invalid answers or username")
        except Exception as e:
            self.errorOccurred.emit(str(e))

    @pyqtSlot(str, result=str)
    def get_question1(self, username):
        user = self.user_model.get_user(username)
        return user[2] if user else ""

    @pyqtSlot(str, result=str)
    def get_question2(self, username):
        user = self.user_model.get_user(username)
        return user[4] if user else ""
    
    def _hash_password(self, password):
        return hashlib.sha256(password.encode()).hexdigest()