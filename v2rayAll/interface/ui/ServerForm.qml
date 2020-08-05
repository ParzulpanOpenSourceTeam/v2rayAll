import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.15

Page {
    id: page

    title: qsTr("服务列表")

    anchors.margins: 10

    onWidthChanged: {
        serverTable.width = parent.width - 10
        logTextArea.width = parent.width - 10
    }

    onHeightChanged: {
        serverTable.height = parent.height / 2 - 100
        logTextArea.height = parent.height / 2 - 100
    }


    ColumnLayout {
        id: columnLayout
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.margins: 5
        spacing: 5
        Layout.fillWidth: true
        Layout.fillHeight: true

        Label {
            id: serverLabel
            text: qsTr("列表详情:")
            font {
                bold: true
                pixelSize: 16
            }
            onWidthChanged: {

            }
        }

        TableView {
            id: serverTable
            width: parent.width - 10

            TableViewColumn {
                role: "name"
                title: "Name"
                width: 100
                elideMode: Text.ElideRight
            }
            TableViewColumn {
                role: "cost"
                title: "Cost"
                width: 100
            }
            TableViewColumn {
                role: "manufacturer"
                title: "Manufacturer"
                width: 140
            }
            model: ListModel {
                id: phoneModel

                ListElement {
                    name: "华为 P30"
                    cost: "7500"
                    manufacturer: "HuaWei"
                }
                ListElement {
                    name: "小米 10"
                    cost: "5500"
                    manufacturer: "XiaoMi"
                }
                ListElement {
                    name: "华为 P30"
                    cost: "7500"
                    manufacturer: "HuaWei"
                }
                ListElement {
                    name: "小米 10"
                    cost: "5500"
                    manufacturer: "XiaoMi"
                }
                ListElement {
                    name: "iPhone 11"
                    cost: "1500"
                    manufacturer: "Apple"
                }
                ListElement {
                    name: "iPhone 10"
                    cost: "1000"
                    manufacturer: "Apple"
                }
            }

            focus: true
        }

        Label {
            id: logLabel
            text: qsTr("日志详情:")
            font {
                bold: true
                pixelSize: 16
            }
        }

        TextArea {
            id: logTextArea

            width: parent.width - 10
        }
    }
}
