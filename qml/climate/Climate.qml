import QtQuick 2.0

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: qsTr("Highlights")
        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.07
    }



    ////////////////////////////////////////////////////////////////


}
