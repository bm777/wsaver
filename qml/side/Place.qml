import QtQuick 2.0

Rectangle {
    id: root
    property string place: "Uyo, Nigeria"
    property bool clicked: false
    radius: 5
    color: "transparent"
//    border.color: "transparent"
    Rectangle {
        width: 10
        height: width
        color: "grey"
        radius: width/2
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.1
    }

    Text {id: t
        text: place
        x: parent.width * 0.25
        anchors.verticalCenter: parent.verticalCenter
        font{family: "Comfortaa"; pointSize: 10}
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            t.font.bold = true
            root.border.color = "#804050D2"
        }

        onExited: {
            t.font.bold = false
            root.border.color = "transparent"
        }
        onClicked: {
            root.clicked = true
            print(bridge.slot_forecast("forecast.json"))
        }
    }

}
