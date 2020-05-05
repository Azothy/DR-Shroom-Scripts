ECHO
ECHO ** SYNTAX IS .getsell <item> 
ECHO
ECHO
if_1 then goto Loop
exit

Loop:
     pause 0.001
     matchre Loop ^\.\.\.wait|^Sorry\,
     matchre DONE ^What were
     matchre SELL ^You get|^You are
     put get my %1 %2
     matchwait 3
     goto DONE

SELL:
     matchre SELL ^\.\.\.wait|^Sorry\,
     matchre Loop ^You sell your|he hands you|then hands you
     matchre DROP ^You can't pawn|not worth the effort
     matchre DROP slit a throat for this|worth my time|shakes his head|no need
     matchre DROP ^I could not find what you were referring to\.
     matchre DROP ^Please rephrase that command\.
     matchre DROP ^What were you referring to\?
     matchre DROP You'll want to empty that first
     put sell my %1
     matchwait
DROP:
     put put my %1 in bucket
     pause 0.001
     goto Loop

DONE:
     echo *** DONE! ***
     exit