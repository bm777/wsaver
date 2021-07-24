import QtQuick 2.0

Rectangle {
    id: root
    property real value: 0.5
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
        id: value_
        text: Math.round(Math.floor(value * 100), 0)
        font{family: "Comfortaa"; pointSize: 25; bold: false}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.2
    }
    Text {
        text: "%"
        font{family: "Comfortaa"; pointSize: 12; bold: false}
        y: value_.y
        x: value_.x + value_.width + 5
    }



    Rectangle {
        id: frame_
        radius: width/2
        width: 20
        height: parent.width * 0.4
        border.color: "#40ADADAD"
        x: parent.width * 0.75
        anchors.verticalCenter: parent.verticalCenter


        Rectangle {
            width: parent.width * 0.65
            height: width
            radius: width / 2
            color: "#4050D2"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * (1 - value) * 0.85
        }
    }

}
