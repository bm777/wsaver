import QtQuick 2.13
import QtQuick.Window 2.13
import "climate"
import "highlight"
import "side"

Window {
    title: qsTr("wsaver")
    id: root
    width: Screen.width * 0.7 > 800 ? Screen.width * 0.5 : 800
    height: Screen.height * 0.7 > 600 ? Screen.height * 0.6 : 600
    minimumWidth: 800
    minimumHeight: 600
    visible: true


    //////////////////////////////////////////////////////
    Side {
        id: side
    }

}
