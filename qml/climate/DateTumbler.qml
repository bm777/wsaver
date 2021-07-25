import QtQuick 2.12
import QtQuick.Controls 2.15
//import QtQuick.Window 2.2

Rectangle {

    color: "white"
    Tumbler {
        model: ["January 18, 2021", "February 7, 2021", "March 9, 2021"]
        anchors.fill: parent
        font {family: "Comfortaa"; bold: false}
        visibleItemCount: 3
        wrap: true
    }

}
