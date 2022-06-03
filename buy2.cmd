var item 0
var max.item 200

Start:
math item add 1
pause 0.01
pause 0.01
pause 0.1
pause 0.1
put buy %1
pause 0.1
pause 0.1
put stow my %1
pause 0.01
pause 0.01
if (%item >= %max.item) then goto DONE
goto Start

DONE:
echo DONE BUYING %item !
exit