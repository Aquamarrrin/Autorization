import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property int margin: 20
    width: gridLayout1.implicitWidth + 5 * margin
    height: gridLayout1.implicitHeight + 5 * margin
    property alias passwordErrors: passwordErrors
    property alias oldPassword: oldPassword
    property alias newPassword: newPassword
    property alias repeatNewPassword: repeatNewPassword
    property alias buttonConfirm: buttonConfirm

    GridLayout {
        id: gridLayout1
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center
        rows: 5
        columns: 2

        Label {
            id: labelOldPassword
            text: qsTr("Cтарый пароль")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        TextField {
            id: oldPassword
            color: "#000000"
            placeholderText: qsTr("Старый пароль")
            Layout.fillWidth: true
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Label {
            id: labelNewPassword
            text: qsTr("Новый пароль")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        TextField {
            id: newPassword
            color: "#000000"
            placeholderText: qsTr("Новый пароль")
            Layout.fillWidth: true
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Label {
            id: labelRepeatNewPassword
            text: qsTr("Повторите пароль")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        TextField {
            id: repeatNewPassword
            color: "#000000"
            placeholderText: qsTr("Новый пароль")
            Layout.fillWidth: true
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Button {
            id: buttonConfirm
            text: qsTr("Подтвердить")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.maximumHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
        }
        Text {
            id: passwordErrors
            color: "#ff0000"
            text: qsTr("Text")
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            Layout.fillHeight: false
            Layout.maximumHeight: 150
            Layout.maximumWidth: 200
            Layout.fillWidth: true
            visible: false
            Layout.preferredHeight: 50
            Layout.preferredWidth: 100
            wrapMode: Text.WordWrap
            textFormat: Text.AutoText
            font.pixelSize: 12
        }
    }
}
