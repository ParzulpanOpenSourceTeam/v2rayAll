import QtQuick 2.12

Canvas {
    width: 400;
    height: 240;

    onPaint: {
        let ctx = getContext("2d");
        ctx.lineWidth = 2;
        ctx.strokeStyle = "red";
        let gradient = ctx.createLinearGradient(60, 50, 180, 130);
        gradient.addColorStop(0.0, Qt.rgba(1, 0, 0, 1.0));
        gradient.addColorStop(1.0, Qt.rgba(0, 0, 1, 1.0));
        ctx.fillStyle = gradient;
        ctx.beginPath();
        ctx.rect(60, 50, 120, 80);
        ctx.fill();
        ctx.stroke();

        let gradient2 = ctx.createLinearGradient(230, 160, 30, 260, 200, 20);
        gradient2.addColorStop(0.0, Qt.rgba(1, 0, 0, 1.0))
        gradient2.addColorStop(1.0, Qt.rgba(0, 0, 1, 1.0));
        ctx.fillStyle = gradient2;
        ctx.beginPath();
        ctx.rect(180, 130, 120, 80);
        ctx.fill();
        ctx.stroke();

    }
}
