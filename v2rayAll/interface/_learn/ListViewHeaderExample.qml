import QtQuick 2.15
import QtQuick.Controls 2.15;
import QtQuick.Layouts 1.15


Rectangle {
    width: 360;
    height: 300;
    color: "#EEEEEE";

    Component {
        id: phoneModel;
        ListModel {
            //
            ListElement {
                name: "华为 P30";
                cost: "7500";
                manufacturer: "HuaWei"
            }
            ListElement {
                name: "华为 P30";
                cost: "7500";
                manufacturer: "HuaWei"
            }
            //
            ListElement {
                name: "小米 10";
                cost: "5500";
                manufacturer: "XiaoMi"
            }
            ListElement {
                name: "小米 10";
                cost: "5500";
                manufacturer: "XiaoMi"
            }
        }
    }

    Component {
        id: headView;
        Item {
            width: parent.width;
            height: 30;
            RowLayout {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 8;
                Text {
                    id: name;
                    text: qsTr("Name");
                    font { bold: true; pixelSize: 20;}
                    Layout.preferredWidth: 120;
                }

                Text {
                    id: cost;
                    text: qsTr("Cost");
                    font { bold: true; pixelSize: 20;}
                    Layout.preferredWidth: 80;
                }

                Text {
                    id: manufacturer;
                    text: qsTr("Manufacturer");
                    font { bold: true; pixelSize: 20;}
                    Layout.fillWidth: true;
                }
            }
        }
    }

    Component {
        id: phoneDelegate;
        Item {
            id: wrapper;
            width: parent.width;
            height: 30;

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    wrapper.ListView.view.currentIndex = index;
                    // 查询
                    var data = listView.model.get(listView.currentIndex);
                    console.log(data.name + ", " + data.cost + ", " + data.manufacturer)
                }
//                onDoubleClicked: {
//                    // 删除
//                    wrapper.ListView.view.model.remove(index);
//                }
//                onHoveredChanged: {
//                    // 修改
//                    listView.model.setProperty(0, "cost", "9999");
//                    listView.model.set(1, {"name": "OPPO ACE 2", "cost": 1200, "manufacturer": "OPPO"})
//                }
//                onEntered: {
//                    // 增加
//                    // 尾部
//                    listView.model.append({"name": "MX 5", "cost": 1200, "manufacturer": "MeiZu"})
//                    // 任意位置
//                    listView.model.insert(0, {"name": "MX 6", "cost": 8888, "manufacturer": "MeiZu"})
//                }
            }

            RowLayout {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 8;

                Text {
                    text: name;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.preferredWidth: 120;
                }

                Text {
                    text: cost;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.preferredWidth: 80;
                }

                Text {
                    text: manufacturer;
                    color: wrapper.ListView.isCurrentItem ? "red" : "black";
                    font.pixelSize: wrapper.ListView.isCurrentItem ? 22 : 18;
                    Layout.fillWidth: true;
                }
            }
        }
    }

    Component {
        id: sectionHeader;
        Rectangle {
            width: parent.width;
            height: childrenRect.height;
            color: "lightsteelblue";
            Text {
                id: section;
                font { bold: true; pixelSize: 20; }
            }
        }
    }

    ListView {
        id: listView;
        anchors.fill: parent;
        model: phoneModel.createObject(listView);
        header: headView;
        delegate: phoneDelegate;
        focus: true;
        highlight: Rectangle {
            color: "lightblue";
        }

        // 分组
        section.property: "manufacturer";
        section.criteria: ViewSection.FullString;
        section.delegate: sectionHeader;
    }
}
