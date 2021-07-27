import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: {
        if(t.text === "Light" || t.text === "Blanc") return "#ffffff"
        if(t.text === "Dark"  || t.text === "Noir") return "#4050D2"
    }

    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {
        print("Change")
        if(lang === "Français") {
            if(t.text === "Light") t.text = "Blanc"
            if(t.text === "Dark") t.text = "Noir"
        }
        if(lang === "English") {
            if(t.text === "Blanc") t.text = "Light"
            if(t.text === "Noir") t.text = "Dark"
        }}

    radius: height/2
    Text {
        id: t
        text: "Light"
        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: {
            if(text === "Light") return "#4050D2"
            if(text === "Dark") return "#ffffff"
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(lang === "English"){
                if(t.text === "Light" ){
                    t.text = "Dark"
                }
                else {
                    t.text = "Light"
                }
            }
            if(lang === "Français"){
                if(t.text === "Blanc" ){
                    t.text = "Noir"
                }
                else {
                    t.text = "Blanc"
                }
            }

        }
    }

}
