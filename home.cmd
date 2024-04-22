var HomeCity 67
var HomeRoom 98
var HomeVerb manor
echo
echo *** HOME SCRIPT!
echo
if_1 then goto HOME_LEAVE
if (("$zoneid" = "66") && ("%HomeCity" = "67")) then
     {
          put #goto east
          waitforre YOU ARRIVED|YOU HAVE ARRIVED
          pause 0.2
          pause 0.1
     }
if matchre("$roomname", "Home") then goto HOME_LEAVE
if ("$zoneid" != %HomeCity) then
     {
          echo *** WRONG CITY!!
          echo *** START IN YOUR HOME CITY! (%HomeCity)
          goto EXIT
     }
if ("$roomid" != %HomeRoom) then
     {
          put #goto %HomeRoom
          waitforre YOU ARRIVED|YOU HAVE ARRIVED
     }
echo
echo *** ENTERING HOME
echo
HOME_GO:
put unlock %HomeVerb
pause 0.3
put open %HomeVerb
pause 0.2
pause 0.1
put go %HomeVerb
pause 0.2
pause 0.2
send look on rack
pause 0.3
pause 0.2
send look on stand
pause 0.3
pause 0.2
send look on piano
pause 0.3
send look in piano
pause 0.3
pause 0.2
send look on bed
pause 0.3
pause 0.2
send look on table
pause 0.3
pause 0.2
goto EXIT

HOME_LEAVE:
echo
echo *** LEAVING HOME
echo
put unlock door
pause 0.3
put open door
pause 0.2
pause 0.1
put go door
pause 0.2

EXIT:
echo ** DONE!
if matchre("$roomname", "Home") then echo run .home again to auto-leave home
exit
