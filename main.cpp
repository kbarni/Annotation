#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>
#include <QDebug>

#include "backend.h"

#ifdef __ANDROID__
#include <QtAndroidExtras/QtAndroid>

bool check_permission() {
    QtAndroid::PermissionResult r = QtAndroid::checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");
    if(r == QtAndroid::PermissionResult::Denied) {
        QtAndroid::requestPermissionsSync( QStringList() << "android.permission.WRITE_EXTERNAL_STORAGE" );
        r = QtAndroid::checkPermission("android.permission.WRITE_EXTERNAL_STORAGE");
        if(r == QtAndroid::PermissionResult::Denied) {
            qDebug() << "Permission denied";
            return false;
        }
    }

    qDebug() << "Permissions granted!";
    return true;
}
#else
bool check_permission() {return true;}
#endif

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    check_permission();

    QGuiApplication app(argc, argv);

    QTranslator translator;
    //if (translator.load(QLocale(),"AnnotationV3", "_",":"))
    if(translator.load(QLocale(),"AnnotationV3","_",":/languages"))
            app.installTranslator(&translator);

    QQmlApplicationEngine engine;
    Backend backend;
    engine.rootContext()->setContextProperty("backend",&backend);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
