/* REXX */                                                             
/* IRRXUTIL example to pull in dataset profile and generate commands */
/* to set it up from scratch.                                        */
                                                                       
PROFILE = 'SYS1.PARMLIB'                                               
myrc=IRRXUTIL("EXTRACT","DATASET",profile,"RACF","","MATCH")           
/* error handling */                                                   
if (word(myrc,1)<>0) then do                                           
   say "MYRC="myrc                                                     
   say "An error occurred - probably no profile"                       
   exit 1                                                              
end                                                                    
/* output */                                                           
say "ad ('"RACF.PROFILE"') GEN ow("RACF.BASE.OWNER.1")" ,              
 "UACC("RACF.BASE.UACC.1")"                                            
do a=1 to RACF.BASE.ACLCNT.REPEATCOUNT                                 
  say "PE '"RACF.PROFILE"' GEN ID("RACF.BASE.ACLID.a")" ,              
      "AC("RACF.BASE.ACLACS.a")"                                       
end                                                                    
