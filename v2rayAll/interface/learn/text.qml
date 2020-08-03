import QtQuick 2.12

// 纯文本。当不指定textFormat属性时，Text元素默认使用Text.AutoText，它会自动检测文本是纯文本还是富文本
Rectangle {
    width: 500
    height: 200

    Text {
        id: plainText
        wrapMode: Text.WordWrap
        font.bold: true
        font.pixelSize: 20
        font.underline: true
        text: qsTr("Hello Plain Text")
        anchors.left: parent.horizontalCenter
        anchors.top: parent.top
        color: "blue"
    }

    Text {
        id: richText
        wrapMode: Text.WordWrap
        font.bold: true
        font.pixelSize: 20
        font.underline: true
        style: Text.Outline
        text: "Hello Rich <font color=\"blue\">Text</font>"
        anchors.top: plainText.bottom
        anchors.topMargin: 10
        anchors.left: plainText.left
    }

    Text {
        id: normalText
        style: Text.Normal
        styleColor: "red"  // 当style存在时才生效
        text: "Normal Text"
        anchors.top: richText.bottom
        anchors.topMargin: 10
        anchors.left: richText.left
    }

    Text {
        id: raisedText
        style: Text.Raised
        styleColor: "orange"  // 当style存在时才生效
        text: "Raised Text"
        anchors.top: normalText.bottom
        anchors.topMargin: 10
        anchors.left: normalText.left
    }

    Text {
        id: outlineText
        style: Text.Outline
        styleColor: "yellow"  // 当style存在时才生效
        text: "Outline Text"
        anchors.top: raisedText.bottom
        anchors.topMargin: 10
        anchors.left: raisedText.left
    }

    Text {
        id: sunkenText
        style: Text.Sunken
        styleColor: "blue"  // 当style存在时才生效
        text: "Sunken Text"
        anchors.top: outlineText.bottom
        anchors.topMargin: 10
        anchors.left: outlineText.left
    }

}
