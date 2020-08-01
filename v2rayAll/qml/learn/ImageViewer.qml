import QtQuick 2.12
import QtQuick.Controls 1.4 as C1
import QtQuick.Controls 2.12 as C2
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

C2.ApplicationWindow {
    id: window;
    visible: true;
    width: 900;
    height: 600;
    minimumWidth: 900;
    minimumHeight: 600;
    title: qsTr("图片浏览器");

    C2.BusyIndicator {
        id: busy;
        running: false;
        anchors.centerIn: parent;
        z: 2;
    }

    Text {
        id: stateLabel;
        visible: false;
        anchors.centerIn: parent;
        text: qsTr("");
        z: 3;
    }

    Image {
        id: imageViewer;
        asynchronous: true;
        cache: false;
        anchors.fill: parent;
        fillMode: Image.PreserveAspectFit;
        onStatusChanged: {
            if ( imageViewer.status === Image.Loading ) {
                busy.running = true;
                stateLabel.visible = false;
            } else if ( imageViewer.status === Image.Ready ) {
                busy.running = false;
            } else if ( imageViewer.status === Image.Error ) {
                busy.running = false;
                stateLabel.visible = true;
                stateLabel.text = "ERROR";
            }
        }
    }

    C1.Button {
        id: openFile;
        text: "Open";
        anchors.left: parent.left;
        anchors.leftMargin: 8;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 8;
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 70;
                implicitHeight: 25;
                border.width: control.pressed? 2: 1;
                border.color: ( control.hovered || control.pressed ) ? "green" : "#888888";
            }
        }
        onClicked: fileDialog.open();
        z: 4;
    }

    Text {
        id: imagePath;
        anchors.left: openFile.right;
        anchors.leftMargin: 8;
        anchors.verticalCenter: openFile.verticalCenter;
        font.pixelSize: 18;
    }

    FileDialog {
        id: fileDialog;
        title: "请选择文件";
        nameFilters: ["Image Files (*.jpg *.png *.gif)", "Bitmap File (*.bmp)", "* (*.*)"];
        selectMultiple: true;
        onAccepted: {
//            imageViewer.source = fileDialog.fileUrl;
//            let imageFile = new String(fileDialog.fileUrl);
            imageViewer.source = fileDialog.fileUrls[0];
            let imageFile = String(fileDialog.fileUrls[0]);
            console.log(typeof(fileDialog.fileUrls));   // object
            console.log(typeof(fileDialog.fileUrls[0]));    // string
            console.log(imageFile);
            imagePath.text = imageFile.slice(8);
        }
    }
}
