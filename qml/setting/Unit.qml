import QtQuick 2.0

Rectangle {
    property string unit: "C"
    width: 30
    height: width
    radius: height/2
    color: "#000000"
    Text {
        text: unit
        font {family: f; pointSize: 15}
        color: "#ffffff"
        anchors.centerIn: parent
    }
}
