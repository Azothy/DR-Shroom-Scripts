if "$charactername" = "Joolie" then goto SELL
if_1 then var thing $1
Start:
put open my bald
pause 0.2
LOOP:
pause 0.2
matchre DONE ^What were|^I could not
matchre GIVE ^You get
put get gem pouch from my bald
matchwait 4

GIVE: 
put give pouch to rubi
waitforre ^Rubinium whispers
send nod rubi
pause 0.4
send accept
matchre ACCEPT ^Rubinium offers
matchwait 5
pause 0.5
ACCEPT:
put accept tip
pause 0.5
put accept
wait
put stow pouch
pause 0.3
goto LOOP

DONE:
ECHO *** DONE SELLING GEMS!
exit

SELL:
put speculate finesse
SELL1:
waitforre Azothy offers you
pause 0.2
put accept
pause 0.3
put sell pouch
pause 0.5
put give azoth
pause 0.1
goto SELL1
