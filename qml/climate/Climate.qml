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

    Rectangle {
        x: hl_text.x - 5
        y: parent.height * 0.45
        width: height * 1.3
        height: parent.height * 0.38

        DateTumbler {
            id: dt
            anchors.centerIn: parent
            width: root.width * 0.2
            height: root.height * 0.35
        }
    }


    ////////////////////////////////////////////////////////////////


}
