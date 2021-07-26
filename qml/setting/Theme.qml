import QtQuick 2.0

Rectangle {
    id: root
    width: 70
    height: 32
    color: t.text === "Light" ? "#ffffff" : "#4050D2"
    radius: height/2
    Text {
        id: t
        text: "Light"
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
        }
    }
}
