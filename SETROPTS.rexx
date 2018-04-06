/* REXX */
/* Extract the SETROPTS settings using IRRXUTIL and list stuff     */
myrc=IRRXUTIL("EXTRACT","_SETROPTS","_SETROPTS","RES")
if (word(myrc,1)<>0) then do
   say "MYRC="myrc
   say "An IRRXUTIL or R_admin error occurred "
   exit 1
end

do s = 1 to RES.BASE.0
 setr = RES.BASE.s
 say "SETROPTS section" setr "has" RES.BASE.setr.0 "entry/entries"
 if RES.BASE.setr.0 = 0 then iterate
    do t = 1 to RES.BASE.setr.0
       stem = RES.BASE.setr.t
       say setr stem
    end
end