var item 0
var max.item 300

Start:
math item add 1
pause 0.001
pause 0.001
pause 0.1
send buy cane arrow
pause 0.1
pause 0.1
put put arrow in back
pause 0.1
pause 0.1
pause 0.001
pause 0.001
pause 0.001
echo %item
if (%item >= %max.item) then goto DONE
goto Start

DONE:
echo DONE BUYING ARROWS!
put #parse DONE
exit