/* REXX */
/*********************************************************************/
/* Sample Rexx to check the status of RRSF nodes, if in error then   */
/* try and fix.                                                      */
/*********************************************************************/
/* Extract RRSF information.  Exit on error.                         */
/*********************************************************************/
myrc=IRRXUTIL("EXTRACT","_RRSFEXTR","_RRSFEXTR","RRSF")
If myrc <> "0 0 0 0 0" Then
  Do
    say "R_admin callable service error:" myrc
    exit 2
  End
/*********************************************************************/
/* Check RRSF status and fix if broken                               */
/*********************************************************************/
do i = 1 to RRSF.0
  if RRSF.i.STATE <> "128" then do       /* 128 is OPERATIVE */
    say "Node" RRSF.i.NODE " is" RRSF.i.STATE_STRING
    fix = "RACFTARGET NODE(" || RRSF.i.NODE || ") OPERATIVE"
    Call Outtrap Dummy.
    address TSO 'CONSOLE DEACTIVATE'
    Call Outtrap 'Off'
    address TSO 'CONSPROF SOLDISPLAY(NO)'
    address TSO 'CONSOLE ACTIVATE'
    ADDRESS CONSOLE fix
    address TSO "CONSOLE DEACTIVATE"
  end
end
Exit 0
