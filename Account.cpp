#include "Account.h"

static int const kSaltMaxLength = 8;

Account::Account():
    m_Login("TEST"), m_Password("TEST"), m_Email("TEST"), m_Salt("afQr1z9B"), m_Ban(false), m_Spec(false)
{
    m_PasswordHash = encryptPassword(m_Password);
}

Account::Account(QString aLogin, QString aPassword, QString aEmail):
    m_Login(aLogin), m_Password(aPassword), m_Email(aEmail), m_Salt("afQr1z9B"), m_Ban(false), m_Spec(false)
{
    m_PasswordHash = encryptPassword(m_Password);
}

QString Account::getLogin() const
{
    return m_Login;
}

void Account::setLogin(const QString &Login)
{
    m_Login = Login;
}

QByteArray Account::getPassword() const
{
    return m_PasswordHash;
}

void Account::setPassword(const QString &Password)
{
    m_Password = Password;
    m_PasswordHash = encryptPassword(m_Password);
}

void Account::setEmail(const QString &Email)
{
    m_Email = Email;
}

QString Account::getEmail() const
{
    return m_Email;
}

QString Account::getSalt() const
{
    return m_Salt;
}

void Account::setSalt(const QString &Salt)
{
    m_Salt = Salt.left(kSaltMaxLength);
}

bool Account::comparePasswords(QString aComparablePassword)
{
    return m_PasswordHash == encryptPassword(aComparablePassword);
}

bool Account::getSpec() const
{
    return m_Spec;
}

void Account::setSpec(bool Spec)
{
    m_Spec = Spec;
}

bool Account::getBan() const
{
    return m_Ban;
}

void Account::setBan(bool Ban)
{
    m_Ban = Ban;
}

QDataStream& operator<<( QDataStream& aDataStream, const Account& aAccount ) {
    aDataStream << aAccount.getLogin() << aAccount.getPassword() << aAccount.getEmail() << aAccount.getSpec() << aAccount.getBan();
    return aDataStream;
}

QDataStream& operator>>( QDataStream& aDataStream, Account& aAccount ) {
    aDataStream >> aAccount.m_Login >> aAccount.m_PasswordHash >> aAccount.m_Email >> aAccount.m_Spec >> aAccount.m_Ban;
    return aDataStream;
}

QByteArray Account::encryptPassword(QString aPassword)
{
    QByteArray ba(aPassword.toUtf8());
    QByteArray salt(m_Salt.toUtf8());
    return QCryptographicHash::hash(ba + salt, QCryptographicHash::Md5);
}
