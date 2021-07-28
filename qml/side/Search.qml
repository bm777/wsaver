import QtQuick.Controls 2.0
import QtQuick 2.0

TextField {
    placeholderText: {
        if(lang === "English") return "Search for places ..."
        if(lang === "Français") return "Rechercher des places ..."
    }

    property string lang: ""
    property string thema: ""
    property bool onclicked: !pressed
    color: "#80000000"
    maximumLength: 30
    hoverEnabled: true
    font{family: "Comfortaa"}
    background: Rectangle {

    }

//    MouseArea {
//        anchors.fill: parent
//        onClicked: onclicked = true
//    }
}
