import QtQuick 2.0

    Rectangle {
    id: root

    property real value: 0
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
        if(lang === "Yoruba") {
            if(value >= 6) return "ga ewu"
            else if(value >= 3) return "apapọ ewu"
            else return "ewu kekere"
        }
    }

    property string lang: ""
    property string thema: ""
    color: thema === "Light" ? "#ffffff" : "#202442"
    border.color: thema === "Light" ? "transparent" : "#40E9E9E9"
    property string alert1: {
        if(lang === "Français") return "Innondation (" + level + ")"
        if(lang === "English") return "Flood (" + level + ")"
        if(lang === "Yoruba") return "Ìkún omi (" + level + ")"
    }

    radius: 10

    Text {
        text: root.alert1
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: thema === "Light" ? "#ADADAD" : "#80E9EBF9"

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
            x: {
                if(value === -1000)
                    return (parent.width * 0/100 - width / 2) * 0.9 +width*0.7
                else
                    return (parent.width * value/100 - width / 2) * 0.9 +width*0.7
            }
            Behavior on x {
                enabled: true
                SmoothedAnimation {
                    velocity: 130
                    easing.type: Easing.InExpo
                }
            }

            radius: height/2
        }

    }
    Text {id: flood_cm
        text: value === -1000 ? "--" : value
        font{family: "Comfortaa"; pointSize: 15; bold: true}
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.7
        color: thema === "Light" ? "#000000" : "#ffffff"
    }
    Text {
        text: "%"
        font{family: "Comfortaa"; pointSize: 11; bold: false}
        y: parent.height * 0.68
        x: flood_cm.x + flood_cm.width + 5
        color: thema === "Light" ? "#000000" : "#ffffff"
    }
    Text {
        text: "0"
        color: "#4050D2"
        font{family: "Comfortaa"; pointSize: 11; bold: false}
        y: parent.height * 0.68
        x: (parent.width - frame_.width) / 2 + 6
    }
    Text {
        text: "100"
        color: "#4050D2"
        font{family: "Comfortaa"; pointSize: 11; bold: false}
        y: parent.height * 0.68
        x: frame_.x + frame_.width - width
    }
}
