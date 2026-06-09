**free

//  Retrieve User Authority to Object (QSYRUSRA) API
dcl-pr QSYRUSRA extpgm('QSYRUSRA');
  o_rcvVar    char(65535) options(*varsize);
  i_rcvVarLen int(10) const;
  i_format    char(8) const;
  i_usrPrf    char(10) const;
  i_qObj      char(20) const;
  i_objType   char(10) const;
  io_errCode  char(65535) options(*varsize);
end-pr;

dcl-ds usra0100_t qualified template;
  bytRet        int(10);
  bytAvl        int(10);
  objAut        char(10);
  autLstMgmt    char(1);
  objOper       char(1);
  objMgmt       char(1);
  objExist      char(1);
  dataRead      char(1);
  dataAdd       char(1);
  dataUpdate    char(1);
  dataDelete    char(1);
  autLst        char(10);
  autSrc        char(2);
  someAdpAut    char(1);
  adpAut        char(10);
  adpAutLstMgmt char(1);
  adpObjOper    char(1);
  adpObjMgmt    char(1);
  adpObjExist   char(1);
  adpObjRead    char(1);
  adpObjAdd     char(1);
  adpObjUpdate  char(1);
  adpObjDelete  char(1);
  adpObjExec    char(1);
  reserved_1    char(10);
  adpObjAlter   char(1);
  adpObjRef     char(1);
  reserved_2    char(10);
  dataExec      char(1);
  reserved_3    char(10);
  objAlter      char(1);
  objRef        char(1);
  aspDevNmeLib  char(10);
  aspDevNmeObj  char(10);
  reserved_4    char(3);
  ofsGrpInf     int(10);
  numGrpE       int(10);
end-ds;
//  char(*)     Group information table repeated for each of the
//              user's groups

