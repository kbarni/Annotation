import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: ''
    property int maxvalue: 5
    property string stringvalue: '0\t'
    property int defaultvalue: 0
    property int value: defaultvalue
    property bool enabled: true
    property bool persistent: false
    signal reset()
    onReset: if(!persistent) control.value=defaultvalue
    Row{
        id: row
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        Slider{
            id: control
            to: root.maxvalue
            value: root.value
            enabled: root.enabled
            stepSize: 1
            onValueChanged: {
                root.value=value;
                root.stringvalue=value.toString()+'\t'
            }
        }
    }
}
