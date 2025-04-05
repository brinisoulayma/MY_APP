// views/StyledTextField.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: styledField
    width: 200
    height: 40
    
    property string iconSource: ""
    
    leftPadding: iconSource ? 35 : 10
    
    background: Rectangle {
        border.color: styledField.focus ? "#007BFF" : "#ccc" 
        border.width: styledField.focus ? 2 : 1
        radius: 5
    }
    
    // Optional icon on the left
    Image {
        visible: styledField.iconSource !== ""
        source: styledField.iconSource
        width: 18
        height: 18
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        opacity: 0.7
    }
    
    // Animated focus effect
    Rectangle {
        id: focusIndicator
        anchors.fill: parent
        color: "#007BFF"
        opacity: 0
        radius: 5
        
        states: State {
            name: "focused"
            when: styledField.focus
            PropertyChanges {
                target: focusIndicator
                opacity: 0.1
            }
        }
        
        transitions: Transition {
            NumberAnimation { 
                property: "opacity"
                duration: 200
            }
        }
    }
}