import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: {
        if(t.text === "Light") return "#ffffff"
        if(t.text === "Dark") return "#4050D2"

    }

    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {

    }

    radius: height/2
    Text {
        id: t
        text: "Light"

        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: (text === "Light")? "#4050D2" : "#ffffff"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            t.text = "Dark"
        }
    }
//    Timer {
//       interval: 10
//       running: true
//       repeat: true
//       onTriggered:
//    }
}
