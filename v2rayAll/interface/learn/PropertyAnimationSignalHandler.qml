import QtQuick 2.15

// PropertyAnimation在信号处理器中使用
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
            anchors.fill: parent;
            onClicked: PropertyAnimation {
                target: rect;
                properties: "width, height";
                to: 200;
                duration: 1000;
            }
        }
    }
}
