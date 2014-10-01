#include "datasaveloader.h"

DataSaveLoader::DataSaveLoader(QObject *parent) :
    QObject(parent)
{

}

bool DataSaveLoader::saveData(const QString &data, const QString &fileName)
{

    if (fileName.isEmpty()) {
        return false;
    }

    QFile file(fileName);

    if (!file.open(QFile::WriteOnly | QFile::Truncate)) {
        return false;
    }

    QTextStream out(&file);
    out << data;
    file.close();
    return true;




    /*
    // Simple string save
        if (fileName.isEmpty()) {
            return false;
        }

        QFile file(fileName);

        if (!file.open(QFile::WriteOnly | QFile::Truncate)) {
            return false;
        }

        QTextStream out(&file);
        out << data;
        file.close();
        return true;
     */

}

QString DataSaveLoader::loadData(const QString &fileName)
{
    QFile file(fileName);
    file.


    QString s;
    return s;
}
