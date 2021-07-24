import QtQuick 2.0

Rectangle {
    id: root
    property string value: "12"
    property string dataname: "Humidity"
    radius: 10

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }

    Text {
        text: "3"
        font{family: "Comfortaa"; pointSize: 15; bold: true}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.1
    }


    Rectangle {
        id: frame_
        radius: width/2
        width: 30
        height: parent.width * 0.8
        border.color: "#40ADADAD"
        anchors.centerIn: parent


        Rectangle {
            width: height
            height: parent.height * 0.65
            anchors.verticalCenter: parent.verticalCenter
            color: "#4050D2"
            x: (parent.height - height) / 2
            radius: height/2
        }

    }

}
