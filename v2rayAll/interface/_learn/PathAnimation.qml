import QtQuick 2.15

// ColorAnimation的派生类，它让目标对象沿着一个既定的路径运动。
Canvas {
    width: 400;
    height: 200;

    onPaint: {
        var ctx = getContext("2d");
        ctx.lineWidth = 4;
        ctx.strokeStyle = "red";
        ctx.beginPath();
        ctx.arc(200, 0, 160, Math.PI * 2, false);
        ctx.stroke();
    }

    Rectangle {
        id: rect;
        width: 40;
        height: 40;
        color: "blue";
        x: 20;
        y: 0;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                pathAnim.start();
            }
        }

        PathAnimation {
            id: pathAnim;
            target: rect;
            duration: 10000;
            anchorPoint: "20, 20";
            orientationEntryDuration: 200;
            orientationExitDuration: 200;
            easing.type: Easing.InOutCubic;
            orientation: PathAnimation.TopFirst;
            path: Path {
                startX: 40;
                startY: 0;
                PathArc {
                    x: 360;
                    y: 0;
                    useLargeArc: true;
                    radiusX: 160;
                    radiusY: 160;
                    direction: PathArc.Counterclockwise;
                }
            }
        }
    }
}
