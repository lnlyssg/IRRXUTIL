/* REXX */
/* Go through class specified and list all profiles          */
cls = 'SDSF'
RACF.R_PROFILE = ' '
RACF.R_GENERIC = 'FALSE' /* starts with specifics then generics */
Do Forever
myrc=IRRXUTIL("EXTRACTN",cls,RACF.R_PROFILE,"RACF","R_",RACF.R_GENERIC)
  If (Word(myrc,1) <> 0) Then Do
    Say myrc
    Leave
  End
  Say RACF.R_PROFILE /* print profile name */
End