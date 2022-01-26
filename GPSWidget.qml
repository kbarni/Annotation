import QtQuick 2.12
import QtQuick.Controls 2.12
import QtPositioning 5.12

Item{
    id: root
    implicitHeight: row.height
    implicitWidth: row.width
    property string label: 'Longitude\tLatitude'
    property string stringvalue: '\t'
    signal reset()
    PositionSource {
        id: src
        updateInterval: 1000
        active: true

        onPositionChanged: {
            var coord = src.position.coordinate;
            if(coord.isValid){
                lat.text = coord.longitude.toFixed(4);
                lon.text = coord.latitude.toFixed(4);
                root.stringvalue = coord.longitude.toFixed(6)+'\t'+coord.latitude.toFixed(6)+'\t';
            }
            else {
                lat.text = '---';
                lon.text = '---';
            }
        }
    }

    Row{
        id: row
        Label{
            text: "GPS "
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            id: lat
            width: 100
            enabled: false
            placeholderText: ("Latitude")
            text: "---"
        }
        Label {
            id: label7
            text: qsTr("/")
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            id: lon
            width: 100
            enabled: false
            placeholderText: ("Longitude")
            text: "---"
        }
    }
}
