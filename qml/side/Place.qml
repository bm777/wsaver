import QtQuick 2.0

Rectangle {
    id: root
    property string place: "Uyo, Nigeria"
//    property type name: value
    property bool clicked: false
    radius: height/2 //5
    color: "transparent"
    border.color: "#104050D2"
    Rectangle {
        width: 10
        height: width
        color: "grey"
        radius: width/2
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.1
    }

    Text {id: t
        text: place
        x: parent.width * 0.25
        anchors.verticalCenter: parent.verticalCenter
        font{family: "Comfortaa"; pointSize: 10}
    }


}
