import QtQuick 2.15
import QtQuick.Controls 2.15;
import QtQuick.Layouts 1.15

Rectangle {
    width: 360;
    height: 300;
    color: "#EEEEEE";

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
                }
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

    ListView {
        id: listView;
        anchors.fill: parent;
        delegate: phoneDelegate;

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
        highlight: Rectangle {
            color: "lightblue";
        }
    }


}
