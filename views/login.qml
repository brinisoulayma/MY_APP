// views/login.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: loginWindow
    visible: true
    width: 400
    height: 500
    title: "Sign Language Converter - Login"
    
    property bool isLogin: true
    
    Rectangle {
        anchors.fill: parent
        color: "#f5f5f5"
        
        Rectangle {
            id: formCard
            width: parent.width * 0.9
            height: isLogin ? 350 : 450
            anchors.centerIn: parent
            radius: 10
            color: "white"
            
            // Card shadow
            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                horizontalOffset: 0
                verticalOffset: 3
                radius: 8.0
                samples: 17
                color: "#20000000"
            }
            
            Behavior on height {
                NumberAnimation { duration: 200 }
            }
            
            ColumnLayout {
                anchors.centerIn: parent
                width: parent.width * 0.8
                spacing: 20
                
                Text {
                    text: isLogin ? "Login" : "Create Account"
                    font.pixelSize: 24
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }
                
                StyledTextField {
                    id: usernameField
                    placeholderText: "Username"
                    Layout.fillWidth: true
                    iconSource: ":/resources/icons/user-icon.png"
                }
                
                StyledTextField {
                    id: emailField
                    placeholderText: "Email"
                    Layout.fillWidth: true
                    iconSource: ":/resources/icons/envelope.png"
                    visible: !isLogin
                }
                
                PasswordField {
                    id: passwordField
                    placeholderText: "Password"
                    Layout.fillWidth: true
                }
                
                PasswordField {
                    id: confirmPasswordField
                    placeholderText: "Confirm Password"
                    Layout.fillWidth: true
                    visible: !isLogin
                }
                
                StyledButton {
                    id: actionButton
                    text: isLogin ? "Login" : "Sign Up"
                    Layout.fillWidth: true
                    onClicked: {
                        if (isLogin) {
                            authController.login(usernameField.text, passwordField.text)
                        } else {
                            if (passwordField.text === confirmPasswordField.text) {
                                authController.register(usernameField.text, passwordField.text, emailField.text)
                            } else {
                                errorText.text = "Passwords do not match"
                                errorText.visible = true
                            }
                        }
                    }
                }
                
                Text {
                    id: errorText
                    text: ""
                    color: "red"
                    visible: false
                    Layout.alignment: Qt.AlignHCenter
                }
                
                Text {
                    id: switchModeText
                    text: isLogin ? "Don't have an account? <a href='#'>Sign up</a>" : "Already have an account? <a href='#'>Login</a>"
                    Layout.alignment: Qt.AlignHCenter
                    onLinkActivated: {
                        isLogin = !isLogin
                        errorText.visible = false
                    }
                }
            }
        }
    }
    
    // Connections to handle auth controller responses
    Connections {
        target: authController
        
        function onLoginSuccess() {
            mainController.show_main()
        }
        
        function onLoginError(message) {
            errorText.text = message
            errorText.visible = true
        }
        
        function onRegisterSuccess() {
            isLogin = true
            errorText.text = "Account created successfully. Please login."
            errorText.color = "green"
            errorText.visible = true
        }
        
        function onRegisterError(message) {
            errorText.text = message
            errorText.visible = true
        }
    }
}