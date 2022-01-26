import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

Item {

    Popup {
        id: campopup
        modal: true
        focus: true
        margins: 50
        parent: root.parent
        width: parent.width-100
        height: width*0.75
        onOpened: camera.start()
        onClosed: camera.stop()
        Component.onCompleted: {
            camera.stop()
        }
        Camera {
            id: camera
            captureMode: Camera.CaptureStillImage
            imageCapture.onImageSaved:{
                campopup.close()
            }
        }

        VideoOutput {
            id: vid_out
            source: camera
            Component.onCompleted: {
                VideoOutput.source._q_reregisterTimers()
                console.log(camera.viewfinder.resolution.width+" "+camera.viewfinder.resolution.height)
                campopup.height=campopup.width*camera.viewfinder.resolution.width/camera.viewfinder.resolution.height
            }
            anchors.fill: parent
            autoOrientation: true
            fillMode: VideoOutput.PreserveAspectFit
            focus : visible
        }

        RoundButton {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            icon.source: "qrc:/icons/camera-outline.png"
            onClicked: {
                var fn="annot_"+Qt.formatDateTime(new Date(),"yyMMdd_hhmmss.jpg")
                camera.imageCapture.captureToLocation(fn)
                filename.text=fn
            }
        }
    }

    id: root
    signal reset()
    property string label: 'Photo'
    property string stringvalue: '\t'
    property string value: ''
    onReset: {
        filename.text=''
    }
    implicitHeight: row.height
    implicitWidth: row.width
    Row{
        id: row
        Label{
            text: root.label
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField{
            id: filename
            enabled: false
            width: 250
            text: ''
            onTextChanged: {
                root.valuetext
                root.stringvalue=text+'\t'
            }
        }
        ToolButton{
            id: startcam
            icon.source: "qrc:/icons/camera-outline.png"
            onClicked: {
                campopup.open()
            }
        }

    }
}
