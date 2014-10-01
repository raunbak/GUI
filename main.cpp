#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QtQml/QQmlEngine>
#include <qqml.h>
#include "parameters.h"
#include "datasaveloader.h"

#include "fileopendialog.h"
#include "filesavedialog.h"

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    qmlRegisterType<Parameters>("CustomLib", 1, 0, "Parameters");
    qmlRegisterType<DataSaveLoader>("CustomLib", 1, 0, "DataSaveLoader");

    qmlRegisterType<FileSaveDialog>("MyModules", 1, 0, "FileSaveDialog");
    qmlRegisterType<FileOpenDialog>("MyModules", 1, 0, "FileOpenDialog");


    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
