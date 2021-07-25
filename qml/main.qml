import QtQuick 2.13
import QtQuick.Window 2.13
import "climate"
import "highlight"
import "side"
import "setting"

Window {
    title: qsTr("wsaver")
    id: root
    width: Screen.width * 0.7 > 800 ? 1000 : 800
    height: Screen.height * 0.7 > 600 ? 600 : 600
    minimumWidth: 1000
    minimumHeight: 600
    maximumHeight: 600
    maximumWidth: 1000
    visible: true

    property real tmp: width * 0.28 // = 322

    Rectangle {
        anchors.fill: parent
        color: "#F6F6F8"
    }

    //////////////////////////////////////////////////////
    Climate {
        id: climate
        width: parent.width * 0.26
        height: parent.height * (1 - 0.65)
        x: side.width
        y: 0
    }

    Setting {
        id: setting
        width: parent.width - side.width - climate.width
        height: parent.height * (1 - 0.65)
        x: climate.x + climate.width
        y: 0
    }

    Highlight {
        id: hl
        width: parent.width - side.width
        height: parent.height * 0.65
        x: side.width
        y: parent.height - height
    }

    //////////////////////////////////////////////////////
    Side {
        id: side
        width: 322
        height: parent.height
    }



}
