import QtQuick.Controls.Material 2.15

ApplicationWindow {
    Material.theme: Material.Dark  // Optional: set a theme
    Material.accent: Material.Purple  // Optional: set an accent color
    visible: true
    width: 400
    height: 300

    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            text: "Login"
            onClicked: authController.login("username", "password")  // Example call
        }

        Button {
            text: "Sign Up"
            onClicked: mainController.show_signup()
        }

        Button {
            text: "Forgot Password"
            onClicked: mainController.show_forgot_password()
        }
    }
}