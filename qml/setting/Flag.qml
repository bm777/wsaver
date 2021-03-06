import QtQuick 2.0

Rectangle {
    width: 32
    height: width
    color: "transparent"
    property string name_language: "English"
    property string name_source: "../../img/uk.png"
    property string theme: "Light"


    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: frame.visible = true
//        onExited:  frame.visible = true
    }

    Image {
        id: img
        source: name_source
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }
    Text {
        text: name_language
        anchors.verticalCenter: parent.verticalCenter
        color: {
            if(theme === "Light") return "#4050D2"
            if(theme === "Blanc") return "#4050D2"
            if(theme === "Imọlẹ") return "#4050D2"

            if(theme === "Dark") return "#E9EBF9"
            if(theme === "Noir") return "#E9EBF9"
            if(theme === "Dudu") return "#E9EBF9"

        }

        font{family: "Comfortaa"; pointSize: 12; bold: false}
        x: img.x + img.width + 10
    }
    MouseArea {
        anchors.fill: parent
//        hoverEnabled: true
        onExited: frame.visible = false
    }
    Rectangle {
        id: frame
        width: 130
        height: 32 * 3
        color: {
            if(theme === "Light") return "#ffffff"
            if(theme === "Blanc") return "#ffffff"
            if(theme === "Imọlẹ") return "#ffffff"

            if(theme === "Dark") return "#202442"
            if(theme === "Noir") return "#202442"
            if(theme === "Dudu") return "#202442"
        }

//        border.color: "red"
        radius: 10
        visible: false

        /////////////////////////////////////////////////////////////
        Image {
            id: imgFr
            source: "../../img/fr.png"
            width: 32
            height: width
            y: 0
            x: 10


            Text {id: tFr
                text: "Français"
                anchors.verticalCenter: parent.verticalCenter
                color: {
                   //theme === "Light" ? "#4050D2" : "#ffffff"
                    if(theme === "Light") return "#4050D2"
                    if(theme === "Blanc") return "#4050D2"
                    if(theme === "Imọlẹ") return "#4050D2"

                    if(theme === "Dark") return "#E9EBF9"
                    if(theme === "Noir") return "#E9EBF9"
                    if(theme === "Dudu") return "#E9EBF9"
                }

                font{family: "Comfortaa"; pointSize: 10; bold: false}
                x: imgFr.x + imgFr.width
            }
            MouseArea {
                anchors.fill: tFr
                hoverEnabled: true
                onEntered: tFr.font.bold = true
                onExited: tFr.font.bold = false
                onClicked: {
                    name_language = "Français"
                    name_source = "../../img/fr.png"
                    frame.visible = false
//                    print(name_language)
                }

            }
        }
        /////////////////////////////////////////////////////////////
        Image {
            id: imgUk
            source: "../../img/uk.png"
            width: 32
            height: width
            y: imgFr.y + imgFr.height
            x: 10
            Text {id: tUk
                text: "English"
                anchors.verticalCenter: parent.verticalCenter
                color: {
                    if(theme === "Light") return "#4050D2"
                    if(theme === "Blanc") return "#4050D2"
                    if(theme === "Imọlẹ") return "#4050D2"

                    if(theme === "Dark") return "#E9EBF9"
                    if(theme === "Noir") return "#E9EBF9"
                    if(theme === "Dudu") return "#E9EBF9"
                }

                font{family: "Comfortaa"; pointSize: 10; bold: false}
                x: imgFr.x + imgFr.width
            }
            MouseArea {
                anchors.fill: tUk
                hoverEnabled: true
                onEntered: tUk.font.bold = true
                onExited: tUk.font.bold = false
                onClicked: {
                    name_language = "English"
                    name_source = "../../img/uk.png"
                    frame.visible = false
//                    print(name_language)
                }
            }
        }
        /////////////////////////////////////////////////////////////
        Image {
            id: imgNg
            source: "../../img/ng.png"
            width: 32
            height: width
            y: imgUk.y + imgUk.height
            x: 10
            Text {id: tNg
                text: "Yoruba"
                anchors.verticalCenter: parent.verticalCenter
                color: {
                    if(theme === "Light") return "#4050D2"
                    if(theme === "Blanc") return "#4050D2"
                    if(theme === "Imọlẹ") return "#4050D2"

                    if(theme === "Dark") return "#E9EBF9"
                    if(theme === "Noir") return "#E9EBF9"
                    if(theme === "Dudu") return "#E9EBF9"
                }

                font{family: "Comfortaa"; pointSize: 10; bold: false}
                x: imgFr.x + imgFr.width
            }
            MouseArea {
                anchors.fill: tNg
                hoverEnabled: true
                onEntered: tNg.font.bold = true
                onExited: tNg.font.bold = false
                onClicked: {
                    name_language = "Yoruba"
                    name_source = "../../img/ng.png"
                    frame.visible = false
//                    print(name_language)
                }
            }
        }


    }
}
