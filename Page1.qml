import QtQuick 2.7

Page1Form {
    login.onTextChanged: {
        console.log(qsTr("Попытка ввода имени пользователя..."))
    }

    button1.onClicked: {
        console.log(qsTr("Попытка входа..."))
        if(login.text == "ADMIN" && DB.tryToLogIn(login.text, password.text))
        {
            stackLayout.currentIndex = 4
            accountAdminInfo.login.text = DB.getCurrentLogin()
            accountAdminInfo.email.text = DB.getCurrentEmail()
            popup.open()
            mainWinow.height = 300
        }
        else if(login.text.length  > 0
                && DB.tryToLogIn(login.text, password.text))
        {
            if(!DB.getBan(login.text))
            {
                console.log(qsTr("Успешный вход!"))
                stackLayout.currentIndex = 2
                accountInfo.login.text = DB.getCurrentLogin()
                accountInfo.email.text = DB.getCurrentEmail()
                popupText.text = "Успешно!"
                popup.open()
            }
            else
            {
                console.log(qsTr("Вход не разрешён!"))
                popupText.text = "Вход не разрешён!"
                popup.open()
            }
        }
        else
        {
            console.log(qsTr("Пара логин - пароль не совпадает!"))
            popupText.text = "Пара логин - пароль не совпадает!"
            popup.open()
        }
    }
}
