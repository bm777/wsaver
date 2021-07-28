import QtQuick 2.0

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string lang: ""
    property string place: ""
    property string date: ""
    property string thema: ""

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
        lang: root.lang
    }
    Humidity {
        id: c1
        x: b1.x + b1.width + 20
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
        lang: root.lang
    }



    ////////////////////////////////////////////////////////////////
    // second line
    Wind {
        id: a2
        x: hl_text.x
        y: parent.height * 0.52
        width: height * 1.3
        height: parent.height * 0.37
        lang: root.lang
    }
    Alert {
        id: b2
        x: a1.x + a1.width + 20
        y: a2.y
        width: height * 1.3 * 2 + 19
        height: parent.height * 0.37
        lang: root.lang
    }


    //////////////////////////////////////////////////////////////////////////
    Timer {
        running: true
        repeat: true
        interval: 100
        onTriggered: {
            var data = bridge.getForecastData(root.place, root.date)
            print(root.place, root.date)
            print(data)
            if(data[2] !== -1) a1.value = data[2]
            else{
                a1.value = "--"
            }

            if(data[4] !== -1) c1.value = parseFloat(data[4])
            else{
                c1.value = -1000
            }

            if(data[6] !== -1) a2.value = data[6]
            else{
                a2.value = "--"
            }
        }
    }

//

}
