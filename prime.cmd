## MASTER TRAINING SCRIPT BY SHROOM OF TF
#debuglevel 5
include base.cmd
timer start
put #tvar startTime $gametime 
RESTART:
put .scriptcheck
## WHAT MODULES DO YOU WANT TO USE? (OFF OR ON)
     var ROB.PEOPLE ON
     var ATHLETICS ON
     var ORIGAMI ON
     var COMPENDIUM ON
     var DISARMING ON
     var STEALING ON
     var ENGINEERING ON
     var ALCHEMY ON
## USER VARIABLES
     var KHRI.1 focus avoidance hasten 
     var KHRI.2 sagacity darken prowess
     var CHEST.ARMOR shirt
     var HEAD.ARMOR lamellar balaclava
     var HAND.ARMOR gauntlet
     var LEG.ARMOR mail greaves
     var SHIELD shield
     var DEFAULT.CONTAINER haversack
     var CRAFTING.CONTAINER satchel
     var BOX.CONTAINER backpack
     var GEM.CONTAINER duffel.bag
     var SHEATH baldric
     var GEMPOUCH.CONTAINER tort sack
     var COMBAT.ROOM 442
     var HUNTING.ROOM The Black Spire, Intercessor Chambers
     var HUNTING.ROOM2 The Black Spire, Equipment Storage
     var HUNTING.ROOM3 The Black Spire, Intercessor Training
     var BACKTRAIN.ROOM null
     var BACKTRAIN.ROOM2 null
     var BACKTRAIN OFF
     var SKINS ON
     var trash splintered vulture|scale|$origami|rib|arrowhead|grass|vine|pebble
     var scriptname prime
#####################################
##	  END  USER VARIABLES	   ##
### DEFAULT SCRIPT VARIABLES BELOW ##
#####################################
### GH WEAPON VARIABLES
     var Small_Edged 1
     var Light_Thrown 2
     var Crossbow 3
     var Backstab 4
     var Bow 5
     var Large_Edged 6
     var Staves 7
     var Twohanded_Edged 8
     var Small_Blunt 9
     var Heavy_Thrown 10
     var Large_Blunt 11
     var Polearms 12
     var Twohanded_Blunt 13
     var Slings 14
     var Brawling 15
     var Offhand_Weapon 16
     var skills Light_Thrown|Bow|Crossbow|Small_Edged|Large_Edged|Small_Blunt|Twohanded_Blunt|Twohanded_Edged|Large_Blunt|Polearms|Heavy_Thrown|Slings|Offhand_Weapon|Backstab|Staves|Brawling|
     var count 16
     var globalexp 10
     var maxexp 29
     var ix 0
     var priorskill none
     var COMBAT_LOOP 0
##########################
    var NEXT TOP
    action setvariable startingtdp $1;put #statusbar 8 ** Starting TDPs: %startingtdp when TDPs : (\d+)
    pause 0.001
    pause 0.001
    pause 0.001
    send info
    pause 0.5
    pause 0.2
    action remove TDPs : (\d+)
    send exp 0
    waitfor EXP
    pause 0.1
    pause 0.1
    pause 0.001
    if_1 then goto %1
####################
## BEGIN SCRIPT   ##
####################
ABSOLUTE.TOP:
TOP:
     put #echo >Log MediumOrchid ******** !!! MASTER SCRIPT INITIALIZED !!! ********
     GOSUB CLEAR
     var LAST ABSOLUTE.TOP
     var Combat.Last 0
     var STOLEN NO
     var ALCHEMY OFF
     var ENGINEERING OFF
     if $roomid = 0 then gosub moveRandomDirection
     if $roomid = 0 then gosub moveRandomDirection
     if $roomid = 0 then gosub moveRandomDirection
     if (%t > 38400) then goto AFK.TIME
     put #script abort all except %scriptname
     put #var Combat.Time $gametime
     put #save var
     put #window close Autosteal
     put #window close HitTracker
     put #window close HitTrackerLog
     put .scriptcheck
     pause 0.1
     gosub STOWING
     gosub HEALTH_CHECK
     if $zoneid = 1 then 
          {
          send .travel shard
          waitforre ^YOU ARRIVED
          }
     if (!$standing) then gosub STAND
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if ($needHealing) then goto LEAVE.COMBAT.AREA
     if $zoneid != 67 then goto BEGIN
BANK.INIT:
     var LAST BANK.INIT
     pause 0.1
     if $zoneid = 66 then gosub automove east
     if $zoneid = 116 then gosub automove 1exch
     else gosub AUTOMOVE exchange
     gosub DOKORAS
     if $zoneid = 116 then gosub automove 1tell
     else gosub AUTOMOVE teller
     gosub BANK
     gosub COMBINE.BANK
     math TOTAL.PROFIT add %Profit
     pause 0.5
     put #echo >Log Yellow *** BANKED - %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze, %Copper Copper
     pause 0.5
     pause 0.5
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     gosub CLEAR.BANK
BEGIN:
     gosub PUT open my bag
     pause 0.1
     gosub PUT open my back
     gosub PUT open my hav
     pause 0.3
     put exp all
     pause 0.3
     pause 0.1
     put close tort sack
     pause 0.5
     pause 0.5
####
     GOSUB status.update
     GOSUB stowing
     GOSUB stowAmmo
     if contains("$roomname", "%HUNTING.ROOM") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM2") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM3") then goto AT.COMBAT.ZONE
     goto ARMOR
ROPE.BRIDGE.STUCK:
     put #script abort all except %scriptname
     if $zoneid = 34 then
          {
          gosub automove river
          gosub automove river
          gosub automove river
          }
ARMOR:
     GOSUB ARMOR.CHECK
     if ("%REPAIR" = "ON") then goto REPAIR.ARMOR
CONTINUE:
     #GOSUB steal.check
     ### BOX CHECK
     GOSUB DISARM.CHECK
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if ("%BOXES" = "ON") && ($Locksmithing.LearningRate < 25) then goto DISARM.PRE
STEAL.PRE:
     if $Shield_Usage.LearningRate < 24 then goto EXP.CHECK
     if $Small_Edged.LearningRate < 2 then goto EXP.CHECK
     if $Crossbow.LearningRate < 2 then goto EXP.CHECK
     if $Light_Thrown.LearningRate < 2 then goto EXP.CHECK
     if $Thievery.LearningRate > 1 then goto EXP.CHECK
     goto TO.STEAL

EXP.CHECK:
     echo ...assessing experience....
     send exp all
     pause 0.1
     pause 0.1
     send info
     pause 0.1
     pause 0.1
     pause 0.1
     #if $Locksmithing.LearningRate > 10 then var BOXES OFF
     if contains("$roomname", "%HUNTING.ROOM") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM2") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM3") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%BACKTRAIN.ROOM") then goto BACKTRAIN
     if contains("$roomname", "%BACKTRAIN.ROOM") then goto BACKTRAIN
     #if %COMBAT_LOOP < 1 then goto COMBAT.GO
     #if $Locksmithing.LearningRate > 2 then goto COMBAT.GO
     ##if $Evasion.LearningRate < 1 then goto COMBAT.GO
     #if $Shield_Usage.LearningRate < 1 then goto COMBAT.GO
     #if $Small_Edged.LearningRate < 5 then goto COMBAT.GO
     #if $Crossbow.LearningRate < 1 then goto COMBAT.GO
     #if $Light_Thrown.LearningRate < 1 then goto COMBAT.GO
     ##if $Stealing.LearningRate < 1 then goto STEALING.GO
     #if $Climbing.LearningRate < 1 then goto CLIMBING.GO
     goto LOCATION.CHECK

COMBAT.GO:
     echo *** COMBAT! ***
     var TRAINING COMBAT
     goto TO.COMBAT

LOCATION.CHECK:
LOOK.CHECK:
     echo .....assessing location.....
     if contains("$roomname", "%HUNTING.ROOM") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM2") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%HUNTING.ROOM3") then goto AT.COMBAT.ZONE
     if contains("$roomname", "%BACKTRAIN.ROOM") then goto BACKTRAIN
     if contains("$roomname", "%BACKTRAIN.ROOM2") then goto BACKTRAIN
     #if contains("$roomname", "Fang Cove") then goto SEACAVES
     if $zoneid = 11 then gosub automove 2
     if $zoneid = 1a then
     {
     put go gap
     put west
     pause
     }
     if ("$zoneid = 69c") then gosub automove w gate
     if $zoneid = 4 then gosub automove cross
     if $zoneid = 8 then gosub automove cross
     if $zoneid = 34 then gosub automove 3
     if $zoneid = 9b then gosub automove NTR
     if $zoneid = 7 then gosub automove cross
     if $zoneid = 34a then gosub automove 145
     if $zoneid = 40 then gosub automove 251
     if $zoneid = 63 then gosub automove 112
     if $zoneid = 62 then gosub automove undergondola
     if $zoneid = 65 then gosub automove 1
     if "$zoneid = 68a" then gosub automove leave
     if $zoneid = 66 then gosub automove east
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 126 then gosub automove 103
     if $zoneid = 123 then goto TO.RAVEN.POINT
     if $zoneid = TF1 then goto MAZE
     if $zoneid = 14c then goto FALDESU
     if $zoneid = 1a then goto CROSSING.THIEF
     if $zoneid = 13 then goto DIRGE.LOCATION
     if $zoneid = 2a then goto CROSSING.TEMPLE
     if $zoneid = 9b then goto SOCIAL.OUTRAGE
     if $zoneid = 4a then goto ROSSMAN.LOCATION
     if $zoneid = 1 then goto CROSSING.LOCATION
     if $zoneid = 30 then goto HAVEN.LOCATION
     if $zoneid = 42 then goto THEREN.LOCATION
     if $zoneid = 61 then goto LETH.LOCATION
     if $zoneid = 116 then goto HIB.LOCATION
     if $zoneid = 127 then goto BOAR.CLAN.LOCATION
     if $zoneid = 67 then goto SHARD.LOCATION
     if $zoneid = 150 then goto FANG.COVE
     if $zoneid = 0 then GOSUB moveRandomDirection
     if $roomid = 0 then GOSUB moveRandomDirection
     pause .1
     echo UNKNOWN LOCATION!
     put #echo >Log Red UNKNOWN LOCATION $zoneid
     goto LOOK.CHECK
##################################################
#	  COMBAT TRAINING
##################################################
##################################################
# TO COMBAT SECTION
TO.COMBAT:
     var LAST TO.COMBAT
     var LAST COMBAT
     var escape.loop 0
     var BOXES OFF
     if $hidden = 1 then put shiv
     pause 0.1
     echo *** COMBAT!
     send open my bag
     pause 0.1
     pause 0.1
     pause 0.1
     if (%BACKTRAIN != "ON") then goto TO.COMBAT2
     GOTO TO.COMBAT2

########################
# PRE DISARM
########################
DISARM.PRE:
     var LAST DISARM.PRE
     var GEMS ON
     var TRAINING DISARM
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     put #echo >Log BlueViolet **** PRE-COMBAT PICKING EXCESS BOXES ****
     if $zoneid = 116 then 
          {
          GOSUB automove 75
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }          
     if $zoneid = 126 then GOSUB automove boar
     if $zoneid = 127 then 
          {
          GOSUB automove gate
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }
     if $zoneid = 116 then gosub automove 281
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     ##gosub TEACHING
     pause .1
     pause 0.5
     GOSUB armor.remove
     pause .5
     pause .5
     put .disarm
     waitfor DONE PICKING BOXES
     var LAST DISARM.DONE
     var GEMS ON
     var TRAINING STEALING
     var BOXES OFF
     pause 0.5
     send get my hand claw
     send wear my hand claw
     wait
     pause .5
     pause .5
     GOSUB GEM.POUCHES
     GOSUB EMPTY.PACK.CHECK %DEFAULT.CONTAINER
     GOSUB EMPTY.PACK.CHECK %GEM.CONTAINER
     GOSUB EMPTY.PACK.CHECK %BOX.CONTAINER
     pause .05
     goto STEAL.PRE
########################
# TO COMBAT LOCATION
########################
TO.COMBAT2:
     var LAST TO.COMBAT2
###########################
ARMOR.ON:
     pause 0.1
     GOSUB stowing
     GOSUB armor.wear
###########################
     if ("$zoneid" = "1") then gosub automove 5th
     if ("$zoneid" = "1a") then gosub automove STR
     if $zoneid = 65 then GOSUB automove 1
     if $zoneid = 61 then GOSUB automove cross
     if $zoneid = 60 then gosub automove segoltha
     if $zoneid = 50 then gosub automove wreck
     pause .5
     if $zoneid = 62 then GOSUB automove 32
     pause .5
     pause
     if $zoneid = 116 then 
          {
          GOSUB automove 75
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }          
     if $zoneid = 126 then GOSUB automove boar
     if $zoneid = 127 then 
          {
          GOSUB automove gate
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }
     if $zoneid = 31 then GOSUB automove river
     if $zoneid = 30 then GOSUB automove 174
     if $zoneid = 40 then GOSUB automove gate
     if $zoneid = 42 then GOSUB automove gate
     if $zoneid = 33 then GOSUB automove lang
     if ("$zoneid" = "33a") then GOSUB automove lang
     pause
     if $zoneid = 33a then GOSUB automove ross
###SHARD ZONE
     if $zoneid = 66 then gosub automove w gate
     if $zoneid = 67 then gosub automove west
     
AT.COMBAT.ZONE:
     echo *** IN COMBAT ZONE! ***
     if $health < 70 then goto ESCAPE
     if ("$zoneid" = "69") then gosub automove %COMBAT.ROOM
GOTO.COMBAT:
     pause .5
     if ("$zoneid" = "69") then gosub automove %COMBAT.ROOM
     if ("$zoneid" = "69c") && ($roomid != 34) then gosub automove 34
     pause 0.1
     put .hit
     pause 0.2
     ## ALSO CHANGE ON LINE 379 BELOW
     goto COMBAT
######################################
## CHECKING FOR OTHER PLAYERS
COMBAT:
PLAYER.CHECK:
     if !("$roomplayers" = "") then gosub moveRandomDirection
          put search
          waitforre ^Roundtime:|^You scan the
          pause
          pause 0.5
          pause 0.1
     if !("$roomplayers" = "") then gosub moveRandomDirection
          put search
          waitforre ^Roundtime:|^You scan the
          pause
          pause 0.5
          pause 0.1
     if !("$roomplayers" = "") then gosub moveRandomDirection
          put search
          waitforre ^Roundtime:|^You scan the
          pause
          pause 0.5
          pause 0.1    
     if !("$roomplayers" = "") then gosub moveRandomDirection
          put search
          waitforre ^Roundtime:|^You scan the
          pause
          pause 0.5
          pause 0.1              
     if !("$roomplayers" = "") then gosub moveRandomDirection
     if !("$roomplayers" = "") then goto PLAYER.CHECK
               echo
               echo *** FOUND ROOM! ***
               echo
FIGHT:
     if $roomid = 0 then GOSUB moveRandomDirection
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     GOSUB stowing
     GOSUB stowAmmo
     action (combat) on
     pause 0.1
     send stance evasion
     pause 0.1
     send health
     waitforre You|wait|Please
     pause 0.1
          put search
          waitforre ^Roundtime:|^You scan the
          pause 1
     if !("$roomplayers" = "") then gosub moveRandomDirection
               echo
               echo *** FOUND ROOM! ***
               echo
######################################
## COMBAT
COMBAT.BEGIN:
     put #echo >Log PapayaWhip *** INITIATING COMBAT!! ***
     put #parse STARTING COMBAT
     action (weapon) on
     action (cough) on
     put .combattimer
     pause 0.1
     math COMBAT_LOOP add 1
COMBAT.DECIDE:
     action (weapon) on
     put #script abort hunter
     delay 0.0001
PLAYER.CHECK2:
     pause 0.2
     pause 0.2
     if !("$roomplayers" = "") then gosub moveRandomDirection
          send search
          waitforre ^Roundtime:|^You scan the
          pause 1
     if !("$roomplayers" = "") then gosub moveRandomDirection
               echo
               echo *** FOUND ROOM! ***
               echo
######################################
## WEAPON EXP CHECK
     if $Small_Blunt.LearningRate < 1 then goto COMBAT.9
     if $Small_Edged.LearningRate < 1 then goto COMBAT.4
     if $Light_Thrown.LearningRate < 1 then goto COMBAT.2
     if $Crossbow.LearningRate < 1 then goto COMBAT.3
     if $Bow.LearningRate < 1 then goto COMBAT.5
     #if $Staves.LearningRate < 1 then goto COMBAT.7
     ###if $Backstab.LearningRate < 1 then goto COMBAT.4
     ###if $Heavy_Thrown.LearningRate < 1 then goto COMBAT.10
     ###if $Large_Blunt.LearningRate < 2 then goto COMBAT.11
     ###if $Small_Blunt.LearningRate < 2 then goto COMBAT.9
     goto WEAPON.CHANGE

COMBAT.1:
     send .hunter multi
     goto COMBAT.WAIT
COMBAT.2:
     send .hunter multi 2
     goto COMBAT.WAIT
COMBAT.3:
     send .hunter multi 3
     goto COMBAT.WAIT
COMBAT.4:
     send .hunter multi 4
     goto COMBAT.WAIT
COMBAT.5:
     send .hunter multi 5
     goto COMBAT.WAIT
COMBAT.6:
     send .hunter multi 6
     goto COMBAT.WAIT
COMBAT.7:
     send .hunter multi 7
     goto COMBAT.WAIT
COMBAT.8:
     send .hunter multi 8
     goto COMBAT.WAIT
COMBAT.9:
     send .hunter multi 9
     goto COMBAT.WAIT
COMBAT.10:
     send .hunter multi 10
     goto COMBAT.WAIT
COMBAT.11:
     send .hunter multi 11
     goto COMBAT.WAIT
COMBAT.12:
     send .hunter multi 12
     goto COMBAT.WAIT
COMBAT.13:
     send .hunter multi 13
     goto COMBAT.WAIT
COMBAT.14:
     send .hunter multi 14
     goto COMBAT.WAIT
COMBAT.15:
     send .hunter multi 15
     goto COMBAT.WAIT
COMBAT.16:
     send .hunter multi 16
     goto COMBAT.WAIT

COMBAT.WAIT:
     pause 1000
     goto WEAPON.CHANGE

WEAPON.CHANGE:
     echo *** Weapon Timeout - Switching Weapons!
     put #script abort hunter
     #gosub sort %skills %count
     gosub clear
     gosub stowammo
     gosub skillcheck1
     echo **** %sort(%ix) %sort(0)
     if "%WEAPON_EXP" = "%sort(%ix)" then
          {
               evalmath ix (%ix + 1)
               gosub skillcheck1
          }
     if "%WEAPON_EXP" != "%sort(%ix)" then put .hunter multi %%sort(%ix)
     #if "%WEAPON_EXP" != "%sort(%0)" then put .hunter multi %%sort(%0)
     #if $%sort(0).LearningRate < %globalexp then put .hunter multi %%sort(0)
     pause
     GOTO COMBAT.WAIT

RESET:
     put #script abort hunter
     pause .5
     goto COMBAT
##################################################
##############	  ESCAPE SECTION   ################
##################################################
COMBAT.TIMEOUT:
     put #echo >Log Chartreuse *** Combat Complete - Training Survivals/Lores ***
     var STEALING ON
     var SURVIVALS ON
     var HEALING YES
     goto ESCAPE.START
ESCAPE.AMMO:
     put #echo >Log OrangeRed *** RAN OUT OF AMMO! ESCAPING TO RESTOCK!
     var AMMO.RESTOCK ON
     goto ESCAPE.START
ESCAPE.BOXES:
     put #echo >Log MediumSpringGreen *** Bags full! Picking boxes..
     var BOXES ON
     goto ESCAPE.START
ESCAPE.SKINS:
     put #echo >Log Magenta *** Full on bundles!! Selling skins..
     goto ESCAPE.START
ESCAPE:
     var HEALING YES
     put #echo >Log DeepPink ****  DANGER!!! TOO HURT! ESCAPING FROM COMBAT!
     goto ESCAPE.START
ESCAPE.START:
    delay 0.0001
    var LAST ESCAPE.START
    var escape.loop 0
    put #script abort all except %scriptname
    pause 0.001
    action (combat) off
    action (cough) off
    action (escape) off
    put #window close HitTracker
    put #window close HitTrackerLog
    echo ****** ESCAPING FROM COMBAT! ******
	send stop stalk
    if $standing = 0 then gosub stand
    pause 0.1
	send khri silence
	pause 0.5
	pause 0.2
	pause 0.1
    pause 0.1
	send retreat
    pause 0.01
    if %escape.loop > 1 then 
        {
            if ("%stun.connect" = "OFF") then 
               {
                    if $health < 35 then goto STUNNEDOUT
               }
        }
	if %escape.loop > 6 then goto STUNNEDOUT
	if $standing = 0 then gosub stand
    pause 0.01
FLEE.RET:
    var LAST FLEE.RET
    math escape.loop add 1
	pause 0.01
    if $standing = 0 then gosub stand
    pause 0.01
    pause 0.01
    if %escape.loop > 1 then 
        {
            if ("%stun.connect" = "OFF") then 
                {
                    if $health < 35 then goto STUNNEDOUT
                }
        }
	if %escape.loop > 3 then goto FLEE
	matchre EXIT ^You are a ghost
	matchre ESCAPING ^You are already as far|^You sneak back out of combat
	matchre FLEE.STAND ^You must stand first
	matchre FLEE.RET ^\.\.\.wait|^Sorry, you may only type|pole range|You retreat|You stop advancing|^You try to back away from|Roundtime|You are still stunned
	put retreat
	matchwait 10
    goto FLEE
FLEE.STAND:
    gosub stand
	goto FLEE.RET
FLEE:
	pause 0.1
	send stance evasion
    var escape.loop 0
    if $standing = 0 then gosub stand
	pause 0.1
    if ("%stun.connect" = "OFF") then 
        {
            if $health < 35 then goto STUNNEDOUT
        }
    pause 0.1
	matchre ESCAPING ^You assess your combat situation and realize you don't see anything engaged|^Obvious exits|^Obvious paths|^A master assassin you are not|those who flee live|You're invisible
	matchre FLEE ^You are still stunned
	matchre FLEE.RET ^Your attempt to flee has failed|^For some inexplicable reason|^How do you expect to flee
	put flee
	matchwait 10
	goto FLEE.RET
ESCAPING:
     var LAST ESCAPING
     put #script abort all except %scriptname
     put .scriptcheck
     pause 0.001
     send stop stalk
     if $standing = 0 then gosub stand
     pause 0.5
     if $hidden = 1 then put shiv
     pause 0.01
     pause 0.01
     GOSUB stowing
     GOSUB stowAmmo
     if contains("$roomobjs","lumpy bundle") then put get bund;wear bund
     if $standing = 0 then gosub stand
MOVING.RANDOM:
     if $roomid == 0 then
          {
               GOSUB moveRandomDirection
          }
     goto LEAVE.COMBAT.AREA
##############################################
# ESCAPE FROM COMBAT
##############################################
LEAVE.COMBAT.AREA:
     var LAST LEAVE.COMBAT.AREA
     action (combat) off
     action (escape) off
     pause 0.001     
     send stop stalk
     pause 0.001
     pause 0.001
     send khri stop silence
     pause 0.5
	put #window close HitTracker
     put #window close HitTrackerLog
     if $hidden = 1 then send shiv
     if $roomid == 0 then GOSUB moveRandomDirection
     pause 0.001
     if $roomid == 0 then GOSUB moveRandomDirection
     pause 0.001 
     if $zoneid = 116 then 
          {
          GOSUB automove 75
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }          
     if $zoneid = 126 then GOSUB automove boar
     if $zoneid = 127 then 
          {
          GOSUB automove gate
          send .travel shard
          waitforre ^YOU ARRIVED\!
          GOSUB automove shard
          }
     if $zoneid = 1 then 
          {
          send .travel shard
          waitforre ^YOU ARRIVED\!
          }
     if $zoneid = 34 then gosub automove theren
     if $zoneid = 33a then gosub automove river
     if $zoneid = 33 then gosub automove river
     if $zoneid = 31 then goto SWAMP.LEAVE
     if $zoneid = 13 then gosub automove NTR
     if $zoneid = 65 then gosub automove 1
     if $zoneid = 68a then gosub automove shard
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 62 then gosub automove leth
     if $zoneid = 69c then gosub automove w gate
     if $zoneid = 69 then gosub automove shard
     pause 0.1
     if $zoneid = 66 then gosub automove east
     if $zoneid = 50 then gosub automove STR
     if $zoneid = 60 then gosub automove leth
     if $zoneid = 1a then gosub automove crossing
     if $zoneid = 13 then gosub automove NTR
     if $zoneid = 9b then gosub automove NTR
     if $zoneid = 7 then gosub automove crossing
     if $zoneid = 8 then gosub automove crossing
     if $zoneid = 4 then gosub automove crossing
     if $zoneid = 40 then gosub automove theren
     pause 0.001
     pause 0.001
############################
#  GET HEALED 
############################
     action (escape) off
     gosub HEALTH_CHECK
     if ($needHealing) then goto MACI 
     else goto DONE.HEAL
MACI:
     action (escape) off
     action (combat) off
     var loops 0
     var attempts 0
MACITOP:
     if $zoneid = 67 then gosub automove west
     if $zoneid = 69 then gosub automove 383
     gosub BLEEDER.CHECK
     pause 0.1
     gosub macifind
     gosub automove shard
     gosub automove 724
     gosub macifind
     gosub automove 718
     gosub macifind
     gosub automove 701
     gosub macifind
     gosub automove 660
     gosub macifind
     gosub automove 657
     gosub macifind
     gosub automove 652
     gosub macifind
     gosub automove 648
     gosub macifind
     math loops add 1
     if %loops > 4 then goto TO.AUTOHEALER
     goto MACITOP
macifind:
    pause .0001
    pause .0001
    matchre return ^I could not find
    matchre macifind ^\.\.\.wait|^Sorry, you may only type|^You.*are.*still.*stunned\.
    matchre macifound ^You see
    put look maci
    matchwait 5
    return
macifound:
    send khri stop
    pause .0001
    pause .0001
    pause 0.001
    var Empath maci
    send join maci
    pause 0.2
choose.speech:
     random 1 18
     goto SPEECH.%r
SPEECH.1:
     var speech omg heal me I'm dying
     goto MACI.HEAL
SPEECH.2:
     var speech heal please, I've got zombie aids
     goto MACI.HEAL
SPEECH.3:
     var speech zomg Need healing. Cawk got caught in a meat grinder again. 
     goto MACI.HEAL
SPEECH.4:
     var speech HaLp! I needs healing 
     goto MACI.HEAL
SPEECH.5:
     var speech healing?
     goto MACI.HEAL
SPEECH.6:
     var speech Heal me - Touch me. Heal me hard.
     goto MACI.HEAL
SPEECH.7:
     var speech HEAL ME BIOTTTCH
     goto MACI.HEAL
SPEECH.8:
     var speech heal me !!!!
     goto MACI.HEAL
SPEECH.9:
     var speech Heal please, I've got an infected rash
     goto MACI.HEAL
SPEECH.10:
     var speech I needs healing.. my genitals got stuck in a meat grinder
     goto MACI.HEAL
SPEECH.11:
     var speech Heal please... I contracted a nasty virus
     goto MACI.HEAL
SPEECH.12:
     var speech Healing? 
     goto MACI.HEAL
SPEECH.13:
     var speech You! Heal! You heal now! 
     goto MACI.HEAL
SPEECH.14:
     var speech I accidentally cut my weenus off.. please heal
     goto MACI.HEAL
SPEECH.15:
     var speech available for a heal?
     goto MACI.HEAL
SPEECH.16:
     var speech OMG HEAL MY FACE IS MELTING HEAL ME 
     goto MACI.HEAL
SPEECH.17:
     var speech heal? heal? heal? heal?
     goto MACI.HEAL
SPEECH.18:
     var speech need more healing
     goto MACI.HEAL
MACI.HEAL:
    pause 0.2
    matchre macifind ^\.\.\.wait|^Sorry, you may only type|^You.*are.*still.*stunned\.
    matchre DONE.AUTOEMPATH ^The feeling of unity with Maci gradually ebbs|^Maci nods to you\.|^A fiery\-cold|^The pain of your wounds abruptly ceases
    put whisper maci %speech
    matchwait 15
    math attempts add 1
    if %attempts > 10 then goto autoheal
    if contains("$roomplayers" , "Maci") then goto macifound
    RETURN
   
TO.AUTOHEALER:    
     if $zoneid = 1 then gosub automove healer
     if $zoneid = 61 then gosub automove healer
     if $zoneid = 30 then gosub automove healer
     if $zoneid = 116 then gosub automove healer
     if $zoneid = 42 then gosub automove healer
     if $zoneid = 67 then gosub automove healer
     action (escape) off
     goto HEALING
HEALTH.PAUSE:
     pause 10
HEALING:
     var LAST HEALING
     if $stunned = 1 then goto HEALTH.PAUSE
     send demeanor neutral
     waitforre ^You decide to take things as they come\.
     gosub HEALTH_CHECK
     gosub BLEEDER.CHECK
     if !($needHealing) then goto DONE.HEAL
     if matchre ("$roomplayers", "who is lying down") then goto HEALTH.WAIT
     else goto AUTO.HEALER

HEALTH.ANYWAY:
     pause 0.1
     random 1 3
     goto HEALTH.%r
HEALTH.1:
     put 'I hate to cut in line.. but I'm dying, sorry
     goto AUTO.HEALER
HEALTH.2:
     put 'Excuse me.. need to lie down.. in critical condition
     goto AUTO.HEALER
HEALTH.3:
     put 'Sorry.. in very bad shape. Must lie down
     goto AUTO.HEALER
     
AUTO.HEALER:
     var LAST AUTO.HEALER
     var Empath Shalvard
     pause 0.1
     send fall
     pause .01
     pause .05
     send join list
     pause 0.5
     put .origami
     pause 0.5
EMPATH.WAIT:
     if $sitting = 1 then goto DONE.AUTOEMPATH
     #if matchre ("$roomplayers", "who is lying down") && ($bleeding = 0) then goto HEALTH.WAIT
     matchre DONE.AUTOEMPATH ^Shalvard says, "Please get up|Shalvard looks around and says, "Kindly leave|^Kaiva crosses your name off|you look fine and healthy to me
     matchre DONE.AUTOEMPATH ^You sit up|^Arthianne nudges you|I think you don't really need healing|you are well|Quentin whispers, "Just between you and me and the Queen
     matchre DONE.AUTOEMPATH ^Srela says, "You're healthy|A little rest and exercise and you'll be good as new
     put exp
     matchwait 45
     goto EMPATH.WAIT
HEALTH.WAIT:
     put sit
     pause 0.5
     GOSUB BLEEDER.CHECK
     put .origami
     pause 0.5
HEALTH.WAIT1:
     echo *** WAITING FOR OTHER PLAYERS TO FINISH HEALING FIRST
     if $sitting = 0 then put sit
     if !matchre ("$roomplayers", "who is lying down") then goto AUTO.HEALER
     if $health < 50 && $bleeding = 1 then goto HEALTH.ANYWAY
     pause 10
     put exp
     goto HEALTH.WAIT1

DONE.AUTOEMPATH:
     put #tvar needHealing 0
     action remove ^%Empath whispers\, \"You have leaned on me with no wounds\.\"
     pause 0.1
     put health
     waitforre You|Your
     pause 0.5
     gosub stowing
     gosub DIARY
     if $standing = 0 then gosub stand
     pause 0.1
     if $standing = 0 then gosub stand
     pause 0.1
     put #echo >Log Fuchsia *** Healed by %Empath
     if ($health < 80) then 
          {
          ECHO *** Waiting for health to recover..
          waiteval ($health > 80)
          }
DONE.HEAL:
     action (escape) on
     var stun.connect OFF
     put #script abort all except %scriptname
     put .scriptcheck
     pause 0.1
     pause 0.2
     send khri stop
     GOSUB stowing
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if $zoneid = 42 then
          {
          gosub automove gate
          send .travel haven
          waitforre ^YOU ARRIVED\!
          }
     GOSUB armor.remove
#######################################################
# GEMS/ GEM POUCH SELLING SECTION
#######################################################
GEM.CHECK:
     action (cough) off
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     GOSUB GEM.POUCHES
     send open my %GEMPOUCH.CONTAINER
     pause 0.5
     matchre SELL.GEM.POUCHES gem pouch|You tap
     matchre DONE.GEMS I could not find|What
     put tap seventh gem pouch in my %GEMPOUCH.CONTAINER
     matchwait 15
     goto DONE.GEMS

SELL.GEM.POUCHES:
     put #echo >Log Chartreuse ***** SELL GEM POUCHES! GETTING FULL! ****
     goto DONE.GEMS
     
TO.GEMSHOP:
     var LAST TO.GEMSHOP
     var pouches 0
     if $zoneid = 67 then gosub automove west
     if $zoneid = 116 then 
          {
          gosub automove 75
          put .travel horse
          waitforre ^YOU ARRIVED\!
          }
     pause 0.5
     pause 0.1
     if $zoneid = 69 then gosub automove gem
     
GET.GEM:
	matchre POUCH_INIT ^What were you|^I could not
	matchre SELL.GEM ^You get|^But that|^You are already
	put get gem pouch from my %GEMPOUCH.CONTAINER
	matchwait 3
SELL.GEM:
     matchre NON.GEM ^I can only appraise gems or metals
	matchre NO.MONIES we don't have the funds to buy anything
     matchre EMPTY ^Kurtz makes a face and exclaims
	matchre SOLD.POUCH With a greedy gleam in his eyes
	send sell pouch
	matchwait 3
SOLD.POUCH:
	math pouches add 1
	pause 0.3
EMPTY:
	gosub stow
	pause 0.1
	goto GET.GEM
NON.GEM:
     gosub put get pot cry from my gem pou
     gosub put get inf sto from my gem pou
     gosub put stow my cry
     gosub put stow my sto
     pause 0.5
     gosub put get nugg from my gem pou
     gosub put get stone from my gem pou
     gosub put drop nugg
     gosub put drop stone
     pause 0.5
     gosub put get ach cry from my gem pou
     gosub put get rune from my gem pou
     gosub put drop rune
     gosub put stow cry
     pause 0.5
     goto SELL.GEM
     
POUCH_INIT:
     var pouchbag bag
POUCH_INIT2:
     var numbers first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|eleventh 
     eval totalNumbers count("%numbers", "|")
     var trip 0
POUCH_LOOP: 
     delay 0.0001 
     eval number %numbers(%trip)
     gosub GET.GEM2
     math trip add 1 
     if (%trip > %totalNumbers) then gosub NO.POUCHES
     goto POUCH_LOOP
GET.GEM2:
     matchre NO.POUCHES ^What were you
	matchre EMPTY2 ^I could not
	matchre SELL.GEM2 ^You get|^But that|^You are already
	send get my %number gem pouch from my %pouchbag
	matchwait 4
     goto SELL.GEM2
SELL.GEM2:
     matchre NON.GEM2 ^I can only appraise gems or metals
	matchre NO.MONIES we don't have the funds to buy anything
     matchre EMPTY2 ^Kurtz makes a face and exclaims|^Sell what\?
	matchre SOLD.POUCH2 With a greedy gleam in his eyes
	send sell my pouch
	matchwait 3
SOLD.POUCH2:
	math pouches add 1
	pause 0.3
EMPTY2:
	gosub stow my pouch in my bag
	pause 0.1
	RETURN
NO.POUCHES: 
     if ("%pouchbag" == "backpack") then 
          {
               goto GEMS.DONE
          }
	gosub stow my pouch in my bag
	pause 0.5
     var pouchbag backpack
     goto POUCH_INIT2
NON.GEM2:
     gosub put get pot cry from my gem pou
     gosub put get inf sto from my gem pou
     gosub put stow my cry
     gosub put stow my sto
     pause 0.5
     gosub put get nugg from my gem pou
     gosub put get stone from my gem pou
     gosub put drop nugg
     gosub put drop stone
     pause 0.5
     gosub put get ach cry from my gem pou
     gosub put get rune from my gem pou
     gosub put drop rune
     gosub put stow cry
     pause 0.5
     goto SELL.GEM2
GEMS.DONE:
     gosub clear
     pause 0.1
	gosub stow my pouch in my bag
	pause 0.5
     pause 0.1
     goto DONE.SELL.GEMS
     
NO.MONIES:
     put #echo >Log MediumSpringGreen *** LOL.. Horse Clan Gemshop has no monies for gems
     put put gem pouch in my %GEMPOUCH.CONTAINER
     pause 0.5
DONE.SELL.GEMS:
     var LAST DONE.GEMS
     pause 0.5
     put #echo >Log MediumSpringGreen *** ChaChing! Sold %pouches gem pouches!
DONE.GEMS:     
     send close my %GEMPOUCH.CONTAINER
     pause 0.5
     send wealth
     pause 0.5
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 66 then gosub automove east
     #if $zoneid = 61 then gosub automove portal
     #if $zoneid = 30 then gosub automove portal
     pause 0.5
     
###################################################
# SKIN/BUNDLE SELLING
###################################################
BUNDLE.CHECK:
     matchre SELL.SKINS ^You tap
     matchre DISARMING I could not find|What were you
     put tap bundle
     matchwait
SELL.SKINS:
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove bundle
     if $zoneid = 116 then gosub automove bundle
     put rem my bundle
     wait
     send sell my bundle
     pause
BUNDLE.GET:
     pause 0.5
     send stow my rope
     wait
     pause 0.5
     matchre BUNDLE SELL ^You get|^You sling|^You remove
     matchre BUNDLE.DONE ^What were you|^I could not|^Please|^Remove what\?
     put remove bundle
     matchwait 10
     goto BUNDLE.DONE
BUNDLE.SELL:
     matchre BUNDLE.DONE ^Sell what|^I could not|^What
     matchre BUNDLE.GET ^You ask the tanner|hands you
     put sell my bundle
     matchwait
BUNDLE.DONE:
     PUT ASK trem for rope
     if ("$righthand" = "bundling rope") || ("$lefthand" = "bundling rope") then send stow my rope
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     pause
     goto DISARMING
############################
#  DISARM BOXES SECTION	  #
############################
DISARMING:
     var LAST DISARMING
     if ("%AMMO.RESTOCK" = "ON") then gosub RESTOCK.AMMO
     GOSUB DISARM.CHECK
     if ("%BOXES" = "ON") then goto DISARM
     else goto TO.BANK

DISARM:
     var LAST DISARM
     put #echo >Log BlueViolet **** PICKING BOXES ****
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if $zoneid = 116 then gosub automove 281
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     ##gosub TEACHING
     pause 0.1
     GOSUB KHRI secure
     pause 0.5
     pause 0.1
AT.DISARM:
     GOSUB armor.remove
     pause 0.5
     #gosub TEACHING
     put .disarm
WAIT.FOR.DISARM:
     waitfor DONE PICKING BOXES
     goto DISARM.DONE
DISARM.DONE:
     var LAST DISARM.DONE
     var BOXES OFF
     send khri stop
     pause 0.1
     gosub get my hand claw
     gosub wear my hand claw
     pause 0.5
CLEAN.BAGS:
     GOSUB GEM.POUCHES
     GOSUB EMPTY.PACK.CHECK %DEFAULT.CONTAINER
     GOSUB EMPTY.PACK.CHECK %GEM.CONTAINER
     GOSUB EMPTY.PACK.CHECK %BOX.CONTAINER
     pause 0.5
     gosub PUT get my crossbow bolt
     gosub PUT drop bolt
     gosub PUT get my crossbow bolt
     gosub PUT drop bolt
     goto TO.BANK

COMPONENTS:
     pause .001
     matchre COMPONENT.SELL ^You get
     matchre COMPONENT.DONE ^What were you|^I could not find
     send get my dark pouch
     matchwait 8
     goto TO.BANK

COMPONENT.SELL:
     GOSUB automove music
     pause 0.5
     send ask malik about thieves
     pause 0.5
     pause 0.1
     send order lyre
     pause 0.5
     pause 0.1
     send offer 9555999
     send offer 9555999
     wait
     pause 9
     pause
     GOSUB stand
     pause .001
     goto SELL.POUCH
COMPONENT.WAIT:
     pause 5
SELL.POUCH:
     pause .05
     if !("$roomplayers" = "") then goto COMPONENT.WAIT
     send give my pouch to ss
     pause
     put put pouch in my cloak
     pause .1
     pause .1
     send out
     pause

############################
#   BANK DEPOSIT		  #
############################
TO.BANK:
     var LAST TO.BANK
     pause 0.1
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if $zoneid = 66 then gosub automove east
     if $zoneid = 116 then gosub automove 1exch
     else gosub AUTOMOVE exchange
     gosub DOKORAS
     if $zoneid = 116 then gosub automove 1tell
     else gosub AUTOMOVE teller
     gosub BANK
     gosub COMBINE.BANK
     math TOTAL.PROFIT add %Profit
     pause 0.5
     put #echo >Log Yellow *** BANKED - %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze, %Copper Copper
     pause 0.5
     pause 0.5
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     gosub CLEAR.BANK
     ECHO ####################################
     ECHO # DECIDING WHAT TO DO NEXT......
     ECHO ####################################
     pause 0.5
#########################################
# COMBAT TIMER CHECK
#########################################
TIMER.CHECK:
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
	if !def(Combat.Time) then put #var Combat.Time $gametime
     put #var Combat.Last {#evalmath ($gametime - $Combat.Time)}
     if (%t > 38400) then goto AFK.TIME
     if ($Combat.Last > 1000) && ("%ALCHEMY" = "OFF") then 
          {
               ECHO ####################################
               ECHO #       TRAINING ALCHEMY           #
               ECHO ####################################
               goto ALCHEMY
          }
     if ($Combat.Last > 1000) && ("%ENGINEERING" = "OFF") then 
          {
               ECHO ####################################
               ECHO #     TRAINING ENGINEERING         #
               ECHO ####################################
               goto ENGINEERING
          }
     if ($Combat.Last > 2000) then 
          {
               ECHO ####################################
               ECHO #    TRAINING SURVIVALS / LORES    #
               ECHO ####################################
               goto TO.SURVIVALS
          }
     else
          {
               ECHO ####################################
               ECHO #      GOING BACK TO COMBAT        #
               ECHO ####################################
               goto BACK.TO.COMBAT
          }
BACK.TO.COMBAT:
     put #echo >Log Lime *** Moving back to combat..
     goto TO.COMBAT2

###############################
# ALCHEMY / CRAFTING          #
###############################
ALCHEMY:
     var LAST ALCHEMY
     var ALCHEMY ON
ALCH.PREP:
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if ("%ALCHEMY" = "OFF") then goto ENGINEERING
     if $zoneid = 66 then gosub automove east
     pause 0.5
     gosub automove teller
     pause 0.5
     pause 0.5
     send with 25 gold
     pause 0.5
ALCHEMY.CHECK:
     pause 0.001
     matchre ALCHEMY.CHECK ^\.\.\.wait|^Sorry\,
     matchre ALCHEMY.GET ^I could not find
     matchre ALCHEMY.GET ^What were you
     matchre ALCHEMY.RECHECK ^You count out (\d+) pieces? of material there
     send count my ojhenik
     matchwait 5
     goto ALCHEMY.CHECK
ALCHEMY.RECHECK:
     var alchemyCount $1
     if %alchemyCount < 25 then goto ALCHEMY.GET
     else goto ALCHEMY.CONT

ALCHEMY.GET:
## BUYING MAIN HERB
     gosub automove 701
     gosub order 12
     gosub order 12
     gosub order 12
     gosub order 12
     #gosub order 9
     pause 0.5
ALCHEMY.CONT:
## BUYING CATALYST
     matchre CATALYST.BUY ^I could not|^What were you|^Please
     matchre WATER ^You tap
     put tap my fifth nugget
     matchwait 5
CATALYST.BUY:
     gosub automove forging supplies
     pause 0.5
     gosub stowing
     gosub order 1
     gosub order 1
     gosub order 1
     gosub order 1
     #gosub order 1
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER
## BUYING WATER/OTHER HERBS
WATER:
     gosub automove 701
WATER.1:
     pause 0.5
     matchre WATER.BUY ^I could not find|^There is one part left|^There are two parts left|^There are three parts left|^There are four parts left
     matchre WATER.BUY ^There are five parts left|^There are six parts left|^There are seven parts left|^There are eight parts left|^There are nine parts left|^There are ten parts left
     matchre WATER.BUY ^There are eleven parts|^There are twelve parts|^There are thirteen parts|^There are fourteen parts|^There are fifteen parts|^There are sixteen parts
     matchre WATER.BUY ^There are seventeen parts|^There are eighteen parts|^There are ninteen parts|^There are twenty parts|^There are twenty-one parts|^There are twenty-two parts
     matchre ALCOHOL.CHECK ^There are|^You count
     put count my water
     matchwait
WATER.BUY:
     gosub order 1
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER
     pause 0.1
ALCOHOL.CHECK:
     pause 0.5
     matchre ALCOHOL.BUY ^I could not find|^There is one part left|^There are two parts left|^There are three parts left|^There are four parts left
     matchre ALCOHOL.BUY ^There are five parts left|^There are six parts left|^There are seven parts left|^There are eight parts left|^There are nine parts left
     matchre ALC.COMBINE ^There are|^You count
     put count my alcohol
     matchwait
ALCOHOL.BUY:
     pause 0.1
     gosub order 2
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER
     pause 0.1
HERB2.BUY:
     gosub order 10
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER
     pause 0.5
HERB2.CONT:
     #gosub order 13
     #gosub order 13
     #gosub order 13
     #gosub order 13
ALC.COMBINE:
     gosub stowing
     pause 0.5
     put get my alcohol
     pause 0.2
ALC.GET:
     pause 0.001
     gosub GET my alcohol from my %CRAFTING.CONTAINER
     pause 0.1
     send combine alcohol with alcohol
     pause 0.001
     gosub GET my alcohol from my %CRAFTING.CONTAINER
     pause 0.1
     send combine alcohol with alcohol
ALC.DONE:
     pause 0.1
     gosub PUT_IT alcohol in my %CRAFTING.CONTAINER
     pause 0.5
     pause 0.2
WATER.CHECK:
     matchre WATER.COMBINE ^You get|^You need
     matchre WATER.GET ^What were|^I could not|Sorry|You can't combine
     send get my third water
     matchwait 8
     goto WATER.GET
WATER.GET:
     pause 0.1
     send get my water
     pause 0.2
WATER.COMBINE:
     pause 0.001
     pause 0.1
     gosub GET my water from my %DEFAULT.CONTAINER
     gosub GET my water from my %BOX.CONTAINER
     gosub GET my water from my %GEM.CONTAINER
     gosub GET my water from my %CRAFTING.CONTAINER
     pause 0.5
     send combine water with water
     pause 0.5
     gosub GET my water from my %DEFAULT.CONTAINER
     gosub GET my water from my %BOX.CONTAINER
     gosub GET my water from my %CRAFTING.CONTAINER
     pause 0.3
     send combine water with water
     pause 0.5
WATER.DONE:
     put count water
     pause 0.5
     pause 0.3
     if ("$righthand" != "Empty") then gosub PUT_IT water in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT water in my %CRAFTING.CONTAINER
     pause 0.5
     goto ALCHEMY.GO

HERB.PREP:
     gosub AUTOMOVE alchemy dryer
     gosub get my suf sap
     gosub put put my sap in press
     pause $roundtime
     pause 0.5
     gosub stowing
     gosub get my suf sap
     gosub put put my sap in press
     pause $roundtime
     pause 0.5
     gosub stowing
     gosub get my suf sap
     gosub put put my sap in press
     pause $roundtime
     pause 0.5
     gosub stowing
     gosub get my suf sap
     gosub put put my sap in press
     pause $roundtime
     pause 0.5
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER

ALCHEMY.GO:
     var LAST ALCHEMY.GO
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     pause 0.5
     gosub stowing
     #gosub TEACHING
     put .remedy elixir ojhenik nugget belt
     waitforre ALCHEMY DONE
     put #script abort remedy
     put #echo >Log Aquamarine **** ALCHEMY - $Alchemy.Ranks $Alchemy.LearningRate / 34 ****
     if ("$righthand" != "Empty") then gosub PUT_IT $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub PUT_IT $lefthand in my %CRAFTING.CONTAINER
     pause
     goto TIMER.CHECK
##############################
# ENGINEERING
##############################
ENGINEERING:
TOOLS.CHECK:
     pause 0.5
     var ENGINEERING ON
     var LAST TOOLS.CHECK
     if $zoneid = 66 then gosub automove east
     if ("%ENGINEERING" = "OFF") then goto ENGINEERING.DONE
     gosub get my saw
     put untie my saw
     pause 0.5
     pause 0.2
     matchre TOOLS.CHECK2 pristine condition|mint condition|good condition
     matchre TOOL.REPAIR ^Roundtime
     put analyze my saw
     matchwait
     
TOOLS.CHECK2:
     pause 0.5
     var LAST TOOLS.CHECK2
     put put saw in my %CRAFTING.CONTAINER
     pause
     gosub get my bowl
     put untie my bowl
     pause 0.5
     pause 0.2
     matchre ENGINEERING.MATS pristine condition|mint condition|good condition
     matchre TOOL.REPAIR ^Roundtime
     put analyze my bowl
     matchwait

TOOL.REPAIR:
     var LAST TOOL.REPAIR
     gosub automove teller
     gosub put with 7 plat
     gosub automove north
     pause 0.5
REPAIRING.TOOLS:
     var LAST REPAIRING.TOOLS
     gosub automove ylono
     put .repairtools
REPAIRING.TOOLS2:
     waitforre TOOL REPAIR COMPLETE
     gosub automove shard

ENGINEERING.MATS:
var LAST ENGINEERING.MATS
     gosub automove 711
     gosub stowing
     pause 0.1
## BUYING DEEDS
     matchre TAP.POLISH ^You get
     matchre BUY.DEED ^What were|^I could not
     put get my third stack
     matchwait
BUY.DEED:
     gosub order 8
     gosub order 8
     gosub order 8
TAP.POLISH:
     if ("$righthand" != "Empty") then gosub put put $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub put put $lefthand in my %CRAFTING.CONTAINER
     pause 0.5
     matchre POLISH.CONT ^You get
     matchre POLISH.CHECK ^What were|^I could not
     put get my second polish
     matchwait
POLISH.CHECK:
     gosub GET my polish
     if !matchre("$lefthand|$righthand", "polish") then goto POLISH.BUY
POLISH.COUNT:
     pause 0.001
     matchre POLISH.COUNT ^\.\.\.wait|^Sorry\,
     matchre POLISH.BUY ^I could not find
     matchre POLISH.BUY ^What were you
     matchre POLISH.RECHECK ^The .* polish has (\d+) uses remaining
     send count my polish
     matchwait 5
     goto POLISH.CHECK
POLISH.RECHECK:
     var polishCount $1
     pause 0.5
     if ("$righthand" != "Empty") then gosub put put $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub put put $lefthand in my %CRAFTING.CONTAINER
     if %polishCount <= 5 then goto POLISH.BUY
     else goto POLISH.CONT
POLISH.BUY:
     send drop my polish
     pause 0.5
POLISH.BUY2:
     gosub automove engineering tool
     gosub order 4
     pause 0.5

POLISH.CONT:
CARVE.BEGIN:
var LAST CARVE.BEGIN
     gosub stowing
     gosub automove 715
     pause 0.5
     pause 0.5
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     pause 0.5
CARVE1:
var LAST CARVE1
     if ($roomid != 715) then gosub automove 715
     if !matchre("$lefthandnoun", "stack") then send get my stack
     pause 0.5
     put .carve comb stack
     waitfor CARVING DONE
     pause 0.3
CARVE2:
var LAST CARVE2
     if ($roomid != 715) then gosub automove 715
     if !matchre("$lefthandnoun", "stack") then send get my stack
     send drop comb
     pause 0.5
     put .carve comb stack
     waitfor CARVING DONE
     pause 0.3
CARVE3:
var LAST CARVE3
     if ($roomid != 715) then gosub automove 715
     if !matchre("$lefthandnoun", "stack") then send get my stack
     send drop comb
     pause 0.5
     put .carve comb stack
     waitfor CARVING DONE
     pause 0.3
CARVE4:
var LAST CARVE4
     if ($roomid != 715) then gosub automove 715
     if !matchre("$lefthandnoun", "stack") then send get my stack
     send drop comb
     pause 0.5
     put .carve comb stack
     waitfor CARVING DONE
     pause 0.3
CARVE.DONE:
var LAST CARVE.DONE
     gosub PUT get stack
     gosub PUT stow my stack
     pause 0.1
     gosub PUT get my comb
     gosub put drop my comb
     gosub PUT get my comb
     gosub put drop my comb
     gosub PUT get my comb
     gosub put drop my comb
     gosub stowing
ENGINEERING.DONE:
     var LAST ENGINEERING.DONE
     if $roomid == 0 then GOSUB moveRandomDirection
     if $roomid == 0 then GOSUB moveRandomDirection
     pause 0.5
     gosub automove 34
     put #echo >Log Aquamarine **** ENGINEERING - $Engineering.Ranks $Engineering.LearningRate / 34 ****
#################################################################################################################
# SURVIVAL TRAINING
#################################################################################################################
TO.SURVIVALS:
     put #var Combat.Time $gametime
     put #save var
		var NEXT TOP
		var STOLEN NO
STEAL.CHECK:
     var LAST STEAL.CHECK
     #if "%STEALING" = "ON" then goto TO.STEAL
     #if %COMBAT_LOOP >= 1 then goto TO.STEAL
     GOTO TO.STEAL
###############################
#	  STEALING RUN			#
###############################
TO.STEAL:
     pause 0.1
     action (cough) off
     send khri stop
     pause 0.5
     if ("%STOLEN" = "YES") then goto DISARM3.CHECK    
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     pause .5
     if $Thievery.LearningRate > 9 then goto ORB.RUB
STEAL:
     var LAST STEAL
     if ("%STEALING" = "OFF") then goto ROB.PEOPLE
     var STEALING OFF
     var COMBAT_LOOP 0
     action (jail) off
     action (cough) off
     put #window close HitTracker
     put #window close HitTrackerLog
     put .steal
     STEALWAIT:
     WAITING.FOR.STEAL:
     STEALDONE:
     var LAST STEALDONE
     waitforre DONE STEALING
     action (jail) on
     math RunsCompleted add 1
     pause 0.5
     put rub gweth
     wait
     pause 0.2
     put .armor
     waitfor ARMOR DONE
############################
#   ROB PLAYERS!!!         #
############################
ROB.PEOPLE:
     var LAST ROB.PEOPLE
     if ("%ROB.PEOPLE" = "OFF") then goto ROB.DONE
     send .travel cross
     waitforre ^YOU ARRIVED
     pause 
     send .rob quick
ROBWAIT:
     waitforre ROB DONE
ROB.DONE:
     put #script abort rob
     put #window close Autosteal
     if ($hidden) then send unhide
     pause 0.5
     pause 0.4
     pause 0.1
     send .travel shard
     waitforre ^YOU ARRIVED\!
     math TOTAL.PROFIT add $Stealing.Profit
     gosub CLEAR.BANK
     put khri stop silence
     pause 0.5
     goto MECH.CHECK
#################################
#  LORES AND SURVIVAL SECTION   #
#################################
MECH.CHECK:
     action (jail) on
     if ($Outdoorsmanship.LearningRate) > 15 then goto BRAIDING
     pause 0.5
FORAGING:
     var LAST FORAGING
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if $zoneid = 30 then gosub automove 203
     pause 0.5
     if $zoneid = 31 then gosub automove 3
     if $zoneid = 1 then gosub automove 1
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     #gosub TEACHING
     put .forage
     matchre DONE.BRAID2 FORAGING DONE
     matchwait 300
     put #script abort forage
     put #echo >Log MediumPurple **** FORAGING - $Outdoorsmanship.Ranks $Outdoorsmanship.LearningRate / 34 ****
     pause
     goto DONE.BRAID2

BRAIDING:
     var LAST BRAIDING
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     if $Mechanical_Lore.LearningRate > 15 then goto LORES
     pause .5
     put #script abort listen
     pause 0.5
     put .braid
     matchre DONE.BRAID DONE BRAIDING
     matchwait 300

DONE.BRAID:
     put #script abort braid
     pause .5
     pause .1
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then
          {
          send put $righthand in bucket
          send put $lefthand in bucket
          pause 0.5
          }
     pause
     send drop $lefthand
     send drop $righthand
     wait
DONE.BRAID2:
     pause .5
     gosub EMPTY.PACK.CHECK hav
     pause 0.5
     pause 0.5
     if $zoneid = 7 then gosub automove cross
     if $zoneid = 1 then gosub automove 1
     #put .listen
     #pause 9
     #put #script abort listen
     #put #echo >Log Aquamarine **** MECH - $Mechanical_Lore.Ranks $Mechanical_Lore.LearningRate / 34 ****
     pause 0.5
     goto LORES
###################
# MECHANICAL LORE
###################
LORES:
     var LAST LORES
     put #script abort braid
     put #script abort forage
     pause .1
     #gosub TEACHING
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     ##gosub TEACHING
     if $Mechanical_Lore.LearningRate > 19 then goto COMPENDIUM
MECH:
     var LAST MECH
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     GOSUB stowing
     if ("%ORIGAMI" = "OFF") then goto END.ORIGAMI
     pause .5
     pause .1
ORIGAMI:
     var LAST ORIGAMI
     put .origami
     matchre END.ORIGAMI DONE FOLDING|DONE MECH|YOU HAVE BEEN IDLE
     matchwait 500
     put #echo >Log Aquamarine **** MECH - $Mechanical_Lore.Ranks $Mechanical_Lore.LearningRate / 34 ****
     goto END.ORIGAMI

END.ORIGAMI:
     put #script abort origami
     GOSUB stowing
     pause 0.5

COMPENDIUM:
     var LAST COMPENDIUM
     put #script abort origami
     pause .1
     #gosub TEACHING
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     if ("%COMPENDIUM" = "OFF") then goto DONE.MECH
     if $First_Aid.LearningRate > 10 then goto DONE.MECH
     put #echo >Log Aquamarine *** STUDYING COMPENDIUM
     GOSUB stowing
ENCYCLOPEDIA:
var StudyLoop 0
     pause 0.3
     #gosub TEACHING
     send get my encyclopedia
     pause 0.8
     send open my encyc
     pause 0.3
STUDY.ENC:
     pause 0.1
     math StudyLoop add 1
     send study my encyc
     pause 2
     pause
TURN:
     pause 0.1
     send turn my encyc
     pause 0.5
STUDY.CHECK:
     if $Scholarship.LearningRate > 32 then goto DONE.STUDY
     if $First_Aid.LearningRate > 30 then goto DONE.STUDY
     if %StudyLoop > 2 then goto DONE.STUDY
     goto STUDY.ENC
DONE.STUDY:
     pause 0.1
     gosub stowing
DONE.MECH:
     var LAST DONE.MECH
     put #echo >Log MediumPurple **** FIRST AID - $First_Aid.Ranks  $First_Aid.LearningRate / 34  ****
     pause 0.2
     GOSUB stowing
     pause 0.5
     send get my $origami
     send exhale my $origami
     wait
     pause 0.5
     goto DISARM2.CHECK
     
DISARM2.CHECK:
     GOSUB DISARM.CHECK
     if "%BOXES" = "ON" then goto DISARM2
     else goto CLIMB

DISARM2:
     var LAST DISARM2
     var GEMS ON
     var TRAINING DISARM
     put #echo >Log BlueViolet **** PICKING BOXES ****
     ##gosub TEACHING
     pause .1
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     pause 0.5
AT.DISARM2:
     GOSUB armor.remove
     pause .5
     pause .5
     put .disarm
WAIT.FOR.DISARM2:
     waitfor DONE PICKING BOXES
     var bagsFull 0
     var GEMS ON
     var TRAINING STEALING
     var BOXES OFF
     pause 0.5
     send get my hand claw
     send wear my hand claw
     pause 0.5
     pause 0.5
     gosub put open my bag
     gosub put open my bac
     gosub put open my hav
     GOSUB GEM.POUCHES
     GOSUB EMPTY.PACK.CHECK %DEFAULT.CONTAINER
     GOSUB EMPTY.PACK.CHECK %GEM.CONTAINER
     GOSUB EMPTY.PACK.CHECK %BOX.CONTAINER
     pause .05

###############################
#	  CLIMBING      		#
###############################
CLIMB:
     if $Athletics.LearningRate > 10 then goto TO.STEAL
     action goto DONE.SWIM when You panic suddenly|The burning in your chest grows more intense
     var SWIMLOOP 0
     var LAST CLIMB
     if ("%ATHLETICS" = "OFF") then goto DONE.SWIM
     if $zoneid = 30 then gosub automove 203
     if $zoneid = 31 then
          {
          gosub automove faldesu
          goto SWIM
          }
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     pause 0.5
CLIMBING:
     put .climbshard
     waitforre CLIMBING DONE
     goto DONE.SWIM

SWIM:
     action goto DONE.SWIM when You panic suddenly|The burning in your chest grows more intense
     math SWIMLOOP add 1
     if $zoneid = 67 then gosub automove north
     if $zoneid = 66 then gosub automove water
     if $Athletics.LearningRate > 29 then goto DONE.SWIM
     if "%SWIMLOOP" > 14 then goto DONE.SWIM
     pause 0.5
     gosub automove 93
     gosub automove 88
     gosub automove 2
     put collect rock
     pause 5
     pause 0.5
     put kick pil
     put collect rock
     pause 5
     pause 0.5
     put kick pile
     goto SWIM

DONE.SWIM:
     action remove You panic suddenly|The burning in your chest grows more intense
     put #echo >Log BlueViolet **** ATHLETICS - $Athletics.Ranks $Athletics.LearningRate / 34
     if "$zoneid" = "14c" then gosub automove river
     if "$zoneid" = "31" then gosub automove river
     if $zoneid = 65 then gosub automove 1
     if $zoneid = 66 then gosub automove shard

############################
# DISARM 2
###########################
DISARM3.CHECK:
     var LAST DISARM3.CHECK
     action (jail) on
     GOSUB DISARM.CHECK
     if "%BOXES" = "ON" then goto DISARM3
     else goto BANK.COMBINE

DISARM3:
     var LAST DISARM3
     var GEMS ON
     var TRAINING DISARM
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then gosub CRYSTAL
     put #echo >Log BlueViolet **** PICKING BOXES ****
     if $zoneid = 116 then gosub automove 281
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     ##gosub TEACHING
     pause .1
AT.DISARM3:
     GOSUB armor.remove
     pause .5
     pause .5
     #gosub TEACHING
     put .disarm
WAIT.FOR.DISARM3:
     waitfor DONE PICKING BOXES
     var GEMS ON
     var TRAINING STEALING
     var BOXES OFF
     pause 0.5
     send get my hand claw
     send wear my hand claw
     pause 0.5
     pause 0.5
     GOSUB GEM.POUCHES
     GOSUB EMPTY.PACK.CHECK %DEFAULT.CONTAINER
     GOSUB EMPTY.PACK.CHECK %GEM.CONTAINER
     GOSUB EMPTY.PACK.CHECK %BOX.CONTAINER
     pause .05
############################
#   BANK DEPOSIT		  #
############################
BANK2:
     action (jail) on
     var LAST BANK2
     pause 0.5
AMMO.CHECK:
     var LAST AMMO.CHECK
     if $zoneid = 66 then gosub automove east
     pause 0.5
     gosub AUTOMOVE exchange
     gosub DOKORAS
     gosub AUTOMOVE teller
     gosub BANK
     put #echo >Log Yellow *** BANKED - %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze, %Copper Copper 
BANK.COMBINE:
     math TOTAL.PROFIT add %Profit
     gosub GLOBAL.PROFIT.ADD
     gosub COMBINE.BANK
EQUALIZE.IT:
     gosub EQUALIZECOIN
     pause 0.5
     pause 0.5
     put #echo >Log Yellow *** SESSION PROFIT: %TOTAL.PROFIT - %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze, %Coppers Copper
     put #echo >Log Yellow *** Time Online: %t
     gosub CLEAR.BANK
RUNTIME.CALC:     
     delay 0.0001
     put #tvar totalTime {#evalmath ($gametime - $startTime)} 
     echo $totalTime 
     ##CONVERT TO LOCAL AND DIVIDE
     delay 0.0001
     var totalTime $totalTime
     evalmath resultTime round((%totalTime / 60),2)
     pause 0.01
     put #tvar totalTime %resultTime
     echo $totalTime
     if ($totalTime < 60) then put #echo >Log Yellow *** SESSION TIME: $totalTime minutes
     if (($totalTime >= 60) && ($totalTime < 1440)) then 
          {
          var totalTime $totalTime
          evalmath resultTime round((%totalTime / 60),2)
          put #tvar totalTime %resultTime          
          put #echo >Log Yellow *** SESSION TIME: $totalTime hours
          }
     if ($totalTime >= 1440) then 
          {
          var totalTime $totalTime
          evalmath resultTime round((%totalTime / 1440),2)
          put #tvar totalTime %resultTime          
          put #echo >Log Yellow *** SESSION TIME: $totalTime days
          }
     pause 0.5
     goto ORB.RUB

ORB.RUB:
     if ("%ORIGAMI.RESTOCK" = "ON") then gosub RESTOCK.ENVELOPE
     var LAST ORB.RUB
     put rub my orb
     pause
     pause
     if $roomid = 0 then gosub moveRandomDirection
     if $zoneid = 66 then gosub automove east
     if $zoneid = 67 then gosub automove 81
     goto TOP
CRYSTAL:
     pause 0.0001
     pause 0.0001
     if ($concentration < 100) || ($Arcana.LearningRate > 33) then RETURN
     gosub PUT exhale my san crystal
     pause 0.001
     pause 0.001
     RETURN

TEACHING:
     pause 0.1
     if contains("$roomplayers","Psilocybe") then send teach debil to psil
     pause 0.1
     if contains("$roomplayers","Maklor") then send teach debil to maklor
     RETURN


##############################################################################################
#   UBER 1337 PROFIT TRACKING / BANK EXCHANGE V.9000    W/ CROSS SCRIPT INJECTION            #
##############################################################################################
BANK:
     if $invisible then send khri stop silence
	send wealth
	wait
	pause 0.1
     pause 0.1
     action (balancecheck) var Plat $1 when ^.*\s(\d+)\splatinum\,?
     action (balancecheck) var Gold $1 when ^.*\s(\d+)\sgold\,?
     action (balancecheck) var Silver $1 when ^.*\s(\d+)\ssilver\,?
     action (balancecheck) var Bronze $1 when ^.*\s(\d+)\sbronze\,?
     action (balancecheck) var Copper $1 when ^.*\s(\d+)\scopper
     action (balancecheck) off
     action (profitparse) var Plat $1 when ^PROFITPARSE\s(\d+)\d\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s\d+(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d+\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s(\d)\d\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d+\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s(\d)\d\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d+\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s(\d)\sPROFITPARSE
     action (profitparse) off
     var preDeposit 0
     var postDeposit 0
     var profit 0
     gosub BANK.COIN.CLEAR
     pause 0.1
     action (balancecheck) on
     pause 0.001
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     action (balancecheck) off
     pause 0.1
     gosub BANK.COIN.MATH
     gosub BANK.PREDEP.MATH
     pause 0.1
     put -deposit all;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     gosub BANK.COIN.CLEAR
     action (balancecheck) on
	pause 0.001
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.POSTDEP.MATH
     evalmath profit (%postDeposit - %preDeposit)
     math Profit add %profit
     pause 0.1
     gosub BANK.COIN.CLEAR
	pause 0.1
     action (profitparse) on
     put #parse PROFITPARSE %Profit PROFITPARSE
     action (profitparse) off
     put #statusbar 1 Profit: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper.
     put #parse MONEY DONE
     pause 0.1
     RETURN
BANK.COIN.CLEAR:
     var Copper 0
     var Bronze 0
     var Silver 0
     var Gold 0
     var Plat 0
     pause 0.1
     RETURN
BANK.COIN.MATH:
     math Bronze multiply 10
     math Silver multiply 100
     math Gold multiply 1000
     math Plat multiply 10000
     pause 0.1
     RETURN
BANK.PREDEP.MATH:
     math preDeposit add %Copper
     math preDeposit add %Bronze
     math preDeposit add %Silver
     math preDeposit add %Gold
     math preDeposit add %Plat
     pause 0.1
     RETURN
BANK.POSTDEP.MATH:
     math postDeposit add %Copper
     math postDeposit add %Bronze
     math postDeposit add %Silver
     math postDeposit add %Gold
     math postDeposit add %Plat
     pause 0.1
     RETURN

COMBINE.BANK:
	math Plats add %Plat
	math Golds add %Gold
	math Silvers add %Silver
	math Bronzes add %Bronze
	math Coppers add %Copper
	pause 0.1
	RETURN

GLOBAL.PROFIT.ADD:
	math Plats add $Plat
	math Golds add $Gold
	math Silvers add $Silver
	math Bronzes add $Bronze
	math Coppers add $Copper
	RETURN

CLEAR.BANK:
	var Plat 0
	var Gold 0
	var Silver 0
	var Bronze 0
	var Copper 0
	var preDeposit 0
	var postDeposit 0
	var profit 0
	var Profit 0
	put #tvar Plat 0
	put #tvar Gold 0
	put #tvar Silver 0
	put #tvar Bronze 0
	put #tvar Copper 0
	pause 0.1
	RETURN

#####################################
# COIN EQUALIZE 
#####################################
EQUALIZECOIN:
     EQ.COPPER:
     var cointype Coppers
     var convertto Bronzes
     gosub CONVERT.IT
     EQ.BRONZE:
     var cointype Bronzes
     var convertto Silvers
     gosub CONVERT.IT
     EQ.SILVER:
     var cointype Silvers
     var convertto Golds
     gosub CONVERT.IT
     EQ.GOLD:
     var cointype Golds
     var convertto Plats
     gosub CONVERT.IT
     pause 0.1
     RETURN 
CONVERT.IT:
     if (%cointype > 9) then RETURN
     if (%%cointype > 9) && (%%cointype < 21) then 
          {
          math %convertto add 1 
          math %cointype subtract 10
          }
     if (%%cointype > 19) && (%%cointype < 31) then 
          {
          math %convertto add 2
          math %cointype subtract 20
          }
     if (%%cointype > 29) && (%%cointype < 41) then 
          {
          math %convertto add 3
          math %cointype subtract 30
          }
     if (%%cointype > 39) && (%%cointype < 51) then 
          {
          math %convertto add 4
          math %cointype subtract 40
          }
     if (%%cointype > 49) && (%%cointype < 61) then 
          {
          math %convertto add 5
          math %cointype subtract 50
          }
     if (%%cointype > 59) && (%%cointype < 71) then 
          {
          math %convertto add 6
          math %cointype subtract 60
          }
     if (%%cointype > 69) && (%%cointype < 81) then 
          {
          math %convertto add 7
          math %cointype subtract 70
          }
     if (%%cointype > 79) && (%%cointype < 91) then 
          {
          math %convertto add 8
          math %cointype subtract 80
          }
     if (%%cointype > 89) && (%%cointype < 101) then 
          {
          math %convertto add 9
          math %cointype subtract 90
          }
     RETURN
#############################################
# MONEY EXCHANGE
#############################################
LIRUMS:
     var Target.Currency LIRUMS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
KRONARS:
     var Target.Currency KRONARS
     gosub EXCHANGE LIRUMS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
DOKORAS:
     var Target.Currency DOKORAS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE LIRUMS
     goto EXCHANGE.FINISH
EXCHANGE.INVIS:
     put hum scale
     pause 0.2
     put stop hum
     pause 0.1
     pause 0.1
     goto EXCHANGE.CONTINUE
EXCHANGE:
     var Coin $0
EXCHANGE.CONTINUE:
     pause 0.1
     matchre EXCHANGE.INVIS ^How can you .* when you can't be seen\?
     matchre EXCHANGE.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre RETURN ^You hand your money to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre RETURN ^But you don't have any .*\.
     matchre EXCHANGE.SMALLER transactions larger than a thousand
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE ALL %Coin FOR %Target.Currency
     matchwait
EXCHANGE.SMALLER:
     pause 0.1
     pause 0.2
     pause 0.1
     matchre EXCHANGE.SMALLER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre EXCHANGE.SMALLER ^You hand your .* to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre EXCHANGE.CONTINUE ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre EXCHANGE.CONTINUE ^But you don't have any .*\.
     matchre EXCHANGE.CONTINUE ^You don't have that many
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE 1000 plat %Coin FOR %Target.Currency
     matchwait   
EXCHANGE.FINISH:
     put #parse EXCHANGE DONE!
     RETURN
################################################################################################################################
# DONE MAIN SCRIPT
################################################################################################################################
########################

########################
# GEM POUCH BELT
########################
GEM.BELT:
     pause 0.1
     gosub stowing
     gosub PUT get my steel belt
     pause 0.1
RUB.IT.GOOD:
     matchre RUBNO ^You rub a sturdy steel belt 
     matchre RUBYES ^You gently rub the surface of your steel belt\, which causes your fingers to tingle\.
     matchre RUBYES If you open your steel belt within 10 seconds
     put rub my steel belt
     matchwait
RUBYES:
     put #echo >Log Fuchsia *********************************************************
     put #echo >Log Fuchsia **** FREE TREASURE!  MAGIC GEM-CREATING BELT USED
     put #echo >Log Fuchsia *********************************************************
     pause 0.1
     gosub PUT open my steel belt
     pause 0.7
     pause 0.1
     gosub GET my gem pouch
     gosub PUT fill my gem pouch with my belt
     pause 0.5
     pause 0.5
     gosub PUT tie my gem pou
     pause 0.5
RUBNO:
     gosub PUT close my steel belt
     pause 0.1
     gosub stowing
     RETURN
############################
#  JAILED SECTION
#############################
JAIL:
     action (jail) off
     put #script abort all except %scriptname
     pause 0.01
     put .scriptcheck
     action setvar location Crossing when CROSS JAIL
     action setvar location Leth when LETH JAIL
     action setvar location Riverhaven when RIVERHAVEN JAIL
     action setvar location Theren when THEREN JAIL
     action setvar location Shard when SHARD JAIL
     action setvar location Hib when HIB JAIL
     put .jail
     waitforre FREE FROM JAIL
     action (jail) on
     math JAILED add 1
     put rub gweth
     pause
     goto %LAST
################################
# AMMO RESTOCK
################################
RESTOCK.AMMO:
AMMO.RESTOCK:
var STOCK null
var STOCK2 null
var STOCK3 null
var BOLTS OFF
var ARROWS OFF
var STONES OFF
ECHO
ECHO *** LOW OR OUT OF AMMO - RESTOCKING SUPPLIES!
ECHO
     if $zoneid = 116 then
          {
          gosub automove 75
          put .travel shard
          waitforre ^YOU ARRIVED\!
          gosub AUTOMOVE shard
          }
     if $zoneid == 66 then gosub automove shard
     if $zoneid == 67 then gosub automove teller
     pause 0.5
     send withdraw 15 gold
     pause 0.5
COUNT1:
     pause 0.2
     matchre BOLT ^I could not find|^What were you
     matchre COUNT2 ^You count
     put count my bolt
     matchwait 3
BOLT:
     var BOLTS ON
     var STOCK XBOW BOLTS
COUNT2:
     pause 0.2
     matchre ARROW ^I could not find|^What were you
     matchre COUNT3 ^You count
     put count my arrows
     matchwait 3
ARROW:
     var ARROWS ON
     var STOCK2 ARROWS
COUNT3:
     pause 0.2
     matchre STONES ^I could not find|^What were you
     matchre BUY.BOLT ^You count
     matchre ^You count
     put count my clumps
     matchwait 3
STONES:
     pause 0.2
     var STONES ON
     var STOCK3 CLUMPS
#######################
# 
BUY.BOLT:
     pause 0.2
	gosub automove vault
	put .vault
	waitforre VAULT
	pause 0.1
     if ("%BOLTS" != "ON") then goto BUY.ARROW
GET.BOLT:
	pause 0.3
	pause 0.1
	matchre BREAK.BOLT ^You get
	matchre GET.BOLT ^You struggle
	matchre NO.BOLTS ^I could not|^What
	send get bolt from large shelf
	matchwait 3
BREAK.BOLT:
	pause 0.3
	put .break bolt 120
	waitforre FIN
	pause 0.1
	send put bolt on large shelf
	pause 0.5
     send get bolt from my bac
	pause 0.5
     gosub stowing
	pause 0.5
     if ("%ARROWS" = "ON") then goto BUY.ARROW
	if ("%ARROWS" != "ON") then goto BUY.STONE
     if ("%STONES" = "ON") then goto BUY.STONE
	goto RESTOCK.DONE
NO.BOLTS:
	put #echo >Log OrangeRed *** WARNING! OUT OF CROSSBOW BOLTS!! RESTOCK!!
BUY.ARROW:
     pause 0.1
     if ("%ARROWS" != "ON") then goto BUY.STONE
GET.ARROW:
	pause 0.1
	pause 0.1
	pause 0.1
	matchre BREAK.ARROW ^You get
	matchre GET.ARROW ^You struggle
	matchre GET.ARROW2 ^I could not|^What|^You are not strong
	send get arrow from large shelf
	matchwait 3
GET.ARROW2:
	pause 0.1
	pause 0.1
	pause 0.1
	matchre BREAK.ARROW ^You get
	matchre GET.ARROW ^You struggle
	matchre NO.ARROWS ^I could not|^What|^You are not strong
	send get arrow from second shelf
	matchwait 3
BREAK.ARROW:
	pause 0.3
	put .break arrow 120
	waitforre FIN
	pause 0.3
	send put arrow on large shelf
	pause 0.5
     pause 0.5
     send get arrow from my bac
	pause 0.5
     gosub stowing
	pause 0.5
	if ("%STONES" != "ON") then goto RESTOCK.DONE
	goto BUY.STONE
NO.ARROWS:
	put #echo >Log OrangeRed *** WARNING: OUT OF ARROWS!! RESTOCK!!
BUY.STONE:
     if ("%STONES" != "ON") then goto RESTOCK.DONE
GET.STONE:
	pause 0.1
	pause 0.1
	pause 0.1
	matchre BREAK.STONE ^You get
	matchre GET.STONE ^You struggle
	matchre NO.STONES ^I could not|^What|^You are not strong
	send get clump from large shelf
	matchwait 5
BREAK.STONE:
	pause 0.3
	put .break clump 90
	waitforre FIN
	pause 0.5
     pause 0.5
	put put clump on large shelf
	pause 0.5
     send get clump from my bac
	pause 0.5
     gosub stowing
	pause 0.5
RESTOCK.DONE:
     put #echo >Log Chartreuse *** AMMO RESTOCK COMPLETE!
     put #echo >Log Chartreuse *** RESTOCKED: %STOCK | %STOCK2 | %STOCK3
     var AMMO.RESTOCK OFF
     var BOLTS OFF
     var ARROWS OFF
     var STONED OFF
	put DONE
	pause 7
     RETURN

################################
# ORIGAMI ENVELOPE RESTOCK
################################
RESTOCK.ENVELOPE:
	var envelopes 0
	gosub automove vault
	put .vault
	waitforre VAULT
	pause 0.1
GET.ENV:
	pause 0.1
	pause 0.1
	matchre STOW.ENV ^You get|^You struggle
	matchre NO.ENV ^I could not|^What
	send get env from ruck in vault
	matchwait 5
	put #echo >Log red Missing match label in GET.ENV
STOW.ENV:
	math envelopes add 1
	pause 0.3
	put stow env
	pause 0.5
	if %envelopes > 4 then goto DONE.ENV
	goto GET.ENV
NO.ENV: 
	put #echo >Log Red **** OUT OF ORIGAMI ENVELOPES! GET MORE!
DONE.ENV:
	var ORIGAMI.RESTOCK OFF
	put DONE
	pause 4
	put #echo >Log Chartreuse *** RESTOCKED ORIGAMI ENVELOPES
	RETURN
#########################################
#  DEATH, FAVORS AND DEPARTING SECTION	#
#########################################
ORB.DONE:
     var LAST ORB.DONE
     echo
     echo *** FILLED A FAVOR ORB! GOING TO GET A NEW ONE!
     echo
     put #script abort all except %scriptname
     pause
     put .scriptcheck
     gosub stowing
     if contains("$roomname", "Fang Cove") then gosub LEAVE.SEACAVE
     pause
     if $zoneid == 67 then goto SHARD.TO.TEMPLE
     if $zoneid == 1 then goto CROSS.TO.TEMPLE
     if $zoneid == 31 then gosub AUTOMOVE riverhaven
     if $zoneid == 30 then goto HAVEN.TO.TEMPLE
SHARD.TO.TEMPLE:
     gosub automove light temple
     pause .5
     gosub automove depart
     pause
     put get my orb
     pause .5
     put put my orb on altar
     pause
GET.FAVOR:
     if $zoneid == 67 then goto GET.FAVOR.SHARD
     if $zoneid == 1 then goto GET.FAVOR.CROSS
     if $zoneid == 30 then goto GET.FAVOR.HAVEN
GET.FAVOR.SHARD:
     var LAST GET.FAVOR.SHARD
     pause
     gosub automove light
     pause .5
     put .favorshard
     waitfor FAVOR DONE
     pause .5
     goto TOP

CROSS.TO.TEMPLE:
     gosub automove temple
     pause .5
     gosub automove favor
     pause .5
     put get my orb
     pause .5
     put put my orb on altar
     pause .5
     gosub automove cross
     pause .5
GET.FAVOR.CROSS:
     gosub automove 42
     put .favor
     waitfor FAVOR DONE
     pause .5
     goto TOP

HAVEN.TO.TEMPLE:
     gosub automove 135
     pause .5
     put get my orb
     pause .5
     put put my orb on altar
     pause .5
GET.FAVOR.HAVEN:
     put .favorhaven
     waitfor FAVOR DONE
     pause .5
     goto TOP
##################
# DEPART SECTION #
##################
DEAD:
     put #script abort all except %scriptname
     math DEATHS add 1
     put #play Powerful Enemy.wav
     put #echo >Log DeepPink ########################
     put #echo >Log DeepPink !!!! YOU HAVE DIED  !!!!
     put #echo >Log DeepPink ****    PWNED!      *****
     put #echo >Log DeepPink ########################
     put #echo >Log2 Red ******** YOU DIED!!! *********
     pause .1
     if $zoneid = TF1 then goto HELP.REZZ.ME
     GOTO depart
     if $charactername = Shroom then goto depart
     put quit
     put exit
     exit

HELP.REZZ.ME:
     pause .5
     put 'ACKKKZ!!!.. HELP!
     matchre WAIT.FOR.REZZ Hold on
     matchwait 80
     goto DEPART

WAIT.FOR.REZZ:
     pause 40
     if $dead = 0 then goto GET.STUFF.RECOVER
     pause 60
     if $dead = 0 then goto GET.STUFF.RECOVER
     pause 60
     if $dead = 0 then goto GET.STUFF.RECOVER
     pause 40
     if $dead = 0 then goto GET.STUFF.RECOVER
     pause 20
     if $dead = 1 then goto DEPART

DEPART:
     put #play concuss.wav
     echo
     echo *** YOU HAVE DIED! DEPARTING... ***
     echo
     pause .5
     pause
DEPART.ITEMS:
     put #script abort all except %scriptname
     put depart items
     pause 2
     pause
     GOSUB stand
     put go arch
     put n
     pause .5
     pause .5
     echo
SEARCH.WEAPONS:
     echo **** Going to look for dropped weapons on the ground!! ****
     echo
     put khri sagacity
     pause .5
     put #echo >Log White **** Going to look for dropped weapons!
     if "$zoneid" = "2a" then goto DEAD.XING
     if "$zoneid" = "42" then goto THEREN.LOCATION
     if "$zoneid" = "67" then goto SHARD.DEATH
     if "$zoneid" = "69" then goto GET.SWORD1
     if "$zoneid" = "150" then goto FANGCOVE.DEATH
     goto get.sword


MOVE.IT:
     action put #echo >Log Lime $0 when ^You pick up a (\S+)
     action put #echo >Log Lime $0 when ^You fade in for a moment as you pick up a (\S+)
     action goto shroom.grave when Shroom's grave
     setvariable compass $1
     if "$righthand" != "Empty" then put stow right
     if "$lefthand" != "Empty" then put stow left
     put %compass
     pause .5
     pause .5
     pause .5
     GOSUB stowAmmo
     pause .5
     pause .5
     return

GET.SWORD:
     pause .1
     GOSUB fleeing.inactivate
     put stance evasion
     pause .1
     if $zoneid = 123 then goto RAVEN.GRAVE
     if $zoneid = 67 then goto SHARD.GRAVE
     if $zoneid = 69 then goto GET.SWORD1
     if $zoneid = 13 then goto DIRGE.GRAVE
RAVEN.GRAVE:
     gosub automove 175
     pause .5
     GOTO GET.SWORD1

SHARD.DEATH:
SHARD.GRAVE:
     put khri stop
     pause
     gosub automove west gate
     pause .5
GET.SWORD1:
     put khri silence
     pause
     pause .5
     gosub automove 490
     pause .5
     GOTO SEARCH.GRAVE

DIRGE.GRAVE:
     put khri silence
     pause
     pause .5
     gosub automove 191
SEARCH.GRAVE:
     pause .5
     GOSUB stowAmmo
     GOSUB move.it e
     GOSUB move.it w
     GOSUB move.it w
SEARCH.CLIMB:
     gosub automove 484
     GOSUB move.it se
     GOSUB move.it se
     GOSUB move.it se
     goto done.grave

SHROOM.GRAVE:
     action remove shroom grave
     put #script abort all except %scriptname
     pause .2
     put khri silence
     pause
     pause
     pause .5
     action put drop $lefthandnoun when ^You need a free hand
     action remove Shroom's grave
     put kneel;dig grave
     pause .5
     put stand
     pause .5

get.items:
     action put ret when closes to
     action instant goto everything when ^There is nothing in there
     matchre everything empty\.
     matchre everything nothing in there\.
     matchre everything I could not find
     matchre wearit (\w+)\.
     matchre wearit (\w+),
     pause .5
     put look in $charactername grave
     matchwait

wearit:
     setvariable wear $1
     put get %wear from $charactername grave
     pause .5
     put wear %wear
     goto get.items

everything:
     action remove ^There is nothing in there

done.grave:
     action remove ^You need a free hand
     action remove ^You pick up a (\S+)
     action remove ^You fade in for a moment as you pick up a (\S+)
     put look
     pause .5
     GOSUB stowAmmo
     GOSUB stow

LEAVE.GRAVE:
     pause .2
     put khri silence
     pause .5
     pause .2
     pause .5
     pause .2
     echo "ROOM LOCATION" = %location
     goto LEAVING.GRAVE.TO.REPAIR

LEAVING.GRAVE.TO.REPAIR:
     pause .1
     pause .1
     action remove Also here:
     action remove ^You hear someone cough
     matchre repair.me ^\.\.\.wait|^Sorry, you may only type ahead|^You stop advancing|^You retreat
     matchre STUNNED ^You try to back away from|^You are still stunned
     matchre go.repair ^You retreat from combat\.
     matchre go.repair ^You are already as far away as you can get!
     put retreat
     matchwait

FANGCOVE.DEATH:
     pause
     gosub automove 85
     pause
     goto LORES

GO.REPAIR:
     GOSUB automove shard
     pause .5
     put khri stop
GO.REPAIR2:
     pause .1
     pause .5

DONERESTART:
     pause .5
     put #echo >Log Skyblue *** RESTARTING
     put #script abort all except %scriptname
     put exit
     pause 2
     pause
     pause 2
     send #connect
     pause 13
     pause 3
     pause
     GOTO TOP

GET.STUFF.RECOVER:
     pause 2
     GOSUB stand
     put lean beer
     pause
     GOSUB stowammo
     pause
     GOTO TOP
DEAD.XING:
     pause .5
     GOSUB automove crossing
     pause .5
     goto TOP
#################################################################################
#
#	USEFUL UTILITY GOSUBS
#
#################################################################################
ARMOR.CHECK:
APP.LEATHER:
     pause .5
     send get my %LEG.ARMOR
     wait
     pause .1
     send wear my %LEG.ARMOR
     pause .5
     matchre ARMOR.DAMAGED practically destroyed|badly damaged|heavily scratched|unsightly notches|dents and dings|scratches|scuffed
     matchre ORB.CHECK Roundtime|pristine condition|good condition
     matchre DONE.REPAIR Appraise what\?
     put app my %LEG.ARMOR quick
     matchwait

ARMOR.DAMAGED:
     var REPAIR ON

ORB.CHECK:
     pause .5
     matchre GET.FAVOR ^I could not|^What were you|^Tap what
     matchre RETURN ^You tap|^The orb is delicate
     send tap my orb
     matchwait 20
     RETURN

DIARY:
     pause 0.2
     send get my diary
     send rem my diary
     wait
     pause 0.5
DIARY.WRITE:
     matchre DIARY.YES Flipping to a blank page
     matchre DIARY.YES Roundtime
     matchre DIARY.NO Having recently written|You can do that again in
     send write my diary
     matchwait 10
     goto DIARY.NO
     DIARY.YES:
     put #echo >Log Fuchsia ********************************************
     put #echo >Log Fuchsia **** !!EXP BOOST!! - WOOT! JOURNAL USED!
     put #echo >Log Fuchsia ********************************************
     DIARY.NO:
     send wear my diary
     pause 0.5
     gosub stowing
     RETURN
     
LOOT.CHECK:
     matchre GO.PAWN diamondique lockpick|great helm|warring axe|silverwillow crossbow|skirt|flute|woodwind case|ilmenite-tipped wand|full leather armor
     matchre RETURN ^In the
     put look in my bag
     put look in my back
     matchwait 3
     RETURN

THROWINGBLADE.CHECK:
     matchre RESTOCK.STARS ^I could not|^What were|^Tap what
     matchre RETURN ^You tap
     put tap my eighth star
     matchwait 7
     RETURN
GO.PAWN:
     if $zoneid = 150 then gosub LEAVE.SEACAVE
     if $zoneid = 1 then gosub automove pawn
     if $zoneid = 69 then gosub automove shard
     pause .1
     if $zoneid = 67 then goto TO.PAWN

TO.PAWN:
     put .steal GO.PAWN.CROSS CROSSING YES
     waitforre DONE STEALING
     goto TOP

stowfootitem:
	gosub stowammo
     pause .0001
     send invoke
     pause 0.3
     pause 0.3
     pause .0001
     send stow %itemtostow
     if matchre("$roomobjs","bola") then send stow bola
     pause 0.1
     pause .0001
     pause .0001
     goto %LAST

STEALING.WAITING:
     gosub clear
     echo *** STEALING SCRIPT IS RECOVERING!
     waitforre RECONNECTED NOW
     goto STEALWAIT
 
ARMOR.WEAR:
     put .armor wear
     waitfor ARMOR DONE
     RETURN
ARMOR.REMOVE:
     put .armor
     waitfor ARMOR DONE
     RETURN
     
ROOM.CHECK:
if "$roomid" = "0" then gosub moveRandomDirection
pause 0.5
RETURN

BUY.T.BLADES:
     var tBlade 0
     put #echo >Log Pink **** LOW ON THROWING BLADES - RESTOCKING!
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     if $zoneid = 67 then gosub automove teller
     pause 0.5
     send withdraw 10 plat
     gosub automove east
     gosub automove surv
     pause 0.1
     pause 0.1
BUYING.BLADES:
     delay 0.001
     pause 0.001
     pause 0.001
     matchre BLADE.ADD ^You decide to purchase|^The sales clerk
     matchre BLADE.WAIT ^That throwing|If you're trying|^Buy what\?
     put buy throwing blades
     matchwait 5
BLADE.WAIT:
     ECHO ***WAITING FOR THROWING BLADES TO RESTOCK!!!
     matchre BUYING.BLADES ^A young girl|^A young man
     put look
     matchwait 45
     goto BUYING.BLADES
BLADE.ADD: 
     pause 0.1
     math tBlade add 1
     if %tBlade > 30 then goto BLADE.RETURN
     if %tBlade < 10 then send stow blade in my hav
     if %tBlade < 20 then send stow blade in my bac
     if %tBlade < 30 then send stow blade in my bag
     if %tBlade = 30 then send stow blade 
     pause 0.1
     pause 0.1
     pause 0.1
     pause 0.001
     pause 0.001
     goto BUYING.BLADES
BLADE.RETURN:
     pause 0.1
     pause 0.1
     gosub stowing 
     pause 0.001
     gosub automove east
     RETURN
RESTOCK.STARS:
     put #echo >Log Pink **** LOW ON THROWING STARS - RESTOCKING!
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     if $zoneid = 67 then gosub automove vault
     pause 0.5
     put .vault
     pause 7
     var stars 0
GET.STARS:
     pause 0.1
     send get star from ruck
     wait
     put stow star
     pause 0.1
     pause 0.1
     pause 0.1
     math stars add 1
     if %stars > 9 then goto STAR.RETURN
     goto GET.STARS
STAR.RETURN:
     put DONE
     put #parse DONE
     pause 5
     RETURN
#################################
# ARMOR REPAIR SECTION
#################################
REPAIR.ARMOR:
var LAST REPAIR.ARMOR
var LOOPED NO
pause .5
GOSUB stowing
put .armor wear
waitfor ARMOR DONE

## GO GET MONEY
GOTO.REPAIR:
     var LAST GOTO.REPAIR
     if matchre("$zoneid","(116|127)" then 
          {
               put .travel shard
               waitforre ^YOU ARRIVED\!
          }
     if contains("$zoneid","(7|6|4|8|5)" then
          {
               put .travel cross
               waitforre ^YOU ARRIVED\!
          }
     if $zoneid = 40 then gosub automove theren
     pause 0.2
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 66 then gosub automove east gate
     if $zoneid = 31 then gosub automove riverhaven
     if matchre("$zoneid","(1|67|30|42)" then
          {
          gosub automove teller
          put with 12 plat
          pause 0.5
          }
## TO REPAIR PERSON
     if $zoneid = 67 then gosub automove north
     if $zoneid = 42 then gosub automove smithy
     if $zoneid = 66 then gosub automove ylono
     if $zoneid = 30 then gosub automove unsp
     if $zoneid = 1 then gosub automove catrox
## SET REPAIR PERSON
     if $zoneid = 67 then var repairer ylono
     if $zoneid = 66 then var repairer ylono
     if $zoneid = 30 then var repairer unspi
     if $zoneid = 42 then var repairer dagul
     if $zoneid = 1 then var repairer catrox
     pause 0.5
     put .repair
     waitforre REPAIR DONE|DONE
     gosub WEAPON.REPAIR
     if $zoneid = 30 then 
          {
               gosub automove gate
               gosub automove repair
               var repairer kamze
               put .repair
               waitforre REPAIR DONE|DONE
               gosub WEAPON.REPAIR
          }
               
     goto WAIT.FOR.REPAIR

WEAPON.REPAIR:
     pause 0.1
     gosub GIVE.YLONO kertig.blade
     gosub GIVE.YLONO mace
     gosub GIVE.YLONO sword
     gosub GIVE.YLONO hammer
     gosub GIVE.YLONO t.blade
     gosub GIVE.YLONO nightstick
     gosub GIVE.YLONO mattock
     gosub GIVE.YLONO dagger
     gosub GIVE.YLONO crossbow
     gosub GIVE.YLONO longbow
     gosub GIVE.YLONO staff.sling
     gosub GIVE.YLONO dagger
     RETURN

GIVE.YLONO:
     delay 0.001
     var item $0
     gosub PUT get my %item
     gosub PUT give %repairer
     gosub PUT give %repairer
     gosub stow
     pause 0.3
     RETURN
     
WAIT.FOR.REPAIR:
     gosub clear
     var LOOP 0
     send out
     pause 0.5
     pause 0.5
WAITING.REPAIR.LOOP:
     var LAST WAITING.REPAIR.LOOP
     math LOOP add 1
     #if $Outdoorsmanship.LearningRate > 31 then goto DONE.REPAIR
     if %LOOP >= 18 then goto DONE.REPAIR
     put collect rock
     pause 3
     pause
     put collect rock
     pause 3
     pause
     if matchre("$roomobjs","(pile of coins|pile of coin|pile of rocks|pile of grass)") then put kick pile
     pause 0.2
     if matchre("$roomobjs","(pile of coins|pile of coin|pile of rocks|pile of grass)") then put kick pile
     pause 0.2
     if $standing = 0 then gosub stand
     pause 0.2
     goto WAITING.REPAIR.LOOP

DONE.REPAIR:
     var LAST DONE.REPAIR
     pause
     gosub stowing
     pause 0.5
     if ($zoneid = 1) then gosub automove catrox
     if ($zoneid = 30) then gosub automove unsp
     if ($zoneid = 65) then gosub automove shard
     if ($zoneid = 66) then gosub automove ylono
     if ($zoneid = 40) then gosub automove repair
     pause 0.5
     var REPAIR OFF
     put .repairdone
     waitforre REPAIR DONE|DONE
     if ($zoneid = 40) then 
          {
          var repairer dagul
          gosub automove theren
          gosub automove smithy
          put .repairdone
          waitforre REPAIR DONE|DONE
          }
     put #echo >Log Orange *** REPAIRED ALL ARMOR @ %repairer ***
     pause 0.1
     send out
     pause 0.5
     pause 0.5
REPAIRDONE:
     if ($zoneid = 66) then gosub automove shard
     pause 0.5
     gosub automove teller
     pause 0.3
     put deposit all
     pause
     goto CONTINUE


REPAIR.TOOLS:
var LOOP 0
pause 0.8
gosub stowing
pause 0.5
gosub automove teller
put with 4 plat
pause 0.8
gosub automove north
gosub automove ylono
gosub put untie my bowl
gosub get my bowl
gosub put give bowl to ylono
gosub put give bowl to ylono
gosub put stow tick
gosub TIE.TO.BELT
gosub put untie my sieve
gosub get my sieve
gosub put give sieve to ylono
gosub put give sieve to ylono
gosub put stow tick
gosub TIE.TO.BELT
gosub put untie my mix stick
gosub get my mix stick
gosub put give stick to ylono
gosub put give stick to ylono
gosub put stow tick
gosub TIE.TO.BELT
gosub put untie my pestle
gosub get my pestle
gosub put give pestle to ylono
gosub put give pestle to ylono
gosub put stow tick
gosub TIE.TO.BELT
gosub put untie my mortar
gosub get my mortar
gosub put give mortar to ylono
gosub put give mortar to ylono
gosub put stow tick
gosub TIE.TO.BELT
gosub automove 25
var LOOP 0
COLLECT.REPAIR:
var collectLoop 0
var LAST COLLECT.REPAIR
put .climbshard
waitforre CLIMBING DONE
if $zoneid = 0 then gosub moveRandomDirection
if $zoneid = 67 then gosub automove north
gosub automove 71
COLLECT.LOOP:
var LAST COLLECT.LOOP
math collectLoop add 1
send collect coin
pause 5
pause 
gosub KICKEM
if %collectLoop > 13 then goto REPAIR.TOOL.DONE
goto COLLECT.LOOP

REPAIR.TOOL.DONE:
var LAST REPAIR.TOOL.DONE
var LOOP 0
gosub automove ylono
put get tick
wait
put give tick to ylono
pause 0.1
gosub TIE.TO.BELT
pause 0.5
put get tick
wait
put give tick to ylono
pause 0.1
gosub TIE.TO.BELT
pause 0.5
put get tick
wait
put give tick to ylono
pause 0.1
gosub TIE.TO.BELT
pause 0.5
put get tick
wait
put give tick to ylono
pause 0.1
gosub TIE.TO.BELT
pause 0.5
put get tick
wait
put give tick to ylono
pause 0.1
gosub TIE.TO.BELT
pause 0.5
goto CLIMB

TIE.TO.BELT:
pause 0.1
if "$righthand" != "Empty" then GOSUB put tie my $righthand to my alch belt
if "$lefthand" != "Empty" then GOSUB put tie my $righthand to my alch belt
pause 0.1
pause 0.1
RETURN

## STEALING BOXES WHILE IN WYVERNS 
BOX.STEAL:
     var box.count 0
     send .travel boar
     waitforre ^YOU ARRIVED\!
     put #echo >Log Aqua ***** HUNTING FOR BOXES *****
     ECHO ***** HUNTING FOR BOXES... *****
BOX.STEALING:
# STOMPERS/SPLITTERS
     gosub automove 566
     gosub BOXES.CHECK
     gosub automove 567
     gosub BOXES.CHECK
     gosub automove 568
     gosub BOXES.CHECK
     gosub automove 569
     gosub BOXES.CHECK
     gosub automove 570
     gosub BOXES.CHECK
     gosub automove 571
     gosub BOXES.CHECK
     gosub automove 573
     gosub BOXES.CHECK
     gosub automove 574
     gosub BOXES.CHECK
     gosub automove 575
     gosub BOXES.CHECK
     gosub automove 576
     gosub BOXES.CHECK
     gosub automove 577
     gosub BOXES.CHECK
     gosub automove 578
     gosub BOXES.CHECK
     gosub automove 579
     gosub BOXES.CHECK
     gosub automove 580
     gosub BOXES.CHECK
BOXES.DONE:
     ECHO **** DONE GATHERING BOXES!!!! ****
     put #echo >Log Aqua ***** Collected %box.count boxes *****
BOXES.HUNT:
     action (weapon) off
     if !("$roomplayers" = "") then gosub moveRandomDirection
          put search
          waitforre ^Roundtime:|^You scan the
          pause 1
     if !("$roomplayers" = "") then gosub moveRandomDirection
               echo
               echo *** FOUND ROOM! ***
               echo
     if !("$roomplayers" = "") then gosub moveRandomDirection
               echo
               echo *** FOUND ROOM! ***
               echo
     put .hunter lootall search boxes roam skin stance timer 650 snap 3 poach sling
     matchre BOXHUNT2 HUNTER DONE|GH WEAPON FINISHED
     matchwait 920
BOXHUNT2:
     put #script abort hunter
     pause 
     gosub stowing
     gosub stowammo
     pause 0.5
     put .hunter lootall search boxes roam skin stance timer 400 backstab sabre
     matchre LEAVE.BOAR HUNTER DONE|GH WEAPON FINISHED
     matchwait 900
     goto LEAVE.BOAR
BOXES.CHECK:
     if contains("$roomplayers","Pranx") then 
          {
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES    
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES                   
          }
     if contains("$roomplayers","Razhak") then
          {
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES        
               if matchre ("$roomobjs", "(%boxes)") then gosub LOOT.BOXES                   
          }
     if ("$roomplayers" = "") then gosub LOOT.BOXES
     RETURN
LOOT.BOXES:
     if (%bagsFull = 1) then RETURN
     if matchre ("$roomobjs", "(%boxtype) (%boxes)") then 
          {
          gosub stow $0
          math box.count add 1
          }
     if matchre ("$roomobjs", "(%boxtype) (%boxes)") then
          {
          gosub stow $0
          math box.count add 1
          pause 0.1
          }
     if matchre ("$roomobjs", "(%boxtype) (%boxes)") then
          {
          gosub stow $0
          math box.count add 1
          pause 0.1
          }
     if matchre ("$roomobjs", "(%boxtype) (%boxes)") then
          {
          gosub stow $0
          math box.count add 1
          pause 0.1
          }
     RETURN
LEAVE.BOAR:
     put #script abort hunter
     pause 
     action (weapon) on
     gosub stowing
     gosub stowammo
     pause 0.5
     gosub automove gate
     pause 0.5
     pause 0.5
     send .travel shard
     waitforre ^YOU ARRIVED\!
     gosub automove shard
     goto DISARMING
#####################################
# TRAVEL LOGIC
#####################################
COMBAT.LOCATION:
pause .1
if "%TRAINING" = "BOXES" then goto TO.COMBAT
goto TO.COMBAT

SHARD.LOCATION:
gosub automove bank
pause .1
if "%BOXES" = "ON" then goto TO.COMBAT
if "%TRAINING" = "DISARM" then goto TO.COMBAT
if "%TRAINING" = "BOXES" then goto TO.COMBAT
if "%TRAINING" = "COMBAT" then goto TO.COMBAT
if "%TRAINING" = "CLIMBING" then goto TO.COMBAT
if "%TRAINING" = "STEALING" then goto TO.COMBAT
goto TO.COMBAT

CROSS.LOCATION:
CROSSING.LOCATION:
gosub automove 42
pause .5
if "%TRAINING" = "BOXES" then goto TO.SHARD
if "%TRAINING" = "STEALING" then goto TO.SHARD
if "%TRAINING" = "COMBAT" then goto TO.SHARD
if "%TRAINING" = "CLIMBING" then goto TO.SHARD
goto TO.SHARD

DIRGE.LOCATION:
gosub automove gate
pause .1
if "%TRAINING" = "BOXES" then goto TO.CROSS
if "%TRAINING" = "STEALING" then goto TO.CROSS
if "%TRAINING" = "COMBAT" then goto TO.CROSS
if "%TRAINING" = "CLIMBING" then goto TO.CROSS
goto TO.COMBAT

HAVEN.LOCATION:
gosub automove town
pause .1
if "%TRAINING" = "BOXES" then goto TO.COMBAT
if "%TRAINING" = "STEALING" then goto TO.COMBAT
if "%TRAINING" = "COMBAT" then goto TO.COMBAT
if "%TRAINING" = "CLIMBING" then goto TO.COMBAT
goto TO.COMBAT

LETH.LOCATION:
gosub automove 18
pause .1
if "%TRAINING" = "BOXES" then goto TO.SHARD
if "%TRAINING" = "STEALING" then goto TO.SHARD
if "%TRAINING" = "COMBAT" then goto TO.SHARD
if "%TRAINING" = "CLIMBING" then goto TO.SHARD
goto TO.SHARD

BOAR.CLAN.LOCATION:
gosub automove 18
pause .1
if "%TRAINING" = "BOXES" then goto TO.COMBAT
if "%TRAINING" = "STEALING" then goto TO.COMBAT
if "%TRAINING" = "COMBAT" then goto TO.COMBAT
if "%TRAINING" = "CLIMBING" then goto TO.COMBAT
goto TO.COMBAT

HIB.LOCATION:
gosub automove 75
pause .1
if "%TRAINING" = "BOXES" then goto TO.BOAR
if "%TRAINING" = "STEALING" then goto TO.BOAR
if "%TRAINING" = "COMBAT" then goto TO.BOAR
if "%TRAINING" = "CLIMBING" then goto TO.BOAR
goto TO.BOAR

ROSSMAN.LOCATION:
pause .1
if "%TRAINING" = "BOXES" then goto TO.SHARD
if "%TRAINING" = "STEALING" then goto TO.SHARD
if "%TRAINING" = "COMBAT" then goto TO.SHARD
if "%TRAINING" = "CLIMBING" then goto TO.SHARD
goto TO.SHARD

THEREN.LOCATION:
gosub automove portal
pause .1
if "%TRAINING" = "BOXES" then goto TO.SHARD
if "%TRAINING" = "STEALING" then goto TO.SHARD
if "%TRAINING" = "COMBAT" then goto TO.SHARD
if "%TRAINING" = "CLIMBING" then goto TO.SHARD
goto TO.SHARD

ARTHE.LOCATION:
gosub automove 1
pause .1
if "%TRAINING" = "BOXES" then goto TO.SHARD
if "%TRAINING" = "STEALING" then goto TO.SHARD
if "%TRAINING" = "COMBAT" then goto TO.SHARD
if "%TRAINING" = "CLIMBING" then goto TO.SHARD
goto TO.SHARD

FALDESU:
move s
pause
pause
gosub automove riverhaven
pause .5
gosub automove riverhaven
pause .5
goto HAVEN.LOCATION

KARTAIS:
gosub automove 112
pause .5
gosub automove leth
pause .5
goto LETH.LOCATION

TO.SHARD:
var LAST TO.SHARD
send .travel shard
waitforre ^YOU ARRIVED\!
pause .5
gosub automove 215
pause
goto SHARD.LOCATION

SOCIAL.OUTRAGE:
pause 5
if $stunned = 1 then goto SOCIAL.OUTRAGE
pause .5
pause .5
if $standing = 0 then gosub stand
pause .5
put e
pause .5
pause .5
put #echo >Log Yellow YOU WERE THUGGED! CHECK THIEF REP!
pause .5
gosub automove 9
pause .5
gosub automove cross
pause .5
goto CROSS.TO.BANK

CROSS.TO.BANK:
var LAST CROSS.TO.BANK
gosub automove bank
goto CROSSING.LOCATION

CROSSING.TEMPLE:
gosub automove 3
pause .5
goto CROSSING.LOCATION

CROSSING.THIEF:
gosub automove 19
gosub MOVE up
pause .5
goto CROSSING.LOCATION

TO.LETH:
var LAST TO.LETH
gosub automove 42
send .travel leth
waitforre ^YOU ARRIVED\!
pause .5
goto LETH.LOCATION

TO.CROSS:
TO.CROSSING:
var LAST TO.CROSSING
send .travel cross
waitforre ^YOU ARRIVED\!
pause .5
goto CROSSING.LOCATION

SHARD.TO.BOAR:
var LAST SHARD.TO.BOAR
pause .5
gosub automove north
pause .5
gosub automove 65
TO.BOAR:
var LAST TO.BOAR
send .travel boar
waitforre ^YOU ARRIVED\!
pause .1
goto BOAR.CLAN.LOCATION
TO.BOAR.GATE:
gosub automove 18
pause .1
goto BOAR.CLAN.LOCATION

TO.RAVEN.POINT:
gosub automove 133
send .travel shard
waitforre ^YOU ARRIVED\!
goto SHARD.LOCATION

TO.HAVEN:
var LAST TO.HAVEN
pause .1
send .travel haven
waitforre ^YOU ARRIVED\!
pause
goto HAVEN.LOCATION

##########################
# CONNECTION SUBS
##########################     
STUNNEDOUT:
     GOSUB clear
     put #script abort all except %scriptname
     put #echo >Log Red *** STUNNED OR HURT!! Logging out for 40 minutes..
     put #echo >$Log Fuchsia $datetime ***** Stunned out! *****
     var escape.loop 0
     action (reconnect) off
     gosub QUIT
     pause
     pause
     math LOGOUT add 1
     echo *** TOO HURT!!! PANIC EXIT! ***
     echo *** LOGGING OUT FOR 45 MINUTES! 
     pause 2400
     echo *** 5 MINUTES LEFT!! ***
     pause 300
     echo *** LOGGING BACK IN! BE CAREFUL! ***
STUN.CONNECT: 
     action (combat) off 
     echo *** You have been stunned out.  Attempting to reconnect *** 
     put #echo >Log Yellow *** Reconnecting after stun... Be careful! *** 
     action goto STUN.CONNECTED when You look around, taking a moment to get your bearings|Welcome to DragonRealms
STUN.CONNECTING: 
     gosub CONNECT_NOW
     pause 2
STUN.CONNECTED:
     var stun.connect ON
     pause
     pause
     goto ESCAPE
     
DISCONNECTED:
     GOSUB clear
     action (combat) off
     action (reconnect) off
     put #script abort all except %scriptname
     put #echo >Log Red *** Disconnected... Attempting to reconnect ***
     echo *** YOU HAVE BEEN DISCONNECTED!  Attempting to reconnect in 10 seconds.. ***
     math LOGOUT add 1
     pause 10
     gosub CONNECT_NOW
     pause 2
     goto RECONNECTED
RECONNECTED:
     pause .001
     Echo *** You have been Reconnected ***
     put #echo >Log Lime  *** Reconnected! - Restarting script. ***
     if ($health < 75) then goto ESCAPING
     if ($bleeding = 1) then goto ESCAPING
     #if ($health < 20) then goto exit
     pause 0.1
     pause 0.1
     goto ESCAPE
### CONNECT SUB  
RECONNECT:
     delay 0.0001
     gosub CONNECT_NOW
     goto ESCAPE
CONNECT:
     delay 0.0001
     counter set 0
     pause 300
     goto CONNECT_RETRY
CONNECT_NOW:
     delay 0.0001
     counter set 0
CONNECT_RETRY:
     delay 0.0001
     counter add 1
     if (%c > 10) then goto CONNECT_WAIT
     pause 0.1
     put #echo >Log Yellow $datetime Reconnect Attempt %c
CONNECTING:
     pause 0.1
     put #connect
     pause 0.1
     pause 10
     if (!$connected) then goto CONNECT_RETRY
CONNECTED:
     pause 0.1
     action (reconnect) on 
     put #echo >Log Green $datetime Reconnected
     return
CONNECT_WAIT:
     pause 0.1
     put #echo >Log Yellow Reconnect pausing..
     pause 20
     goto CONNECT
#### LOGOUT TIMER TO AVOID AFK CHECK
AFK.TIME:
     gosub clear
     timer clear
     action (reconnect) off
     put #script abort all except %scriptname
     put #echo >Log DeepPink *** ONLINE FOR OVER 9-10 HOURS!
     put #echo >Log DeepPink *** GOING OFFLINE FOR ~31 MINS TO RESET LOGIN
     if $zoneid = 69 then gosub automove shard
     if $zoneid = 66 then gosub automove shard
     if $zoneid = 68 then gosub automove shard
     if $zoneid = 67 then gosub automove east
     if $zoneid = 66 then gosub automove 637
     pause 
LOGOUT.TIMER:
     put #parse LOGGING OUT TIMER
     put #disconnect
WAITING.LOGOUT.TIMER:
     pause 2460
AFK.RECONNECTING:
     gosub CONNECT_NOW
     echo *** RECONNECTING AFTER 31 MINUTE LOGOUT!
     pause 5
     pause
     timer clear
     timer start
     var reset 1
     goto ABSOLUTE.TOP

### EMERGENCY EXIT LOGOUT SUBS
EXIT_TEMP:
     gosub clear
     put #script abort all except %scriptname
     action (reconnect) off
     gosub QUIT
     pause 0.1
     echo
     echo ***** PANIC EXIT INITIATED *****
     echo
     put #echo >Log Fuchsia ***** Panic Exit! Reconnecting in 5 minutes.. *****
     put #echo >$Log Fuchsia $datetime ***** Panic Exit! *****
     pause 300
     gosub CONNECT
     if ($stunned) then waiteval (!$stunned)
     action (reconnect) on
     action (escape) on
     goto ESCAPE

GENIE_FUCKUP:
GENIE.ERROR:
     action clear
     gosub clear
     put #echo >Log Red ***** GENIE FUCKED UP!!! RESTART!
     put #echo >$Log Fuchsia $datetime ***** GENIE FUCKUP! *****
     echo *** GENIE FUCKED UP!!! LOGGING OUT
     echo *** RESTART THE CLIENT
     pause .001
     gosub QUIT
     exit
EXIT:     
EXIT_FULL:
     action clear
     gosub clear
     pause
     put #script abort all except %scriptname
     echo
     echo ***** SOMETHING BAD HAPPENED! *****
     echo ***** FULL EXIT INITIATED *****
     echo
     put #echo >Log Red *** DEAD OR ALMOST DEAD! LOGGING OUT!!
     gosub QUIT
     pause 0.1
     put #echo >$Log Crimson $datetime Full Exit
     put #script abort
     exit
QUIT:
     delay 0.0001
     matchre QUIT ^\.\.\.wait|^Sorry\,
     matchre RETURN ^\[\d+\:\d+\] Connection closed\.
     matchre RETURN ^Disconnected from\:
     put quit
     matchwait