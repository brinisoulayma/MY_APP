import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Secure Auth App"

    StackView {
        id: stackView
        initialItem: Qt.resolvedUrl("Login.qml")  // Explicit resolution
        anchors.fill: parent

        ToastNotification {
            id: globalToast
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
        }
    }

    // Add this connection
    Connections {
        target: navController
        function onNavigateToSignup() {
            stackView.push("Signup.qml")
        }
    }
}