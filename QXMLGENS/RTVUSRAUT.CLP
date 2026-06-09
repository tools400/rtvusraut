/* ---------------------------------------------------------------------------*/
/* EXPJRNE    - SCRIPT MEMBER                                                 */
/* Use commands  xmlgenINC (generate text for install pgm)                    */
/*               xmlgenMBR (to define source members                          */
/*               xmlgenCMD (execute qcmdexc at run time                       */
/* Put &TOLIB where you want user selected lib at run time.                   */
   DCL &TOLIB *CHAR 10
/* -------------------------------------------------------------------------- */
/* >>PRE-COMPILER<<                                                           */
/*   >>CRTCMD<<  XMLGEN  XMLSCRIPT(&SM) SCRIPTSRCF(&SL/&SF);                  */
/*   >>IMPORTANT<<                                                            */
/*     >>PARM<<  SRCTOFILE(&LI/QXML);                                         */
/*     >>PARM<<  XMLMBR(*SCRIPT);                                             */
/*     >>PARM<<  ENCODING('ISO-8859-1');                                      */
/*     >>PARM<<  AUTHOR('Thomas Raddatz');                                    */
/*   >>END-IMPORTANT<<                                                        */
/*   >>EXECUTE<<                                                              */
/* >>END-PRE-COMPILER<<                                                       */
/* -------------------------------------------------------------------------- */
             XMLGENINC  XINCLUDE(*YES)

             XMLGENVRS XSRCFILE(QRTVUSRAUT) XSRCLIB(RTVUSRAUTD) XSRCMBR(COPYRIGHT)

             XMLGENSET  XVAR(&SRCFILE) XVALUE(QRTVUSRAUT)

/* ---------------------------------- */
/*  Deploy source member              */
/* ---------------------------------- */
             XMLGENMBR  XMBR(A_INSTALL ) XMBRATR(CLLE  ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*PGM   ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(A_README  ) XMBRATR(TXT   ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*PGM) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(COPYRIGHT ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*MODULE) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(H_SPEC    ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*MODULE) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(QSYRUSRA  ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*MODULE) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(RTVUSRA   ) XMBRATR(MAKPGM) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*PGM) +
                          XGENCRT(*NO)  XPARAM(*BLANKS)

             XMLGENMBR  XMBR(RTVUSRA1_H) XMBRATR(RPGLE ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*MODULE) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(RTVUSRA1  ) XMBRATR(RPGLE ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*MODULE) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(RTVUSRAUT ) XMBRATR(CMD   ) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*CMD   ) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

             XMLGENMBR  XMBR(RTVUSRAUTP) XMBRATR(PNLGRP) +
                          XFROMSRCF(QRTVUSRAUT  ) XFROMSRCL(RTVUSRAUTD) +
                          XTOSRCF(QRTVUSRAUT  ) XOBJTYPE(*PNLGRP) +
                          XGENCRT(*NO ) XPARAM(*BLANK)

/* ---------------------------------- */
/*  Create objects                    */
/* ---------------------------------- */
             XMLGENCMD  XCMD(CRTBNDCL PGM(&TOLIB/A_INSTALL) +
                          SRCFILE(&TOLIB/QRTVUSRAUT  ) SRCMBR(*PGM) +
                          DFTACTGRP(*NO) ACTGRP(*NEW) +
                          DBGVIEW(*LIST)) XDLTSPLF(A_INSTALL)

             XMLGENCMD  XCMD(CALL PGM(&TOLIB/A_INSTALL) +
                             PARM('&TGTRLS' '&SRCFILE' '&TOLIB'))
             XMLGENCMD  XCMD(DLTPGM PGM(&TOLIB/A_INSTALL))

