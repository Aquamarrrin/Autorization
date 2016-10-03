import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0

Item {
    id: item1
    property alias button1: button1
    property alias login: login
    property int margin: 20
    width: mainLayout.implicitWidth + 5 * margin
    height: mainLayout.implicitHeight + 5 * margin
    property alias registrErrors: registrErrors
    property alias repeatPassword: repeatPassword
    property alias emailErrors: emailErrors
    property alias repetPasswordErrors: repetPasswordErrors
    property alias loginErrors: loginErrors
    property alias email: email
    property alias passwordErrors: passwordErrors
    property alias password: password

    GridLayout {
        id: mainLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center
        rows: 6
        columns: 3

        Label {
            id: labelLogin
            text: qsTr("Логин")
            Layout.row: 0
            Layout.column: 0
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
            Layout.row: 0
            Layout.column: 1
        }

        Text {
            id: loginErrors
            color: "#ff0000"
            text: qsTr("Text")
            Layout.maximumHeight: 100
            Layout.maximumWidth: 100
            visible: false
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            wrapMode: Text.WordWrap
            style: Text.Normal
            textFormat: Text.RichText
            font.pixelSize: 12
        }

        Label {
            id: labelPassword
            text: qsTr("Пароль")
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            Layout.maximumHeight: 30
            Layout.maximumWidth: 100
            textFormat: Text.PlainText
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 0
            font.pointSize: 14
        }

        TextField {
            id: password
            color: "#000000"
            placeholderText: qsTr("Пароль")
            Layout.fillWidth: true
            Layout.row: 1
            Layout.column: 1
            passwordCharacter: "★"
            echoMode: TextField.Password
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

        Label {
            id: labelRepeatPassword
            text: qsTr("Повтор пароля")
            Layout.preferredHeight: 100
            Layout.preferredWidth: 125
            Layout.maximumHeight: 30
            Layout.maximumWidth: 200
            Layout.row: 2
            Layout.column: 0
            textFormat: Text.PlainText
            Layout.fillWidth: true
            font.pointSize: 14
        }

        TextField {
            id: repeatPassword
            color: "#000000"
            placeholderText: qsTr("Пароль")
            Layout.fillWidth: true
            Layout.row: 2
            Layout.column: 1
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Text {
            id: repetPasswordErrors
            color: "#ff0000"
            text: qsTr("Text")
            Layout.maximumHeight: 100
            Layout.maximumWidth: 100
            Layout.fillWidth: true
            visible: false
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            font.pixelSize: 12
        }

        Label {
            id: labelEmail
            text: qsTr("Email")
            Layout.preferredHeight: 100
            Layout.preferredWidth: 100
            Layout.maximumHeight: 30
            Layout.maximumWidth: 100
            Layout.row: 3
            Layout.column: 0
            textFormat: Text.PlainText
            Layout.fillWidth: true
            font.pointSize: 14
        }

        TextField {
            id: email
            color: "#000000"
            placeholderText: qsTr("email@mail.com")
            Layout.fillWidth: true
            Layout.row: 3
            Layout.column: 1
        }

        Text {
            id: emailErrors
            color: "#ff0000"
            text: qsTr("Text")
            Layout.maximumHeight: 100
            Layout.maximumWidth: 100
            Layout.fillWidth: true
            visible: false
            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            font.pixelSize: 12
        }

        Button {
            id: button1
            text: qsTr("Зарегистрироваться")
            Layout.fillHeight: false
            Layout.row: 4
            Layout.columnSpan:  2
            transformOrigin: Item.Center
            Layout.maximumHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Text {
            id: registrErrors
            color: "#ff0000"
            text: qsTr("Text")
            Layout.alignment:  Qt.AlignHCenter | Qt.AlignVCenter
            Layout.fillHeight: false
            Layout.maximumHeight: 150
            Layout.maximumWidth: 200
            Layout.fillWidth: true
            Layout.row: 5
            Layout.columnSpan:  2
            Layout.preferredHeight: 50
            Layout.preferredWidth: 100
            visible: false
            wrapMode: Text.WordWrap
            textFormat: Text.AutoText
            font.pixelSize: 12
        }
    }
}
