import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

TextField {
    id: root
    echoMode: showPassword ? TextInput.Normal : TextInput.Password
    placeholderText: "Password"
    property bool showPassword: false
    rightPadding: eyeButton.width + 32
    font.family: "Roboto"

    // Visibility Toggle Button
    Button {
        id: eyeButton
        anchors { 
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: 12
        }
        flat: true
        icon.source: showPassword ? 
            "qrc:/icons/eye-open.png" : 
            "qrc:/icons/eye-closed.png"
        icon.color: Material.secondaryTextColor
        icon.width: 24
        icon.height: 24
        onClicked: showPassword = !showPassword
    }
}