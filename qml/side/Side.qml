import QtQuick 2.0

Item {
    id: root
    Rectangle {
        anchors.fill: parent
//        border.color: "red"
        clip:  true

        Image {
            id: slave
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectCrop
            smooth: true
            z: parent.z+1
            source: "../../popup/cloudy.jpg"
    //        width: 307 * root.width/307
    //        height: 390 * root.width/307
        }
    }

}
