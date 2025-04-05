import QtQuick.Controls.Material 2.15

ApplicationWindow {
    Material.theme: Material.Dark  // Optional: set a theme
    Material.accent: Material.Purple  // Optional: set an accent color
    id: window
    visible: true
    width: 400
    height: 300
    title: "My App"

    Component.onCompleted: {
        mainController.show_login()
    }
}