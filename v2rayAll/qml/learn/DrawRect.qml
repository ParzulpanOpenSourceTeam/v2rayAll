import QtQuick 2.12

// 绘制一个带红色边框的蓝色矩形
Canvas {
    width: 400;
    height: 240;

    onPaint: {
        let ctx = getContext("2d");
        ctx.lineWidth = 2;
        ctx.strokeStyle = "red";
        ctx.fillStyle = "blue";
        ctx.beginPath();
        ctx.rect(100, 80, 120, 80);
        ctx.fill();
        ctx.stroke();
    }
}
