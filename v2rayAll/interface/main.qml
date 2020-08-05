import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: window;
    visible: true;
    width: 800;
    height: 600;
    minimumWidth: 800;
    minimumHeight: 600;
    title: qsTr("v2rayAll - 2020/08")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight;

        ToolButton {
            id: toolButton;
            text: stackView.depth > 1 ? "\u25C0" : "\u2630";
            font.pixelSize: Qt.application.font.pixelSize * 1.6;
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop();
                } else {
                    drawer.open();
                }
            }
        }

        Label {
            text: stackView.currentItem.title;
            anchors.centerIn: parent;
        }
    }

    Drawer {
        id: drawer;
        width: window.width * 0.20;
        height: window.height;

        Column {
            anchors.fill: parent;

            ItemDelegate {
                text: qsTr("服务列表");
                width: parent.width;
                onClicked: {
                    stackView.push("ui/ServerForm.qml");
                    drawer.close();
                }
            }
            ItemDelegate {
                text: qsTr("参数配置");
                width: parent.width;
                onClicked: {
                    stackView.push("ui/ParameterForm.qml");
                    drawer.close();
                }
            }
            ItemDelegate {
                text: qsTr("偏好设置");
                width: parent.width;
                onClicked: {
                    stackView.push("ui/PreferenceForm.qml");
                    drawer.close();
                }
            }
            ItemDelegate {
                text: qsTr("关于软件");
                width: parent.width;
                onClicked: {
                    stackView.push("ui/AboutForm.qml");
                    drawer.close();
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "ui/ServerForm.qml"
        anchors.fill: parent
    }
}
