#debuglevel 10
goto end.of.file
##########################################################################################
#############################
# MAIN ACTIONS
#############################
################################################################################################
#################################
###GENIEHUNTER WEAPON CONTROL
### SORT GOSUB
### USAGE:
### var skills Medium_Edged|Heavy_Edged|Long_Bow
### var count 3
### gosub sort %skills %count
### echo %sort
sort:
var items $1
var count $2
math count subtract 1
var i 0
if %count < 1 then var count 16
SORT.I:
var j %i
math j add 1
SORT.J:
if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
{
		var itemi %items(%i)
		var itemj %items(%j)
		eval items replace("%items", "%items(%i)", "temp2")
		eval items replace("%items", "%items(%j)", "temp1")
		eval items replace("%items", "temp1", "%itemi")
		eval items replace("%items", "temp2", "%itemj")
}
math j add 1
if %j <= %count then goto SORT.J
math i add 1
if %i < %count then goto SORT.I
var sort %items
return
#############################
SORT2:
skillcheck1:
gosub sort %skills %count
pause .1
	if $%sort(%ix).LearningRate > %maxexp then
		{
			evalmath ix (%ix + 1)
			goto skillcheck1
		}
	 if $%sort(%ix).LearningRate < %globalexp then
				{
					if "%sort(%ix)" = "%priorskill" then
								{
										evalmath ix (%ix + 1)
										goto skillcheck1
								}
					#gosub %sort(%ix)
						var priorskill %sort(%ix)
						evalmath i (%ix + 1)
					#put .geniehunter multi %%sort(%ix)
						return
				}
		if %ix != %countskills then
				{
						evalmath ix (%ix + 1)
						var ix 1
						goto skillcheck1
				}
		if %ix = %countskills then
				{
						evalmath ix (%ix + 1)
						var ix 16
						goto skillcheck1
				}
return
##############################################################
LEAVE.SEACAVES:
     gosub automove exit
     send go exit portal
     wait
     RETURN
     
TO.SEACAVE:
TO.SEACAVES:
     gosub automove portal
     pause 0.5
     send go meeting portal
     wait
     RETURN


##########################################
#### DUMPS TRASH
##########################################
EMPTY.PACK.CHECK:
     var bag $1
     action var contents $1 when ^You rummage through .+ and see (.*)\.  
     put rummage my %bag
     waitforre ^You rummage
     eval contents replace("%contents", ", ", "|")  
     eval contents replace("%contents", " and ", "|")  
     var contents |%contents|
     eval total count("%contents", "|")  
Loop:  
     eval item element("%contents", 1)  
     eval number count("%contents", "|%item")  
     var count 0
     gosub RemoveLoop
     action setvariable item $1 when ^@a .* (\S+)$
     put #parse @%item
     counter set %count
     if contains("%trash", "%item") then gosub storeitem
     if %contents != "|" then goto Loop  
     RETURN
RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents", "|%item|", "|")
     eval contents replace("%contents", "||" "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto RemoveLoop
storeitem:
     counter subtract 1
     pause 0.2
     send get my %item
     pause 0.2
     if contains("$roomobjs","driftwood log") then GOSUB putmy %item in log
     if contains("$roomobjs"," bucket of viscous gloop") then GOSUB putmy %item in bucket
     if contains("$roomobjs","waste bin") then GOSUB putmy %item in bin
     if contains("$roomobjs","oak crate") then GOSUB putmy %item in crate
     if contains("$roomobjs","firewood bin") then GOSUB putmy %item in bin
     else put drop my %item
     pause 0.2
     pause 0.1
     pause 0.1
     if %c = 0 then RETURN
     goto storeitem
putmy:
     if matchre("%item", "(%skins)") then put bund
     if "%item" = "rib" then put bund
     if "%item" = "barb" then put bund
     pause 0.1
     matchre RETURN You drop|You put
     matchre putmydrop What were you
     if contains("$roomobjs","driftwood log") then 
          {
          put put my %item in log
          matchwait
          }
     if contains("$roomobjs"," bucket of viscous gloop") then 
          {
          put put my %item in bucket
          matchwait
          }
     if contains("$roomobjs","waste bin") then 
          {
          put put my %item in bucket
          matchwait
          }
     if contains("$roomobjs","oak crate") then 
          {
          put put my %item in crate
          matchwait
          }
     send drop my %item
     matchwait
putmydrop:
     send drop my %item
     RETURN
###############################################################################################################################
#SEARCHES THE GROUND FOR AMMO / WEAPONS / ARMOR
stowAmmo:
     delay 0.001
     #gosub BLEEDERCHECK
     if contains("$righthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$lefthand" != "Empty") then gosub wear my $1
     if contains("$lefthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$righthand" != "Empty") then gosub wear my $1
     if contains("$roomobjs","(double-stringed crossbow|repeating crossbow|bloodwood dako'gi crossbow|forester's crossbow|bamboo crossbow|forester's bow|battle bow|assassin's crossbow") then gosub stow $1
     if contains("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then gosub STOWARROW
     if contains("$roomobjs","(river rock|river rocks|small rock|spider-carved rock)") then gosub STOWROCK
     if contains("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|drake-fang bolt|jagged-horn bolt|leafhead bolt|barbed bolt)") then gosub STOWBOLT
     if matchre("$roomobjs","throwing blade") then gosub STOWBLADE
     if matchre("$roomobjs","telothian bola") then gosub STOW bola
     if matchre("$roomobjs","silver-edged star") then gosub STOWSTARS
     if matchre("$roomobjs","quartzite stone shard") then gosub STOW shard
     if matchre("$roomobjs","(ironwood shield|wooden shield)") then gosub stow $1
     if matchre("$roomobjs","(elongated stones|granite stone|panther-carved stone|goblin-carved stones|unicorn-carved stone)") then gosub stow stone
     if matchre("$roomobjs","(pyrite clump|smoky-quartz clump)") then gosub stow clump
     if matchre("$roomobjs","sleek quadrello") then gosub stow quadrello
     if matchre("$roomobjs","small shield|azure-scale shield") then gosub stow shield
     if matchre("$roomobjs","stones") then gosub stow stones
     if matchre("$roomobjs","hand claws") then gosub stow hand claw
     if matchre("$roomobjs","T'Kashi mirror flamberge") then gosub stow mirror flamberge
     if matchre("$roomobjs","T'Kashi mirror flail") then gosub stow mirror flail
     if matchre("$roomobjs","mirror blade") then gosub stow mirror blade
     if matchre("$roomobjs","mirror knife") then gosub stow mirror knife
     if matchre("$roomobjs","Nisha short bow") then gosub stow nisha bow
     if matchre("$roomobjs","razor-sharp damascus steel sabre") then gosub stow sabre
     if matchre("$roomobjs","glaes and kertig-alloy katana capped with an ornate dragonfire amber pommel") then gosub stow katana
     if !matchre("$roomobjs","(mirror axe|stonebow|pasabas|briquet|battle bow|akabo|mallet|throwing spike|steel scimitar|thrusting blade|flail|kneecapper|spear|hammer|throwing hammer|bone club|javelin|tago|staff sling|bludgeon|quarrel|short bow|\btelo\b|flamberge|flail|nightstick|khuj|iltesh|ngalio|hirdu bow|halberd|mirror blade|katana|morning star|war club|shadowy-black sling|staff sling|mattock|leathers|balaclava|helmet|helm|gauntlets|mail gloves|sniper's crossbow|light crossbow|targe\b|great helm|throwing axe|throwing club|bastard sword|jambiya|katar|throwing blade|composite bow|bola|short bow)") then RETURN
     gosub stow $1
     pause 0.1
     goto stowAmmo
STOWSTARS:
     delay 0.001
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","silver-edged star") then 
          {
               send stow star
               send stow star
               waitforre ^You|^I|^What|^Sorry|^Stow|...wait
          }
     pause 0.1
     pause 0.1
     pause 0.001
     if contains("$roomobjs","silver-edged star") then goto STOWSTARS
     RETURN
STOWBLADE:
     delay 0.001
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","throwing blade") then 
          {
               send stow throwing blade
               send stow throwing blade
               waitforre ^You|^I|^What|^Sorry|^Stow|...wait
          }
     pause 0.1
     pause 0.1
     pause 0.001
     if contains("$roomobjs","throwing blade") then goto stowblade
     RETURN
STOWARROW:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then 
          {
               gosub stow $1
               gosub stow $1
          }
     pause 0.1
     pause 0.1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then goto stowarrow
     RETURN
STOWBOLT:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt|crossbow bolt)") then
          {
               gosub stow $1
               gosub stow $1
          }
     pause 0.1
     pause 0.1
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt)") then goto STOWBOLT
     RETURN
STOWROCK:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","a small rock") then 
          {
               put stow small rock
               put stow small rock
          }
     pause 0.1
     pause 0.1
     if contains("$roomobjs","a small rock") then goto STOWROCK
     RETURN
#### MAIN STOW ROUTINE
STOWING:
     delay 0.0001
     var LOCATION STOWING
     if matchre("$righthand" "$lefthand" ,"grass") then put drop grass
     if matchre("$righthand" "$lefthand" ,"grass") then put drop grass
     if "$righthand" = "grass" then put drop grass
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     #if matchre("$righthandnoun","(crossbow|bow|short bow)") then gosub unload
     if matchre("$righthandnoun","(block|granite block)") then put drop block
     if matchre("$lefthandnoun","(block|granite block)") then put drop block
     if matchre("$righthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN
STOW:
     var LOCATION STOW1
     var todo $0
STOW1:
     delay 0.0001
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW2 not designed to carry anything|any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|^But that's closed|I can't find your container|^You can't 
     matchre RETURN ^Wear what\?|^Stow what\?  Type 'STOW HELP' for details\.
     matchre RETURN ^You put
     matchre RETURN ^You open
     matchre RETURN needs to be
     matchre RETURN ^You stop as you realize
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^That can't be picked up
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW (base.inc)
STOW2:
     delay 0.0001
     var LOCATION STOW2
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre stow3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %DEFAULT.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW2! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW2 (base.inc)
STOW3:
     delay 0.0001
     var LOCATION STOW3
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %BOX.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW3! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (base.inc)
STOW4:
     delay 0.0001
     var LOCATION stow4
     var bagsFull 1
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your
     matchre RETURN ^But that is already in your inventory\.
     matchre REM.WEAR any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %GEM.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW4! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW4 (base.inc)
OPEN.THING:
     put open %BOX.CONTAINER
     put open %DEFAULT.CONTAINER
     pause 0.2
     goto STOWING
REM.WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto WEAR1
#### FILL GEM POUCHES
GEM_POUCHES:
GEM.POUCHES:
     gosub get my gem pouch
     pause 0.1
     gosub put tie my pouch
     pause 0.1
     pause 0.1
     var fill %DEFAULT.CONTAINER
     gosub FILL.POUCH
     pause 0.1
     var fill %BOX.CONTAINER
     gosub FILL.POUCH
     pause 0.1
     var fill %GEM.CONTAINER
     gosub FILL.POUCH
     pause 0.1
     send stow my pouch
     pause 0.1
     RETURN
FILL.POUCH:
     delay 0.0001
     pause 0.1
     matchre NEW.POUCH ^The pouch is too full to fit|^The gem pouch is too full|You can't fill anything|^The pouch is too full
     matchre RETURN ^You fill|^There aren't|^You open your|^What were you
     put fill my gem pouch with my %fill
     matchwait 10
     RETURN
NEW.POUCH:
     delay 0.0001
     pause 0.1
     send open my %GEMPOUCH.CONTAINER
     pause 0.5
     pause 0.5
     send put my pouch in my %GEMPOUCH.CONTAINER
     pause 0.1
     pause 0.5
     send close my %GEMPOUCH.CONTAINER
     pause 0.5
     pause 0.1
GET.POUCH:
     pause 0.2
     send get my gem pouch
     pause 0.5
     send tie my pouch
     pause 0.3
     pause 0.1
     RETURN
#### EMPTY HANDS
EMPTY_HANDS:
     delay 0.0001
     if ("$lefthand" != "Empty") then gosub STOW my $lefthandnoun
     if ("$righthand" != "Empty") then gosub STOW my $righthandnoun
     RETURN
#### EMPTY LEFT HAND
EMPTY_LEFT:
     delay 0.0001
     var LOCATION EMPTY_LEFT_1
     EMPTY_LEFT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You drop
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^Your left hand is already empty\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^I could not find what you were referring to\.
     send empty left
     matchwait
#### EMPTY RIGHT HAND
EMPTY_RIGHT:
     delay 0.0001
     var LOCATION EMPTY_RIGHT_1
     EMPTY_RIGHT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You drop
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^Your right hand is already empty\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^I could not find what you were referring to\.
     send empty right
     matchwait
### ORDERING SUB, FOR SHOPS
ORDER:
     delay 0.0001
     var order $0
     var LOCATION ORDER_1
     if ("$righthand" != "Empty") then gosub put put $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub put put $lefthand in my %CRAFTING.CONTAINER
     pause 0.5
     ORDER_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre ORDER_1 ^The attendant says\,\s*\"You can purchase .*\.\s*Just order it again and we'll see it done\!\"
     matchre RETURN ^The attendant takes some coins from you and hands you .*\.
     send order %order
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ORDER! (base.inc) ***
     put #echo >$Log Crimson $datetime Order = %order
     put #log $datetime MISSING MATCH IN ORDER! (base.inc)
     RETURN
#### PUT SUB
PUT:
     delay 0.0001
     var command $0
     var LOCATION PUT_1
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN_CLEAR ^You (?:hand|slide|get|work|pull|lob|spread|shuffle|attach|push|not|will|move|put|now|scan|wear|sling|slowly|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^But (that|you) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^The|^That|too injured
	 matchre RETURN_CLEAR ^You're
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already|has already
     matchre RETURN_CLEAR ^Tie it off
	 matchre RETURN_CLEAR ^What are you trying to attack\?
	 matchre RETURN_CLEAR ^At what are you trying to 
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^Your (?:actions|dance|fingers|song).*\.
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^Subservient type|^The shadows|^Close examination|^Try though
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Allows a Moon Mage
     matchre RETURN_CLEAR ^A slit across the door
     matchre RETURN_CLEAR ^You.*analyze
     matchre RETURN_CLEAR ^Having no further use for .*\, you discard it\.
     matchre RETURN_CLEAR ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN_CLEAR ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN_CLEAR ^Brother Durantine nods slowly\.
     matchre RETURN_CLEAR ^Durantine waves a small censer over a neatly-wrapped package and intones a short prayer before he hands it to you\.
     matchre RETURN_CLEAR ^After a moment\, .*\.
     matchre RETURN_CLEAR ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN_CLEAR ^Maybe you should stand up\.
     matchre RETURN_CLEAR ^The clerk counts out .*\.
     matchre RETURN_CLEAR ^The gem pouch
     matchre RETURN_CLEAR ^An attendant
     matchre RETURN_CLEAR ^The .* is not damaged enough to warrant repair\.
     matchre RETURN_CLEAR ^There is no more room in .*\.
     matchre RETURN_CLEAR ^There is nothing in there\.
     matchre RETURN_CLEAR ^In the .* you see .*\.
     matchre RETURN_CLEAR ^This spell cannot be targeted\.
     matchre RETURN_CLEAR ^You cannot figure out how to do that\.
     matchre RETURN_CLEAR ^You will now store .* in your .*\.
     matchre RETURN_CLEAR ^That tool does not seem suitable for that task\.
     matchre RETURN_CLEAR ^There isn't any more room in .* for that\.
     matchre RETURN_CLEAR ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN_CLEAR ^\s*LINK ALL CANCEL\s*\- Breaks all links
     matchre RETURN_CLEAR STOW HELP
     matchre RETURN_CLEAR ^This ritual may only be performed on a corpse\.
     matchre RETURN_CLEAR ^There is nothing else to face\!
     matchre RETURN_CLEAR ^There aren't
     matchre RETURN_CLEAR ^An offer
     matchre RETURN_CLEAR ^That area
     matchre RETURN_CLEAR ^Ylono (?:looks|frowns|shrugs|smiles) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Malik (?:nods|shakes) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Obvious exits
     matchre RETURN_CLEAR ^Obvious paths
     matchre RETURN_CLEAR ^But the merchant can't see you|are invisible|^Doing that would
     matchre STAND ^You should stand up first\.
     # matchre RETURN_CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Log Crimson $datetime Command = %command
     put #echo >Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >Log Crimson $datetime Command = %command
     put #log $datetime MISSING MATCH IN PUT
     RETURN
PUT_STOW:
     delay 0.0001
     gosub EMPTY_HANDS
     goto PUT_1
#### GET SUB
GET:
     delay 0.0001
     var get $0
     var LOCATION GET1
     GET1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You (?:get|grab|pick|pull|push|twist|carefully|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET (base.inc)
     RETURN
REM:
REMOVE:
     var LOCATION REMOVE1
     var remove $0
     REMOVE1:
     matchre RETURN ^You take
     matchre RETURN ^You slide
     matchre RETURN ^You sling
     matchre RETURN ^You slip
     matchre RETURN ^Roundtime
     matchre RETURN ^You remove
     matchre RETURN ^You pull off
     matchre RETURN ^You pull your
     matchre RETURN ^Remove what\?
     matchre RETURN ^You count out
     matchre RETURN ^You work your way out of
     matchre RETURN ^You aren't wearing
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You loosen the straps securing
     put remove %remove
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN REMOVE! (base.inc) ***
     put #echo >$Log Crimson $datetime Remove = %remove
     put #log $datetime MISSING MATCH IN Remove (base.inc)
     RETURN
#### HOLD SUB
HOLD:
     delay 0.0001
     var get $0
     var LOCATION HOLD1
     HOLD1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You are not experienced
     matchre RETURN ^You (?:sling|slide|work|slip|loosen|get|take|pull|remove|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^Get what\?
     matchre RETURN ^Hold hands with whom\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^I could not find what you were referring to\.
     send hold %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN HOLD (base.inc)
     RETURN
#### WEAR SUB
WEAR:
     delay 0.0001
     var stow $0
     var LOCATION WEAR1
     WEAR1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW1 ^You can't wear that\!
     matchre STOW1 ^You can't wear any more items like that\.
     matchre STOW1 ^You need at least one free hand for that\.
     matchre STOW1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|slide|slip|attach|work|strap|hang|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %stow
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %stow
     put #log $datetime MISSING MATCH IN WEAR (base.inc)
     RETURN
#### DOUBLE PUT SUB
PUT_IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT_IT_1
     PUT_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:hand|slide|get|work|pull|shuffle|attach|push|move|put|now|scan|wear|sling|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^.* what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send put %putit
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT_IT! (base.inc) ***
     put #echo >$Log Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT_IT (base.inc)
     RETURN
#### COMBAT ATTACK SUBS
ATTACK:
     delay 0.0001
     if ($stamina < 85) then gosub STAMINA_WAIT
     var LOCATION ATTACK_1
     ATTACK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You can not slam with .*\!
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^At what are you trying to .*\?
     matchre RETURN ^You need two hands to wield this weapon\!
     send attack
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ATTACK! (base.inc) ***
     put #log $datetime MISSING MATCH IN ATTACK (base.inc)
     goto ATTACK
DRAW:
     delay 0.0001
     var LOCATION DRAW_1
     DRAW_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^At what are you trying to .*\?
     send draw
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN DRAW! (base.inc) ***
     put #log $datetime MISSING MATCH IN DRAW (base.inc)
     goto DRAW
#### DODGE AND PARRY
DODGE:
     delay 0.0001
     var LOCATION DODGE_1
     DODGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are already dodging\!
     matchre RETURN ^You move into a position to dodge\.
     # matchre DODGE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send dodge
     matchwait
PARRY:
     delay 0.0001
     var LOCATION PARRY_1
     PARRY_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You are already in a position to parry\.
     matchre RETURN ^You move into a position to parry\.
     # matchre PARRY ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send parry
     matchwait
STAND_RET:
     put stand
     pause 0.5
RETREAT:
     var LOCATION RETREAT
     matchre RETREAT ^You stop advancing
     matchre 2RETREAT ^You retreat back to pole range\.
     matchre 2RETREAT ^You sneak back out
     matchre STAND_RET ^You must stand first\.
     matchre RETURN ^You retreat from combat\.
     matchre RETURN ^You are already as far away as you can get\!
     matchre RETURN ^You try to
     matchre RETURN revealing your hiding place\!
     put retreat
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (base.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (base.inc)
2RETREAT:
     var LOCATION 2RETREAT
     matchre RETURN ^You stop advancing
     matchre RETURN ^You retreat from combat\.
     matchre RETURN ^You retreat back to pole range\.
     matchre RETURN ^You sneak back out
     matchre RETURN ^You are already as far away as you can get\!
     matchre RETURN ^You try to
     matchre RETURN revealing your hiding place\!
     put retreat
     goto retry
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (base.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (base.inc)
#### WAIT FOR STAMINA
STAMINA_WAIT:
     delay 0.0001
     put #echo Crimson **************************************************
     put #echo Crimson ***** STAMINA IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson **************************************************
     if ($stamina < 85) then waiteval ($stamina > 90)
     RETURN
#### RANGED ATTACK SUBS
LOAD:
     delay 0.0001
     if (!$standing) then gosub STAND
     var LOCATION LOAD_1
     LOAD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre AIM ^You reach into your .* to load .*\.
     matchre AIM ^You load .* in your hand\.
     matchre AIM ^.* is already loaded with
     matchre LOAD_RETRIEVE ^You don't have the (?:right|proper) ammunition
     matchre LOAD_RETRIEVE ^As you try to
     matchre LOAD_STOW ^.* in your left hand
     send load
     matchwait
LOAD_STOW:
     delay 0.0001
     gosub STOW left
     goto LOAD
LOAD_RETRIEVE:
     delay 0.0001
     gosub RETRIEVE_CHECK
     goto LOAD
AIM:
     delay 0.0001
     if (!$standing) then gosub STAND
     if ($hidden) && ("$Guild" = "Paladin") then gosub UNHIDE
     var LOCATION AIM_1
     AIM_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre AIM_WAIT ^You begin to target
     matchre AIM_WAIT ^You are already targetting that\!
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What are you trying to attack\?
     matchre RETURN ^\[You're .*balanced?\]
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     send aim
     matchwait
AIM_WAIT:
     delay 0.0001
     matchre FIRE ^You think you have your best shot possible now\.
     matchre AIM ^You stop concentrating on aiming your weapon\.
     matchwait
FIRE:
     delay 0.0001
     if (!$standing) then gosub STAND
     var LOCATION FIRE_1
     FIRE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre FIRE_1 ^How can you poach if you are not hidden\?
     matchre RETURN ^You were aiming at a different target\, but you fire anyway\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^\[You're .*balanced?\]
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     if ($hidden) then send poach
     else send fire
     matchwait
#### FACING SUBS
FACE:
     delay 0.0001
     gosub FACE_NEXT
     goto ASSESS
FACE_NEXT:
     delay 0.0001
     var LOCATION FACE_NEXT_1
     FACE_NEXT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You turn
     matchre RETURN ^There is nothing else to face\!
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Face what\?
     send face next
     matchwait
#### PREP
PREP_SPELL:
if $mana < 70 then goto return
PREP:
var location PREP1
var todo $0
PREP1:
matchre return ^You begin chanting a prayer
matchre return ^You direct your attention toward the heavens
matchre return ^You close your eyes and breathe deeply,
matchre return ^You trace an arcane sigil in the air,
matchre return ^Heatless orange flames blaze between your fingertips
matchre return ^Your eyes darken to black as a starless night
matchre return ^You raise your (arms|palms) skyward
matchre return ^You are already preparing
matchre return ^You begin chanting
matchre return ^Icy blue frost crackles up your arms
matchre return ^You make a careless gesture as you chant the words
matchre return ^Tiny tendrils of lightning jolt between your hands
matchre return ^The wailing of lost souls accompanies your preparations
matchre return ^Your skin briefly withers and tightens, becoming gaunt
matchre return ^Images of streaking stars falling from the heavens flash across your vision
matchre return ^A nagging sense of desperation guides your hands through the motions
matchre return ^You hastily shout the arcane phrasings needed to prepare
matchre return ^You deftly waggle your fingers in the precise motions needed to prepare
matchre return ^With great force, you slap your hands together before you and slowly pull them apart,
matchre return ^With no small amount of effort, you slowly recall the teachings
matchre return ^You struggle against your bindings to prepare
matchre return ^You have already
matchre return ^You raise one hand before you and concentrate
matchre return ^As you begin to focus on preparing
matchre return ^That won't affect your current attunement very much\.
put prepare %todo
matchwait 4
return

#### TM SPELL SUBS
TARGET_PREP:
     delay 0.0001
     var targetprep $0
     var LOCATION TARGET_PREP_1
     TARGET_PREP_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre TARGET_RELEASE ^You are not engaged to anything\, so you must specify a target to focus on\!
     matchre TARGET_RELEASE ^There is no need to target a .*\.  It is already dead\.
     matchre TARGET_RELEASE ^I could not find what you were referring to\.
     matchre TARGET_RELEASE ^This spell cannot be targeted\.
     matchre RETURN ^You begin to weave mana lines into a target pattern around .*\.
     matchre RETURN ^You begin chanting a psalm to invoke the .* spell\.
     send target %targetprep
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN TARGET_PREP! (base.inc) ***
     put #log $datetime MISSING MATCH IN TARGET_PREP (base.inc)
     RETURN
TARGET_WAIT:
     delay 0.0001
     matchre TARGET_RELEASE ^Your concentration slips for a moment, and your spell is lost\.
     matchre TARGET_RELEASE ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your target pattern dissipates because .* is dead\, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your pattern dissipates with the loss of your target\.
     matchre TARGET_CAST ^You feel fully prepared to cast your spell\.
     matchre TARGET_CAST ^Your target pattern has finished forming around the area\.
     matchre TARGET_CAST ^The formation of the target pattern around .* has completed\.
     matchre TARGET_CAST ^Your formation of a targeting pattern around .* has completed\.
     matchwait
TARGET_CAST:
     delay 0.0001
     var LOCATION TARGET_CAST_1
     TARGET_CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre TARGET_RELEASE ^You don't have a spell prepared\!
     matchre TARGET_RELEASE ^.* is already dead, so that's a bit pointless\.
     matchre TARGET_RELEASE ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your target pattern dissipates because the .* is dead\, but the main spell remains intact\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^You gesture
     send cast
     matchwait
TARGET_RELEASE:
     delay 0.0001
     gosub RELEASE
     RETURN
#### HUNT SUB
HUNT:
     delay 0.0001
     var LOCATION HUNT_1
     HUNT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You find yourself unable to hunt in this area\.
     matchre RETURN ^You take note of all the tracks in the area\, so that you can hunt anything nearby down\.
     send hunt
     matchwait
##### CRITTER APPRAISAL SUB
APPRAISE_CRITTER:
     delay 0.0001
     var critter NULL
     if matchre("$monsterlist" , "$KnownMonsters") then var critter $0
     if ("%critter" = "NULL") then RETURN
     gosub APPRAISE %critter quick
     RETURN
##### APPRAISAL SUB
APPRAISE:
     delay 0.0001
     var appraise $0
     var LOCATION APPRAISE_1
     APPRAISE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^It's dead\!
     matchre RETURN ^Appraise what\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You cannot appraise that when you are in combat\!
     matchre RETURN ^You can't determine anything about this creature\.
     matchre RETURN ^It's hard to appraise the .* when it's inside something\.
     matchre RETURN ^Appraise what\?  Type APPRAISE HELP for more information\.
     matchre RETURN ^You ponder that\, briefly\, but decide to let it go for now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send appraise %appraise
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN APPRAISE! (base.inc) ***
     put #echo >$Log Crimson $datetime Appraise = %appraise
     put #log $datetime MISSING MATCH IN APPRAISE! (base.inc)
     RETURN
#### STUDYING SUB
STUDY:
     delay 0.0001
     var study $0
     var LOCATION STUDY_1
     STUDY_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send study %study
     matchwait
#### SEARCH SUB
SEARCH:
     var todo $0
     var LOCATION SEARCH
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Success\!
     matchre RETURN ^Roundtime
     matchre RETURN ^You search around for a moment
     put search %todo
     matchwait 10
     RETURN
#### TIME SUB
TIME:
TIME.CHECK:
     matchre DAY.TIME dawn|early morning|mid-morning|midday|late morning|noon|early afternoon|mid-afternoon|late afternoon|sunrise
     matchre NIGHT.TIME early evening|mid-evening|late evening|evening|midnight|night|almost dawn|sunset|dusk|approaching sunrise
     matchre NO.TIME you can't tell
     put time
     matchwait 8
     goto NO.TIME
DAY.TIME:
     put #var TIME DAY
     var TIME DAY
     put observe weather
     RETURN
NIGHT.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     put observe weather
     RETURN
NO.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     put observe weather
     RETURN
#### STOP HUMMING
STOP.HUMMING:
     pause 0.1
     put stop play
     pause
     put stop hum
     pause
     RETURN
#### PAUSE SUB
PAUSE:
     if ($roundtime > 0) then pause $roundtime
     pause 0.5
     pause 0.1
     RETURN
#### RETREAT HIDE SUB
RET.HIDE:
     put stop hum
     pause 0.1
     pause 0.1
     pause 0.1
     send ret
     send ret
     pause 0.5
     pause 0.2
#### HIDING SUB
HIDE:
     delay 0.0001
     var hideCounter 0
     var LOCATION HIDE_1
     HIDE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre HIDE_INCREMENT ^.* notices your attempt to hide\!
     matchre HIDE_INCREMENT ^.* reveals you, ruining your hiding attempt\!
     matchre HIDE_INCREMENT ^.* discovers you, ruining your hiding place\!
     matchre RETURN ^You slip into a hiding
     matchre RETURN ^You melt into the background
     matchre RETURN ^Eh\?  But you're already hidden\!
     matchre RETURN ^You blend in with your surroundings
     send hide
     matchwait
HIDE_INCREMENT:
     delay 0.0001
     math hideCounter add 1
     if %hideCounter > 1 then RETURN
     goto HIDE_1
#### UNHIDING SUB
UNHIDE:
     delay 0.0001
     var LOCATION UNHIDE_1
     UNHIDE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are not hidden\!
     matchre RETURN ^You come out of hiding\.
     send unhide
     matchwait
KNEEL:
     pause 0.2
     send kneel
     pause 0.5
#### KHRI SUB
KHRI:
     delay 0.0001
     pause 0.01
     var LOCATION KHRI1
     var khri $0
KHRI1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
	matchre KHRI ^\.\.\.wait|^You are still stunned
	matchre KHRI.KNEEL ^Your mind and body are willing
	matchre RETURN not recognizable as a valid khri\.
	matchre RETURN ^Roundtime
	matchre RETURN ^Tapping into the well of mental power within
	matchre RETURN ^You have not recovered from your previous use of the \w+ meditation\.$
	matchre RETURN ^Focusing intently|^Roundtime|^Your mind is already focused
	matchre RETURN ^You are not trained in the
	matchre RETURN ^You strain, but cannot focus your mind enough to manage that\.$
	matchre RETURN ^You're already using the \w+ meditation.
	matchre RETURN ^Knowing that a dose of paranoia is healthy for any aspiring Thief, your mind fixates on every possible avenue of escape available to you\.$
	matchre RETURN ^Remembering the mantra of mind over matter, you let your dedicated focus seep into your muscles, feeling a sense of heightened strength as well a deeper instinctive understanding of your weaponry\.$
	matchre RETURN ^Focusing your mind, you look around yourself to find the subtle differences lurking in the shadows nearby\.  After several deep breaths, your senses have attuned themselves to finding the best hiding spots\.$
	matchre RETURN ^Willing your body to meet the heightened functionality of your mind, you feel your motions steady considerably\.$
	matchre RETURN ^With deep breaths, you recall your training and focus your mind into the most universal of meditations, improving your overall performance\.$
	matchre RETURN ^Taking a deep breath, you focus on making your mind and body one, your mental discipline trained on quickly noticing, analyzing, and evading approaching threats\.$
	matchre RETURN ^Centering your mind, you allow your practiced discipline to spread throughout your body, making thought and motion one\.$
	matchre RETURN ^You calm your body and mind, recalling your training on how to seek the vital part of any opponent.  Wrapping yourself in this cool composure, your eyes quickly become drawn to exposed weaknesses around you\.$
	matchre RETURN ^Purging yourself of all distractions and extraneous thoughts, you allow your mind and body to become one, becoming preternaturally aware of threats around you and the best ways to defend yourself\.$
	matchre RETURN ^Focusing your mind, you attempt to attune your senses to the paths between shadows\.$
	matchre RETURN ^Placing all of your worries and concerns aside, you mentally wall them off where they no longer bother you\.$
     put khri %khri
     matchwait 7
     RETURN
KHRI.KNEEL:
	pause 0.1
	send kneel
	pause 0.5
	pause 0.1
	send khri %khri
	pause 2
	pause
	gosub stand
	pause 0.1
	if !$standing then gosub stand
	RETURN
##### STANDING SUB
STAND:
     delay 0.0001
     var LOCATION STAND_1
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre WAIT ^The weight of all your possessions prevents you from standing\.
     matchre WAIT ^You are overburdened and cannot manage to stand\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STAND_RETURN ^You stand (?:back )?up\.
     matchre STAND_RETURN ^You are already standing\.
     send stand
     matchwait
     STAND_RETURN:
     pause 0.1
     pause 0.1
     if (!$standing) then goto STAND
     RETURN
#### UNLOAD RANGED SUB
UNLOAD:
     delay 0.0001
     var LOCATION UNLOAD_1
     UNLOAD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You unload .*\.
     matchre RETURN ^Your .* falls
     matchre RETURN ^You remain concealed
     matchre RETURN ^But your .* isn't loaded\!
     matchre RETURN ^You don't have a ranged weapon to unload\.
     matchre RETURN ^You must be holding the weapon to do that\.
     send unload
     matchwait
SWAP:
     var LOCATION SWAP1
     var todo $0
SWAP1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You have nothing to swap\!
     matchre RETURN ^You
     matchre RETURN ^You turn
     matchre RETURN ^You deftly change
     matchre RETURN ^You effortlessly switch
     matchre RETURN ^You fiercely switch
     matchre RETURN ^You switch your
     matchre RETURN ^Your eyes blaze
     matchre RETURN ^With a quiet
     put swap %todo
     matchwait 
#### WEAPON MANAGEMENT SUBS
WIELD:
     delay 0.0001
     var item $0
     var LOCATION WIELD_1
     WIELD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You draw
     matchre RETURN ^You're already holding .*\!
     matchre RETURN ^Your .* is too injured to draw .*\!
     matchre REMOVE_WEAPON ^Wield what\?
     matchre REMOVE_WEAPON ^What were you referring to\?
     matchre REMOVE_WEAPON ^You're wearing a.*\!  You'll need to remove it first\!
     send wield %item
     matchwait
REMOVE_WEAPON:
     delay 0.0001
     var LOCATION REMOVE_WEAPON_1
     REMOVE_WEAPON_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Remove what\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You remove .* from your belt\.
     matchre RETURN ^You sling .* off from over your shoulder\.
     send remove %item
     matchwait
SHEATH:
     delay 0.0001
     var item $0
     var LOCATION SHEATH_1
     SHEATH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You slip
     matchre RETURN ^You sheathe
     matchre RETURN ^Sheathe what\?
     matchre RETURN ^Sheathe your.*where\?
     matchre RETURN ^A .* is too long to fit in .*\.
     matchre RETURN ^The .* is too long to fit in .*\.
     send sheath %item
     matchwait
#### BUNDLE COUNTING SUBS
BUNDLE_COUNT:
     delay 0.0001
     var LOCATION BUNDLE_COUNT_1
     BUNDLE_COUNT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre BUNDLE_SET_ZERO ^What were you referring to\?
     matchre BUNDLE_SET_ZERO ^I could not find what you were referring to\.
     matchre BUNDLE_SET ^You flip through .* and find (\d+) skins? in it\.
     send count my bundle
     matchwait
BUNDLE_SET:
     delay 0.0001
     put #tvar bundleFull 0
     put #tvar bundleCount $1
     if ($bundleCount > 199) then put #tvar bundleFull 1
     RETURN
BUNDLE_SET_ZERO:
     delay 0.0001
     put #tvar bundleFull 0
     put #tvar bundleCount 0
     RETURN
#### FORAGING SUBS
DUMP_CHECK:
     delay 0.0001
     if !def(Dump.Time) then put #var Dump.Time $gametime
     put #var Dump.Last {#evalmath ($gametime - $Dump.Time)}
     if ($Dump.Last < 600) then return
     gosub DUMP_JUNK
     put #var Dump.Time $gametime
     put #save var
     return
DUMP_JUNK:
     delay 0.0001
     var LOCATION DUMP_JUNK_1
     DUMP_JUNK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^\[You have marked this room to be cleaned by the janitor\.  It should arrive shortly\.\]
     matchre RETURN ^The janitor was recently summoned to this room\.\s+Please wait \d+ seconds\.
     matchre RETURN ^You should just kick yourself in the shin\.  There is no junk here\.
     send dump junk
     matchwait 
FORAGE:
     delay 0.0001
     var forage $0
     var LOCATION FORAGE_1
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
     FORAGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You manage to find .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send forage %forage
     matchwait
CLEAN_ROOM:
     delay 0.0001
     var dumpster NULL
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
     if matchre("$roomobjs", "a bucket of viscous gloop|a waste bucket") then var dumpster bucket
     if matchre("$roomobjs", "a disposal bin|a waste bin|firewood bin") then var dumpster bin
     if matchre("$roomname", "Garden Rooftop\, Medical Pavilion") then var dumpster gutter
     if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomobjs", "a waste basket") then var dumpster basket
     if matchre("$roomobjs", "a tree hollow") then var dumpster hollow
     if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
     if matchre("$roomobjs", "a driftwood log") then var dumpster log
     if matchre("$roomobjs", "an oak crate") then var dumpster crate
     if matchre("$roomobjs", "ivory urn") then var dumpster urn
     pause 0.1
     if ("%dumpster" = "NULL") then return
     CLEAN_ROOM_2:
     delay 0.0001
     var object NULL
     if matchre("$roomobjs", "a rock") then var object rock
     if matchre("$roomobjs", "razorsharp claw") then var object claw
     if matchre("$roomobjs", "a vine") then var object vine
     if matchre("$roomobjs", "some grass") then var object grass
     if !matchre("%object", "NULL") then
          {
               gosub GET %object
               gosub PUT_IT my %object in %dumpster
               goto CLEAN_ROOM_2
          }
     gosub KICKEM
     else return 
COLLECT:
     delay 0.0001
     var collect $0
     var LOCATION COLLECT_1
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
     COLLECT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You cannot collect anything while in combat\!
     matchre RETURN ^You manage to collect a pile of .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre RETURN ^You survey the area and realize that any collecting efforts would be futile\.
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send collect %collect
     matchwait 4
KICKEM:
     delay 0.0001
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     return
KICKIT:
     delay 0.0001
     var LOCATION KICKIT_1
     KICKIT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^You take a step back and run up to the pile of .*\.
     send kick pile
     matchwait
#### SPELL CASTING
CAST:
     var spellPrepped 0
     var location CAST_1
     var todo $0
     CAST_1:
     pause 0.00001
     matchre CAST_1 ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Maintaining two cyclic spells at once is beyond your mental comprehension
     matchre RETURN ^You can't cast .* yourself
     matchre RETURN ^Your target pattern dissipates because .+ is dead, but the main spell remains intact\.
     matchre RETURN ^You strain, but are too mentally fatigued to finish the pattern, and it slips away\.
     matchre RETURN ^Something in the area prevents your spell from working\.|^The mental strain of initiating a cyclic spell so recently prevents you from formulating the spell pattern\.
     matchre RETURN ^Your spell barely backfires\.|^Your spell backfires somewhat\.|^Your spell backfires\.|^Your spell hopelessly backfires\.|^Your spell.*backfires?|^Currently lacking the skill to complete the pattern, your spell fails completely\.|^You can't cast that at yourself\!|^You don't have a spell prepared\!|^You can't cast .+ on .+\!|^The spell pattern resists the influx of unfocused mana\.  You are able to contain the backlash but doing so results in a splitting headache\.|^The spell pattern resists the influx of unfocused mana though you are able to channel the worst of the backlash into your nervous system\.|^The spell pattern resists the influx of unfocused mana though the backlash leaves you stunned\!|^The spell pattern resists the influx of unfocused mana, and a strange burning sensation backwashes from the spell pattern into your body\.
     matchre RETURN ^The spell pattern collapses at the last moment due to the undead state
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre RETURN ^You wave your hand\.
     matchre RETURN ^You gesture\.
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^Your .+ emits a loud \*snap\* as it discharges
     matchre RETURN ^You roll your hands in an elliptical pattern in front of you
     matchre RETURN ^Please rephrase|^Sheathing|^What were
     matchre RETURN ^You draw your hand|^You step inside
     matchre RETURN ^You are still stunned
     matchre RETURN ^You can't do that while entangled in a web
     matchre RETURN ^You don't seem to be able to move to do that
     matchre RETURN ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^You can't cast that at yourself\!
     matchre RETURN ^Maintaining two cyclic spells at once is beyond your mental comprehension
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^.* is already dead, so that's a bit pointless\.
     matchre RETURN ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre RETURN ^Your target pattern dissipates because the .* is dead\, but the main spell remains intact\.
     matchre RETURN ^You gesture
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre RETURN ^You raise your hand in an imaginary
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^Your spell pattern collapses
     matchre RETURN ^With a wave of your hand,
     matchre RETURN ^Your target pattern dissipates
     matchre RETURN ^You wave your hand\.
     matchre RETURN ^You place your hands on your temples
     matchre RETURN ^A newfound fluidity of your mind
     matchre RETURN ^Your heart skips a beat as your spell
     matchre RETURN ^With a flick of your wrist,
     matchre RETURN ^Your secondary spell pattern dissipates
     matchre RETURN ^You can't cast .+ on yourself\!
     matchre RETURN ^You make a holy gesture
     matchre RETURN ^You raise your palms and face to the heavens
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last moment\.
     put cast %todo
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN CAST! - %todo (base.inc) ***
     put #log $datetime MISSING MATCH IN CAST : %todo (base.inc)
     return

cast2:
     put face next
     goto cast1

POWER:
     var location power1
     var todo $0
     POWER1:
     matchre return ^Roundtime
     matchre return ^Something in the area is interfering
     matchre return ^I could not find who you were referring to\.
     put PERCEIVE %todo
     matchwait 2
     return

PREPARE:
     delay 0.0001
     var prepare $0
     var LOCATION PREPARE_1
     PREPARE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_RETURN ^You are already preparing the .* spell\!
     matchre SPELL_CAST_RETURN ^You begin chanting .* to invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^You mutter .* to yourself while preparing the .* spell\.
     matchre SPELL_CAST_RETURN ^With .* movements you prepare your body for the .* spell\.
     matchre SPELL_CAST_RETURN ^You raise your .* skyward\, chanting the .* of the .* spell\.
     matchre SPELL_CAST_RETURN ^You trace .* sigil in the air\, shaping the pattern of the .* spell\.
     matchre SPELL_CAST_RETURN ^You rock back and forth\, humming tunelessly as you invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You close your eyes and breathe deeply, gathering energy for the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^A soft breeze surrounds your body as you confidently prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Tiny tendrils of lightning jolt between your hands as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Heatless orange flames blaze between your fingertips as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Entering a trance-like state\, your hands begin to tremble as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You adeptly sing the incantations for the .* spell\, setting the words to a favorite tune\.
     matchre SPELL_CAST_RETURN ^You bring your hand slowly to your forehead as you begin chanting the words of the .* spell\.
     matchre SPELL_CAST_RETURN ^Icy blue frost crackles up your arms with the ferocity of a blizzard as you begin to prepare the .* spell\!
     matchre SPELL_CAST_RETURN ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_RETURN ^You giggle to yourself as you move through the syncopated gestures that accompany the preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Darkly gleaming motes of sanguine light swirl briefly about your fingertips as you gesture while uttering the .* spell\.
     matchre SPELL_CAST_RETURN ^As you begin to solemnly intone the .* spell a blue glow swirls about forming a nimbus that surrounds your entire being\.
     matchre SPELL_CAST_RETURN ^Your skin briefly withers and tightens\, becoming gaunt as the energies of the .* spell begin to build up through your body\.
     matchre SPELL_CAST_RETURN ^You trace an intricate rune in the air with your finger\, illusory lines lingering several seconds as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You begin reciting a solemn incantation\, causing familiar patterns of geometric shapes to circle your hand as the .* spell forms\.
     matchre SPELL_CAST_RETURN ^You take up a handful of dirt in your palm to prepare the .* spell\.  As you whisper arcane words\, you gently blow the dust away and watch as it becomes swirling motes of glittering light that veil your hands in a pale aura\.
     matchre SPELL_CAST_RETURN ^You recall the exact details of the .* symbiosis\, preparing to integrate it with the next spell you cast\.
     matchre SPELL_CAST_RETURN ^But you've already prepared the .* symbiosis\!
     matchre SPELL_CAST_DONE ^What do you want to prepare\?
     matchre SPELL_CAST_DONE ^That is not a spell you can cast\.
     matchre SPELL_CAST_DONE ^You wouldn't have the first clue how to do that\.
     matchre SPELL_CAST_DONE ^You stop\, convinced that there's no way to control that much mana\.
     matchre SPELL_CAST_FAIL ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_FAIL ^You feel intense strain as you try to manipulate the mana streams to form this pattern\, and you are not certain that you will have enough mental stamina to complete it\.
     send prepare %prepare
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PREPARE! (base.inc) ***
     put #echo >$Log Crimson $datetime Prepare = %prepare
     put #log $datetime MISSING MATCH IN PREPARE! (base.inc)
     goto SPELL_CAST_RETURN
SPELL_WAIT:
     delay 0.0001
     if ("$preparedspell" = "None") then RETURN
     matchre SPELL_CAST ^You feel fully prepared to cast your spell\.
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     matchwait
SPELL_CAST:
     delay 0.0001
     var LOCATION SPELL_CAST_1
     SPELL_CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You wave your hand\.
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast;-2 gesture
     matchwait
SPELL_WAIT_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then RETURN
     matchre RETURN ^You feel fully prepared to cast your spell\.
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Your target pattern dissipates because the creature is dead\, but the main spell remains intact
     matchwait
SPELL_CAST_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then RETURN
     var target $0
     var LOCATION SPELL_CAST_TARGET1
     SPELL_CAST_TARGET1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast %target;-2 gesture
     matchwait
SPELL_CAST_DONE:
     delay 0.0001
     put #queue clear
     RETURN
SPELL_CAST_FAIL:
     delay 0.0001
     gosub RELEASE
SPELL_CAST_RETURN:
     delay 0.0001
     RETURN
RELEASE_MANA:
     delay 0.0001
     if ("$preparedspell" != "None") then gosub RELEASE spell
     gosub RELEASE mana
     put #echo Crimson *****************************************************
     put #echo Crimson ***** ATTUNEMENT IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson *****************************************************
     if ($mana < 80) then waiteval ($mana > 79)
CHECK_MANA:
     delay 0.0001
     if ($mana < 25) then goto RELEASE_MANA
     RETURN
RELEASE:
     delay 0.0001
     var release $0
     var LOCATION RELEASE_1
     RELEASE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^\s*Encumbrance\s*\:
     put -release %release;-encumbrance
     matchwait
HARNESS:
     delay 0.0001
     var harness $0
     var LOCATION HARNESS_1
     HARNESS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RELEASE ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You tap into the mana from .* of the surrounding streams and
     send harness %harness
     matchwait
#### ARCANA SUBS
CHARGE:
     delay 0.0001
     var charge $0
     var LOCATION CHARGE_1
     CHARGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^The .* absorbs .* of the energy\.
     matchre RETURN ^You fail to channel any energy into the .* \.
     matchre RETURN ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You fail to channel any of the energy into .*\.
     matchre RETURN ^You strain\, but lack the mental stamina to charge .* this much\.
     matchre RETURN ^The .* is already holding as much power as you could possibly charge it with\.
     matchre RETURN ^The .* resists\, only absorbing part of the energy while the rest dissipates harmlessly\.
     send charge %charge
     matchwait
INVOKE:
     delay 0.0001
     var invoke $0
     var LOCATION INVOKE_1
     INVOKE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Your link to the .* is intact
     matchre RETURN ^The .* dim\, almost magically null\.  A very faint pattern indicates its readiness to absorb .*energy\.
     matchre RETURN ^The .* pulses .* energy\.  You reach for its center and forge a magical link to it\, readying .* mana for your use\.
     matchre INVOKE_1 ^The .* pulses .* energy\.  You reach for its center\, attempting to forge a magical link\, but fail\.
     send invoke %invoke
     matchwait
REMOVE_CAMBRINTH:
     delay 0.0001
     var cambrinth $0
     var LOCATION REMOVE_CAMBRINTH_1
     REMOVE_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:slide|remove|take off)
     send remove my %cambrinth
     matchwait
WEAR_CAMBRINTH:
     delay 0.0001
     var cambrinth $0
     var LOCATION WEAR_CAMBRINTH_1
     WEAR_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:hang|slide|place|attach|put on)
     matchre RETURN ^Wear what\?
     matchre RETURN ^You are already wearing that\.
     send wear my %cambrinth
     matchwait
#### FOCUS SUB
FOCUS:
     delay 0.0001
     var focus $0
     var LOCATION FOCUS_1
     FOCUS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You focus your magical senses on .*\.
     matchre RETURN ^You move into the chaotic tides
     matchre RETURN ^Your link to the .+ is intact\.
     matchre RETURN ^You reach out into the seemingly infinite strands of Lunar mana
     send focus %focus
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN FOCUS! (base.inc) ***
     put #log $datetime MISSING MATCH IN FOCUS! (base.inc)
     RETURN
#### PERCEIVE POWER SUB
PERCEIVE:
     delay 0.0001
     var perceive $0
     var LOCATION PERCEIVE_1
     PERCEIVE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^There isn't the slightest trace
     matchre RETURN ^You cannot detect the slightest trace
     matchre RETURN ^You aren't trained in the ways of magic\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You aren't trained in the ways of magic\, but you fake it\.
     send perceive %perceive
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PERCEIVE! (base.inc) ***
     put #log $datetime MISSING MATCH IN PERCEIVE! (base.inc)
     RETURN
#### INFUSE THAT ORB (Thanks to Dasffion)
CHARGE_ORB:
     delay 0.0001
     var infuse $0
     var LOCATION CHARGE_ORB_1
CHARGE_ORB_1:
     if ($Attunement.Ranks < 600) then
          {
               gosub HARNESS %infuse
               pause 1
          }
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     match RETURN having reached its full capacity
     matchre CHARGE_ORB_1 ^You sense that you were able to channel .*\.\s*A faint tugging sensation emanates from the orb\, as if it hungers for more\.
     match CHARGE_ORB_1 You strain
     match CHARGE_ORB_1 backfire
     match RETURN You sense that it cannot accept any more power
     match RETURN unable
     matchre RETURN ^You sense that you were able to channel .*\.\s*A sense of fullness emanates from the orb\.
     match RETURN You don't have a spell prepared
     # match cast.orb You do not
     put infuse OM %infuse
     matchwait 15
     RETURN
#### PERCEIVE HEALTH SUBS
PERCEIVE_HEALTH:
     delay 0.0001
     var LOCATION PERCEIVE_HEALTH_1
     PERCEIVE_HEALTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre PERCEIVE_RETURN ^You sense.*
     matchre PERCEIVE_RETURN ^You fail to sense anything\, however\.
     matchre PERCEIVE_PAUSE ^You're not ready to do that again\, yet\.
     send perceive health
     matchwait
PERCEIVE_RETURN:
     delay 0.0001
     RETURN
PERCEIVE_PAUSE:
     delay 0.0001
     pause 5
     goto PERCEIVE_HEALTH
################################
# BLEEDER CHECK/TENDING SYSTEM
################################
BLEEDERCHECK:
BLEEDER.CHECK:
BLEEDCHECK:
debuglevel 5
     delay 0.0001
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
     pause 0.001
     action goto BLEEDCHECK when The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
     action var BLEEDING_HEAD YES when ^(?!.*\(tended\))\s*(head)\s{7}(.*)
     action var BLEEDING_NECK YES when ^(?!.*\(tended\))\s*(neck)\s{7}(.*)
     action var BLEEDING_CHEST YES when ^(?!.*\(tended\))\s*(chest)\s{7}(.*)
     action var BLEEDING_ABDOMEN YES when ^(?!.*\(tended\))\s*(abdomen)\s{7}(.*)
     action var BLEEDING_BACK YES when ^(?!.*\(tended\))\s*(back)\s{7}(.*)
     action var BLEEDING_R_ARM YES when ^(?!.*\(tended\))\s*r(?:ight|.) arm\s{7}(.*)
     action var BLEEDING_L_ARM YES when ^(?!.*\(tended\))\s*l(?:eft|.) arm\s{7}(.*)
     action var BLEEDING_R_LEG YES when ^(?!.*\(tended\))\s*r(?:ight|.) leg\s{7}(.*)
     action var BLEEDING_L_LEG YES when ^(?!.*\(tended\))\s*l(?:eft|.) leg\s{7}(.*)
     action var BLEEDING_R_HAND YES when ^(?!.*\(tended\))\s*r(?:ight|.) hand\s{7}(.*)
     action var BLEEDING_L_HAND YES when ^(?!.*\(tended\))\s*l(?:eft|.) hand\s{7}(.*)
     action var BLEEDING_L_EYE YES when ^(?!.*\(tended\))\s*l(?:eft|.) eye\s{7}(.*)
     action var BLEEDING_R_EYE YES when ^(?!.*\(tended\))\s*r(?:ight|.) eye\s{7}(.*)
     action var BLEEDING_SKIN YES when ^(?!.*\(tended\))\s*(skin)\s{7}(.*)
     action var BLEEDING_HEAD YES when lodged\s*.* into your head
     action var BLEEDING_HEAD YES when lodged\s*.* in your head
     action var BLEEDING_NECK YES when lodged\s*.* into your neck
     action var BLEEDING_NECK YES when lodged\s*.* in your neck
     action var BLEEDING_CHEST YES when lodged\s*.* into your chest
     action var BLEEDING_CHEST YES when lodged\s*.* in your chest
     action var BLEEDING_ABDOMEN YES when lodged\s*.* into your abdomen
     action var BLEEDING_ABDOMEN YES when lodged\s*.* in your abdomen
     action var BLEEDING_BACK YES when lodged\s*.* into your back
     action var BLEEDING_BACK YES when lodged\s*.* in your back
     action var BLEEDING_R_ARM YES when lodged\s*.* into your right arm
     action var BLEEDING_R_ARM YES when lodged\s*.* in your right arm
     action var BLEEDING_L_ARM YES when lodged\s*.* into your left arm
     action var BLEEDING_L_ARM YES when lodged\s*.* in your left arm
     action var BLEEDING_R_LEG YES when lodged\s*.* into your right leg
     action var BLEEDING_R_LEG YES when lodged\s*.* in your right leg
     action var BLEEDING_L_LEG YES when lodged\s*.* into your left leg
     action var BLEEDING_L_LEG YES when lodged\s*.* into your left leg
     action var BLEEDING_R_HAND YES when lodged\s*.* into your right hand
     action var BLEEDING_R_HAND YES when lodged\s*.* in your right hand
     action var BLEEDING_L_HAND YES when lodged\s*.* into your left hand
     action var BLEEDING_L_HAND YES when lodged\s*.* in your left hand
     action var BLEEDING_L_EYE YES when lodged\s*.* into your left eye
     action var BLEEDING_L_EYE YES when lodged\s*.* in your left eye
     action var BLEEDING_R_EYE YES when lodged\s*.* into your right eye
     action var BLEEDING_R_EYE YES when lodged\s*.* in your right eye
     action var POISON YES when ^You.+(poisoned)
     action var POISON YES when ^You.+(poisoned)
BLEEDYES:
     if "$righthandnoun" = "arrow" then send drop arrow
     if "$lefthandnoun" = "arrow" then send drop arrow
     if "$righthandnoun" = "bolt" then send drop bolt
     if "$lefthandnoun" = "bolt" then send drop bolt
     pause 0.1
     echo [Checking for Bleeders]
     pause 0.1
     matchre yesbleeding Bleeding|arrow lodged|bolt lodged
     matchre END.OF.BLEEDER ^You pause a moment|^The THINK verb|Syntax:
     match bleedyes It's all a blur!
     put health;think
     matchwait 6
     echo [No bleeder found - exiting bleeder check]
     goto END.OF.BLEEDER
YESBLEEDING:
     echo **** HEALING BLEEDER ****
     if "%INFECTED" = "YES" then
     {
     echo *************************************
     echo **** WARNING ** YOU ARE INFECTED ****
     echo *************************************
     }
     if "%BLEEDING_HEAD" = "YES" then gosub tend head
     if "%BLEEDING_NECK" = "YES" then gosub tend neck
     if "%BLEEDING_CHEST" = "YES" then gosub tend chest
     if "%BLEEDING_ABDOMEN" = "YES" then gosub tend abdomen
     if "%BLEEDING_BACK" = "YES" then gosub tend back
     if "%BLEEDING_R_ARM" = "YES" then gosub tend right arm
     if "%BLEEDING_L_ARM" = "YES" then gosub tend left arm
     if "%BLEEDING_R_LEG" = "YES" then gosub tend right leg
     if "%BLEEDING_L_LEG" = "YES" then gosub tend left leg
     if "%BLEEDING_R_HAND" = "YES" then gosub tend right hand
     if "%BLEEDING_L_HAND" = "YES" then gosub tend left hand
     if "%BLEEDING_L_EYE" = "YES" then gosub tend left eye
     if "%BLEEDING_R_EYE" = "YES" then gosub tend right eye
     if "%BLEEDING_SKIN" = "YES" then gosub tend skin
     var BLEEDING_HEAD NO
     var BLEEDING_NECK NO
     var BLEEDING_CHEST NO
     var BLEEDING_ABDOMEN NO
     var BLEEDING_BACK NO
     var BLEEDING_R_ARM NO
     var BLEEDING_L_ARM NO
     var BLEEDING_R_LEG NO
     var BLEEDING_L_LEG NO
     var BLEEDING_R_HAND NO
     var BLEEDING_L_HAND NO
     var BLEEDING_L_EYE NO
     var BLEEDING_R_EYE NO
     var BLEEDING_SKIN NO
     goto END.OF.BLEEDER
TEND: 
     var bleeder $0
     echo ***************************
     echo [Tending Bleeder: %bleeder] 
     echo ***************************
     if $prone then gosub put stand
tend_bleeder:
     gosub put tend my %bleeder 
     pause 0.2
     pause 0.2
     pause 0.1
          if contains("$roomobjs","driftwood log") && ("$righthand" = "crossbow bolt") || ("$lefthand" = "crossbow bolt") then 
          {
          put put my bolt in log
          pause .1
          }
     pause 0.2
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
tend_bleeder2:
     pause 0.1
     gosub put tend my %bleeder 
     pause 0.1
          if contains("$roomobjs","driftwood log") && ("$righthand" = "crossbow bolt") || ("$lefthand" = "crossbow bolt") then 
          {
          put put my bolt in log
          pause .1
          }
     pause 0.2
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
     pause 0.1
     pause 0.1
     echo [Leaving Bleeder System]
     RETURN
END.OF.BLEEDER:
     var BLEEDING_HEAD NO
     var BLEEDING_NECK NO
     var BLEEDING_CHEST NO
     var BLEEDING_ABDOMEN NO
     var BLEEDING_BACK NO
     var BLEEDING_R_ARM NO
     var BLEEDING_L_ARM NO
     var BLEEDING_R_LEG NO
     var BLEEDING_L_LEG NO
     var BLEEDING_R_HAND NO
     var BLEEDING_L_HAND NO
     var BLEEDING_L_EYE NO
     var BLEEDING_R_EYE NO
     var BLEEDING_SKIN NO
     action remove The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
     debuglevel 0
     RETURN
#version 1.0
	Base.ListExtract:
		var Base.ListVar $1
		var Base.NounListVar $2
		var Base.ItemCountVar $3

		eval %Base.ListVar replace("%%Base.ListVar", ", ", "|")
		eval %Base.ListVar replacere("%%Base.ListVar", "( and )(?:a |an |some )(?!.*and (a |an |some ))","|")
		var %Base.ListVar |%%Base.ListVar
		eval %Base.ItemCountVar count("%%Base.ListVar", "|")
		var %Base.NounListVar %%Base.ListVar
	Base.ListExtract.Loop.Trim:
		eval %Base.NounListVar replacere ("%%Base.NounListVar", "\|[\w'-]+ ", "|")
		if contains("%%Base.NounListVar", " ") then goto Base.ListExtract.Loop.Trim
	RETURN   
     
     
#### AUTOMOVE
AUTOMOVE:
     # action var exit $1;var webtype $2;goto websarestupid when ^As you approach (?:an?|the)\b.*? ((?:[\w'-]+) [\w'-]+|[\w'-]+), you become tangled up in the.*? \b(metallic|spidersilk|phantasmal|dew-covered|shadowy nightweaver silk)\b webbing
     # action goto ABYSS_ESCAPE when ^With lightning speed, something large and arachnid bursts from below, dragging you into a web-filled, subterranean gloom!
     delay 0.00001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($hidden = 1) then gosub UNHIDE
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub RANDOMMOVE
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.00001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchre AUTOMOVE_FAILED ^You don\'t seem
     put #goto %Destination
     matchwait 4
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 160
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     pause 0.00001
     if ($standing = 1) then goto AUTOMOVE_RETURN
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing
     send stand
     matchwait 20
     goto AUTOMOVE_STAND
AUTOMOVE_FAILED:
     pause 0.00001
     # put #script abort automapper
     pause 0.00001
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     if (%automovefailCounter > 1) then send #mapper reset
     pause 0.1
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub RANDOMMOVE
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     put #echo
     put #echo >Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
AUTOMOVE_RETURN:
     action (moving) off
     var automovefailCounter 0
     var randomloop 0
     pause 0.00001
     return
     
################################
# MOVE SINGLE
################################
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
     var randomloop 0
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RETRY ^\.\.\.wait|^Sorry\, you may only type|^Please wait\.|You are still stunned\.
     matchre MOVE_RETURN_CHECK ^You can't (swim|move|climb) in that direction\.
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
     matchre MOVE_RETREAT ^You can't do that while engaged\!
     matchre MOVE_STAND ^You start up the .*\, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE_STAND ^Running heedlessly over the rough terrain\, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE_STAND ^You can\'t do that while lying down\.
     matchre MOVE_STAND ^You can\'t do that while sitting\!
     matchre MOVE_STAND ^You can\'t do that while kneeling\!
     matchre MOVE_STAND ^You must be standing to do that\.
     matchre MOVE_STAND ^You don\'t seem
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE_FAIL_BAIL ^You can't go there
     matchre MOVE_FAILED ^Noticing your attempt
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait 8
     goto MOVE_RETURN
MOVE_RETRY:
     pause
     goto MOVE_RESUME
MOVE_STAND:
     pause 0.00001
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_STAND ^You don\'t
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait 8
     goto MOVE_STAND
MOVE_RETREAT:
     pause 0.00001
     if ($invisible = 1) then gosub STOP_INVIS
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You stop advancing
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait 10
     goto MOVE_RETREAT
MOVE_DIG:
     pause 0.00001
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait 10
     goto MOVE_DIG
MOVE_DIG_STAND:
     pause 0.00001
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait 10
     goto MOVE_DIG_STAND
MOVE_FAILED:
     var moved 0
     math movefailCounter add 1
     if (%movefailCounter > 3) then goto MOVE_FAIL_BAIL
     pause 0.5
     put look
     pause 0.4
     goto MOVE_RESUME
MOVE_FAIL_BAIL:
     put #echo
     # put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     return
MOVE_RETURN_CHECK:
     put look
     pause 0.1
MOVE_RETURN:
     var moved 1
     pause 0.00001
     unvar moveloop
     unvar randomloop
     unvar movefailCounter
     return
FIND_MYSELF:
MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if $north then
          {
               gosub MOVE north
               return
          }
     if $northwest then
          {
               gosub MOVE northwest
               return
          }
     if $northeast then
          {
               gosub MOVE northeast
               return
          }
     if $southeast then
          {
               gosub MOVE southeast
               return
          }
     if $south then
          {
               gosub MOVE south
               return
          }
     if $west then
          {
               gosub MOVE west
               return
          }
     if $east then
          {
               gosub MOVE east
               return
          }
     if $southwest then
          {
               gosub MOVE southwest
               return
          }
     if $out then
          {
               gosub MOVE out
               return
          }
     if $up then
          {
               gosub MOVE up
               return
          }
     if $down then
          {
               gosub MOVE down
               return
          }
     if matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") then
          {
               gosub MOVE climb stair
               return
          }
     if matchre("$roomobjs $roomdesc","\bsteps\b") then
          {
               gosub MOVE climb step
               return
          }
     if matchre("$roomobjs $roomdesc","\b(exit|curtain|arch|door|gate|hole|hatch|trapdoor|path|animal trail|tunnel|portal)\b") then
          {
               gosub MOVE go $1
               return
          }
     echo *** No random direction possible?? Looking to attempt to reset room exit vars
     send search
     pause 0.4
     pause 0.2
     #might need a counter here to prevent infinite loops
     put look
     pause 0.5
     pause 0.2
     if (%moveloop > 6) then
          {
               echo *** Cannot find a room exit!! Stupid fog!
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               return
          }
     goto moveRandomDirection_2
###################################################################################
### RANDOM MOVEMENT ENGINE BY SHROOM
### GO IN RANDOM DIRECTIONS AND DON'T BACKTRACK FROM LAST MOVED DIRECTION IF POSSIBLE
### IF IT CANNOT FIND A DIRECTION, WILL TAKE ANY POSSIBLE EXIT IT CAN SEE
### WILL MOVE IN RANDOM DIRECTIONS IF IT CANNOT SEE ANY ROOM EXITS (PITCH BLACK)
###################################################################################
RANDOMMOVE:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if !($standing) then gosub STAND
     if matchre("%randomloop", "\b(12|30|50)\b") then
          {
               echo **** CANNOT FIND A ROOM EXIT????!
               put look
               pause 0.4
          }
     if (%randomloop > 25) then
          {
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               var lastmoved null
               gosub TRUE_RANDOM_2
          }
     if (%randomloop > 80) then
          {
               echo ################################
               echo *** Cannot find a room exit??? Stupid fog???
               echo *** ZONE: $zoneid | ROOM: $roomid
               echo *** SEND THE ROOM DESCRIPTION/EXITS WHEN YOU TYPE LOOK
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               echo *** SHOULD AUTO-RECOVER IF YOU CAN FIND AN EXIT
               echo ###############################
               pause 0.5
               put look
               pause 0.5
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               var lastmoved null
               var randomloop 0
               return
          }
     if matchre("$roomname", "\[Skeletal Claw\]") then
          {
               echo ##################################
               echo # IN THE SKELETAL CLAW! OH NO!!!
               echo # WE MIGHT DIE IF SOMEONE DOESN'T CAST UNCURSE ON IT!
               echo # ATTEMPTING TO ESCAPE.............
               echo ##################################
               gosub MOVE out
               return
          }
     if (matchre("$roomname", "Deadman's Confide, Beach") || matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname","Smavold's Toggery") then
          {
               gosub MOVE go door
               return
          }
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then
          {
               gosub MOVE climb pine branches
               return
          }
     if matchre("$roomname","Darkling Wood, Pine Tree") then
          {
               gosub MOVE climb white pine
               return
          }
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     if (%randomloop > 10) then
          {
          if matchre("$roomobjs","stone wall") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","narrow ledge") then
               {
                    gosub MOVE climb ledge
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","craggy niche") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","double door") then
               {
                    gosub MOVE go door
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","staircase") then
               {
                    gosub MOVE climb stair
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","the exit") then
               {
                    gosub MOVE go exit
               }
          if matchre("$roomobjs","\bdoor\b") then
               {
                    gosub MOVE go door
               }
          }
     if (%moved = 1) then return
     random 1 11
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if (%moved = 1) then return
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if (%moved = 1) then return
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%moved = 1) then return
     ### IF DONE 13 LOOPS WITH NO MATCH THEN CHECK FOR ANY OBVIOUS ROOM EXIT
     if (%randomloop > 13) then
          {
               if ($out) then gosub MOVE out
               if (%moved = 1) then return
               if (($north) && ("%lastmoved" != "south")) then gosub MOVE north
               if (($south) && ("%lastmoved" != "north")) then gosub MOVE south
               if (%moved = 1) then return
               if (($east) && ("%lastmoved" != "west")) then gosub MOVE east
               if (($west) && ("%lastmoved" != "east")) then gosub MOVE west
               if (%moved = 1) then return
               if (($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
               if (($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
               if (%moved = 1) then return
               if (($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
               if (($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","narrow hole") && ("%lastmoved" != "go hole")) then gosub MOVE go hole
               if (matchre("$roomobjs $roomdesc","\bcrevice") && ("%lastmoved" != "go crevice")) then gosub MOVE go crevice
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bgate") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (matchre("$roomobjs $roomdesc","\barch") && ("%lastmoved" != "go arch")) then gosub MOVE go arch
               if (%moved = 1) then return
               if (matchre("$roomexits","\bforward") && ("%lastmoved" != "forward")) then gosub MOVE forward
               if (matchre("$roomexits","\baft\b") && ("%lastmoved" != "aft")) then gosub MOVE aft
               if (%moved = 1) then return
               if (matchre("$roomexits","\bstarboard") && ("%lastmoved" != "starboard")) then gosub MOVE starboard
               if (matchre("$roomexits","\bport\b") && ("%lastmoved" != "port")) then gosub MOVE port
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit")) then gosub MOVE go exit
               if (matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path")) then gosub MOVE go path
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\btrapdoor\b") && ("%lastmoved" != "go trapdoor")) then gosub MOVE go trapdoor
               if (matchre("$roomobjs $roomdesc","\bcurtain\b") && ("%lastmoved" != "go curtain")) then gosub MOVE go curtain
               if (matchre("$roomobjs $roomdesc","\bdoor") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (matchre("$roomobjs $roomdesc","double door") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bportal\b") && ("%lastmoved" != "go portal")) then gosub MOVE go portal
               if (matchre("$roomobjs $roomdesc","\btunnel\b") && ("%lastmoved" != "go tunnel")) then gosub MOVE go tunnel
               if (matchre("$roomobjs $roomdesc","\bjagged crack\b") && ("%lastmoved" != "go crack")) then gosub MOVE go crack
               if (matchre("$roomobjs $roomdesc","\bthe street\b") && ("%lastmoved" != "go street")) then gosub MOVE go street
               if (matchre("$roomobjs $roomdesc","(?i)\ba gate\b") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair")) then gosub MOVE climb stair
               if (matchre("$roomobjs $roomdesc","\bsteps\b") && ("%lastmoved" != "climb step")) then gosub MOVE climb step
               if (matchre("$roomobjs $roomdesc","\btrail\b") && ("%lastmoved" != "go trail")) then gosub MOVE go trail
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bpanel\b") && ("%lastmoved" != "go panel")) then gosub MOVE go panel
               if (matchre("$roomobjs $roomdesc","\btent flap\b") && ("%lastmoved" != "go flap")) then gosub MOVE go flap
               if (matchre("$roomobjs $roomdesc","\bnarrow track\b") && ("%lastmoved" != "go track")) then gosub MOVE go track
               if (matchre("$roomobjs $roomdesc","\blava field\b") && ("%lastmoved" != "go lava field")) then gosub MOVE go lava field
          }
     if (%moved = 0) then goto RANDOMMOVE
     # if ($roomid = 0) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### RANDOM CARDINAL DIRECTIONS ONLY
RANDOMMOVE_CARDINAL:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 50) then
          {
               var lastmoved null
               var randomloop 0
               echo *** Cannot find a room exit??
               echo *** Attempting to Revert back..
               echo *** Trying Alternate Methods..
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then
          {
               gosub MOVE climb pine branches
               return
          }
     if matchre("$roomname","Darkling Wood, Pine Tree") then
          {
               gosub MOVE climb white pine
               return
          }
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     random 1 11
     if (%moved = 1) then return
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if (%moved = 1) then return
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if (%moved = 1) then return
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%moved = 1) then return
     if (%moved = 0) then goto RANDOMMOVE_CARDINAL
     # if ($roomid = 0) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### GO IN RANDOM DIRECTIONS, PREFER A SOUTHERN / WESTERN DIRECTION IF AVAILABLE
RANDOMMOVE_SOUTH:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 5) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
               return
          }
     if $south then
          {
               gosub MOVE south
               return
          }
     if $southwest then
          {
               gosub MOVE southwest
               return
          }
     if $southeast then
          {
               gosub MOVE southeast
               return
          }
     if $northwest then
          {
               gosub MOVE northwest
               return
          }
     if $west then
          {
               gosub MOVE west
               return
          }
     if $north then
          {
               gosub MOVE north
               return
          }
     if $northeast then
          {
               gosub MOVE northeast
               return
          }
     if $east then
          {
               gosub MOVE east
               return
          }

     if $out then
          {
               gosub MOVE out
               return
          }
     if $up then
          {
               gosub MOVE up
               return
          }
     if $down then
          {
               gosub MOVE down
               return
          }
     pause 0.01
     if (%moved = 0) then goto RANDOMMOVE_SOUTH
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### TRUE RANDOM USED FOR MOVING IN PURE RANDOM DIRECTIONS REGARDLESS OF WHATS IN ROOM (FOG FILLED OR DARK ROOMS)
TRUE_RANDOM_2:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 9) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
               return
          }
     random 1 8
     if (%r = 1) then gosub MOVE n
     if (%r = 2) then gosub MOVE ne
     if (%r = 3) then gosub MOVE e
     if (%r = 4) then gosub MOVE nw
     if (%r = 5) then gosub MOVE se
     if (%r = 6) then gosub MOVE s
     if (%r = 7) then gosub MOVE sw
     if (%r = 8) then gosub MOVE w
     if ($out) then gosub MOVE out
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit") then gosub MOVE go exit
     if matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path") then gosub MOVE go path
     if matchre("$roomobjs $roomdesc","\btrapdoor\b") && ("%lastmoved" != "go trapdoor") then gosub MOVE go trapdoor
     if matchre("$roomobjs $roomdesc","\bcurtain\b") && ("%lastmoved" != "go path") then gosub MOVE go curtain
     if matchre("$roomobjs $roomdesc","\bdoor") && ("%lastmoved" != "go door") then gosub MOVE go door
     if matchre("$roomobjs $roomdesc","\bgate") && ("%lastmoved" != "go gate") then gosub MOVE go gate
     if matchre("$roomobjs $roomdesc","\barch") && ("%lastmoved" != "go arch") then gosub MOVE go arch
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bportal\b") && ("%lastmoved" != "go portal") then gosub MOVE go portal
     if matchre("$roomobjs $roomdesc","\btunnel\b") && ("%lastmoved" != "go tunnel") then gosub MOVE go tunnel
     if matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair") then gosub MOVE climb stair
     if matchre("$roomobjs $roomdesc","\bsteps\b") && ("%lastmoved" != "climb step") then gosub MOVE climb step
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bpanel\b") && ("%lastmoved" != "go panel") then gosub MOVE go panel
     if matchre("$roomobjs $roomdesc","\bnarrow track\b") && ("%lastmoved" != "go track") then gosub MOVE go track
     if (%moved = 0) then goto TRUE_RANDOM_2
     return
TRUE_RANDOM:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 9) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
          }
     random 1 16
     if (%r = 1) then gosub MOVE n
     if (%r = 2) then gosub MOVE ne
     if (%r = 3) then gosub MOVE e
     if (%r = 4) then gosub MOVE nw
     if (%r = 5) then gosub MOVE se
     if (%r = 6) then gosub MOVE s
     if (%r = 7) then gosub MOVE sw
     if (%r = 8) then gosub MOVE w
     if (%r = 9) then gosub MOVE out
     if (%r = 10) then gosub MOVE up
     if (%r = 11) then gosub MOVE go door
     if (%r = 12) then gosub MOVE go path
     if (%r = 13) then gosub MOVE climb stair
     if (%r = 14) then gosub MOVE climb step
     if (%r = 15) then gosub MOVE go panel
     if (%r = 16) then gosub MOVE go arch
     if (%moved = 0) then goto TRUE_RANDOM
     return
RANDOMWEIGHT:
     var weight $1
     var randomweight
     if $%weight then var randomweight %randomweight|%weight
     if $north%weight then var randomweight %randomweight|north%weight
     if $south%weight then var randomweight %randomweight|south%weight
     eval randomweightcount count("%randomweight", "|")
RANDOMWEIGHT_2:
     if ("%randomweight" = "") then return
     random 1 %randomweightcount
     gosub MOVE %randomweight(%r)
     return
RANDOMNORTH:
     if (($north) && ("%lastmoved" != "south")) then
          {
               gosub MOVE north
               goto RANDOMSOUTH_RETURN
          }
     if (($northeast) && ("%lastmoved" != "southwest")) then
          {
               gosub MOVE northeast
               goto RANDOMSOUTH_RETURN
          }
     if (($northwest) && ("%lastmoved" != "southeast")) then
          {
               gosub MOVE northwest
               return
          }
     if (($west) && ("%lastmoved" != "east")) then
          {
               gosub MOVE west
               goto RANDOMSOUTH_RETURN
          }
     if (($east) && ("%lastmoved" != "west")) then
          {
               gosub MOVE east
               goto RANDOMSOUTH_RETURN
          }
     var lastmoved null
     return
RANDOMSOUTH:
     if (($south) && ("%lastmoved" != "north")) then
          {
               gosub MOVE south
               goto RANDOMSOUTH_RETURN
          }
     if (($southeast) && ("%lastmoved" != "northwest")) then
          {
               gosub MOVE southeast
               goto RANDOMSOUTH_RETURN
          }
     if (($southwest) && ("%lastmoved" != "northeast")) then
          {
               gosub MOVE southwest
               goto RANDOMSOUTH_RETURN
          }
     if (($east) && ("%lastmoved" != "west")) then
          {
               gosub MOVE east
               goto RANDOMSOUTH_RETURN
          }
     if (($west) && ("%lastmoved" != "east")) then
          {
               gosub MOVE west
               goto RANDOMSOUTH_RETURN
          }
     var lastmoved null
RANDOMSOUTH_RETURN:
     return
#### OLD RETRY - STILL USES location.unload
RETRY:
matchre location ^\.\.\.wait
matchre location ^Sorry, you may
matchre location ^Sorry, system is slow
matchre location ^You don't seem to be able to move to do that
matchre location.p ^It's all a blur
matchre location.p ^You're unconscious\!
matchre location.p ^You are still stunned
matchre location.p There is no need for violence here\.
matchre location.p ^You can't do that while entangled in a web
matchre location.p ^You struggle against the shadowy webs to no avail\.
matchre location.p ^You attempt that, but end up getting caught in an invisible box\.
matchre location1 ^You should stop playing before you do that\.
matchre location1 ^You are a bit too busy performing to do that\.
matchre location1 ^You are concentrating too much upon your performance to do that\.
matchwait 22
put #echo >Log yellow matchwait %location %todo

location.p:
pause
location:
pause .1
goto %location

location.unload:
GOSUB unload
var location stow1
GOSUB stow1
return

location.unload1:
GOSUB unload
var location wear1
GOSUB wear1
return

location1:
GOSUB stop.humming1
goto %location

return.p:
pause .1
return



#### CATCH AND RETRY SUBS
WAIT:
     delay 0.0001
     pause 0.1
     if (!$standing) then gosub STAND
     goto %LOCATION
WEBBED:
     delay 0.0001
     if ($webbed) then waiteval (!$webbed)
     if (!$standing) then gosub STAND
     goto %LOCATION
IMMOBILE:
     delay 0.0001
     if contains("$prompt" , "I") then pause 20
     if (!$standing) then gosub STAND
     goto %LOCATION
STUNNED:
     delay 0.0001
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
CALMED:
     delay 5
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
#### STANCE SUB
####
####  To use STANCE SET, type STANCE SET [EVASION #] [PARRY #] [SHIELD #] {ATTACK #}.
####  Evasion, Parry, and Shield are all required, while Attack is optional.
####
STANCETO:
     delay 0.0001
     eval stance tolower($1)
     delay 0.2
     if ("%stance" != "set") then
          {
               send stance %stance
               RETURN
          }
     if ("$2" != "NULL") then var stance1 $2
     if ("$3" != "NULL") then var stance2 $3
     if ("$4" != "NULL") then var stance3 $4
     if ("$5" != "NULL") then var stance4 $5
     send stance %stance %stance1 %stance2 %stance3 %stance4
     RETURN
#### HEALTH CHECKING
HEALTH_CHECK:
     delay 0.0001
     put #tvar needHealing 0
     delay 0.5
     matchre HEALTH_GOOD ^You have no significant injuries\.
     matchre HEALTH_BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH_CHECK
HEALTH_BAD:
     delay 0.0001
     put #tvar needHealing 1
     delay 0.5
     RETURN
HEALTH_GOOD:
     delay 0.0001
     put #queue clear
     put #tvar needHealing 0
     delay 0.5
     RETURN

#### RETURNS
RETURN:
     delay 0.0001
     RETURN
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     RETURN
#### END OF FILE
end.of.file: