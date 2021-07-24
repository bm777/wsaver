import QtQuick 2.0

Rectangle {
    id: root
    property string alert1: "Flood"
    property string alert2: "Tornad"

    radius: 10

    Text {
        text: root.alert1
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }

    Rectangle {
        radius: height/2
        width: parent.width * 0.8
        height: 30
        border.color: "#40ADADAD"
        anchors.centerIn: parent


        Rectangle
    }
}
