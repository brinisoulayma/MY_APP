// views/PasswordField.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: passwordField
    width: 200
    height: 40
    echoMode: TextInput.Password
    placeholderText: "Enter password"
    
    property bool passwordVisible: false
    
    background: Rectangle {
        border.color: passwordField.focus ? "#007BFF" : "#ccc"
        border.width: passwordField.focus ? 2 : 1
        radius: 5
    }

    rightPadding: 30 // Make room for the eye icon

    Image {
        id: eyeIcon
        source: passwordField.passwordVisible ? ":/resources/icons/eye-open.png" : ":/resources/icons/eye-closed.png"
        width: 20
        height: 20
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        opacity: 0.7
        
        MouseArea {
            anchors.fill: parent
            onClicked: {
                passwordField.passwordVisible = !passwordField.passwordVisible
                passwordField.echoMode = passwordField.passwordVisible ? TextInput.Normal : TextInput.Password
            }
        }
    }
}