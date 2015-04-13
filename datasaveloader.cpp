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

QString DataSaveLoader::dataLength()
{
 return Loadeddata;
}



bool DataSaveLoader::loadData(const QString &fileN)
{

    RFvoltage = ' ';
    ECvoltage = ' ';
    T = ' ';
    T0 = ' ';
    IonOneCount = ' ';

    IonOneMass = ' ';

    TimeSteps= ' ';

    StartHist = ' ';

    RFperiode = ' ';

    HistX = ' ';

    HistY = ' ';
    HistZ = ' ';
    OmegaRF = ' ';
    R0 = ' ';
    Z0 = ' ';
    Eta = ' ';
    BinSize= ' ';
    IonOneCharge = ' ';
    IonTwoCount = ' ';
    IonTwoMass = ' ';
    IonTwoCharge = ' ';







    std::string fileName;
    fileName = fileN.toLocal8Bit().constData();

    std::string line;
    std::ifstream myfile(fileName);


    int space_count = 0; // place to hold count
    while(myfile.good()) // while file is open and reads without error or eof
    {
      if(32 == myfile.get()) space_count++; // found space, increment counter
    }


    if (space_count < 20 )
    {

        std::ifstream myfile(fileName);
        if (myfile.is_open())
        {
          getline (myfile,line, ' ');
          RFvoltage = QString::fromStdString(line);
          getline (myfile,line, ' ');
          ECvoltage = QString::fromStdString(line);
           getline (myfile,line, ' ');
          T = QString::fromStdString(line);
           getline (myfile,line, ' ');
          T0 = QString::fromStdString(line);
           getline (myfile,line, ' ');
          IonOneCount = QString::fromStdString(line);
           getline (myfile,line, ' ');
          IonOneMass = QString::fromStdString(line);
           getline (myfile,line, ' ');
          TimeSteps= QString::fromStdString(line);
           getline (myfile,line, ' ');
          StartHist = QString::fromStdString(line);
           getline (myfile,line, ' ');
          RFperiode = QString::fromStdString(line);
           getline (myfile,line, ' ');
          HistX = QString::fromStdString(line);
           getline (myfile,line, ' ');
          HistY = QString::fromStdString(line);
           getline (myfile,line, ' ');
          HistZ = QString::fromStdString(line);
           getline (myfile,line, ' ');
          OmegaRF = QString::fromStdString(line);
           getline (myfile,line, ' ');
          R0 = QString::fromStdString(line);
           getline (myfile,line, ' ');
          Z0 = QString::fromStdString(line);
           getline (myfile,line, ' ');
          Eta = QString::fromStdString(line);
           getline (myfile,line, ' ');
          BinSize= QString::fromStdString(line);
           getline (myfile,line, ' ');
          IonOneCharge = QString::fromStdString(line);


          myfile.close();
        }


    }
    else {

        std::ifstream myfile(fileName);
        if (myfile.is_open())
        {
            getline (myfile,line, ' ');

            RFvoltage = QString::fromStdString(line);
            getline (myfile,line, ' ');
            ECvoltage = QString::fromStdString(line);
            getline (myfile,line, ' ');
            T = QString::fromStdString(line);
            getline (myfile,line, ' ');
            T0 = QString::fromStdString(line);
            getline (myfile,line, ' ');
            IonOneCount = QString::fromStdString(line);
            getline (myfile,line, ' ');
            IonOneMass = QString::fromStdString(line);
            getline (myfile,line, ' ');
            IonTwoCount = QString::fromStdString(line);
            getline (myfile,line, ' ');
            IonTwoMass = QString::fromStdString(line);
            getline (myfile,line, ' ');
            TimeSteps = QString::fromStdString(line);
            getline (myfile,line, ' ');
            StartHist = QString::fromStdString(line);
            getline (myfile,line, ' ');
              RFperiode = QString::fromStdString(line);
              getline (myfile,line, ' ');
              HistX = QString::fromStdString(line);
              getline (myfile,line, ' ');
              HistY = QString::fromStdString(line);
              getline (myfile,line, ' ');
              HistZ = QString::fromStdString(line);
              getline (myfile,line, ' ');
              OmegaRF = QString::fromStdString(line);
              getline (myfile,line, ' ');
              R0 = QString::fromStdString(line);
              getline (myfile,line, ' ');
              Z0 = QString::fromStdString(line);
              getline (myfile,line, ' ');
              Eta = QString::fromStdString(line);
              getline (myfile,line, ' ');
              BinSize = QString::fromStdString(line);
              getline (myfile,line, ' ');
              IonOneCharge = QString::fromStdString(line);
              getline (myfile,line, ' ');
              IonTwoCharge = QString::fromStdString(line);

           myfile.close();
        }


    }
    /*
    Loadeddata = QString::fromStdString(line)

       if (myfile.is_open())
       {
         getline (myfile,line, ' ');
         Loadeddata = QString::fromStdString(line);

         //while ( getline (myfile,line, ' ') )
         //{
         //
         //        }
         myfile.close();
       }

       else return false;
  */

    return true;
}


QString DataSaveLoader::rFvoltage()
{
 return RFvoltage;
}

QString DataSaveLoader::eCvoltage()
{
 return ECvoltage;
}
QString DataSaveLoader::t()
{
 return T;
}
QString DataSaveLoader::t0()
{
 return T0;
}
QString DataSaveLoader::ionOneCount()
{
 return IonOneCount;
}
QString DataSaveLoader::ionOneMass()
{
 return IonOneMass;
}
QString DataSaveLoader::timeSteps()
{
 return TimeSteps;
}
QString DataSaveLoader::startHist()
{
 return StartHist;
}
QString DataSaveLoader::rFperiode()
{
 return RFperiode;
}

QString DataSaveLoader::histX()
{
 return HistX;
}
QString DataSaveLoader::histY()
{
 return HistY;
}
QString DataSaveLoader::histZ()
{
 return HistZ;
}
QString DataSaveLoader::omegaRF()
{
 return OmegaRF;
}
QString DataSaveLoader::r0()
{
 return R0;
}
QString DataSaveLoader::z0()
{
 return Z0;
}
QString DataSaveLoader::eta()
{
 return Eta;
}

QString DataSaveLoader::binSize()
{
 return BinSize;
}
QString DataSaveLoader::ionOneCharge()
{
 return IonOneCharge;
}
QString DataSaveLoader::ionTwoCharge()
{
 return IonTwoCharge;
}
QString DataSaveLoader::ionTwoCount()
{
 return IonTwoCount;
}
QString DataSaveLoader::ionTwoMass()
{
 return IonTwoMass;
}
