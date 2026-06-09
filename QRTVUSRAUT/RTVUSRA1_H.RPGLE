**free
/if not defined(RTVUSRA1_H)
/define RTVUSRA1_H

//  Program entry point
dcl-pr RTVUSRAUT_main extpgm('RTVUSRAUT');
  i_qObj    likeds(qObj_t) const;
  i_objType char(10) const;
  i_usrPrf  char(10) const;
  o_auth    char(10) options(*nopass: *omit);
end-pr;

/endif
