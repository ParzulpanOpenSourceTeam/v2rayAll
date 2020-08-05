import QtQuick 2.15
import QtQuick.Controls 1.4

Rectangle {
    width: 360;
    height: 300;

    TableView {
        id: phoneTable;
        anchors.fill: parent;
        TableViewColumn {role: "name"; title: "Name"; width: 100; elideMode: Text.ElideRight; }
        TableViewColumn {role: "cost"; title: "Cost"; width: 100; }
        TableViewColumn {role: "manufacturer"; title: "Manufacturer"; width: 140; }
        model: ListModel {
            id: phoneModel;
            ListElement {
                name: "华为 P30";
                cost: "7500";
                manufacturer: "HuaWei"
            }
            ListElement {
                name: "小米 10";
                cost: "5500";
                manufacturer: "XiaoMi"
            }
            ListElement {
                name: "华为 P30";
                cost: "7500";
                manufacturer: "HuaWei"
            }
            ListElement {
                name: "小米 10";
                cost: "5500";
                manufacturer: "XiaoMi"
            }
            ListElement {
                name: "iPhone 11";
                cost: "1500";
                manufacturer: "Apple"
            }
            ListElement {
                name: "iPhone 10";
                cost: "1000";
                manufacturer: "Apple"
            }
        }

        focus: true;
    }
}
