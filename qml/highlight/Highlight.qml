import QtQuick 2.0

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string lang: ""

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: {
            if(lang === "Français") return "Points culminants"
            if(lang === "English") return "Highlights"
        }

        font {family: f; pointSize: 12; bold: false}
        x: parent.width * 0.07
    }



    ////////////////////////////////////////////////////////////////
    // first line :)
    Box {
        id: a1
        x: hl_text.x
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
        lang: root.lang
    }
    Air {
        id: b1
        x: a1.x + a1.width + 20
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
    }
    Humidity {
        id: c1
        x: b1.x + b1.width + 20
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
    }



    ////////////////////////////////////////////////////////////////
    // second line
    Wind {
        id: a2
        x: hl_text.x
        y: parent.height * 0.52
        width: height * 1.3
        height: parent.height * 0.37
    }
    Alert {
        id: b2
        x: a1.x + a1.width + 20
        y: a2.y
        width: height * 1.3 * 2 + 19
        height: parent.height * 0.37
    }
//

}
