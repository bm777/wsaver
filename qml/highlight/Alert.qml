import QtQuick 2.0

Rectangle {
    id: root

    property string alert2: "Tornad"
    property string level: {
        if(lang === "Français") {
            if(level > 6) return "risque élevé"
            else if(level > 3) return "risque moyen"
            else return "faible risque"
        }

        if(lang === "English") return "Flood (" + level + ")"
    }

    property string lang: ""
    property string alert1: {
        if(lang === "Français") return "Innondation (" + level + ")"
        if(lang === "English") return "Flood (" + level + ")"
    }

    radius: 10

    Text {
        text: root.alert1
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }

    Rectangle {
        id: frame_
        radius: height/2
        width: parent.width * 0.8
        height: 30
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
    Text {id: flood_cm
        text: "3"
        font{family: "Comfortaa"; pointSize: 15; bold: true}
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.7

    }
    Text {
        text: "cm"
        font{family: "Comfortaa"; pointSize: 11; bold: false}
        y: parent.height * 0.68
        x: flood_cm.x + flood_cm.width + 5
    }
    Text {
        text: "10+"
        color: "#4050D2"
        font{family: "Comfortaa"; pointSize: 11; bold: false}
        y: parent.height * 0.68
        x: frame_.x + frame_.width - width
    }
}
