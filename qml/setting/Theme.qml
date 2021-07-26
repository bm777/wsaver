import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: t.text === "Light" ? "#ffffff" : "#4050D2"
    property string thema: t.text
    property string lang: "English"
    radius: height/2
    Text {
        id: t
        text: {
            if(lang === "English") return "Light"
            if(lang === "Français") return "Blanc"
//            if(lang === "") return "Light"
        }

        font {family: "Comfortaa"}
        anchors.centerIn: parent
        color: text === "Light" ? "#4050D2" : "#ffffff"
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(t.text === "Light"){
                t.text = "Dark"
            }else{
                t.text = "Light"
            }
//            print(thema)
        }
    }
}
