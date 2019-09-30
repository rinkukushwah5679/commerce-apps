

setTimeout((function () {
    window.status = "FLAG_FOR_PDF";
    Object.keys(Chartkick.charts).forEach(function (key) {
        Chartkick.charts[key].redraw();
    });
}), 3000);