var forage grass
var trash bucket
var loop 0

if "$righthand" != "Empty" then send stow right
if "$lefthand" != "Empty" then send stow left

LOOP:
math loop add 1 
if %loop > 1 then goto DONE
if $Mechanical_Lore.LearningRate > 31 then goto DONE
if contains("$roomobjs","(pile of coins|pile of coin|pile of rocks|pile of grass)") then GOSUB KICK.PILE
pause .1
if "$righthand" = "%forage" && "$lefthand" != "%forage" then goto BRAID
pause .2
if "$righthand" != "Empty" then send empty right
if "$lefthand" != "Empty" then send empty left
put forage %forage
pause 2
pause

FORAGE:
if "$lefthand" = "braided vines" then put swap
pause 0.1
if contains("$roomobjs","a vine") then 
	{
	put get vine
	pause 0.5
	goto BRAID
	}
put forage %forage
pause 2
pause
if "$righthand" != "Empty" && "$lefthand" != "Empty" then goto BRAID
goto FORAGE

HUM:
put hum scale
BRAID:
pause 0.5
if "$lefthand" = "braided vines" then put swap
if "$lefthand" = "braided grass" then put swap
pause 0.5
if "$righthand" = "Empty" then goto FORAGE
matchre HUM ^But that would give away your hiding
matchre HANDS ^You need both hands to do that
matchre FORAGE ^You need to have more material
matchre DUMP nothing more than wasted effort
matchre PULL ^You fumble around trying|^You are certain that you have made a|is already as long
matchre BRAID Roundtime|^\.\.\.wait|^Sorry
send braid my %forage
matchwait

HANDS:
if "$righthand" = "braided vines" then put empty left
if "$righthand" = "braided grass" then put empty left
if "$lefthand" = "braided vines" then put empty right
if "$lefthand" = "braided grass" then put empty right
put swap
pause 0.1
GOTO BRAID

PULL:
pause .5
put pull my %forage
pause

DUMP:
pause 0.5
pause 0.1
if contains("$roomobjs","driftwood log") then 
	{
		send put my $righthandnoun in log
		send put my $lefthandnoun in log
		pause
		goto LOOP
	}
if contains("$roomobjs","waste bin") then 
	{
		send put my $righthandnounin bin
		send put my $lefthandnoun in bin
		pause
		goto LOOP
	}
if contains("$roomobjs","firewood bin") then 
	{
		send put my $righthandnoun in bin
		send put my $lefthandnoun in bin
		pause
		goto LOOP
	}
if contains("$roomobjs","bucket of viscous gloop") then 
	{
		send put my $righthandnoun in buck
		send put my $lefthandnoun in buck
		pause
		goto LOOP
	}
if contains("$roomobjs","tree hollow") then 
	{
		send put my $righthandnoun in hollow
		send put my $lefthandnounin in hollow
		pause
		goto LOOP
	}
if "$righthand" != "Empty" then put empty right
if "$lefthand" != "Empty" then put empty left
send drop my braided %forage
pause .5
send dump junk
pause .1
goto LOOP

DONE:
pause 0.1
pause 0.1
if contains("$roomobjs","driftwood log") then 
	{
		send put my $righthandnoun in log
		send put my $lefthandnoun in log
	}
if contains("$roomobjs","waste bin") then 
	{
		send put my $righthandnoun in bin
		send put my $lefthandnoun in bin
	}
if contains("$roomobjs","bucket of viscous gloop") then 
	{
		send put my $righthandnoun in bucket
		send put my $lefthandnoun in bucket
	}
if contains("$roomobjs","firewood bin") then 
	{
		send put my $righthandnoun in bin
		send put my $lefthandnoun in bin
	}
if contains("$roomobjs","tree hollow") then 
	{
		send put my $righthandnoun in hollow
		send put my $lefthandnoun in hollow
	}
pause 0.1
EXIT:
if "$righthand" != "Empty" then put empty right
if "$lefthand" != "Empty" then put empty left
pause 0.5
put #parse DONE BRAIDING
put #parse BRAIDING DONE
exit

KICK.PILE:
pause 0.1
if !matchre("$roomobjs","(pile of coins|pile of coin|pile of rocks|pile of grass)") then RETURN
matchre RETURN ^I could not|^What were you
matchre KICK.PILE foot smashing down
matchre STAND ^You can't do that from your position
match DELAY footing at the last moment
put kick pile
matchwait 20
goto FORAGE.EXP

STAND:
put stand
goto KICK.PILE

DELAY:
pause 11
put stand
goto KICK.PILE

	