import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    property int margin: 20
    width: showUsersLayout.implicitWidth + 5 * margin
    height: showUsersLayout.implicitHeight + 5 * margin
    property alias addUser: addUser
    property alias showUsersLayout: showUsersLayout
    property alias table: table

    GridLayout {
        id: showUsersLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center
        rows: 3
        columns: 1

        TableView {
            id: table
            Layout.fillWidth: true
            Layout.fillHeight: true
            selectionMode: SelectionMode.SingleSelection

            TableViewColumn {
                role: "username"
                title: "Имя пользователя"
                width: table.width/2
            }
            TableViewColumn {
                id: specColumn
                role: "spec"
                title: "Ограничение на пароль"
                width: table.width/4
                delegate: CheckBox {
                    id: checkBoxSpec
                    checked: styleData.value
                    onClicked: {
                        DB.setSpec(table.model.get(styleData.row).username, checkBoxSpec.checked)
                    }
                }
            }
            TableViewColumn {
                role: "ban"
                title: "Ограничить доступ пользователю"
                width: table.width/4
                delegate: CheckBox {
                    id: checkBoxBan
                    checked: styleData.value
                    onClicked: {
                        DB.setBan(table.model.get(styleData.row).username, checkBoxBan.checked)
                    }
                }
            }
            model: ListModel {
                id: model
            }

            itemDelegate: Item {
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    color: styleData.textColor
                    elide: styleData.elideMode
                    text: styleData.value
                    font.pointSize: 12
                }
            }

            rowDelegate: Rectangle {
                height: 20
                SystemPalette {
                    id: myPalette;
                    colorGroup: SystemPalette.Active
                }
                color: {
                    var baseColor = styleData.alternate?myPalette.alternateBase:myPalette.base
                    return styleData.selected?myPalette.highlight:baseColor
                }
            }

        }
        TextField {
            id: userName
            placeholderText: qsTr("Имя пользователя")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            font.pointSize: 12
        }

        Button {
            id: addUser
            text: qsTr("Добавить пользователя")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onClicked: {
                var newname = userName.text
                var ban = false
                if(!DB.isAlreadyExist(newname)){
                    table.model.append({username: newname, spec: ban , ban: ban})
                    DB.addAccountToBase(newname, "", "")
                }
                else{
                    popupText.text = "Имя уже существует!"
                    popup.open()
                }
            }
        }
        Button {
            id: goBack
            text: qsTr("Выйти")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onClicked: {
                stackLayout.currentIndex = 4
                accountAdminInfo.login.text = DB.getCurrentLogin()
                accountAdminInfo.email.text = DB.getCurrentEmail()
            }
        }


    }
}
