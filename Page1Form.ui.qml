import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    id: item1
    property alias button1: button1
    property alias login: login
    property int margin: 20
    width: mainLayout.implicitWidth + 5 * margin
    height: mainLayout.implicitHeight + 5 * margin
    property alias password: password

    GridLayout {
        id: mainLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center
        rows: 0
        columns: 2

        Label {
            id: labelLogin
            width: 52
            text: qsTr("Логин")
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            Layout.maximumHeight: 30
            Layout.maximumWidth: 100
            textFormat: Text.PlainText
            Layout.fillWidth: true
            font.pointSize: 14
        }

        TextField {
            id: login
            color: "#000000"
            placeholderText: qsTr("Имя пользователя")
            Layout.fillWidth: true
            font.pointSize: 12
        }

        Label {
            id: labelPassword
            width: 52
            text: qsTr("Пароль")
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            Layout.maximumHeight: 30
            Layout.maximumWidth: 100
            textFormat: Text.PlainText
            Layout.fillWidth: true
            font.pointSize: 14
        }

        TextField {
            id: password
            color: "#000000"
            placeholderText: qsTr("Пароль")
            font.pointSize: 12
            Layout.fillWidth: true
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Button {
            id: button1
            text: qsTr("Войти")
            Layout.fillHeight: false
            Layout.rowSpan: 2
            transformOrigin: Item.Center
            Layout.maximumHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
        }
    }
}
