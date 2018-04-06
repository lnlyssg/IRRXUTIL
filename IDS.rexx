/* REXX */
/* Takes a list of users and extracts info one by one */
IDS = "IBMUSER OPEN JES2 DUFFID"
USERS.=""            /* only init to "", never 0 */
do i=1 to words(IDS) /* populate specified users into USERS. stem */
  ID=word(IDS,i)     /* Get next user */
  myrc=IRRXUTIL("EXTRACT","USER",ID,"USERS."||ID)
  say ID myrc        /* Say the ID and the RC */
end
/* We now have all specified users saved, process them */
do i=1 to words(IDS) /* Retrieve data from multiple users without */
  ID=word(IDS,i)     /* extracting them again */
  say ID||" Owner="||USERS.ID.BASE.OWNER.1
end