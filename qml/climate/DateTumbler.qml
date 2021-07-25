import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtQuick.Window 2.2

Rectangle {
    width: frame.implicitWidth + 10
    height: frame.implicitHeight + 10
    color: "transparent"

    FontMetrics {
        id: fontMetrics
    }

    Component {
        id: delegateComponent

        Label {
            text: modelData
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: fontMetrics.font.pixelSize * 1.25
        }
    }

    Frame {
        id: frame
        padding: 0
        anchors.centerIn: parent

        Row {
            id: row

            Tumbler {
                id: dateTumbler
                model: ["January 18, 2021", "February 7, 2021", "March 9, 2021"]

                delegate: delegateComponent
            }
        }
    }
}
