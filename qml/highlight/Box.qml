import QtQuick 2.0

Rectangle {

    radius: 10
    Gauge {
        id: gauge
        y: parent.height * 0.2
        anchors.horizontalCenter: parent.horizontalCenter
        size: parent.width * 0.8
        arcBegin: -90
        arcEnd: arcBegin + 180
        lineWidth: 10
        colorCircle: "#30b6b6b6"
    }
    Gauge {
        id: gauge_main
        y: parent.height * 0.2
        anchors.horizontalCenter: parent.horizontalCenter
        size: parent.width * 0.8
        arcBegin: -90
        arcEnd: arcBegin + 45
        lineWidth: 10
        colorCircle: "#cc3333"
    }
}
