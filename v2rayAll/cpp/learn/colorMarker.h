#include <QObject>
#include <QColor>
#include <QString>
#include <QDateTime>
#include <QTimerEvent>
#include <QRandomGenerator>
#include <QDebug>
#include <string>

class ColorMaker: public QObject
{
    Q_OBJECT
    Q_ENUMS(GenerateAlgorithm)
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QColor timeColor READ timeColor)
public:
    ColorMaker();
    ~ColorMaker();

    enum GenerateAlgorithm {
        RandomRGB,
        RandomRed,
        RandomGreen,
        RandomBlue,
        LinearIncrease
    };

    QColor color() const;
    void setColor(const QColor &color);
    QColor timeColor() const;

    Q_INVOKABLE GenerateAlgorithm algorithm() const;
    Q_INVOKABLE void setAlgorithm(GenerateAlgorithm algorithm);    // 颜色生成算法

signals:
    void colorChanged(const QColor &color);
    void currentTime(const QString &strTime);

public slots:
    void start();
    void stop();

protected:
    void timerEvent(QTimerEvent *event) override;

private:
    GenerateAlgorithm m_algorithm;
    QColor m_currentColor;
    int m_nColorTimer;
};
