import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: forgotPasswordWindow
    visible: true
    width: 400
    height: 500
    title: "Sign Language Converter - Reset Password"
    
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    
    Rectangle {
        anchors.fill: parent
        color: "#121212"  // Dark background
        
        Text {
            id: resetTitle
            text: "Reset Password"
            color: "#FFFFFF"
            font.pixelSize: 24
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }
        
        Text {
            id: resetInstructions
            text: "Enter your username and new password"
            color: "#CCCCCC"
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: resetTitle.bottom
            anchors.topMargin: 20
            width: parent.width * 0.8
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }
        
        Column {
            anchors.top: resetInstructions.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 15
            width: parent.width * 0.8
            
            RowLayout {
                width: parent.width
                
                Image {
                    source: "qrc:/resources/icons/user-icon.png"
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                StyledTextField {
                    id: usernameField
                    placeholderText: "Username"
                    Layout.fillWidth: true
                }
            }
            
            RowLayout {
                width: parent.width
                
                Image {
                    source: "qrc:/resources/icons/lock.png" 
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                PasswordField {
                    id: newPasswordField
                    placeholderText: "New Password"
                    Layout.fillWidth: true
                }
            }
            
            RowLayout {
                width: parent.width
                
                Image {
                    source: "qrc:/resources/icons/lock.png" 
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                PasswordField {
                    id: confirmPasswordField
                    placeholderText: "Confirm New Password"
                    Layout.fillWidth: true
                }
            }
            
            StyledButton {
                text: "Reset Password"
                width: parent.width
                onClicked: {
                    if (newPasswordField.text !== confirmPasswordField.text) {
                        errorLabel.text = "Passwords do not match"
                    } else {
                        authController.reset_password(usernameField.text, newPasswordField.text)
                    }
                }
            }
            
            StyledButton {
                text: "Back to Login"
                width: parent.width
                onClicked: mainController.show_login()
            }
        }
        
        // Error message
        Label {
            id: errorLabel
            color: "#FF5252"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 14
        }
    }
    
    // Connections to handle password reset success/failure
    Connections {
        target: authController
        function onPasswordResetSuccess() {
            mainController.show_login()
        }
        function onPasswordResetFailure(message) {
            errorLabel.text = message
        }
    }
}