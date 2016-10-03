#include "DataBase.h"

#include <openssl/aes.h>

static QString const kBaseFileName = "database.bin";

DataBase::DataBase(QObject *parent) :
    QObject(parent), m_CurrentLogin(""), m_QByteArrKey("paragon")
{
    m_QuintKey = *(reinterpret_cast< const quint64* >(m_QByteArrKey.toHex().data()));
    m_BaseFile.setFileName(kBaseFileName);
}

DataBase::~DataBase()
{
}

bool DataBase::LoadBase(QByteArray aKey)
{
    bool result = false;
    QDataStream data_stream(&m_BaseFile);

    result = m_BaseFile.open(QIODevice::ReadOnly);
    data_stream >> m_Accounts;
    m_BaseFile.close();

    QMap<QString, Account> new_accounts;

    for ( auto account : m_Accounts )
    {
        qDebug()<<"LOAD!";

        Account new_account("", "", "");
        new_account.setLogin(decrypt(account.getLogin(), aKey));
        new_account.setPassword(decrypt(account.getPassword(), aKey));
        new_account.setEmail(decrypt(account.getEmail(), aKey));
        new_account.setSpec(decrypt(QString::number(account.getSpec()), aKey).toInt());
        new_account.setBan(decrypt(QString::number(account.getBan()), aKey).toInt());

        new_accounts[new_account.getLogin()] = new_account;
        qDebug()<<new_account.getLogin() << account.getLogin();
        qDebug()<<new_account.getSpec() << account.getSpec();
    }
    m_Accounts.swap(new_accounts);
    if (m_Accounts.count("ADMIN"))
    {
        qDebug()<< "ADMIN есть";
        return true;
    }
    else if(m_Accounts.size() == 0)
    {
        if(!m_Accounts.contains("ADMIN"))
            addAccountToBase("ADMIN", "admin", "");
        return true;
    }

    return false;
}

bool DataBase::SaveBase()
{
    bool result = false;
    QDataStream data_stream(&m_BaseFile);

    result = m_BaseFile.open(QIODevice::WriteOnly);

    QMap<QString, Account> new_accounts;

    for ( auto account : m_Accounts )
    {
        qDebug()<<"SAVE!";

        Account new_account("", "", "");
        new_account.setLogin(encrypt(account.getLogin()));
        new_account.setPassword(encrypt(account.getPassword()));
        new_account.setEmail(encrypt(account.getEmail()));
        new_account.setSpec(encrypt(QString::number(account.getSpec())).toInt());
        new_account.setBan(encrypt(QString::number(account.getBan())).toInt());

        new_accounts[new_account.getLogin()] = new_account;
    }
    data_stream << new_accounts;
    m_BaseFile.close();

    return result;
}

QString DataBase::encrypt(const QString aPlainText)
{
    SimpleCrypt sc(m_QuintKey);
    sc.setIntegrityProtectionMode(SimpleCrypt::ProtectionHash);
    QString cipherText = sc.encryptToString(aPlainText);
    return cipherText;
}

QString DataBase::decrypt(const QString aCipherText, QByteArray aKey)
{
    quint64 key = *(reinterpret_cast< const quint64* >(aKey.toHex().data()));
    SimpleCrypt sc(key);
    sc.setIntegrityProtectionMode(SimpleCrypt::ProtectionHash);
    QString plainText = sc.decryptToString(aCipherText);
    return plainText;
}

// SLOTS:

bool DataBase::tryToOpenBase(QVariant aBasePassword)
{
    bool result = LoadBase(aBasePassword.toByteArray());

    return result;
}

bool DataBase::addAccountToBase(QVariant aLogin, QVariant aPassword, QVariant aEmail)
{
    Account account(aLogin.toString(), aPassword.toString(), aEmail.toString());
    m_Accounts[aLogin.toString()] = account;
    SaveBase();
    return true;
}

bool DataBase::isAlreadyExist(QVariant aLogin)
{
    return m_Accounts.count(aLogin.toString());
}

bool DataBase::tryToLogIn(QVariant aLogin, QVariant aPassword)
{
    if(m_Accounts.count(aLogin.toString())
            && m_Accounts[aLogin.toString()].comparePasswords(aPassword.toString()))
    {
        m_CurrentLogin = aLogin.toString();
        return true;
    }
    return false;
}

bool DataBase::oldPassworIsCorrect(QVariant aOldPassword)
{
    return m_Accounts[m_CurrentLogin].comparePasswords(aOldPassword.toString());
}

void DataBase::changePassword(QVariant aNewPassword)
{
    m_Accounts[m_CurrentLogin].setPassword(aNewPassword.toString());
    SaveBase();
}

void DataBase::setBan(QVariant aLogin, QVariant ban)
{
    m_Accounts[aLogin.toString()].setBan(ban.toBool());
    SaveBase();
}

void DataBase::setSpec(QVariant aLogin, QVariant spec)
{
    m_Accounts[aLogin.toString()].setSpec(spec.toBool());
    SaveBase();
}

QVariant DataBase::getCurrentLogin()
{
    return QVariant(m_CurrentLogin);
}

QVariant DataBase::getCurrentEmail()
{
    return QVariant(m_Accounts[m_CurrentLogin].getEmail());
}

int DataBase::getAccountsCount()
{
    return m_Accounts.size();
}

QVariant DataBase::getLogin(int aId)
{
    int id = 0;
    for(auto account : m_Accounts)
    {
        if(id == aId)
            return QVariant(account.getLogin());
        id++;
    }
    return QVariant();

}

QVariant DataBase::getBan(int aId)
{
    int id = 0;
    for(auto account : m_Accounts)
    {
        if(id == aId)
            return (account.getBan());
        id++;
    }
    return false;

}
QVariant DataBase::getSpec(int aId)
{
    int id = 0;
    for(auto account : m_Accounts)
    {
        if(id == aId)
            return (account.getSpec());
        id++;
    }
    return false;

}

QVariant DataBase::getBan(QVariant aLogin)
{
    return m_Accounts[aLogin.toString()].getBan();

}
QVariant DataBase::getSpec()
{
    return m_Accounts[m_CurrentLogin].getSpec();;

}
