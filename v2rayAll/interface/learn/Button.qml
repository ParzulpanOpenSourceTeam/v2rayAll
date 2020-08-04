import QtQuick 2.12
import QtQuick.Controls 1.4 as C1
import QtQuick.Controls 2.12 as C2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: control
    width: 300
    height: 200

    Component {
        id: btnStyle
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 70
                implicitHeight: 25
                color: "#DDDDDD"
                border.width: control.pressed ? 2 : 1
                border.color: ( control.hovered || control.pressed ) ? "green" : "#888888"
            }
        }
    }

    C1.Button {
        text: "Quit"
        checkable: true
//        isDefalut: true
        anchors.centerIn: parent
        style: btnStyle   // qtquickcontrols2不支持style属性
        onClicked: Qt.quit()
    }
}


