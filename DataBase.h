#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QString>
#include <QStringBuilder>
#include <QStringList>
#include <QVariant>
#include <QMap>
#include <QFile>
#include <QDataStream>

#include <string>

#include "Account.h"
#include "simplecrypt.h"

class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();

private:
    QMap<QString, Account> m_Accounts;
    QFile m_BaseFile;
    QString m_CurrentLogin;
    QString m_Key;

    bool SaveBase(); // Сохраняем базу
    bool LoadBase(QString aKey); // Сохраняем базу

signals:
public slots:
    bool tryToOpenBase(QVariant aBasePassword);

    bool addAccountToBase(QVariant aLogin, QVariant aPassword, QVariant aEmail); // Слот для добавления ноого аккаунта
    bool isAlreadyExist(QVariant aLogin);
    bool tryToLogIn(QVariant aLogin, QVariant aPassword);
    bool oldPassworIsCorrect(QVariant aOldPassword);

    void changePassword(QVariant aNewPassword);
    void setSpec(QVariant aLogin, QVariant spec);
    void setBan(QVariant aLogin, QVariant ban);

    int getAccountsCount();
    QVariant getLogin(int aId);
    QVariant getBan(int aId);
    QVariant getSpec(int aId);
    QVariant getBan(QVariant aLogin);
    QVariant getSpec();
    QVariant getCurrentLogin();
    QVariant getCurrentEmail();
};

#endif // DATABASE_H
