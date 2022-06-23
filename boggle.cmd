#debug 10
#############################
# BOGGLE BLAST BY SHROOM
#############################
var bag1 backpack
var bag2 bag
var bag3 rucksack
### PREMIUN OFF OR ON
var PREMIUM ON
### Gempouch name (gem pouch/black pouch/etc)
var Gempouch black pouch
### GARBAGE IS EVERYTHING YOU WANT TO DUMP - SCRIPT WILL DUMP EVERYTHING IN GARBAGE VARIABLE AND KEEP ANYTHING NOT IN GARBAGE VARIABLE 
put #tvar garbage cotton purse|simple necklace|pumpkin carved anklet|black blouse|black flannel pajamas|black silk pants|black wooden anklet|bone white towel|bath towel|bright orange cloak|bright orange silk fan|cerulean negeri blossom|chakrel amulet|dark blouse|woolen greatcloak|dark orange cloak|deep black towel|dingy grey robe|dusk-hued robe|fraying coat|homespun shirt|innocent-looking doll|wooden pumpkins|niello mirror|satin robe|glass globe|keyblank|gold earrings|silk wings|white leather boots|tomiek anklet|bronze compass|flamewood case|platinum mirror|salt-stained brass compass|cambrinth pumpkin|scarecrow doll|boggle ring|silver spectacles|rainbow cloak|black robe|stura atulave|tomiek-rimmed goggles|cambrinth armband|roughspun shirt|orange pumpkin|skirt|trapper's pouch|rencate cambrinth bracer|crimson negeri blossom|simple niello ring|platinum mirror|garnet|heart|cambrinth pumpkin|satin fabric|walking cane|silk robe|animite ring|wool fabric|platinum strands|potter's clay|sienna jar

################################
action (healing) goto reset when (\w+) (nods to you\.|grins like an idiot|stretches out a hand|grins bravely at you) 
action (healing) goto reset when \w+ whispers, "(?:[\s,]+)?(?:All clean|I should be finished|There ya go|You are healed|There now|There ya go|Ok $charactername, you are)
action (healingtouched) goto get_healing.getting_healed when You have a brief sensation that leaves your wounds tingling. 
action (healingtouched) goto get_healing.lean.done when (\w+) whispers, "(?:[\s,]+)?(?:I am working|I am still|I am healing \w+ right now\. Please wait\.|Dadgummit|Dagnabbit|My apologies|I'm currently healing)
action (healing) off
action (healingtouched) off
action var prize $1 when you pull out (.*)\!
action var prize $1 when  pulls (.*) from it, handing it to you.
     put sleep;sleep
     pause 0.1
     pause 0.2
     pause 0.1
START:
	if $stunned then gosub STUNNED
     if matchre("$roomname", "^\[Boggle Blast, Black Room\]") then put go door
     if matchre("$roomobjs", "a wheel-shaped door and a large pumpkin-hued arch") then put go arch
     if ($bleeding) then goto GET_HEALED
     if ("$roomname" != "Boggle Blast") then gosub automove boggle
     if ("$guild" = "Thief") then 
          {
               put khri dampen hasten sight focus prowess evanescence
               pause 2
          }
     pause 0.2
     goto GIVE.FARMER
FARMER.WAIT:
     pause 0.1
     pause 0.1
GIVE.FARMER:
     pause 0.2
     matchre GIVE.FARMER ^\.\.\.wait|^Sorry, you may only type|You are still stunned\.
     matchre FARMER.WAIT the game rooms are all full right now
     matchre BROKE The farmer frowns at you as you search your pockets for the money
	matchre START You are still stunned
     matchre LOAD The farmer takes your money
     put give farmer 200 dok
     matchwait
LOAD:
	if $stunned then gosub STUNNED
	var local LOAD
     matchre LOAD ^\.\.\.wait|^Sorry, you may only type|You are still stunned\.
	matchre LOAD2 You help yourself|You pick up
	matchre EMPTY Your hands are full
	matchre LOAD You are still stunned
     send get orange pumpkin
	matchwait
LOAD2:
	matchre FIRE.SLING You carefully load|It's already loaded
	matchre EMPTY You need to have a pumpkin in your hand and nothing in your other hand.
     send load sling
	matchwait
	 
FIRE.SLING:
	var local FIRE.SLING
	matchre FIRE.SLING ^\.\.\.wait|^Sorry, you may only type|You are still stunned\.
	matchre EMPTY You need at least one
     matchre GET.PRIZE ^You've taken all your shots|GO DOOR to the farmer and GET PRIZE
	matchre STAND ^You really should be standing to play
     matchre LOAD You have 4 shots remaining|You have 3 shots remaining|You have 2 shots remaining|You have 1 shot remaining|^The slingshot isn't
     send fire slingshot
     matchwait 25
     goto LOAD
	 
EMPTY:
     pause 0.5
	put empty right
	put empty left
	goto %local

STAND:
     if $stunned then gosub stunned
     put stand
     goto FIRE.SLING

STUNNED:
     pause 2
     if $stunned then goto stunned
     return

GET.PRIZE:
     pause 0.1
	if $stunned then gosub stunned
	if !$standing then put stand
	pause 1
     move go door
     put get prize
     pause
     pause 0.5
	pause 0.5
	pause 0.5
     if (matchre("%prize", "some Hollow Eve tickets")) then goto PRIZE.TICKETS
	if (matchre("%prize", "innocent-looking doll")) then goto special
     if (matchre("%prize", "silk fan")) then goto PRIZE.FAN
	if (matchre("%prize", "$garbage")) then goto PRIZE.DISCARD
     if (matchre("%prize", "stura atulave|niello ring|scroll|potency crystal|infuser stone|wallet")) then goto PRIZE.KEEP
     pause 0.5
     pause 0.2
     put #echo >Log RED * WON $righthand
     put stow right
     put stow left
     goto START
	 
PRIZE.TICKETS:
	put redeem tickets
	put #echo >Log White * Won Hollow's Eve Tickets!
	goto START
	
PRIZE.FAN:
     if matchre("$righthand","fan") then
          {
               send close my fan
               pause 0.5
               put put fan in bucket
               pause 0.5
          }
	# put #echo >Log RED * WON $righthand
	goto start
	
PRIZE.DISCARD:
     pause 0.1
     pause 0.3
	# put #echo >Log Yellow * Won $righthand - Trash
     echo *** DUMPING $righthand - Trash item
	put put $righthandnoun in bucket
     pause 0.5
     echo *** Pausing for a second...
     pause 2
	goto START
	
PRIZE.KEEP:
	put #echo >Log RED * WON $righthand
	put stow $righthandnoun
     pause
     echo *** Pausing for a second...
     pause
	goto START
     
GET_HEALED:
     var healloop 0
	if $stunned then gosub stunned
     pause 0.1
     echo
     echo *** GETTING HEALED!
     echo
     if matchre("$roomobjs", "and a large pumpkin-hued arch") then put go arch
     pause 0.5
     pause 0.5
     if matchre("$roomname", "Lowest Depths") then put nw
     pause 0.5
     pause 0.5
     gosub automove clearing
     pause 0.5
     if ("$game" != "DRF") then goto PRIME_HEAL 
WAIT_HEAL:
     # goto arch
     math healloop add 1
     if !matchre("$roomplayers","(Gwyddion|Marino|Sawbones|Bedlam|Skrillex|Odium|Spinebreaker|Thad|Bayndayd)") then goto PRIME_HEAL
     if matchre("$roomplayers", "Bayndayd") then var Empath Bayndayd
     if matchre("$roomplayers", "Thad") then var Empath Thad
     if matchre("$roomplayers", "Marino") then var Empath Marino
     if matchre("$roomplayers", "Sawbones") then var Empath Sawbones
     if matchre("$roomplayers", "Skrillex") then var Empath Skrillex
     if matchre("$roomplayers", "Bedlam") then var Empath Bedlam
     if matchre("$roomplayers", "Odium") then var Empath Odium
     if matchre("$roomplayers", "Spinebreaker") then var Empath Spinebreaker
	put lean %Empath
     pause 30
     gosub HEALTH_CHECK
     if !($needHealing) then goto RETURN_TO_BOGGLE
     if (%healloop > 3) then goto PRIME_HEAL
     goto WAIT_HEAL

PRIME_HEAL:
     pause 0.5
     send go path
     waitforre ^Out of the corner of your eye\, you spy a colorfully garbed attendant approaching you\, a silver knife in his hand\.
     pause 0.5
     put #mapper reset
     pause 0.5
     if ($zoneid = 66) then gosub automove east
     gosub automove healer
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     goto AUTO_HEALER
DONE_AUTOEMPATH:
     if ($zoneid = 67) then gosub automove east
     if ($zoneid != 66) then gosub automove portal 
     send go path
     waitforre ^\[Paasvadh Forest\, Clearing\]
     pause 0.5
     pause 0.4
     goto RETURN_TO_BOGGLE

RETURN_TO_BOGGLE:
     put #echo >Log DeepPink *** Got healed!
     pause 0.2
     put get %Gempouch
     pause 0.5
     put fill %Gempouch with my %bag1
     pause 0.3
     put fill %Gempouch with my %bag2
     pause 0.3
     put fill %Gempouch with my %bag3
     pause 0.3
     pause 0.3
     put stow %Gempouch
     pause 0.2
     gosub automove boggle
     pause 0.5
     goto START
     
BROKE:
     echo *** OUT OF MONEY!!
     exit
	 
SPECIAL:
	put put doll in bucket
	pause 30
	if $stunned then gosub STUNNED
	if !$standing then send stand
	goto START
	 
automove:
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
matchre autoreturn YOU HAVE ARRIVED
else put #goto %movement(%ccount)
matchwait 200
put #mapper reset
goto automove_1

travelmove:
put %movement(%ccount)
waitfor REACHED YOUR DESTINATION
goto autoreturn

autoreturn:
if %ccount = %mcount then return
math ccount add 1
goto automove_1

arch:
get_healing.find_healer:
	action (healing) on
	action (healingtouched) on
	#action goto count when Your patterns dissipate because your target is no longer in range
	counter set 1
     if !matchre("$roomplayers","(Gwyddion|Marino|Sawbones|Bedlam|Skrillex|Odium|Spinebreaker|Thad|Bayndayd)") then return
	action goto arch when Please wait, I will be back in about 30 seconds, and resume 
 	setvariable healed no 
     gosub clear
     if "%healed" = "no" then gosub get_healing.lean Marino
 	if "%healed" = "no" then gosub get_healing.lean Bedlam
	if "%healed" = "no" then gosub get_healing.lean Gwyddion
	if "%healed" = "no" then gosub get_healing.lean Sawbones
	if "%healed" = "no" then gosub get_healing.lean Kristen
 	if "%healed" = "no" then goto auto.path


auto.path:
#gosub automove heal
#goto auto.path2
action (healing) off
action (healingtouched) off
goto auto.path2

get_healing.done_leaning: 
 	echo *** get_healing.done_leaning *** 
 	if "%healed" = "no" then if $health < 30 then goto exit.temp.short 
 	if "%healed" = "no" then goto get_healing 
 	goto leave.arch 

get_healing.lean: 
     if !matchre("$roomplayers", "$1") then return
 	echo *** get_healing.lean $0 *** 
 	echo *** giving 20 seconds for them to touch me, or I'm moving on *** 
 	if contains("$roomplayers", "$1") then put lean $1
	else goto get_healing.lean.done
	pause 20
	goto get_healing.lean.done
 	matchwait 

get_healing.lean.done: 
 	echo *** get_healing.lean.done *** 
 	echo *** they didn't touch me, returning and trying next person *** 
	counter add 1
	goto %c

get_healing.getting_healed:
 	echo *** get_healing.getting_healed *** 
 	echo *** They touched me! Waiting 2 minutes or until they tell me they're done. *** 
	action remove bleeding
	action (healing) on
	action (healingtouched) on
	pause 300
	goto reset

reset:
#gosub get_healing.inactivate
action (healingtouched) off
action (healing) off     
put #echo >Log DeepPink *** Got healed
goto RETURN_TO_BOGGLE