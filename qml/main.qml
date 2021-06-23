import QtQuick 2.13
import QtQuick.Window 2.13
import "climate"
import "highlight"
import "side"

Window {
    title: qsTr("wsaver")
    id: root
    width: Screen.width * 0.7 > 800 ? Screen.width * 0.6 : 800
    height: Screen.height * 0.7 > 600 ? 600 : 600
    minimumWidth: 800
    minimumHeight: 600
    maximumHeight: Screen.height * 0.7
    maximumWidth: Screen.width * 0.6
    visible: true


    //////////////////////////////////////////////////////
    Side {
        id: side
        width: parent.width * 0.28
        height: parent.height
    }

}
