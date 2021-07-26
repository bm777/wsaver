import QtQuick 2.0

Rectangle {
    width: 32
    height: width
    color: "transparent"
    property string name_language: "fr"
    property string theme: "light"

    Image {
        id: img
        source: "../../img/fr.png"
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }
    Text {
        text: "Français"
        anchors.verticalCenter: parent.verticalCenter
        color: theme === "light" ? "#4050D2" : "#ffffff"
        font{family: "Comfortaa"; pointSize: 12; bold: false}
        x: img.x + img.width + 10
    }

    Rectangle {
        width: 50
        height: 100
        color: "transparent"
        border.color: "red"
    }
}
