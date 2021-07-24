import QtQuick 2.0

Rectangle {
    id: root
    property string value: "7.70"
    property string dataname: "Wind Status"
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
        text: value
        font{family: "Comfortaa"; bold: false; pointSize: 25}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.2
    }
    Text {
        text: "m/s"
        font{family: "Comfortaa"; bold: false; pointSize: 12}
        y: parent.height * 0.47
        x: value_.x + value_.width + 5
    }


    Image {
        source: "../../img/compass.png"
        width: 25
        height: width
        y: parent.height * 0.68
        x: parent.width * 0.1

        Rectangle {
            width: 26
            height: width
            radius: height/2
            color: "transparent"
            border.color: "#404050D2"
            border.width: 0.5
            anchors.centerIn: parent
        }
    }


}
