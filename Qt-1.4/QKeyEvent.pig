#include <qkeycode.h>
#include <qevent.h>

struct QKeyEvent : QEvent {
    QKeyEvent(const QKeyEvent &);
    QKeyEvent(int, int, int, int);
    void accept();
    int ascii() const;
    void ignore();
    bool isAccepted() const;
    int key() const;
    int state() const;
} Qt::KeyEvent;

extern const uint SHIFT;
extern const uint CTRL;
extern const uint ALT;
extern const uint ASCII_ACCEL;

const int Key_Escape;
const int Key_Tab;
const int Key_Backtab;
const int Key_Backspace;
const int Key_Return;
const int Key_Enter;
const int Key_Insert;
const int Key_Delete;
const int Key_Pause;
const int Key_Print;
const int Key_SysReq;
const int Key_Home;
const int Key_End;
const int Key_Left;
const int Key_Up;
const int Key_Right;
const int Key_Down;
const int Key_Prior;
const int Key_PageUp;
const int Key_Next;
const int Key_PageDown;
const int Key_Shift;
const int Key_Control;
const int Key_Meta;
const int Key_Alt;
const int Key_CapsLock;
const int Key_NumLock;
const int Key_ScrollLock;
const int Key_F1;
const int Key_F2;
const int Key_F3;
const int Key_F4;
const int Key_F5;
const int Key_F6;
const int Key_F7;
const int Key_F8;
const int Key_F9;
const int Key_F10;
const int Key_F11;
const int Key_F12;
const int Key_F13;
const int Key_F14;
const int Key_F15;
const int Key_F16;
const int Key_F17;
const int Key_F18;
const int Key_F19;
const int Key_F20;
const int Key_F21;
const int Key_F22;
const int Key_F23;
const int Key_F24;
const int Key_F25;
const int Key_F26;
const int Key_F27;
const int Key_F28;
const int Key_F29;
const int Key_F30;
const int Key_F31;
const int Key_F32;
const int Key_F33;
const int Key_F34;
const int Key_F35;
const int Key_Space;
const int Key_Exclam;
const int Key_QuoteDbl;
const int Key_NumberSign;
const int Key_Dollar;
const int Key_Percent;
const int Key_Ampersand;
const int Key_Apostrophe;
const int Key_ParenLeft;
const int Key_ParenRight;
const int Key_Asterisk;
const int Key_Plus;
const int Key_Comma;
const int Key_Minus;
const int Key_Period;
const int Key_Slash;
const int Key_0;
const int Key_1;
const int Key_2;
const int Key_3;
const int Key_4;
const int Key_5;
const int Key_6;
const int Key_7;
const int Key_8;
const int Key_9;
const int Key_Colon;
const int Key_Semicolon;
const int Key_Less;
const int Key_Equal;
const int Key_Greater;
const int Key_Question;
const int Key_At;
const int Key_A;
const int Key_B;
const int Key_C;
const int Key_D;
const int Key_E;
const int Key_F;
const int Key_G;
const int Key_H;
const int Key_I;
const int Key_J;
const int Key_K;
const int Key_L;
const int Key_M;
const int Key_N;
const int Key_O;
const int Key_P;
const int Key_Q;
const int Key_R;
const int Key_S;
const int Key_T;
const int Key_U;
const int Key_V;
const int Key_W;
const int Key_X;
const int Key_Y;
const int Key_Z;
const int Key_BracketLeft;
const int Key_Backslash;
const int Key_BracketRight;
const int Key_AsciiCircum;
const int Key_Underscore;
const int Key_QuoteLeft;
const int Key_BraceLeft;
const int Key_Bar;
const int Key_BraceRight;
const int Key_AsciiTilde;
const int Key_nobreakspace;
const int Key_exclamdown;
const int Key_cent;
const int Key_sterling;
const int Key_currency;
const int Key_yen;
const int Key_brokenbar;
const int Key_section;
const int Key_diaeresis;
const int Key_copyright;
const int Key_ordfeminine;
const int Key_guillemotleft;
const int Key_notsign;
const int Key_hyphen;
const int Key_registered;
const int Key_macron;
const int Key_degree;
const int Key_plusminus;
const int Key_twosuperior;
const int Key_threesuperior;
const int Key_acute;
const int Key_mu;
const int Key_paragraph;
const int Key_periodcentered;
const int Key_cedilla;
const int Key_onesuperior;
const int Key_masculine;
const int Key_guillemotright;
const int Key_onequarter;
const int Key_onehalf;
const int Key_threequarters;
const int Key_questiondown;
const int Key_Agrave;
const int Key_Aacute;
const int Key_Acircumflex;
const int Key_Atilde;
const int Key_Adiaeresis;
const int Key_Aring;
const int Key_AE;
const int Key_Ccedilla;
const int Key_Egrave;
const int Key_Eacute;
const int Key_Ecircumflex;
const int Key_Ediaeresis;
const int Key_Igrave;
const int Key_Iacute;
const int Key_Icircumflex;
const int Key_Idiaeresis;
const int Key_ETH;
const int Key_Ntilde;
const int Key_Ograve;
const int Key_Oacute;
const int Key_Ocircumflex;
const int Key_Otilde;
const int Key_Odiaeresis;
const int Key_multiply;
const int Key_Ooblique;
const int Key_Ugrave;
const int Key_Uacute;
const int Key_Ucircumflex;
const int Key_Udiaeresis;
const int Key_Yacute;
const int Key_THORN;
const int Key_ssharp;
const int Key_agrave;
const int Key_aacute;
const int Key_acircumflex;
const int Key_atilde;
const int Key_adiaeresis;
const int Key_aring;
const int Key_ae;
const int Key_ccedilla;
const int Key_egrave;
const int Key_eacute;
const int Key_ecircumflex;
const int Key_ediaeresis;
const int Key_igrave;
const int Key_iacute;
const int Key_icircumflex;
const int Key_idiaeresis;
const int Key_eth;
const int Key_ntilde;
const int Key_ograve;
const int Key_oacute;
const int Key_ocircumflex;
const int Key_otilde;
const int Key_odiaeresis;
const int Key_division;
const int Key_oslash;
const int Key_ugrave;
const int Key_uacute;
const int Key_ucircumflex;
const int Key_udiaeresis;
const int Key_yacute;
const int Key_thorn;
const int Key_ydiaeresis;
const int Key_unknown;