// HoverHandler.qml
import QtQuick 2.15

Item {
    property alias hovered: hoverArea.containsMouse
    signal clicked

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: parent.clicked()
    }
}