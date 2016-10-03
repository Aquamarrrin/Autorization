import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    id: mainWinow
    visible: true
    width: 640
    height: 480
    title: qsTr("Регистрация и вход")

    StackLayout {
        id: stackLayout
        anchors.fill: parent
        currentIndex: 6

        Page1 {
        }

        Page2 {
            button1.onClicked: {
                if(login.text.length > 0
                        && password.text.length > 0
                        && repeatPassword.text.length > 0
                        && email.text.length > 0
                        && loginErrors.visible == false
                        && passwordErrors.visible == false
                        && repetPasswordErrors.visible == false
                        && emailErrors.visible == false)
                {
                    DB.addAccountToBase(login.text, password.text, email.text)
                    login.text = ""
                    loginErrors.text = ""
                    loginErrors.visible = false
                    password.text = ""
                    passwordErrors.text = ""
                    passwordErrors.visible = false
                    repeatPassword.text = ""
                    repetPasswordErrors.text = ""
                    repetPasswordErrors.visible = false
                    email.text = ""
                    emailErrors.text = ""
                    emailErrors.visible = false
                    tabBar.currentIndex = 0
                    stackLayout.currentIndex = 0
                    popup.open()
                }
                else
                {
                    registrErrors.text = "Заполните поля верно!"
                    registrErrors.visible = true
                }
            }
        }

        AccountInfo {
            id: accountInfo
        }

        ChangeData {
        }

        AccountAdminInfo {
            id: accountAdminInfo
        }
        ShowUsers {
            id: showUsers
        }

        OnOpenPage {
            id: onOpenPage
        }

    }

    Popup {
        id: popup
        width: 300
        height: 100
        x: mainWinow.width/2 - width/2
        y: mainWinow.height/2 - height
        modal: true
        focus: true
        background: Rectangle {
            color: "#000000"
            radius: 5
            opacity: 0.5
        }

        Text {
            id: popupText
            color: "#ffffff"
            text: qsTr("Успешно!")
            font.pointSize: 14
            wrapMode: Text.WordWrap
            textFormat: Text.AutoText
            Layout.alignment:  Qt.AlignHCenter | Qt.AlignVCenter
            opacity: 1.0
        }
    }
}
