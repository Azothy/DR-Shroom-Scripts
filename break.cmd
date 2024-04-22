#debuglevel 5
#####################################
# BREAK utility script by Shroom
# Usage: .break <number of items>
# .break 50 - will break off 50 of the items in your right hand and stow
#####################################
var break 0
var count %2
LOOP:
math break add 1
pause 0.0001
send break my %1
wait
pause 0.1
pause 0.01
if matchre("$lefthand", "Empty") then goto DONE
send stow left
pause 0.01
echo %break
if %break > %count then goto DONE
goto LOOP

DONE:
echo
echo DONE!! Broke off: %break
echo
pause 0.1
if matchre("$lefthand", "Empty") then send stow left
put #parse FIN
exit