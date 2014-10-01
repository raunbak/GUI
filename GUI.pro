TEMPLATE = app

QT += qml quick widgets core-private gui-private

SOURCES += main.cpp \
    parameters.cpp \
    datasaveloader.cpp \
    fileopendialog.cpp \
    filesavedialog.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    parameters.h \
    datasaveloader.h \
    fileopendialog.h \
    filesavedialog.h
