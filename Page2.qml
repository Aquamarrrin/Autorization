import QtQuick 2.4

Page2Form {
    repeatPassword.onTextChanged: {
        if(repeatPassword.text != password.text)
        {
            repetPasswordErrors.text = "Пароли не совпадают!"
            repetPasswordErrors.visible = true
        }
        else
        {
            repetPasswordErrors.visible = false
        }
    }

    password.onTextChanged: {
        if(password.text.length < 8 || password.text.length > 30)
        {
            passwordErrors.text = "Размер пароля должен лежать в диапозоне от 8 до 30 символов"
            passwordErrors.visible = true
        }
        else
        {
            passwordErrors.visible = false
        }
        if(!(password.text.match(new RegExp("([a-z]+)"))
             && password.text.match(new RegExp("([A-Z]+)"))
             && password.text.match(new RegExp("([0-9]+)"))
             && password.text.match(new RegExp("&+"))
             && password.text.match(new RegExp("#+"))))
        {
            passwordErrors.text = "Пароль должен содержать:
1) Большие буквы
2) Маленькие буквы
3) Цифры
4) Спец символы"
            passwordErrors.visible = true
        }
    }

    login.onTextChanged: {
        if(DB.isAlreadyExist(login.text))
        {
            loginErrors.text = "Имя занято!"
            loginErrors.visible = true
        }
        else
        {
            loginErrors.visible = false
        }
    }

    email.onTextChanged: {
        if(!(email.text.match(new RegExp("^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$"))))
        {
            emailErrors.text = "Неверный формат почты"
            emailErrors.visible = true
        }
        else
        {
            emailErrors.visible = false
        }
    }
}
