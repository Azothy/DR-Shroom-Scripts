## REMEDY SCRIPT - Created by Shroom of TF
include base.cmd

if ("%0" = "") then 
     {
          echo Usage is: remedy <project> <material> <catalyst> <material/break/keep/belt> <break/keep/belt> <break/keep/belt>
          echo You can use example: coal.nugget or red.flower or need be
          echo you can grab other items using similar method
          echo example: first.coal.nugget, second.red.flower...
          echo So .remedy salve sufil coal.nugget
          echo If you want to keep what you make do this
          echo .remedy salve sufil coal.nugget keep
          echo .remedy ointment red.flower coal.nugget plovik keep
          echo .remedy salve sufil coal.nugget break
          echo Now with crafting belt support
          echo .remedy salve jadice seolarn break belt
          exit
     }	
var project %1
var room $roomid
var material1 %2
var material2 %3
var material3 %4
var snap
var remedy body elixir
var PAGE 8
var craftcontainer satchel
var storagecontainer satchel
var junkcontainer back
var craftbelt alchemist


gosub stowing
pause 0.1

if matchre("%project", "\b(salve|cream|ungent|balm|ointment|poultice)\b")) then var mortar yes
if matchre("%project", "\b(tonic|wash|potion|draught|elixir)\b")) then var bowl yes

ACTIONS.INIT:
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type
action instant goto repair when far too damaged to be used
action var sieve yes when Upon completion you see some particulate clouding up the mixture|^A thick froth coats
action var smell yes when As you finish, the mixture begins to transition colors|takes on an odd hue
action var turn yes when Clumps of material stick to the sides|^Once finished you notice clumps of material
action var catalyst yes when ^You need another catalyst material to continue crafting
action var alcohol yes when ^You need another splash of alcohol to continue crafting
action var water yes when ^You need another splash of water to continue crafting
action var herb yes when ^You need another prepared herb to continue crafting
action var done yes when Applying the final touches, you complete working
action var snap $1 when ^You count out (\d+) pieces of material there\.

GetMat:
	var crushed no
	var smell no
	var sieve no
	var turn no
	var catalyst no
	var alcohol no
	var water no
	var herb no
	var done no
	var error off
EMPTYHANDS:
     if matchre ("$righthandnoun", "\b(sieve|pestle|mortar|stick|bowl)\b") then 
          {
          if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
          }
     if matchre ("$lefthandnoun", "\b(sieve|pestle|mortar|stick|bowl)\b") then 
          {
          if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
          }
BEGIN:
     if (($concentration > 99) && ($Arcana.LearningRate < 33)) then 
          {
          pause 0.0001
          gosub PUT exhale my crystal
          }
	pause 0.1
	if matchre("%0", "\bbreak\b") then goto Break
	matchre GetBook You get|You are
	matchre End referring	
	if "$righthandnoun" = "%material1" then goto Studybook
		else send get my %material1	
	matchwait
	
GetBook:
	pause 0.1
	gosub PUT get my remed book
TurnPage:
	pause 0.1
	matchre StudyBook %remedy
	matchre Turn1 ^You turn
	matchre Read ^You are already
	matchre Turn2 ^This chapter does not
	put turn my book to page %PAGE
	matchwait
Read:
	matchre StudyBook %remedy
	matchre Turn1 ^A list|This
	put read my book
	matchwait 3
Turn1:
	math PAGE add 1
	goto TurnPage
Turn2: 
	var PAGE 1
	goto TurnPage
	
StudyBook:
	pause 0.3
	gosub PUT study my book
	pause 2
	pause 0.5
	gosub PUT put my book in my %craftcontainer
Start:
	if "%mortar" = "yes" then goto Mortar
		elseif "%bowl" = "yes" then goto Bowl
	
Main:
	pause 0.5
	if "%done" = "yes" then goto Done
		elseif "%alcohol" = "yes" then goto Alcohol
			elseif "%water" = "yes" then goto Water
				elseif "%catalyst" = "yes" then goto Catalyst
					elseif "%sieve" = "yes" then goto Sieve
						elseif "%herb" = "yes" then goto Herb
					elseif "%smell" = "yes" then goto Smell
				elseif "%turn" = "yes" then goto Turn
			elseif "%mortar" = "yes" then goto Crush
		elseif "%bowl" = "yes" then goto Mix
	pause 0.8
	goto Main		

Break:
	pause 0.2
	match BreakCount You get
	matchre End ^What were you|^I could not
     PUT get my %material1
	matchwait
	
BreakCount:
	pause 0.2
	gosub PUT count my %material1
	pause 0.2
	if (%snap < 5) then goto Needmore
		elseif (%snap > 5) then 
          {
			gosub PUT mark my %material1 at 5
			pause 0.8
			gosub PUT break my %material1
			pause 0.8
			gosub PUT put my other %material1 in my %storagecontainer
			###send put count my %material1
			pause 0.8
		}
	elseif (%snap = 5) then goto StudyBook
	pause 0.8
	goto StudyBook
	
Mortar:
	var mixer mortar
     pause 0.1
     if matchre("$righthand", "mortar") then gosub PUT swap
	if matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then PUT untie my %mixer from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT get my %mixer
	pause 0.1
     pause 0.1
	if matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT untie my %mixer from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT get my %mixer
     pause 0.1
     if ("$lefthand" = "Empty") then gosub PUT get my %mixer
     if !matchre("$lefthand", "mortar") then goto Mortar
	gosub PUT tilt my %mixer
	gosub PUT tilt my %mixer
	pause 0.1
     pause 0.1
     matchre Crush ^You put
     matchre Mortar The mortar already|You've already|You can't
	send put my %material1 in my %mixer
     matchwait 10
     
Crush:
	if matchre("%0", "\bbelt\b")  && ("$righthand" = "Empty") then gosub PUT untie my pestle from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$righthand" = "Empty") then gosub PUT get my pestle
     pause 0.1
     pause 0.1
     if !matchre ("$righthandnoun", "\b(pestle|stick)\b") then 
          {
               gosub PUT untie my pestle from my %craftbelt belt
               pause 0.1
          }
Crush1:
	matchre Crushed ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^You
	matchre ERROR ^Crush what\?|^There is nothing
	if ("%crushed" = "yes") then send crush my %project in my %mixer with my pestle
		else send crush my %material1 in my %mixer with my pestle
	matchwait
Crushed:
	var crushed yes
	pause 0.1
	goto Main
	
Bowl:
	var mixer bowl
     if matchre("$righthand", "bowl") then gosub PUT swap
	pause 0.2
	if matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT untie my %mixer from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT get my %mixer
	pause 0.1
	if matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT untie my %mixer from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$lefthand" = "Empty") then gosub PUT get my %mixer
     pause 0.1
     pause 0.1
     if !matchre("$lefthand", "bowl") then gosub PUT get my %mixer
     pause 0.1
     pause 0.1
     if !matchre("$lefthand", "bowl") then goto Bowl
	gosub PUT tilt my %mixer
	gosub PUT tilt my %mixer
	pause 0.1
     pause 0.1
     matchre Mix ^You put
     matchre Bowl The bowl already|You've already|You can't
	send put my %material1 in my %mixer
     matchwait 10
Mix:
	pause 0.1
     if matchre ("$righthandnoun", "\b(sieve)\b") then 
          {
          if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
          }
	if matchre("%0", "\bbelt\b") && ("$righthand" = "Empty") then gosub PUT untie my stick from my %craftbelt belt
	if !matchre("%0", "\bbelt\b") && ("$righthand" = "Empty") then gosub PUT get my mix stick
	pause 0.1
     pause 0.1
	if matchre("%0", "\bbelt\b") && ("$righthand" = "Empty") then gosub PUT untie my stick from my %craftbelt belt
     if !matchre ("$righthandnoun", "\b(pestle|stick)\b") then gosub PUT get my mix stick
     pause 0.1
     matchre RESTART ^You cannot figure out how to do that|You need a more suitable|^There is nothing
	if ("%crushed" = "yes") then send mix my %mixer with my stick
		else send mix my %mixer with my stick
	var crushed yes
     matchwait 5
	pause 0.8
	goto Main
	
Catalyst:
	pause 0.1
	if (matchre ("$righthandnoun", "\b(pestle|stick)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	pause 0.1
	matchre CatalystNext ^You get 
	matchre End ^What were you|^I could not
	send get my %material2
	matchwait 10
CatalystNext:
	pause 0.1
	gosub PUT put my %material2 in my %mixer
	pause 0.1
	pause 0.1
	if ("$righthand" != "Empty") then gosub PUT put my %material2 in my %craftcontainer
	var catalyst no
	goto Main
	
Water:
	pause 0.1
	if (matchre ("$righthandnoun", "\b(pestle|stick)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	pause 0.1
     matchre Water ^\.\.\.wait|^Sorry\,
	matchre GET.WATER ^I could not|^What were you
     matchre WATER.CONT ^You get
     send get my water
     matchwait 15
WATER.CONT:
	pause 0.1
	gosub PUT pour my water in my %mixer
	pause 0.1
	gosub PUT put my water in my %craftcontainer
	var water no
	goto Main

GET.WATER:
     var waterloop 0
     echo *** OUT OF WATER - GETTING MORE
     gosub AUTOMOVE teller
     gosub PUT withdraw 10 silver
     pause 0.5
     gosub AUTOMOVE alchemy suppl
     gosub stowing
     pause
     gosub PUT order 1
     gosub PUT order 1
     pause 0.5
WATERLOOP:
     math waterloop add 1
     pause 0.2
     gosub PUT order 1
     gosub PUT order 1
     pause 0.5
     pause 0.3
     gosub PUT combine water with my water
     pause 0.5
     if %waterloop > 6 then goto WATERDONE
     goto WATERLOOP
WATERDONE:
     var waterloop 0
     gosub PUT stow water
     ECHO *** RESTOCKED WATER! ***
     gosub automove %room
     goto Done
    
Alcohol:
	pause 0.1
	if (matchre ("$righthandnoun", "\b(pestle|stick)\b") then 
		{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
          pause 0.2
		}
	if (matchre ("$lefthandnoun", "\b(pestle|stick)\b") then 
		{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.2
		}
	pause 0.1
	pause 0.1
     matchre Alcohol ^\.\.\.wait|^Sorry\,
	matchre GET.ALCOHOL ^I could not|^What were you
     matchre ALCOHOL.CONT ^You get
     send get my alcohol
     matchwait 15

GET.ALCOHOL:
     var alcoholloop 0
     echo *** OUT OF WATER - GETTING MORE
     gosub AUTOMOVE teller
     gosub PUT withdraw 10 silver
     pause 0.5
     gosub AUTOMOVE alchemy suppl
     gosub stowing
     pause
     gosub PUT order 2
     gosub PUT order 2
     pause 0.5
ALCOHOLLOOP:
     math alcoholloop add 1
     pause 0.2
     gosub PUT order 2
     gosub PUT order 2
     pause 0.3
     gosub PUT combine alc with my alc
     pause 0.5
     if %alcoholloop > 6 then goto ALCDONE
     goto ALCOHOLLOOP
ALCDONE:
     var alcoholloop 0
     gosub PUT put alcohol in my %craftcontainer
     ECHO *** RESTOCKED WATER! ***
     gosub automove %room
     goto Done
     
ALCOHOL.CONT:
	gosub PUT pour my alcohol in my %mixer
	pause 0.1
	gosub PUT put my alcohol in my %craftcontainer
	var alcohol no
	goto Main
	
Smell:
	pause 0.1
	gosub PUT smell my %project
	pause 0.1
	var smell no
	goto Main
	
Turn:
	pause 0.1
	gosub PUT turn my %mixer
	var turn no
	goto Main
	
Sieve:
	pause 0.1
	if (matchre ("$righthandnoun", "\b(pestle|stick)\b") then {
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	pause 0.1
	if matchre("%0", "\bbelt\b") then gosub PUT untie my sieve to my %craftbelt belt
		else gosub PUT get my sieve
	pause 0.2
	gosub PUT push my %project with my sieve
	pause
	if matchre("%0", "\bbelt\b") then gosub PUT tie my sieve to my %craftbelt belt
		else gosub PUT put my sieve in my %craftcontainer
	var sieve no
	goto Main
	
Herb:
	if (matchre ("$righthandnoun", "\b(pestle|stick)\b") then {
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	pause 0.2
	matchre OUT.OF.HERB ^What were you|^I could not
	matchre Herb2 ^You get
	gosub PUT get my %material3
	matchwait
Herb2:
	pause 0.1
	gosub PUT put my %material3 in my %mixer
	gosub PUT put my %material3 in my %storagecontainer
	pause 0.1
	var herb no
	goto Main
Error:
	put #echo >Log Red *** Something bad happened in Remedy script - Aborting!
	var error on
Done:
	pause 0.1
	if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
		else gosub PUT put my $righthandnoun in my %craftcontainer
	pause 0.1
	if matchre("%0", "\bkeep\b") then goto Keep
	pause
	if (matchre ("$roomobjs", "\b(bucket|bin|barrel)\b") then gosub PUT get my %project from my %mixer;put my %project in $1
		else gosub PUT get my %project from my %mixer;drop my %project
	echo *****************
	echo ***** DONE ******
	echo *****************
	pause 0.5
	if matchre("%0", "\bbelt\b") then gosub PUT tie my %mixer to my %craftbelt belt
		else gosub PUT put my %mixer in my %craftcontainer
	if ($Alchemy.LearningRate > 32) || ("%error" = "on") then
		{
		put #parse ALCHEMY DONE
		exit
		}
	goto GetMat
	
Keep:
	pause 0.1
	gosub PUT get my %project from my %mixer;put my %project in my %craftcontainer
	pause 0.1
	if matchre("%0", "\bbelt\b") then gosub PUT tie my %mixer to my %craftbelt belt
		else gosub PUT put my %mixer in my %craftcontainer
	pause
	if ($Alchemy.LearningRate > 32) || ("%error" = "on") then
		{
		put #parse ALCHEMY DONE
		exit
		}
	goto GetMat

Repair:
	pause 0.1
	echo Your gear is too damaged to craft! Repairing!
	if ((matchre("%0", "\bbelt\b") && "$righthand" != "Empty")) then gosub PUT tie my $righthandnoun to my %craftbelt belt
		else gosub PUT put my $righthandnoun in my %craftcontainer
	if ((matchre("%0", "\bbelt\b") && "$lefthand" != "Empty")) then gosub PUT tie my $lefthandnoun to my %craftbelt belt
		else gosub PUT put my $lefthandnoun in my %craftcontainer
	put #parse REPAIR.TOOLS
	pause 0.8
	exit

RESTART:
     pause 0.1
     echo *** SOMETHING BAD HAPPENED IN REMEDY SCRIPT! 
     echo *** ATTEMPTING TO RECOVER.. MAY SELF DESTRUCT.. 
     if (matchre ("$lefthandnoun", "\b(mortar|bowl)\b") then 
          {
          gosub PUT tilt my $lefthandnoun
          gosub PUT tilt my $lefthandnoun
          }
	if (matchre ("$righthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.2
	}
	if (matchre ("$lefthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.2
	}     
     goto ACTIONS.INIT
     
Needmore:
	pause 0.1
	echo Don't have enough material to cut. Script ending.
	gosub PUT put my %material1 in my %storagecontainer
	pause 0.1
	if (matchre ("$righthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	if (matchre ("$lefthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.1
	}
	put #parse ALCHEMY DONE
	exit
OUT.OF.HERB:
	echo RAN OUT OF HERBS. ENDING SCRIPT
	if (matchre ("$righthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	if (matchre ("$lefthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.1
	}
	put #parse ALCHEMY DONE
	exit	
End:
	echo Materials exhausted. Script ending.
	if (matchre ("$righthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	if (matchre ("$lefthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.1
	}
	put #parse ALCHEMY DONE
	exit
ERROR.QUIT:
	echo Error! You seem to be missing a crafting utensil!
     put #echo >Log Red *** CRAFTING ERROR - Missing utensil! 
	if (matchre ("$righthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $righthandnoun to my %craftbelt belt
			else gosub PUT put my $righthandnoun in my %craftcontainer
		pause 0.1
	}
	if (matchre ("$lefthandnoun", "\b(pestle|stick|mortar|bowl|sieve)\b") then 
	{
		if matchre("%0", "\bbelt\b") then gosub PUT tie my $lefthandnoun to my %craftbelt belt
			else gosub PUT put my $lefthandnoun in my %craftcontainer
		pause 0.1
	}
	put #parse ALCHEMY DONE
	exit	
####################################
# GOSUBS
####################################


FIND.TOOL:
matchre FIND ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre TOOL.MISSING What were you|could not find
matchre RETURN You tap
send tap my $1 $2 
matchwait

FIND.HERB:
matchre FIND.HERB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre HERB.MISSING What were you|could not find
matchre RETURN You tap
send tap my $1 $2 in my %storage
matchwait

FIND:
matchre FIND ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre TOOL.MISSING What were you|could not find
matchre RETURN You tap
send tap my $1 $2
matchwait

GET.BOOK:
matchre GET.BOOK ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You get
matchre TOOL.MISSING What were you|could not find
send get rem book 
matchwait 2
goto RETURN

FIND.CHAPTER:
matchre FIND.CHAPTER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You turn|is already turned
send turn my book to ch %chapter
matchwait 2
goto RETURN

FIND.PAGE:
matchre FIND.PAGE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You turn|is already turned|already on
send turn my book to page %page
matchwait 2
goto RETURN

STUDY.BOOK:
matchre STUDY.BOOK ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN Roundtime
send study my book
matchwait 2
goto RETURN

STOW.BOOK:
matchre STOW.BOOK  ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put
send put my book in my %toollocation
matchwait 2
goto RETURN

GET.CONTAINER:
matchre GET.CONTAINER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre TILT.CONTAINER You get
matchre TOOL.MISSING What were you|could not find
send get %container 
matchwait 2
goto TILT.CONTAINER

TILT.CONTAINER:
matchre TILT.CONTAINER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre TILT.CONTAINER prepare to dump it out
matchre SWAP.CONTAINER toss the contents away|is empty
send tilt my %container
matchwait 2
goto TILT.CONTAINER

SWAP.CONTAINER:
matchre SWAP.CONTAINER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN to your left hand
matchre SWAP.CONTAINER to your right hand
send swap
matchwait 2
goto RETURN

GET.HERB:
matchre GET.HERB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You get
matchre TOOL.MISSING What were you|could not find
send get %herb from my %storage
matchwait 2
goto RETURN

PUT.HERB:
matchre PUT.HERB ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put|place only that many
send put my %herb in my %container
matchwait 2
goto RETURN

STOW.HERB:
matchre STOW.HERB  ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put|What were you|could not find
send put my %herb in my %storage
matchwait 2
goto RETURN

GET.MIXER:
matchre GET.MIXER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre TOOL.MISSING What were you|could not find
matchre RETURN You get
send get %mixer 
matchwait 2
goto RETURN

# ********************************************************************************************** MIX STUFF

#MIX:
matchre MIX ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre LIQUID You need another splash
matchre CATALYST need another catalyst
matchre SIEVE some particulate 
matchre HERB.ADD ^That craftable requires more pieces 
matchre SMELL begins to transition colors
matchre TURN you notice clumps|clumps of material 
matchre RETURN you complete|you complete working|Interesting thought really|you complete working on|you just can't mix
send %mix %crush with my %mixer
matchwait 2
goto MIX

HERB.ADD:
pause 0.1
gosub 
#SMELL:
matchre SMELL ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre MIX You sniff|smell
send smell %crush in my %container
matchwait 2
goto MIX

#TURN:
matchre TURN ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre MIX You spin|scraping|distribution of materials
send turn my %container
matchwait 2
goto MIX

#LIQUID:
matchre LIQUID ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre LIQUID1 You put
send put my %mixer in my %toollocation
matchwait 2
goto LIQUID1

LIQUID1:
matchre LIQUID1 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre LIQUID2 You get
matchre TOOL.MISSING what were you|could not find
send get my %liquid 
matchwait 2
goto LIQUID2

LIQUID2:
matchre LIQUID2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre LIQUID3 You toss|You splash|You put
send put my %liquid in my %container
matchwait 2
goto LIQUID3

LIQUID3:
matchre LIQUID3 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre LIQUID4 You put|What were|could not
send put my %liquid in my %toollocation
matchwait 2
goto LIQUID4

LIQUID4:
matchre LIQUID4 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre MIX You get
matchre TOOL.MISSING What were you|could not find
send get my %mixer 
matchwait 2
goto MIX

#CATALYST:
matchre CATALYST ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre CATALYST1 You put
send put my %mixer in my %toollocation
matchwait 2
goto CATALYST1

CATALYST1:
matchre CATALYST1 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre CATALYST2 You get
matchre TOOL.MISSING what were you|could not find
send get my %catalyst
matchwait 2
goto CATALYST2

CATALYST2:
matchre CATALYST2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre CATALYST3 You toss|You splash|You put
send put my %catalyst in my %container
matchwait 2
goto CATALYST3

CATALYST3:
matchre CATALYST3 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre CATALYST4 You put|What were|could not
send put my %catalyst in my %toollocation
matchwait 2
goto CATALYST4

CATALYST4:
matchre CATALYST4 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre MIX You get
matchre TOOL.MISSING What were you|could not find
send get my %mixer 
matchwait 2
goto MIX

#SIEVE:
matchre SIEVE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre SIEVE1 You put
send put my %mixer in my %toollocation
matchwait 2
goto SIEVE1

SIEVE1:
matchre SIEVE1 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre SIEVE2 You get
matchre TOOL.MISSING what were you|could not find
send get my sieve
matchwait 2
goto SIEVE2

SIEVE2:
matchre SIEVE2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre SIEVE3 You toss|You splash|You put
send push %product with sieve
matchwait 2
goto SIEVE3

SIEVE3:
matchre SIEVE3 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre SIEVE4 You put|What were|could not
send put my sieve in my %toollocation
matchwait 2
goto SIEVE4

SIEVE4:
matchre SIEVE4 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre MIX You get
matchre TOOL.MISSING What were you|could not find
send get my %mixer 
matchwait 2
goto MIX


STOW.MIXER:
matchre STOW.MIXER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put
send put my %mixer in my %toollocation
matchwait 2
goto RETURN

GET.STUFF:
matchre GET.STUFF ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You get
send get %product from my %container
matchwait 2
goto RETURN

STOW.STUFF:
math made add 1
matchre STOW.STUFF ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put
send put my %product in my %herbpouch
matchwait 2
goto RETURN

STOW.CONTAINER:
matchre STOW.CONTAINER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN You put
send put my %container in my %toollocation
matchwait 2
goto RETURN

EMPTY.RIGHT:
matchre EMPTY.RIGHT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN Your right hand is already empty|You stow|I could not find what|You put your|Stow what?|you slip the|What were you
send put my $righthandnoun in my %toollocation
matchwait

EMPTY.LEFT:
matchre EMPTY.LEFT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
matchre RETURN Your right hand is already empty|You stow|I could not find what|You put your|Stow what?|you slip the|What were you
send put my $lefthandnoun in my %toollocation
matchwait