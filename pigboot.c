/*
 * Bootstrap for PerlKDE
 *
 * Copyright (C) 2000, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README.LICENSE file which should be included with this library.
 *
 */

#include "pig_KApplication.h"
#include "pigperl.h"
#include "pigsymbol.h"
#include "pigclassinfo.h"
#include "pigconstant.h"

PIG_DECLARE_IMPORT_TABLE(pig)
PIG_DECLARE_EXPORT_TABLE(PIG_KDE)
PIG_DECLARE_EXPORT_TABLE(pigtype_kde)

PIG_GLOBAL_EXPORT_TABLE(pig)
    PIG_EXPORT_SUBTABLE(PIG_KDE)
    PIG_EXPORT_SUBTABLE(pigtype_kde)
PIG_EXPORT_ENDTABLE

extern struct pig_constant PIG_constant_KDE[];
extern struct pig_classinfo PIG_module[];

void __pig_module_used(const char *pig0) {
    char *pigpm, *pigs;
    pigpm = new char [strlen(pig0) + 4];
    pigs = pigpm;
    while(*pig0) {
        if(*pig0 == ':' && *(pig0 + 1) == ':') {
            *pigs = '/';
            pig0++;
        } else {
            *pigs = *pig0;
        }

        pigs++;
        pig0++;
    }
    strcpy(pigs, ".pm");

//warn("$INC{\"%s\"} = \"%s\";\n", pigpm, __FILE__);

    HV *pighv_inc = perl_get_hv("main::INC", TRUE);
    hv_store(pighv_inc, pigpm, strlen(pigpm), newSVpv(__FILE__, 0), 0);
}

SV *gv_store(const char *name, SV *value) {    // kludge
    GV *gv = gv_fetchpv((char *)name, TRUE | GV_ADDMULTI, SVt_PVGV);
    SvREFCNT_inc(value);
    if(GvSV(gv)) SvREFCNT_dec(GvSV(gv));
    GvSV(gv) = value;
    GvIMPORTED_SV_on(gv);
    return value;
}

static char **pig_create_stringarray_from_av(AV *pigav, int &pigcount) {
    char **pigarray;
    I32 pigcnt, pigidx, pigarg;
    STRLEN n_a;

    pigcnt = av_len(pigav);
    pigarray = new char *[pigcnt + 2];
    pigarg = 0;
    for(pigidx = 0; pigidx <= pigcnt; pigidx++) {
        SV **pigsvp = av_fetch(pigav, pigidx, 0);
        if(pigsvp)
            pigarray[pigarg++] = SvPV(*pigsvp, n_a);
    }
    pigarray[pigarg] = 0;
    pigcount = pigarg;
    return pigarray;
}

extern "C" XS(PIG_KApplication_new) {
    dXSARGS;
    const char *pigclass;
    AV *pigargs;
    STRLEN n_a;

    if(items < 1 || items > 2)
        die("KApplication::new");

    pigclass = SvPV(ST(0), n_a);

    if(!SvROK(ST(1))) {
        pigargs = newAV();
        die("Needed an argument\n");
        // must do something here!!!
    } else {
        pigargs = (AV *)SvRV(ST(1));
        SvREFCNT_inc((SV *)pigargs);
    }

    av_unshift(pigargs, 1);
    av_store(pigargs, 0, newSVsv(perl_get_sv("0", TRUE)));

    char **pigargv;
    int pigargc;
    pigargv = pig_create_stringarray_from_av(pigargs, pigargc);
    av_shift(pigargs);

    KApplication *pigapp;

    if(items > 2) {
	const char *pigappname;
	STRLEN n_a;
	pigappname = SvPV(ST(2), n_a);
	pigapp = new pig_enhanced_KApplication(pigargc, pigargv, pigappname);
    } else {
        pigapp = new pig_enhanced_KApplication(pigargc, pigargv);
    }

    ST(0) = pig_new_castobject(pigapp, "KApplication", pigclass);

    SvREFCNT_dec(pigargs);
    XSRETURN(1);
}


extern "C" XS(PIG_app_import) {
    dXSARGS;
    const char *pigclass = HvNAME(PIGcurcop->cop_stash);
    char *pigvar;
    SV *pigsv;
    SV *pigapp;

    pigapp = perl_get_sv("KDE::app", FALSE);
    if(!pigapp || !SvOK(pigapp)) {
        AV *pigargv;
        int pigcount;
        pigargv = perl_get_av("ARGV", TRUE);

        ENTER;
        SAVETMPS;
        PUSHMARK(sp);
        XPUSHs(sv_2mortal(newSVpv((char *)pig_map_class("KApplication"), 0)));
        XPUSHs(sv_2mortal(newRV((SV *)pigargv)));
        PUTBACK;

        pigcount = perl_call_method("new", G_SCALAR);

        SPAGAIN;

        if(pigcount != 1)
            croak("Cannot call %s::new\n", pig_map_class("KApplication"));

        pigapp = perl_get_sv("KDE::app", TRUE | GV_ADDMULTI);
        sv_setsv(pigapp, POPs);

        PUTBACK;
        FREETMPS;
        LEAVE;
    }

    pigvar = new char[strlen(pigclass) + 7];
    sprintf(pigvar, "%s::app", pigclass);
    gv_store(pigvar, pigapp);
    SvREFCNT_dec(pigapp);
    delete [] pigvar;

    XSRETURN_EMPTY;
}


extern "C" XS(boot_KDE) {
    dXSARGS;

    pig_symbol_exchange(PIG_EXPORTTABLE(pig), PIG_IMPORTTABLE(pig),
			"KDE", "Qt");

    pig_load_classinfo(PIG_module);

    pig_load_constants("KDE", PIG_constant_KDE);

    __pig_module_used("KDE::app");
    newXS("KDE::Application::new", PIG_KApplication_new, __FILE__);
    newXS("KDE::app::import", PIG_app_import, __FILE__);

    XSRETURN_UNDEF;
}
