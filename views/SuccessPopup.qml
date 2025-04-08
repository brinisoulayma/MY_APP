import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Popup {
    id: successPopup
    width: 300
    height: 150
    modal: true
    anchors.centerIn: parent

    // Existing properties and content of the successPopup
    Label {
        text: "Operation successful!"
        anchors.centerIn: parent
        font.pixelSize: 18
        font.bold: true
    }

    Timer {
        interval: 2000
        running: successPopup.visible
        onTriggered: {
            successPopup.close()
            if (message === "Account created successfully!") {
                stackView.pop()
            }
        }
    }
}