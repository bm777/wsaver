import QtQuick 2.0

Rectangle {
    width: 30
    height: width
    radius: height/2
    color: t.text === "°C" ? "#ffffff" : "4050D2"
    property string deg: t.text
    Text {
        id: t
        text: "°C"
        font {family: "Comfortaa"; pointSize: 9; bold: false}
        color: t.text === "°C" ? "#4050D2" : "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.3
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(t.text === "°C"){
                t.text = "°F"
            }else{
                t.text = "°C"
            }
//            print(thema)
        }
    }
}
