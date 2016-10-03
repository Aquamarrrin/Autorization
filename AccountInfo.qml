import QtQuick 2.7
import QtQuick.Layouts 1.3

AccountInfoForm {

    buttonLogout.onClicked: {
        stackLayout.currentIndex = 0
        tabBar.visible = true
        tabBar.currentIndex = 0
    }

    buttonChange.onClicked: {
        stackLayout.currentIndex = 3
        tabBar.visible = false
    }
}
