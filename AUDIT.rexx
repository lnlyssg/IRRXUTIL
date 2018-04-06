/* REXX */
/* A simple audit Rexx to produce a csv list of connections to a  */
/* group and some basic identifying info                          */
system=PROD
group=SYS1
myrc=IRRXUTIL('EXTRACT','GROUP',group,'GRP')
if (word(myrc,1)<>0) then exit
ucnt = GRP.BASE.CONNECTS.REPEATCOUNT
if ucnt = '' then exit
say 'PROCESSING GROUP' group 'at' time('C')
do i = 1 to ucnt
  ACUSERID = GRP.BASE.GUSERID.i
  myrc2=IRRXUTIL('EXTRACT','USER',ACUSERID,'LIST')
  if (word(myrc2,1)=0) then
    ACNAME   = LIST.BASE.NAME.1
    PROTECTD = LIST.BASE.PROTECTD.1
    DFLTGRP  = LIST.BASE.DFLTGRP.1
    PASSINT  = LIST.BASE.PASSINT.1
    select
      when PROTECTD = 'TRUE' then sysid = 'System'
      when DFLTGRP  = 'SYSSTC' then sysid = 'System'
      when PASSINT  = '' then sysid = 'System'
      otherwise sysid = ''
    end
  say system','group','ACUSERID','ACNAME','sysid
end
EXIT
