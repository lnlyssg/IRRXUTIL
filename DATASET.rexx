/* REXX */                                                            
/* Basic IRRXUTIL example to pull in dataset profile and spit out   */
/* basic RACF info. z/OS 2.4 and higher only                        */
                                                                      
PROFILE = 'SYS1.PARMLIB'                                              
myrc=IRRXUTIL("EXTRACT","DATASET",profile,"RACF","","MATCH")          
/* error handling */                                                  
if (word(myrc,1)<>0) then do                                          
   say "MYRC="myrc                                                    
   say "An error occurred - probably no profile"                      
   exit 1                                                             
end                                                                   
/* output */                                                          
say "Profile: "RACF.PROFILE                                           
say "Owner: "RACF.BASE.OWNER.1                                        
say "UACC: "RACF.BASE.UACC.1                                          
Say "ACL:"                                                            
do a=1 to RACF.BASE.ACLCNT.REPEATCOUNT                                
  Say " "||RACF.BASE.ACLID.a||":"||RACF.BASE.ACLACS.a                 
end                                                                   