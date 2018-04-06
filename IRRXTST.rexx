/* REXX */                                                                      
/* Basic IRRXUTIL example to pull in class and profile and spit out   */        
/* basic RACF info.                                                   */        
say "Full class name?"                                                          
parse upper pull class                                                          
say "Profile?"                                                                  
parse upper pull profile                                                        
myrc=IRRXUTIL("EXTRACT",class,profile,"RACF","","FALSE")                        
/* error handling */                                                            
if (word(myrc,1)<>0) then do                                                    
   say "MYRC="myrc                                                              
   say "An error occurred - probably no profile"                                
   exit 1                                                                       
end                                                                             
/* output */                                                                    
say "Class: "RACF.CLASS                                                         
say "Profile: "RACF.PROFILE                                                     
say "Owner: "RACF.BASE.OWNER.1                                                  
say "UACC: "RACF.BASE.UACC.1                                                    
Say "ACL:"                                                                      
do a=1 to RACF.BASE.ACLCNT.REPEATCOUNT                                          
Say " "||RACF.BASE.ACLID.a||":"||RACF.BASE.ACLACS.a                             
end                                                                             
