// views/main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 600
    title: "Sign Language Converter"
    
    Material.theme: Material.Light
    Material.accent: Material.Blue
    
    // User info
    property string currentUsername: ""
    
    header: ToolBar {
        height: 60
        Material.foreground: "white"
        
        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            
            Label {
                text: "Sign Language Converter"
                font.pixelSize: 18
                font.bold: true
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignLeft
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            
            Label {
                text: currentUsername ? "Welcome, " + currentUsername : ""
                visible: currentUsername !== ""
                font.pixelSize: 14
            }
            
            ToolButton {
                text: "Logout"
                onClicked: {
                    authController.logout()
                    mainController.show_login()
                }
            }
        }
    }
    
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: converterComponent
    }
    
    Component {
        id: converterComponent
        ConverterView {}
    }
    
    Component.onCompleted: {
        // This onCompleted will be called when this view is loaded
        // You can initialize things here if needed
    }
    
    // Connections to handle controller signals
    Connections {
        target: authController
        
        function onUserLoggedIn(username) {
            currentUsername = username
        }
        
        function onUserLoggedOut() {
            currentUsername = ""
        }
    }
}