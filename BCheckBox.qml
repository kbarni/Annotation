import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: control.height
    implicitWidth: control.width
    property bool defaultvalue: false
    property bool enabled: true
    property bool persistent: false
    property string label: ''
    property bool value : false
    property string stringvalue: 'false\t'
    signal reset()
    onReset: if(!persistent) control.checked=defaultvalue
    CheckBox {
        id: control
        text: root.label
        enabled: root.enabled
        onCheckedChanged: {
            root.value=checked
            root.stringvalue=checked.toString()+'\t'
        }
    }
}
