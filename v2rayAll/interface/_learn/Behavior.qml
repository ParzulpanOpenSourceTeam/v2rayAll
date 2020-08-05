import QtQuick 2.15

// Behavior用来给一个property定义默认动画。
Rectangle {
    id: rootItem;
    width: 320;
    height: 240;

    Rectangle {
        id: rect;
        width: 160;
        height: 100;
        color: "red";
        anchors.centerIn: parent;

        Behavior on width {
            NumberAnimation {
                duration: 1000;
            }
        }

        Behavior on height {
            NumberAnimation {
                duration: 1000;
                easing.type: Easing.InCubic;
            }
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                rect.width = Math.random() * rootItem.width;
                rect.height = Math.min(Math.random() * rootItem.height, rect.height * 1.5);
            }
        }
    }
}
