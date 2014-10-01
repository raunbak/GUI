//qmlfile.h
#ifndef QMLFILE_H
#define QMLFILE_H
#include <qobject>
class QMLFile : public QObject
{
    Q_OBJECT
public:
    explicit QMLFile(QObject *parent = 0);
    Q_INVOKABLE QString getFileContents();
    Q_INVOKABLE void saveFileContents(const QString fileContents);
};
#endif // QFILE_H
