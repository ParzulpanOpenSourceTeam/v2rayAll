import QtQuick 2.12

// 在单独文件中自定义组件

Rectangle {
    id: colorPicker;
    width: 50;
    height: 30;
    signal colorPicked(color clr);

    function configureBorder () {
        colorPicker.border.width = colorPicker.focus ? 2 : 0;
        colorPicker.border.color = colorPicker.focus ? "#90D#34" : "#808080";
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: {
            colorPicker.colorPicked(colorPicker.color);
            mouse.accepted = true;
            colorPicker.focus = true;
        }
    }

    Keys.onReturnPressed: {
        colorPicker.colorPicked(colorPicker.color);
        event.accepted = true;
    }

    Keys.onSpacePressed: {
        colorPicker.colorPicked(colorPicker.color);
        event.accepted = true;
    }

    onFocusChanged: {
        configureBorder();
    }

    Component.onCompleted: {
        configureBorder();
    }
}
