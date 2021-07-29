import QtQuick 2.0

Rectangle {
    id: root
    property real value: 105 // "Air quality"
    property string thema: ""
    property string dataname: {
        if(lang === "Français") return "Qualité d'air"
        if(lang === "English") return "Air quality"
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
        color: thema === "Light" ? "#ADADAD" : "#E9EBF9"
    }

    Text {
        id: value_
        text: value
        font{family: "Comfortaa"; bold: false; pointSize: 25}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.2
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
                if(value >= 100) return "Unhealthy"
                else return "Healhty"
            }
            if(lang === "Français"){
                if(value >= 100) return "Mauvais état"
                else return "Bon état"
            }


        }

        font{family: "Comfortaa"; bold: false; pointSize: 10}
        y: parent.height * 0.78
        x: parent.width * 0.35
    }

}
