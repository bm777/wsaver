import QtQuick 2.0

Rectangle {
    width: 20
    height: width
    color: "transparent"
    property string thema: ""

    Image {
        id: sun
        source: "../../img/sun.png"
        width: 20
        height: width
        x: 5
    }

    Image {
        source: {

            if(thema === "Light") return "../../img/cloud-compact.png"
            if(thema === "Dark") return "../../img/cloud-dark.png"
        }
        width: 20
        height: width
        x: -5
    }



    RotationAnimation {
        target: sun
        running: root.visible
        from: 0
        to: 360
        loops: Animation.Infinite
        duration: 3000
    }
}
