**free
// =======================================================================
//
//  Kurzdokumentation :
//
//  Bereich . . . : RTVUSRAUT
//  Objekt  . . . : RTVUSRA1
//  Beschreibung  : Command: Retrieve User Authority
//  Author  . . . : Thomas Raddatz   <thomas.raddatz@tools400.de>
//  Datum . . . . : 08.01.2015
//
// =======================================================================
//
//  This software is free software, you can redistribute it and/or
//  modify it under the terms of the GNU General Public License (GPL)
//  as published by the Free Software Foundation.
//
//  See GNU General Public License for details.
//          http://www.opensource.org
//          http://www.opensource.org/licenses/gpl-license.html
//
// =======================================================================
//  History:
//
//  Datum       Name          Änderung
//  ----------  ------------  ---------------------------------------
//
// =======================================================================
// >>PRE-COMPILER<<
//   >>CRTCMD<< CRTRPGMOD    MODULE(&LI/&OB) +
//                           SRCFILE(&SL/&SF) +
//                           SRCMBR(&SM);
//   >>COMPILE<<
//     >>PARM<< TRUNCNBR(*NO);
//     >>PARM<< DBGVIEW(*LIST);
//   >>END-COMPILE<<
//   >>EXECUTE<<
// >>END-PRE-COMPILER<<
// =======================================================================
ctl-opt main(RTVUSRAUT_main);
/copy qrtvusraut,h_spec
// =======================================================================

/copy qrtvusraut,rtvusra1_h
/copy qrtvusraut,qsyrusra

dcl-ds qObj_t qualified template;
  name char(10);
  lib  char(10);
end-ds;

dcl-ds errCode_t qualified template;
  bytPrv     int(10);
  bytAvl     int(10);
  excID      char(7);
  reserved_1 char(1); //               RAD
  excDta     char(256); //               RAD
end-ds;

// ------------------------------------------------------------------
//  Program entry point
// ------------------------------------------------------------------
dcl-proc RTVUSRAUT_main;
  dcl-pi *n;
    i_qObj    likeds(qObj_t) const;
    i_objType char(10) const;
    i_usrPrf  char(10) const;
    o_auth    char(10) options(*nopass: *omit);
  end-pi;

  dcl-c p_auth 4;

  dcl-ds qObj likeds(qObj_t) inz;
  dcl-ds usra0100 likeds(usra0100_t) inz;
  dcl-ds errCode likeds(errCode_t) inz;

  clear errCode;
  QSYRUSRA(usra0100: %size(usra0100): 'USRA0100'
           : i_usrPrf: i_qObj: i_objType: errCode);

  if (%parms() >= p_auth and %addr(o_auth) <> *null);
    o_auth = usra0100.objAut;
  endif;

  *inlr = *on;

end-proc;

