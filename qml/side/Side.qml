import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root
    property string town: ""
    property real temperature: 15 // change for global
    property string date:"Monday, 17th 2021"
    property string time: "4:00 PM (GMT+1)"
    property string t: "°C"
    property string lang: "en"
    property string theme: "light"



    // Coverage rectangle glowed
    RectangularGlow {
        anchors.fill: frame
        spread: 0.1
        glowRadius: 10
        color: "#a0a9a9a9"
    }

    Rectangle {

        id: frame
        anchors.fill: parent
        clip:  true

        Image {
            id: slave
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectCrop
            smooth: true
            z: parent.z+1
            source: "../../popup/cloudy2.jpg"
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height * 0.17
        y: parent.height - height
        gradient: Gradient {
            GradientStop {position: 0.0; color: "transparent"}
            GradientStop {position: 0.7; color: "#80000000"}
            GradientStop {position: 1.0; color: "#80ffffff"}
        }
    }

    // search bar
    Rectangle {
        id: top_bg_search
        width: parent.width
        height: parent.height * 0.3 + bg_search.y * 2
//        gradient: Gradient {
//            GradientStop {position: 0.0; color: "white"}
//            GradientStop {position: 0.6; color: "#ffffff"}
//            GradientStop {position: 1.0; color: "transparent"}
//        }
    }

    RectangularGlow {
        anchors.fill: bg_search
        spread: 0.1
        glowRadius: 10
        color: "#80a9a9a9"
    }
    Rectangle {
        y: x/2
        id: bg_search
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.07
        color: "white"
        radius: 10

        Rectangle {
            color: "transparent"
            width: 30
            radius: width/2
            height: width
            x: width * 0.2
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: icon_search
                source: "../../img/search.png"
                anchors.centerIn: parent
                width: 15
                height: width
            }
        }

        Search {
            id: search
            width: parent.width * 0.8
            anchors.centerIn: parent
        }
        Rectangle {
            color: "#40a9a9a9"
            width: 30
            radius: width/2
            height: width
            x: parent.width - width * 1.2
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: icon_fence
                source: "../../img/fence.png"
                anchors.centerIn: parent
                width: 15
                height: width
            }
        }

    }









    SequentialAnimation {
        running: root.visible
        loops: Animation.Infinite

        NumberAnimation {
            target: slave
            property: "scale"
            duration: 20000
            from: 1.3
            to: 1.1
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: slave
            property: "scale"
            duration: 20000
            from: 1.1
            to: 1.3
            easing.type: Easing.InOutQuad
        }
    }


}
