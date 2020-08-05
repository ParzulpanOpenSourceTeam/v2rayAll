import QtQuick 2.15


// NumberAnimation是PropertyAnimation的派生类，专门处理数字类型的property
Rectangle {
    id: rootItem;
    width: 360;
    height: 240;
    color: "#EEEEEE";

    Rectangle {
        id: rect;
        width: 50;
        height: 50;
        x: 0;
        y: 95;
        color: "blue";

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                animationX.start();
                animationRotation.running = true;
                animationRadius.start();
            }
        }

        NumberAnimation {
            id: animationX;
            target: rect;
            property: "x";
            to: 310;
            duration: 5000;
            easing.type: Easing.OutCubic;
        }

        NumberAnimation {
            id: animationRotation;
            target: rect;
            property: "rotation";
            to: 1080;
            duration: 5000;
            running: false;
            easing.type: Easing.OutInQuad;
        }

        NumberAnimation on radius {
            id: animationRadius;
            to: 25;
            duration: 5000;
            running: false;
        }
    }
}
