/* REXX */
/* Extract user info */
theVar  = "irrx"
theProfile = 'IBMUSER'
theClass = 'USER'
irrRC = IRRXUTIL('EXTRACT',theClass,theProfile,theVar,"",'FALSE')
say irrRC
say irrx.CLASS
say irrx.PROFILE
say irrx.BASE.0 "other values available:"
do i = 1 to irrx.BASE.0
 say irrx.BASE.i
end
exit