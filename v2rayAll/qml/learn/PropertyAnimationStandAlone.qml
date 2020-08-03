import QtQuick 2.15

// PropertyAnimation单独使用
Rectangle {
    id: rootItem;
    width: 360;
    height: 240;
    color: "#EEEEEE";

    Rectangle {
        id: rect;
        width: 50;
        height: 150;
        anchors.centerIn: parent;
        color: "blue";

        PropertyAnimation {
            id: animation;
            target: rect;
            properties: "width, height";
            to: 200;
            duration: 1000;
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
//                animation.running = true;
                animation.start(); // 效果同上
            }
        }
    }
}
