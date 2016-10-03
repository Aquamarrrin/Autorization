import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Layouts 1.3

Item {
    property int margin: 20
    width: onOpenPageLayout.implicitWidth + 5 * margin
    height: onOpenPageLayout.implicitHeight + 5 * margin

    ColumnLayout {
        id: onOpenPageLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.fill: parent
        anchors.margins: margin
        transformOrigin: Item.Center

        TextField {
            id: password
            Layout.preferredHeight: 50
            color: "#000000"
            placeholderText: qsTr("Пароль")
            font.pointSize: 12
            Layout.fillWidth: true
            passwordCharacter: "★"
            echoMode: TextField.Password
        }

        Button {
            id: okButton
            text: qsTr("Подтвердить")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onClicked: {
                if (DB.tryToOpenBase(password.text))
                    stackLayout.currentIndex = 0
                else{
                    Qt.quit()
                }
            }
        }

        Button {
            id: cancelButton
            text: qsTr("Выйти")
            Layout.fillHeight: false
            transformOrigin: Item.Center
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onClicked: {
                Qt.quit()
            }
        }
    }
}
