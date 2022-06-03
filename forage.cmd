var SONG $SONG
var forage rock
action var doneplay yes when You finish (humming|playing)
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

FORAGE.EXP:
if $Outdoorsmanship.LearningRate > 33 then goto LEAVE.FORAGE
pause 0.1
goto FORAGE

FORAGE:
gosub KICK_PILE
gosub KICK_PILE
pause 0.5
send collect %forage
pause 2
pause
gosub KICK_PILE
send collect %forage
pause 2
pause
gosub KICK_PILE
send collect %forage
pause 2
pause
gosub KICK_PILE
send collect %forage
pause 2
pause
gosub KICK_PILE
gosub KICK_PILE
goto FORAGE.EXP

KICK_PILE:
pause 0.1
if !matchre("$roomobjs","(pile of coins|pile of coin|pile of rocks|pile of grass)") then RETURN
matchre RETURN ^I could not|^What were you
matchre KICK_PILE foot smashing down
matchre STAND ^You can't do that from your position
match DELAY footing at the last moment
put kick pile
matchwait 20
goto FORAGE.EXP

STAND:
put stand
goto KICK_PILE

DELAY:
pause 11
put stand
goto KICK_PILE

LEAVE.FORAGE:
ECHO *** DONE FORAGING!
pause 0.1
put stop play
put stand
pause
if "$righthand" != "Empty" then put stow right
if "$lefthand" != "Empty" then put stow left
put #parse FORAGING DONE
put #parse DONE FORAGING
pause 0.5
exit


RETURN:
pause .1
return
