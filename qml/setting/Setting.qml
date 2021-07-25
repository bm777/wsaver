import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.12


Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: qsTr("Setting")
        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.07
        y: parent.height * 0.18
    }

    Rectangle {
        anchors.fill: parent
        border.color: "red"
        color: "transparent"
    }

    ////////////////////////////////////////////////////////////////
    Unit {
        id: unit
        y: parent.height * 0.37
        x: parent.width * 0.1
    }
    RectangularGlow {
        anchors.fill: unit
        spread: 0.1
        glowRadius: unit.width / 2
        color: "#80000000"
    }


}
