#include <drag.h>

suicidal virtual class KDNDWidget : virtual QWidget {
    KDNDWidget(QWidget * = 0, const char * = 0, WFlags = 0);
    virtual ~KDNDWidget();
    virtual void startDrag(KDNDIcon *, char *, int, int, int, int);
protected:
    virtual void dndMouseMoveEvent(QMouseEvent *);
    virtual void dndMouseReleaseEvent(QMouseEvent *);
    virtual void dragEndEvent();
    virtual Window findRootWindow(QPoint &);
    virtual void mouseMoveEvent(QMouseEvent *);
    virtual void mouseReleaseEvent(QMouseEvent *);
    virtual void rootDropEvent();
    virtual void rootDropEvent(int, int);
} KDE::DNDWidget;
