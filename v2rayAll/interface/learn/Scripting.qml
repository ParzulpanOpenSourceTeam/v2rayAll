import QtQuick 2.12

// 脚本
Rectangle {
    id: root
    width: 120
    height: 240
    color:  "#D8D8D8"

    Text {
        id: label
        x: 24
        y: 24

        // 自定义属性
        property int spacePresses: 0

        text: qsTr("Space pressed:  " + spacePresses + " tiems")

        // 文字变更处理
        onTextChanged: console.log("text changed to: ", text)

        // 需要重点关注事件
        focus: true

        Keys.onSpacePressed: {
            increment()
        }

        Keys.onEscapePressed: {
            label.text = ""
        }

        function increment() {
            spacePresses = spacePresses + 1
        }

    }

}

