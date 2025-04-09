import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15  // Add missing import

Popup {
    id: errorPopup
    width: 300
    height: 150
    modal: true
    anchors.centerIn: parent
    property string message: ""
    
    function show(text) {
        message = text
        open()
    }

    Rectangle {
        anchors.fill: parent
        color: "#ffeeee"
        border.color: "#ff4444"
        radius: 5

        ColumnLayout {  // Now recognized due to Layouts import
            anchors.fill: parent
            anchors.margins: 10
            Text {
                text: "Error"
                color: "#ff4444"
                font.bold: true
            }
            Text {
                text: errorPopup.message
                wrapMode: Text.WordWrap
            }
            Button {
                text: "OK"
                onClicked: errorPopup.close()
            }
        }
    }
}