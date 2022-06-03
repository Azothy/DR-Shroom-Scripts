#debuglevel 5
include utility.inc
if ($charactername = "Shroom") then
     {
     var CHEST.ARMOR khiynit robe
     var HEAD.ARMOR plate mask
     var HEAD2.ARMOR lamellar helm
     var HAND.ARMOR assassin's sleeves
     var LEG.ARMOR NULL
     var SHIELD diamondwood shield
     var KNUCKLE knuckle
     
     var MAIN.BAG rucksack
     var SECOND.BAG backpack
     var THIRD.BAG bottomless bag
     }
if ($charactername = "Azothy") then
     {
     var CHEST.ARMOR winter shirt
     var HEAD.ARMOR balaclava
     var HEAD2.ARMOR null
     var HAND.ARMOR gauntlet
     var LEG.ARMOR mail greaves
     var SHIELD shield
     var KNUCKLE hand claw
     
     var MAIN.BAG duffel bag
     var SECOND.BAG backpack
     var THIRD.BAG haversack
     }
if ($charactername = "Psilocybe") then
     {
     var CHEST.ARMOR quilted shirt
     var HEAD.ARMOR chain balaclava
     var HEAD2.ARMOR null
     var HAND.ARMOR lamellar gloves
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
		matchre REMOVE.AND.STOW.1 \bhelm|((?<=field|fluted|full|half|war|battle|lamellar|Imperial|kiralan|blue|blackened|jousting|silver|white|lunated|sniper's|icesteel|goffered|fluted|polished) (\bplate\b)(?! armor| gauntlets| gloves| greaves| helm| mask| balaclava| shirt)|steel plate(?! armor| gauntlets| gloves| greaves| helm| mask))|(?<=field|assassin's|chain|leather|bone|quilted|reed|black|plate|combat|body|clay|lamellar|hide|steel|mail|pale|polished|shadow|Suit of|suit|woven|yeehar-hide|kidskin|gladiatorial|sniper|sniper's|battle|tomiek|glaes|pale|ceremonial|sinuous|trimmed|carapace|Zaulguum-skin|coral|dark|violet|ridged) (\barmor\b)|armet(?! helm)|gauntlet|gloves|(?!pavise)shield|claw guards|kimono|odaj|(?<!ka'hurst )mail gloves|platemail legs|trousers|parry stick|leggings|handwraps|gown|\bhat\b|hand claws|boots|armguard|jacket|goggle|armwraps|footwraps|aegis|torso|buckler|\bhood\b|\bcowl\b|\bheater(?! shield)|\bpavise(?! shield)|scutum|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|longcoat|legwraps|\bcoat\b|\bcowl|cuirass|fauld|greaves|hauberk|\bhood\b|jerkin|leathers|lorica|mantle|(?<!crimson leather )\bmask\b|morion|pants|handguards|bodysuit|robe|sallet|(?<!fighting )shirt|sleeves|ticivara|tabard|tasset|thorakes|\blid\b|vambraces|vest|collar|coif|mitt|steel mail(?! armor| gauntlets| gloves| greaves| helm| mask| balaclava| shirt)|darkened mail|velnhliwa|bamarhliwa|shalhliwa|tunic|chausses|carapace(?! armor)
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


WEARARMOR:
     WEAR.ARMOR:
     ECHO 
     ECHO *** PUTTING ON ARMOR!! ***
     ECHO
     gosub retreat
     GOSUB REM.SHIELD
     GOSUB ADJUST.SHIELD.ARM
     gosub wear my %SHIELD
     gosub get my %CHEST.ARMOR
     gosub wear my %CHEST.ARMOR
     gosub get my %HEAD.ARMOR
     gosub wear my %HEAD.ARMOR
     if ("%HEAD2.ARMOR" != "null") then gosub get my %HEAD2.ARMOR
     if ("%HEAD2.ARMOR" != "null") then gosub wear my %HEAD2.ARMOR
     gosub get my %HAND.ARMOR
     gosub wear my %HAND.ARMOR
     gosub retreat
     gosub get my %LEG.ARMOR
     gosub wear my %LEG.ARMOR
     gosub get my %KNUCKLE
     gosub wear my %KNUCKLE
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

