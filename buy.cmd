var max.keyblanks 120
var container back
#############
var keyblanks 0
Start:
pause 0.00001
math keyblanks add 1
put buy soft iron keyblank
waitforre give|I'll|Sorry|Kilam|One
put offer 120
pause 0.001
put offer 120
pause 0.1
pause 0.1
#waitforre hands|Sorry|Kilam|think
put put key in my %container
pause 0.1
if (%keyblanks >= %max.keyblanks) then goto DONE
echo * %keyblanks
goto Start

DONE:
echo %max.keyblanks made!
echo DONE BUYING KEYBLANKS!
exit