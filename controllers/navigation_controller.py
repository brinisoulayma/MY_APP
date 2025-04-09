from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot

class NavigationController(QObject):
    navigateToSignup = pyqtSignal()
    navigateToLogin = pyqtSignal()
    navigateToHome = pyqtSignal(str)
    
    @pyqtSlot()
    def goToSignup(self):
        self.navigateToSignup.emit()
    
    @pyqtSlot()
    def goToLogin(self):
        self.navigateToLogin.emit()
    
    @pyqtSlot(str)
    def goToHome(self, username):
        self.navigateToHome.emit(username)