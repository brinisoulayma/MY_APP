from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
# Import your controller classes
from controllers.main_controller import MainController
from controllers.auth_controller import AuthController

app = QGuiApplication([])
engine = QQmlApplicationEngine()

# Instantiate controllers
main_controller = MainController(engine)
auth_controller = AuthController()

# Set context properties
engine.rootContext().setContextProperty("mainController", main_controller)
engine.rootContext().setContextProperty("authController", auth_controller)

# Load the initial QML file
engine.load("views/login.qml")
app.exec()