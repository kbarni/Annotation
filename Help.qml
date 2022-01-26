import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: root
    width: 480
    height: 640
    implicitHeight: column.height
    implicitWidth: column.width
    signal closeMe()

    Column {
        id: column
        spacing: 10
        anchors.fill: parent

        Label {
            text: qsTr("Annotation")
            font.pointSize: 22
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            text: qsTr("© 2022 Barna Keresztes \n IMS Bordeaux / Équipe Imagro")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Label{
            text: qsTr("Application d'annotation pour la recherche en agriculture.\nPour les renseignements concernant l'utilisation du logiciel ou la création des formulaires, rendez-vous sur le page Github du projet.\nCe logiciel est publié sous licence libre GPL3.")
            width: parent.width

            wrapMode: Text.WordWrap
        }
    }

    Button {
        x: 0
        y: 344
        text: qsTr("Fermer")
        anchors.bottom: root.bottom
        anchors.horizontalCenter: root.horizontalCenter
        onClicked: closeMe()
    }
}
