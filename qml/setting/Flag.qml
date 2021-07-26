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
        id: lang
        model: ["Français", "English", "Yoruba"]
    }

}
