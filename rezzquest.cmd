#debug 10
action var guild $1 when Guild\: (\S+)
	var weapon scimitar
	action (orb) var orb %orb|red when ^A fiery flash washes through the depths of the obsidian obelisk as an intense warmth meets your touch.
	action (orb) var orb %orb|black when ^Veils of shadows flicker erratically over your field of vision briefly.
	action (orb) var orb %orb|blue when ^An intense shock of cold chills your veins as an icy, glacial glow pulses deep within the obsidian obelisk.
	action (orb) off

	ECHO **************THIS IS A DANGEROUS QUEST, DON'T BRING ANYTHING YOU DON'T MIND LOSING
	ECHO **************YOU NEED TO START WITH A FLINT AND A VARIABLE FOR YOUR WEAPON THAT YOU WILL LIGHT WITH (%weapon) DEFAULTS TO SCIMITAR
	ECHO **************YOU NEED TO BE FULLY CLEAN WHEN ENTERING THE VOID SO I SUGGEST BRINGING AN EMPATH OR HERBS. YOU WILL LIKELY GET HURT.
	if "%guild" = "Empath" then goto empathstart
	gosub EMPTY_HANDS
	gosub automove temple
	gosub automove tallis
	match talliscont Tallis' face softens as she clasps your hand between hers
	match tallisfail Tallis shakes her head and says, "It is good to see one so eager to serve the Gods, but you are not ready to learn a new spell, much less Resurrection."
	put ask tallis about resurrection
	matchwait
	
tallisfail:
	ECHO YOU HAVE NO FREE SPELL SLOTS, CAN'T CONTINUE
	exit

talliscont:
	gosub automove urrem
	put pull candlestick
	gosub get goblet
	gosub stow goblet
	gosub automove crossing
	gosub automove .travel riverhaven
	match havecandle You tap
	matchre nocandle What were you|Tap what|I could not find
	put tap altar candle
	matchwait
	
	nocandle:
	gosub coincheck
	if %coin < 120 then
		{
		gosub automove teller
		put withd 2 silver
		}
	gosub automove cleric shop
	put order altar candle
	put offer 120
	put stow candle
	
	havecandle:
	 if !SpellTimer.ProtectionfromEvil.active then gosub cast PFE 30
	 empathstart:
	 if ("$zoneid" != "30") then gosub automove .travel riverhaven
	 if ("$zoneid" = "30") then gosub automove e gate
     if ("$zoneid" = "31") then gosub automove 96
	 gosub rzeast
	 pause 1
     if ("$zoneid" = "31a") then gosub automove 109
	 put touch altar
	 put pray
	 waitfor The murky waters end
	 move s
     if ("$zoneid" = "31b") then gosub automove 77
	 var orb
	 action (orb) on
	 pause 1
	 gosub touch
	 counter set 1
	 gosub orbs
	 if matchre("$roomdesc", "^Carved into the face" then 
		{
		move east
		move north
		}
	 if matchre("$roomdesc", "^A small pile of corse") then
		{
		move west
		move north
		}
	 if matchre("$roomdesc", "^A pile of rubble is strewn") then
		{
		move north
		}
	 gosub automove 92
	 put pull arm
	 gosub automove 87
	 put pull tail
	 gosub automove 108
	 if $north then move n
	 else gosub circle 108
	 move n
	 gosub automove 120
	 if $south then move s
	 else gosub circle 120
	 move south
	 move south
	 move climb stair
	 if "%guild" = "Empath" then goto EMPATHWAIT
	 gosub healthcheck
	 gosub badgecheck
	 gosub light
	 gosub get goblet
	 put fill goblet with water
	 put go altar
	 put drink goblet
	 waitfor Go home and experience these things while you can
	 put search
	 pause 0.5
	 pause 0.5
	 send go bridge
	 waitfor Use your faith to light the darkness
	 pray:
	 match rezzdone Fallen Altar
	 put pray
	 matchwait 2
	 goto pray
	 
empathwait:
	echo WAITING FOR YOU CLERIC TO BE DONE 
	echo TYPE GOGO WHEN YOU'RE READY TO LEAVE
	WAITFOR GOGO
	 
	 rezzdone:
	 move climb stair
	 move n
	 pause 1
	 if $north then move north
	 else gosub circle 116
	 move sw
	 gosub automove 109
	 if $south then move south
	 else gosub circle 109
	 move s
	 if $south then move south
	 else gosub circle 121
	 move south
	 gosub automove 93
	 put touch etching
	 pause 0.5
	 pause 0.5
	 pause 0.5
	 move s
	 gosub automove 5
	 pause 1
	 gosub automove 121
	 gosub RZWest
	 gosub automove 1
	 ECHO REZZ COMPLETE
	 exit
	 
	 circle:
	 var temproom $1
	 circle1:
	 put stand circle
	 match run begins to advance on you
	 match circlecont As the lights within the circle fade and die, you step out
	 matchwait
	 circlecont:
	 return
	 
	 touch:
	 matchre touch \.\.\.wait
	 matchre return A tingling sensation spreads through your body, accompanied by a sense of import.
	 put touch obelisk
	 matchwait 6
	 goto touch
	 
	 run:
	 if %temproom = 108 then
		{
		gosub automove 106
		pause 5
		gosub automove 108
		goto circle1
		}
	 if %temproom = 120 then
		{
		gosub automove 109
		pause 5
		gosub automove 120
		goto circle1
		}
	 if %temproom = 109 then
		{
		gosub automove 120
		pause 5
		gosub automove 121
		goto circle1
		}
	
	 
	 healthcheck:
	 var needheal 0
	 action var needheal 1 when ^You have (?!no significant injuries)(.*)\.$
	 pause 0.5
	 put health
	 pause 1
	 if %needheal = 1 then 
		{
		echo You have injuries, either get an Empath to heal you or use herbs to heal yourself
		echo Type GOGO to continue when healed or kill the script and restart it at some other time
		waitforre ^GOGO
		}
	return
	
	badgecheck:
	put hold pilgrim badge
	put push altar to pilgrim badge
	put wear badge
	return
	
	light:
	gosub get candle
	gosub put drop candle
	gosub get flint
	gosub get %weapon
	put light candle with flint
	gosub stow right
	gosub stow left
	gosub get candle
	return
	 
	 
	 
	 orbs:
	 if %c > 3 then return
	 gosub automove %orb(%c)
	 put touch statue
	 pause 1
	 pause 1
	 counter add 1
	 goto orbs
	 
coincheck:
	var coin 0
	action var coin $1 when \((\d+) copper Lirums\)\.$
	pause 0.5
	put wealth
	pause 1
	return

	 
cast:
	 put prep $0
	 waitfor fully prepared
	 put cast
	 return
	 
EMPTY_HANDS:
     pause 0.0001
     if ("$righthand" != "Empty") then gosub STOW $righthandnoun
     if ("$lefthand" != "Empty") then gosub STOW $lefthandnoun
     return
	 
#### PUT SUB
PUT:
     var Command $0
     var LOCATION PUT_1
     pause 0.0001
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You sit down
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^.* what\?
     matchre RETURN ^You find a hole
     matchre RETURN ^You (?:hand|touch|push|move|put|tap|drop|place|toss|set|add) .*(?:\.|\!|\?)
     matchre RETURN ^Your .*\.
     matchre RETURN ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN ^Brother Durantine nods slowly\.
     matchre RETURN ^Durantine waves a small censer over a neatly-wrapped package and intones a short prayer before he hands it to you\.
     matchre RETURN ^After a moment\, .*\.
     matchre RETURN ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN ^Maybe you should stand up\.
     matchre RETURN ^You sense a successful empathic link has been forged|^Touch what|^I could not find
     matchre RETURN ^The clerk counts out .*\.
     matchre RETURN ^The .* is not damaged enough to warrant repair\.
     matchre RETURN ^There is no more room in .*\.
     matchre RETURN ^There is nothing in there\.
     matchre RETURN ^In the .* you see .*\.
     matchre RETURN ^This spell cannot be targeted\.
     matchre RETURN ^You cannot figure out how to do that\.
     matchre RETURN ^You will now store .* in your .*\.
     matchre RETURN ^You.*analyze
	 matchre RETURN ^You lay your hand upon
     matchre RETURN ^You glance down .*\.
     matchre RETURN ^You glance heavenward
     matchre RETURN ^You turn .*\.
     matchre RETURN ^You chatter away\.\.\.
     matchre RETURN ^You are now
     matchre RETURN ^You search
	 matchre RETURN ^You get
     matchre RETURN ^You have nothing to 
     matchre RETURN ^That tool does not seem suitable for that task\.
     matchre RETURN ^There isn't any more room in .* for that\.
     matchre RETURN ^You are already focusing your appraisal on a subject\.
     matchre RETURN ^You are already under the effects of an appraisal focus\.
     matchre RETURN ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN ^You can't seem to focus on that\.\s*Perhaps you're too mentally tired from researching similar principles recently\.
     matchre RETURN ^\s*LINK ALL CANCEL\s*\- Breaks all links
     # matchre RETURN ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %Command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! (utility.inc) ***
     put #echo >$Log Crimson $datetime Command = %Command
     put #log $datetime MISSING MATCH IN PUT (utility.inc)
     return	 
	 
	 #### GET SUB
GET:
     var Get $0
     var LOCATION GET_1
     pause 0.0001
     GET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^You get .*\.
     matchre RETURN ^You pick up .*\.
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You grab .*(?:\.|\!|\?)
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %Get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! (utility.inc) ***
     put #echo >$Log Crimson $datetime Get = %Get
     put #log $datetime MISSING MATCH IN GET (utility.inc)
     return
 
#### HOLD SUB
HOLD:
     var Get $0
     var LOCATION HOLD_1
     pause 0.0001
     HOLD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You sling .*\.
     matchre RETURN ^You get .*\.
     matchre RETURN ^You take .*\.
     matchre RETURN ^You pull .*\.
	 matchre RETURN ^You remove .*\.
	 matchre RETURN ^You loosen .*\.
     matchre RETURN ^You remove .* from your belt\.
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
	 matchre RETURN ^Hold hands with whom
	 matchre RETURN ^You work your way out of
	 matchre RETURN ^You aren't
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send hold %Get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (utility.inc) ***
     put #echo >$Log Crimson $datetime Get = %Get
     put #log $datetime MISSING MATCH IN HOLD (utility.inc)
     return
 
#### STOW SUB
STOW:
     var Stow $0
     var LOCATION STOW_1
     pause 0.0001
     STOW_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre WEAR_CHECK ^.* is too long to fit in .*\.
     matchre RETURN ^You put .*\.
     matchre RETURN already in your inventory
     matchre RETURN ^You open your pouch and put .* inside\, closing it once more\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
	 matchre STOW_LEFT You need a free hand
     matchre STOW.UNLOAD ^You should unload
     send stow %Stow
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %Stow
     put #log $datetime MISSING MATCH IN STOW (utility.inc)
     return
	 
STOW_LEFT:
	var LOCATION STOW_LEFT
	 matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre WEAR_CHECK ^.* is too long to fit in .*\.
     matchre STOW_LEFT1 ^You put .*\.
     matchre STOW_LEFT1 already in your inventory
     matchre STOW_LEFT1 ^You open your pouch and put .* inside\, closing it once more\.
     matchre STOW_LEFT1 ^What were you referring to\?
     matchre STOW_LEFT1 ^Stow what\?  Type 'STOW HELP' for details\.
     matchre STOW.UNLOAD ^You should unload
     send stow LEFT
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %Stow
     put #log $datetime MISSING MATCH IN STOW (utility.inc)
     goto STOW_LEFT1
	 
STOW_LEFT1:
	var LOCATION STOW_1
	goto STOW_1
	
	automove:
#put #mapper reset
var movement $0
eval mcount count("%movement", "|")
var ccount 0
#if contains("Cleric|Warrior Mage|Moon Mage|Bard|Empath|Paladin", "$Guild") then put #var powerwalk 1

automove_1:
pause 1
if matchre("%movement(%ccount)", "travel") then goto travelmove
match automove_1 YOU HAVE FAILED
match automove_1 You can't go there
match automove_1 MOVE FAILED
match automove_1 You don't seem to be able to move to do that.
match automove_1 Moving around too much will remove you from the circle.  Are you sure that's what you want?
match automove_1 You step out of the circle, causing the lights within it to fade and die
matchre autoreturn YOU HAVE ARRIVED
else put #goto %movement(%ccount)
matchwait 90
put #mapper reset
goto automove_1

travelmove:
put %movement(%ccount)
waitfor REACHED YOUR DESTINATION
goto autoreturn

autoreturn:
#if (matchre("%movement(%ccount)", "\d+") && (!matchre("$roomid", "\b%movement(%ccount)\b")) then goto automove_1
if %ccount = %mcount then return
math ccount add 1
goto automove_1

#### RETURNS
RETURN_CLEAR:
     pause 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     pause 0.0001
     return
	 
RZEast:
	 var randomlabel RZEast
     delay 0.0001
     random 1 8
     if (%r = 1) && (!$north) then goto RZEast
     if (%r = 2) && (!$northeast) then goto RZEast
     if (%r = 3) && (!$east) then goto RZEast
     if (%r = 4) && (!$southeast) then goto RZEast
     if (%r = 5) && (!$south) then goto RZEast
     if (%r = 6) && (!$southwest) then goto RZEast
     if (%r = 7) && (!$west) then goto RZEast
     if (%r = 8) && (!$northwest) then goto RZEast
     #
     if (%r = 1) then var Direction north
     if (%r = 2) then var Direction northeast
     if (%r = 3) then var Direction east
     if (%r = 4) then var Direction southeast
     if (%r = 5) then var Direction south
     if (%r = 6) then var Direction southwest
     if (%r = 7) then var Direction west
     if (%r = 8) then var Direction northwest
     #
     if (%r = 1) then var Reverse.Direction south
     if (%r = 2) then var Reverse.Direction southwest
     if (%r = 3) then var Reverse.Direction west
     if (%r = 4) then var Reverse.Direction northwest
     if (%r = 5) then var Reverse.Direction north
     if (%r = 6) then var Reverse.Direction northeast
     if (%r = 7) then var Reverse.Direction east
     if (%r = 8) then var Reverse.Direction southeast
     #
     var Exits 0
     if ($north) then math Exits add 1
     if ($northeast) then math Exits add 1
     if ($east) then math Exits add 1
     if ($southeast) then math Exits add 1
     if ($south) then math Exits add 1
     if ($southwest) then math Exits add 1
     if ($west) then math Exits add 1
     if ($northwest) then math Exits add 1
     #
     # don't move "back" on a path unless we hit a dead end
     if (%Exits > 1) && ("%Last.Direction" = "%Reverse.Direction") then goto RZEast
     #
     var Last.Direction %Direction
	 if matchre("$roomobjs", "sickly tree") then
		{
		put climb tree
		return
		}
     gosub MOVE_RESUME
	goto RZEast
	
RZWest:
     var randomlabel RZWest
	 delay 0.0001
     random 1 5
     if (%r = 1) && (!$north) then goto RZWest
     if (%r = 2) && (!$northwest) then goto RZWest
     if (%r = 3) && (!$west) then goto RZWest
     if (%r = 4) && (!$southwest) then goto RZWest
     if (%r = 5) && (!$south) then goto RZWest
	 if (%r = 1) then gosub move north
     if (%r = 2) then gosub move northwest
     if (%r = 3) then gosub move west
     if (%r = 4) then gosub move southwest
     if (%r = 5) then gosub move south
	 if matchre("$roomobjs", "path") then
		{
		move go path
		return
		}
	goto RZWest
	
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
MOVE_RESUME:
     matchre MOVE_RESUME ^\.\.\.wait|^Sorry\,
     matchre MOVE_RESUME ^You make your way up the .*\.\s*Partway up\, you make the mistake of looking down\.\s*Struck by vertigo\, you cling to the .* for a few moments\, then slowly climb back down\.
     matchre MOVE_RESUME ^You pick your way up the .*\, but reach a point where your footing is questionable\.\s*Reluctantly\, you climb back down\.
     matchre MOVE_RESUME ^You approach the .*\, but the steepness is intimidating\.
     matchre MOVE_RESUME ^You struggle
     matchre MOVE_RESUME ^You blunder
     matchre MOVE_RESUME ^You slap
     matchre MOVE_RESUME ^You work
     matchre MOVE_RESUME make much headway
     matchre MOVE_RESUME ^You flounder around in the water\.
     matchre MOVE_RETREAT ^You are engaged to .*\!
     matchre MOVE_STAND ^You start up the .*\, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE_STAND ^Running heedlessly over the rough terrain\, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE_STAND ^You can't do that while lying down\.
     matchre MOVE_STAND ^You can't do that while sitting\!
     matchre MOVE_STAND ^You must be standing to do that\.
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
	 matchre MOVE_FAILED ^You can't swim in that direction
     matchre MOVE_FAILED ^You can't go there
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait
	 
MOVE_RETREAT:
     pause 0.1
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait

MOVE_FAILED:	 
MOVE_RETURN:
	return