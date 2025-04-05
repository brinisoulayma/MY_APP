// views/PasswordField.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    width: 200
    height: 40
    echoMode: TextInput.Password
    background: Rectangle {
        border.color: "#ccc"
        radius: 5
    }

    Image {
        id: eyeIcon
        source: "resources/icons/eye_closed.png"
        width: 20
        height: 20
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if (parent.source.toString().endsWith("eye_closed.png")) {
                    parent.source = "resources/icons/eye_open.png"
                    parent.parent.echoMode = TextInput.Normal
                } else {
                    parent.source = "resources/icons/eye_closed.png"
                    parent.parent.echoMode = TextInput.Password
                }
            }
        }
    }
}