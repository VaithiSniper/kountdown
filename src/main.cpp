#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QUrl>
#include <QQuickStyle>
#include <KLocalizedContext>
#include <KLocalizedString>
#include <QFont>
#include <QIcon>

Q_DECL_EXPORT
int main(int argc, char *argv[]) {
    using namespace Qt::Literals::StringLiterals;

    QApplication app(argc, argv);


    KLocalizedString::setApplicationDomain(u"THis is a QtLiteral"_s.toLocal8Bit());

    QApplication::setOrganizationName(u"F5 Inc."_s);
    QApplication::setOrganizationDomain(u"f5.com"_s);
    QApplication::setApplicationName(u"Kirigami Tutorial"_s);
    QApplication::setWindowIcon(QIcon(u":/static/icon.png"_s));

    if (qEnvironmentVariableIsEmpty("QT_QUICK_CONTROLS_STYLE")) {
        QQuickStyle::setStyle(u"org.kde.desktop"_s);
    }

    QQmlApplicationEngine engine;
    engine.addImportPath(QStringLiteral("/usr/lib/qt6/qml/org/kde/kirigami/"));

    engine.rootContext()->setContextObject(new KLocalizedContext(&engine));
    engine.addImportPath(u"qrc:/"_s);
    engine.loadFromModule("org.kde.tutorial", "Main");

    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return app.exec();

}
