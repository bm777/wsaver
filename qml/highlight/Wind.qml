import QtQuick 2.0

Rectangle {
    id: root
    property string value: "7.70"
    property string dataname: "Wind Status (m/s)"
    radius: 10

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }
    Text {
        text: value
        font{family: "Comfortaa"; bold: false; pointSize: 20}
        anchors.centerIn: parent
    }
}
