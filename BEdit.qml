import QtQuick 2.12
import QtQuick.Controls 2.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: ''
    property string stringvalue: '\t'
    property string defaultvalue: ''
    property bool persistent: false
    property bool enabled: true
    signal reset()
    signal setvalue(string s)
    onSetvalue: control.text=s
    onReset: if(!persistent) control.text=defaultvalue
    Row{
        id: row
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField{
            id: control
            enabled: root.enabled
            onTextChanged: root.stringvalue=text+'\t'
            Keys.onReturnPressed: focus = false
        }
    }
}
