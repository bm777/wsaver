import QtQuick 2.0
import QtQml 2.2

Item {
    id: root

    width: size
    height: size

    // +++++++++++++++++++++++++++++++++++++++++++++++++++++
    property int size: 200
    property real arcBegin: 0
    property real arcEnd: 270
    property real arcOffset: 0
    property bool isPie: false
    property real lineWidth: 20
    property bool showBackground: false
    property color colorCircle: "#cc3333"
    property color colorBackground: "#779933"


    property alias beginAnimation: animationArcBegin.enabled
    property alias endAnimation: animationArcEnd.enabled

    property int animationDuration: 100

    onArcBeginChanged: canvas.requestPaint()
    onArcEndChanged: canvas.requestPaint()

    Behavior on arcBegin {
        id: animationArcBegin
        enabled: true
        SmoothedAnimation {
            velocity: root.animationDuration
        }
    }

    Behavior on arcEnd {
        id: animationArcEnd
//        enabled: true
        SmoothedAnimation {
            velocity: root.animationDuration
        }
    }


    Canvas {
        id: canvas
        anchors.fill: parent
        rotation: -90 + parent.arcOffset

        onPaint: {
            var ctx = getContext("2d")
            var x = width / 2
            var y = height / 2
            var start = Math.PI * (parent.arcBegin / 180)
            var end = Math.PI * (parent.arcEnd / 180)
            ctx.reset()

            if(root.isPie) {
                if(root.showBackground) {
                    ctx.beginPath()
                    ctx.fillStyle = root.colorBackground
                    ctx.moveTo(x, y)
                    ctx.arc(x, y, width/2, 0, Math.PI*2, false)
                    ctx.lineTo(x,y)
                    ctx.fill()
                }
                ctx.beginPath()
                ctx.fillStyle = root.colorCircle
                ctx.moveTo(x, y)
                ctx.arc(x, y, width/2, start, end, false)
                ctx.lineTo(x,y)
                ctx.fill()
            } else {
                if(root.showBackground){
                    ctx.beginPath()
                    ctx.arc(x, y, (width/2) - (parent.lineWidth/2), 0, Math.PI*2, false)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = root.colorBackground
                    ctx.stroke()
                }
                ctx.beginPath()
                ctx.strokeStyle = root.colorCircle
                ctx.arc(x, y, (width/2) - (parent.lineWidth/2), start, end, false)
                ctx.lineWidth = root.lineWidth
                ctx.stroke()
            }
        }
    }
}
