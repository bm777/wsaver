import QtQuick 2.0

Rectangle {
    width: 32
    height: width
    color: "transparent"

    Image {
        id: img
        source: "../../img/fr.png"
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }
    Text {
        text: "Francais"
        anchors.verticalCenter: parent.verticalCenter
        color: "red"
        font{family: "Comfortaa"; pointSize: 12}
    }
}
