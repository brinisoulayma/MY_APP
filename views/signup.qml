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
            text: "Create Account"
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
            placeholderText: "Choose Username"
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

        // Password
        PasswordField {
            id: passwordField
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

            // Password validation logic
            onTextChanged: {
                var validation = mainController.auth_controller.validate_password(text)
                lengthCondition.color = validation.length ? "green" : "red"
                upperCondition.color = validation.upper ? "green" : "red"
                lowerCondition.color = validation.lower ? "green" : "red"
                numberCondition.color = validation.number ? "green" : "red"
                specialCondition.color = validation.special ? "green" : "red"
            }
        }

        // Password Strength Indicators
        ColumnLayout {
            spacing: 4
            Layout.alignment: Qt.AlignLeft

            Text { 
                id: lengthCondition
                text: "✓ 8+ characters"
                color: "red"
            }
            Text { 
                id: upperCondition
                text: "✓ Uppercase letter"
                color: "red"
            }
            Text { 
                id: lowerCondition
                text: "✓ Lowercase letter"
                color: "red"
            }
            Text { 
                id: numberCondition
                text: "✓ Number"
                color: "red"
            }
            Text { 
                id: specialCondition
                text: "✓ Special character"
                color: "red"
            }
        }

        // Security Questions
        ComboBox {
            id: securityQuestion1
            Layout.fillWidth: true
            model: [
                "What city were you born in?",
                "What's your mother's maiden name?",
                "What was your first pet's name?"
            ]
            font.family: "Roboto"
        }

        TextField {
            id: answer1
            placeholderText: "Answer 1"
            Layout.fillWidth: true
            font.family: "Roboto"
        }

        ComboBox {
            id: securityQuestion2
            Layout.fillWidth: true
            model: [
                "What's your favorite movie?",
                "What school did you first attend?",
                "What's your childhood nickname?"
            ]
            font.family: "Roboto"
        }

        TextField {
            id: answer2
            placeholderText: "Answer 2"
            Layout.fillWidth: true
            font.family: "Roboto"
        }

        // Create Account Button
        Button {
            text: "Create Account"
            Layout.fillWidth: true
            Material.background: Material.primary
            Material.foreground: "white"
            font {
                bold: true
                family: "Roboto"
            }
            onClicked: mainController.auth_controller.signup(
                usernameField.text,
                passwordField.text,
                securityQuestion1.currentText,
                answer1.text,
                securityQuestion2.currentText,
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