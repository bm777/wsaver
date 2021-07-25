import QtQuick 2.0

Rectangle {
    width: 70
    height: 32
    color: text === "Light" ? "#ffffff" : "#000000"
    radius: 5
    Text {
        text: "Light"
        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: text === "Light" ? "#000000" : "#ffffff"
    }
}
