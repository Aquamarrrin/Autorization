import QtQuick 2.7

ChangeDataForm {
    buttonConfirm.onClicked: {
        console.log(qsTr("Попытка смены пароля..."))
        console.log(DB.getSpec())
        if(DB.oldPassworIsCorrect(oldPassword.text))
        {
            if(newPassword.text.length > 0
                    && repeatNewPassword.text.length > 0
                    && newPassword.text == repeatNewPassword.text)
            {
                if(!DB.getSpec())
                {
                    console.log(qsTr("Пароль сменён!"))
                    DB.changePassword(newPassword.text)
                    stackLayout.currentIndex = 2
                    tabBar.visible = false
                    popupText.text = "Пароль сменён!"
                    popup.open()
                }
                else
                {
                    if(!(newPassword.text.match(new RegExp("([a-z]+)"))
                         && newPassword.text.match(new RegExp("([A-Z]+)"))
                         && newPassword.text.match(new RegExp("[-.?,!]+"))))
                    {
                        passwordErrors.text = qsTr("Пароль должен содержать:
        1) Большие буквы
        2) Маленькие буквы
        3) Знаки препинания")
                        passwordErrors.visible = true
                    }
                    else
                    {
                        console.log(qsTr("Пароль сменён!"))
                        DB.changePassword(newPassword.text)
                        stackLayout.currentIndex = 2
                        tabBar.visible = false
                        popupText.text = "Пароль сменён!"
                        popup.open()
                    }
                }
            }
            else
            {
                passwordErrors.text = qsTr("Пароли не совпадают")
                passwordErrors.visible = true
            }
        }
        else
        {
            passwordErrors.text = qsTr("Старый пароль неверен!")
            passwordErrors.visible = true
        }
    }
}
