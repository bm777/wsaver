import QtQuick 2.0

Rectangle {
    id: root
    property real value: -1000
    property string lang: ""
    property string thema: ""
    property string dataname: {
        if(lang === "Français") return "Humidité"
        if(lang === "English") return "Humidity"
    }
    radius: 10
    color: thema === "Light" ? "#ffffff" : "#202442"
    border.color: thema === "Light" ? "transparent" : "#40E9E9E9"

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: thema === "Light" ? "#ADADAD" : "#E9EBF9"
    }

    Text {
        id: value_
        text: {
            if(value !== -1000) return Math.round(Math.floor(value), 0)
            else return "--"
        }

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
            if(lang === "English"){
                if(value >= 0.7) return "Bad"
                else if(value >= 0.5) return "Cold"
                else if(value >= 0.3) return "Very humide"
                else if(value >= 0.2) return "Humide"
                else if(value >= 0) return "Normale"
                else return "..."
            }
            if(lang === "Français"){
                if(value >= 0.7) return "Mauvais"
                else if(value >= 0.5) return "Froid"
                else if(value >= 0.3) return "Très humide"
                else if(value >= 0.2) return "Humide"
                else if(value >= 0) return "Normale"
                else return "..."
            }

        }

        font{family: "Comfortaa"; pointSize: 10; bold: false}
        y: parent.height * 0.78
        x: parent.width * 0.2
        color: thema === "Light" ? "#000000" : "#ffffff"
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
            y: {
                if(value === -1000) {
                    return parent.height * (1 - 0) * 0.85
                }else return parent.height * (100 - value)/100 * 0.85
            }
        }
    }

}
