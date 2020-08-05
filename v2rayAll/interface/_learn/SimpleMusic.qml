import QtQuick 2.15
import QtMultimedia 5.15

Rectangle {
    width: 320;
    height: 240;
    color: "black";

    property var utilDate: new Date();

    function msecs2String(msecs) {
        utilDate.setTime(msecs);
        return Qt.formatTime(utilDate, "mm:ss");
    }

    MediaPlayer {
        id: mediaPlayer;
        source: "qrc:/assets/assets/test.mp3";

        onPositionChanged: {
            progress.text = msecs2String(position) + progress.sDuration;
        }

        onDurationChanged: {
            progress.sDuration = " / " + msecs2String(duration);
        }

        onPlaybackStateChanged: {
            switch(playbackState) {
            case mediaPlayer.PlayingState:
                state.text = "播放中";
                break;
            case mediaPlayer.PausedState:
                state.text = "已暂停";
                break;
            case mediaPlayer.StoppedState:
                state.text = "停止";
                break;
            }
        }

        onError: {
            console.log(errorString);
        }

    }

    Row {
        id: controller;
        anchors.top: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.margins: 4;
        spacing: 4;

        FlatButton {
//            iconWidth: 50;
//            iconHeight: 50;
            text: qsTr("后退");

            onClicked: {
                if(mediaPlayer.seekable) {
                    mediaPlayer.seek(mediaPlayer.position - 5000);
                }
            }
        }

        FlatButton {
//            iconWidth: 50;
//            iconHeight: 50;
            text: qsTr("暂停");

            onClicked: {
                mediaPlayer.pause();
            }
        }

        FlatButton {
//            iconWidth: 50;
//            iconHeight: 50;
            text: qsTr("播放");

            onClicked: {
                mediaPlayer.play();
            }
        }

        FlatButton {
//            iconWidth: 50;
//            iconHeight: 50;
            text: qsTr("停止");

            onClicked: {
                mediaPlayer.stop();
            }
        }

        FlatButton {
//            iconWidth: 50;
//            iconHeight: 50;
            text: qsTr("前进");

            onClicked: {
                if(mediaPlayer.seekable) {
                    mediaPlayer.seek(mediaPlayer.position + 5000);
                }
            }
        }
    }

    Text {
        id: progress;
        anchors.left: controller.left;
        anchors.bottom: controller.top;
        anchors.bottomMargin: 4;
        color: "white";
        font.pixelSize: 12;

        property string sDuration;
    }

    Text {
        id: state;
        anchors.left: progress.left;
        anchors.bottom: progress.top;
        anchors.bottomMargin: 4;
        color: "white";
        font.pointSize: 12;
    }
}

