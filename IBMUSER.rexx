/* REXX */
/* Super basic IRRXUTIL sample */
myrc=IRRXUTIL(EXTRACT,USER,IBMUSER,stem,'','FALSE')
say myrc
say stem.profile
say stem.BASE.NAME.1
say stem.BASE.OWNER.1
say stem.BASE.DFLTGRP.1