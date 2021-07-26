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
        text: qsTr("Setting")
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
        color: "#10000000"
    }
    Theme {
        id: theme
        y: parent.height * 0.37
        x: parent.width * 0.1
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
