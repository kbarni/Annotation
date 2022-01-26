#include "backend.h"
#include <QTextStream>
#include <QFile>
#include <QStandardPaths>
#include <QDebug>

Backend::Backend(QObject *parent) : QObject(parent)
{
    dir.setPath(QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation));
    m_filelist = dir.entryList(QStringList() << "*.ant",QDir::Files);
    m_filelist.push_front(tr("Nouveau fichier..."));
    m_uilist = dir.entryList(QStringList() << "*.ui",QDir::Files);
    m_uilist.push_front(tr("Choisir..."));
    m_uiindex=0;
}

QString Backend::createFunctions(QString s)
{
    QString base;
    QFile file(":/pagebase.yml");
    if(file.open(QIODevice::ReadOnly)) {
        base = file.readAll();
    }
    file.close();
    QString resetfunc,titlefunc,datafunc;
    QStringList sl,tok;
    sl = s.split('\n');
    QString id;
    bool haveid=false;
    for(const QString &line:qAsConst(sl)){
        if(line.contains("id:")){
            id=line.mid(line.indexOf(':')+2);
            haveid=true;
        }
        if((haveid)&&(line.contains("}"))){
            resetfunc+=id+".reset();\n";
            titlefunc+="+"+id+".label+t";
            datafunc+="+"+id+".stringvalue";
            haveid=false;
        }
    }
    return base.arg(resetfunc,titlefunc,datafunc,s,tr("Enregistrer"));
}

QString Backend::getMainPage(QString uifile)
{
    QFile f(dir.path()+"/"+uifile);
    f.open(QFile::ReadOnly);
    QTextStream ts(&f);
    QString s = ts.readAll();
    f.close();
    QString gui = createFunctions(s);
    return gui;
}

void Backend::createFile(QString filename,QString ui,QString projet, QString domaine, QString obs)
{
    if(!filename.endsWith(".ant"))
        filename+=".ant";
    //qDebug()<<"Creating"<<filename;
    m_currentfile=filename;
    QFile f(dir.path()+"/"+m_currentfile);
    f.open(QIODevice::WriteOnly);
    QTextStream ts(&f);
    ts<<ui<<"\n"<<projet<<"\n"<<domaine<<"\n"<<obs<<"\n\n";
    ts<<m_title<<"\n";
    f.close();
    m_filelist.append(m_currentfile);
    emit filelistChanged();
}
void Backend::selectFile(QString filename)
{
    //qDebug()<<filename<<"selected";
    m_currentfile=filename;
}

void Backend::writeData(QString s)
{
    QFile f(dir.path()+"/"+m_currentfile);
    f.open(QIODevice::Append);
    QTextStream ts(&f);
    ts<<s;
    f.close();
}

void Backend::filechanged(QString filename)
{
    QFile f(dir.path()+"/"+filename);
    if(!f.open(QFile::ReadOnly))return;
    QTextStream ts(&f);
    QString m_uifile = ts.readLine();
    m_uiindex=m_uilist.indexOf(m_uifile);
    m_projet = ts.readLine();
    m_domaine = ts.readLine();
    f.close();
    emit projectChanged();
    emit domaineChanged();
    emit uifileChanged();

}
