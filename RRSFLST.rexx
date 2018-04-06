/* REXX */
/*********************************************************************/
/* Extract RRSF information.  Exit on error. z/OS 2.2 and up only    */
/*********************************************************************/
myrc=IRRXUTIL("EXTRACT","_RRSFEXTR","_RRSFEXTR","RRSF")
If myrc <> "0 0 0 0 0" Then
  Do
    say "R_admin callable service error:" myrc
    exit 2
  End
/*********************************************************************/
/* Display lots of RRSF info on each node                            */
/*********************************************************************/
say 'There are' RRSF.0 'RRSF nodes'
do i = 1 to RRSF.0
if RRSF.i.LOCAL = "1" then loc = "Local"
if RRSF.i.LOCAL = "0" then loc = "Remote"
  say "-----------"
  say "Node" i "is" RRSF.i.NODE "and is" loc
  say "Protocol is    " RRSF.i.PROTOCOL
  if RRSF.i.PROTOCOL = "APPC" && RRSF.i.PROTOCOL = "APPC TCP" then do
    say "APPC LUNAME is  " RRSF.i.APPC_LUNAME
    say "APPC MODENAME is" RRSF.i.APPC_MODENAME
    say "APPC TP Name is " RRSF.i.APPC_TP_NAME
    say "APPC listener is" RRSF.i.APPC_LISTENER_STATUS
    say "State code is  "  RRSF.i.STATE
    say "State string is"  RRSF.i.STATE_STRING
  end
  if RRSF.i.PROTOCOL = "TCP" && RRSF.i.PROTOCOL = "APPC TCP" then do
    say "Port is        " RRSF.i.TCP_PORT
    say "Address is     "  RRSF.i.TCP_ADDRESS
    say "IP address is  "  RRSF.i.TCP_IPADDRESS
    say "State code is  "  RRSF.i.STATE
    say "State string is"  RRSF.i.STATE_STRING
  end
  say "Last in date   "  RRSF.i.LAST_INBOUND_DATE
  say "Last in time   "  RRSF.i.LAST_INBOUND_TIME
  say "Last out date  "  RRSF.i.LAST_OUTBOUND_DATE
  say "Last out time  "  RRSF.i.LAST_OUTBOUND_TIME
end
Exit 0