import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 1200
    height: 800

    title: qsTr("关于")

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
