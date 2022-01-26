import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: app
    width: 600
    height: 800
    visible: true
    title: qsTr("Annotation")
    Material.theme: theme.checked ? Material.Dark : Material.Light

    property var content

    Popup {
        id: helpwindow
        modal: true
        focus: true
        width: help.width+40
        height: help.height+40
        margins: 20
        anchors.centerIn: parent
        Help {
            id: help
            onCloseMe: helpwindow.close()
        }
    }

    header: ToolBar {
        contentHeight: dbase.implicitHeight

        ToolButton {
            id: dbase
            icon.source: "qrc:/icons/floppy.png"
            onClicked: {
                if (stackview.depth > 1) {
                    stackview.pop(StackView.PushTransition);
                } else {
                    stackview.push(file,StackView.PushTransition);
                }
            }
        }
        Label {
            text: backend.projet
            font.bold: true
            font.pixelSize: Qt.application.font.pixelSize * 1.4
            anchors.centerIn: parent
        }
        ToolButton {
            id: theme
            checkable: true
            checked: false
            icon.source: "qrc:/icons/brightness-6.png"
            anchors.right: parent.right
        }
        ToolButton {
            id: helpbutton
            icon.source: "qrc:/icons/help-circle-outline.png"
            anchors.right: theme.left
            onClicked:
                helpwindow.open()
        }
    }
    File {
        id: file
        onCloseMe: {
            stackview.pop();
        }
        onSetUI: {
            if(content)content.destroy();
            content = Qt.createQmlObject(backend.getMainPage(uifile),stackview,"DynamicPage");
        }
    }

    Page{
        id: maininterface
        Component.onCompleted: {
            stackview.push(file);
        }
    }

    StackView {
        id: stackview
        initialItem: maininterface
        anchors.fill: parent
    }
}
