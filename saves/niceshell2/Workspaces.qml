import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: root
    
    implicitWidth: row.implicitWidth
    implicitHeight: 40 // matches bar height
    
    // Add scrolling to switch workspaces
    MouseArea {
        anchors.fill: parent
        onWheel: (wheel) => {
            if (wheel.angleDelta.y > 0) {
                // Scroll up
                Hyprland.dispatch("hl.dsp.focus({ workspace = 'm-1' })")
            } else if (wheel.angleDelta.y < 0) {
                // Scroll down
                Hyprland.dispatch("hl.dsp.focus({ workspace = 'm+1' })")
            }
        }
    }
    
    Row {
        id: row
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        spacing: 8
        
        Repeater {
            model: Hyprland.workspaces
            
            delegate: Rectangle {
                id: pill
                required property var modelData // HyprlandWorkspace
                
                // Use the focused property directly from the model
                property bool isFocused: modelData.focused || (Hyprland.focusedWorkspace && modelData.id === Hyprland.focusedWorkspace.id)
                property bool isHovered: ma.containsMouse
                
                implicitHeight: 12
                implicitWidth: isFocused ? 36 : 12
                radius: 6
                
                color: {
                    if (isFocused) return Theme.blue;
                    if (modelData.urgent) return Theme.red;
                    if (isHovered) return Theme.surface2;
                    return Theme.overlay0;
                }
                
                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 300
                        easing.type: Easing.OutExpo
                    }
                }
                
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
                
                scale: ma.pressed ? 0.8 : 1.0
                Behavior on scale {
                    NumberAnimation {
                        duration: 150
                        easing.type: Easing.OutBack
                    }
                }
                
                MouseArea {
                    id: ma
                    anchors.fill: parent
                    anchors.margins: -4
                    hoverEnabled: true
                    onClicked: {
                        modelData.activate()
                    }
                }
            }
        }
    }
}
