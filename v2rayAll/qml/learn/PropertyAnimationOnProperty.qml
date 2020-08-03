import QtQuick 2.15

// PropertyAnimation在属性关联中使用

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

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        PropertyAnimation on width {
            to: 200;
            duration: 1000;
            running: mouseArea.pressed;
//            running: true;
        }
    }
}
