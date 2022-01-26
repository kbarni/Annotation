import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: ''
    property variant items: []
    property string stringvalue:'0\t'
    property int defaultvalue: 0
    property bool enabled: true
    property int value: defaultvalue
    property bool persistent: false
    signal reset()
    onReset: if(!persistent)control.currentIndex=defaultvalue
    Row{
        id: row
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
