import QtQuick 2.15
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("v2rayAll")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

//        Page1Form {
//        }

//        Page2Form {
//        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        Image {
            id: serverImage;
            width: 128;
            height: 128;
            source: "qrc:/assets/assets/server@128_128.png"
//            text: qsTr("服务列表");
        }
        Image {
            id: parameterImage;
            width: 128;
            height: 128;
            source: "qrc:/assets/assets/server@128_128.png"
//            text: qsTr("参数设置");
        }
        Image {
            id: preferenceImage;
            width: 128;
            height: 128;
            source: "qrc:/assets/assets/server@128_128.png"
//            text: qsTr("偏好设置");
        }
        Image {
            id: updateImage;
            width: 128;
            height: 128;
            source: "qrc:/assets/assets/server@128_128.png"
//            text: qsTr("检查更新");
        }
        Image {
            id: resetImage;
            width: 128;
            height: 128;
            source: "qrc:/assets/assets/server@128_128.png"
//            text: qsTr("重启服务")
        }
    }
}
