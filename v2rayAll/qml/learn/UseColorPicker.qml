import QtQuick 2.12

Rectangle {
    width: 320;
    height: 240;
    color: "#EEEEEE";

    Text {
        id: coloredText;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        font.pixelSize: 32
        text: qsTr("Color Text");
    }

    function setTextColor(clr) {
        coloredText.color = clr;
    }

    ColorPicker {
        id: redColor;
        color: "red";
        focus: true;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.right: blueColor;
        KeyNavigation.tab: blueColor;
        // 使用信号处理器
        onColorPicked: {
            coloredText.color = clr;
        }
    }

    ColorPicker {
        id: blueColor;
        color: "blue";
        anchors.left: redColor.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.left: redColor;
        KeyNavigation.right: pinkColor;
        KeyNavigation.tab: pinkColor;
        // 使用signal对象的connect方法

    }

    ColorPicker {
        id: pinkColor;
        color: "pink";
        anchors.left: blueColor.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.left: blueColor;
        KeyNavigation.tab: redColor;
        // 使用signal对象的connect方法
    }

    Component.onCompleted: {
        blueColor.colorPicked.connect(setTextColor);
        pinkColor.colorPicked.connect(setTextColor);
    }
}
