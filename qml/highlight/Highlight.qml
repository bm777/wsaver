import QtQuick 2.0

Item {
    id: root
    property real humidity: 0
    property string f: "Comfortaa"
    property string lang: ""
    property string place: ""
    property string date: ""
    property string yy: ""
    property string mm: ""
    property string dd: ""
    property string thema: ""
    property bool status: false
    property real tmp: -2

    ////////////////////////////////////////////////////////////////
    Text {
        id: hl_text
        text: {
            if(lang === "Français") return "Points culminants"
            if(lang === "English") return "Highlights"
            if(lang === "Yoruba") return "Awọn ifojusi"
        }
        color: thema === "Light" ? "#000000" : "#E9EBF9"
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
        thema: root.thema
    }
    Air {
        id: b1
        x: a1.x + a1.width + 20
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
        lang: root.lang
        thema: root.thema
    }
    Humidity {
        id: c1
        x: b1.x + b1.width + 20
        y: hl_text.y + hl_text.height * 2
        width: height * 1.3
        height: parent.height * 0.37
        lang: root.lang
        thema: root.thema
    }

    Rectangle {
        id: r_pressure
        anchors.fill: a1
        radius: a1.radius
    }
    Rectangle {
        id: r_air
        anchors.fill: b1
        radius: a1.radius
    }
    Rectangle {
        id: r_humidity
        anchors.fill: c1
        radius: a1.radius
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
        thema: root.thema
    }
    Alert {
        id: b2
        x: a1.x + a1.width + 20
        y: a2.y
        width: height * 1.3 * 2 + 19
        height: parent.height * 0.37
        lang: root.lang
        thema: root.thema
    }

    Rectangle {
        id: r_wind
        anchors.fill: a2
        radius: a2.radius
    }
    Rectangle {
        id: r_flood
        anchors.fill: b2
        radius: b2.radius
    }




    /////////////////////////////////////////////////////////////////////////
    //: SequentialAnimation
    onThemaChanged: main.running = true
    ParallelAnimation {
        id: main
        running: root.visible


        PropertyAnimation {
            target: r_pressure
            property: "color"
            duration: 1000
            from: "#40F6F6F8"
            to: "transparent"
            easing.type: Easing.InOutQuad
        }
        PropertyAnimation {
            target: r_air
            property: "color"
            duration: 1000
            from: "#40F6F6F8"
            to: "transparent"
            easing.type: Easing.InOutQuad
        }
        PropertyAnimation {
            target: r_humidity
            property: "color"
            duration: 1000
            from: "#40F6F6F8"
            to: "transparent"
            easing.type: Easing.InOutQuad
        }
        PropertyAnimation {
            target: r_wind
            property: "color"
            duration: 1000
            from: "#40F6F6F8"
            to: "transparent"
            easing.type: Easing.InOutQuad
        }
        PropertyAnimation {
            target: r_flood
            property: "color"
            duration: 1000
            from: "#40F6F6F8"
            to: "transparent"
            easing.type: Easing.InOutQuad
        }
    }


    //////////////////////////////////////////////////////////////////////////
    property int t_flood: 0
    property int t_air: 0
    Timer {
        running: true
        repeat: true
        interval: 100
        onTriggered: {
            var data = bridge.getForecastData(root.place, root.date)

            if(data[2] !== -1) {
                a1.value = data[2].toFixed(1)
                if(data[2] !== tmp) {
//                    print(root.yy, root.mm, root.dd)
                    var flood = bridge.getFloodRisk(root.place, root.yy, root.mm, root.dd)
                    var air = bridge.getAir(root.place, root.yy, root.mm, root.dd)
                    b2.value = flood[0]
                    if(air >= 90) air = Math.round(100 - air, 0)
                    b1.value = parseFloat(air)

                    t_flood = b2.value
                    t_air = b1.value

                }
                tmp = data[2]
                if(b2.value === -1000 && b1.value === 0){
                    b1.value = t_air
                    b2.value = t_flood
                }
            }
            else{
                a1.value = "--"
                b2.value = -1000
                b1.value = 0
            }

            if(data[4] !== -1) c1.value = parseFloat(data[4])
            else{
                c1.value = -1000
            }

            if(data[6] !== -1) a2.value = data[6]
            else{
                a2.value = "--"
            }
            if(data[7] !== -1) a2.direction = data[7]
            else{
                a2.direction = "--"
            }


        }
    }

//

}
