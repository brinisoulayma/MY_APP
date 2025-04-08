import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Page {
    padding: 24

    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width * 0.9, 400)
        spacing: 20

        // Header
        Image {
            source: "qrc:/images/logo.png" 
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 180
            Layout.preferredHeight: 180
            fillMode: Image.PreserveAspectFit
        }

        // Username Field
        TextField {
            id: usernameField
            placeholderText: "Username"
            Layout.fillWidth: true
            leftPadding: 40
            font.pixelSize: 16
        }

        // Password Field with Visibility Toggle
    
        PasswordField {
            id: passwordField
            Layout.fillWidth: true
            leftPadding: 48
            font.pixelSize: 16
            
            Image {
                source: "qrc:/resources/icons/lock.png"
                anchors { 
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    margins: 12
                }
                width: 24
                height: 24
            }
        }

        // Sign In Button
        Button {
            text: "SIGN IN"
            Layout.fillWidth: true
            Material.background: Material.primary
            Material.foreground: "white"
            font { 
                bold: true
                pixelSize: 16
                family: "Roboto"
            }
            onClicked: {
                if (usernameField.text === "" || passwordField.text === "") {
                    errorPopup.show("Please fill all fields")
                    return
                }
                mainController.auth_controller.login(usernameField.text, passwordField.text)
            }
        }

        // Navigation Links
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            
            Button {
                text: "SIGN UP"
                flat: true
                font.pixelSize: 14
                onClicked: stackView.push("Signup.qml")
            }

            Button {
                text: "FORGOT PASSWORD?"
                flat: true
                font.pixelSize: 14
                onClicked: stackView.push("ForgotPassword.qml")
            }
        }
    }

    ErrorPopup { id: errorPopup }
    SuccessPopup { id: successPopup }
}