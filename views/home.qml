import QtQuick.Controls.Material 2.15

ApplicationWindow {
    Material.theme: Material.Dark  // Optional: set a theme
    Material.accent: Material.Purple  // Optional: set an accent color
    visible: true
    width: 400
    height: 300
    title: "Home"

    Label {
        text: "Welcome to My App!"
        anchors.centerIn: parent
    }

    StyledButton {
        text: "Logout"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: mainController.show_login()
    }
}