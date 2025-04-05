// views/ConverterView.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: converterView
    width: parent.width
    height: parent.height
    color: "#f5f5f5"
    
    property bool isSignToText: true
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15
        
        // Mode toggle
        Rectangle {
            Layout.fillWidth: true
            height: 50
            radius: 25
            color: "white"
            
            Row {
                anchors.fill: parent
                anchors.margins: 5
                
                Rectangle {
                    width: parent.width / 2
                    height: 40
                    radius: 20
                    color: isSignToText ? "#007BFF" : "transparent"
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Sign → Text"
                        color: isSignToText ? "white" : "#555"
                        font.pixelSize: 14
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: isSignToText = true
                    }
                    
                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
                
                Rectangle {
                    width: parent.width / 2
                    height: 40
                    radius: 20
                    color: !isSignToText ? "#007BFF" : "transparent"
                    
                    Text {
                        anchors.centerIn: parent
                        text: "Speech → Sign"
                        color: !isSignToText ? "white" : "#555"
                        font.pixelSize: 14
                    }
                    
                    MouseArea {
                        anchors.fill: parent
                        onClicked: isSignToText = false
                    }
                    
                    Behavior on color {
                        ColorAnimation { duration: 150 }
                    }
                }
            }
        }
        
        // Content area depends on conversion mode
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            // Sign to Text View
            Rectangle {
                visible: isSignToText
                anchors.fill: parent
                color: "white"
                radius: 10
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15
                    
                    Text {
                        text: "Sign Language to Text Converter"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredHeight: 200
                        color: "#f0f0f0"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Camera feed will appear here"
                            color: "#888"
                        }
                        
                        // Camera feed would be implemented here
                    }
                    
                    StyledButton {
                        text: "Start Camera"
                        Layout.alignment: Qt.AlignHCenter
                        onClicked: {
                            // Connect to camera start function in controller
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        height: 100
                        color: "#f9f9f9"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                        
                        ScrollView {
                            anchors.fill: parent
                            anchors.margins: 10
                            
                            TextArea {
                                id: signToTextOutput
                                readOnly: true
                                wrapMode: TextEdit.Wrap
                                placeholderText: "Detected text will appear here"
                            }
                        }
                    }
                }
            }
            
            // Speech to Sign View
            Rectangle {
                visible: !isSignToText
                anchors.fill: parent
                color: "white"
                radius: 10
                
                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 15
                    
                    Text {
                        text: "Speech to Sign Language Converter"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                    }
                    
                    StyledTextField {
                        id: speechInput
                        Layout.fillWidth: true
                        placeholderText: "Type text or use microphone..."
                    }
                    
                    Row {
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 10
                        
                        StyledButton {
                            text: "Convert Text"
                            primaryColor: "#28a745"
                            width: 150
                            onClicked: {
                                // Connect to convert text function
                            }
                        }
                        
                        StyledButton {
                            text: "Record Voice"
                            primaryColor: "#dc3545"
                            width: 150
                            onClicked: {
                                // Connect to voice recording function
                            }
                        }
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.preferredHeight: 200
                        color: "#f0f0f0"
                        border.color: "#ccc"
                        border.width: 1
                        radius: 5
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Sign language animation will appear here"
                            color: "#888"
                        }
                    }
                }
            }
        }
    }
}