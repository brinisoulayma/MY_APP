import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    property string username  // Must match passed property name

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            text: "Welcome, " + username + "!"
            font.pixelSize: 24
        }

        Button {
            text: "Log Out"
            onClicked: stackView.pop()
        }
    }
}