#!/usr/bin/perl -w
use blib;
use KDE;
use KDE::app;

$b = new KDE::TMainWindow;
$menubar = new KDE::MenuBar($b);
$hellopop = new KDE::PopupMenu("Say hello");
$hellopop->insertItem("Howd&y");
$hellopop->insertItem("H&i");
$hellopop->insertItem("&Aloha");
$b->setMenu($menubar);
$menubar->insertItem("&Hello", $hellopop);
$app->setMainWidget($b);
$b->show;
exit $app->exec;
