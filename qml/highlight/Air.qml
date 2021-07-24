import QtQuick 2.0

Rectangle {
    id: root
    property real value: 105
    property string dataname: "Air quality"

    radius: 10

    Text {
        text: root.dataname
        font {family: "Comfortaa"; pointSize: 10}
        y: parent.height * 0.1
        x: y + 8
        color: "#ADADAD"
    }

    Text {
        id: value_
        text: value
        font{family: "Comfortaa"; bold: false; pointSize: 25}
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.2
    }

    Image {
        source: "../../img/air.png"
        width: 27
        height: width
        y: parent.height * 0.69
        x: parent.width * 0.2

    }

    Text {
        text: {
            if(value >= 100) return "Unhealthy"
            else return "Healhty"
        }

        font{family: "Comfortaa"; bold: false; pointSize: 10}
        y: parent.height * 0.727
        x: parent.width * 0.38
    }

}
