import QtQuick 2.15

// 自定义按钮
Rectangle {
    id: bkgnd;
    implicitWidth: 50;
    implicitHeight: 50;
    color: "transparent";
    radius: 6;
    border.color: "#949494";
    border.width: hovered ? 2 : 0;

    property alias iconSource: icon.source;
    property alias iconWidth: icon.width;
    property alias iconHeight: icon.height;
    property alias color: btnText.color;
    property alias font: btnText.font;
    property alias text: btnText.text;
    property bool hovered: false;

    signal clicked;

    Image {
        id: icon;
        anchors.left: parent.left;
        anchors.verticalCenter: icon.verticalCenter;
    }

    Text {
        id: btnText;
        anchors.left: icon.right;
        anchors.verticalCenter: icon.verticalCenter;
        anchors.margins: 4;
        color: ma.pressed ? "blue" : (parent.hovered ? "#0000a0" : "white");
    }

    MouseArea {
        id: ma;
        anchors.fill: parent;
        hoverEnabled: true;

        onEntered: {
            bkgnd.hovered = true;
        }

        onExited: {
            bkgnd.hovered = false;
        }

        onClicked: {
            bkgnd.hovered = false;
            bkgnd.clicked();
        }
    }
}
