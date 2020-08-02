#include <QObject>
#include <QColor>
#include <QString>
#include <string>

class ColorMaker: public QObject
{
    Q_OBJECT
    Q_ENUMS(GenerateAlgorithm)
public:
    ColorMaker(QObject *parent() = 0);
    ~ColorMaker();

    enum GenerateAlgorithm {
        RandomRGB,
        RandomRed,
        RandomGreen,
        RandomBlue,
        LinearIncrease
    };

    Q_INVOKABLE GenerateAlgorithm algorithm() const;
    Q_INVOKABLE void setAlgorithm(GenerateAlgorithm &algorithm);    // 颜色生成算法

signals:
    void colorChanged(const QColor &color);
    void currentTime(const QString &strTime);

public slots:
    void start();
    void stop();
};
