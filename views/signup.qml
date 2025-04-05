import QtQuick.Controls.Material 2.15

ApplicationWindow {
    Material.theme: Material.Dark  // Optional: set a theme
    Material.accent: Material.Purple  // Optional: set an accent color
    visible: true
    width: 400
    height: 300
    title: "Sign Up"

    Column {
        anchors.centerIn: parent
        spacing: 10

        StyledTextField {
            id: usernameField
            placeholderText: "Username"
        }

        PasswordField {
            id: passwordField
            placeholderText: "Password"
        }

        StyledTextField {
            id: emailField
            placeholderText: "Email"
        }

        StyledButton {
            text: "Sign Up"
            onClicked: {
                authController.signup(usernameField.text, passwordField.text, emailField.text)
            }
        }

        StyledButton {
            text: "Back to Login"
            onClicked: mainController.show_login()
        }
    }

    Connections {
        target: authController
        function onSignupSuccess() {
            mainController.show_login()
        }
        function onSignupFailure(message) {
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