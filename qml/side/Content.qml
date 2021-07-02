import QtQuick 2.0

Item {
    property int temperature: 12
    property string unit: "C"
    property string day: "Monday, 16:00"

    property alias nameFontfamily: name.font.family

    Text {
        id: name
        x: parent.width * 0.1
        y: x
        text: "Stack overflow"
        font.family: "Comfortaa"
        font { pointSize: 30; italic: false}
    }
}


