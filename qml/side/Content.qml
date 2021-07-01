import QtQuick 2.0

Item {
    property int temperature: 12
    property string unit: "C"
    property string day: "Monday, 16:00"
//    FontLoader {id: comfortaa; source: "../../font/Comfortaa.ttf"}
    FontLoader {id: barlow; source: "../../font/Barlow.ttf"}
    property alias nameFontfamily: name.font.family

    Text {
        id: name
        x: parent.width * 0.1
        y: x
        text: "12"
        font.family: "Courier"
        font { pointSize: 30; italic: false}
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
