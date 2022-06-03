#debuglevel 5
############################################
# SHROOM'S UBER AUTOSTEAL FROM PLAYERS BOT!!
#
# Usage: .rob - Will go in infinite loops (clears users from temp blacklist after 1 hour)
#  .rob quick - ~20 min run. Will stay in Catrox shorter time, go on a stealing loop and then quit after banking. 
#
# THIEF ONLY. HIGH THIEVERY (600+) RECOMMENDED.
# MARKS AND ROBS OTHER PLAYERS 
# FOR USE IN CROSSINGS ONLY ATM. 
# STARTS IN CATROX. STEALS FOR A WHILE 
# THEN RUNS AROUND GOING TO HOT SPOTS ALL AROUND CROSSING
# STAYS HIDDEN AND KEEPS UP KHRI
# AUTO-DEVELOPS A GLOBAL WHITELIST AND BLACKLIST OF EASY PLAYERS OR PLAYERS TO SKIP
# RUNS AND HIDES IF YOU GET CAUGHT, WAITS A WHILE 
# AUTO DEPOSITS COIN IN THE BANK AFTER YOU STEAL A CERTAIN NUMBER OF TIMES
# KEEPS TRACK OF PROFIT PER SESSION
# KEEPS TRACK OF PROFIT OVER ALL TIME SINCE FIRST RUNNING THE SCRIPT
#
# STEALS A MAXIMUM OF 5 TIMES PER PLAYER, THEN ADDS THEM TO A TEMPORARY BLACKLIST 
# WILL NOT STEAL FROM THEM AGAIN UNTIL YOU RESTART THE SCRIPT
# TEMPORARY BLACKLIST ONLY STAYS AS LONG AS THE SCRIPT IS RUNNING
# NEXT TIME YOU RESTART THE SCRIPT THE TEMP BLACKLIST WILL BE CLEAR
#
# PLAYERS THAT MARK AS EASY, WILL BE ADDED TO YOUR PERMANENT WHITELIST 
# IF SOMEONE IS IN YOUR WHITELIST THEN THE SCRIPT WILL AUTO-STEAL FROM THEM WHEN THEY WALK IN THE ROOM AND SKIP MARK
#
# PLAYERS THAT MARK AS WAY TOO HARD, WILL BE ADDED TO YOUR PERMANENT BLACKLIST
# SCRIPT WILL NEVER STEAL FROM ANY PLAYER ON YOUR PERMANENT BLACKLIST
# YOU CAN ALSO MANUALLY ADD PEOPLE TO YOUR BLACKLIST USING THE VARIABLE BELOW 
############################################
############################################
## User Variables
## OFF AND ON MUST BE IN CAPS
var stealGems OFF 
var roaming ON
var gemContainer backpack
var khri1 skulk silence plunder focus hasten

# PERMANENT BLACKLIST - NEVER STEAL FROM ANY THESE PLAYERS
var no.steal.list Azothy|Psilocybe|Plix|Rilyth|Riverlynn|Vymos|Reithir|Marmic|Nefarious|Skaen|Aaoskar|Jackro|Alonso|Gybrush|Malign|Gorteous|Rmel|Binu|Brisknite|Caidie|Sendithu|Blackavar|Rezzian|Zephyria|Redeth|Yanbelev|Gept|Defol|Liurilias|Nienn|Theale|Boriz|Meganlique|Rozze|Buuwl|Fizox|Aleyden|Pazohn|Sabua|Nasrid|Ogramaak|Rhystal|Gashler|Shinikaze|Rayyoln|Toreakas|Aftermath|Hanryu|Jondong|Drachefeuer|Aumaru|Rzin|Pezo|Buluc|Kingdok|Giulietta|Fuss

## Safe Rooms
## Where script runs to when you get caught
var riverhavensafe 327
var crossingsafe 661
var boarsafe 35
var shardsafe 153

## DONT TOUCH!!!
## Default Variables
var stolen.gems 0
var stolen.coin 0
var stolen.profit 0
var stolen 0
var robbed 0
var attempts 0
var fail 0
var empty 0
var noobs 0
var success 0 
var caught 0
var busted 0
var triggered 0
var lost 0
var beggar 0
var minstrel 0 
var veteran 0
var coin.up 0
var target null
var sessionSteal null
var stealType coin
var STOLEN.TOTAL 0
var runTime 0
var loop 0
var scanloop 0
var timeloop 0
var plat 0
var plats 0
var platz 0
var gold 0
var golds 0
var goldz 0
var silver 0 
var silvers 0
var silverz 0
var bronze 0 
var bronzes 0
var bronez 0
var copper 0
var coppers 0
var copperz 0
var khri 0
var travel 0
var spotted 0
var quickrun 0

var AnduwenList null
var StarwatchList null
var AsketiList null
var BerengariaList null
var HodiernaList null
var PerielList null
var DergatiList null
var FirulfList null
var TamsineList null
var MeraudList null
var PhelimList null
var RevelfaeList null
var currentList null
var currentBlack null
var timeList null

if ("%stealGems") = OFF then var stealType coin
if ("%stealGems") = ON then var stealType 

## INITIAL GLOBAL BLACKLIST/WHITELIST SETUP
## Checks if the lists already exist, if not - adds it
    if !def(stealingBlacklist) then put #var stealingBlacklist |
## Add personal blacklist to global blacklist
     if !matchre("$stealingBlacklist","(%no.steal.list)") then
          {
          var tempstealingBlacklist $stealingBlacklist
          put #var stealingBlacklist |
          put #var stealingBlacklist %no.steal.list|%tempstealingBlacklist
          } 
     var tempstealingBlacklist $stealingBlacklist
     eval tempstealingBlacklist replace("%tempstealingBlacklist", "||", "|")
     eval tempstealingBlacklist replace("%tempstealingBlacklist", "null", "")
     put #var stealingBlacklist %tempstealingBlacklist
## Add blacklist to sessionSteal     
     var sessionSteal %sessionSteal|$stealingBlacklist
     eval sessionSteal replace("%sessionSteal", "null", "")
     # put #var stealingBlacklist {#eval {stealingBlacklist replace("%stealingBlacklist", "||", "|")}}
## Create / Update whitelist 
     if !def(stealingWhitelist) then put #var stealingWhitelist |
     var tempstealingWhitelist $stealingWhitelist
     eval tempstealingWhitelist replace("%tempstealingWhitelist", "||", "|")
     eval tempstealingWhitelist replace("%tempstealingWhitelist", "null", "")
     put #var stealingWhitelist %tempstealingWhitelist
if ($guild != "Thief") then goto FUCKOFF
#action (trigger) goto ROB.INIT when grizzled old war (\w+) confidently strides into the room|An old blind (\w+) hobbles into the area
action var caught 1 when catches you trying to go
action var grabbed 5 when ^You think this is risky|^You think this is very risky|^You think you'd need a miracle
action math loop add 30 when (\w+) searches around for a moment
action math loop add 900 when spotted you\!
action math loop add 300 when (\w+) glances over at you as you reach
action math spotted add 1; put #echo >Autosteal Orange **** Bystander $1 noticed you stealing! when (\w+) glances over at you as you reach
action instant goto BANK.RUN when BANKRUN
action instant var coinGrab $1 when ^Moving carefully\, you slip your hand into .* pockets and carefully grab (.*)\. 
action (trigger) goto SCAN when (\w+).(came through the .+ Gate|s group came through the .+ Gate|just arrived|s group just arrived|s group wandered down a path|wandered down a path|s group came through a village gate|came through a village gate|swims into view coming from|climbed up a willow tree)
action (trigger) off
timer clear
timer start

if_1 then var command %1
if matchre("quick", tolower("%command")) then 
     {
          var quickrun 1
     }
if matchre("bank", tolower("%command")) then 
     {
          goto BANK.RUN
     }
#if_1 then goto %1

ROB.TOP:
if !def(Stealing.Profit) then put #var Stealing.Profit 0
echo *********************************************************
echo *** SHROOM'S UBER ROB PLAYERS SCRIPT!!
echo *** STEALS FROM OTHER PLAYERS! THIEF ONLY!
echo *** BUILDS A GLOBAL BLACKLIST OF PLAYERS THAT ARE TOO HARD
echo *** BUILDS A GLOBAL WHITELIST OF EASY PLAYERS TO ROB :)
echo *** STAYS HIDDEN/INVIS AND MOVES AROUND CROSSNG
echo *** Use .rob quick to do a "Quick" run - will do 1 loop, bank and quit
echo *********************************************************
put #echo >Log White **** Initialized AUTO STEALBOT Script 
put #echo >Autosteal White ************************************************************
put #echo >Autosteal White ****    INITIALIZED AUTO STEALBOT SCRIPT!    ****
put #echo >Autosteal White ****    ROBBING THE FUCK OUT OF EVERYONE!    ****
if ("%roaming" = "OFF") then put #echo >Autosteal White **** ROAMING OFF - STAYING IN ONE SPOT! ****
if ("%quickrun" = "1") then put #echo >Autosteal White **** QUICK RUN ON! DOING QUICK ~20 MIN RUN   ****
put #echo >Autosteal White ************************************************************
gosub TIME.CHECK
if ("$silence" = "OFF") then gosub khri.up silence
put #window hide Autosteal
put #window show Autosteal
START.ROB:
     #if ("$zoneid" = "1") && ("$roomid" != "228") then gosub AUTOMOVE catrox
ROB.MAIN:
     delay 0.001
     action (trigger) off
     math scanloop add 1
     math timeloop add 1
     math loop add 1
     gosub stowing
     if %scanloop > 21 then var scanloop 0
     #if %t > 4000 then gosub RESET.BLACKLIST
     if ($skulk = "OFF") || ("$silence" = "OFF") || ("$plunder" = "OFF") || ("$focus" = "OFF") then gosub khri.up %khri1
     if !$hidden then gosub hide
     pause 0.001
     action (trigger) on
     if (%scanloop > 20) then 
          {
          send look
          echo *** SCANNING FOR MORE VICTIMS....
          echo *** Total Coin Grabs: %coin.up
          echo Loop: %loop
          }
     if (%timeloop > 100) then 
          {
          var timeloop 0
          gosub TIME.CHECK
          gosub TIME.SYNC
          echo
          echo **** Current Temporary Blacklist: %currentList
          echo
          }
ROB.INIT:
SCAN:
SCAN.ROOM:
     # debuglevel 10
     var players $roomplayers
     eval players replacere("%players", "Also here\:\s+", "")
     eval players replacere("%players", "Pirate", "")
     eval players replacere("%players", "King of the Road", "")
     #eval players replacere("%players", "\sand", ",")
     eval players replace("%players", " and", ",")
     eval players replace("%players", ".", ", ")
     # eval players replacere("%players", "\swho\s(?:is|has)\s[w'-]+\,", ",")
     eval players replacere("%players", "Lord of the Sands", "")
     eval players replacere("%players", "Elemental Magic Authority", "")
     eval players replacere("%players", "\swho is hidden", ",")
     eval players replacere("%players", "\swho is hiding", ",")
     eval players replacere("%players", "\swho is sitting", ",")
     eval players replacere("%players", "\swho is stunned", ",")
     eval players replacere("%players", "\swho is kneeling", ",")
     eval players replacere("%players", "\swho is invisible", ",")
     eval players replacere("%players", "\swho is lying down", ",")
     eval players replacere("%players", "\swho is in .+ cage", ",")
     eval players replacere("%players", "\swho has .+ visage", ",")
     eval players replacere("%players", "\swho is almost invisible", ",")
     eval players replacere("%players", "\swho is in a globe of blue fire", ",")
     eval players replacere("%players", "\swho is radiating a glowing aura", ",")
     eval players replacere("%players", "\swho is emanating a .+ holy aura", ",")
     eval players replacere("%players", "\swho is who is mounted on .+ horse", ",")
     eval players replacere("%players", "\swho is shrouded in ghostly flames", ",")
     eval players replacere("%players", "\swho is blurred by hazy afterimages", ",")
     eval players replacere("%players", "\swho is surrounded by a fiery mantle", ",")
     eval players replacere("%players", "\swho is covered with whitened ridges", ",")
     eval players replacere("%players", "\swho is shrouded by swirling grey fog", ",")
     eval players replacere("%players", "\swho is darkened by an unnatural shadow", ",")
     eval players replacere("%players", "\swho is behind a plexus of azure lines", ",")
     eval players replacere("%players", "\swho is bathed in pale golden sunlight", ",")
     eval players replacere("%players", "\swho is enveloped in a hellish inferno", ",")
     eval players replacere("%players", "\swho is shining with a dark golden glow", ",")
     eval players replacere("%players", "\swho is surrounded by a hellish inferno", ",")
     eval players replacere("%players", "\swho is behind a plexus of azure lines", ",")
	eval players replacere("%players", "\swho is surrounded by an electric storm", ",")
	eval players replacere("%players", "\swho is engulfed in a hazy cloud of dust", ",")
     eval players replacere("%players", "\swho is shining with a dark golden glow", ",")
     eval players replacere("%players", "\swho is surrounded by .+ shimmering shield", ",")
     eval players replacere("%players", "\swho is surrounded by .+ circling blades? of ice", ",")
     eval players replacere("%players", "\swho is sheathed in an aura of crackling electricity", ",")
     eval players replacere("%players", "\swho is surrounded by a band of twittering songbirds", ",")
     eval players replacere("%players", "\swho is followed by a rabid confusion of smirking weasels", ",")
     eval players replacere("%players", "\swho is being harassed by an intrigue of phantasmal kittens", ",")
     eval players replacere("%players", "\swho is surrounded by a ring of jagged stone spears at melee range", ",")
     eval players replacere("%players", "\swho is trailed by a discombobulated shadow jumping in and out of view", ",")
     eval players replacere("%players", "\swho is covered in layers of filth and surrounded by a cloud of putrescence", ",")
     eval players replacere("%players", "\swho has coalesced into a battle of light and shadow, each warring for dominance", ",")
     eval players replacere("%players", "\.", ",")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s[\w'-]+\s", ", ")
     eval players replacere("%players", "\,\s", "|")
     var players |%players|
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replacere("%players", "\|[\w'-]+\s", "|")
     eval players replace("%players", "," "")
     eval players replace("%players", "||" "|")
     if !("$roomplayers" = "") && (%scanloop > 20) then echo Players: %players
     eval total count("%players", "|")
     # debuglevel 0
MARK.LOOP:
     delay 0.0001
     eval player element("%players", 1)
     eval number count("%players", "|%player")
     var count 0
     gosub REMOVE.LOOP
     action var player $1 when ^@.* (\S+)$
     put #parse @%player
     var target %player
     if (!$hidden) then 
          {
               gosub HIDE
               pause 0.5
               pause 0.5
               pause 0.4
          }
     if !("$roomplayers" = "") then 
          {
          if %scanloop > 5 then
               if !matchre("%sessionSteal","(%target)") then echo ** Target: %target
          }
     counter set %count
     if !matchre("%sessionSteal","(%target)") then gosub MARK.TARGET
     if %c < 0 then counter set 0
     #if !contains("$roomobjs", "%NPCS") then gosub STEAL.NPC
     #if (%quickrun = 1) ("%roaming" = "ON") && 
     if ("$zoneid" = "1") && ($roomid != 228) && ("%roaming" = "ON") then
          {
               if (%loop > 20) then gosub TRAVEL.STEAL
          }
     if ("$zoneid" = "7") && ($roomid != 121) && ("%roaming" = "ON") then
          {
               if (%loop > 12) then gosub TRAVEL.STEAL
          }
     if ("$zoneid" = "4") && ($roomid != 471) && ("%roaming" = "ON") then
          {
               if (%loop > 10) then gosub TRAVEL.STEAL
          }
     if ("$zoneid" = "6") && ($roomid != 266) && ("%roaming" = "ON") then
          {
               if (%loop > 20) then gosub TRAVEL.STEAL
          }
     if ("$zoneid" = "4a") && ("%roaming" = "ON") then 
          {
          if (%loop > 10) then gosub TRAVEL.STEAL
          }
     if ("$zoneid" = "127") && ("%roaming" = "ON") then
          {
               if (%loop > 50) then gosub TRAVEL.STEAL
          }
     if ((%loop > 20) && !matchre("$roomid","(228|121|266|523|526)"))  && ("%roaming" = "ON") then gosub TRAVEL.STEAL
     if (%loop > 90) && (%quickrun = 1) && ($roomid != 228) && ("%roaming" = "ON") then gosub TRAVEL.STEAL
     if (%loop > 90) && ($roomid != 228) && ("%roaming" = "ON") then gosub TRAVEL.STEAL
     if (%loop > 700) && (%quickrun = 1) && ("$zoneid" = "1") && ($roomid = 228) && ("%roaming" = "ON") then gosub TRAVEL.STEAL
     if (%loop > 1000) && ("$zoneid" = "1") && ($roomid = 228) && ("%roaming" = "ON") then gosub TRAVEL.STEAL
     if %players != "|" then goto MARK.LOOP
     if (%coin.up > 45) && ("$zoneid" = "1") then goto BANK.RUN
     pause 0.1
     pause 0.01
     goto ROB.MAIN
REMOVE.LOOP:
     delay 0.0001
     eval number count("%players", "|%player|")
     eval players replace("%players", "|%player|", "|")
     eval players replace("%players", "invisible", "")
     eval players replace("%players", "almost", "")
     eval players replace("%players", "sitting", "")
     eval players replace("%players", "flames", "")
     eval players replace("%players", "is", "")
     eval players replace("%players", "||" "|")
     evalmath count %count + %number
     if !contains("%players", "|%player|") then return
     goto REMOVE.LOOP

MARK.TARGET:
     delay 0.0001
     action (trigger) off
     if %c = 0 then return
     counter subtract 1
     if ("%target" = "null") then return
     pause 0.1
     if matchre("$stealingBlacklist", "%target") then
          {
               echo **********************************************************************
               echo *** Skipping %target - User is on Perma Blacklist!
               echo **********************************************************************
               put #echo >Autosteal DeepPink *** Skipping %target - PERMA BLACKLISTED
               gosub TEMP.BLACKLIST
               goto ROB.RETURN
          }
     #if contains("%no.steal.list", "%target") then goto ROB.NO
     if matchre("%sessionSteal","(%target)") then goto ROB.RETURN
     if matchre("$stealingWhitelist","(%target)") then goto ROB.GO
     pause 0.01
     matchre MARK.TARGET ^\.\.\.wait|^Sorry\,
     matchre ROB.SKIP no wealth and no coins
     matchre MARK.LOST ^Mark what\?|^You cannot make marks|^I could not|^What were you
     matchre ROB.NO you'll be caught|good eyes|pretty good eyes|troublesome to be unnoticed|a little risky|futile|It should be possible
     matchre ROB.NO paladin|miracles|you'll be seen|You can already hear your guildmates|long shot|even odds|your clumsy actions
     matchre ROB.GO rob him blind|rob her blind|lucky to see a baby thief|side of a barn|would cower|should be blind to|has no wealth and no coins
     matchre ROB.GO has a low chance|should be an easy|trivial|candy from a baby|not prove too difficult|not prove difficult|should be possible|shouldn't catch you
     send mark %target
     matchwait 15
     put #echo >Autosteal Red *** MISSING MATCH LABEL IN MARK.TARGET
     goto ROB.NO
     
ROB.NO:
     ### ADDS CURRENT TARGET TO GLOBAL STEALING BLACKLIST DUE TO TOO HARD 
     if !matchre("$stealingBlacklist", "%target") then
          {
               echo *******************************************************
               echo *** Skipping %target - Way too Hard!!
               echo *** Adding to Permanent Blacklist
               echo *******************************************************
               put #echo >Autosteal DeepPink *** BLACKLISTED: %target
               #var tempstealingBlacklist $stealingBlacklist
               #put #var stealingBlacklist |
               put #var stealingBlacklist $stealingBlacklist|%target
               var tempstealingBlacklist $stealingBlacklist
               eval tempstealingBlacklist replace("%tempstealingBlacklist", "null", "")
               eval tempstealingBlacklist replace("%tempstealingBlacklist", "||", "|")
               put #var stealingBlacklist %tempstealingBlacklist
          }
     if !matchre("%sessionSteal", "%target") then
          {
               echo *********************************************************
               echo *** Skipping %target - Too hard or is a friend
               echo *** Adding to Temp Blacklist - %time blacklist 
               echo *********************************************************
               gosub TEMP.BLACKLIST
          }
     pause 0.001
     goto ROB.RETURN
     
ROB.SKIP:
goto ROB.RETURN1
     
STOW.1:
     gosub stowing
     goto ROBBING
ROB.GO:
     math attempts add 1
     math grabbed add 1
     #put #echo >Autosteal Yellow *** ROBBING: %target - Attempt: %grabbed
     if !matchre("$stealingWhitelist", "%target") then
          {
               put #echo >Autosteal Yellow *** WHITELISTED: %target!
               put #var stealingWhitelist $stealingWhitelist|%target
               var tempstealingWhitelist $stealingWhitelist
               eval tempstealingWhitelist replace("%tempstealingWhitelist", "||", "|")
               put #var stealingWhitelist %tempstealingWhitelist
          } 
ROBBING:
     delay 0.0001
     if (!$hidden) then 
          {
               gosub HIDE 
               pause 0.5
               pause 0.2
          }
     echo
     echo *** ROBBING: %target - Attempt: %grabbed
     echo
     pause 0.1
     pause 0.1
     pause 0.001
     pause 0.001
     matchre STOW.1 ^You need at least one hand free
     matchre ROBBING ^\.\.\.wait|^Sorry\,|you hesitate
     matchre STOLE.COIN carefully grab .* (coppers?|bronzes?|silvers?|golds?|platinums?)
     matchre STOLE.COIN You quickly pocket the (Kron|Dok|Lir)|old war veteran's purse|wandering minstrel's purse|blind beggar's purse|you reach your hand into
     matchre STOLE.GEM pockets and carefully grab .* (agate|star-stone|stones|alexandrite|citrine|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chalcedony|chrysoberyl|chrysoprase|citrine|coral|crystal|diamond|diopside|\begg\b|eggcase|emerald|garnet|\bgem\b|glossy malachite|goldstone|(chunk of|some|piece of).*granite|hematite|iolite|ivory)\.
     matchre STOLE.GEM pockets and carefully grab .* (jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|onyx|golem eye|opal|pearl|pebble|peridot|quartz|ruby|sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon|electrum|pewter|muracite|band|ring)
     matchre NOOBS too young to be a challenge
     matchre EMPTY.POCKET but find them empty|meager coins just aren't worth the effort|but cannot find any
     matchre NO.TARGET ^You haven't picked something to steal|^You couldn't get close enough to steal anything in time|your mark seems to be gone|your mark seems to be missing
     matchre FAILED turns away and the attempt fails|catches you trying|Stealing from corpses|engaged
     matchre WARRANTS ^You think about stealing for a moment, but decide you have too many outstanding fines
     matchre ROB.MAIN it is empty
     matchre BAD.ROOM ^You can't steal
     send steal %target %stealType
     matchwait 15
     put #echo >Autosteal Red *** Missing Match Label in ROB.GO:!
MARK.LOST:
NO.TARGET:
     delay 0.0001
     echo *** Lost your target!
     #put #echo >Autosteal White *** Lost your target!
     if %grabbed > 1 then 
          {
               if !matchre("%sessionSteal", "%target") then
                    {
                         put #echo >Autosteal DodgerBlue  *** Lost target - %grabbed grabs on %target
                         echo *** %grabbed grabs on %target -  Adding to temp blacklist
                         gosub TEMP.BLACKLIST                         
                    }
          }
     var lost 1
     counter subtract 1
     goto ROB.RETURN1
MARK.SECOND:
     delay 0.0001
     action (trigger) off
     pause 0.0001
     pause 0.0001
     matchre MARK.TARGET ^\.\.\.wait|^Sorry\,
     matchre ROB.RETURN no wealth and no coins
     matchre MARK.LOST ^Mark what\?|^You cannot make marks|^I could not|^What were you
     matchre ROB.RETURN you'll be caught|good eyes|pretty good eyes|troublesome to be unnoticed|a little risky|futile
     matchre ROB.RETURN paladin|miracles|you'll be seen|You can already hear your guildmates|long shot|even odds|your clumsy actions
     matchre ROB.GO rob him blind|rob her blind|lucky to see a baby thief|side of a barn|would cower|should be blind to|has no wealth and no coins
     matchre ROB.GO has a low chance|should be an easy|trivial|candy from a baby|not prove too difficult|not prove difficult|should be possible|shouldn't catch you
     send mark %target
     matchwait 15
     put #echo >Autosteal Red *** MISSING MATCH LABEL IN MARK.SECOND
     goto ROB.RETURN
BAD.ROOM:
     delay 0.0001
     echo ***NO STEAL ZONE!!! 
     goto TRAVEL.STEAL
FAILED:
     delay 0.0001
     echo *** FAILED ATTEMPT!! ABORTING
     math fail add 1
     if (%caught = 1) then goto BUSTED
     goto ROB.RETURN
EMPTY.POCKET:
     echo *** %target is BROKE!
     if %grabbed < 2 then put #echo >Autosteal White *** Robbed %target but they were BROKE
     if %grabbed >= 2 then put #echo >Autosteal White *** Robbed %target BLIND! Now they are broke... haha
     math success add 1
     math empty add 1
     if (%caught = 1) then goto BUSTED
     goto ROB.RETURN
NOOBS:
     echo *** NOOB
     math noobs add 1
     math attempts subtract 1
     goto ROB.RETURN
STOLE.COIN:
     math success add 1
     math stolen.coin add 1
     math robbed add 1
     math coin.up add 1
     var stolen 1
     echo *** STOLE %coinGrab from %target!
     echo
     eval coinGrab replacere("%coinGrab", "(a|a few|several|many|a great deal of|couple|and a|and several|and many|and a few|and a great deal of) (silvers?|bronze|coppers?)", "and some change")
     eval coinGrab replacere ("%coinGrab", ",", "")
     eval coinGrab replacere ("%coinGrab", "and some change and some change and some change", "and some change")
     eval coinGrab replacere ("%coinGrab", "and some change and some change", "and some change")
     eval coinGrab replacere ("%coinGrab", "\bplatinums\b", "platinums,")
     eval coinGrab replacere ("%coinGrab", "platinum\b", "platinum,")
     eval coinGrab replacere ("%coinGrab", "platinums, and some change", "platinums and some change")
     eval coinGrab replacere ("%coinGrab", "platinum, and some change", "platinums and some change")
     if ("%coinGrab" = "and some change") then var coinGrab some loose change
     put #echo >Autosteal Lime *** Robbed %target - Stole %coinGrab!
     goto CHECK.STATUS
STOLE.GEM:
     var gem.type $1
     echo *** Stole %gem.type !
     math success add 1
     math robbed add 1
     math stolen.gems add 1     
     if matchre("%gem.type","coins?|coppers?|silvers?|golds?|platinums?") then var gem.type null
     if (%gem.type" = "null") then goto ROB.GO
SLIP.GEM:
     delay 0.0001
     matchre SLIP.GEM ^\.\.\.wait|^Sorry\,
     matchre GEM.DONE ^You silently slip|^You slip|^You put|SLIP HELP
     if ("$righthand" != "Empty") then 
          {
               put #echo >Autosteal Lime *** Robbed %target - Stole a $righthand!
               send slip $righthandnoun in %gemContainer
          }
     if $lefthand != Empty then send slip left in %gemContainer
     matchwait 7
     put #echo >Autosteal Red *** MISSING MATCH IN SLIP.GEM
GEM.DONE:
     var gem.type null
     pause 0.001
     pause 0.001
     pause 0.1
CHECK.STATUS:
     if (%caught = 1) then goto BUSTED
     if (%grabbed > 4) then goto ROB.RETURN  
     #if (%grabbed > 3) then goto MARK.SECOND
     goto ROB.GO

ROB.RETURN:
     ### LOGIC THAT SETS LIST OF PLAYERS YOU'VE ALREADY STOLEN FROM THIS SESSION
     ### ADD TO TEMPORARY BLACKLIST
     if !matchre("%sessionSteal", "%target") then 
          {
               if (%grabbed <= 4) then put #echo >Autosteal DodgerBlue *** %grabbed grabs on %target -  Adding to Temp Blacklist
               if (%grabbed > 4) then put #echo >Autosteal DodgerBlue *** %grabbed grabs on %target -  Max Grabs - Adding to Temp Blacklist
               if (%grabbed <= 4) then echo *** %grabbed grabs on %target -  Adding to Temp Blacklist
               if (%grabbed > 4) then echo *** %grabbed grabs on %target - Max Grabs - Adding to Temp Blacklist
               gosub TEMP.BLACKLIST
          }
ROB.RETURN1:
     if (%lost = 1) then var target null
     if (%stolen = 1) then send wealth
     var lost 0
     var grabbed 0
     var caught 0
     var stolen 0
     pause 0.0001
     pause 0.0001
     pause 0.0001
     RETURN
BUSTED:
     var grabbed 0
     var caught 0
     math busted add 1
     echo *** YOU GOT BUSTED STEALING FROM %target !
     echo *** MOVING ROOMS!! NINJA STYLE!!
     if !matchre("%sessionSteal", "%target") then gosub TEMP.BLACKLIST
     goto RUNANDHIDE

     
#############################$##########
# Temporary Expiring Blacklist Logic
# Clears anyone from the temp blacklist > 2 time cycles old
#############################$$#########
TEMP.BLACKLIST:
     if ("%timeList" = "AnduwenList") then 
          {
          var AnduwenList %AnduwenList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "StarwatchList") then 
          {
          var StarwatchList %StarwatchList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "AsketiList") then 
          {
          var AsketiList %AsketiList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "BerengariaList") then 
          {
          var BerengariaList %BerengariaList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "HodiernaList") then 
          {
          var HodiernaList %HodiernaList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "PerielList") then 
          {
          var PerielList %PerielList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "DergatiList") then 
          {
          var DergatiList %DergatiList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "FirulfList") then 
          {
          var FirulfList %FirulfList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "TamsineList") then 
          var TamsineList %TamsineList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "MeraudList") then 
          {
          var MeraudList %MeraudList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "PhelimList") then 
          {
          var PhelimList %PhelimList|%target
          var currentList %currentList|%target
          }
     if ("%timeList" = "RevelfaeList") then 
          { 
          var RevelfaeList %RevelfaeList|%target
          var currentList %currentList|%target
          }
     #var currentList %currentList|%target
     eval currentList replace("%currentList", "null", "")
     eval currentList replace("%currentList", "|||" "|")
     eval currentList replace("%currentList", "||" "|")
     eval currentList replace("%currentList", "||" "|")
     if !contains("%sessionSteal", "%target") then
          }
               var tempSteal %sessionSteal
               var sessionSteal 
               var sessionSteal %tempSteal|%target
          }
     echo
     echo *** Added %target to %time Blacklist
     echo 
     #var sessionSteal %sessionSteal|%target
     #eval sessionSteal replace("%sessionSteal", "||" "|") 
     #var sessionSteal %sessionSteal|%target
     eval sessionSteal replace("%sessionSteal", "null", "")
     eval sessionSteal replace("%sessionSteal", "||" "|")
     }
     RETURN

TIME.CHECK:
     delay 0.001
     matchre Anduwen Anduwen
     matchre Starwatch Starwatch
     matchre Asketi Asketi's Hunt
     matchre Berengaria Berengaria's Touch
     matchre Hodierna Hodierna's Blessing
     matchre Periel Peri'el's Watch
     matchre Dergati Dergati's Bane
     matchre Firulf Firulf's Flame
     matchre Tamsine Tamsine's Toil
     matchre Meraud Meraud's Cloak
     matchre Phelim Phelim's Vigil
     matchre Revelfae Revelfae
     send time
     matchwait
Anduwen:
var time Anduwen
var timeList AnduwenList
var currentBlack %AnduwenList|%RevelfaeList|%PhelimList
echo Current Blacklist: %time
return
Starwatch:
var time Starwatch
var timeList StarwatchList
var currentBlack %StarwatchList|%AnduwenList|%RevelfaeList
echo Current Blacklist: %time
return
Asketi:
var time Asketi
var timeList AsketiList
var currentBlack %AsketiList|%StarwatchList|%AnduwenList
echo Current Blacklist: %time
return
Berengaria:
var time Berengaria
var timeList BerengariaList
var currentBlack %BerengariaList|%AsketiList|%StarwatchList
echo Current Blacklist: %time
return
Hodierna:
var time Hodierna
var timeList HodiernaList
var currentBlack %HodiernaList|%BerengariaList|%AsketiList
echo Current Blacklist: %time
return
Periel:
var time Periel
var timeList PerielList
var currentBlack %PerielList|%HodiernaList|%BerengariaList
echo Current Blacklist: %time
return
Dergati:
var time Dergati
var timeList DergatiList
var currentBlack %DergatiList|%PerielList|%HodiernaList
echo Current Blacklist: %time
return
Firulf:
var time Firulf
var timeList FirulfList
var currentBlack %FirulfList|%DergatiList|%PerielList
echo Current Blacklist: %time
return
Tamsine:
var time Tamsine
var timeList TamsineList
var currentBlack %TamsineList|%FirulfList|%DergatiList
echo Current Blacklist: %time
return
Meraud:
var time Meraud
var timeList MeraudList
var currentBlack %MeraudList|%TamsineList|%FirulfList
echo Current Blacklist: %time
return
Phelim:
var time Phelim
var timeList PhelimList
var currentBlack %PhelimList|%MeraudList|%TamsineList
echo Current Blacklist: %time
return
Revelfae:
var time Revelfae
var timeList RevelfaeList
var currentBlack %RevelfaeList|%PhelimList|%MeraudList
echo Current Blacklist: %time
return

TIME.SYNC:
echo **** Clearing out Temporary Blacklist over 1 hour old..
if ("%time" = "Anduwen") then 
     {
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     }
if ("%time" = "Starwatch") then 
     {
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     }
if ("%time" = "Asketi") then 
     {
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     }
if ("%time" = "Berengaria") then 
     {
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     }
if ("%time" = "Hodierna") then 
     {
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     }
if ("%time" = "Periel") then 
     {
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     var DergatiList null
     }
if ("%time" = "Dergati") then 
     {
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     var FirulfList null
     }
if ("%time" = "Firulf") then 
     {
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     var TamsineList null
     }
if ("%time" = "Tamsine") then 
     {
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     var MeraudList null
     }
if ("%time" = "Meraud") then 
     {
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     var PhelimList null
     }
if ("%time" = "Phelim") then 
     {
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     var RevelfaeList null
     }
if ("%time" = "Revelfae") then 
     {
     var TamsineList null
     var FirulfList null
     var DergatiList null
     var PerielList null
     var HodiernaList null
     var BerengariaList null
     var AsketiList null
     var StarwatchList null
     var AnduwenList null
     }
var currentList %AnduwenList|%StarwatchList|%AsketiList|%BerengariaList|%HodiernaList|%PerielList|%DergatiList|%FirulfList|%TamsineList|%MeraudList|%PhelimList|%RevelfaeList
eval currentList replace("%currentList", "null", "")
eval currentList replace("%currentList", "|||||" "|")
eval currentList replace("%currentList", "||||" "|")
eval currentList replace("%currentList", "|||" "|")
eval currentList replace("%currentList", "||" "|")
var sessionSteal %currentList
RETURN
     
###################################
# TRAVEL LOGIC
###################################
TRAVEL.STEAL:
     delay 0.001
     action (trigger) off
     var loop 0
     if ("%roaming" != "ON") then RETURN
     #put #echo >Autosteal HotPink *** Roaming to new location..
     echo *** Roaming to a new location
     if ("$silence" = "OFF") then gosub khri.up silence
     if !$invisible then gosub khri.up silence
     #if matchre("$roomexits" , "out") then
     #     {
     #     send out
     #     pause 0.5
     #     pause 0.3
     #     }
     if $hidden then 
          {
               send unhide
               pause 0.5
               pause 0.2
               pause 0.1
          }
     pause 0.1
     #if ($roomid = 0) then gosub MOVE.RANDOM
### CROSSING TRAVEL LOGIC
CROSS:
     if ("$zoneid" = "1") && (%triggered = 0) && ("$roomid" != "228") then 
          {
          gosub automove catrox
          var triggered 1
          goto TRAVEL.RETURN
          }
     if ("$zoneid" = "1") && ("$roomid" = "228") then 
          {
          gosub automove 50
          if ("$roomplayers" = "") then goto CROSS2 
          goto TRAVEL.RETURN
          }
CROSS2:          
     if ("$zoneid" = "1") && ("$roomid" = "50") then 
          {
          gosub automove 42
          if ("$roomplayers" = "") then goto CROSS3
          goto TRAVEL.RETURN
          }
CROSS3:
     if ("$zoneid" = "1") && ("$roomid" = "42") then 
          {
          gosub automove 178
          if ("$roomplayers" = "") then goto CROSS4
          goto TRAVEL.RETURN
          }
CROSS4:
     if ("$zoneid" = "1") && ("$roomid" = "178") then 
          {
          gosub automove 6
          if ("$roomplayers" = "") then goto CROSS5
          goto TRAVEL.RETURN
          }
CROSS5:
     if ("$zoneid" = "1") && ("$roomid" = "6") then 
          {
          gosub automove 1
          if ("$roomplayers" = "") then goto CROSS6
          goto TRAVEL.RETURN
          }
CROSS6:
     if ("$zoneid" = "1") && ("$roomid" = "1") then 
          {
          gosub automove 35
          if ("$roomplayers" = "") then goto CROSS7
          goto TRAVEL.RETURN
          }
CROSS7:
     if ("$zoneid" = "1") && ("$roomid" = "35") then 
          {
          gosub automove 273
          if ("$roomplayers" = "") then goto CROSS8
          goto TRAVEL.RETURN
          }
CROSS8:
     if ("$zoneid" = "1") && ("$roomid" = "273") then 
          {
          gosub automove 169
          if ("$roomplayers" = "") then goto CROSS9
          goto TRAVEL.RETURN
          }
CROSS9:
     if ("$zoneid" = "1") && ("$roomid" = "169") then 
          {
          gosub automove 236
          if ("$roomplayers" = "") then goto CROSS10
          goto TRAVEL.RETURN
          }
CROSS10:
     if ("$zoneid" = "1") && ("$roomid" = "236") then 
          {
          gosub automove 266
          if ("$roomplayers" = "") then goto CROSS11
          goto TRAVEL.RETURN
          }
CROSS11:
     if ("$zoneid" = "1") && ("$roomid" = "266") then 
          {
          gosub automove 613
          if ("$roomplayers" = "") then goto CROSS12
          goto TRAVEL.RETURN
          }
CROSS12:
     if ("$zoneid" = "1") && ("$roomid" = "613") then 
          {
          gosub automove 725
          if ("$roomplayers" = "") then goto TUNNELS
          goto TRAVEL.RETURN
          }
TUNNELS:
     if ("$zoneid" = "1") then 
          {
               
               gosub automove temple
               pause 0.8
               gosub automove tunnel
               pause 0.8
               gosub automove 10
               var travel 1
               if ("$roomplayers" = "") then goto TUNNEL2
               goto TRAVEL.RETURN
          }
TUNNEL2:
if ("$zoneid" = "2d") && ("$roomid" = "10") then 
          {
               gosub automove 2
               if ("$roomplayers" = "") then goto TUNNEL3
               goto TRAVEL.RETURN
          }
TUNNEL3:
if ("$zoneid" = "2d") && ("$roomid" = "2") then 
          {
               gosub automove 3
               if ("$roomplayers" = "") then goto TUNNEL4
               goto TRAVEL.RETURN
          }
TUNNEL4:
if ("$zoneid" = "2d") && ("$roomid" = "3") then 
          {
               gosub automove 5
               if ("$roomplayers" = "") then goto TUNNEL5
               goto TRAVEL.RETURN
          }
TUNNEL5:
if ("$zoneid" = "2d") && ("$roomid" = "5") then 
          {
               gosub automove 6
               if ("$roomplayers" = "") then goto TUNNEL6
               goto TRAVEL.RETURN
          }
TUNNEL6:
if ("$zoneid" = "2d") && ("$roomid" = "6") then 
          {
               gosub automove 7
               if ("$roomplayers" = "") then goto TUNNEL7
               goto TRAVEL.RETURN
          }
TUNNEL7:
if ("$zoneid" = "2d") && ("$roomid" = "7") then 
          {
               gosub automove 8
               if ("$roomplayers" = "") then goto TUNNEL8
               goto TRAVEL.RETURN
          }
TUNNEL8:
if ("$zoneid" = "2d") && ("$roomid" = "8") then 
          {      
               gosub automove 9
               if ("$roomplayers" = "") then goto TUNNEL9
               goto TRAVEL.RETURN
          }
TUNNEL9:
if ("$zoneid" = "2d") && ("$roomid" = "9") then 
          {
               gosub automove 10
               gosub automove 54
               if ("$roomplayers" = "") then goto TUNNEL10
               goto TRAVEL.RETURN
          }
TUNNEL10:
if ("$zoneid" = "2d") && ("$roomid" = "54") then 
          {
               gosub automove 53
               if ("$roomplayers" = "") then goto TUNNEL11
               goto TRAVEL.RETURN
          }
TUNNEL11:
if ("$zoneid" = "2d") && ("$roomid" = "53") then 
          {
               gosub automove 52
               if ("$roomplayers" = "") then goto TUNNEL12
               goto TRAVEL.RETURN
          }
TUNNEL12:
if ("$zoneid" = "2d") && ("$roomid" = "52") then 
          {
               gosub automove 51
               if ("$roomplayers" = "") then goto TUNNEL13
               goto TRAVEL.RETURN
          }
TUNNEL13:
if ("$zoneid" = "2d") && ("$roomid" = "51") then 
          {
               gosub automove 50
               if ("$roomplayers" = "") then goto TUNNEL14
               goto TRAVEL.RETURN
          }
TUNNEL14:
if ("$zoneid" = "2d") && ("$roomid" = "50") then 
          {
               gosub automove 46
               if ("$roomplayers" = "") then goto TUNNEL15
               goto TRAVEL.RETURN
          }
TUNNEL15:
if ("$zoneid" = "2d") && ("$roomid" = "46") then 
          {
               gosub automove 48
               if ("$roomplayers" = "") then goto TUNNEL16
               goto TRAVEL.RETURN
          }
TUNNEL16:
if ("$zoneid" = "2d") && ("$roomid" = "48") then 
          {
               gosub automove 49
               if ("$roomplayers" = "") then goto TUNNEL17
               goto TRAVEL.RETURN
          }
TUNNEL17:
	if ("$zoneid" = "2d") && ("$roomid" = "49") then 
			  {
				   gosub automove 12
				   if ("$roomplayers" = "") then goto TUNNEL18
				   goto TRAVEL.RETURN
			  }
TUNNEL18:
	if ("$zoneid" = "2d") && ("$roomid" = "12") then 
			  {
				   gosub automove 13
				   if ("$roomplayers" = "") then goto TUNNEL19
				   goto TRAVEL.RETURN
			  }
TUNNEL19:
	if ("$zoneid" = "2d") && ("$roomid" = "13") then 
			  {
				   gosub automove 15
				   if ("$roomplayers" = "") then goto TUNNEL20
				   goto TRAVEL.RETURN
			  }
TUNNEL20:
if ("$zoneid" = "2d") && ("$roomid" = "15") then 
          {
               gosub automove 17
               if ("$roomplayers" = "") then goto TUNNEL21
               goto TRAVEL.RETURN
          }
TUNNEL21:
if ("$zoneid" = "2d") && ("$roomid" = "17") then 
          {
               gosub automove 18
               if ("$roomplayers" = "") then goto TUNNEL22
               goto TRAVEL.RETURN
          }
TUNNEL22:
if ("$zoneid" = "2d") && ("$roomid" = "18") then 
          {
               gosub automove 19
               if ("$roomplayers" = "") then goto TUNNEL23
               goto TRAVEL.RETURN
          }
TUNNEL23:
if ("$zoneid" = "2d") && ("$roomid" = "19") then 
          {
               gosub automove 20
               if ("$roomplayers" = "") then goto TUNNEL24
               goto TRAVEL.RETURN
          }
TUNNEL24:
if ("$zoneid" = "2d") && ("$roomid" = "20") then 
          {
               gosub automove 21
               if ("$roomplayers" = "") then goto TUNNEL25
               goto TRAVEL.RETURN
          }
TUNNEL25:
if ("$zoneid" = "2d") && ("$roomid" = "21") then 
          {
               gosub automove 22
               if ("$roomplayers" = "") then goto TUNNEL26
               goto TRAVEL.RETURN
          }
TUNNEL26:
if ("$zoneid" = "2d") && ("$roomid" = "22") then 
          {
               gosub automove 23
               if ("$roomplayers" = "") then goto TUNNEL27
               goto TRAVEL.RETURN
          }
TUNNEL27:
if ("$zoneid" = "2d") && ("$roomid" = "23") then 
          {
               gosub automove 16
               if ("$roomplayers" = "") then goto TUNNEL28
               goto TRAVEL.RETURN
          }
TUNNEL28:
if ("$zoneid" = "2d") && ("$roomid" = "16") then 
          {
               gosub automove 25
               if ("$roomplayers" = "") then goto TUNNEL29
               goto TRAVEL.RETURN
          }
TUNNEL29:
if ("$zoneid" = "2d") && ("$roomid" = "25") then 
          {
               gosub automove 26
               if ("$roomplayers" = "") then goto TUNNEL30
               goto TRAVEL.RETURN
          }
TUNNEL30:
if ("$zoneid" = "2d") && ("$roomid" = "26") then 
          {
               gosub automove 38
               if ("$roomplayers" = "") then goto TUNNEL31
               goto TRAVEL.RETURN
          }
TUNNEL31:
if ("$zoneid" = "2d") && ("$roomid" = "38") then 
          {  
               gosub automove 37
               if ("$roomplayers" = "") then goto TUNNEL32
               goto TRAVEL.RETURN
          }
TUNNEL32:
if ("$zoneid" = "2d") && ("$roomid" = "37") then 
          {
               gosub automove 36
               if ("$roomplayers" = "") then goto TUNNEL33
               goto TRAVEL.RETURN
          }
TUNNEL33:
if ("$zoneid" = "2d") && ("$roomid" = "36") then 
          {
               gosub automove 35
               if ("$roomplayers" = "") then goto TUNNEL34
               goto TRAVEL.RETURN
          }
TUNNEL34:
if ("$zoneid" = "2d") && ("$roomid" = "35") then 
          {
               gosub automove 34
               if ("$roomplayers" = "") then goto TUNNEL35
               goto TRAVEL.RETURN
          }
TUNNEL35:
if ("$zoneid" = "2d") && ("$roomid" = "34") then 
          {
               gosub automove 33
               if ("$roomplayers" = "") then goto TUNNEL36
               goto TRAVEL.RETURN
          }
TUNNEL36:
if ("$zoneid" = "2d") && ("$roomid" = "33") then 
          {
               gosub automove 32
               if ("$roomplayers" = "") then goto TUNNEL37
               goto TRAVEL.RETURN
          }
TUNNEL37:
if ("$zoneid" = "2d") && ("$roomid" = "32") then 
          {
               gosub automove 31
               if ("$roomplayers" = "") then goto TUNNEL38
               goto TRAVEL.RETURN
          }
TUNNEL38:
if ("$zoneid" = "2d") && ("$roomid" = "31") then 
          {
               gosub automove 27
               if ("$roomplayers" = "") then goto TUNNEL39
               goto TRAVEL.RETURN
          }
TUNNEL39:
if ("$zoneid" = "2d") && ("$roomid" = "27") then 
          {
               gosub automove 28
               if ("$roomplayers" = "") then goto TUNNEL40
               goto TRAVEL.RETURN
          }
TUNNEL40:
if ("$zoneid" = "2d") && ("$roomid" = "28") then 
          {
               gosub automove 30
               if ("$roomplayers" = "") then goto TUNNEL41
               goto TRAVEL.RETURN
          }
TUNNEL41:
if ("$zoneid" = "2d") && ("$roomid" = "30") then 
          {
               gosub automove 40
               if ("$roomplayers" = "") then goto TUNNEL42
               goto TRAVEL.RETURN
          }
TUNNEL42:
if ("$zoneid" = "2d") && ("$roomid" = "40") then 
          {
               gosub automove 41
               if ("$roomplayers" = "") then goto TUNNEL43
               goto TRAVEL.RETURN
          }
TUNNEL43:
if ("$zoneid" = "2d") && ("$roomid" = "41") then 
          {
               gosub automove 42
               if ("$roomplayers" = "") then goto TUNNEL44
               goto TRAVEL.RETURN
          }
TUNNEL44:
if ("$zoneid" = "2d") && ("$roomid" = "42") then 
          {
               gosub automove 43
               if ("$roomplayers" = "") then goto TUNNEL45
               goto TRAVEL.RETURN
          }
TUNNEL45:
if ("$zoneid" = "2d") && ("$roomid" = "43") then 
          {
               gosub automove 44
               var travel 1
               if ("$roomplayers" = "") then goto TUNNEL46
               goto TRAVEL.RETURN
          }
TUNNEL46:
if ("$zoneid" = "2d") && ("$roomid" = "44") then 
          {
               gosub automove 45
               var travel 1
               if ("$roomplayers" = "") then goto TUNNEL47
               goto TRAVEL.RETURN
          }
TUNNEL47:
if ("$zoneid" = "2d") then 
          {
               gosub automove temple
               pause 0.5
               gosub automove cross
               pause 0.5
               gosub automove e gate
               pause 0.5
               gosub automove 2
               var travel 1
               if ("$roomplayers" = "") then goto EGATE
               goto TRAVEL.RETURN
          }
EGATE:
     if (("$zoneid" = "8") && ("$roomid" = "2")) then 
          {
          gosub automove 154
          if ("$roomplayers" = "") then goto EGATE2
          goto TRAVEL.RETURN
          }
EGATE2:
     if (("$zoneid" = "8") && ("$roomid" = "154")) then 
          {
          gosub automove 153
          if ("$roomplayers" = "") then goto EGATE3
          goto TRAVEL.RETURN
          }
EGATE3:
     if ("$zoneid" = "8") && ("$roomid" = "153")) then 
          {
          gosub automove 150
          if ("$roomplayers" = "") then goto EGATE4
          goto TRAVEL.RETURN
          }
EGATE4:
     if ("$zoneid" = "8") && ("$roomid" = "150")) then 
          {
          gosub automove 149
          if ("$roomplayers" = "") then goto EGATE5
          goto TRAVEL.RETURN
          }
EGATE5:
     if ("$zoneid" = "8") && ("$roomid" = "149")) then 
          {
          gosub automove 101
          if ("$roomplayers" = "") then goto EGATE6
          goto TRAVEL.RETURN
          }
EGATE6:
     if ("$zoneid" = "8") && ("$roomid" = "154")) then 
          {
          gosub automove 127
          if ("$roomplayers" = "") then goto ARTHE
          goto TRAVEL.RETURN
          }
ARTHE:
	if ("$zoneid" = "8") then
		{
		gosub automove NTR
		if ("$roomplayers" = "") then goto ARTHE1
		goto TRAVEL.RETURN
		}
ARTHE1:
     if (("$zoneid" = "7") && ("$roomid" = "268")) then 
          {
          gosub automove 558
          if ("$roomplayers" = "") then goto ARTHE2
          goto TRAVEL.RETURN
          }
ARTHE2:
     if (("$zoneid" = "7") && ("$roomid" = "558")) then 
          {
          gosub automove 577
          if ("$roomplayers" = "") then goto ARTHE2B
          goto TRAVEL.RETURN
          }
ARTHE2B:
     if (("$zoneid" = "7") && ("$roomid" = "577")) then 
          {
          gosub automove 539
          if ("$roomplayers" = "") then goto ARTHE2BB
          goto TRAVEL.RETURN
          }
ARTHE2BB:
     if (("$zoneid" = "7") && ("$roomid" = "539")) then 
          {
          gosub automove 540
          if ("$roomplayers" = "") then goto ARTHE2C
          goto TRAVEL.RETURN
          }
ARTHE2C:
     if (("$zoneid" = "7") && ("$roomid" = "540")) then 
          {
          gosub automove 537
          if ("$roomplayers" = "") then goto ARTHE3
          goto TRAVEL.RETURN
          }
ARTHE3:
     if (("$zoneid" = "7") && ("$roomid" = "537")) then 
          {
          gosub automove 620
          if ("$roomplayers" = "") then goto ARTHE4
          goto TRAVEL.RETURN
          }
ARTHE4:
     if (("$zoneid" = "7") && ("$roomid" = "620")) then 
          {
          gosub automove 600
          if ("$roomplayers" = "") then goto ARTHE5
          goto TRAVEL.RETURN
          }
ARTHE5:
     if (("$zoneid" = "7") && ("$roomid" = "600")) then 
          {
          gosub automove 598
          if ("$roomplayers" = "") then goto KAERNA
          goto TRAVEL.RETURN
          }
KAERNA:
     if (("$zoneid" = "7") && ("$roomid" = "598")) then 
          {
          gosub automove 493
          var travel 1
          if ("$roomplayers" = "") then goto KAERNA1A
          goto TRAVEL.RETURN
          }
KAERNA1A:
     if (("$zoneid" = "7") && ("$roomid" = "493")) then 
          {
          gosub automove 351
          if ("$roomplayers" = "") then goto KAERNA2
          goto TRAVEL.RETURN
          }
KAERNA2:
     if (("$zoneid" = "7") && ("$roomid" = "351")) then 
          {
          gosub automove 493
          var travel 1
          if ("$roomplayers" = "") then goto KAERNA2A
          goto TRAVEL.RETURN
          }
KAERNA2A:
     if (("$zoneid" = "7") && ("$roomid" = "493")) then 
          {
          gosub automove 488
          if ("$roomplayers" = "") then goto KAERNA3
          goto TRAVEL.RETURN
          }
KAERNA3:
     if (("$zoneid" = "7") && ("$roomid" = "488")) then 
          {
          gosub automove 505
          if ("$roomplayers" = "") then goto KAERNA4
          goto TRAVEL.RETURN
          }
KAERNA4:
     if (("$zoneid" = "7") && ("$roomid" = "505")) then 
          {
          gosub automove 484
          if ("$roomplayers" = "") then goto NTR
          goto TRAVEL.RETURN
          }
NTR:
     if (("$zoneid" = "7") && ("$roomid" = "484")) then 
          {
          gosub automove 121
          if ("$roomplayers" = "") then goto NTR2
          #if matchre("$roomplayers", "Fuss") then goto NTR2
          goto TRAVEL.RETURN
          }
NTR2:
     if (("$zoneid" = "7") && ("$roomid" = "121")) then 
          {
          gosub automove 216
          if ("$roomplayers" = "") then goto NTR3
          goto TRAVEL.RETURN
          }
NTR3:
     if (("$zoneid" = "7") && ($roomid = 216)) then 
          {
          gosub automove 207
          if ("$roomplayers" = "") then goto NTR4
          goto TRAVEL.RETURN
          }    
NTR4:
if (("$zoneid" = "7") && ($roomid = 207)) then 
          {
          gosub automove 175
          if ("$roomplayers" = "") then goto DIRGE
          goto TRAVEL.RETURN
          }
DIRGE:
if (("$zoneid" = "7") && ($roomid = 175)) then 
          {
          gosub automove dirge
          pause
          gosub automove 48
          if ("$roomplayers" = "") then goto DIRGE2
          goto TRAVEL.RETURN
          }
DIRGE2:
if (("$zoneid" = "13") && ($roomid = 48)) then 
          {
          gosub automove 46
          var travel 1
          if ("$roomplayers" = "") then goto DIRGE3
          goto TRAVEL.RETURN
          }
DIRGE3:
if (("$zoneid" = "13") && ($roomid = 46)) then 
          {
          gosub automove 41
          if ("$roomplayers" = "") then goto DIRGE4
          goto TRAVEL.RETURN
          }
DIRGE4:
if (("$zoneid" = "13") then 
          {
          if ($hidden) then send unhide
          pause 0.5
          gosub automove NTR
          pause
          gosub automove 375
          if ("$roomplayers" = "") then goto NGATE
          goto TRAVEL.RETURN
          }
NGATE:
     if ("$zoneid" = "7") then 
          {
          var travel 1
          gosub automove N gate
          pause 0.5
          gosub automove 96
          if ("$roomplayers" = "") then goto NGATE2
          goto TRAVEL.RETURN
          }
NGATE2:
     if (("$zoneid" = "6") && ($roomid = 96)) then 
          {
          gosub automove 106
          pause 0.1
          if ("$roomplayers" = "") then goto NGATE3
          goto TRAVEL.RETURN
          }
NGATE3:
     if (("$zoneid" = "6") && ($roomid = 106)) then 
          {
          gosub automove 266
          pause 0.1
          if ("$roomplayers" = "") then goto NGATE4
          goto TRAVEL.RETURN
          }
NGATE4:
     if (("$zoneid" = "6") && ($roomid = 266)) then 
          {
          gosub automove 267
          pause 0.1
          if ("$roomplayers" = "") then goto NGATE5
          goto TRAVEL.RETURN
          }
NGATE5:
     if (("$zoneid" = "6") && ($roomid = 267)) then 
          {
          gosub automove 222
          pause 0.1
          if ("$roomplayers" = "") then goto NGATE5B
          goto TRAVEL.RETURN
          }
NGATE5B:
     if (("$zoneid" = "6") && ($roomid = 222)) then 
          {
          gosub automove 228
          pause 0.1
          if ("$roomplayers" = "") then goto NGATE6
          goto TRAVEL.RETURN
          }
NGATE6:
     if (("$zoneid" = "6") && ($roomid = 228)) then 
          {
          gosub automove 112
          pause 0.1
          if ("$roomplayers" = "") then goto TO.WEST
          goto TRAVEL.RETURN
          }
     #if (("$zoneid" = "6") && ($roomid = 230)) then 
     #     {
     #     gosub automove 113
     #     pause 0.1
     #     goto TRAVEL.RETURN
     #     }
TO.WEST:
     if (("$zoneid" = "6") then 
          {
          gosub automove w gate
          pause 0.1
          var travel 1
          gosub automove 1
          if ("$roomplayers" = "") then goto WESTGATE
          goto TRAVEL.RETURN
          }
WESTGATE:
     if ("$zoneid" = "4") && ("$roomid" = "1") then 
          {
          var travel 1
          gosub automove 299
          if ("$roomplayers" = "") then goto WESTGATE2
          goto TRAVEL.RETURN
          }
WESTGATE2:
     if ("$zoneid" = "4") && ("$roomid" = "299") then 
          {
          gosub automove 11
          if ("$roomplayers" = "") then goto WESTGATE3
          goto TRAVEL.RETURN
          }
WESTGATE3:
     if ("$zoneid" = "4") && ("$roomid" = "11") then 
          {
          gosub automove 343
          if ("$roomplayers" = "") then goto WESTGATE4
          goto TRAVEL.RETURN
          }
WESTGATE4:
     if ("$zoneid" = "4") && ("$roomid" = "343") then 
          {
          gosub automove 341
          if ("$roomplayers" = "") then goto WESTGATE5
          goto TRAVEL.RETURN
          }
WESTGATE5:
     if ("$zoneid" = "4") && ("$roomid" = "341") then 
          {
          gosub automove 414
          if ("$roomplayers" = "") then goto TO.KNIFE
          goto TRAVEL.RETURN
          }
TO.KNIFE:
     if ("$zoneid" = "4") && ("$roomid" = "414") then 
          {
          gosub automove 419
          if ("$roomplayers" = "") then goto KNIFE
          goto TRAVEL.RETURN
          }
KNIFE:
     if ("$zoneid" = "4") && ("$roomid" = "419") then 
          {
          gosub automove 421
          if ("$roomplayers" = "") then goto KNIFE2
          goto TRAVEL.RETURN
          }
KNIFE2:
     if ("$zoneid" = "4") && ("$roomid" = "421") then 
          {
          gosub automove 434
          if ("$roomplayers" = "") then goto KNIFE3
          goto TRAVEL.RETURN
          }
KNIFE3:
     if ("$zoneid" = "4") && ("$roomid" = "434") then 
          {
          gosub automove 435
          if ("$roomplayers" = "") then goto KNIFE4
          goto TRAVEL.RETURN
          }
KNIFE4:     
     if ("$zoneid" = "4") && ("$roomid" = "435") then 
          {
          gosub automove 471
          if ("$roomplayers" = "") then goto KNIFE5
          goto TRAVEL.RETURN
          }
KNIFE5:     
     if ("$zoneid" = "4") && ("$roomid" = "471") then 
          {
          gosub automove 468
          if ("$roomplayers" = "") then goto KNIFE6
          goto TRAVEL.RETURN
          }
KNIFE6:     
     if ("$zoneid" = "4") && ("$roomid" = "468") then 
          {
          gosub automove 469
          if ("$roomplayers" = "") then goto KNIFE7
          goto TRAVEL.RETURN
          }
KNIFE7:
     if ("$zoneid" = "4") && ("$roomid" = "469") then 
          {
          gosub automove 462
          if ("$roomplayers" = "") then goto WOLF
          goto TRAVEL.RETURN
          }
WOLF:
     if ("$zoneid" = "4") && ($roomid = 462) then 
          {
          gosub automove 126
          if ("$roomplayers" = "") then goto WOLF2
          goto TRAVEL.RETURN
          }
WOLF2:
     if ("$zoneid" = "4") && ($roomid = 126) then 
          {
          gosub automove 137
          if ("$roomplayers" = "") then goto WOLF3
          goto TRAVEL.RETURN
          }
WOLF3:
     if ("$zoneid" = "4") && ($roomid = 137) then 
          {
          gosub automove 478
          if ("$roomplayers" = "") then goto WOLF4
          goto TRAVEL.RETURN
          }
WOLF4:
     if ("$zoneid" = "4") && ($roomid = 478) then 
          {
          gosub automove 131
          if ("$roomplayers" = "") then goto WOLF5
          goto TRAVEL.RETURN
          }
WOLF5:
     if ("$zoneid" = "4") && ($roomid = 131) then 
          {
          gosub automove 129
          if ("$roomplayers" = "") then goto TIGER
          goto TRAVEL.RETURN
          }
TIGER:
     if ("$zoneid" = "4") && ($roomid = 129) then 
          {
          gosub automove tiger
          pause 0.2
          gosub automove 17
          if ("$roomplayers" = "") then goto TIGER2
          goto TRAVEL.RETURN
          }
TIGER2:
     if ("$zoneid" = "4a") && ($roomid = 17) then 
          {
          gosub automove 21
          if ("$roomplayers" = "") then goto TIGER3
          goto TRAVEL.RETURN
          }
TIGER3:     
     if ("$zoneid" = "4a") && ($roomid = 21) then 
          {
          gosub automove 54
          if ("$roomplayers" = "") then goto TIGER4
          goto TRAVEL.RETURN
          }
TIGER4:     
     if ("$zoneid" = "4a") && ($roomid = 54) then 
          {
          gosub automove 37
          if ("$roomplayers" = "") then goto TIGER5
          goto TRAVEL.RETURN
          }
TIGER5:     
     if ("$zoneid" = "4a") && ($roomid = 37) then 
          {
          gosub automove 53
          if ("$roomplayers" = "") then goto TIGER6
          goto TRAVEL.RETURN
          }
TIGER6:
     if ("$zoneid" = "4a") && ($roomid = 53) then 
          {
          gosub automove 38
          if ("$roomplayers" = "") then goto TIGER7
          goto TRAVEL.RETURN
          }
TIGER7:
     if ("$zoneid" = "4a") && ($roomid = 38) then 
          {
          gosub automove 55
          if ("$roomplayers" = "") then goto TIGER8
          goto TRAVEL.RETURN
          }
TIGER8:     
     if ("$zoneid" = "4a") && ($roomid = 55) then 
          {
          gosub automove 52
          if ("$roomplayers" = "") then goto TIGER9
          goto TRAVEL.RETURN
          }
TIGER9:     
     if ("$zoneid" = "4a") && ($roomid = 52) then 
          {
          gosub automove 41
          if ("$roomplayers" = "") then goto TIGER10
          goto TRAVEL.RETURN
          }
TIGER10:     
     if ("$zoneid" = "4a") && ($roomid = 41) then 
          {
          gosub automove 51
          if ("$roomplayers" = "") then goto TIGER11
          goto TRAVEL.RETURN
          }
TIGER11:
     if ("$zoneid" = "4a") && ($roomid = 51) then 
          {
          gosub automove 50
          if ("$roomplayers" = "") then goto TIGER12
          goto TRAVEL.RETURN
          }
TIGER12:
     if ("$zoneid" = "4a") && ($roomid = 50) then 
          {
          gosub automove 44
          if ("$roomplayers" = "") then goto TIGER13
          goto TRAVEL.RETURN
          }
TIGER13:     
     if ("$zoneid" = "4a") && ($roomid = 44) then 
          {
          gosub automove 43
          if ("$roomplayers" = "") then goto TIGER14
          goto TRAVEL.RETURN
          }
TIGER14:     
     if ("$zoneid" = "4a") && ($roomid = 43) then 
          {
          gosub automove 49
          if ("$roomplayers" = "") then goto TIGER15
          goto TRAVEL.RETURN
          }
TIGER15:     
     if ("$zoneid" = "4a") && ($roomid = 49) then 
          {
          gosub automove 48
          if ("$roomplayers" = "") then goto TIGER16
          goto TRAVEL.RETURN
          }
TIGER16:
     if ("$zoneid" = "4a") && ($roomid = 48) then 
          {
          gosub automove 47
          if ("$roomplayers" = "") then goto TIGER17
          goto TRAVEL.RETURN
          }
TIGER17:
     if ("$zoneid" = "4a") && ($roomid = 47) then 
          {
          gosub automove 42
          if ("$roomplayers" = "") then goto TIGER18
          goto TRAVEL.RETURN
          }
TIGER18:
     if ("$zoneid" = "4a") && ($roomid = 42) then 
          {
          gosub automove 46
          if ("$roomplayers" = "") then goto TIGER19
          goto TRAVEL.RETURN
          }
TIGER19:     
     if ("$zoneid" = "4a") && ($roomid = 46) then 
          {
          gosub automove 45
          if ("$roomplayers" = "") then goto TIGER20
          goto TRAVEL.RETURN
          }
TIGER20:     
     if ("$zoneid" = "4a") && ($roomid = 45) then 
          {
          gosub automove 74
          if ("$roomplayers" = "") then goto TIGER21
          goto TRAVEL.RETURN
          }
TIGER21:     
     if ("$zoneid" = "4a") && ($roomid = 74) then 
          {
          gosub automove 40
          if ("$roomplayers" = "") then goto TIGER22
          goto TRAVEL.RETURN
          }
TIGER22:
     if ("$zoneid" = "4a") && ($roomid = 40) then 
          {
          gosub automove 39
          if ("$roomplayers" = "") then goto TIGER23
          goto TRAVEL.RETURN
          }
TIGER23:     
     if ("$zoneid" = "4a") && ($roomid = 39) then 
          {
          gosub automove 34
          if ("$roomplayers" = "") then goto TIGER24
          goto TRAVEL.RETURN
          }
TIGER24:
     if ("$zoneid" = "4a") && ($roomid = 34) then 
          {
          gosub automove 33
          if ("$roomplayers" = "") then goto TIGER25
          goto TRAVEL.RETURN
          }
TIGER25:
     if ("$zoneid" = "4a") && ($roomid = 33) then 
          {
          gosub automove 28
          if ("$roomplayers" = "") then goto TIGER26
          goto TRAVEL.RETURN
          }
TIGER26:
     if ("$zoneid" = "4a") && ($roomid = 28) then 
          {
          gosub automove 105
          if ("$roomplayers" = "") then goto TIGER27
          goto TRAVEL.RETURN
          }
TIGER27:     
     if ("$zoneid" = "4a") && ($roomid = 105) then 
          {
          gosub automove 106
          if ("$roomplayers" = "") then goto TIGER28
          goto TRAVEL.RETURN
          }
TIGER28:     
     if ("$zoneid" = "4a") && ($roomid = 106) then 
          {
          gosub automove 104
          if ("$roomplayers" = "") then goto TIGER29
          goto TRAVEL.RETURN
          }
TIGER29:     
     if ("$zoneid" = "4a") && ($roomid = 104) then 
          {
          gosub automove 103
          if ("$roomplayers" = "") then goto TIGER30
          goto TRAVEL.RETURN
          }
TIGER30:
     if ("$zoneid" = "4a") && ($roomid = 103) then 
          {
          gosub automove 30
          if ("$roomplayers" = "") then goto TIGER31
          goto TRAVEL.RETURN
          }          
TIGER31:     
     if ("$zoneid" = "4a") && ($roomid = 30) then 
          {
          gosub automove 29
          if ("$roomplayers" = "") then goto TIGER32
          goto TRAVEL.RETURN
          }
TIGER32:     
     if ("$zoneid" = "4a") && ($roomid = 29) then 
          {
          gosub automove 31
          if ("$roomplayers" = "") then goto TIGER33
          goto TRAVEL.RETURN
          }
TIGER33:
     if ("$zoneid" = "4a") && ($roomid = 31) then 
          {
          gosub automove 32
          if ("$roomplayers" = "") then goto TIGER34
          goto TRAVEL.RETURN
          }   
TIGER34:
     if ("$zoneid" = "4a") then 
          {
          gosub automove cross
          pause 0.5
          gosub automove cross
          pause 0.5
          var travel 1
          var triggered 0
          var loop 0
          var scanloop 0
          if (%quickrun = 1) then goto BANK.RUN
          if ("$silence" = "OFF") then gosub khri.up silence
          gosub automove catrox
          goto TRAVEL.RETURN
          }
CROSS.RESET:
     if ("$zoneid" = "4a") then gosub automove cross
     if (("$zoneid" = "4") then gosub automove cross
     if ("$zoneid" = "1") then 
          {
               if ("$silence" = "OFF") then gosub khri.up silence
               if (%quickrun = 1) then goto BANK.RUN
               gosub automove catrox
               var loop 0
               var triggered 0
               var scanloop 0
               goto TRAVEL.RETURN
          }
### SHARD TRAVEL LOGIC
SHARD.GO:
     if ("$zoneid" = "67") && ($roomid != 43) then 
          {
          if (%triggered = 1) then goto SHARD2
          gosub automove 43
          var triggered 1
          goto TRAVEL.RETURN
          }
SHARD2:
     if ("$zoneid" = "67") && ($roomid = 43) then 
          {
          if ($invisible) then send khri stop silence
          pause 0.5
          pause 0.4
          gosub automove 566
          gosub automove 23
          if ("$silence" = "OFF") then gosub khri.up silence
          gosub automove 636
          goto TRAVEL.RETURN
          }
SHARD3:
     if matchre("$zoneid","(66|67)") then
          {
          if ($invisible) then send khri stop silence
          pause 0.5
          pause 0.4
          gosub automove w gate
          if ("$silence" = "OFF") then gosub khri.up silence
          pause
          gosub automove 384
          goto TRAVEL.RETURN
          }
if ("$zoneid" = "69") && ($roomid = 384) then 
          {
          gosub automove 138
          goto TRAVEL.RETURN
          }
HORSE2:
     if ("$zoneid" = "69") && ($roomid = 138) then 
          {
          gosub automove 180
          goto TRAVEL.RETURN
          }
HORSE3:
     if ("$zoneid" = "69") && ($roomid = 180) then 
          {
          gosub automove 183
          goto TRAVEL.RETURN
          }
BOAR1:
     if ("$zoneid" = "69") then 
          {
          pause 0.1
          var travel 1
          send .travel boar
          waitforre ^YOU ARRIVED
          if ("$silence" = "OFF") then gosub khri.up silence
          pause 0.5
          pause 0.1
          gosub automove 51
          goto TRAVEL.RETURN
          }
BOAR2:
     if ("$zoneid" = "127") && ($roomid = 51) then 
          {
          if ("$silence" = "OFF") then gosub khri.up silence
          pause
          gosub automove 523
          goto TRAVEL.RETURN
          }
BOAR3:
     if ("$zoneid" = "127") && ($roomid = 523) then 
          {
          gosub automove 526
          goto TRAVEL.RETURN
          }
BOAR4:
     if ("$zoneid" = "127") then 
          {
          gosub automove gate
          pause 0.5
          pause 0.001
          if ($invisible) then send khri stop silence
          pause 0.5
          pause 0.4
          send .travel shard
          waitforre ^YOU ARRIVED
          var travel 1
          var triggered 0
          var loop 0
          var scanloop 0
          if (%quickrun = 1) then goto BANK.RUN
          if ("$silence" = "OFF") then gosub khri.up silence
          gosub automove 43
          goto TRAVEL.RETURN
          }
     #gosub MOVE.RANDOM
     RETURN
     
TRAVEL.RETURN:
     var loop 0
     var scanloop 0
     put #echo >Autosteal Aqua *** MOVING TO NEW LOCATION: Zone $zoneid  Room $roomid
     pause 0.001
     pause 0.1
     pause 0.001
     action (trigger) on
     RETURN

### RUN AND ROAM SECTION
RUNANDHIDE:
     delay 0.001
     var returnto $roomid
     put #echo >Autosteal Red *** Busted stealing from %target! Moving rooms!
     pause 0.1
     pause 0.1
     if ("$zoneid" = "4a") then gosub AUTOMOVE 4
     if ("$zoneid" = "4") then gosub AUTOMOVE 122
     if ("$zoneid" = "6") then gosub AUTOMOVE 11
     if ("$zoneid" = "7") then gosub AUTOMOVE 398
     if ("$zoneid" = "8") then gosub AUTOMOVE 8
     if ("$zoneid" = "66") then gosub AUTOMOVE 39
     if ("$zoneid" = "127") then gosub AUTOMOVE 64
     pause 0.1
     pause 0.1
     pause 0.1
     pause 0.1
     pause 0.1
     if ("$zoneid" = "1") then gosub AUTOMOVE %crossingsafe 
     if ("$zoneid" = "127") then gosub AUTOMOVE %boarsafe
     if ("$zoneid" = "30") then gosub AUTOMOVE %riverhavensafe
     if ("$zoneid" = "67") then gosub AUTOMOVE %shardsafe
     echo *** HIDING FOR A MINUTE.. WAITING FOR HEAT TO COOLDOWN
     if (!$hidden) then gosub HIDE 
     pause 10
     echo *** Current Blacklist: %sessionSteal
     pause 60
     send khri start silence
     pause 0.5
     pause 0.5
     pause 0.1
     gosub AUTOMOVE %returnto
     pause 0.5
     goto START.ROB
     
BANK.RUN:
     var coin.up 0
     action (trigger) off
     pause 0.1
     echo **********************
     echo * BANK RUN!
     echo * DEPOSITING STOLEN COIN!
     echo **********************
     if ($roomid = 228) then 
          {
          send sneak out
          pause 0.5
          pause 0.5
          pause 0.1
          }
     if $hidden then send unhide
     pause 0.5
     pause 0.4
     if $invisible then send khri stop silence
     pause 0.5
     pause 0.4
     if ("$zoneid" = "127") then 
          {
               gosub AUTOMOVE gate
               send .travel hib
               waitfor YOU HAVE ARRIVED
               gosub AUTOMOVE 1exch
          }
     if ("$zoneid" = "7") then gosub AUTOMOVE cross 
     if ("$zoneid" = "4") then gosub AUTOMOVE cross
     if ("$zoneid" = "116") then goto EXCH.DOK
     if ("$zoneid" = "67") then goto EXCH.DOK     
     if ("$zoneid" = "1") then goto EXCH.KRO
     if ("$zoneid" = "30") then goto EXCH.LIR
     if ("$zoneid" = "42") then goto EXCH.LIR
EXCH.DOK:
     if ("$zoneid" = "67") then gosub AUTOMOVE exchange
     if ("$zoneid" = "116") then gosub automove 1exch
     gosub DOKORAS
     goto TO.TELLER
EXCH.LIR:
     gosub automove exchange 
     gosub LIRUMS
     goto TO.TELLER
EXCH.KRO:
     gosub automove exchange 
     gosub KRONARS
     goto TO.TELLER
TO.TELLER:
     if ("$zoneid" = "116") then gosub automove 1tell
     else gosub automove teller
BANKING:
     gosub BANK
     echo *** DEPOSITED: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper
BANK.COMBINE:
     gosub COMBINE.BANK
     var STOLEN.TOTAL $Stolen.Profit
     math STOLEN.TOTAL add %Profit
     put #var Stolen.Profit %STOLEN.TOTAL
EQUALIZE.IT:
     gosub EQUALIZECOIN
     gosub TIME.CALC
     pause 0.1
     gosub TOTAL.CHECK
     echo **************************************************************
     echo *** UBER AUTOROB - STEALING REPORT | Runtime: %runTime mins
     echo *** Attempts : %attempts | Successful: %success
     echo *** Total Robs: %robbed | Empty: %empty
     echo *** Failed Attempts: %fail | Times Caught %busted
     echo *** Coin Grabs: %stolen.coin  | Gems: %stolen.gems
     echo *** Session Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     echo *** Lifetime profit: $Stolen.Profit - %Platz Plat, %Goldz Gold, %Silverz Silver, %Bronzez Bronze, %Copperz Copper
     echo ***************************************************************
     put #echo >Autosteal Aqua  ***************************************************************
     if (%quickrun = 1) then put #echo >Autosteal Aqua ***  AUTOROB REPORT - QUICKRUN ON | Runtime: %runTime mins
     if (%quickrun != 1) then put #echo >Autosteal Aqua *** AUTOROB REPORT | Runtime: %runTime min
     put #echo >Autosteal Aqua  *** Total Attempts : %attempts | Successful: %success | Failed: %fail
     put #echo >Autosteal Aqua  *** Empty Pockets: %empty | Times Busted %busted  |  Times Spotted: %spotted
     put #echo >Autosteal Aqua  *** Coin Grabs: %stolen.coin  | Gems: %stolen.gems | Total Thefts: %robbed 
     put #echo >Autosteal Aqua  *** Session Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     put #echo >Autosteal Aqua  *** Lifetime profit: %Platz Plat, %Goldz Gold, %Silverz Silver, %Bronzez Bronze, %Copperz Copper
     put #echo >Autosteal Aqua  ***************************************************************
     put #echo >Log Aqua **********************************************************************
     if (%quickrun = 1) then put #echo >Log Aqua *** AUTOROB REPORT - Quickrun ON | Runtime: %runTime mins
     if (%quickrun != 1) then put #echo >Log Aqua *** AUTOROB REPORT | Runtime: %runTime min
     put #echo >Log Aqua *** Total Attempts : %attempts | Successful: %success | Failed: %fail
     put #echo >Log Aqua *** Empty Pockets: %empty | Times Busted %busted  |  Times Spotted: %spotted
     put #echo >Log Aqua *** Coin Grabs: %stolen.coin  | Gems: %stolen.gems | Total Thefts: %robbed 
     put #echo >Log Aqua *** Session Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     put #echo >Log Aqua *** Lifetime profit: %Platz Plat, %Goldz Gold, %Silverz Silver, %Bronzez Bronze, %Copperz Copper
     put #echo >Log Aqua **********************************************************************
     pause
     gosub CLEAR.BANK
     if ("$zoneid" = "1") then gosub automove 231
     if (%quickrun = 1) && (%travel = 1) then goto DONE
     if ($skulk = "OFF") || ("$silence" = "OFF") || ("$plunder" = "OFF") || ("$focus" = "OFF") then gosub khri.up %khri1
     goto START.ROB
     
TOTAL.CHECK:
     action (profitparse) var Platz $1 when ^PROFITPARSE\s(\d+)\d\d\d\d\sPROFITPARSE
     action (profitparse) var Goldz $1 when ^PROFITPARSE\s\d+(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Goldz $1 when ^PROFITPARSE\s(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Silverz $1 when ^PROFITPARSE\s\d+\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silverz $1 when ^PROFITPARSE\s\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silverz $1 when ^PROFITPARSE\s(\d)\d\d\sPROFITPARSE
     action (profitparse) var Bronzez $1 when ^PROFITPARSE\s\d+\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronzez $1 when ^PROFITPARSE\s\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronzez $1 when ^PROFITPARSE\s\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronzez $1 when ^PROFITPARSE\s(\d)\d\sPROFITPARSE
     action (profitparse) var Copperz $1 when ^PROFITPARSE\s\d+\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copperz $1 when ^PROFITPARSE\s\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copperz $1 when ^PROFITPARSE\s\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copperz $1 when ^PROFITPARSE\s\d(\d)\sPROFITPARSE
     action (profitparse) var Copperz $1 when ^PROFITPARSE\s(\d)\sPROFITPARSE
     action (profitparse) on
     put #parse PROFITPARSE $Stolen.Profit PROFITPARSE
     action (profitparse) off
     
TIME.CALC:
     evalmath runTime (%t / 60)
     evalmath runTime round(%runTime,2)
     RETURN

DONE:
     echo
     echo *** DONE ROBBING PEOPLE!
     echo
     put #parse ROB DONE
     put #parse DONE ROBBING
     exit
 ##############################################################################################
#        UBER PROFIT TRACKING / BANK EXCHANGE V.9000    W/ CROSS SCRIPT INJECTION            #
##############################################################################################
BANK:
     send wealth
     waitforre ^Wealth|^I could|^\.\.\.wait|^Sorry\,
     pause 0.001
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
     action (balancecheck) on
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.PREDEP.MATH
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -deposit all;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     gosub BANK.COIN.CLEAR
     action (balancecheck) on
     pause 0.01
     if ($invisible = 1) then gosub stopinvis
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.01
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.POSTDEP.MATH
     evalmath profit (%postDeposit - %preDeposit)
     math Profit add %profit
     math TotalProfit add %Profit
     pause 0.01
     gosub BANK.COIN.CLEAR
     action (profitparse) on
     put #parse PROFITPARSE %Profit PROFITPARSE
     action (profitparse) off
     if (%banked = 0) then
          {
               put #tvar Plat 0
               put #tvar Gold 0
               put #tvar Silver 0
               put #tvar Bronze 0
               put #tvar Copper 0
          }
     math banked add 1
SAVE.PROFIT:
## Combines profit from multiple bank runs to show total profit at end
## Saves your profit from all bank deposits in temp global variables so you can add total profit to your main script profit tracking 
     put #tvar Plat %Plat
     put #tvar Gold %Gold
     put #tvar Silver %Silver
     put #tvar Bronze %Bronze
     put #tvar Copper %Copper
     pause 0.1
     put #statusbar 1 Stealing Profit: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper
     put #parse MONEY DONE
     RETURN
     
#############################################
# BANK GOSUBS
#############################################
COMBINE.BANK:
	math Plats add %Plat
	math Golds add %Gold
	math Silvers add %Silver
	math Bronzes add %Bronze
	math Coppers add %Copper
	pause 0.1
	RETURN
BANK.COIN.CLEAR:
     var Copper 0
     var Bronze 0
     var Silver 0
     var Gold 0
     var Plat 0
     RETURN
BANK.COIN.MATH:
     math Bronze multiply 10
     math Silver multiply 100
     math Gold multiply 1000
     math Plat multiply 10000
     RETURN
BANK.PREDEP.MATH:
     math preDeposit add %Copper
     math preDeposit add %Bronze
     math preDeposit add %Silver
     math preDeposit add %Gold
     math preDeposit add %Plat
     RETURN
BANK.POSTDEP.MATH:
     math postDeposit add %Copper
     math postDeposit add %Bronze
     math postDeposit add %Silver
     math postDeposit add %Gold
     math postDeposit add %Plat
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
#############################################
## EXCHANGE
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
EXCHANGE:
     var Coin $0
EXCHANGE.CONTINUE:
     pause 0.1
     if ($invisible = 1) then gosub stopinvis
     matchre EXCHANGE.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre RETURN ^You hand your money to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre RETURN ^But you don't have any .*\.
     matchre EXCH.INVIS ^How can you exchange money when you can't be seen\?
     matchre EXCHANGE.SMALLER transactions larger than a thousand
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE ALL %Coin FOR %Target.Currency
     matchwait
EXCHANGE.SMALLER:
     pause 0.1
     pause 0.1
     matchre EXCHANGE.SMALLER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre EXCHANGE.SMALLER ^You hand your .* to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre EXCH.INVIS ^How can you exchange money when you can't be seen\?
     matchre EXCHANGE.CONTINUE ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre EXCHANGE.CONTINUE ^But you don't have any .*\.
     matchre EXCHANGE.CONTINUE ^You don't have that many
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE 1000 plat %Coin FOR %Target.Currency
     matchwait   
EXCHANGE.FINISH:
     put #parse EXCHANGE DONE!
     RETURN
EXCH.INVIS:
     pause 0.1
     send hum scale
     pause 0.5
     send stop hum
     pause 0.1
     goto EXCHANGE.CONTINUE    
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
#################################################################     
     
KHRI.UP:
     var khri $0
     echo *** PUTTING UP KHRI ***
     if ($concentration < 20) then goto KHRI.UP.BREAK
     gosub KHRI.UP.START %khri
     RETURN
     
KHRI.UP.START:
KHRI.UP.START.CONTINUE:
     matchre KHRI.UP.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre KHRI.UP.KNEEL ^Your mind and body are willing|Sitting, kneeling, or lying
     matchre KHRI.UP.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre KHRI.UP.RETURN ^You're already using the .* meditation\.
     matchre KHRI.UP.RETURN ^You already
     matchre KHRI.UP.RETURN ^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?
     matchre KHRI.UP.RETURN ^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]
     matchre KHRI.UP.RETURN ^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)
     matchre KHRI.UP.RETURN ^Focusing|^With intense focus|^You carefully relax your mind|You are not|Your mind|valid khri|^Your thoughts
     matchre KHRI.UP.BREAK You strain, but cannot focus|Your mind is already focused
     matchre KHRI.UP.PAUSE ^You have not recovered from
     send khri %khri
     matchwait
KHRI.UP.BREAK:
     send khri stop
KHRI.UP.PAUSE:
     ECHO **** PAUSING TO RECOVER CONCENTRATION..
     pause 10
KHRI.UP.WAIT:
     pause 0.5
     send khri meditate
     pause
     pause
     if !$hidden then send hide
     pause
     if ($concentration > 60) then goto KHRI.UP.START
     echo
     echo *** WAITING FOR CONCENTRATION TO RECOVER.........
     echo
     #send touch my grey stone
     pause 20
     if ($concentration < 60) then goto KHRI.UP.WAIT
KHRI.UP.BREAK.DONE:
     gosub EMPTY.HANDS
     goto KHRI.UP
KHRI.UP.KNEEL:
     gosub PUT kneel
     gosub PUT khri %khri
     pause $roundtime
     pause 0.5
     pause 0.1
     gosub stand
     RETURN
KHRI.UP.RETURN:
     pause $roundtime
     pause .001
     pause .001
     RETURN
     
MOVE.ROOM:
     gosub MOVE.RANDOM
     goto ROB.MAIN
     
MOVE.TEST:
     gosub MOVE.RANDOM
     goto BANK.RUN
     
MOVE.RANDOM:
     delay 0.0001
     random 1 11
     if (%r = 1) && (!$north) then goto MOVE.RANDOM
     if (%r = 2) && (!$northeast) then goto MOVE.RANDOM
     if (%r = 3) && (!$east) then goto MOVE.RANDOM
     if (%r = 4) && (!$southeast) then goto MOVE.RANDOM
     if (%r = 5) && (!$south) then goto MOVE.RANDOM
     if (%r = 6) && (!$southwest) then goto MOVE.RANDOM
     if (%r = 7) && (!$west) then goto MOVE.RANDOM
     if (%r = 8) && (!$northwest) then goto MOVE.RANDOM
     if (%r = 9) &&  !matchre("$roomexits","out") then goto MOVE.RANDOM
     if (%r = 10) && (!$up) then goto MOVE.RANDOM
     if (%r = 11) && (!$down) then goto MOVE.RANDOM
     if (%r = 12) && !matchre("$roomobjs","doorway|door") then goto MOVE.RANDOM
     if (%r = 13) && !matchre("$roomobjs","archway|arch") then goto MOVE.RANDOM
     #
     if (%r = 1) then var Direction north
     if (%r = 2) then var Direction northeast
     if (%r = 3) then var Direction east
     if (%r = 4) then var Direction southeast
     if (%r = 5) then var Direction south
     if (%r = 6) then var Direction southwest
     if (%r = 7) then var Direction west
     if (%r = 8) then var Direction northwest
     if (%r = 9) then var Direction out
     if (%r = 10) then var Direction up
     if (%r = 11) then var Direction down
     if (%r = 12) then var Direction go door
     if (%r = 13) then var Direction go arch
     #
     if (%r = 1) then var Reverse.Direction south
     if (%r = 2) then var Reverse.Direction southwest
     if (%r = 3) then var Reverse.Direction west
     if (%r = 4) then var Reverse.Direction northwest
     if (%r = 5) then var Reverse.Direction north
     if (%r = 6) then var Reverse.Direction northeast
     if (%r = 7) then var Reverse.Direction east
     if (%r = 8) then var Reverse.Direction southeast
     if (%r = 9) then var Reverse.Direction out
     if (%r = 10) then var Reverse.Direction down
     if (%r = 11) then var Reverse.Direction up
     if (%r = 12) then var Reverse.Direction go door
     if (%r = 13) then var Reverse.Direction go arch
     #
     var Exits 0
     if ($north) then math Exits add 1
     if ($northeast) then math Exits add 1
     if ($east) then math Exits add 1
     if ($southeast) then math Exits add 1
     if ($south) then math Exits add 1
     if ($southwest) then math Exits add 1
     if ($west) then math Exits add 1
     if ($out) then math Exits add 1
     if ($up) then math Exits add 1
     if ($down) then math Exits add 1
     if matchre("$roomexits","out") then math Exits add 1
     if matchre("$roomobjs","doorway|door") then math Exits add 1
     if matchre("$roomobjs","archway|arch") then math Exits add 1
     #
     # don't move "back" on a path unless we hit a dead end
     if (%Exits > 1) && ("%Last.Direction" = "%Reverse.Direction") then goto MOVE.RANDOM
     #
     var Last.Direction %Direction
     # Trigger to set variable for occupied room, when roaming.
     action instant var Occupied 1 when ^Also here\:|^Also in the room\:
     var Occupied 0
     gosub MOVE.RESUME
     RETURN

MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
MOVE.RESUME:
     matchre MOVE.RESUME ^\.\.\.wait|^Sorry\,
     matchre MOVE.RESUME ^You make your way up the .*\.\s*Partway up\, you make the mistake of looking down\.\s*Struck by vertigo\, you cling to the .* for a few moments\, then slowly climb back down\.
     matchre MOVE.RESUME ^You pick your way up the .*\, but reach a point where your footing is questionable\.\s*Reluctantly\, you climb back down\.
     matchre MOVE.RESUME ^You approach the .*\, but the steepness is intimidating\.
     matchre MOVE.RESUME ^You struggle
     matchre MOVE.RESUME ^You blunder
     matchre MOVE.RESUME ^You slap
     matchre MOVE.RESUME ^You work
     matchre MOVE.RESUME make much headway
     matchre MOVE.RESUME ^You flounder around in the water\.
     matchre MOVE.RETREAT ^You are engaged to .*\!
     matchre MOVE.STAND ^You start up the .*\, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE.STAND ^Running heedlessly over the rough terrain\, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE.STAND ^You can't do that while lying down\.
     matchre MOVE.STAND ^You can't do that while sitting\!
     matchre MOVE.STAND ^You must be standing to do that\.
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.STAND ^Stand up first.
     matchre MOVE.DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE.DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE.DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE.DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE.DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE.DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE.FAILED ^You can't go there
     matchre MOVE.FAILED ^A nearby member
     matchre MOVE.FAILED ^I could not find what you were referring to\.
     matchre MOVE.FAILED ^What were you referring to\?
     matchre MOVE.RETURN ^It's pitch dark
     matchre MOVE.RETURN ^Obvious
     send %Direction
     matchwait
MOVE.STAND:
     pause 0.1
     matchre MOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE.STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE.STAND ^The weight
     matchre MOVE.STAND ^You try
     matchre MOVE.RETREAT ^You are already standing\.
     matchre MOVE.RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE.RETREAT ^You stand up\.
     send stand
     matchwait
MOVE.RETREAT:
     pause 0.1
     matchre MOVE.RETREAT ^\.\.\.wait|^Sorry\,
     matchre MOVE.RETREAT ^You retreat back to pole range\.
     matchre MOVE.RETREAT ^You try to back away
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.RESUME ^You retreat from combat\.
     matchre MOVE.RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait
MOVE.DIG:
     pause 0.1
     matchre MOVE.DIG ^\.\.\.wait|^Sorry\,
     matchre MOVE.DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE.STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE.DIG.STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE.RESUME ^You will have to kneel
     send dig
     matchwait
MOVE.DIG.STAND:
     pause 0.1
     matchre MOVE.DIG.STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE.DIG.STAND ^The weight
     matchre MOVE.DIG.STAND ^You try
     matchre MOVE.DIG.STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE.DIG ^You stand(?:\s*back)? up\.
     matchre MOVE.DIG ^You are already standing\.
     send stand
     matchwait
MOVE.FAILED:
     evalmath movefailCounter (movefailCounter + 1)
     if (%movefailCounter > 3) then goto MOVE.FAIL.BAIL
     pause 0.5
     goto MOVE.RESUME
MOVE.FAIL.BAIL:
     put #echo
     put #echo >$Autosteal Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear
MOVE.RETURN:
     RETURN
 
STOWING:
     var location STOWING
     pause 0.1
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     if matchre("$righthandnoun","(crossbow|bow|short bow)") then gosub unload
     if matchre("$righthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then put wear my $1
     if matchre("$lefthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then put wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN
STOW:
     if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then return
     math STOW.LOOP add 1
     pause 0.1
     pause 0.1
     pause 0.01
     if contains("$lefthand" "$righthand" , "%large.items") then gosub EMPTY.HANDS
     if matchre("%item","(%BIN_CONTAINER|%PAWN_CONTAINER)") then gosub EMPTY.HANDS
     if %STOW.LOOP > 1 then goto SECOND.BAG
     matchre STOW ^\.\.\.wait|^Sorry\,
     matchre STOW.WTF ^Something appears different
     matchre SECOND.BAG /You just can't get|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.RETURN /You put|What were you|You can't do|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my back
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my back
     matchwait 10
     RETURN
SECOND.BAG:
     pause 0.001
     matchre SECOND.BAG ^\.\.\.wait|^Sorry\,
     matchre DROP.ITEM /You just can't get|You can't do|no matter how you arrange|^There isn't any more room||too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my back
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my back
     matchwait 10
     RETURN
STOW.WTF:
     if ("$righthand" != "Empty") then send stow right in my back
     if ("$lefthand" != "Empty") then send stow left in my back
     pause 0.5
     pause 0.5
STOW.RETURN:
     var STOW.LOOP 0
     RETURN
DROP.ITEM:
     var STOW.LOOP 0
     gosub EMPTY.HANDS
     pause 0.2
     RETURN
STOW.BIN:
     ECHO *************************************
     ECHO * Found an odd non-binnable item
     ECHO * May just be an old stolen item
     ECHO * Putting in %Safe_Container 
     ECHO * For safe-keeping just in case
     ECHO *************************************
     pause 0.5
     pause 0.5
     gosub PUT open my %SAFE_CONTAINER
     pause 0.1
     pause 0.1
     pause 0.1
     matchre SECOND.BAG ^\.\.\.wait|^Sorry\,
     matchre DROP.ITEM /You just can't get|You can't do|no matter how you arrange|^There isn't any more room||too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.BIN.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my back
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my back
     matchwait 10
STOW.BIN.RETURN:
     pause 0.001
     gosub PUT close my 
     pause 0.1
     pause 0.001
     RETURN
RET.HIDE:
     put stop hum
     wait
     pause 0.1
     pause 0.1
     put ret
     put ret
     pause 0.5
     pause 0.2
HIDE:
     pause 0.1
     pause 0.1
     matchre HIDE ^\.\.\.wait|^Sorry\,
     matchre RET.HIDE You are too close|^You are a bit|^You are too busy
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RUNANDHIDE ^You haven't had enough time
     matchre RETURN ^.* notices your attempt to hide\!
     matchre RETURN ^.* reveals you, ruining your hiding attempt\!|
     matchre RETURN ^.* discovers you, ruining your hiding place\!
     matchre RETURN ^You melt|^You blend|^Eh\?|^You slip|^Roundtime|You look around
     send hide
     matchwait 10
     RETURN

AUTOMOVE:
     delay 0.0001
     var Destination $0
     var automovefailCounter 0
     if $roomid = 0 then GOSUB MOVE.RANDOM
     if (!$standing) then gosub AUTOMOVE.STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE.GO:
     matchre AUTOMOVE.FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE.RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE.RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE.FAIL.BAIL ^DESTINATION NOT FOUND
     send #goto %Destination
     matchwait
AUTOMOVE.STAND:
     pause 0.1
     matchre AUTOMOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE.STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE.STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE.STAND ^You are still stunned\.
     matchre AUTOMOVE.RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE.RETURN ^You are already standing\.
     matchre AUTOMOVE.RETURN ^You begin to get up and 
     send stand
     matchwait
AUTOMOVE.FAILED:
     evalmath automovefailCounter (automovefailCounter + 1)
     if (%automovefailCounter > 3) then goto AUTOMOVE.FAIL.BAIL
     send #mapper reset
     pause 0.5
     goto AUTOMOVE.GO
AUTOMOVE.FAIL.BAIL:
     put #echo
     put #echo >$Autosteal Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Autosteal Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo
     put #parse MOVE FAILED
     gosub clear 
     goto %LAST
AUTOMOVE.RETURN:
     if matchre("%Destination", "teller|exchange|debt|PAWN") then if $invisible = 1 then gosub stopinvis
     pause 0.001
     pause 0.1
     RETURN

     
EMPTY.HANDS:
     delay 0.0001
     if ("$lefthand" != "Empty") then gosub empty left
     if ("$righthand" != "Empty") then gosub empty right
     pause 0.1
     RETURN
EMPTY:
var hand $0
EMPTY.IT:
     pause 0.1
     pause 0.1
     matchre EMPTY.IT ^\.\.\.wait|^Sorry\,
     matchre LOWER.HAND Whoah\!
     matchre LOWER.HAND If you still wish to drop it
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You drop
     matchre RETURN already empty
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^But you aren't holding that\.
     matchre RETURN ^Roundtime
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN shatters
     send empty %hand
     matchwait
LOWER.HAND:
     pause 0.1
     pause 0.1
     if "$righthand" != "Empty" then send lower $righthandnoun
     if "$lefthand" != "Empty" then send lower $lefthandnoun
     pause 0.1
     pause 0.1
     pause 0.1
     RETURN
stopinvis:
     gosub PUT hum scale
     pause 0.5
     pause 0.5
     gosub PUT stop hum
     RETURN
#### PUT SUB
PUT:
     delay 0.0001
     var command $0
     var LOCATION PUT.1
     PUT.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT.STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN.CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN.CLEAR ^I could not find what you were referring to\.
     matchre RETURN.CLEAR ^Please rephrase that command\.
     matchre RETURN.CLEAR ^That is already
     matchre RETURN.CLEAR ^What were you referring to\?
     matchre RETURN.CLEAR ^.* what\?
     matchre RETURN.CLEAR ^You (?:hand|push|move|put|whisper|lean|tap|silently|slip|stop|open|close|drop|place|knock|grab|fade|toss|set|add|offer|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN.CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN.CLEAR ^Subservient type|^The shadows|^Close examination     
     matchre RETURN.CLEAR ^USAGE\:
     matchre RETURN.CLEAR ^A slit across the door
     matchre RETURN.CLEAR ^Your (?:actions|dance).*\.
     matchre RETURN.CLEAR ^You.*analyze
     matchre RETURN.CLEAR ^Having no further use for .*\, you discard it\.
     matchre RETURN.CLEAR ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN.CLEAR ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN.CLEAR ^Brother Durantine nods slowly\.
     matchre RETURN.CLEAR ^Durantine waves a small censer over a neatly-wrapped package and intones a short prayer before he hands it to you\.
     matchre RETURN.CLEAR ^After a moment\, .*\.
     matchre RETURN.CLEAR ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN.CLEAR ^Maybe you should stand up\.
     matchre RETURN.CLEAR ^The clerk counts out .*\.
     matchre RETURN.CLEAR ^The .* is not damaged enough to warrant repair\.
     matchre RETURN.CLEAR ^There is no more room in .*\.
     matchre RETURN.CLEAR ^There is nothing in there\.
     matchre RETURN.CLEAR ^In the .* you see .*\.
     matchre RETURN.CLEAR ^This spell cannot be targeted\.
     matchre RETURN.CLEAR ^You cannot figure out how to do that\.
     matchre RETURN.CLEAR ^You will now store .* in your .*\.
     matchre RETURN.CLEAR ^That tool does not seem suitable for that task\.
     matchre RETURN.CLEAR ^There isn't any more room in .* for that\.
     matchre RETURN.CLEAR ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN.CLEAR ^\s*LINK ALL CANCEL\s*\- Breaks all links
     matchre RETURN.CLEAR ^This ritual may only be performed on a corpse\.
     matchre RETURN.CLEAR ^There is nothing else to face\!
     matchre RETURN.CLEAR ^You're already stalking
     matchre RETURN.CLEAR ^An offer
     matchre RETURN.CLEAR ^Malik nods
     matchre RETURN.CLEAR ^Obvious exits
     matchre RETURN.CLEAR ^Obvious paths
     matchre RETURN.CLEAR ^But the merchant can't see you|are invisible
     matchre STAND ^You should stand up first\.
     # matchre RETURN.CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Autosteal Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Autosteal Crimson $datetime Command = %command
     put #log $datetime MISSING MATCH IN PUT
     RETURN

PUT.STOW:
     gosub stow
     goto PUT.1

#### GET SUB
GET:
     delay 0.0001
     var get $0
     var LOCATION GET.1
     GET.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD.1 ^But that is already in your inventory\.
     # matchre RETURN ^\s*You get .*\.
     matchre RETURN ^You pick up .*\.
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You (?:get|grab) .*(?:\.|\!|\?)
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Autosteal Crimson $datetime *** MISSING MATCH IN GET! ***
     put #echo >$Autosteal Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET
     RETURN

#### DOUBLE PUT SUB
PUT.IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT.IT.1
     PUT.IT.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:hand|push|move|put|tap|drop|place|knock|toss|set|add|search|circle|fake|slip|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^.* what\?
     matchre RETURN ^That's too heavy
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Perhaps you should be holding that first\.
     send put %putit
     matchwait 15
     put #echo >$Autosteal Crimson $datetime *** MISSING MATCH IN PUT.IT!  ***
     put #echo >$Autosteal Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT.IT
     RETURN
     
KNEEL:
     pause 0.2
     send kneel
     pause 0.5
STAND:
     pause 0.1
     pause 0.1
     matchre STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre STAND ^\.\.\.wait|^Sorry\,
     matchre KNEEL ^You are so unbalanced you cannot manage to stand\.
     matchre KNEEL ^The weight of all your possessions prevents you from standing\.
     matchre KNEEL ^You are overburdened and cannot manage to stand\.
     matchre STAND ^You are still stunned
     matchre STAND ^You try
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You are already standing\.
     matchre RETURN ^You stand back up\.
     matchre RETURN ^You stand up\.
     matchre RETURN ^There doesn't seem to be anything to stand on here
     matchre RETURN ^You swim back up
     matchre RETURN ^You are already standing\.
     matchre RETURN ^You're unconscious
     send STAND
     matchwait 10
     goto STAND
     
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
#### RETURNS
RETURN.CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return

WARRANTS:
     echo ****************************************************************************
     echo *** OH NOES! TOO MANY OUTSTANDING WARRANTS OR FINES TO BE ABLE TO STEAL!
     echo *** DO NOT PASS GO - DO NOT COLLECT $200!
     echo *** SURRENDER TO A GUARD - GO DIRECTLY TO JAIL AND PAY ALL FINES 
     echo *** YOU HAVE TO PAY YOUR BIG FINES BEFORE YOU CAN STEAL AGAIN!
     echo ****************************************************************************
     put #echo >Log Red **** TOO MANY OUTSTANDING WARRANTS/FINES - GO TO JAIL AND PAY ALL FINES
     exit

FUCKOFF:
     echo *********************************************************
     echo *** YOU ARE NOT A THIEF! HAHAHAHAHA 
     echo *** KINDLY FUCK OFF :)
     echo *********************************************************
     exit