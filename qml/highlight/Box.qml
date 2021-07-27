import QtQuick 2.0

Rectangle {
    id: root //
    property string value: "998"
    property string lang: ""
    property string dataname: {
        if(lang === "Français") return "Pression (mb)"
        if(lang === "English") return "Pressure (mb)"
    }


    radius: 10

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
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
        }
    }
    Gauge {
        id: gauge_main
        y: parent.height * 0.35
        anchors.horizontalCenter: parent.horizontalCenter
        size: parent.width * 0.8
        arcBegin: -90
        arcEnd: arcBegin + 45
        lineWidth: 10
        colorCircle: "#F1C40F"
    }
}
