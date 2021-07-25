import QtQuick 2.0

Rectangle {
    property string unit: "F"
    width: 30
    height: width
    radius: height/2
    color: "#000000"
    Text {
        text: "°" + unit
        font {family: "Comfortaa"; pointSize: 9; bold: true}
        color: "#ffffff"
        anchors.centerIn: parent
    }
}
