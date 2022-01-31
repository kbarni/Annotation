import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    id: page

    signal closeMe()
    signal setUI(string uifile)

    GridLayout {
        id: grid
        width: parent.width-20
        columns: 2
        columnSpacing: 10
        rowSpacing: 10
        Label {
            text: qsTr("Base de données")
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            Layout.columnSpan: 2
            font.pointSize: 20
            font.bold: true

        }
        Label {
            id: label
            text: qsTr("Nom fichier:")
        }

        ComboBox {
            id: filelist
            model: backend.filelist
            Layout.fillWidth: true
            onCurrentTextChanged: {
                if(currentIndex>0)
                    backend.filechanged(currentText);
            }
        }

        Label {
            id: label0
            text: qsTr("Fichier")
        }

        TextField {
            id: filename
            text: filelist.currentIndex==0 ? "": filelist.currentText
            enabled: filelist.currentIndex==0
            Layout.fillWidth: true
        }
        Label {
            id: label1
            text: qsTr("Projet")
        }
        TextField {
            id: projet
            placeholderText: qsTr("Projet")
            text: filelist.currentIndex==0 ? "": backend.projet
            enabled: filelist.currentIndex==0
            Layout.fillWidth: true
        }
        Label {
            id: label00
            text: qsTr("Formulaire:")
        }
        ComboBox {
            id: uilist
            model: backend.uilist
            enabled: filelist.currentIndex==0
            currentIndex: backend.uiindex
            Layout.fillWidth: true
        }
        Label {
            id: label2
            text: qsTr("Domaine")
        }
        TextField {
            id: domaine
            text: filelist.currentIndex==0 ? "": backend.domaine
            enabled: filelist.currentIndex==0
            placeholderText: qsTr("Domaine")
            Layout.fillWidth: true
        }
        Label {
            id: label3
            text: qsTr("Observations")
        }
        TextArea {
            id: observations
            Layout.columnSpan: 2
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            enabled: filelist.currentIndex==0
            placeholderText: qsTr("Observations")
        }

        Button{
            id: button
            Layout.columnSpan: 2
            text: filelist.currentIndex==0 ? qsTr("Créer") : qsTr("OK")
            enabled: filelist.currentIndex>0 | (filename.text!="" && uilist.currentIndex>0)
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            onClicked: {
                page.setUI(uilist.currentText);
                if(filelist.currentIndex==0)
                    backend.createFile(filename.text,uilist.currentText,projet.text,domaine.text,observations.text);
                else
                    backend.selectFile(filename.text);
                page.closeMe();
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
