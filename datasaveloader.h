#ifndef DATASAVELOADER_H
#define DATASAVELOADER_H


#include <QObject>
#include <QFile>
#include <QTextStream>
#include <sstream>
#include <string>
#include<iostream>
#include<fstream>

class DataSaveLoader  : public QObject
{
    Q_OBJECT
public:
    explicit DataSaveLoader(QObject *parent = 0);
    Q_INVOKABLE bool saveData(const QString &data, const QString &fileName);
    Q_INVOKABLE bool loadData(const QString &data);
    Q_INVOKABLE QString dataLength();
    Q_INVOKABLE QString rFvoltage();
    Q_INVOKABLE QString eCvoltage();
    Q_INVOKABLE QString t();
    Q_INVOKABLE QString t0();
    Q_INVOKABLE QString ionOneCount();
    Q_INVOKABLE QString ionOneMass();
    Q_INVOKABLE QString timeSteps();
    Q_INVOKABLE QString startHist();
    Q_INVOKABLE QString rFperiode();
    Q_INVOKABLE QString histX();
    Q_INVOKABLE QString histY();
    Q_INVOKABLE QString histZ();
    Q_INVOKABLE QString omegaRF();
    Q_INVOKABLE QString r0();
    Q_INVOKABLE QString z0();
    Q_INVOKABLE QString eta();
    Q_INVOKABLE QString binSize();
    Q_INVOKABLE QString ionOneCharge();
    Q_INVOKABLE QString ionTwoCount();
    Q_INVOKABLE QString ionTwoMass();
    Q_INVOKABLE QString ionTwoCharge();

private:

    QString Loadeddata;
    int datalength;

    QString *data;



    QString RFvoltage;
    QString ECvoltage;
    QString T;
    QString T0;
    QString IonOneCount;
    QString IonOneMass;
    QString TimeSteps;
    QString StartHist;
    QString RFperiode;
    QString HistX;
    QString HistY;
    QString HistZ;
    QString OmegaRF;
    QString R0;
    QString Z0;
    QString Eta;
    QString BinSize;
    QString IonOneCharge;
    QString IonTwoCount;
    QString IonTwoMass;
    QString IonTwoCharge;


};
#endif // DATASAVELOADER_H
