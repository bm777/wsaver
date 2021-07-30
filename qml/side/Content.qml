import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    property int temperature: 12
    property bool disable_temperature: false
    property string unit: "C"
    property string week_day: ""
    property string hour: ""
    property string condition_cloud: ""
    property string condition_rain: ""
    property string town: "Town"
    property string f: "Comfortaa Light"
    property string lang: ""
    property string thema: ""

    Text {
        id: temp
        x: parent.width * 0.1
        y: parent.height * 0.05
//        text: unit === "°C" ? temperature : Math.round(temperature*9/5 + 32, 1)
        text: {
            if(temperature === -1000) {
                if(unit === "°C") return "--"
                else return "--"
            }else {
                if(unit === "°C") return temperature
                else return Math.round(temperature*9/5 + 32, 1)
            }
        }
        color: thema==="Light"?"#000000":"#d0ffffff"
        font { pointSize: 33; family: f}
    }
    Text {
        id: cf
        text: unit
        font { pointSize: 15; family: f}
        x: temp.x + temp.width
        y: temp.y
        color: thema==="Light"?"#000000":"#d0ffffff"
    }

    Text {
        id: date
        text: week_day + ""
        font {family: "Comfortaa"; pointSize: 9;}
        x: temp.x + 5
        y: parent.height * 0.29
        color: thema==="Light"?"#000000":"#d0ffffff"
    }
    Text {
        id: hh
        text: hour
        font {family: "Comfortaa"; pointSize: 9;}
        x: date.x + date.width + 3
        y: date.y
//        color: "#B9B9B9"
        color: thema==="Light"?"#B9B9B9":"#80ffffff"
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
        color: thema === "Light" ? "#ffffff" : "#202442"
        RectangularGlow {
            anchors.fill: cloud
            spread: 0.1
            glowRadius: 10
            color: "#50F1C40F"
            visible: condition_cloud.toLowerCase().includes("sunny")
        }
        Image {
            id: cloud
            source: {
//                if(thema === "Light"){
                    if(condition_cloud.toLowerCase().includes("Sunny".toLowerCase())) return "../../img/sun.png"
                    if(condition_cloud.toLowerCase().includes("Cloudy".toLowerCase())) return "../../img/cloud.png"
                    return "../../img/cloud.png"
//                }
            }
            width: 20
            height: width
            visible: {
                if(condition_cloud === "No condition!" || condition_cloud === "Aucune condition!")
                    return false
                else return true
            }
        }
        Mix {
            id: mix
            width: 20
            height: width
            thema: root.thema
            visible: {

                if(condition_cloud === "No condition!" || condition_cloud === "Aucune condition!")
                    return true
                else return false
            }
        }

        Text {
            text: {
                if(lang === "Français") {
                    if(condition_cloud === "Cloudy") return "Nuageux"
                    if(condition_cloud === "Sunny") return "Ensoleillé"
                    if(condition_cloud === "Partly cloudy") return "Partiellement nuageux"
                }
                return condition_cloud
            }

            font {family: "Comfortaa"; pointSize: 8;}
            x: cloud.width + 10
            y: parent.height * 0.25
            color: thema==="Light"?"#000000":"#ffffff"
        }
    }

    Rectangle {
        id: rain_frame
        width: parent.width * 0.8
        height: cloud.height
        y: cloud_frame.y + cloud_frame.height + 10
//        border.color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        color: thema === "Light" ? "#ffffff" : "#202442"
        Rain {
            id: rain
            width: 20
            height: width
            anchors.verticalCenter: parent.verticalCenter
            lang: root.lang
            thema: root.thema
        }
        Text {
            text: {
                if(lang === "Français") return "Pluies - " + condition_rain

                if(lang === "English") return "Rain - " + condition_rain
            }

            font {family: "Comfortaa"; pointSize: 8;}
            x: cloud.width + 10
            anchors.verticalCenter: parent.verticalCenter
            color: thema==="Light"?"#000000":"#ffffff"
        }
    }

    Rectangle {
        id: imgLocator_frame
        width: parent.width * 0.8
        height: imgLocator.height
        y: rain_frame.y + rain_frame.height + 10
//        border.color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        color: thema === "Light" ? "#ffffff" : "#202442"
//        RectangularGlow {
//            anchors.fill: sun
//            spread: 0.1
//            glowRadius: 10
//            color: "#50F1C40F"
//        }
        Image {
            id: imgLocator
            source: thema === "Light" ? "../../img/marker.png":"../../img/place.png"
            width: 20
            height: width

        }
        Text {id: custom
            text: town
            font {family: "Comfortaa"; pointSize: 8; bold: true}
            x: imgLocator.width + 10
            y: parent.height * 0.25
            color: thema==="Light"?"#000000":"#ffffff"
        }

    }


    RotationAnimation {
        target: cloud
        running: condition_cloud.toLowerCase().includes("Sunny".toLowerCase())
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 3000
    }
}


