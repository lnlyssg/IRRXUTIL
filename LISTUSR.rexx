/* REXX */
/* XLISTUSR but without using ISPF tables */
parse upper pull profile
if profile="" then profile="IBMUSER"
/*-------------------------------------------------------------------*/
/* Use IRRXUTIL to extract the user ID into the stem named "USR".    */
/*-------------------------------------------------------------------*/
myrc=IRRXUTIL("EXTRACT","USER",profile,"USR")
say ""
if (word(myrc,1)<>0) then do
   say "MYRC="myrc
   say "An error occurred "
   exit 1
end
/*-------------------------------------------------------------------*/
/* Display the groups                                                */
/*-------------------------------------------------------------------*/
say profile "is connected to the following groups:"
do i = 1 to USR.BASE.CONNECTS.REPEATCOUNT
  say USR.BASE.CGROUP.i
end