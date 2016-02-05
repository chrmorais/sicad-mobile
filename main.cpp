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
    QFile dfile("./sicad-mobile.db");
    if (!dfile.exists()) {
        QFile odfile(":/sicad-mobile.db.template");
        if (odfile.exists())
        {
             odfile.copy("./sicad-mobile.db");
             QFile::setPermissions("./sicad-mobile.db", QFile::WriteOwner | QFile::ReadOwner);
        }
    }
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("./sicad-mobile.db");
    if (!db.open()) {
        engine.rootContext()->setContextProperty("fromdb", "Cannot open database");
        return;
    }

    const QString queryStr = QString::fromLatin1("SELECT * FROM alunos order by nome");
    QSqlQuery query(queryStr);
    if (!query.exec()) {
        engine.rootContext()->setContextProperty("fromdb", "Query failed");
        return;
    }
    if (query.next()) {
        engine.rootContext()->setContextProperty("fromdb", query.value("nome"));
    }
    QSqlQuery query2("insert into alunos values('20150104', 'Asdrobaldo Pinheiro')");
    query2.exec();

    return;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    createConnection(engine);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
