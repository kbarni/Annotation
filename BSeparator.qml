import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    id: root
    implicitHeight: lab.height
    width: parent.width
    property string label: ''
    property string stringvalue: '|\t'
    Label{
        id: lab
        text: root.label
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
