import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

ApplicationWindow {
    id: signupWindow
    visible: true
    width: 400
    height: 600
    title: "Sign Language Converter - Sign Up"
    
    Material.theme: Material.Dark
    Material.accent: Material.Purple
    
    Rectangle {
        anchors.fill: parent
        color: "#121212"  // Dark background
        
        Text {
            id: signupTitle
            text: "Create an Account"
            color: "#FFFFFF"
            font.pixelSize: 24
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }
        
        Column {
            anchors.top: signupTitle.bottom
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
                    source: "qrc:/resources/icons/envelope.png"
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24
                }
                
                StyledTextField {
                    id: emailField
                    placeholderText: "Email"
                    Layout.fillWidth: true
                    inputMethodHints: Qt.ImhEmailCharactersOnly
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
                    id: passwordField
                    placeholderText: "Password"
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
                    placeholderText: "Confirm Password"
                    Layout.fillWidth: true
                }
            }
            
            StyledButton {
                text: "Sign Up"
                width: parent.width
                onClicked: {
                    if (passwordField.text !== confirmPasswordField.text) {
                        errorLabel.text = "Passwords do not match"
                    } else {
                        authController.signup(usernameField.text, passwordField.text, emailField.text)
                    }
                }
            }
            
            Text {
                text: "Already have an account?"
                color: "#CCCCCC"
                font.pixelSize: 14
                anchors.horizontalCenter: parent.horizontalCenter
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
    
    // Connections to handle signup success/failure
    Connections {
        target: authController
        function onSignupSuccess() {
            mainController.show_login()
        }
        function onSignupFailure(message) {
            errorLabel.text = message
        }
    }
}