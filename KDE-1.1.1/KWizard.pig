#include <kwizard.h>

suicidal virtual class KWizard : virtual KDialog {
    KWizard(QWidget * = 0, const char * = 0, bool = false, WFlags = 0);
    virtual ~KWizard();
    int addPage(KWizardPage *);
    virtual void adjustSize();
    bool directionsReflectsPage();
    bool enableArrowButtons();
    bool enablePopupMenu();
    QButton *getCancelButton();
    QButton *getDefaultButton();
    QButton *getHelpButton();
    KDirectionButton *getLeftArrow();
    QPopupMenu *getMenu();
    QButton *getNextButton();
    QButton *getOkButton();
    QButton *getPreviousButton();
    KDirectionButton *getRightArrow();
    const char *getTitle(int);
    void gotoPage(int) slot;
    bool isPageEnabled(int);
    int numPages();
    void setCancelButton();
    void setCancelButton(const char *);
    void setDefaultButton();
    void setDefaultButton(const char *);
    void setDirectionsReflectsPage(bool);
    void setEnableArrowButtons(bool);
    void setEnablePopupMenu(bool);
    void setHelpButton();
    void setHelpButton(const char *);
    void setOkButton();
    void setOkButton(const char *);
    void setPage(int, QWidget *);
    void setPage(int, QString);
    void setPageEnabled(int, bool);
    virtual QSize sizeHint() const;
protected:
    void cancelClicked() slot;
    void cancelclicked() signal;
    void closed() signal;
    virtual void closeEvent(QCloseEvent *);
    void defaultClicked() slot;
    void defaultclicked(int) signal;
    virtual bool eventFilter(QObject *, QEvent *);
    void helpClicked() slot;
    void helpclicked(int) signal;
    void nextPage() slot;
    void nomorepages(bool, bool) signal;
    void okClicked() slot;
    void okclicked() signal;
    QSize pageSize();
    virtual void paintEvent(QPaintEvent *);
    void popup(QPoint) signal;
    void previousPage() slot;
    virtual void resizeEvent(QResizeEvent *);
    void selected(int) signal;
    void setSizes();
} KDE::Wizard;