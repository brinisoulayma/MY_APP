import QtQuick.Controls.Material 2.15

ApplicationWindow {
    Material.theme: Material.Dark  // Optional: set a theme
    Material.accent: Material.Purple  // Optional: set an accent color
    visible: true
    width: 400
    height: 300
    title: "Forgot Password"

    Column {
        anchors.centerIn: parent
        spacing: 10

        StyledTextField {
            id: usernameField
            placeholderText: "Username"
        }

        PasswordField {
            id: newPasswordField
            placeholderText: "New Password"
        }

        StyledButton {
            text: "Reset Password"
            onClicked: {
                authController.reset_password(usernameField.text, newPasswordField.text)
            }
        }

        StyledButton {
            text: "Back to Login"
            onClicked: mainController.show_login()
        }
    }

    Connections {
        target: authController
        function onPasswordResetSuccess() {
            mainController.show_login()
        }
        function onPasswordResetFailure(message) {
            errorLabel.text = message
        }
    }

    Label {
        id: errorLabel
        color: "red"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}