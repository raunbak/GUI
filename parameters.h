#ifndef PARAMETERS_H
#define PARAMETERS_H

#include <QObject>
#include <Qprocess>
#include <math.h>
class Parameters : public QObject
{
    Q_OBJECT

public:
    explicit Parameters(QObject *parent = 0);
     //Q_INVOKABLE QString launch(const QString &program);
    Q_INVOKABLE void launch(const QString &program);
    Q_INVOKABLE QString dt(const QString &RF, const QString &StepsPrPeriode);
    Q_INVOKABLE QString omegaR(const QString &RF,  const QString &eta, const QString &r0,
                               const QString &UEC, const QString &Urf,
                               const QString &mass,const QString &charge,
                               const QString &z0);

    Q_INVOKABLE QString omegaZ(const QString &RF,    const QString &eta,
                               const QString &UEC,   const QString &mass,
                               const QString &charge,const QString &z0);

private:
    QProcess *m_process;

};

#endif // PARAMETERS_H
