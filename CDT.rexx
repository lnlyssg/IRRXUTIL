/* REXX */
/* Extract CDT info */
cls = 'CDT'
RACF.R_PROFILE = ' '
RACF.R_GENERIC = 'FALSE'
Do Forever
myrc=IRRXUTIL("EXTRACTN",cls,RACF.R_PROFILE,"RACF","R_",RACF.R_GENERIC)
  If (Word(myrc,1) <> 0) Then Do
    Leave
  End
  /* display some basic CDT info */
  say "Profile:" RACF.R_PROFILE                 /* Profile name */
  say "POSIT  :" RACF.R_CDTINFO.R_CDTPOSIT.1    /* POSIT value */
  say "Max len:" RACF.R_CDTINFO.R_CDTMAXLN.1    /* Maximum length */
  say "First char:" RACF.R_CDTINFO.R_CDTFIRST.1 /* First char */

/* The below lists ALL BASE and CDTINFO segments */
   do i = 1 to RACF.R_BASE.0
     say RACF.R_BASE.i             /* list all base segments */
   end
   do j = 1 to RACF.R_CDTINFO.0    /* list all CDTINFO segments */
     say RACF.R_CDTINFO.j
   end
End