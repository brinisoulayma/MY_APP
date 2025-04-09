import sys
import os
import my_app_rc 
from pathlib import Path
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QUrl
from Controllers.main_controller import MainController

def handle_qml_errors(errors):
    for error in errors:
        print(f"QML Error: {error.toString()}")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    
    # Configure engine
    engine = QQmlApplicationEngine()
    root_path = Path(__file__).parent
    
    # Set Material Design configuration
    os.environ["QT_QUICK_CONTROLS_CONF"] = str(root_path / "qtquickcontrols2.conf")
    
    # Initialize controller
    main_controller = MainController()
    
    # Expose controllers to QML
    engine.rootContext().setContextProperty("mainController", main_controller)
    engine.rootContext().setContextProperty("authController", main_controller.auth)
    engine.rootContext().setContextProperty("navController", main_controller.nav)
    
    # Set import paths
    engine.addImportPath(str(root_path / "Views"))
    engine.addImportPath(str(root_path / "resources"))
    
    # Load main QML
    engine.load(QUrl.fromLocalFile(str(root_path / "Views" / "Main.qml")))
    
    if not engine.rootObjects():
        sys.exit(-1)
    
    sys.exit(app.exec_())