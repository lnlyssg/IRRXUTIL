/* REXX */
/* Extract Resource info */
theVar  = "irrx"
theProfile = 'BPX.SUPERUSER'
theClass = 'FACILITY'
irrRC = IRRXUTIL('EXTRACT',theClass,theProfile,theVar,"",'FALSE')
say irrRC
say irrx.CLASS
say irrx.PROFILE
say irrx.BASE.0 "other values available:"
do i = 1 to irrx.BASE.0
 say irrx.BASE.i
end
exit