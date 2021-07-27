import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: (t.text === "Light") ? "#ffffff" : "#4050D2"
    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {

    }

    radius: height/2
    Text {
        id: t
        text: thema

        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: (text === "Light")? "#4050D2" : "#ffffff"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: t.text === "Light" ? "#4050D2" : "#ffffff"
    }
//    Timer {
//       interval: 10
//       running: true
//       repeat: true
//       onTriggered:
//    }
}
