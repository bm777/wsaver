import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtQuick.Window 2.2

Rectangle {
    width: frame.implicitWidth + 10
    height: frame.implicitHeight + 10


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
                id: hoursTumbler
                model: 12
                delegate: delegateComponent
            }

            Tumbler {
                id: minutesTumbler
                model: 60
                delegate: delegateComponent
            }

            Tumbler {
                id: amPmTumbler
                model: ["AM", "PM"]
                delegate: delegateComponent
            }
        }
    }
}
