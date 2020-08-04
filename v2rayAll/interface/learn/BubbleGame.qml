import QtQuick 2.15
import QtQuick.Controls 2.15


// 动画知识点整合，射泡泡游戏。
Rectangle {
    id: root;
    width: 360;
    height: 420;
    color: "#E0E0E0";
    focus: true;

    Row {
        id: bubbles;
        anchors.top: parent.top;
        anchors.horizontalCenter: parent.horizontalCenter;
        spacing: 2;
        property var diedCount: 0;

        Component.onCompleted: {
            var qmlStringBegin = "import QtQuick 2.15; Image { width: 30; height: 30; property var died: false; source:\"qrc:assets/assets/Boss} ";
            for(var i = 0; i < 8; ++i) {
                var qmlString = qmlStringBegin + i + ".png\"";
                bubbles.children[i] = Qt.createQmlObject(qmlString, bubbles, "DynamicImage");
            }
        }

        function allDie() {
            return diedCount === children.length;
        }

        function reset() {
            diedCount = 0;
            var bubble;
            for(var i = 0; i < bubbles.children.length; ++i) {
                bubble = bubbles.children[i];
                bubble.died = false;
                bubble.source = "qrc:assets/assets/Boss" + i + ".png";
                bubble.opacity = 1.0;
            }
        }
    }

    Text {
        id: scoreInfo;
        text: qsTr("");
        color: "blue";
        font {pixelSize: 26; bold: true;}
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: bubbles.bottom;
        anchors.topMargin: 4;
    }

    Image {
        id: turret;
        width: 50;
        height: 50;
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        source: "qrc:assets/assets/battery.png";
        transformOrigin: Item.Bottom;
    }

    Image {
        id: bullet;
        width: 40;
        height: 40;
        source: "qrc:assets/assets/bullet.png";
        z: 2;
        visible: false;
    }

    NumberAnimation {
        id: animateTurret;
        target: turret;
        property: "rotation";
        property var rotateAngle: 0;

        function rotate(angle) {
            rotateAngle += angle;
            if(running == false) {
                rotateTurret();
            }
        }

        function rotateTurret() {
            if(rotateAngle != 0) {
                from = turret.rotation;
                to = turret.rotation + rotateAngle;
                if(to > 80) {
                    to = 80;
                }
                else if (to < -80) {
                    to = -80;
                }
                let distance = to - form;
                duration = Math.min(100 * Math.abs(distance / 3), 800);
                start();
                rotateAngle = 0;
            }
        }

        onStopped: {
            rotateTurret();
        }
    }

    NumberAnimation {
        id: aboutDie;
        property: "opacity";
        duration: 400;
        from: 1.0;
        to: 0;
        onStopped: {
            showDie.start();
        }
    }

    NumberAnimation {
        id: showDie;
        property: "opacity";
        duration: 400;
        from:0;
        to: 0.6;
        property var diedImage;

        onStarted: {
            target.source = diedImage;
        }

        onStopped: {
            root.resetBulllet();
            bubbles.showPass(true);
        }
    }

}
