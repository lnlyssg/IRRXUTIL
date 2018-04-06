/* REXX */
/* Extract user info and tells you what is available */
theVar  = "irrx"
theProfile = 'IBMUSER'
theClass = 'USER'
irrRC = IRRXUTIL('EXTRACT',theClass,theProfile,theVar,"",'FALSE')
/*say irrRC*/
say "Class:   " irrx.CLASS
say "Profile: " irrx.PROFILE
say "There are" irrx.0 "segments"
do s = 1 to irrx.0
 seg = irrx.s
 say "Segment info:" seg
    do t = 1 to irrx.seg.0
       stem = irrx.seg.t
        do i = 1 to irrx.seg.stem.0
           say seg ":" irrx.seg.t ":" irrx.seg.stem.i
        end
    end
end
exit