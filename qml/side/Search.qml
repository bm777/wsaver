import QtQuick.Controls 2.0
import QtQuick 2.0

TextField {
    placeholderText: {
        if(lang === "English") return "Search for places ..."
        if(lang === "Français") return "Rechercher des places ..."
        if(lang === "Yoruba") return "Wa awọn aaye ..."
    }

    property string lang: ""
    property string thema: ""
    property bool c_visible: true
    color: "#80000000"
    maximumLength: 30
    hoverEnabled: true
    font{family: "Comfortaa"}
    background: Rectangle {

    }
    cursorVisible: c_visible

}
