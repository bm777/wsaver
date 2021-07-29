import QtQuick 2.0

Rectangle {
    id: root

    property real value: 5
    property string level: {
        if(lang === "Français") {
            if(value > 6) return "risque élevé"
            else if(value > 3) return "risque moyen"
            else return "faible risque"
        }
        if(lang === "English") {
            if(value >= 6) return "high risk"
            else if(value >= 3) return "average risk"
            else return "low risk"
        }

    }

    property string lang: ""
    property string thema: ""
    color: thema === "Light" ? "#ffffff" : "#202442"
    border.color: thema === "Light" ? "transparent" : "#40E9E9E9"
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
        color: thema === "Light" ? "#ADADAD" : "#E9EBF9"

    }

    Rectangle {
        id: frame_
        radius: height/2
        width: parent.width * 0.8
        height: 30
        border.color: "#40ADADAD"
        color: thema === "Light" ? "#ffffff" : "#2D325A"
        anchors.centerIn: parent


        Rectangle {
            width: height
            height: parent.height * 0.65
            anchors.verticalCenter: parent.verticalCenter
            color: thema === "Light" ? "#4050D2" : "#F65164"
            x: (parent.width * value/10 - width / 2) * 0.96
            radius: height/2
        }

    }
    Text {id: flood_cm
        text: value
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
