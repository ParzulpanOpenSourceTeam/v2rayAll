import QtQuick 2.12
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4


// 头像截取器
ApplicationWindow {
    visible: true;
    width: 480;
    height: 320;
    minimumWidth: 480;
    minimumHeight: 320;
    color: "black";

    onWidthChanged: {
        mask.recalc();  //
    }
    onHeightChanged: {
        mask.recalc();
    }

    Image {
        id: source
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        visible: false;
        asynchronous: true;
        onStatusChanged: {
            if (status == Image.Ready) {
                console.log("Image loaded.");
                mask.recalc();
            }
        }
    }

    FileDialog {
        id: fileDialog;
        title: "请选择你的文件";
        nameFilters: ["Image Files (*.jpg *.png *.gif)"];
        onAccepted: {
            source.source = fileDialog.fileUrl;
        }
    }

    Canvas {
        id: forSaveCanvas;
        width: 128;
        height: 128;
        contextType: "2d";
        visible: false;
        z: 2;
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.margins: 4;

        property var imageData: null;
        onPaint: {
            if( imageData != null) {
                context.drawImage(imageData, 0, 0);
            }
        }

        function setImageData(data) {
            imageData = data;
            requestPaint();
        }
    }

    Canvas {
        id: mask;
        anchors.fill: parent;
        z: 1;
        property real w: width;
        property real h: height;
        property real dx: 0;
        property real dy: 0;
        property real dw: 0;
        property real dh: 0;
        property real frameX: 66;
        property real frameY: 66;

        function calc() {
            let sw = source.sourceSize.width;
            let sh = source.sourceSize.height;
            if (sw > 0 && sh > 0) {
                if (sw <= w && sh <= h) {
                    dw = sw;
                    dh = sh;
                } else {
                    let sRatio = sw / sh;
                    dw = sRatio * h;
                    if (dw > w) {
                        dh = w / sRatio;
                        dw = w;
                    } else {
                        dh = h;
                    }
                }
                dx = (w - dw) / 2;
                dy = (h - dh) / 2;
            }
        }

        function recalc() {
            calc();
            requestPaint();
        }

        function getImageData() {
            return context.getImageData(frameX - 64, frameY - 64, 128, 128);
        }

        onPaint: {
            let ctx = getContext("2d");
            if (dw < 1 || dh < 1) {
                ctx.fillStyle = "#0000a0";
                ctx.font = "20pt sans-serif";
                ctx.textAlign = "center";
                ctx.fillText("请选择图片文件", width / 2, height / 2);
                return;
            }
            ctx.clearRect(0, 0, width, height);
            ctx.drawImage(source, dx, dy, dw, dh);
            let xStart = frameX - 66;
            let yStart = frameY - 66;
            ctx.save();
            ctx.fillStyle = "#a0000000";
            ctx.fillRect(0, 0, w, yStart);
            let yOffest = yStart + 132;
            ctx.fillRect(0, yOffest, w, h - yOffest);
            ctx.fillRect(0, yStart, xStart, 132);
            let xOffest = xStart + 132;
            ctx.fillRect(xOffest, yStart, w - xOffest, 132);

            ctx.strokeStyle = "red";
            ctx.fillStyle = "#00000000";
            ctx.lineWidth = 2;
            ctx.beginPath();
            ctx.rect(xStart, yStart, 132, 132);
            ctx.fill();
            ctx.stroke();
            ctx.closePath();
            ctx.restore();
        }
    }

    MultiPointTouchArea {
        anchors.fill: parent;
        minimumTouchPoints: 1;
        maximumTouchPoints: 1;
        touchPoints: [
            TouchPoint {
                id: point1;
            }
        ]

        onUpdated: {
            mask.frameX = point1.x;
            mask.frameY = point1.y;
            mask.requestPaint();
        }

        onReleased: {
            forSaveCanvas.setImageData(mask.getImageData());
            actionPanel.visible = true;
        }

        onPressed: {
            actionPanel.visible = false;
        }
    }

    Component {
        id: flatButton;
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 70;
                implicitHeight: 30;
                border.width: control.hovered ? 2 : 1;
                border.color: control.hovered ? "#c0c0c0" : "#909090";
                color: control.pressed ? "#a0a0a0" : "#707070";
            }
            label: Text {
                anchors.fill: parent;
                font.pointSize: 12;
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
                text: control.text;
                color: (control.hovered && !control.pressed) ? "blue" : "white";
            }
        }
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 20;
        id: actionPanel;
        z: 5;
        spacing: 8;
        Button {
            style: flatButton;
            text: qsTr("打开");
            onClicked: {
                fileDialog.open();
            }
        }

        Button {
            style: flatButton;
            text: qsTr("保存");
            onClicked: {
                forSaveCanvas.save("profilePicture.png");
                actionPanel.visible = false;
            }
        }

        Button {
            style: flatButton;
            text: qsTr("取消");
            onClicked: {
                actionPanel.visible = false;
            }
        }

    }

}
