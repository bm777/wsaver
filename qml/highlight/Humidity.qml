import QtQuick 2.0

Rectangle {
    id: root
    property real value: 0.123
    property string lang: ""
    property string dataname: {
        if(lang === "Français") return "Humidité"
        if(lang === "English") return "Humidity"
    }
    radius: 10
    color: "#ffffff"

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
    Text {
        text: {
            if(value >= 0.7) return "Bad"
            else if(value >= 0.5) return "Cold"
            else if(value >= 0.3) return "Very humide"
            else if(value >= 0.2) return "Humide"
            else return "Normal"
        }

        font{family: "Comfortaa"; pointSize: 10; bold: false}
        y: parent.height * 0.78
        x: parent.width * 0.2
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
