ECHO
ECHO ** CORRECT SYNTAX IS .getput <item> <from this container> <put into this container>
ECHO
ECHO
if_1 then goto Loop
exit

Loop:
     pause 0.01
     matchre Loop ^\.\.\.wait|^Sorry\,
     matchre DONE ^What were
     matchre PUT ^You get
     put get %1 from %2
     matchwait 3
     goto DONE

PUT:
     pause 0.001
     put put my %1 in %3
     pause 0.001
     pause 0.01
     goto Loop

DONE:
echo *** DONE! ***
exit