import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

Page {
    padding: 24

    ColumnLayout {
        anchors.centerIn: parent
        width: Math.min(parent.width * 0.9, 400)
        spacing: 16

        Label {
            text: "Password Recovery"
            font {
                pixelSize: 24
                bold: true
                family: "Roboto"
            }
            Layout.alignment: Qt.AlignHCenter
        }

        // Username
        TextField {
            id: usernameField
            placeholderText: "Your Username"
            Layout.fillWidth: true
            leftPadding: 48
            font.pixelSize: 16
            
            Image {
                source: "qrc:/icons/user-icon.png"
                anchors { 
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    margins: 12
                }
                width: 24
                height: 24
            }
        }

        // Security Questions
        Label {
            id: question1Label
            text: mainController.auth_controller.get_question1(usernameField.text)
            visible: usernameField.text !== ""
        }

        TextField {
            id: answer1
            placeholderText: "Answer 1"
            Layout.fillWidth: true
            font.family: "Roboto"
        }

        Label {
            id: question2Label
            text: mainController.auth_controller.get_question2(usernameField.text)
            visible: usernameField.text !== ""
        }

        TextField {
            id: answer2
            placeholderText: "Answer 2"
            Layout.fillWidth: true
            font.family: "Roboto"
        }

        // New Password
        PasswordField {
            id: newPassword
            Layout.fillWidth: true
            leftPadding: 48
            font.pixelSize: 16
            
            Image {
                source: "qrc:/icons/lock.png"
                anchors { 
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                    margins: 12
                }
                width: 24
                height: 24
            }

            // Visibility Toggle Button
        }



        // Reset Button
        Button {
            text: "Reset Password"
            Layout.fillWidth: true
            Material.background: Material.primary
            Material.foreground: "white"
            font {
                bold: true
                family: "Roboto"
            }
            onClicked: mainController.auth_controller.reset_password(
                usernameField.text,
                newPassword.text,
                answer1.text,
                answer2.text
            )
        }

        // Back Navigation
        Button {
            text: "← Back to Login"
            Layout.alignment: Qt.AlignLeft
            flat: true
            font.family: "Roboto"
            onClicked: stackView.pop()
        }
    }

    ErrorPopup { id: errorPopup }
    SuccessPopup { id: successPopup }
}