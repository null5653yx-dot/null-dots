import Quickshell
import QtQuick

PanelWindow {
    id: root
    required property var screen
    
    anchors {
        bottom: true
        left: true
        right: true
    }
    
    property int barHeight: 10
    property int cornerRadius: 20
    property int thinBarWidth: 10
    
    implicitHeight: barHeight + cornerRadius
    exclusiveZone: barHeight
    color: "transparent"
    
    Rectangle {
        id: bg
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: root.barHeight
        color: Theme.base
    }
    
    Corner {
        anchors.bottom: bg.top
        anchors.left: parent.left
        anchors.leftMargin: root.thinBarWidth
        width: root.cornerRadius
        height: root.cornerRadius
        color: Theme.base
        transparentCorner: "topright"
    }
    
    Corner {
        anchors.bottom: bg.top
        anchors.right: parent.right
        anchors.rightMargin: root.thinBarWidth
        width: root.cornerRadius
        height: root.cornerRadius
        color: Theme.base
        transparentCorner: "topleft"
    }
}
