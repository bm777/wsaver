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
        width: 130
        height: 32 * 3
        color: "#ffffff"
//        border.color: "red"
        radius: 10
        /////////////////////////////////////////////////////////////
        Image {
            id: imgFr
            source: "../../img/fr.png"
            width: 32
            height: width
            y: 0
            x: 10
            Text {
                text: "Français"
                anchors.verticalCenter: parent.verticalCenter
                color: theme === "light" ? "#4050D2" : "#ffffff"
                font{family: "Comfortaa"; pointSize: 12; bold: false}
                x: imgFr.x + imgFr.width
            }
        }
        /////////////////////////////////////////////////////////////
        Image {
            id: imgUk
            source: "../../img/uk.png"
            width: 32
            height: width
            y: imgFr.y + imgFr.height
            x: 10
            Text {
                text: "English"
                anchors.verticalCenter: parent.verticalCenter
                color: theme === "light" ? "#4050D2" : "#ffffff"
                font{family: "Comfortaa"; pointSize: 12; bold: false}
                x: imgFr.x + imgFr.width
            }
        }
        /////////////////////////////////////////////////////////////
        Image {
            id: imgNg
            source: "../../img/ng.png"
            width: 32
            height: width
            y: imgUk.y + imgUk.height
            x: 10
            Text {
                text: "Yoruba"
                anchors.verticalCenter: parent.verticalCenter
                color: theme === "light" ? "#4050D2" : "#ffffff"
                font{family: "Comfortaa"; pointSize: 12; bold: false}
                x: imgFr.x + imgFr.width
            }
        }
    }
}
