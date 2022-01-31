import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: ''
    property int maxvalue: 99
    property string stringvalue: '0\t'
    property int defaultvalue: 0
    property int value: defaultvalue
    property bool persistent: false
    property bool autoincrement: false
    signal reset()
    onReset: {
        if(autoincrement) control.value += 1
        else if(!persistent) control.value=defaultvalue
    }
    Row{
        id: row
        spacing: 10
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        SpinBox{
            id: control
            to: root.maxvalue
            value: root.value
            onValueChanged: {
                root.value=value
                root.stringvalue=value.toString()+'\t'
            }
        }
    }
}
