import QtQuick 2.15
import QtQuick.Controls 2.15

// 在C++中使用QML对象

ApplicationWindow {
    objectName: "rootObject";
    width: 360;
    height: 360;
    visible: true;

    Text {
        objectName: "textLabel";
        text: "hello World";
        anchors.centerIn: parent;
        font.pixelSize: 26;
    }

    Button {
        objectName: "quitButton";
        text: "quit";
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
    }
}
