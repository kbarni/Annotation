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
    property int fieldwidth: 150
    property bool numberfield: false
    signal reset()
    signal setvalue(string s)
    onSetvalue: control.text=s
    onReset: if(!persistent) control.text=defaultvalue
    DoubleValidator{
        id: dv
        notation: DoubleValidator.StandardNotation
    }
    Row{
        id: row
        spacing: 10
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField{
            id: control
            enabled: root.enabled
            width: root.fieldwidth
            onTextChanged: root.stringvalue=text+'\t'
            Keys.onReturnPressed: focus = false
            inputMethodHints: root.numberfield ? Qt.ImhFormattedNumbersOnly:Qt.ImhNone
            validator: root.numberfield ? dv : null
        }
    }
}
