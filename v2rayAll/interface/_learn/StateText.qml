import QtQuick 2.15

Rectangle {
    id: rootItem;
    width: 360;
    height: 240;
    color: "#EEEEEE";

    Text {
        id: centerText;
        text: qsTr("A Single TExt.");
        font.pixelSize: 24;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onReleased: {
                centerText.state = "redText";
            }
        }

        states: [
            State {
                name: "redText";
                PropertyChanges {
                    target: centerText;
                    color: "red";
                }
            },

            State {
                name: "blueText";
                when: mouseArea.pressed;
                PropertyChanges {
                    target: centerText;
                    color: "blue";
                    font.bold: true;
                    font.pixelSize: 32;
//                    restoreEntryValues: false;
                }
            }
        ]

    }
}
