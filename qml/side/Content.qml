import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    property int temperature: 12
    property string unit: "C"
    property string week_day: "January 18, 2018"
    property string hour: ""
    property string condition_cloud: "Mostly cloudy"
    property string condition_rain: "30%"
    property string town: "Uyo, Nigeria"
    property string f: "Comfortaa Light"
    property string lang: ""
    property string thema: ""

    Text {
        id: temp
        x: parent.width * 0.1
        y: parent.height * 0.05
        text: unit === "°C" ? temperature : Math.round(temperature*9/5 + 32, 1)
        font { pointSize: 33; family: f}
    }
    Text {
        id: cf
        text: unit
        font { pointSize: 15; family: f}
        x: temp.x + temp.width
        y: temp.y
    }

    Text {
        id: date
        text: week_day + ""
        font {family: "Comfortaa"; pointSize: 9;}
        x: temp.x + 5
        y: parent.height * 0.29
    }
    Text {
        id: hh
        text: hour
        font {family: "Comfortaa"; pointSize: 9;}
        x: date.x + date.width + 3
        y: date.y
        color: "#B9B9B9"
    }

    /// + + + + + +  + + + + + + + + + + + + + + + + + + +
    Rectangle {
        id: separator
        width: parent.width * 0.8
        height: 1
        color: "#70B9B9B9"
        y: hh.y + hh.height + 15
//        x: parent.width * 0.07
        anchors.horizontalCenter: parent.horizontalCenter
    }
    /// + + + + + +  + + + + + + + + + + + + + + + + + + +

    Rectangle {
        id: cloud_frame
        width: parent.width * 0.8
        height: cloud.height
        y: separator.y + 13
//        border.color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: cloud
            source: "../../img/cloud.png"
            width: 20
            height: width
        }
        Text {
            text: condition_cloud
            font {family: "Comfortaa"; pointSize: 8;}
            x: cloud.width + 10
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: rain_frame
        width: parent.width * 0.8
        height: cloud.height
        y: cloud_frame.y + cloud_frame.height + 10
//        border.color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        Rain {
            id: rain
            width: 20
            height: width
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            text: "Rain - " + condition_rain
            font {family: "Comfortaa"; pointSize: 8;}
            x: cloud.width + 10
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle {
        id: sun_frame
        width: parent.width * 0.8
        height: sun.height
        y: rain_frame.y + rain_frame.height + 10
//        border.color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        RectangularGlow {
            anchors.fill: sun
            spread: 0.1
            glowRadius: 10
            color: "#50F1C40F"
        }
        Image {
            id: sun
            source: "../../img/sun.png"
            width: 20
            height: width
        }
        Text {id: custom
            text: town
            font {family: "Comfortaa"; pointSize: 8;}
            x: sun.width + 10
            anchors.verticalCenter: parent.verticalCenter
        }

    }


    RotationAnimation {
        target: sun
        running: root.visible
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 3000
    }
}


