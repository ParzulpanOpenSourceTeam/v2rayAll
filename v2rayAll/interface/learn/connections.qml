import QtQuick 2.12
import QtQuick.Controls 2.12

// 放置两个文本、一个按钮，每点击按钮一次，两个文本对象都变颜色，且颜色随机。

Rectangle {
    width: 300;
    height: 200;
    color: "gray";

    Text {
        id: text1;
        text: qsTr("text one");
        color: "blue";
        font.pointSize: 28;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 20;
    }

    Text {
        id: text2;
        text: qsTr("text two");
        color: "blue";
        font.pixelSize: 28;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: text1.bottom;
    }

    Button {
        id: changeButton;
        text: "Change";
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: text2.bottom;
        anchors.topMargin: 8;
    }

    Connections {
        target: changeButton;
        onClicked: {
            text1.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
            text2.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }
}
