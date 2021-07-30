import QtQuick 2.0


Rectangle {
    id: root //
    property string value: "--"
    property string lang: ""
    property string thema: ""
    property string dataname: {
        if(lang === "Français") return "Pression (mb)"
        if(lang === "English") return "Pressure (mb)"
        if(lang === "Yoruba") return "Ipa (mb)"
    }


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

    Gauge {
        id: gauge
        y: parent.height * 0.35
        anchors.horizontalCenter: parent.horizontalCenter
        size: parent.width * 0.8
        arcBegin: -90
        arcEnd: arcBegin + 180
        lineWidth: 10
        colorCircle: "#30b6b6b6"

        Text {
            text: root.value
            anchors.horizontalCenter: parent.horizontalCenter
            font {family: "Comfortaa"; pointSize: 25}
            y: parent.height * 0.3
            color: thema === "Light" ? "#000000" : "#ffffff"
        }
    }
    Gauge {
        id: gauge_main
        y: parent.height * 0.35
        anchors.horizontalCenter: parent.horizontalCenter
        size: parent.width * 0.8
        arcBegin: -90
        arcEnd: {
            if(value === "--") return arcBegin
            else return arcBegin + 180 * (1060-parseFloat(value))/(1060-950)
        }

        lineWidth: 10
        colorCircle: thema === "Light" ? "#F1C40F" : "#F65164"
    }
}
