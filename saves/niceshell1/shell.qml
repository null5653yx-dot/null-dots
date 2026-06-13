import Quickshell
import QtQuick

Scope {
    id: root
    
    Variants {
        model: Quickshell.screens
        
        Scope {
            required property var modelData
            
            TopBar {
                screen: modelData
            }
            
            BottomBar {
                screen: modelData
            }
            
            LeftBar {
                screen: modelData
            }
            
            RightBar {
                screen: modelData
            }
        }
    }
}
