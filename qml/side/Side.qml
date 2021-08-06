import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: root
    property string town: ""
    property real temperature: 15 // change for global
    property string place: {
        if(lang === "Français") return "Vile"
        if(lang === "English") return "Town"
        if(lang === "Yoruba") return "Ilu"
    }

    property string date:""
    property string tmp_date: ""
    property string time: ""
    property string t: "°C"
    property string lang: ""
    property string theme: ""


    // + + + + + + + + + + + + + + + + +
    // + + + + + + + + + + + + + + + + +
    // Coverage rectangle glowed
    RectangularGlow {
        anchors.fill: frame
        spread: 0.1
        glowRadius: 10
        color: theme === "Light" ? "#a0a9a9a9" : "#80000000"
    }
    Rectangle {

        id: frame
        anchors.fill: parent
        clip:  true
//        color: "red"

        Image {
            id: slave
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectCrop
            smooth: true
            z: parent.z+1
            source: "../../popup/normal.jpg"
        }
    }

    //+ + + + + + + + + + + + + + + + + +
    //+ + + + + + + + + + + + + + + + + +
    // search bar
    Rectangle {
        id: top_bg_search
        width: parent.width
        height: parent.height * 0.1
        color: theme === "Light" ? "#ffffff" : "#202442"
        clip: true
        Rectangle {
            width: parent.height * 0.5;
            height: 2;
            color: theme === "Light" ? "blue" : "white"
            x: parent.width * 0.25
            rotation: 135
        }
        Rectangle {
            width: parent.height * 0.5;
            height: 2;
            color: theme === "Light" ? "blue" : "white"
            x: parent.width * 0.6
            y: parent.height - height
            rotation: 135
        }
    }


    RectangularGlow {
        anchors.fill: bg_search
        spread: 0.1
        glowRadius: 10
        color: theme === "Light" ? "#a0a9a9a9" : "transparent"
    }
    Rectangle {
        y: x/2
        id: bg_search
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.9
        height: parent.height * 0.07
        color: "white"
//        border.color: "red"
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
            lang: root.lang
            thema: root.theme

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    mouse.accepted = false
                    search.focus = true

                    if(container.visible){
                        container.visible = false
                        search.cursorVisible = false
                    }else {
                        search.cursorVisible = true
                        container.visible = true
                    }
                }

            }
        }
        Rectangle {
            id: back_search
            color: "#20a9a9a9"
            width: 30
            radius: width/2
            height: width
            x: parent.width - width * 1.2
            anchors.verticalCenter: parent.verticalCenter

            Image {
                id: icon_fence
                source: "../../img/micro.png"
                anchors.centerIn: parent
                width: 15
                height: width
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    back_search.color = "transparent"
                    back_search.border.color = "#40a9a9a9"
                }
                onExited: {
                    back_search.color = "#20a9a9a9"
                    back_search.border.color = "transparent"
                }
                onClicked: {
//                    print("inside icon of micro")
                    flow_animation.running = true
                }
            }
        }

    }
    Rectangle {id: flow
        width: 0
        anchors.fill: bg_search
        color: "#ffffff"
        radius: bg_search.radius
        visible: false

        Text {
            text: {
                if(lang === "English") return "Listening ..."
                if(lang === "Yoruba") return "Nfeti sile ..."
                if(lang === "English") return "En écoute ..."
            }
            font{family: "Comfortaa"; }
            anchors.centerIn: parent
            color: "#80000000"
        }
    }

    ///////////////////////////////////////////////////////////////////////
    // Adding search bottom side
    Rectangle {
        id: container
        y: parent.height * 0.1
        height: parent.height * 0.55
        width: parent.width
        visible: {
            if(search.onclicked) return true
            else return false
        }

        color: {
            if(theme==="Light") return "#ffffff"
            else return "#202442"
        }

        ScrollView {
            y: parent.height * 0.02
            contentWidth: col.width
            contentHeight: col.height
            width: parent.width
            height: parent.height
            clip: true


            Column {
                id: col
                spacing: 5

                Repeater {
                    model: {
                        var data = bridge.slot_towns()
                        return data
                    }

                    Place {
                        width: container.width * 0.9
                        height: 30
                        place: modelData
                        x: (container.width - width) / 2
                        visible: {
                            var key = search.text.toLowerCase()
                            if(key === "") return true
                            else if(place.toLowerCase().includes(key)){
                                return true
                            }
                            else return false
                        }
                        thema: root.theme

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                bold_state = true
                                parent.border.color = "#804050D2"
                            }
                            onExited: {
                                bold_state = false
//                                search.cursorVisible = false
                                parent.border.color = "#104050D2"
                            }
                            onClicked: {
                                parent.clicked = true
                                root.place = parent.place
                                container.visible = false
                            }
                        }
                    }

                }

            }
        }

    }






    ///////////////////////////////////////////////////////////////////////



    //  + + + + + + + + + + + + + + + + + + +
    // bottom side
    Rectangle {
        id: bottom_rect
        width: parent.width
        height: parent.height * 0.5
        y: parent.height - height
        gradient: Gradient {
            GradientStop {position: 0.0; color: "transparent"}
            GradientStop {position: 0.3; color: theme==="Light"?"#b0ffffff":"#b0202442"}
            GradientStop {position: 1.0; color: theme==="Light"?"#ffffff":"#202442"}
        }
        Rectangle {
            anchors.horizontalCenter: bottom_rect.horizontalCenter
            width: bottom_rect.width
            height: bottom_rect.height * 0.7
            y: parent.height - height
            color: theme === "Light" ? "#ffffff" : "#202442"

            Content {
                id: content
                anchors.fill: parent
                unit: t
                week_day: date
                lang: root.lang
                town: root.place
                thema: root.theme
            }
        }

    }







    ///////////////////////////////////////////////////////////:::
    /// Timer,to push data in Real time on UI
    Timer {
        running: true
        repeat: true
        interval: 100
        onTriggered: {
            var data = bridge.getForecastData(root.place, root.tmp_date)
//            print(root.tmp_date)
            if(data[5] !== -1) content.condition_cloud = data[5]
            else {
                if(root.lang === "English") content.condition_cloud = "No condition!"
                if(root.lang === "Yoruba") content.condition_cloud = "Ko si majemu!"
                if(root.lang === "Français") content.condition_cloud = "Aucune condition!"
            }

            if(data[3] !== -1) content.temperature = data[3]
            else {
                if(root.lang === "English") content.temperature = -1000
                if(root.lang === "Français") content.temperature = -1000
                if(root.lang === "Yoruba") content.temperature = -1000
            }

            if(data[8] !== -1) content.condition_rain = data[8]+"%"
            else {
                if(root.lang === "English") content.condition_rain = "n/a"
                if(root.lang === "Français") content.condition_rain = "n/a"
                if(root.lang === "Yoruba") content.condition_rain = "n/a"
            }
        }
    }


    //+ + + + + + + + + + + + + + + + + +
    // animation
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


    SequentialAnimation {
        id: flow_animation
        running: false

        PropertyAnimation {
            target: flow
            property: "visible"
            to: true
            duration: 1
        }
        NumberAnimation {
            target: flow
            property: "width"
            from: 0
            to: bg_search.width
            duration: 2000
        }
        PropertyAnimation {
            target: flow
            property: "visible"
            to: false
            duration: 1
        }
    }


}
