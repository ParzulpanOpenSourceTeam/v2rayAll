import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    width: 900
    height: 600

    title: qsTr("关于")

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
