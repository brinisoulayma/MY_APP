import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

TextField {
    id: textField  // Changed from 'input' to 'textField'
    property bool showPassword: false
    echoMode: showPassword ? TextInput.Normal : TextInput.Password
    placeholderText: "Password"
    rightPadding: eyeButton.width + 32
    font.family: "Roboto"

    // Proper alias declaration
    property alias text: textField.text  // Reference the TextField's text property

    Button {
        id: eyeButton
        anchors { 
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: 8
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