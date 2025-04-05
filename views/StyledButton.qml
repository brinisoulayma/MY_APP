// views/StyledButton.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: styledButton
    width: 200
    height: 40
    
    property color primaryColor: "#007BFF"
    property color hoverColor: Qt.lighter(primaryColor, 1.1)
    property color pressedColor: Qt.darker(primaryColor, 1.1)
    property bool loading: false
    
    contentItem: Item {
        anchors.fill: parent
        
        Text {
            id: buttonText
            text: styledButton.text
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: 14
            visible: !styledButton.loading
        }
        
        // Loading spinner
        Item {
            id: loadingIndicator
            anchors.centerIn: parent
            width: 24
            height: 24
            visible: styledButton.loading
            
            RotationAnimator {
                target: loadingIndicator
                from: 0
                to: 360
                duration: 1200
                loops: Animation.Infinite
                running: styledButton.loading
            }
            
            Rectangle {
                width: 4
                height: 4
                radius: 2
                color: "white"
                anchors.verticalCenter: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
    
    background: Rectangle {
        id: backgroundRect
        color: styledButton.down ? styledButton.pressedColor : 
               styledButton.hovered ? styledButton.hoverColor : styledButton.primaryColor
        radius: 5
        
        // Ripple effect
        Rectangle {
            id: ripple
            width: 0
            height: 0
            radius: width / 2
            anchors.centerIn: parent
            color: "white"
            opacity: 0
            
            PropertyAnimation {
                id: rippleAnimation
                target: ripple
                properties: "width, height, opacity"
                from: 0
                to: backgroundRect.width * 2
                duration: 400
                easing.type: Easing.OutQuad
                onFinished: {
                    ripple.width = 0
                    ripple.height = 0
                    ripple.opacity = 0
                }
            }
        }
    }
    
    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onPressed: {
            ripple.x = mouseX - ripple.width / 2
            ripple.y = mouseY - ripple.height / 2
            rippleAnimation.start()
        }
        onClicked: styledButton.clicked()
    }
}