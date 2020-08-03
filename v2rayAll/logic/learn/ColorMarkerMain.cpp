#include <QGuiApplication>
#include <QQuickView>
#include <QtQml>
#include <QQmlApplicationEngine>
#include "./cpp/learn/colorMarker.h"

int main(int argc, char *argv[]) {
    //  旧模式。注册QML可用的类型
    QGuiApplication app(argc, argv);
    qmlRegisterType<ColorMaker>("Custom.v2rayAll.ColorMarker", 1, 0, "ColorMarker");

    QQuickView viewer;
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);

    viewer.setSource(QUrl("qrc:/qml/qml/learn/ColorMarkerMain.qml"));
    viewer.show();

    /*
    // engine模式。将一个C++对象导出为QML属性
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // 从堆上分配了一个ColorMarker对象，然后注册为QML上下文的属性
    engine.rootContext()->setContextProperty("colorMarker", new ColorMaker);

    const QUrl url(QStringLiteral("qrc:/qml/qml/learn/ColorMarkerMain.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if(!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    */

    return app.exec();
}
