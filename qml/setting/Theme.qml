import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: (t.text === "Light" || t.text === "Blanc") ? "#ffffff" : "#4050D2"
    property string thema: t.text
    property string lang: "Français"
    onLangChanged: {
        if(lang === "English" && thema === "Light") t.text = "Light"
        if(lang === "Français" && thema === "Light") t.text = "Blanc"
        if(lang === "English" && thema === "Dark") t.text = "Dark"
        if(lang === "Français" && thema === "Dark") t.text = "Noir"
    }

    radius: height/2
    Text {
        id: t
        text: thema

        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: (text === "Light" || text === "Blanc")? "#4050D2" : "#ffffff"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(t.text === "Light" || t.text === "Blanc"){
                if(lang === "English") t.text = "Dark"
                if(lang === "Français") t.text = "Noir"
            }else{
                if(lang === "English") t.text = "Light"
                if(lang === "Français") t.text = "Blanc"
            }
//            print(thema)
        }
    }
//    Timer {
//       interval: 10
//       running: true
//       repeat: true
//       onTriggered:
//    }
}
