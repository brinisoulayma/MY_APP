// views/StyledButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    width: 200
    height: 40
    background: Rectangle {
        color: "#007BFF"
        radius: 5
    }
    contentItem: Text {
        text: parent.text
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}