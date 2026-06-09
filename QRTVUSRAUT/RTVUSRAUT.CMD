/* =================================================================== */
/*                                                                     */
/*  Kurzdokumentation :                                                */
/*                                                                     */
/*  Bereich . . . : RTVUSRAUT                                          */
/*  Objekt  . . . : RTVUSRA1                                           */
/*  Beschreibung  : Command: Retrieve User Authority                   */
/*  Author  . . . : Thomas Raddatz   <thomas.raddatz@tools400.de>      */
/*  Datum . . . . : 08.01.2015                                         */
/*                                                                     */
/* =================================================================== */
/*                                                                     */
/*  This software is free software, you can redistribute it and/or     */
/*  modify it under the terms of the GNU General Public License (GPL)  */
/*  as published by the Free Software Foundation.                      */
/*                                                                     */
/*  See GNU General Public License for details.                        */
/*          http://www.opensource.org                                  */
/*          http://www.opensource.org/licenses/gpl-license.html        */
/*                                                                     */
/* =================================================================== */
/*  History:                                                           */
/*                                                                     */
/*  Datum       Name          Dnderung                                 */
/*  ----------  ------------  ---------------------------------------  */
/*                                                                     */
/* =================================================================== */
/* >>PRE-COMPILER<<                                                    */
/*   >>CRTCMD<< CRTCMD       CMD(&LI/RTVUSRAUT) +                      */
/*                           SRCFILE(&SL/&SF) +                        */
/*                           SRCMBR(&SM);                              */
/*   >>COMPILE<<                                                       */
/*     >>PARM<< PGM(&LI/RTVUSRAUT);                                    */
/*     >>PARM<< HLPPNLGRP(&LI/RTVUSRAUT);                              */
/*     >>PARM<< HLPID(RTVUSRAUT);                                      */
/*     >>PARM<< ALLOW(*BPGM *IPGM *BREXX *IREXX *BMOD *IMOD);          */
/*   >>END-COMPILE<<                                                   */
/*   >>EXECUTE<<                                                       */
/* >>END-PRE-COMPILER<<                                                */
/* =================================================================== */
           CMD      PROMPT('Retrieve User Authority')

             PARM       KWD(OBJ)                         +
                          TYPE(QUAL1)                    +
                          MIN(1)                         +
                          PROMPT('Object')

             PARM       KWD(OBJTYPE)                     +
                          TYPE(*CHAR)                    +
                          LEN(10)                        +
                          MIN(1)                         +
                          PROMPT('Object type')

             PARM       KWD(USER)                        +
                          TYPE(*NAME)                    +
                          LEN(10)                        +
                          DFT(*CURRENT)                  +
                          SPCVAL((*CURRENT)              +
                                 (*PUBLIC ))             +
                          PROMPT('User')

             PARM       KWD(AUT)                         +
                          TYPE(*CHAR)                    +
                          LEN(10)                        +
                          RTNVAL(*YES)                   +
                          PROMPT('CL var for AUT          (10)')

/* ----------------------------------------------------------------- */

 QUAL1:      QUAL       TYPE(*NAME)                      +
                          LEN(10)                        +
                          MIN(1)
             QUAL       TYPE(*NAME)                      +
                          LEN(10)                        +
                          DFT(*LIBL)                     +
                          SPCVAL((*LIBL  )               +
                                 (*CURLIB))             +
                          PROMPT('Library')

