import Quickshell
import QtQuick

PanelWindow {
    required property var screen
    
    anchors {
        left: true
        top: true
        bottom: true
    }
    
    property int barWidth: 10
    implicitWidth: barWidth
    exclusiveZone: barWidth
    color: Theme.base
}
