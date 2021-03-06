import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12


Item {
    id: setting
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
            if(flag.name_language === "Yoruba") return "ètò"
        }
        color: {
            if(thema === "Light") return "#000000"
            if(thema === "Blanc" || thema === "Imọlẹ") return "#000000"

            if(thema === "Dark") return "#E9EBF9"
            if(thema === "Noir" || thema === "Dudu") return "#E9EBF9"
        }

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
        color: {
            if(setting.lang === "English"){
                if(setting.thema === "Light") return "#10000000"
                if(setting.thema === "Dark") return "#10ffffff"
            }
            if(setting.lang === "Français"){
                if(setting.thema === "Blanc") return "#10000000"
                if(setting.thema === "Noir") return "#10ffffff"
            }
            if(setting.lang === "Yoruba"){
                if(setting.thema === "Imọlẹ") return "#10000000"
                if(setting.thema === "Dudu") return "#10ffffff"
            }
        }
    }
    RectangularGlow {
        anchors.fill: flag
        spread: 0.1
        glowRadius: flag.width / 2
        color: {
            if(setting.lang === "English"){
                if(setting.thema === "Light") return "#204050D2"
                if(setting.thema === "Dark") return "#10ffffff"
            }
            if(setting.lang === "Français"){
                if(setting.thema === "Blanc") return "#204050D2"
                if(setting.thema === "Noir") return "#10ffffff"
            }
            if(setting.lang === "Yoruba"){
                if(setting.thema === "Imọlẹ") return "#204050D2"
                if(setting.thema === "Dudu") return "#10ffffff"
            }
        }
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
           if(setting.lang === "Français"){
               if(setting.thema === "Blanc") return "#10000000"
               if(setting.thema === "Noir") return "#10ffffff"
           }
           if(setting.lang === "Yoruba"){
               if(setting.thema === "Imọlẹ") return "#10000000"
               if(setting.thema === "Dudu") return "#10ffffff"
           }
        }
    }
    Theme {
        id: theme
        y: parent.height * 0.37
        x: parent.width * 0.1
        lang: setting.lang
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
        theme: setting.thema
    }



}
