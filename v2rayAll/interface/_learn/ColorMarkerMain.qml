import QtQuick 2.15
import QtQuick.Controls 2.15

import Custom.v2rayAll.ColorMarker 1.0
// 使用了setContextProperty，则不需要import了

// 在QML中使用C++类和对象
Rectangle {
    width: 360;
    height: 360;
    Text {
        id: timeLabel;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        font.pixelSize: 26;
    }

    ColorMarker {
        id: colorMarker;
        color: Qt.green;
    }

    Rectangle {
        id: colorRect;
        width: 200;
        height: 200;
        anchors.centerIn: parent;
        color: "blue";
    }

    Button {
        id: start;
        text: "Start";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            colorMarker.start();
        }
    }

    Button {
        id: stop;
        text: "Stop";
        anchors.left: start.right;
        anchors.leftMargin: 4;
        anchors.bottom: start.bottom;
        onClicked: {
            colorMarker.stop();
        }
    }

    function changeAlgorithm(button, algorithm) {
        switch(algorithm) {
        case 0:
            button.text = "RandomRGB";
            break;
        case 1:
            button.text = "RandomRed";
            break;
        case 2:
            button.text = "RandomGreen";
            break;
        case 3:
            button.text = "RandomBlue";
            break;
        case 4:
            button.text = "LinearIncrease";
            break;
        }

    }

    Button {
        id: colorAlgorihm;
        text: "RandomRGB";
        anchors.left: stop.right;
        anchors.leftMargin: 4;
        anchors.bottom: start.bottom;
        onClicked: {
            let algorithm = (colorMarker.algorithm() + 1) % 5;
            changeAlgorithm(colorAlgorihm, algorithm);
            colorMarker.setAlgorithm(algorithm);
        }
    }

    Button {
        id: quit;
        text: qsTr("Quit");
        anchors.left: colorAlgorihm.right;
        anchors.leftMargin: 4;
        anchors.bottom: start.bottom;
        onClicked: {
            Qt.quit();
        }
    }

    Component.onCompleted: {
        colorMarker.color = Qt.rgba(0, 180, 120, 255);
        colorMarker.setAlgorithm(ColorMarker.LinearIncrease);
        changeAlgorithm(colorAlgorihm, colorMarker.algorithm());
    }

    Connections {
        target: colorMarker;
        onCurrentTime: {
            timeLabel.text = strTime;
            timeLabel.color = colorMarker.timeColor;
        }
    }

    Connections {
        target: colorMarker;
        onColorChanged: {
            colorRect.color = color;
        }
    }
}
