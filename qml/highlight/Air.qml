import QtQuick 2.0

Rectangle {
    id: root
    property string value: "50"
    property string dataname: "Air quality"
    radius: 10

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }

}
