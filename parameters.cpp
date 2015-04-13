#include "parameters.h"

Parameters::Parameters(QObject *parent) :
    QObject(parent),
    m_process(new QProcess(this))
{
}

void Parameters::launch(const QString &program)
{
    m_process->startDetached(program);
    //start(program)
}

QString Parameters::dt(const QString &RF, const QString &StepsPrPeriode)
{
    QString string;

     //double dt = 1/(RF.toDouble()/2/3.1415926535897932384626)/StepsPrPeriode.toDouble();

    double dt = (2*3.1415926535897932384626)/((RF.toDouble()*1e6)*StepsPrPeriode.toDouble());
    return string.number(dt);
}

QString Parameters::omegaR(const QString &RF,  const QString &eta, const QString &r0,
                           const QString &UEC, const QString &Urf,
                           const QString &mass,const QString &charge,
                           const QString &z0)
{
    QString string;
    double e = 1.602176487e-19;
    double u2kg = 1.66053878283e-27; // unit to kg

    double a = -4* (eta.toDouble()*(charge.toDouble()*e)*UEC.toDouble())/((mass.toDouble()*u2kg)*pow(RF.toDouble(),2)*pow(z0.toDouble(),2));
    double q = 2* ((charge.toDouble()*e)*Urf.toDouble())/((mass.toDouble()*u2kg)*pow(RF.toDouble(),2)*pow(r0.toDouble(),2));
    double wr = 0.5 * RF.toDouble()*sqrt(pow(q,2)/2 + a);

    return string.number(wr/1e6);

}

QString Parameters::omegaZ(const QString &RF,    const QString &eta,
                           const QString &UEC,   const QString &mass,
                           const QString &charge,const QString &z0)
{
    QString string;
    double e = 1.602176487e-19;
    double u2kg = 1.66053878283e-27; // unit to kg

    /*
    double dRF       = RF.toDouble();
    double deta      = eta.toDouble();
    double dUEC      = UEC.toDouble();
    double dmass     = mass.toDouble();
    double dcharge   = charge.toDouble();
    double dz0       = z0.toDouble();

    //double a = -4 * ((eta.toDouble()*(charge.toDouble()*1.602176487e-19)*3.1)/((40*1.66053878283e-27)*pow(25195573.0818,2) * pow(0.0025,2)));
    //double a = -4 * ((0.342*(1*1.602176487e-19)*3.1)/((40*1.66053878283e-27)*pow(25195573.0818,2) * pow(0.0025,2)));
    //
    //-4* ( (eta.toDouble()*(charge.toDouble()*e)*UEC.toDouble())/((mass.toDouble()*u2kg)*pow(RF.toDouble(),2)*pow(z0.toDouble(),2)) );

    */
    double a = -4 * (eta.toDouble()*(charge.toDouble()*e)*UEC.toDouble()) / ((mass.toDouble()*u2kg)*pow(RF.toDouble(),2)*pow(z0.toDouble(),2));
    double wz = RF.toDouble()*sqrt(-a/2);

    return string.number(wz/1e6);

}
