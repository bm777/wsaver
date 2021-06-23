import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    title: qsTr("wsaver")
    id: root
    width: Screen.width * 0.7
    height: Screen.height * 0.7

    minimumWidth: 800
    minimumHeight: 600
    visible: {
        print(root.width, root.height)
        return true
    }

}
