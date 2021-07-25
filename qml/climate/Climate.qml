import QtQuick 2.0

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: qsTr("Date")
        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.07
        y: parent.height * 0.18
    }

    DateTumbler {
        id: dt
        x: hl_text.x
        y: parent.height * 0.3
        width: parent.width * 0.4
        height: parent.height * 0.6
    }


    ////////////////////////////////////////////////////////////////


}
