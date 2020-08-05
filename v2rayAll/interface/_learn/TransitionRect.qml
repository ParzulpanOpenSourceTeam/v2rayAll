import QtQuick 2.15

// 状态过渡，消除状态突变
Rectangle {
    id: rootItem;
    width: 360;
    height: 240;
    color: "#EEEEEE";
    anchors.centerIn: parent;

    Rectangle {
        id: rect;
        color: "gray";
        width: 50;
        height: 50;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        states: [
            State {
                name: "pressed";
                when: mouseArea.pressed;
                PropertyChanges {
                    target: rect;
                    color: "green";
                    scale: "2.0";
                }
            }
        ]

        transitions: Transition {
//            from: "fromState";
//            to: "toState";
            to: "pressed";
            reversible: true;
            NumberAnimation {
                property: "scale";
                easing.type: Easing.InOutQuad;
                duration: 1000;
            }

            ColorAnimation {
                duration: 600;
            }

        }
    }
}
