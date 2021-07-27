import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: {
        if(t.text === "Light") return "#ffffff"
        if(t.text === "Dark") return "#4050D2"

    }
    property string tmp: "Light"
    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {

    }

    radius: height/2
    Text {
        id: t
        text: tmp
        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: {
            if(text === "Light") return "#4050D2"
            if(text === "Dark") return "#ffffff"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            print("inside")
            if(t.text === "Light") tmp = "Dark"
            if(t.text === "Dark") tmp = "Light"
        }
    }
//    Timer {
//       interval: 10
//       running: true
//       repeat: true
//       onTriggered:
//    }
}
