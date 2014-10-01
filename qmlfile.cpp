//qmlfile.cpp
#include "qmlfile.h"
#include <qfiledialog>
#include <qtextstream>
#include <qdebug>

QMLFile::QMLFile(QObject *parent): QObject(parent){}
QString QMLFile::getFileContents()
{
    QString fileName = QFileDialog::getOpenFileName(NULL, tr("Open File"), "/home", tr("Text Files (*.txt)"));

    qDebug() << "fileName:" << fileName;
    QFile file(fileName);
    if(!file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
            return "";
    }
    QString content = file.readAll();
    file.close();
    return content;
}
void QMLFile::saveFileContents(const QString fileContents)
{
    QString fileName = QFileDialog::getSaveFileName(NULL, tr("Save File"), "/home", tr("Text Files (*.txt)"));
    QFile file(fileName);
    if(file.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        qDebug() << "created file:" << fileName;
        QTextStream stream(&file);
        stream << fileContents << endl;
        file.close();
        return;
    }
    else
    {
        qDebug() << "could not create file:" << fileName;
        return;
    }
}
