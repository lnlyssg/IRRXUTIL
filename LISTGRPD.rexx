/* REXX */
/* Based on XLISTRGP but writes to datasets rather than terminal      */
/* Amend line 7 to change input list of groups.                       */
/* Output written to members at lines 12 and 13.                      */

/* Get the list of groups */
"Alloc fi(grplist) da('" || userid() || ".DATA(GRPLIST)') shr reuse"
"EXECIO * DISKR grplist (stem grps. finis"
"Free Fi(grplist)"

/* Ready the output files */
"ALLOC DD(outfile) DA('" || userid() || ".DATA(OUTPUT)') SHR REUSE"
"ALLOC DD(errors) DA('" || userid() || ".DATA(ERRORS)') SHR REUSE"

/* write headers */
x = wl(" Group    User ID    Name                  Created  Last Use")
x = wl(" ======== ========   ====================  =======  ========")

/* go through group list */
do j = 1 to grps.0
 profile = strip(grps.j)
/*-------------------------------------------------------------------*/
/* Use IRRXUTIL to extract the group into the stem named "GRP".      */
/* connection list. If 12 12 4 4 4 then there's no profile so the    */
/* group doesn't exist.                                              */
/*-------------------------------------------------------------------*/
myrc=IRRXUTIL("EXTRACT","GROUP",profile,"GRP")
if (word(myrc,1)<>0) then do
   if myrc = "12 12 4 4 4" then
   x = wl2("Group" profile "does not exist")
   iterate
end

/*-------------------------------------------------------------------*/
/* If there are no connected users for this group then write to      */
/* error file                                                        */
/*-------------------------------------------------------------------*/
If GRP.BASE.CONNECTS.REPEATCOUNT = '' then do
   x = wl2("Group" profile "has no users connected")
   iterate
end
/*-------------------------------------------------------------------*/
/* For each connected user, extract the user's details using IRRXUTIL*/
/*-------------------------------------------------------------------*/
ucnt = GRP.BASE.CONNECTS.REPEATCOUNT
do i = 1 to ucnt
  ACUSERID = GRP.BASE.GUSERID.i
  ACLVL = GRP.BASE.GAUTH.i
  /* -------------------------------------------------------------- */
  /* Call IRRXUTIL to get the user's name, createdate & last used   */
  /* date and write out.                                            */
  /* -------------------------------------------------------------- */
  myrc=IRRXUTIL("EXTRACT","USER",ACUSERID,"TEST")
  if (word(myrc,1)=0) then
    ACNAME = TEST.BASE.NAME.1
    CREDATE = TEST.BASE.CREATDAT.1
    LJDATE = TEST.BASE.LASTDATE.1
    x = wl(" "Left(profile,8) Left(ACUSERID,10) Left(ACNAME,21),
                    CREDATE LJDATE)
  end
end
/* close the output datasets and finish */
"Execio 0 diskw outfile (finis"
"Free Fi(Outfile)"
"Execio 0 diskw errors (finis"
"Free Fi(errors)"

exit 0
/* write output line */
wl:
arg lineo
push lineo
"EXECIO 1 DISKW outfile"
return 0
/* write error line */
wl2:
arg lineo
push lineo
"EXECIO 1 DISKW errors"
return 0