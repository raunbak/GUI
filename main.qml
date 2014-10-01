import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.0
import CustomLib 1.0
import MyModules 1.0
ApplicationWindow {
    visible: true
    title: "MD-simulator"

    width: 980
    height: 605
    minimumWidth: 730
    minimumHeight: 605


    signal oneIonPushed
    signal twoIonPushed

    onOneIonPushed: myParameters.launch("MD.exe "+textFieldFinal.text)
    onTwoIonPushed: myParameters.launch("MD.exe "+textFieldFinal.text)


    Action {
        id: oneIonStartAction

        enabled: (  textField_RFvoltage.text      !== "" &&
                    textField_ECvoltage.text      !== "" &&
                    textField_T.text              !== "" &&
                    textField_T0.text             !== "" &&
                    textField_IonOneCount.text    !== "" &&
                    textField_IonOneMass.text     !== "" &&
                    textField_TimeSteps.text      !== "" &&
                    textField_StartHist.text      !== "" &&
                    textField_RFperiode.tex       !== "" &&
                    textField_HistX.text          !== "" &&
                    textField_HistY.text          !== "" &&
                    textField_HistZ.text          !== "")


        onTriggered:    textFieldFinal.text = '',
                        textFieldFinal.insert(textFieldFinal.Center,
                                              textField_RFvoltage.text      +" "+
                                              textField_ECvoltage.text      +" "+
                                              textField_T.text              +" "+
                                              textField_T0.text             +" "+
                                              textField_IonOneCount.text    +" "+
                                              textField_IonOneMass.text     +" "+
                                              textField_TimeSteps.text      +" "+
                                              textField_StartHist.text      +" "+
                                              textField_RFperiode.text      +" "+
                                              textField_HistX.text          +" "+
                                              textField_HistY.text          +" "+
                                              textField_HistZ.text          +" "+
                                              textField_OmegaRF.text        +" "+
                                              textField_r0.text             +" "+
                                              textField_z0.text             +" "+
                                              textField_eta.text            +" "+
                                              textField_BinSize.text        +" "+
                                              textField_IonOneCharge.text),
                        oneIonPushed()

    }

    Action {
        id: twoIonStartAction

        enabled: (textField_IonOneMass.text     !== "" &&
                  textField_IonOneCount.text    !== "" &&
                  textField_IonTwoMass.text     !== "" &&
                  textField_IonTwoCount.text    !== "" &&
                  textField_IonTwoMass.text      !== "" &&
                  textField_RFvoltage.text       !== "" &&
                  textField_ECvoltage.text       !== "" &&
                  textField_T.text               !== "" &&
                  textField_T0.text              !== "" &&
                  textField_TimeSteps.text       !== "" &&
                  textField_StartHist.text       !== "" &&
                  textField_RFperiode.text       !== "" &&
                  textField_HistX.text           !== "" &&
                  textField_HistY.text           !== "" &&
                  textField_HistZ.text           !== "")

        onTriggered:    textFieldFinal.text = '',
                        textFieldFinal.insert(textFieldFinal.Center,
                                              textField_RFvoltage.text      +" "+
                                              textField_ECvoltage.text      +" "+
                                              textField_T.text              +" "+
                                              textField_T0.text             +" "+
                                              textField_IonOneCount.text    +" "+
                                              textField_IonOneMass.text     +" "+
                                              textField_IonTwoCount.text    +" "+
                                              textField_IonTwoMass.text     +" "+
                                              textField_TimeSteps.text      +" "+
                                              textField_StartHist.text      +" "+
                                              textField_RFperiode.text      +" "+
                                              textField_HistX.text          +" "+
                                              textField_HistY.text          +" "+
                                              textField_HistZ.text          +" "+
                                              textField_OmegaRF.text        +" "+
                                              textField_r0.text             +" "+
                                              textField_z0.text             +" "+
                                              textField_eta.text            +" "+
                                              textField_BinSize.text        +" "+
                                              textField_IonOneCharge.text   +" "+
                                              textField_IonTwoCharge.text),
                        twoIonPushed()

    }

    Action {
        id: sphereAction
        tooltip: "Push to fill in data for a typical spherical crystal"
        onTriggered: textField_RFvoltage.text ="220",
                     textField_ECvoltage.text = "18",
                     textField_RFperiode.text = "105",
                     textField_HistX.text       = "200",
                     textField_HistY.text       = "200",
                     textField_HistZ.text       = "620"


    }

    Action {
        id: oplateAction
        tooltip: "Push to fill in data for a typical spherical crystal"
        onTriggered: textField_RFvoltage.text   = "220",
                     textField_ECvoltage.text   = "3.1",
                     textField_RFperiode.text   = "105",
                     textField_HistX.text       = "250",
                     textField_HistY.text       = "250",
                     textField_HistZ.text       = "250"

    }

    Action {
        id: oneiontestAction
        onTriggered: textField_IonTwoMass.text  = "",
                     textField_IonTwoCount.text = "",
                     textField_IonTwoCharge.text= "",
                     textField_RFvoltage.text   = "220",
                     textField_ECvoltage.text   = "3.1",
                     textField_RFperiode.text   = "105",
                     textField_HistX.text       = "250",
                     textField_HistY.text       = "250",
                     textField_HistZ.text       = "250",
                     textField_IonOneMass.text  = "40",
                     textField_IonOneCount.text = "1000",
                     textField_T.text           = "0.01",
                     textField_T0.text          = "0.1",
                     textField_TimeSteps.text   = "1000000",
                     textField_StartHist.text   = "90000",
                     textField_HistX.text       = "250",
                     textField_HistY.text       = "250",
                     textField_HistZ.text       = "250",
                     textField_OmegaRF.text     = "25195573.0818",
                     textField_r0.text          = "0.00235",
                     textField_z0.text          = "0.0025",
                     textField_eta.text         = "0.342",
                     textField_BinSize.text     = "0.89e-6",
                     textField_IonOneCharge.text= "1.0",
                     textField_RFperiode.editingFinished(),
                     textField_eta.editingFinished()

    }

    Action {
        id: twoiontestAction

        onTriggered: textField_RFvoltage.text   = "220",
                     textField_ECvoltage.text   = "3.1",
                     textField_RFperiode.text   = "105", textField_RFperiode.editingFinished(),
                     textField_HistX.text       = "250",
                     textField_HistY.text       = "250",
                     textField_HistZ.text       = "250",
                     textField_IonOneMass.text  = "40",
                     textField_IonOneCount.text = "1000",
                     textField_T.text           = "0.01",
                     textField_T0.text          = "0.1",
                     textField_TimeSteps.text   = "1000000",
                     textField_StartHist.text   = "90000",
                     textField_RFperiode.text   = "105",
                     textField_HistX.text       = "250",
                     textField_HistY.text       = "250",
                     textField_HistZ.text       = "250",
                     textField_IonTwoMass.text  = "20",
                     textField_IonTwoCount.text = "500",
                     textField_OmegaRF.text     = "25195573.0818",
                     textField_r0.text          = "0.00235",
                     textField_z0.text          = "0.0025",
                     textField_eta.text         = "0.342",
                     textField_BinSize.text     = "0.89e-6",
                     textField_IonOneCharge.text= "1.0",
                     textField_IonTwoCharge.text= "1.0",
                     textField_RFperiode.editingFinished(),
                     textField_eta.editingFinished()
    }

    Action {
        id: openAction
        text: "&Open"
        shortcut: StandardKey.Open
        onTriggered: fileDialogOpen.open()
        tooltip: "Open an image"
    }

    Action {
        id: saveAction
        text: "&Save"
        shortcut: StandardKey.Save
        onTriggered: {
                        if(textField_IonTwoCount === "")
                        {
                            textFieldsaveData.insert(textFieldsaveData.Center,
                                                        textField_RFvoltage.text          + " " +
                                                        textField_ECvoltage.text    + " " +
                                                        textField_T.text                  + " " +
                                              textField_T0.text                 + " " +
                                              textField_IonOneCount.text        + " " +
                                              textField_IonOneMass.text         + " " +
                                              textField_TimeSteps.text          + " " +
                                              textField_StartHist.text       +" "+
                                              textField_RFperiode.text      +" "+
                                              textField_HistX.text           +" "+
                                              textField_HistY.text           +" "+
                                              textField_HistZ.text           +" "+
                                              textField_OmegaRF.text          +" "+
                                              textField_r0.text                      +" "+
                                              textField_z0.text                      +" "+
                                              textField_eta.text                    +" "+
                                              textField_BinSize.text            +" "+
                                              textField_IonOneCharge.text)
                            /*
                           textFieldsaveData.insert(textFieldsaveData.Center,
                                             "RF-voltage: " + textField_RFvoltage.text          + "\n" +
                                             "EC-voltage: " + textField_ECvoltage.text          + "\n" +
                                             "Simulated T: "+ textField_T.text                  + "\n" +
                                             "Start T:"     + textField_T0.text                 + "\n" +
                                             "Ion Count: "  + textField_IonOneCount.text        + "\n" +
                                             "Mass: "       + textField_IonOneMass.text         + "\n" +
                                             "Timesteps: "  + textField_TimeSteps.text          + "\n" +
                                             "Histogram start: "+textField_StartHist.text       +"\n"+
                                             "Steps in a periode: "+ textField_RFperiode.text   +"\n"+
                                             "Size histx: "+     textField_HistX.text           +"\n"+
                                             "Size histy: "+     textField_HistY.text           +"\n"+
                                             "Size histz: "+     textField_HistZ.text           +"\n"+
                                             "Omega_RF: "+      textField_OmegaRF.text          +"\n"+
                                             "r0: "+     textField_r0.text                      +"\n"+
                                             "z0: "+     textField_z0.text                      +"\n"+
                                             "eta: "+     textField_eta.text                    +"\n"+
                                             "BinSize: "+     textField_BinSize.text            +"\n"+
                                             "Charge: " +     textField_IonOneCharge.text)
                            */
                            saveFile.open()
                        }
                        else
                        {

                            textFieldsaveData.insert(textFieldsaveData.Center,
                                                        textField_RFvoltage.text          + " " +
                                                        textField_ECvoltage.text    + " " +
                                                        textField_T.text                  + " " +
                                                        textField_T0.text                 + " " +
                                              textField_IonOneCount.text        + " " +
                                              textField_IonOneMass.text         + " " +
                                              textField_IonTwoCount.text        + " " +
                                              textField_IonTwoMass.text        + " " +
                                              textField_TimeSteps.text          + " " +
                                              textField_StartHist.text       +" "+
                                              textField_RFperiode.text      +" "+
                                              textField_HistX.text           +" "+
                                              textField_HistY.text           +" "+
                                              textField_HistZ.text           +" "+
                                              textField_OmegaRF.text          +" "+
                                              textField_r0.text                      +" "+
                                              textField_z0.text                      +" "+
                                              textField_eta.text                    +" "+
                                              textField_BinSize.text            +" "+
                                              textField_IonOneCharge.text       +" "+
                                              textField_IonTwoCharge.text)

                            /*
                            textFieldsaveData.insert(textFieldsaveData.Center,
                                              "RF-voltage: " + textField_RFvoltage.text                 + "\n" +
                                              "EC-voltage: " + textField_ECvoltage.text                 + "\n" +
                                              "Simulated T: "+ textField_T.text                         + "\n" +
                                              "Start T:"     + textField_T0.text                        + "\n" +
                                              "Ion Count: "  + textField_IonOneCount.text    + "\n" +
                                              "Mass species one: "       + textField_IonOneMass.text     + "\n" +
                                              "Mass species two: "       + textField_IonTwoMass.text     + "\n" +
                                              "Timesteps: "  + textField_TimeSteps.text      + "\n" +
                                              "Histogram start: "+textField_StartHist.text       +"\n"+
                                              "Steps in a periode: "+ textField_RFperiode.text   +"\n"+
                                              "Size histx: "+     textField_HistX.text           +"\n"+
                                              "Size histy: "+     textField_HistY.text           +"\n"+
                                              "Size histz: "+     textField_HistZ.text           +"\n"+
                                              "Omega_RF: "+      textField_OmegaRF.text          +"\n"+
                                              "r0: "+     textField_r0.text                      +"\n"+
                                              "z0: "+     textField_z0.text                      +"\n"+
                                              "eta: "+     textField_eta.text                    +"\n"+
                                              "BinSize: "+     textField_BinSize.text            +"\n"+
                                              "Charge species one: " +     textField_IonOneCharge.text       +"\n"+
                                              "Charge species two: " +     textField_IonOneCharge.text)
                        */
                        saveFile.open()
                        }
                     }
        tooltip: "Save configuration"
    }


    menuBar: MenuBar {
        Menu {
            title: "&File"
            MenuItem { action: openAction }
            MenuItem { action: saveAction }
            MenuItem {
                text: "Close"
                shortcut: StandardKey.Quit
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: "&Help"
            MenuItem { action: aboutAction }
        }
    }

    FileDialog {
        id: fileDialogOpen
        nameFilters: [ "Simulation Setups (*.txt)" ]
        onAccepted: imageViewer.open(fileUrl)
    }

    FileDialog {
        id: fileDialogSave
        title: "Save"
        nameFilters: [ "Simulation Setups (*.txt)" ]
        onAccepted: imageViewer.open(fileUrl)
    }

    // Fields in the GUI

    TextField {
        id: textField_IonOneMass
        x: 169
        y: 70
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")

        onEditingFinished: textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                   textField_eta.text,
                                                                                   textField_ECvoltage,
                                                                                   textField_IonOneMass,
                                                                                   textField_IonOneCharge,
                                                                                   textField_z0)),
                           textField_OmegaR.text = "",
                           textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                               textField_eta.text,
                                                                                               textField_r0.text,
                                                                                               textField_ECvoltage.text,
                                                                                               textField_RFvoltage.text,
                                                                                               textField_IonOneMass.text,
                                                                                               textField_IonOneCharge.text,
                                                                                               textField_z0.text))
    }

    Label {
        id: label_IonOneMass
        x: 169
        y: 45
        text: qsTr("Mass species one  [u]")
    }

    TextField {
        id: textField_IonTwoMass
        x: 169
        y: 130
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_IonTwoMass
        x: 169
        y: 105
        text: qsTr("Mass species two [u]")
    }

    TextField {
        id: textField_IonOneCount
        x: 32
        y: 70
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_IonOneCount
        x: 32
        y: 45
        text: qsTr("Ions species one")
    }

    TextField {
        id: textField_IonTwoCount
        x: 32
        y: 130
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_IonTwoCount
        x: 32
        y: 105
        text: "Ions species two"
    }

    TextField {
        id: textField_RFvoltage
        x: 32
        y: 233
        width: 116
        height: 23
        validator: DoubleValidator {bottom: 0.0;}
        placeholderText: qsTr("Insert double.")

        onEditingFinished:                             textField_OmegaR.text = "",
                                                       textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                                                           textField_eta.text,
                                                                                                                           textField_r0.text,
                                                                                                                           textField_ECvoltage.text,
                                                                                                                           textField_RFvoltage.text,
                                                                                                                           textField_IonOneMass.text,
                                                                                                                           textField_IonOneCharge.text,
                                                                                                                           textField_z0.text))
    }

    Label {
        id: label_RFvoltage
        x: 32
        y: 208
        text: qsTr(" RF-Voltage [V]")
    }

    TextField {
        id: textField_ECvoltage
        x: 168
        y: 233
        width: 116
        height: 23
        validator: DoubleValidator {bottom: 0.0;}
        placeholderText: qsTr("Insert double.")

        onEditingFinished: textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                   textField_eta.text,
                                                                                   textField_ECvoltage,
                                                                                   textField_IonOneMass,
                                                                                   textField_IonOneCharge,
                                                                                   textField_z0)),
                           textField_OmegaR.text = "",
                           textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                               textField_eta.text,
                                                                                               textField_r0.text,
                                                                                               textField_ECvoltage.text,
                                                                                               textField_RFvoltage.text,
                                                                                               textField_IonOneMass.text,
                                                                                               textField_IonOneCharge.text,
                                                                                               textField_z0.text))
    }

    Label {
        id: label_ECVoltage
        x: 168
        y: 208
        text: qsTr("EC-Voltage [V]")
    }

    TextField {
        id: textField_T
        x: 617
        y: 233
        width: 116
        height: 23
        validator: DoubleValidator {bottom: 0.0;}
        placeholderText: qsTr("Insert double.")
    }

    Label {
        id: label_T
        x: 617
        y: 208
        text: qsTr("Simulated T [K]")
    }

    TextField {
        id: textField_T0
        x: 753
        y: 233
        width: 116
        height: 23
        validator: DoubleValidator {bottom: 0.0;}
        placeholderText: qsTr("Insert double.")
    }

    Label {
        id: label_T0
        x: 753
        y: 208
        text: qsTr("Start T of ions [K]")
    }

    TextField {
        id: textField_TimeSteps
        x: 617
        y: 296
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_TimeSteps
        x: 617
        y: 271
        text: qsTr("Timesteps")
    }

    TextField {
        id: textField_StartHist
        x: 756
        y: 296
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_StartHist
        x: 756
        y: 271
        text: qsTr("Start rec. histograms [steps]")
    }

    TextField {
        id: textField_RFperiode
        x: 617
        y: 360
        width: 116
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
        onEditingFinished: textField_dt.text = "",
                    textField_dt.insert(textField_dt.Center,myParameters.dt(textField_OmegaRF.text,textField_RFperiode.text))
    }

    Label {
        id: label_RFperiode
        x: 617
        y: 335
        text: qsTr("Steps pr RF-periode [steps]")

    }

    TextField {
        id: textField_HistX
        x: 179
        y: 529
        width: 81
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_HistX
        x: 217
        y: 504
        width: 19
        height: 19
        text: qsTr("x")
    }

    TextField {
        id: textField_HistY
        x: 287
        y: 529
        width: 81
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_HistY
        x: 318
        y: 504
        text: qsTr("y")
    }

    TextField {
        id: textField_HistZ
        x: 390
        y: 529
        width: 84
        height: 23
        validator: IntValidator {bottom: 1;}
        placeholderText: qsTr("Insert int.")
    }

    Label {
        id: label_HistZ
        x: 429
        y: 504
        text: qsTr("z")
    }

    Button {
        id: button_StartOneIonSim
        x: 631
        y: 518
        text: " One species"
        tooltip:"Press to start simulation!"

        action: oneIonStartAction

        //onClicked: hello()
    }

    Button {
        id: button_StartTwoIonSim
        x: 785
        y: 518
        text: qsTr("Two species")
        action: twoIonStartAction
    }


    TextField {
        id: textFieldFinal
        x: 1017
        y: 19
        width: 83
        height: 45
        visible: false
        placeholderText: qsTr("Text Field")
    }

    GroupBox {
        id: groupBox1
        x: 13
        y: 17
        width: 503
        height: 155
        title: qsTr("Ions")
    }

    GroupBox {
        id: groupBox2
        x: 13
        y: 183
        width: 503
        height: 286
        title: qsTr("Trap")
    }

    GroupBox {
        id: groupBox3
        x: 13
        y: 475
        width: 503
        height: 95
        title: qsTr("Histogram Size")
    }

    GroupBox {
        id: groupBox4
        x: 593
        y: 17
        width: 372
        height: 155
        title: qsTr("Autofill data.")


        Button {
            id: button_Oplate
            x: 9
            y: 14
            width: 125
            height: 34
            text: qsTr("Oblate crystal")
            tooltip:"Press to fill in data for a typical oplate crystal"
            action: oplateAction
        }

        Button {
            id: button_Spherical
            x: 9
            y: 71
            width: 125
            height: 34
            text: qsTr("Spherical crystal")
            tooltip:"Press to fill in data for a typical spherical crystal"
            action: sphereAction
        }

        Button {
            id: button_oneiontest
            x: 160
            y: 14
            width: 125
            height: 34
            text: qsTr("One ion test")
            action: oneiontestAction
        }

        Button {
            id: button_twoiontest
            x: 160
            y: 71
            width: 125
            height: 34
            text: qsTr("Two ion test")
            action: twoiontestAction
        }
    }

    GroupBox {
        id: groupBox6
        x: 593
        y: 183
        width: 372
        height: 286
        title: qsTr("Simulation")
    }

    GroupBox {
        id: groupBox5
        x: 593
        y: 475
        width: 372
        height: 95
        title: qsTr("Start simulations")
    }

    Parameters {
        id: myParameters
    }

    DataSaveLoader {
        id: myDataSaveLoader
    }

    TextField {
        id: textField_IonOneCharge
        x: 331
        y: 70
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0.1
        }



        onEditingFinished: textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                   textField_eta.text,
                                                                                   textField_ECvoltage.text,
                                                                                   textField_IonOneMass.text,
                                                                                   textField_IonOneCharge.text,
                                                                                   textField_z0.text)),
                            textField_OmegaR.text = "",
                            textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                                textField_eta.text,
                                                                                                textField_r0.text,
                                                                                                textField_ECvoltage.text,
                                                                                                textField_RFvoltage.text,
                                                                                                textField_IonOneMass.text,
                                                                                                textField_IonOneCharge.text,
                                                                                                textField_z0.text))
    }

    Label {
        id: label_IonOneCharge
        x: 331
        y: 45
        text: "Charge species one [e]"
    }

    TextField {
        id: textField_IonTwoCharge
        x: 331
        y: 130
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0.1
        }

    }

    Label {
        id: label_IonTwoCharge
        x: 331
        y: 105
        text: "Charge species two [e]"
    }

    TextField {
        id: textField_BinSize
        x: 31
        y: 529
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0
        }
    }

    Label {
        id: label_BinSize
        x: 31
        y: 504
        text: qsTr("Size of bin [m]")
    }

    TextField {
        id: textField_r0
        x: 32
        y: 296
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0
        }
        onEditingFinished:                            textField_OmegaR.text = "",
                                                      textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                                                          textField_eta.text,
                                                                                                                          textField_r0.text,
                                                                                                                          textField_ECvoltage.text,
                                                                                                                          textField_RFvoltage.text,
                                                                                                                          textField_IonOneMass.text,
                                                                                                                          textField_IonOneCharge.text,
                                                                                                                          textField_z0.text))
    }

    Label {
        id: label_r0
        x: 32
        y: 271
        text: " Electrode inscribed radius [m]"
    }

    TextField {
        id: textField_z0
        x: 270
        y: 296
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0
        }
        onEditingFinished: textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                   textField_eta.text,
                                                                                   textField_ECvoltage.text,
                                                                                   textField_IonOneMass.text,
                                                                                   textField_IonOneCharge.text,
                                                                                   textField_z0.text)),
                           textField_OmegaR.text = "",
                           textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                               textField_eta.text,
                                                                                               textField_r0.text,
                                                                                               textField_ECvoltage.text,
                                                                                               textField_RFvoltage.text,
                                                                                               textField_IonOneMass.text,
                                                                                               textField_IonOneCharge.text,
                                                                                               textField_z0.text))
    }

    Label {
        id: label_z0
        x: 270
        y: 271
        text: "Center electrode length [m]"
    }

    TextField {
        id: textField_eta
        x: 31
        y: 360
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0
        }
        onEditingFinished: textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                   textField_eta.text,
                                                                                   textField_ECvoltage.text,
                                                                                   textField_IonOneMass.text,
                                                                                   textField_IonOneCharge.text,
                                                                                   textField_z0.text)),
                           textField_OmegaR.text = "",
                           textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                               textField_eta.text,
                                                                                               textField_r0.text,
                                                                                               textField_ECvoltage.text,
                                                                                               textField_RFvoltage.text,
                                                                                               textField_IonOneMass.text,
                                                                                               textField_IonOneCharge.text,
                                                                                               textField_z0.text))
    }

    Label {
        id: label_eta
        x: 31
        y: 335
        text: "Axial geometrical constant"
    }

    TextField {
        id: textField_OmegaR
        x: 169
        y: 422
        width: 116
        height: 23
        readOnly: true
        placeholderText: qsTr("")
        validator: DoubleValidator {
            bottom: 0
        }
    }

    Label {
        id: label_OmegaR
        x: 169
        y: 397
        text: qsTr("Omega_r [Hz]")
    }

    TextField {
        id: textField_OmegaZ
        x: 305
        y: 422
        width: 116
        height: 23
        readOnly: true
        placeholderText: qsTr("")
        validator: DoubleValidator {
            bottom: 0
        }
    }

    Label {
        id: label_OmegaZ
        x: 305
        y: 397
        text: "Omega_z [Hz]"
    }

    TextField {
        id: textField_dt
        x: 617
        y: 422
        width: 116
        height: 23

        readOnly: true
        placeholderText: qsTr("")
        validator: DoubleValidator {
            bottom: 0
        }
    }

    Label {
        id: label_dt
        x: 617
        y: 397
        text: "Length of timestep [s]"
    }

    TextField {
        id: textField_OmegaRF
        x: 32
        y: 422
        width: 116
        height: 23
        placeholderText: qsTr("Insert double.")
        validator: DoubleValidator {
            bottom: 0
        }

        onEditingFinished: textField_dt.text = "",
                           textField_dt.insert(textField_dt.Center,myParameters.dt(textField_OmegaRF.text,textField_RFperiode.text)),
                           textField_OmegaZ.text = "",
                           textField_OmegaZ.insert(textField_OmegaZ.Center,myParameters.omegaZ(textField_OmegaRF.text,
                                                                                           textField_eta.text,
                                                                                           textField_ECvoltage.text,
                                                                                           textField_IonOneMass.text,
                                                                                           textField_IonOneCharge.text,
                                                                                           textField_z0.text)),
                           textField_OmegaR.text = "",
                           textField_OmegaR.insert(textField_OmegaR.Center,myParameters.omegaR(textField_OmegaRF.text,
                                                                                               textField_eta.text,
                                                                                               textField_r0.text,
                                                                                               textField_ECvoltage.text,
                                                                                               textField_RFvoltage.text,
                                                                                               textField_IonOneMass.text,
                                                                                               textField_IonOneCharge.text,
                                                                                               textField_z0.text))
        }

    Label {
        id: label_OmegaRF
        x: 32
        y: 397
        text: qsTr("Omega_RF [Hz]")
    }

    FileSaveDialog {
           id: saveFile
           title: "Save file"
           filename: "Configuration.txt"

           onAccepted: {
               textField1.text = saveFile.fileUrl
               textField1.text = textField1.text.substring(8,textField1.text.length)
               myDataSaveLoader.saveData(textFieldsaveData.text,textField1.text)
           }
           onRejected: {
               //outputFile.text = "File selected: –"
           }
    }

    TextField {
        id: textField1
        visible: false
    }

    TextField {
        id: textFieldsaveData
        visible: false
    }


    FileOpenDialog {
           id: openFile
           title: "Save file"
           filename: "Configuration.txt"

           onAccepted: {
               textField1.text = openFile.fileUrl
               textField1.text = textField1.text.substring(8,textField1.text.length)
               myDataSaveLoader.loadData(textField1.text)
           }
           onRejected: {
               //outputFile.text = "File selected: –"
           }
    }


}
