/* REXX */                                                        
/* Extract user segments */                                       
theVar  = "irrx"                                                  
theProfile = 'EAJYT10'                                            
theClass = 'USER'                                                 
irrRC = IRRXUTIL('EXTRACT',theClass,theProfile,theVar,"",'FALSE') 
/*say irrRC*/                                                     
say "Class:   " irrx.CLASS                                        
say "Profile: " irrx.PROFILE                                      
say "There are" irrx.0 "segments"                                 
do s = 1 to irrx.0                                                
 say "Segment available:" irrx.s                                  
  if irrx.s = "TSO" then                                          
    do t = 1 to irrx.TSO.0                                        
      say irrx.TSO.t                                              
    end                                                           
  if irrx.s = "OMVS" then                                         
    do o = 1 to irrx.OMVS.0                                       
      say irrx.OMVS.o                                             
    end                                                           
  if irrx.s = "NETVIEW" then                                      
    do n = 1 to irrx.NETVIEW.0                                    
      say irrx.NETVIEW.n                                          
    end                                                           
  if irrx.s = "CSDATA" then                                       
    do c = 1 to irrx.CSDATA.0                                     
      say irrx.CSDATA.c                                           
    end  
end      
exit     
