#ifndef CHANGECOLOR_H
#define CHANGECOLOR_H

#include <QObject>

class ChangeColor : public QObject
{
    Q_OBJECT
public:
    explicit ChangeColor(QObject *parent = nullptr);

signals:

};

#endif // CHANGECOLOR_H
