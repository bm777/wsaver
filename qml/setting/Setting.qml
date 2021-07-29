import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12


Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string lang: flag.name_language
    property string thema: theme.thema
    property string deg: unit.deg

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: {
            if(flag.name_language === "Français") return "Paramètres"
            if(flag.name_language === "English") return "Settings"
        }
        color: thema === "Light" ? "#000000" : "#E9EBF9"

        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.07
        y: parent.height * 0.18
    }

//    Rectangle {
//        anchors.fill: parent
//        border.color: "red"
//        color: "transparent"
//    }

    ////////////////////////////////////////////////////////////////
    RectangularGlow {
        anchors.fill: unit
        spread: 0.1
        glowRadius: unit.width / 2
        color: "#10000000"
    }
    RectangularGlow {
        anchors.fill: flag
        spread: 0.1
        glowRadius: flag.width / 2
        color: "#204050D2"
    }
    RectangularGlow {
        anchors.fill: theme
        spread: 0.1
        glowRadius: flag.width / 2
        color: {
           if(setting.lang === "English"){
               if(setting.thema === "Light") return "#10000000"
               if(setting.thema === "Dark") return "#10ffffff"
           }
        }
    }
    Theme {
        id: theme
        y: parent.height * 0.37
        x: parent.width * 0.1
        lang: root.lang
    }
    Unit {
        id: unit
        y: parent.height * 0.37
        x: parent.width * 0.35
    }
    Flag {
        id: flag
        y: parent.height * 0.37
        x: parent.width * 0.5
    }



}
