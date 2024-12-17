/* Rexx */                                                             
/* Call this with an HLQ e.g. ex 'userid.isprlib' 'SYS1' and it will */
/* generate AD, ALD and PE commands to (re)create the dataset        */
/* profiles. You probably want to add an EXECIO to write the output  */
/* to a dataset....                                                  */
if hlq = '' then exit                                                  
parse arg hlq                                                          
                                                                       
cls = 'DATASET'                                                        
RACF.R_PROFILE = hlq                                                   
RACF.R_GENERIC = 'TRUE'                                                
do forever                                                             
myrc=IRRXUTIL("EXTRACTN",cls,RACF.R_PROFILE,"RACF","R_",RACF.R_GENERIC)
  if (word(myrc,1) <> 0) then do                                       
    say myrc                                                           
    leave                                                              
  end                                                                  
  /* finish the extract once the HLQ changes */                        
  parse var RACF.R_PROFILE xhlq . '.' . . . .                          
  if xhlq ¬= hlq then exit 1                                           
  /* Spit out RACF commands */                                         
  say "AD '"RACF.R_PROFILE"' GEN OW("RACF.R_BASE.R_OWNER.1")",         
      "UACC("RACF.R_BASE.R_UACC.1")"                                   
  say "ALD '"RACF.R_PROFILE"' GEN DATA('"RACF.R_BASE.R_DATA.1"')"      
  do a=1 to RACF.R_BASE.R_ACLCNT.R_REPEATCOUNT                         
    say "PE '"RACF.R_PROFILE"' GEN ID("RACF.R_BASE.R_ACLID.a")",   
        "AC("RACF.R_BASE.R_ACLACS.a")"                             
  end                                                              
end                                                                
