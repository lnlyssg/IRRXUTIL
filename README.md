# IRRXUTIL samples
### What's IRRXUTIL?
An awesome Rexx interface to RACF. No more issuing LU/RLIST commands and trapping output like some sort of caveman.  
[Official IBM blurb with samples](https://www-03.ibm.com/systems/z/os/zos/features/racf/downloads/irrxutil.html)  
[IRRXUTIL overview presentation by Mark Nelson](https://share.confex.com/share/116/webprogram/Handout/Session8255/share_2011_02_irrxutil.pdf)  

### Why did you create this repo?  
Chatting with a mainframe security buddy of mine a couple of weeks ago I realised that not many people know about IRRXUTIL and even fewer actually use it in anger (mostly thanks to useful tools like zSecure and Vanguard) so I decided to collect and collate some samples.   

### Why should I use it?
Because OUTTRAPping stuff is tedious and annoying.  

### What do I need to use it?  
You will need access to one or more IRR.RADMIN.** profiles in the FACILITY class.  

### What's included here?  
ALLUSR - Lists all possible info that can be extracted for a user  
AUDIT - Simple audit-style report of group connections  
AUDITCLS - Lists RACF classes that are active and audited  
EXTRACTN - Sample for continual extracts  
IBMUSER - Sample for listing an ID  
IDS - Feed in a list of IDs and get info  
IRRXTST - Pull in CLASS and PROFILE and give access list  
LISTGRPD - Modified version of XLISTGRP but read/write to a dataset  
LISTUSR - Sample to list a user's group connections  
RRSFCHK - Sample for how you could use IRRXUTIL to check and fix RRSF issues  
RRSFLST - Lists info on your RRSF nodes  
SETROPTS - Lists all SETROPTS info  
TSTGRP - List a group  
TSTRES - List a resource  
TSTUSR - List a user  
USRSEGS - List the available user segments (including CSDATA)
