import Quickshell
import QtQuick

PanelWindow {
    id: root
    
    // Needs to be assigned from outside
    required property var screen
    
    anchors {
        top: true
        left: true
        right: true
    }
    
    property int barHeight: 40
    property int cornerRadius: 20
    property int thinBarWidth: 10
    
    implicitHeight: barHeight + cornerRadius
    exclusiveZone: barHeight
    color: "transparent"
    
    Rectangle {
        id: bg
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: root.barHeight
        color: Theme.base
    }
    
    Corner {
        anchors.top: bg.bottom
        anchors.left: parent.left
        anchors.leftMargin: root.thinBarWidth
        width: root.cornerRadius
        height: root.cornerRadius
        color: Theme.base
        transparentCorner: "bottomright"
    }
    
    Corner {
        anchors.top: bg.bottom
        anchors.right: parent.right
        anchors.rightMargin: root.thinBarWidth
        width: root.cornerRadius
        height: root.cornerRadius
        color: Theme.base
        transparentCorner: "bottomleft"
    }
}
