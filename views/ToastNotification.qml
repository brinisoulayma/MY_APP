import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: toast
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.8
    height: 40
    visible: false

    function show(message) {
        toastText.text = message
        fadeIn.start()
    }

    Rectangle {
        id: toastRect
        anchors.fill: parent
        color: "#4CAF50"
        radius: 5
        opacity: 0

        Text {
            id: toastText
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 14
        }
    }

    SequentialAnimation {
        id: fadeIn
        running: false
        
        PropertyAnimation {
            target: toastRect
            property: "opacity"
            to: 1
            duration: 300
        }
        
        PauseAnimation { duration: 3000 }
        
        PropertyAnimation {
            target: toastRect
            property: "opacity"
            to: 0
            duration: 500
        }
        
        onFinished: {
            toast.visible = false
            stackView.replace("Home.qml")
        }
    }
}