import QtQuick 2.15
import "colorMaker.js" as ColorMaker

// StateChangeScript允许在状态变化时执行ES脚本。
Rectangle {
    id: rootItem
    width: 360;
    height: 240;
    color: "#EEEEEE";

    Rectangle {
        id: colorRect;
        color: "red";
        width: 150;
        height: 130;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        states: [
            State {
                name: "default";
                when: mouseArea.pressed;
                StateChangeScript {
                    name: "changeColor";
                    script: ColorMaker.changeColor(colorRect);
                }
            }
        ]
    }
}
