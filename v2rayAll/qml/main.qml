import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: window
    visible: true
//    visibility: ApplicationWindow.Maximized
//    modality: Qt.NonModal
//    flags: Qt.Dialog
    width: 900
    height: 600
    minimumWidth: 900
    minimumHeight: 600
    title: qsTr("v2rayAll")

    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.2
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("配置")
                width: parent.width
                onClicked: {
                    stackView.push("qrc:qml/qml/ui/Page1Form.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("关于")
                width: parent.width
                onClicked: {
                    stackView.push("qrc:qml/qml/ui/Page2Form.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "qrc:qml/qml/ui/HomeForm.ui.qml"
        anchors.fill: parent
    }
}
