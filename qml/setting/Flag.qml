import QtQuick 2.0
import QtQuick.Controls 2.0

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
    ComboBox {
        x: img.x + img.width + 10
        id: lang
        model: ["Français", "English", "Yoruba"]
        background: Rectangle {
            color: "transparent"
            border.color: "red"
        }
    }
    Text {
        text: "Français"
        anchors.verticalCenter: parent.verticalCenter
        color: theme === "light" ? "#4050D2" : "#ffffff"
        font{family: "Comfortaa"; pointSize: 12; bold: false}

    }

}
