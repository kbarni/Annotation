import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: ''
    property variant items: []
    property string stringvalue:'0\t'
    //property int defaultvalue: 0
    property bool enabled: true
    property int value: 0
    property bool persistent: false
    signal reset()
    onReset: if(!persistent)control.currentIndex=0
    Row{
        id: row
        spacing: 10
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        ComboBox{
            id: control
            model: items
            enabled: root.enabled
            currentIndex: root.value
            onCurrentTextChanged: {
                root.value=currentIndex
                root.stringvalue=currentText+'\t'
            }
        }
    }
}
