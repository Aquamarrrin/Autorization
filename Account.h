#ifndef ACCOUNT_H
#define ACCOUNT_H

#include <QDataStream>
#include <QString>
#include <QCryptographicHash>
#include <QDebug>

class Account
{
public:
    Account();
    Account(QString aLogin, QString aPassword, QString aEmail);

    friend QDataStream& operator>>( QDataStream& aDataStream, Account& aAccount );
    friend QDataStream& operator<<( QDataStream& aDataStream, const Account& aAccount );

    QString getLogin() const;
    void setLogin(const QString &Login);

    QString getPassword() const;
    void setPassword(const QString &Password);

    QString getEmail() const;
    void setEmail(const QString &Email);

    QString getSalt() const;
    void setSalt(const QString &Salt);

    bool comparePasswords(QString aComparablePassword);

    bool getSpec() const;
    void setSpec(bool Spec);

    bool getBan() const;
    void setBan(bool Ban);

private:
    QString m_Login;
    QString m_Password;
    QString m_Email;
    bool m_Spec;
    bool m_Ban;
    QString m_Salt;
    QByteArray m_PasswordHash;

    QByteArray encryptPassword(QString aPassword);
};

#endif // ACCOUNT_H
