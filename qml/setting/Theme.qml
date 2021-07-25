import QtQuick 2.0

Rectangle {
    width: 70
    height: 32
    color: t.text === "Light" ? "#ffffff" : "#000000"
    radius: height/2
    Text {
        id: t
        text: "Light"
        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: text === "Light" ? "#000000" : "#ffffff"
    }
}
