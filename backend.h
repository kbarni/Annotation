#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QDir>

class Backend : public QObject
{
    Q_OBJECT
    //Q_PROPERTY(QString mainpage MEMBER m_mainpage NOTIFY mainpageChanged)
    Q_PROPERTY(QStringList filelist MEMBER m_filelist NOTIFY filelistChanged)
    Q_PROPERTY(QStringList uilist MEMBER m_uilist NOTIFY uilistChanged)
    Q_PROPERTY(QString title MEMBER m_title)
    Q_PROPERTY(QString projet MEMBER m_projet NOTIFY projectChanged)
    Q_PROPERTY(QString domaine MEMBER m_domaine NOTIFY domaineChanged)
    Q_PROPERTY(int uiindex MEMBER m_uiindex NOTIFY uifileChanged)

public:
    explicit Backend(QObject *parent = nullptr);
signals:
    void filelistChanged();
    void uilistChanged();
    void projectChanged();
    void domaineChanged();
    void uifileChanged();
public slots:
    QString getMainPage(QString uifile);
    void createFile(QString filename,QString ui,QString projet, QString domaine, QString obs);
    void selectFile(QString filename);
    void filechanged(QString filename);
    void writeData(QString s);
protected:
    QString createFunctions(QString s);
    QDir dir;
    bool havefile;
    QString m_currentfile,m_title;
    QString m_projet,m_domaine;
    int m_uiindex;
    QStringList m_filelist,m_uilist;

};

#endif // BACKEND_H
