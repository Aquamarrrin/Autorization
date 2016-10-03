import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

AccountAdminInfoForm {

    buttonLogout.onClicked: {
        stackLayout.currentIndex = 0
        tabBar.visible = true
        tabBar.currentIndex = 0
    }

    buttonChange.onClicked: {
        stackLayout.currentIndex = 3
        tabBar.visible = false
    }

    buttonShowUsers.onClicked: {
        stackLayout.currentIndex = 5
        showUsers.table.model.clear()
        var i = 0;
        for (; i < DB.getAccountsCount(); i++){
            console.log(DB.getSpec(i))
            showUsers.table.model.append({ username: DB.getLogin(i), spec: DB.getSpec(i), ban:  DB.getBan(i)});
        }
    }
}
