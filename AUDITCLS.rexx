/* REXX */
/* ----------------------------------------------------------------- */
/* - Extract the SETROPTS settings using IRRXUTIL and list ACTIVE    */
/* - and AUDITED classes                                             */
/* ----------------------------------------------------------------- */
myrc=IRRXUTIL("EXTRACT","_SETROPTS","_SETROPTS","RES")
if (word(myrc,1)<>0) then do
   say "MYRC="myrc
   say "An IRRXUTIL or R_admin error occurred "
   exit 1
end

do i = 1 to RES.BASE.AUDIT_CT.REPEATCOUNT /* find audited classes then*/
  do j = 1 to RES.BASE.CLASSACT_CT.REPEATCOUNT /* find active classes */
    if RES.BASE.CLASSACT.j = RES.BASE.AUDIT.i then do /* if in both...*/
      say RES.BASE.AUDIT.i "is Active and Audited"
    end
  end
end