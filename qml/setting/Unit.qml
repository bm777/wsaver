import QtQuick 2.0

Rectangle {
    property string unit: "C"
    width: 30
    height: width
    radius: height/2
    color: t.text === "°C" ? "#ffffff" : "4050D2"
    Text {
        id: t
        text: "°" + unit
        font {family: "Comfortaa"; pointSize: 9; bold: false}
        color: t.text === "°C" ? "#4050D2" : "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.3
    }
}
