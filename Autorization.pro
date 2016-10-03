QT += qml quick

CONFIG += c++11

SOURCES += main.cpp \
    DataBase.cpp \
    Account.cpp \
    simplecrypt.cpp

RESOURCES += qml.qrc
INCLUDEPATH += D:/OpenSSL-Win32/include
LIBS += -LD:/OpenSSL-Win32/lib -llibssl -llibcrypto

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    DataBase.h \
    Account.h \
    simplecrypt.h

DISTFILES +=
