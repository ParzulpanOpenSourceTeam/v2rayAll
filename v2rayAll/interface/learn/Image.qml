import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    width: 480
    height: 320

    BusyIndicator {
        id: busy
        running: true
        anchors.centerIn: parent
        z: 2
    }

    Text {
        id: stateLabel
        visible: false
        anchors.centerIn: parent
        z: 3
        text: qsTr("")
    }

//    Image {
//        id:localImageViewer
//        source: "../../assets/logo@128_128.png"
//    }

    Image {
        id: netImageViewer
        asynchronous: true
        cache: false
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        onStatusChanged: {
            if( netImageViewer.status === Image.Loading ) {
                busy.running = true
                stateLabel.visible = false
            } else if ( netImageViewer.status === Image.Ready) {
                busy.running = false
            } else if ( netImageViewer.status === Image.Error) {
                busy.running = false
                stateLabel.visible = true
                stateLabel.text = "ERROR"
            }
        }
    }

    Component.onCompleted: {
        netImageViewer.source = "https://avatars1.githubusercontent.com/u/34685042?s=460&u=36df1b544da1c9bb497bc20efecabb1dd6a1c442&v=4"
    }
}
