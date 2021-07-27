import QtQuick 2.0

Rectangle {
    id: root
    property string place: "Uyo, Nigeria"
    radius: 5
    color: "transparent"
//    border.color: "transparent"
    Text {
        text: "Text"
        x: parent.width * 0.3
        anchors.verticalCenter: parent.verticalCenter
        font{family: "Comfortaa"; pointSize: 12}
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.border.color = "#4050D2"
    }

}
