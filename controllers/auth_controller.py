# controllers/auth_controller.py
from PySide6.QtCore import QObject, Signal, Slot
import hashlib
import re
from models.user_model import UserModel

class AuthController(QObject):
    # Define signals for login/register events
    loginSuccess = Signal()
    loginError = Signal(str)
    registerSuccess = Signal()
    registerError = Signal(str)
    userLoggedIn = Signal(str)
    userLoggedOut = Signal()
    
    def __init__(self):
        super().__init__()
        self.current_user = None
    
    def _hash_password(self, password):
        """Hash password using SHA-256"""
        return hashlib.sha256(password.encode()).hexdigest()
    
    def _validate_email(self, email):
        """Validate email format"""
        pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        return re.match(pattern, email) is not None
    
    @Slot(str, str)
    def login(self, username, password):
        """Authenticate user credentials"""
        if not username or not password:
            self.loginError.emit("Please enter both username and password")
            return
            
        # Hash password for comparison
        hashed_password = self._hash_password(password)
        
        # Get user from database
        user = UserModel.get_user_by_username(username)
        
        if user and user['password'] == hashed_password:
            self.current_user = username
            self.loginSuccess.emit()
            self.userLoggedIn.emit(username)
        else:
            self.loginError.emit("Invalid username or password")
    
    @Slot(str, str, str)
    def register(self, username, password, email):
        """Register a new user"""
        # Validation
        if not username or not password or not email:
            self.registerError.emit("All fields are required")
            return
            
        if len(password) < 8:
            self.registerError.emit("Password must be at least 8 characters")
            return
            
        if not self._validate_email(email):
            self.registerError.emit("Invalid email format")
            return
            
        # Hash password before storing
        hashed_password = self._hash_password(password)
        
        # Create user in database
        success = UserModel.create_user(username, hashed_password, email)
        
        if success:
            self.registerSuccess.emit()
        else:
            self.registerError.emit("Username or email already exists")
    
    @Slot()
    def logout(self):
        """Log out the current user"""
        self.current_user = None
        self.userLoggedOut.emit()