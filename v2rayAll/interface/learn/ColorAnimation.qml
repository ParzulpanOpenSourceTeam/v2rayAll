import QtQuick 2.15

// ColorAnimation的派生类，专门处理颜色类型的property
Rectangle {
    width: 320;
    height: 240;
    color: "#EEEEEE";

    Rectangle {
        id: rect;
        width: 60;
        height: 60;
        radius: 30;
        color: "red";
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked:
                ColorAnimation {
                target: rect;
                property: "color";
                from: "black"
                to: "blue"
                duration: 2000
            }
        }
    }
}
