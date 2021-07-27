import QtQuick 2.0

Rectangle {
    id: root
    property string place: "Uyo, Nigeria"
    radius: 5
    color: "transparent"
//    border.color: "transparent"
    Rectangle {
        width: 5
        height: width
        color: "red"
        anchors.verticalCenter: parent.verticalCenter
        x: 10
    }

    Text {
        text: place
        x: parent.width * 0.3
        anchors.verticalCenter: parent.verticalCenter
        font{family: "Comfortaa"; pointSize: 10}
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.border.color = "#4050D2"
        onExited: root.border.color = "transparent"
    }

}
