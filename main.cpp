#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QSqlDatabase>
#include <QSqlQuery>

#include <QFile>
#include <QDebug>
#include <QQmlContext>
#include <QDateTime>

void createConnection(QQmlApplicationEngine &engine)
{
    QFile dfile("assets:/sicad-mobile.db");
    if (dfile.exists())
    {
         dfile.copy("./sicad-mobile.db");
         QFile::setPermissions("./sicad-mobile.db", QFile::WriteOwner | QFile::ReadOwner);
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./sicad-mobile.db");
    if (!db.open()) {
        engine.rootContext()->setContextProperty("fromdb", "Cannot open database");
        return;
    }

    const QString queryStr = QString::fromLatin1("SELECT * FROM Event WHERE '%1' >= startDate AND '%1' <= endDate order by name").arg("2014-01-01");
    QSqlQuery query(queryStr);
    if (!query.exec()) {
        engine.rootContext()->setContextProperty("fromdb", "Query failed");
        return;
    }
    if (query.next()) {
        engine.rootContext()->setContextProperty("fromdb", query.value("name"));
    }
    QSqlQuery query2("insert into Event values('AAA', '2014-01-01', 36000, '2014-01-01', 39600)");
    query2.exec();

    return;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    createConnection(engine);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    int r = app.exec();
    QFile dfile("./sicad-mobile.db");
    dfile.copy("assets:/sicad-mobile.db");
    return r;
}
