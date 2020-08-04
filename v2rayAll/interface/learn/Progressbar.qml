import QtQuick 2.12
import QtQuick.Controls 2.12 as C2
import QtQuick.Controls 1.4 as C1
import QtQuick.Controls.Styles 1.4

// 进度条

Rectangle {
    width: 600;
    height: 480;
    color: "#a0b0a0";

    Row {
        anchors.fill: parent;
        anchors.margins: 10;
        spacing: 8;

        C2.ProgressBar {
            from: 0;
            to: 100;
            value: 40;
            width: 150;
            height: 20;
            Timer {
                interval: 1000;
                repeat: true;
                running: true;
                onTriggered: {
                    if (parent.value < 99.1) {
                        parent.value += 1;
                    } else {
                        stop();
                    }
                }
            }
        }

        C1.ProgressBar {
            orientation: Qt.Vertical;
            minimumValue: 0;
            maximumValue: 100;
            value: 0;
            width: 20;
            height: 200;
            Timer {
                interval: 1000;
                repeat: true;
                running: true;
                onTriggered: {
                    if (parent.value < 99.1) {
                        parent.value += 10;
                    } else {
//                        stop();
                        parent.value = 0;
                    }
                }
            }
        }

        C1.ProgressBar {
            orientation: Qt.Vertical;
            minimumValue: 0;
            maximumValue: 1;
            value: 0.2;
            width: 20;
            height: 200;
            Timer {
                interval: 1000;
                repeat: true;
                running: true;
                onTriggered: {
                    parent.value = Math.random();
                }
            }
        }

        C1.ProgressBar {
            minimumValue: 0;
            maximumValue: 1;
            value: 0.2;
            width: 80;
            height: 16;
            indeterminate: true;
        }

        Item {
            width: 180;
            height: parent.height;

            C1.ProgressBar {
                id: customProgress;
                anchors.centerIn: parent;
                minimumValue: 0;
                maximumValue: 1;
                value: 0.2;
                width: 160;
                height: 20;
                style: ProgressBarStyle {
                    background: Rectangle {
                        implicitWidth: 200;
                        implicitHeight: 20;
                        border.width: 1;
                        border.color: control.hovered ? "green" : "gray";
                        color: "lightgray";
                    }
                    progress: Rectangle {
                        color: "#208020"
                    }
                }
            }

            C1.ProgressBar {
                id:percentProgress;
                anchors.top: customProgress.bottom;
                anchors.topMargin: 4;
                anchors.horizontalCenter: parent.horizontalCenter;
                minimumValue: 0;
                maximumValue: 100;
                value: 0;
                width: 160
                height: 20;
                Timer {
                    interval: 1000;
                    repeat: true;
                    running: true;
                    onTriggered: {
                        if (parent.value < 100) {
                            parent.value += 1;
                        } else {
                            stop();
                        }
                    }
                }
                style: ProgressBarStyle {
                    id: progressStyle;
                    background: Rectangle {
                        border.width: 1;
                        border.color: control.hovered ? "green" : "gray";
                        color: "lightgray";
                    }
                    progress: Rectangle {
                        color: "#208020";
                    }
                    panel: Item {
                        implicitWidth: 200;
                        implicitHeight: 20;

                        Loader {
                            anchors.fill: parent;
                            sourceComponent: background;
                        }

                        Loader {
                            id: progressLoader;
                            anchors.top: parent.top;
                            anchors.left: parent.left;
                            anchors.bottom: parent.bottom;
                            anchors.margins: 3;
                            z: 1;
                            width: currentProgress * (parent.width - 6);
                            sourceComponent: progressStyle.progress;
                        }

                        Text {
                            id: progressText;
                            text: qsTr(Math.round(currentProgress * 100)  + "%");
                            z: 2;
                            anchors.centerIn: parent;
                        }
                    }
                }
            }
        }

    }

}
