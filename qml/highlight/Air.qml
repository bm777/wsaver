import QtQuick 2.0

Rectangle {
    id: root
    property real value: 0 // "Air quality"
    property string thema: ""
    property string dataname: {
        if(lang === "Français") return "Qualité d'air"
        if(lang === "English") return "Air quality"
        if(lang === "Yoruba") return "Didara afẹfẹ"
    }
    property string lang: ""

    radius: 10
    color: thema === "Light" ? "#ffffff" : "#202442"
    border.color: thema === "Light" ? "transparent" : "#40E9E9E9"

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: thema === "Light" ? "#ADADAD" : "#80E9EBF9"
    }

    Text {
        id: value_
        text: value + ""
        font{family: "Comfortaa"; bold: false; pointSize: 25}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.2
        color: thema === "Light" ? "#000000" : "#ffffff"
        Text {
            y: root.height * 0.01
            x: value_.x + value_.width
            text: "%"
            font{family: "Comfrotaa"}
        }
    }

    Image {
        source: "../../img/air.png"
        width: 27
        height: width
        y: parent.height * 0.73
        x: parent.width * 0.2

    }

    Text {
        text: {
            if(lang === "English"){
                if(value <= 10) return "Unhealthy"
                else return "Healhty"
            }
            if(lang === "Français"){
                if(value <= 100) return "Mauvais état"
                else return "Bon état"
            }
            if(lang === "Yoruba"){
                if(value <= 100) return "Alailera"
                else return "Ni ilera"
            }

        }

        font{family: "Comfortaa"; bold: false; pointSize: 10}
        color: thema === "Light" ? "#000000" : "#ffffff"
        y: parent.height * 0.78
        x: parent.width * 0.35
    }

}
