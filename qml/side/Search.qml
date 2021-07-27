import QtQuick.Controls 2.0
import QtQuick 2.0

TextField {
    placeholderText: {
        if(lang === "English") return "Search for places ..."
        if(lang === "Français") return "Rechercher des places ..."
    }

    property string lang: ""
    property string thema: ""
    color: "#80000000"
//    font.capitalization: Font.AllLowercase
    maximumLength: 30
    hoverEnabled: true

    background: Rectangle {
//        color: "transparent"
//        color: "red"
//        anchors.fill:
    }
}
