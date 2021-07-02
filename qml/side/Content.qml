import QtQuick 2.0

Item {
    property int temperature: 12
    property string unit: "C"
    property string week_day: "Monday"
    property string hour: "16:00 (GMT+1)"
    property string f: "Comfortaa Light"

    Text {
        id: temp
        x: parent.width * 0.1
        y: parent.height * 0.05
        text: temperature
        font { pointSize: 33; family: f}
    }
    Text {
        id: cf
        text: "°" +unit
        font { pointSize: 15; family: f}
        x: temp.x + temp.width
        y: temp.y
    }

    Text {
        id: date
        text: week_day + ","
        font {family: "Comfortaa"; pointSize: 9;}
        x: temp.x + 5
        y: parent.height * 0.29
    }
    Text {
        id: hh
        text: hour
        font {family: "Comfortaa"; pointSize: 9;}
        x: date.x + date.width + 3
        y: date.y
        color: "#B9B9B9"
    }
    /// + + + + + +  + + + + + + + + + + + + + + + + + + +
    Rectangle {
        id: separator
        width: parent.width * 0.8
        height: 1
        color: "#70B9B9B9"
        y: hh.y + hh.height + 15
//        x: parent.width * 0.07
        anchors.horizontalCenter: parent.horizontalCenter
    }
}


