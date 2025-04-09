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
        id: messageLabel
        text: "Operation successful!"
        anchors.centerIn: parent
        font.pixelSize: 18
        font.bold: true
    }

    // Timer for auto-closing the popup
    Timer {
        id: autoCloseTimer
        interval: 2000
        onTriggered: {
            parent.close()
            if (messageLabel.text === "Account created successfully!") {
                stackView.pop()
            }
        }
    }

    // Function to show the popup with a message
    function show(text) {
        messageLabel.text = text
        open()
        autoCloseTimer.start()
    }
}