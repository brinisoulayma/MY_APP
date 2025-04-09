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

        // Password Field with Validation
        PasswordField {
            id: passwordField
            Layout.fillWidth: true
            leftPadding: 48
            font.pixelSize: 16
            property bool isValid: false
            
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

            onTextChanged: {
                var validation = mainController.auth.validate_password(text)
                isValid = validation.length && validation.upper && 
                        validation.lower && validation.number && validation.special
                
                // Update indicators
                lengthCondition.color = validation.length ? "green" : "red"
                upperCondition.color = validation.upper ? "green" : "red"
                lowerCondition.color = validation.lower ? "green" : "red"
                numberCondition.color = validation.number ? "green" : "red"
                specialCondition.color = validation.special ? "green" : "red"
            }
        }

        // Password Requirements
        ColumnLayout {
            spacing: 4
            Layout.alignment: Qt.AlignLeft
            visible: passwordField.text.length > 0  // Only show when typing

            Label {
                text: "Password must contain:"
                font.pixelSize: 12
                color: Material.color(Material.Grey)
            }

            RowLayout {
                spacing: 8
                Text { 
                    id: lengthCondition
                    text: "• 8+ characters"
                    color: "red"
                    font.pixelSize: 12
                }
                Text { 
                    id: upperCondition
                    text: "• Uppercase"
                    color: "red"
                    font.pixelSize: 12
                }
                Text { 
                    id: lowerCondition
                    text: "• Lowercase"
                    color: "red"
                    font.pixelSize: 12
                }
            }

            RowLayout {
                spacing: 8
                Text { 
                    id: numberCondition
                    text: "• Number"
                    color: "red"
                    font.pixelSize: 12
                }
                Text { 
                    id: specialCondition
                    text: "• Special char"
                    color: "red"
                    font.pixelSize: 12
                }
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
            id: createAccountButton
            text: "Create Account"
            Layout.fillWidth: true
            Material.background: Material.primary
            Material.foreground: "white"
            font {
                bold: true
                family: "Roboto"
            }
            enabled: passwordField.isValid && 
                    usernameField.text.length > 0 &&
                    answer1.text.length > 0 &&
                    answer2.text.length > 0

            opacity: enabled ? 1 : 0.6
            Behavior on opacity { NumberAnimation { duration: 100 } }

            onClicked: {
                mainController.auth.signup( // Changed to auth
                    usernameField.text,
                    passwordField.text,
                    securityQuestion1.currentText,
                    answer1.text,
                    securityQuestion2.currentText,
                    answer2.text
                )
            }
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

    // Connections for handling errors
    Connections {
        target: mainController.auth // Changed to auth
        function onErrorOccurred(message) {
            errorPopup.show(message)
        }
    }
}