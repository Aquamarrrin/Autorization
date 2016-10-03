import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property int margin: 20
    width: accountInfoLayout.implicitWidth + 5 * margin
    height: accountInfoLayout.implicitHeight + 5 * margin
    property alias email: email
    property alias login: login
    property alias buttonChange: buttonChange
    property alias buttonLogout: buttonLogout

    GridLayout {
        id: accountInfoLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center
        rows: 4
        columns: 2

        Label {
            id: labelLogin
            text: qsTr("Логин: ")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        Label {
            id: login
            text: qsTr("<логин>")
            wrapMode: Text.NoWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        Label {
            id: labelEmail
            text: qsTr("Почта: ")
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        Label {
            id: email
            text: qsTr("<почта>@<сервер>")
            wrapMode: Text.NoWrap
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 14
            Layout.fillWidth: true
            Layout.maximumHeight: 40
            Layout.maximumWidth: 200
            Layout.minimumHeight: 40
            Layout.minimumWidth: 100
            Layout.preferredHeight: 40
            Layout.preferredWidth: 150
        }

        Button {
            id: buttonChange
            text: qsTr("Поменять пароль")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.maximumHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
        }

        Button {
            id: buttonLogout
            text: qsTr("Выйти")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.maximumHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
        }
    }
}
