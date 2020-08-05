import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    width: 360;
    height: 240;
    color: "lightgray";

    Component {
        id: tabContent;
        Rectangle {
            implicitWidth: 100;
            implicitHeight: 100;
            anchors.fill: parent;
            color: Qt.rgba(Math.random(), Math.random(), Math.random())
        }
    }

    Row {
        id: buttonRow
        anchors.fill: parent;
//        anchors.left: parent.left;
//        anchors.top: parent.top;
        anchors.margins: 10;
        spacing: 8;

        Button {
            id: addTab;
            text: "AddTab";
            onClicked: {
                tabBar.addItem(tabContent.createObject(tabBar));
            }
        }

        Button {
            id: removeTab;
            text: "RemoveTab";
            onClicked: {
                ;
            }
        }

    }

    // C2用来代替C1的TabView
    TabBar {
             id: tabBar
             anchors.top: buttonRow.bottom;
             anchors.topMargin: 8;
             anchors.left: buttonRow.left;
             anchors.leftMargin: 8;
    }

}
