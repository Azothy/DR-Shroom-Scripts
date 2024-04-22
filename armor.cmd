#debuglevel 5
################################################
## SET YOUR CHARACTER NAMES
## SET ARMOR TO "NULL" IF NOT USING THAT SLOT
##
## USE: .armor  - removes ANY worn armor
##      .armor wear  - wears all armor in vars
################################################
if ($charactername = "Shroom") then
     {
     var CHEST.ARMOR khiynit robe
     var HEAD.ARMOR leather cowl
     var HEAD2.ARMOR NULL
     var HAND.ARMOR assassin's sleeves
     var ABD.ARMOR NULL
     var LEG.ARMOR NULL
     var SHIELD diamondwood shield
     var KNUCKLE knuckle
     
     var MAIN.BAG rucksack
     var SECOND.BAG backpack
     var THIRD.BAG bottomless bag
     }
if ($charactername = "Healbitch") then
     {
     var CHEST.ARMOR assassin's coat
     var HEAD.ARMOR balaclava
     var HEAD2.ARMOR NULL
     var HAND.ARMOR gauntlets
     var ABD.ARMOR NULL
     var LEG.ARMOR lamellar greaves
     var SHIELD gais lotus
     var KNUCKLE hand claw
     
     var MAIN.BAG backpack
     var SECOND.BAG haversack
     var THIRD.BAG carryall
     }
if ($charactername = "Psilocybe") then
     {
     var CHEST.ARMOR quilted shirt
     var HEAD.ARMOR chain balaclava
     var HEAD2.ARMOR NULL
     var HAND.ARMOR lamellar gloves
     var ABD.ARMOR NULL
     var LEG.ARMOR light greaves
     var SHIELD targe
     var KNUCKLE handwrap
     
     var MAIN.BAG skull
     var SECOND.BAG bag
     var THIRD.BAG haversack
     }
if ($charactername = "Sulic") then
     {
     var CHEST.ARMOR shirt
     var HEAD.ARMOR ring helm
     var HEAD2.ARMOR mask
     var HAND.ARMOR gloves
     var ABD.ARMOR NULL
     var LEG.ARMOR pants
     var SHIELD targe
     var KNUCKLE knuckle
     
     var MAIN.BAG backpack
     var SECOND.BAG haversack
     var THIRD.BAG sack
     }
if ($charactername = "Maklor") then
     {
     var CHEST.ARMOR leather
     var HEAD.ARMOR chain helm
     var HEAD2.ARMOR null
     var HAND.ARMOR gloves
     var ABD.ARMOR NULL
     var LEG.ARMOR null
     var SHIELD shield
     var KNUCKLE knuckle
     
     var MAIN.BAG pack
     var SECOND.BAG haversack
     var THIRD.BAG duffel.bag
     }
if ($charactername = "Alucios") then
     {
     var CHEST.ARMOR jerkin
     var HEAD.ARMOR chain balaclava
     var HEAD2.ARMOR rugged vambraces
     var HAND.ARMOR scale gloves
     var ABD.ARMOR NULL
     var LEG.ARMOR light greaves
     var SHIELD shield
     var KNUCKLE knuckle
     
     var MAIN.BAG backpack
     var SECOND.BAG haversack
     var THIRD.BAG duffel.bag
     }
if ($charactername = "Hvinir") then
     {
     var CHEST.ARMOR rugged jerkin
     var HEAD.ARMOR chain balaclava
     var HEAD2.ARMOR rugged vambraces
     var HAND.ARMOR scale gloves
     var ABD.ARMOR NULL
     var LEG.ARMOR greaves
     var SHIELD shield
     var KNUCKLE knuckle
     
     var MAIN.BAG carryall
     var SECOND.BAG duffel bag
     var THIRD.BAG oilcloth bag
     }
if ($charactername = "Valgrind") then
     {
     var CHEST.ARMOR jerkin
     var HEAD.ARMOR chain balaclava
     var HEAD2.ARMOR rugged vambraces
     var HAND.ARMOR plate gauntlets
     var ABD.ARMOR NULL
     var LEG.ARMOR scale greaves
     var SHIELD sipar
     var KNUCKLE knuckle
     
     var MAIN.BAG carryall
     var SECOND.BAG haversack
     var THIRD.BAG duffel.bag
     }
START:
     echo CHECKING ARMOR
     if_1 then var command %1
     if contains("wear", tolower("%command")) then goto WEARARMOR
     if contains("remove", tolower("%command")) then goto ARMOR.REMOVE
     goto ARMOR.REMOVE

ARMOR.REMOVE:
     ECHO 
     ECHO *** REMOVING ARMOR!! ***
     ECHO
     gosub ARMOR.CHECK
     ECHO 
     ECHO *** DONE!
     ECHO *** YOU ARE NOW NAKED!
     ECHO *** BE CAREFUL!
     ECHO
     pause 0.2
     put #parse ARMOR.DONE
     put #parse ARMOR DONE!
     exit

ARMOR.CHECK:
	pause .1
		matchre REMOVE.AND.STOW.1 \bhelm|((?<=field|fluted|full|half|war|battle|lamellar|Imperial|kiralan|blue|blackened|jousting|silver|white|lunated|sniper's|icesteel|goffered|fluted|polished) (\bplate\b)(?! armor| gauntlets| gloves| greaves| helm| mask| balaclava| shirt)|steel plate(?! armor| gauntlets| gloves| greaves| helm| mask))|(?<=field|assassin's|chain|leather|bone|quilted|reed|black|plate|combat|body|clay|lamellar|hide|steel|mail|pale|polished|shadow|Suit of|suit|woven|yeehar-hide|kidskin|gladiatorial|sniper|sniper's|battle|tomiek|glaes|pale|ceremonial|sinuous|trimmed|carapace|Zaulguum-skin|coral|dark|violet|ridged) (\barmor\b)|armet(?! helm)|abyssium skull|gauntlet|gloves|(?!pavise)shield|claw guards|kimono|odaj|(?<!ka'hurst )mail gloves|platemail legs|trousers|parry stick|leggings|handwraps|gown|\bhat\b|hand claws|boots|armguard|jacket|goggle|armwraps|footwraps|aegis|torso|buckler|\bhood\b|\bcowl\b|\bheater(?! shield)|\bpavise(?! shield)|scutum|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|longcoat|legwraps|\bcoat\b|\bcowl|cuirass|fauld|greaves|hauberk|\bhood\b|jerkin|leathers|lorica|mantle|(?<!crimson leather )\bmask\b|morion|pants|handguards|bodysuit|robe|sallet|(?<!fighting )shirt|sleeves|ticivara|tabard|tasset|thorakes|\blid\b|vambraces|vest|caftan|collar|coif|mitt|steel mail(?! armor| gauntlets| gloves| greaves| helm| mask| balaclava| shirt)|darkened mail|gais lotus|galea|velnhliwa|bamarhliwa|shalhliwa|tunic|chausses|carapace(?! armor)
		matchre CLAW You have nothing of that sort|You are wearing nothing of that sort|You aren't wearing anything like that
	put inv armor
	matchwait

REMOVE.AND.STOW.1:
	var armor $0
REMOVE.ARMOR.1:
	var LAST REMOVE.ARMOR.1
		matchre ARMOR.CHECK Remove what\?
		matchre REMOVE.ARMOR.1 ^\.\.\.wait|^Sorry, you may only type|Roundtime
		matchre STOW.ARMOR.1 You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield|tower) .*(?:\.|\!|\?)?
		matchre STOW.ARMOR.1 ^Without any effort|the .* slide off|tug the .* free|Shaking your head|^Wiggling
          matchre ARMOR.CHECK ^You have nothing of that|^Remove what|^What
	put remove %armor
	matchwait
STOW.ARMOR.1:
	var LAST STOW.ARMOR.1
		matchre STOW.ARMOR.1 ^\.\.\.wait|^Sorry, you may only type|Roundtime
		matchre ARMOR.CHECK You put your|Stow what\?
		matchre STOW.ARMOR.2 any more room in|closed|no matter how you arrange|too heavy
	put stow %armor in my %MAIN.BAG
	matchwait	
STOW.ARMOR.2:
	var LAST STOW.ARMOR.2
		matchre STOW.ARMOR.2 ^\.\.\.wait|^Sorry, you may only type|Roundtime
		matchre ARMOR.CHECK You put your|What were you
		matchre STOW.ARMOR.3 any more room in|closed|no matter how you arrange|too heavy
	put put %armor in my %SECOND.BAG
	matchwait
STOW.ARMOR.3:
	var LAST STOW.ARMOR.3
		matchre STOW.ARMOR.3 ^\.\.\.wait|^Sorry, you may only type|Roundtime
		matchre ARMOR.CHECK You put your|What were you
		matchre NO.MORE.STOWING any more room in|closed|no matter how you arrange|too heavy
	put put %armor in my %THIRD.BAG
	matchwait
NO.MORE.STOWING:
	echo **   No more room for stowing; gonna just go for it   **
	put wear %armor
	RETURN
	
CLAW:
     gosub rem my hand claw
     gosub stowing
     pause .1
     RETURN
STOWING:
     delay 0.0001
     var LOCATION STOWING
     if matchre("$righthandnoun|$lefthandnoun", "zills") then put wear my zill
     if matchre("$righthand","(grass|braided grass)") then put drop my grass
     if matchre("$lefthand","(grass|braided grass)") then put drop my grass
     if matchre("$righthand","(vine|braided vine)") then put drop my vine
     if matchre("$lefthand","(vine|braided vine)") then put drop my vine
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
     var LOCATION STOW_1
     var todo $0
STOW_1:
     delay 0.0001
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW_2 not designed to carry anything|any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|^But that's closed|I can't find your container|^You can't 
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW (utility.inc)
STOW_2:
     delay 0.0001
     var LOCATION STOW_2
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre STOW_3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %MAIN.BAG
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW2! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW2 (utility.inc)
STOW_3:
     delay 0.0001
     var LOCATION STOW_3
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre STOW_4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %SECOND.BAG
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW3! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (utility.inc)
STOW_4:
     delay 0.0001
     var LOCATION STOW_4
     var bagsFull 1
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre REM_WEAR any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %THIRD.BAG
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW4! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW4 (utility.inc)
OPEN_THING:
     pause 0.1
     send open %MAIN.BAG
     send open %SECOND.BAG
     pause 0.5
     goto STOWING
REM_WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto WEAR_1

WEARARMOR:
     WEAR.ARMOR:
     ECHO 
     ECHO *** PUTTING ON ARMOR!! ***
     ECHO
     if ($monstercount > 0) then gosub retreat
     GOSUB REM.SHIELD
     GOSUB ADJUST.SHIELD.ARM
     gosub wear my %SHIELD
     gosub get my %CHEST.ARMOR
     gosub wear my %CHEST.ARMOR
     if ($monstercount > 0) then gosub retreat
     if !matchre("%HEAD.ARMOR", "(?i)NULL") then gosub get my %HEAD.ARMOR
     if !matchre("%HEAD.ARMOR", "(?i)NULL") then gosub wear my %HEAD.ARMOR
     if !matchre("%HEAD2.ARMOR", "(?i)NULL") then gosub get my %HEAD2.ARMOR
     if !matchre("%HEAD2.ARMOR", "(?i)NULL") then gosub wear my %HEAD2.ARMOR
     if ($monstercount > 0) then gosub retreat
     if !matchre("%HAND.ARMOR", "(?i)NULL") then gosub get my %HAND.ARMOR
     if !matchre("%HAND.ARMOR", "(?i)NULL") then gosub wear my %HAND.ARMOR
     if !matchre("%ABD.ARMOR", "(?i)NULL") then gosub get my %HAND.ARMOR
     if !matchre("%ABD.ARMOR", "(?i)NULL") then gosub wear my %HAND.ARMOR
     if ($monstercount > 0) then gosub retreat
     if !matchre("%LEG.ARMOR", "(?i)NULL") then gosub get my %LEG.ARMOR
     if !matchre("%LEG.ARMOR", "(?i)NULL") then gosub wear my %LEG.ARMOR
     if !matchre("%KNUCKLE", "(?i)NULL") then gosub get my %KNUCKLE
     if !matchre("%KNUCKLE", "(?i)NULL") then gosub wear my %KNUCKLE
     gosub get my parry stick
     gosub wear my parry stick
     put #var current.armor.head %HEAD.ARMOR
     put #var current.armor.hands %HAND.ARMOR
     put #save all
     ECHO 
     ECHO *** FINISHED! ***
     ECHO *** NOW WEARING ARMOR!
     ECHO
     put #parse ARMOR.DONE
     put #parse ARMOR DONE
     put #parse ARMOR DONE!
     put inv armor
     exit

REM.SHIELD:
     gosub get my %SHIELD
     gosub rem my %SHIELD
     pause 0.5
     RETURN

ADJUST.SHIELD.ARM:
     var LAST ADJUST.SHIELD.ARM
     pause .1
     pause .1
	matchre SAVE ^\.\.\.wait|^Sorry, you may only type
	matchre REM.SHIELD You'll have to remove|must be in your inventory
	matchre ADJUST.SHIELD.ARM shoulder
	matchre RETURN fit securely upon your left arm
     matchre RETURN ^You cannot
	matchre ADJUST.HANDS ^Your hands
	put adj my %SHIELD
	matchwait 

ADJUST.HANDS:
ADJUST_HANDS:
     pause .1
     gosub stowing
     put get my %SHIELD
     goto ADJUST.SHIELD.ARM

SAVE:
     pause
     goto %LAST

GET:
     delay 0.0001
     pause 0.1
     var todo $0
     var LOCATION GET1
     GET1:
     if ($standing = 0) then gosub STAND
     pause 0.1
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre GET2 ^Get what\?|Brushing
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre GET2 ^I could not find what you were referring to\.
     matchre GET2 ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre UNTIE_IT ^You should untie
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|might|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully (rested|prepared))|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^Without (any|a)|Brushing
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     send get %todo
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN GET! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN GET (ubercombat.cmd)
     return
GET2:
     delay 0.0001
     pause 0.1
     var LOCATION GET3
     GET3:
     if ($standing = 0) then gosub STAND
     pause 0.1
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?|Brushing
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre UNTIE_IT ^You should untie
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|might|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully (rested|prepared))|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^Without (any|a)|Brushing
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     send get %todo from my portal
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN GET! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN GET (ubercombat.cmd)
     return
#### WEAR SUB
WEAR:
     delay 0.0001
     var todo $0
     var LOCATION WEAR_1
     WEAR_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW_1 ^You can't wear that\!
     matchre STOW_1 ^You can't wear any more items like that\.
     matchre STOW_1 ^You need at least one free hand for that\.
     matchre STOW_1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|drape|slide|slip|attach|work|strap|hang|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN WEAR (utility.inc)
     return
HOLD:
     delay 0.0001
     var todo $0
     var LOCATION HOLD_1
     HOLD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:get|sling|slide|slip|work|loosen|take|pull|remove|grab|pick|pull|push|twist|carefully|are|loosen) .*(?:\.|\!|\?)?
     matchre RETURN ^Get what\?
     matchre RETURN ^Hold hands with whom\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^I could not find what you were referring to\.
     send hold %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (utility.inc) ***
     put #echo >$Log Crimson $datetime Get = %todo
     put #log $datetime MISSING MATCH IN HOLD (utility.inc)
     return
REM:
REMOVE:
     var LOCATION REMOVE_1
     var todo $0
     REMOVE_1:
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
     put remove %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN REMOVE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Remove = %todo
     put #log $datetime MISSING MATCH IN Remove (utility.inc)
     return
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
     matchre STAND_RETURN ^You stand up in the water
     matchre STAND_RETURN ^You are already standing\.
     send stand
     matchwait
     STAND_RETURN:
     pause 0.1
     pause 0.1
     if (!$standing) then goto STAND
     return     
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
RETURN:
pause 0.0001
return
