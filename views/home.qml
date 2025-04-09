import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    property string username: ""
    
    Label {
        anchors.centerIn: parent
        text: "Welcome, " + username + "!"
        font.pixelSize: 20
    }

    // Add session initialization logic here
    Component.onCompleted: {
        // Initialize user session
        mainController.auth.initializeSession(username)
    }
}