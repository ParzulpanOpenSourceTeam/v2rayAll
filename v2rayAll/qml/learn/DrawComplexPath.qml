import QtQuick 2.12

Canvas {
    id: root;
    width: 400;
    height: 300;

    onPaint: {
        let ctx = getContext("2d");
        ctx.lineWidth = 2;
        ctx.strokeStyle = "red";
        ctx.font = "42px sans-serif";
        let gradient = ctx.createLinearGradient(0, 0, width, height);
        gradient.addColorStop(0.0, Qt.rgba(0, 1, 0, 1));
        gradient.addColorStop(1.0, Qt.rgba(0, 0, 1, 1));
        ctx.fillStyle = gradient;
        ctx.beginPath();
        ctx.moveTo(4, 4);
        ctx.bezierCurveTo(0, height-1, width-1, height/2, width/4, height/4); // 三次方贝塞尔曲线
        ctx.lineTo(width/2, height/4);
        ctx.arc(width*5/8, height/4, width/8, Math.PI, 0, false);   // 弧线
        ctx.ellipse(width*11/16, height/4, width/8, height/4);  // 椭圆
        ctx.lineTo(width/2, height/7*8)
        ctx.text("v2rayAll", width/4, height*7/8);
        ctx.fill();
        ctx.stroke();

    }
}
