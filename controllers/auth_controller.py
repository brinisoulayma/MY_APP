from PySide6.QtCore import QObject, Slot

class AuthController(QObject):
    @Slot(str, str)
    def login(self, username, password):
        # Your login logic here, e.g.:
        if username == "admin" and password == "password":
            print("Login successful!")
        else:
            print("Login failed!")