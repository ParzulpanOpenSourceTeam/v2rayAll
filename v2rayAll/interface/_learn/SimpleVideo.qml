import QtQuick 2.15
import QtMultimedia 5.15

Rectangle {
    width: 720;
    height: 480;

    MediaPlayer {
        id: player;
        source: "";
        onError: {
            console.log(errorString);
        }
    }

    VideoOutput {
        anchors.fill: parent;
        source: player;
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: {
            player.play();
        }
    }

}
