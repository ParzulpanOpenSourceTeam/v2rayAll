import QtQuick 2.15

// 模仿网页连接
Rectangle {
    id: rootItem;
    width:360;
    height: 240;
    color: "#EEEEEE";

    Text {
        id: linkText
        text: qsTr("I\'m web link.");
        font.pixelSize: 24;
        anchors.centerIn: parent;
        property var hadClicked: false;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true;

            onEntered: {
                linkText.state = linkText.hadClicked == true ? "clickedHover" : "hover";
            }

            onExited: {
                linkText.state = linkText.hadClicked == true ? "clicked" : "initial";
            }

            onClicked: {
                if(linkText.hadClicked == false) {
                    linkText.hadClicked = true;
                }
                linkText.state = "clicked";
            }
        }

        states: [
            State {
                name: "initial";    // 初始状态，文本颜色为蓝色
                PropertyChanges {
                    target: linkText;
                    color: "blue";
                }
            },
            State {
                name: "hover";  // 未点击时鼠标进入，文本变为浅蓝色，字体放大、倾斜、下划线
                PropertyChanges {
                    target: linkText;
                    color: "#87CEFA";
                    font { italic: true; pixelSize: 36; underline: true;}
                }
            },
            State {
                name: "clicked";    //点击后颜色变为马鞍棕色，文本恢复到初始
                PropertyChanges {
                    target: linkText;
                    color: "#8B4513";
                    font { pixelSize: 24;}
                }
            },
            State {
                name: "clickedHover";   // 点击后鼠标进入，文本变为巧克力色，字体放大、倾斜、下划线
                PropertyChanges {
                    target: linkText;
                    color: "#D2691E";
                    font { itatic: true; pixelSize: 36; underline: true;}
                }
            }
        ]

        state: "initial";

        transitions: [
            Transition {
                from: "initial";
                to: "hover";
                reversible: true;
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 800;
                }

                ColorAnimation {
                    duration: 800;
                }
            },
            Transition {
                from: "hover";
                to: "clicked";
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 800;
                }

                ColorAnimation {
                    duration: 800
                }
            }
        ]
    }
}
