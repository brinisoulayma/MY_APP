import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    property string linkText: ""
    
    background: Rectangle { color: "transparent" }
    
    contentItem: Text {
        text: linkText
        color: "blue"
        font.underline: true
    }
}