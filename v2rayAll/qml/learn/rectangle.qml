import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root
    width: 480
    height: 240
//    color:  "#D8D8D8"
//    rotation: 90
    gradient: Gradient {
        GradientStop {
            position: 0.11;
            color: "#000000";
        }
        GradientStop {
            position: 0.60;
            color: "#ffffff";
        }
        GradientStop {
            position: 1.00;
            color: "#ffffff";
        }
    }
    border.color: "red"
    border.width: 2
    radius: 12

    Image {
        id: rocket
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        source: "../../assets/logo@128_128.png"
    }

    Text {
        id: rocketText
        anchors.centerIn: parent
        horizontalAlignment:  Text.AlignHCenter
        text: qsTr("Rocket")
    }

    Button {
        id: quit
        text: qsTr("退出")
        anchors.left: rocketText.left
        anchors.leftMargin: 0
        anchors.top: rocketText.bottom
        anchors.topMargin: 10
        onClicked: {
            Qt.quit()
        }

    }
}
