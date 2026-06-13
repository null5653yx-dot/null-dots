import QtQuick

Canvas {
    id: root
    width: 20
    height: 20
    
    property color color: "red"
    
    // "topleft", "topright", "bottomleft", "bottomright"
    property string transparentCorner: "bottomright"
    
    onPaint: {
        var ctx = getContext("2d");
        ctx.reset();
        
        ctx.fillStyle = root.color;
        ctx.fillRect(0, 0, width, height);
        
        ctx.globalCompositeOperation = "destination-out";
        ctx.beginPath();
        
        var cx = 0;
        var cy = 0;
        
        if (transparentCorner === "bottomright") { cx = width; cy = height; }
        else if (transparentCorner === "bottomleft") { cx = 0; cy = height; }
        else if (transparentCorner === "topright") { cx = width; cy = 0; }
        else if (transparentCorner === "topleft") { cx = 0; cy = 0; }
        
        ctx.arc(cx, cy, width, 0, 2 * Math.PI);
        ctx.fill();
    }
}
