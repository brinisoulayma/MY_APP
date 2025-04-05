import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: homeWindow
    visible: true
    width: 800
    height: 600
    title: "Sign Language Converter - Home"
    
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    
    Rectangle {
        anchors.fill: parent
        color: "#121212"  // Dark background
        
        // Header
        Rectangle {
            id: header
            width: parent.width
            height: 60
            color: Material.primary
            
            Text {
                text: "Sign Language Converter"
                color: "#FFFFFF"
                font.pixelSize: 20
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 20
            }
            
            Button {
                text: "Logout"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 20
                onClicked: mainController.show_login()
                
                background: Rectangle {
                    color: "transparent"
                    border.color: "#FFFFFF"
                    border.width: 1
                    radius: 4
                }
                
                contentItem: Text {
                    text: parent.text
                    color: "#FFFFFF"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }
        
        Column {
            anchors.top: header.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 20
            width: parent.width * 0.9
            
            Text {
                text: "Welcome to the Sign Language Converter"
                color: "#FFFFFF"
                font.pixelSize: 24
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
            
            Text {
                text: "This application allows you to convert between sign language and text."
                color: "#CCCCCC"
                font.pixelSize: 16
                width: parent.width
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }
            
            // Feature cards
            Grid {
                columns: 2
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter
                
                // Speech to Sign Card
                Rectangle {
                    width: 350
                    height: 200
                    color: "#1E1E1E"
                    radius: 10
                    
                    Column {
                        anchors.centerIn: parent
                        spacing: 10
                        
                        Text {
                            text: "Speech to Sign"
                            color: "#FFFFFF"
                            font.pixelSize: 18
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            text: "Convert spoken language to sign language"
                            color: "#CCCCCC"
                            font.pixelSize: 14
                            width: 300
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                        }
                        
                        StyledButton {
                            text: "Open Converter"
                            width: 200
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: mainController.show_converter()
                        }
                    }
                }
                
                // Sign to Speech Card
                Rectangle {
                    width: 350
                    height: 200
                    color: "#1E1E1E"
                    radius: 10
                    
                    Column {
                        anchors.centerIn: parent
                        spacing: 10
                        
                        Text {
                            text: "Sign to Speech"
                            color: "#FFFFFF"
                            font.pixelSize: 18
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        
                        Text {
                            text: "Convert sign language to spoken language"
                            color: "#CCCCCC"
                            font.pixelSize: 14
                            width: 300
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                        }
                        
                        StyledButton {
                            text: "Open Converter"
                            width: 200
                            anchors.horizontalCenter: parent.horizontalCenter
                            onClicked: mainController.show_converter()
                        }
                    }
                }
            }
        }
        
        // Footer
        Text {
            text: "Sign Language Converter © 2025"
            color: "#888888"
            font.pixelSize: 12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}