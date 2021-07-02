import QtQuick 2.0

Rectangle {
    id: root
    color: "transparent"
    Row {
        spacing: 2
        anchors.horizontalCenter: root.horizontalCenter
        Rectangle {id: first
            y: last.y
            width: root.width * 0.1
            height: root.height * 0.4
            color: "#4050D2"
            radius: width / 2
        }
        Rectangle {
            y: last.y
            width: root.width * 0.1
            height: root.height * (0.4 +0.1)
            color: "#4050D2"
            radius: width / 2
        }
        Rectangle {
            y: last.y
            width: root.width * 0.1
            height: root.height * (0.4 +0.1*2)
            color: "#4050D2"
            radius: width / 2
        }
        Rectangle {id: last
            y: (root.height - height) /2
            width: root.width * 0.1
            height: root.height * (0.4 +0.1*3)
            color: "#4050D2"
            radius: width / 2
        }
    }
}
