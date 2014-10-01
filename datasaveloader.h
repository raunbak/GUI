#ifndef DATASAVELOADER_H
#define DATASAVELOADER_H


#include <QObject>
#include <QFile>
#include <QTextStream>
#include <iostream>

class DataSaveLoader  : public QObject
{
    Q_OBJECT
public:
    explicit DataSaveLoader(QObject *parent = 0);
    Q_INVOKABLE bool saveData(const QString &data, const QString &fileName);
    Q_INVOKABLE QString loadData(const QString &data);

private:
    QString *data;
};
#endif // DATASAVELOADER_H
