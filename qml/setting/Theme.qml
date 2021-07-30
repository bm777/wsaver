import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: {
        if(t.text === "Light" || t.text === "Blanc" || t.text === "Imọlẹ") return "#ffffff"
        if(t.text === "Dark"  || t.text === "Noir" || t.text === "Dudu") return "#4050D2"
    }

    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {

        if(lang === "Français") {
            if(t.text === "Light" || t.text === "Imọlẹ") t.text = "Blanc"
            if(t.text === "Dark" || t.text === "Dudu") t.text = "Noir"
        }
        if(lang === "English") {
            if(t.text === "Blanc" || t.text === "Imọlẹ") t.text = "Light"
            if(t.text === "Noir" || t.text === "Imọlẹ") t.text = "Dark"
        }
        if(lang === "Yoruba") {
            if(t.text === "Blanc" || t.text === "Light") t.text = "Imọlẹ"
            if(t.text === "Noir" || t.text === "Light") t.text = "Dudu"
        }
    }

    radius: height/2
    Text {
        id: t
        text: "Light"
        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: {
            if(text === "Light" || text === "Blanc" || text === "Imọlẹ") return "#4050D2"
            if(text === "Dark"  || text === "Noir" || text === "Dudu") return "#ffffff"
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
            if(lang === "Yoruba"){
                if(t.text === "Imọlẹ" ){
                    t.text = "Dudu"
                }
                else {
                    t.text = "Imọlẹ"
                }
            }

        }
    }

}
