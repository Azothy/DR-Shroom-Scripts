#debuglevel 5
if "$charactername" != "Sulic" then 
     {
     include stealVariables.Inc
     }
if "$charactername" = "Sulic" then
     {
     include stealVariables2.Inc
     }
#--------------------------------------------------------------------------------------------------------
#  ULTIMATE GENIE3 PROGRESSIVE STEALING SCRIPT v7.19 for Dragonrealms. Updated 3/09/18
#  By Shroom of TF / Azothy of Prime.
#  © 2005-2018 Chris Sansalone, all rights reserved. Not for resale or distribution without author's consent.
#  Send any bug reports/feedback to: skultamaphon@gmail.com / Shroom#0046 - Discord
#--------------------------------------------------------------------------------------------------------
var version 7.19
# ------------------------ IMPORTANT INFO / PREREQUISITES ------------------------------------------------
# stealVariables.Inc (MANDATORY)
# LATEST VERSION - http://pastebin.com/Kb231wiE
# This is a separate script that contains all your custom variables. Script will not work without this.
#
# AUTOMAPPER AND LATEST MAPS (MANDATORY)
# http://www.genieclient.com/bulletin/topic/3592-how-to-use-the-genie-map-repository/
# See this thread on the Genie forums for syncing your Genie maps folder to the map repository, so you can always have the most updated maps
#
# TRAVEL SCRIPT (MANDATORY)
# LATEST VERSION HERE - https://pastebin.com/Tpwc6ThB
#
# EXPTRACKER 3.0 PLUGIN FOR GENIE (MANDATORY)
# http://www.genieclient.com/bulletin/files/file/26-experience-tracker/
#--------------------------------------------------------------------------------------------------------
# ----------------------------- SCRIPT NOTES AND FUNCTIONALITY ------------------------------------------
#   SUPPORTED CITIES: Theren / Riverhaven / Arthe / Crossing / Leth / Shard / Horse Clan / Hib / Ratha / Aesry
# - START FROM ANY CITY! STEALS from every shop in every supported city, moves from city to city until mind locked
# - Automatically determines optimal items to steal based on thievery level. NEVER change item variables!
# - As you advance in Thievery ranks, automatically progresses to harder items. Trains from ~0~ ranks to 1750.
#
# - ARMOR SUPPORT - Removes all your armor before the run, stashes it in your SAFE_CONTAINER
# - Remembers your armor and puts it all back on when the script finishes.
#
# - SMART BAG SCAN - AUTOMATICALLY STASHES YOUR VULNERABLE ITEMS BEFORE THE RUN - NEVER LOSE YOUR IMPORTANT ITEMS!
# - It will scan your bags before the run - If ANY of your items are similar to things you will steal,
# - It will pull that item out and store it in your SAFE_CONTAINER and keep it closed during the run.
# - This will prevent ever accidentally losing any of your personal or important items!
#
# - JAIL SUPPORT - If you go to Jail, it will plead, pay your fine, recover your items and continue where it left off.
# - Has support for virtually every item that persist through jail.. however if you run across one that doesn't work PLEASE let me know!
#
# - THIEVES will mark ALL items before stealing, leave the shop if there is too much heat.
# - THIEVES will Bin 50% and Pawn 50% by default. Or Bin 100% by setting var PAWN OFF. NEVER TURN BIN OFF
#
# - NON-THIEVES: Will steal 1-4 times per shop (depending on difficulty)
# - NON-THIEVES: Will PAWN ALL ITEMS and dump those that can't sell.
#
# - NECROS will stay invisible as much as possible and keep up ROC to keep social outrage down
# - NECROS will never cast buffs in a room with other people. It will search for an empty room first.
#
#  CITY TRAVEL LOGIC:
# - Typically the script will move city to city in a linear fashion - North to South or South to North, depending where you start
# - Hib -> HC -> Shard -> Leth -> Arthe/Xing -> Haven -> Theren - or reverse in the other direction

# SCRIPT USAGE -
# 1)  .steal
# There are more advanced methods of running the script if I need you to help me with tracking down a bug
# But in general - UNLESS YOU ARE TROUBLESHOOTING, NEVER START THE SCRIPT WITH ANY VARIABLES
#
# 2) .steal PAWN
# THIS IS ONLY **EVER** TO BE USED IF YOU NEED TO EMPTY YOUR BAGS OF STOLEN ITEMS AND HAVE ALREADY RUN THE INITIAL BAG CHECK!!!!
# THIS WILL START THE SCRIPT, SKIP THE INITIAL BAG SCAN AND GO STRAIGHT TO PAWNING
# Example: You ran the script normally and aborted it halfway the run, now you want to empty your loot bags
# USING THIS FEATURE WITHOUT HAVING DONE THE BAG CHECK FIRST COULD CAUSE YOU TO LOSE YOUR ITEMS!!!!!
#
# ---------------------------------------- DISCLAIMER -------------------------------------------------------------------------
# ~~ I AM NOT RESPONSIBLE FOR ANY LOST ITEMS. IT IS **HIGHLY RECOMMENDED** TO REGISTER YOUR MOST VALUABLE ITEMS.
# ~~ ALTHOUGH THIS SCRIPT DOES ~EVERYTHING POSSIBLE~ TO MAKE SURE IT DOESN'T LOSE YOUR ITEMS..
# ~~ THERE IS ALWAYS A TINY CHANCE (HOWEVER SMALL) THAT SOMETHING MAY GO WRONG.
# ~~ IF YOU WANT TO BE 100% SAFE, PUT YOUR MOST IMPORTANT ITEMS IN YOUR VAULT, OR A CLOSED CONTAINER,
# ~~ THIS SCRIPT AUTOMATICALLY STASHES ANY VULNERABLE ITEMS IN YOUR SAFE CONTAINER! SO IT SHOULD NEVER LOSE ANYTHING!
# ~~ NEVERTHELESS - REGISTER YOUR MOST IMPORTANT STUFF TO BE SURE. BETTER TO BE SAFE THEN SORRY!
#------------------------------------------------------------------------------------------------------------------------------
## BEGIN SCRIPT - DO NOT TOUCH ANYTHING BELOW!
###############################################################################################################################
gosub DefaultVariables
put #settings maxgosubdepth 50000
put #settings save
put #var save
INIT.ACTIONS:
     action math Pawned add 1 when You sell your|he hands you
     action math Binned add 1 when Nice work, $charactername
     action math Charges add 1 when begins to shout for help|begins to shout loudly for help
     action var nosell $1 when ^\w+ shakes his head (.+)$
     action var nosteal ON when ^You stop as you realize that the
     action var goPawn ON; put #echo >Log Yellow ** USER INPUT INTERRUPT - Skipping directly to pawning after next check when ^PAWNNOW|^GOPAWNYO
     action var stolen 6; var caught 1; put #echo >log Red *** Busted in %SHOP stealing: %item - on grab %grabbed @ $Thievery.Ranks ranks when notices you attempting|begins to shout loudly|Guards\! Guards\!
     action put #echo >log Purple *** Stealing Mind Locked! Not learning anymore when You feel that for the moment you've learned all you can
     action var noLearn ON; put #echo >Log OrangeRed *** Not learning from %item in %SHOP @ $Thievery.Ranks ranks when You don't feel you learned anything useful
     action instant echo *** LEGENDARY GRAB!! when ^You learned exceptionally well from this
     action instant echo *** EPIC grab! when ^You learned very well from this
     action instant echo *** AWESOME grab! when ^You learned rather well from this
     action instant echo *** Great grab! when ^You learned acceptably from this
     #NECRO
     action var Eyes ON when ^Your spell subtly alters|^You feel an unsteady|^Your spell injects more psychic corruption
     action var Eyes OFF when ^Your corruptive mutation fades|^Your corruption fades
     action var Rite ON when ^You weave a field of sublime|^The Rite of Contrition matrix redoubles
     action var Rite OFF when ^The Rite of Contrition matrix loses
     #JAIL
     action instant goto TOO.MANY.FINES when ^You think about stealing for a moment
     action instant goto %LAST when SHOP IS CLOSED
     action instant goto JAIL.CHECK when a sound not unlike that of a tomb|binds you in chains|firmly off to jail|drag you off to jail|brings you to the jail
     action instant goto JAIL.CHECK when your belongings have been stripped|in a jail cell wearing a set of heavy manacles|strip you of all your possessions|binds your hands behind your back
     action instant goto JAIL.CHECK when the last thing you see before you black out|your possessions have been stripped|You are a wanted criminal, $charactername
     action instant goto JAIL.CHECK when Your silence shall be taken as an indication of your guilt|The eyes of the court are upon you|Your silence can only be taken as evidence of your guilt
     action instant goto JAIL.CHECK when all your belongings have been stripped|^The guard brings you to the jail
     #DISCONNECT
     action goto DISCONNECTED when eval $connected = 0
     action goto DISCONNECTED when ^Reconnect aborted|^Unable to contact Genie Key server|^Please make sure that your internet connection|^Connection closed|(ConnectionTimedOut)
     action goto DISCONNECTED when ^Connection lost|^ConnectionAborted|^Socket Error|connection dropped|connection closed|^ReceiveCallback Exception|Unable to contact Genie Key server
     action goto CONNECTED when ^You look around, taking a moment to get your bearings|^Welcome to DragonRealms|reconnect now
     action goto CONNECTED when Please check for new or updated items in NEWS\!
     # action send exit when eval $health < 50
     # action goto CLAN.HEAL when I now pronounce sentenc
#############################################################################################################################################
INIT.SETUP:
     var LAST INIT.SETUP
     if (toupper("%PREMIUM") = "ON") then gosub PREMIUM.CHECK
     gosub GUILD.CHECK
     gosub CITY.CHECK
     gosub SKILL.CHECK
     gosub STEAL.LIST.SETUP
     gosub WELCOME
     gosub HEALTH.CHECK
     gosub ARMOR.CHECK
INIT2:
     var LAST INIT2
     if ("$Guild" = "Thief") then send smirk $charactername
     pause 0.5
     if_1 then var command %1
     if matchre("pawn", tolower("%command")) then goto PAWN.SKIP.PRE
     if matchre("rob", tolower("%command")) then goto ROB.TOP
     if_1 then
          {
               ECHO
               ECHO ******************************************************************************
               ECHO *** !!!!!!!!!!!!!! WARNING  !!!!!!!!!!!!!!
               ECHO *** YOU STARTED THE SCRIPT WITH VARIABLES!
               ECHO *** THIS IS FOR TESTING/TROUBLESHOOTING PURPOSES **ONLY**
               ECHO *** ( OR FOR STARTING SCRIPT MIDWAY AND JUMPING STRAIGHT TO A LABEL )
               ECHO *** PROCEED AT YOUR OWN RISK
               ECHO *****************************************************************************
               ECHO
               pause 4
               ECHO *** THIS SHOULD ONLY BE USED IF YOU HAVE ALREADY DONE THE INITIAL BAG SCAN
               ECHO *** AND ARE RESTARTING THE SCRIPT AFTER STOPPING MIDWAY THROUGH A RUN
               ECHO *** SO YOU DON'T STASH ALREADY STOLEN ITEMS
               ECHO
               ECHO *****************************************************************************************
               ECHO *** USAGE:
               ECHO *** Variable 1 - Skip to specified Label
               ECHO *** Variable 2 - Type anything to SKIP inital bag check and turn on debugmode (dangerous)
               ECHO *** Use of Second Variable is so you don't stash already stolen items
               ECHO *** If restarting script in the middle of a stealing run
               ECHO *** ex:  .steal SHARD.TO.LOCK OK
               ECHO *** - skips to SHARD.TO.LOCK label and skips the initial bag check
               ECHO ******************************************************************************************
               ECHO
               pause 8
          }
DEBUG.INIT:
     if_2 then
          {
               debuglevel 5
               ECHO
               ECHO ****************************************************************************************
               ECHO *** FINAL WARNING!!! SKIPPING INITIAL BAG CHECK !!!!
               ECHO *** THIS FEATURE IS ONLY INTENDED FOR TESTING/TROUBLESHOOTING !!
               ECHO *** IF YOU DID NOT DO THIS ON PURPOSE THEN QUIT NOW !!!!
               ECHO ****************************************************************************************
               pause 4
               ECHO
               ECHO *** ~~~~ DEBUG MODE ENABLED ~~~~
               ECHO *** STARTING SCRIPT FROM %1 LABEL...
               ECHO
               pause
               goto START
          }
CHECKING.BAGS:
     var LAST CHECKING.BAGS
     ECHO
     ECHO ******        ~~ SMART BAG SCAN INITIALIZED ~~
     ECHO ****** SCANNING YOUR BAG CONTENTS FOR ANY IMPORTANT ITEMS
     ECHO ****** STASHING ALL CONFLICTING ITEMS IN YOUR: %SAFE_CONTAINER
     ECHO
     ECHO
     pause
     gosub BAG.CHECK %PAWN_CONTAINER
     pause 0.5
     gosub BAG.CHECK %BIN_CONTAINER
     pause 0.5
     pause 0.001
     pause 0.001
START:
ROB.TOP:
     var LAST START
     ECHO
     ECHO *** THIEVERY SKILL RANGE - %skillrange
     ECHO
     if (toupper("%BIN") = "OFF") then
          {
               ECHO
               ECHO *** PAWNING ~ALL~ ITEMS FOR MAX PROFIT
               ECHO
               pause 0.5
          }
     pause 0.1
     pause 2
     gosub PUT close my %SAFE_CONTAINER
     gosub PUT close my %BACKUP_CONTAINER
     pause 0.2
     timer start
     if_1 then goto %1
     goto STEALING.RUN
#################################################################################################################################################################################################################
STEAL.LIST.SETUP:
     echo *** Loading stealing list...
     var LIST.THEREN %T.Tarsha|%T.Rose|%T.Music|%T.Hats|%T.Arm|%T.Gift|%T.Sweet|%T.Cupcake|%T.Gen|%T.Krrish|%T.Lense|%T.Cleric|%T.Men|%T.Women|%T.Cloth|%T.Armory|%T.Forge
     var LIST.HAVEN %RH.Herb|%RH.Iron|%RH.Naph|%RH.Flow|%RH.Seli|%RH.Arms|%RH.Gen|%RH.Cloth|%RH.Artif|%RH.Joy|%RH.Joy2|%RH.Smoke|%RH.Weap|%RH.Bard|%RH.Bard2|%RH.Cleric|%RH.Cleric2|%RH.Lock|%RH.Tog|%RH.Tog2|%RH.Mirg
     var LIST.ARTHE %AD.Feta|%AD.Thread|%AD.Fash|%AD.Odds|%AD.Bard|%AD.Map|%AD.Arm|%AD.Tart.E|%KA.Grek|%AD.Smoke|%KA.Grek
     var LIST.CROSS %C.Alch|%C.Artif|%C.Grocer|%C.Bath|%C.Card|%C.Gen|%C.Gen.B|%C.Weap|%C.Arm|%C.Music|%C.Music2|%C.Lock|%C.Empath|%C.Empath2|%C.Empath3|%C.Cler|%C.Haber|%C.Script|%C.Tann|%C.Jewel|%C.Jewel2|%C.Stitch|%C.Cobb|%C.Herb|%C.Flow
     var LIST.LETH %L.Skin|%L.Bow|%L.Orig|%L.Weap|%L.Wick|%L.Bard|%L.Bard2|%L.Cloth|%L.Wood|%L.Gen|%L.Gen.Alt|%L.Perf
     var LIST.SHARD %S.Gen|%S.Weap|%S.Cleric|%S.Stitch|%S.Alch|%S.Herb|%S.Artif|%S.Music|%S.Armor|%S.Reed|%S.Bow|%S.Lock|%S.Coin|%S.Frill|%S.Herald|%S.Travel|%S.Spire|%S.Toy|%S.Memory|%S.Token|%S.Museum|%S.Barber|%S.Tanner|%S.Surv|%S.Surv.Alt|%S.Surv2|%S.Surv2.Alt
     var LIST.HIB %SC.Weap|%H.Shield|%H.Jewel|%H.Tog|%H.Herb|%H.Sund|%H.Lamp|%H.Music|%H.Alch|%H.Forge|%RP.Gen|%RP.Tobac
     var LIST.RATHA %R.Bait|%R.Gen|%R.Herb|%R.Forge|%R.Tailor|%R.Hair|%R.Leather|%R.Music|%R.Magic|%R.Origami|%R.Jewelry|%R.Ring
     var LIST.AESRY %A.Herb|%A.Tanner|%A.Clothing|%A.Script|%A.Cleric|%A.Origami|%A.Jewelry|%A.Magic|%A.Slings|%A.Puzzle|%A.Footwear|%A.Shields|%A.Weapon|%A.Armor|%A.Gen|%A.Flower|%A.Music
     var LIST.HORSE %HC.Jahtinit|%HC.Falconer|%HC.Yasnah|%HC.Bowyer|%HC.Bowyer2|%HC.Equine|%HC.Felterie|%HC.Felterie2
     var ALT.ITEMS %ALT1|%ALT2|%ALT3|%ALT3|%ALT4|%ALT5|%ALT6|%ALT7|%ALT8|%ALT9|%ALT10|%ALT11|%ALT12|%ALT13|%ALT14|%ALT15
     var LARGE.ITEMS cauldron|stove|spear|wayerd pyramid|longbow
     var ODD.ITEMS cigar|scroll|naphtha|sling|mining helm|mining cap|ordinary shield|torque|tobacco|bagpipes|cowl|dwarven hammer|lamp|robes|string|oil|holy oil|sacramental wine|repair kit|refill|linen cuirass|stylus|kris
     var STEAL.LIST %LIST.THEREN|%LIST.HAVEN|%LIST.ARTHE|%LIST.CROSS|%LIST.LETH|%LIST.SHARD|%LIST.HORSE|%LIST.HIB|%LIST.RATHA|%LIST.AESRY|%ODD.ITEMS|%ALT.ITEMS
     RETURN
############################################################################################
############################################################################################
####                        STEALING ROUTINE LOGIC                                     #####
############################################################################################
############################################################################################
STEALING.RUN:
     var LAST STEALING.RUN
     #put #echo >Log PowderBlue **** Starting Stealing Run from: %CITY ****
     #pause 0.5
     gosub STOWING
     if ("$Guild" = "Necromancer") then gosub NECRO.START
     goto %CITY.STEAL
######################################################
#  THERENGIA STEALING (THEREN/ROSSMAN/RIVERHAVEN     #
######################################################
### THERENBOROUGH
TO.THEREN:
     var LAST TO.THEREN
     put .%TRAVEL_SCRIPT theren
     waitforre ^YOU ARRIVED\!
     if ("$zoneid" = "40") then gosub AUTOMOVE theren
THEREN.STEAL:
     var CURRENT_CITY THEREN
     var LAST THEREN.STEAL
     var PawnLoc GO.PAWN.THEREN
     if ("%POWER" = "ON") || ("%PercHealth" = "ON") || ("%GuardianSpirit" = "ON") || ("ROC" = "ON") || ("EOTB" = "ON") then
          {
               ECHO *** NOT CASTING ANY SPELLS WHILE IN THEREN!
               ECHO *** TOO MANY MAGICALLY INERT ROOMS! THEREN SUCKS!
               pause 3
          }
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     pause 0.5
     pause 0.1
     echo
     echo ***** STEALING FROM THEREN!
     echo
     put #echo >Log LightCyan *** Stealing from Theren! ***
     gosub KHRI
THEREN.EXP.CHECK.0:
     if $Thievery.Ranks < 50 then goto THEREN.NOSTEAL
     if $Thievery.Ranks >= 690 then goto THEREN.TO.ROSE
THEREN.TO.TARSHA:
     var LAST THEREN.TO.ROSE
     gosub AUTOMOVE clothing
THEREN.TARSHA:
     var RETRY THEREN.TARSHA
     var shopcode T.Tarsha
     var SHOP Tarsha's Emporium
     gosub STEAL %T.Tarsha
THEREN.TO.ROSE:
     var LAST THEREN.TO.MUSIC
     gosub AUTOMOVE theatre
THEREN.ROSE:
     var RETRY THEREN.ROSE
     var shopcode T.Rose
     var SHOP Rose of the Theater - Attire
     gosub STEAL %T.Rose
THEREN.TO.MUSIC:
     var LAST THEREN.EXP.CHECK.1:
     gosub AUTOMOVE music
THEREN.MUSIC:
     var RETRY THEREN.MUSIC
     var shopcode T.Music
     var SHOP Rose of the Theater - Instruments
     gosub STEAL %T.Music.Num %T.Music
THEREN.EXP.CHECK.1:
     if $Thievery.Ranks >= 590 then goto THEREN.TO.ARMOR
THEREN.TO.HATS:
     var LAST THEREN.EXP.CHECK.2
     gosub AUTOMOVE hats
THEREN.HATS:
     var RETRY THEREN.HATS
     var shopcode T.Hats
     var SHOP Hats
     gosub STEAL %T.Hats
THEREN.EXP.CHECK.2:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     if $Thievery.Ranks >= 230 then goto THEREN.TO.ARMOR
THEREN.TO.SWEET:
     var LAST THEREN.TO.CUPCAKE
     gosub AUTOMOVE sweet
THEREN.SWEET:
     var RETRY THEREN.SWEET
     var shopcode T.Sweet
     var SHOP Sweet Delights
     gosub STEAL %T.Sweet
THEREN.TO.CUPCAKE:
     var LAST THEREN.TO.ARMOR
     gosub AUTOMOVE cup
THEREN.CUPCAKE:
     var RETRY THEREN.CUPCAKE
     var shopcode T.Cupcake
     var SHOP Cupcake
     gosub STEAL %T.Cupcake
THEREN.TO.ARMOR:
     var LAST THEREN.TO.GIFT
     gosub AUTOMOVE armor
THEREN.ARMOR:
     var RETRY THEREN.ARMOR
     var shopcode T.Arm
     var SHOP Armor
     gosub STEAL %T.Arm
THEREN.TO.GIFT:
     var LAST THEREN.EXP.CHECK.3
     gosub AUTOMOVE gift
THEREN.GIFT:
     var RETRY THEREN.GIFT
     var shopcode T.Gift
     var SHOP Gift
     gosub STEAL %T.Gift
THEREN.EXP.CHECK.3:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     if $Thievery.Ranks >= 700 then goto THEREN.TO.KRRISH
THEREN.TO.GENERAL:
     var LAST THEREN.TO.KRRISH
     gosub AUTOMOVE general
THEREN.GENERAL:
     var RETRY THEREN.GENERAL
     var shopcode T.Gen
     var SHOP General Store
     gosub STEAL %T.Gen
THEREN.TO.KRRISH:
     var LAST THEREN.TO.LENSE
     gosub AUTOMOVE Krrish's home
THEREN.KRRISH:
     var RETRY THEREN.KRRISH
     var shopcode T.Krrish
     var SHOP Krissh
     gosub STEAL %T.Krrish
THEREN.TO.LENSE:
     var LAST THEREN.EXP.CHECK.4
     gosub AUTOMOVE lense
THEREN.LENSE:
     var RETRY THEREN.LENSE
     var shopcode T.Lense
     var SHOP Konezu's Lenses
     gosub STEAL %T.Lense
THEREN.EXP.CHECK.4:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     if $Thievery.Ranks >= 460 then goto THEREN.TO.MEN
THEREN.TO.CLERIC:
     var LAST THEREN.TO.MEN
     gosub AUTOMOVE cleric
THEREN.CLERIC:
     var RETRY THEREN.CLERIC
     var shopcode T.Cleric
     var SHOP Cleric
     gosub STEAL %T.Cleric
THEREN.TO.MEN:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     var LAST THEREN.TO.WOMEN
     gosub AUTOMOVE men's
THEREN.MEN:
     var RETRY THEREN.MEN
     var shopcode T.Men
     var SHOP Courtly Men's Study
     gosub STEAL %T.Men
THEREN.TO.WOMEN:
     var LAST THEREN.TO.CLOTHING
     gosub AUTOMOVE women
THEREN.WOMEN:
     var RETRY THEREN.WOMEN
     var shopcode T.Women
     var SHOP Courtly Women's Parlor
     gosub STEAL %T.Women
THEREN.TO.CLOTHING:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     var LAST THEREN.EXP.CHECK.5
     gosub AUTOMOVE courtly
THEREN.CLOTHING:
     var RETRY THEREN.CLOTHING
     var shopcode T.Cloth
     var SHOP Courtly Clothing
     gosub STEAL %T.Cloth
THEREN.EXP.CHECK.5:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.THEREN
     ## THEREN KEEP BYPASS
     goto GO.PAWN.THEREN
     ## THEREN KEEP BYPASS
THEREN.TO.ARMORY:
     var LAST THEREN.TO.ARMORY
     gosub AUTOMOVE 102
     gosub AUTOMOVE moat
     gosub AUTOMOVE 116
     gosub AUTOMOVE 162
THEREN.TO.DUNG:
     gosub AUTOMOVE dungeon
THEREN.TO.ARMORY.CONT:
     gosub AUTOMOVE armory
THEREN.ARMORY:
     var RETRY THEREN.ARMORY
     var shopcode T.Armory
     var SHOP Theren Keep Armory
     gosub STEAL %T.Armory
THEREN.LEAVE:
     var LAST THEREN.LEAVE
     gosub AUTOMOVE 69
     send jump moat
     ECHO *** STUNNED!! Pausing to recover....
     pause 11
THEREN.STUNNED:
     var LAST THEREN.STUNNED
     pause
     if $stunned = 1 then goto THEREN.STUNNED
     gosub STAND
     pause 0.5
GO.PAWN.THEREN:
     var CURRENT_CITY THEREN
     var LAST GO.PAWN.THEREN
     if (toupper("%PAWN") = "OFF") then goto THEREN.TO.BANK
     gosub AUTOMOVE PAWN
     pause 0.5
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub PAWN.GOODS
THEREN.TO.BANK:
     var LAST THEREN.TO.BANK
     #if ("$Guild" = "Thief") then send khri stop
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                         echo *** SKIPPING BANK
                         goto THEREN.DECIDE
                    }
          goto THEREN.TELLER
          }
     if (toupper("%EXCHANGE") != "ON") then goto THEREN.TELLER
     gosub AUTOMOVE exchange
     gosub LIRUMS
THEREN.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     gosub MOVE s
     gosub MOVE out
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
THEREN.DECIDE:
     pause 0.5
     gosub AUTOMOVE 2
     if ("%BIN" = "ON") then goto TO.RIVERHAVEN
     if ("%RUN_FOREVER" = "ON") then goto TO.RIVERHAVEN
     if ("%SINGLE_RUN" = "ON") || ($Thievery.LearningRate > 32) || ("%EndEarly" = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(SHARD|CROSSING|HIB|LETH|RIVERHAVEN|ROSSMAN)") then goto FINISHED.SCRIPT
     goto TO.RIVERHAVEN
TO.RIVERHAVEN:
     var LAST TO.RIVERHAVEN
     pause 0.5
     ECHO *** TRAVELLING TO RIVERHAVEN!!
     send .%TRAVEL_SCRIPT haven
     waitforre ^YOU ARRIVED\!
     pause 0.5
############################################
#  RIVERHAVEN STEALING
############################################
RIVERHAVEN.STEAL:
HAVEN.STEAL:
     var LAST HAVEN.STEAL
     var CURRENT_CITY RIVERHAVEN
     var PawnLoc GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.HAVEN
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     pause 0.1
     echo
     echo **** STEALING FROM RIVERHAVEN!
     echo
     put #echo >Log LightCyan *** Stealing from Riverhaven! ***
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub TIME.CHECK
HAVEN.TO.TOG:
     var LAST HAVEN.TO.TOG2
     gosub AUTOMOVE city tog
HAVEN.TOG:
     var RETRY HAVEN.TOG
     var shopcode RH.Tog
     var SHOP City Togs
     gosub STEAL %RH.Tog
HAVEN.TO.TOG2:
     if $Thievery.Ranks < 600 then goto HAVEN.EXP.CHECK.0
     var LAST HAVEN.EXP.CHECK.0
     gosub AUTOMOVE 271
HAVEN.TOG2:
     var RETRY HAVEN.TOG2
     var shopcode RH.Tog2
     var SHOP City Togs2
     gosub STEAL %RH.Tog2
HAVEN.EXP.CHECK.0:
     if $Thievery.Ranks >= 340 then goto HAVEN.EXP.CHECK.1
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.PAWN.HAVEN
HAVEN.TO.HERB:
     var LAST HAVEN.EXP.CHECK.1
     gosub AUTOMOVE herb
HAVEN.HERB:
     var RETRY HAVEN.HERB
     var shopcode RH.Herb
     var SHOP Herbs
     gosub STEAL %RH.Herb
HAVEN.EXP.CHECK.1:
     if $Thievery.Ranks >= 385 then goto HAVEN.EXP.CHECK.2
HAVEN.TO.NAPHTHA:
     var LAST HAVEN.EXP.CHECK.2
     gosub AUTOMOVE Naptha
HAVEN.NAPHTHA:
     var RETRY HAVEN.NAPHTHA
     var shopcode RH.Naph
     var SHOP Naptha Cart
     var itemLocation %RH.Naph.Loc
     gosub STEAL %RH.Naph
HAVEN.EXP.CHECK.2:
     var itemLocation
     if $Thievery.Ranks >= 600 then goto HAVEN.TO.ARMS
HAVEN.TO.FLOWER:
     var LAST HAVEN.TO.ARMS
     gosub AUTOMOVE cecel
HAVEN.FLOWER:
     var RETRY HAVEN.FLOWER
     var shopcode RH.Flow
     var SHOP Florist
     gosub STEAL %RH.Flow
HAVEN.TO.ARMS:
     var LAST HAVEN.EXP.CHECK.3
     gosub AUTOMOVE noel
HAVEN.ARMS:
     var RETRY HAVEN.ARMS
     var shopcode RH.Arms
     var SHOP Noel's Arms
     gosub STEAL %RH.Arms
HAVEN.EXP.CHECK.3:
     if $Thievery.Ranks >= 650 then goto HAVEN.EXP.CHECK.4
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.PAWN.HAVEN
HAVEN.TO.GENERAL:
     var LAST HAVEN.EXP.CHECK.4
     gosub AUTOMOVE general
HAVEN.GENERAL:
     var RETRY HAVEN.GENERAL
     var shopcode RH.Gen
     var SHOP General Store
     gosub STEAL %RH.Gen
HAVEN.EXP.CHECK.4:
     if $Thievery.Ranks >= 600 then goto HAVEN.EXP.CHECK.5
HAVEN.TO.CLOTH:
     var LAST HAVEN.EXP.CHECK.5
     gosub AUTOMOVE cloth
HAVEN.CLOTH:
     var RETRY HAVEN.CLOTH
     var shopcode RH.Cloth
     var SHOP Clothiers
     gosub STEAL %RH.Cloth
HAVEN.EXP.CHECK.5:
     # if $Thievery.Ranks >= 1200 then goto HAVEN.TO.JOY
HAVEN.TO.ARTIFICER:
     var LAST HAVEN.EXP.CHECK.6
     gosub AUTOMOVE artif
HAVEN.ARTIFICER:
     var RETRY HAVEN.ARTIFICER
     var shopcode RH.Artif
     var SHOP Artificer
     gosub STEAL %RH.Artif
HAVEN.EXP.CHECK.6:
     if $Thievery.Ranks >= 138 then goto HAVEN.EXP.CHECK.7
HAVEN.TO.LOCKSMITH:
     var LAST HAVEN.EXP.CHECK.7
     gosub AUTOMOVE locks
HAVEN.LOCKSMITH:
     var RETRY HAVEN.LOCKSMITH
     var shopcode RH.Lock
     var SHOP Locksmith
     gosub STEAL %RH.Lock
HAVEN.EXP.CHECK.7:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.PAWN.HAVEN
     if $Thievery.Ranks >= 414 then goto HAVEN.EXP.CHECK.8
HAVEN.TO.JOY:
     var LAST HAVEN.TO.JOY2
     gosub AUTOMOVE smara
HAVEN.JOY:
     var RETRY HAVEN.JOY
     var shopcode RH.Joy
     var SHOP Joy
     gosub STEAL %RH.Joy
HAVEN.TO.JOY2:
     var LAST HAVEN.EXP.CHECK.8
     gosub AUTOMOVE 167
HAVEN.JOY2:
     var RETRY HAVEN.JOY2
     var shopcode RH.Joy2
     var SHOP Joy
     gosub STEAL %RH.Joy2
     gosub MOVE out
     pause 0.5
HAVEN.EXP.CHECK.8:
     if $Thievery.Ranks >= 238 then goto HAVEN.TO.MIRG
HAVEN.TIME.0:
     gosub TIME.CHECK
     if ("%TIME" = "DAY") then goto HAVEN.TO.SMOKE
     goto HAVEN.TO.MIRG
HAVEN.TO.SMOKE:
     var LAST HAVEN.TO.MIRG
     gosub AUTOMOVE 42
     send kneel
     send go shop
HAVEN.SMOKE:
     var RETRY HAVEN.SMOKE
     var shopcode RH.Smoke
     var SHOP Smoke
     gosub STEAL %RH.Smoke
     send out
     pause
     gosub STAND
     gosub HIDE
HAVEN.TO.MIRG:
     var LAST HAVEN.TO.WEAPON
     gosub AUTOMOVE jewel
HAVEN.MIRG:
     var RETRY HAVEN.MIRG
     var shopcode RH.Mirg
     var SHOP Goldsmiths
     gosub STEAL %RH.Mirg
HAVEN.EXP.CHECK.9:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.PAWN.HAVEN
HAVEN.TO.WEAPON:
     var LAST HAVEN.TO.BARD
     gosub AUTOMOVE weapon
HAVEN.WEAPON:
     var RETRY HAVEN.WEAPON
     var shopcode RH.Weap
     var SHOP Weapon
     gosub STEAL %RH.Weap
HAVEN.TO.BARD:
     var LAST HAVEN.TO.BARD2
     gosub AUTOMOVE bard
HAVEN.BARD:
     var RETRY HAVEN.BARD
     var shopcode RH.Bard
     var SHOP Bard
     gosub STEAL %RH.Bard
HAVEN.TO.BARD2:
     var LAST HAVEN.EXP.CHECK.10
     gosub AUTOMOVE bard
     gosub MOVE go curt
HAVEN.BARD2:
     var RETRY HAVEN.BARD2
     var shopcode RH.Bard2
     var SHOP Bard2
     gosub STEAL %RH.Bard2
HAVEN.EXP.CHECK.10:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.PAWN.HAVEN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.PAWN.HAVEN
HAVEN.TO.IRON:
     var LAST HAVEN.TO.CLERIC
     gosub AUTOMOVE iron
HAVEN.IRONWORKS:
     var RETRY HAVEN.IRONWORKS
     var shopcode RH.Iron
     var SHOP Ironworks
     gosub STEAL %RH.Iron
HAVEN.TO.CLERIC:
     var LAST HAVEN.TO.CLERIC2
     gosub AUTOMOVE cleric shop
HAVEN.EXP.CHECK.11:
     if $Thievery.Ranks >= 465 then goto HAVEN.TO.CLERIC2
HAVEN.CLERIC:
     var RETRY HAVEN.CLERIC
     var shopcode RH.Cleric
     var SHOP Cleric
     gosub STEAL %RH.Cleric
HAVEN.TO.CLERIC2:
     var LAST GO.PAWN.HAVEN
     if !matchre("$Guild","(Thief|Empath|Cleric)") then goto GO.PAWN.HAVEN
     gosub MOVE go curt
HAVEN.CLERIC2:
     var RETRY HAVEN.CLERIC2
     var shopcode RH.Cleric2
     var SHOP Cleric2
     gosub STEAL %RH.Cleric2
GO.PAWN.HAVEN:
     var CURRENT_CITY RIVERHAVEN
     var LAST GO.PAWN.HAVEN
     if (toupper("%PAWN") = "OFF") then goto HAVEN.TO.BANK
     gosub AUTOMOVE PAWN
     pause 0.5
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub PAWN.GOODS
HAVEN.TO.BANK:
     var LAST HAVEN.TO.BANK
     #if ("$Guild" = "Thief") then send khri stop
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto DONE.STEALING.HAVEN
                    }
          goto HAVEN.TELLER
          }
     if ("%PREMIUM" = "ON") && ("%EXCHANGE" = "ON") then goto HAVEN.PREMIUM
     if (toupper("%EXCHANGE") != "ON") then goto HAVEN.TELLER
     gosub AUTOMOVE exchange
     gosub LIRUMS
     goto HAVEN.TELLER
HAVEN.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
HAVEN.TELLER:
     gosub AUTOMOVE teller
     var Banked 1
     gosub BANK
     if ("$Guild" = "Thief") then gosub PUT with 4 silver
     gosub MOVE go arch
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub MOVE out
     if ("$Guild" != "Thief") then goto DONE.STEALING.HAVEN
     if (toupper("%BIN") = "OFF") then goto DONE.STEALING.HAVEN
GO.BIN.HAVEN:
HAVEN.GO.BIN:
HAVEN.FIND.GUILD:
     var LAST HAVEN.FIND.GUILD
     var BIN_HAVEN 0
     match hole1 selling off some stolen goods
     match hole2 Crescent Way
     match hole3 Silvermoon Road
     match hole4 the boss is with his own kind
     match hole5 cooped up
     match hole6 around the rookery
     matchre NO.CONTACTS Apparently there are too many eyes on you|USAGE|walks off|look of disgust
     send contact guild
     matchwait 15
     goto NO.CONTACTS
NO.CONTACTS:
     var HAVEN_LOCATION LOST
hole1:
     var LAST hole1
     gosub AUTOMOVE 33
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE climb stair
     gosub MOVE ne
     gosub MOVE go corner
athole1:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE sw
     send climb stair
     pause 0.5
     send go door
     pause 0.5
     if ("%HAVEN_LOCATION" = "LOST") && ("%BIN_HAVEN" = "0") then goto hole2
     goto HAVEN.DONE.ASSESS
hole2:
     var LAST hole2
     gosub AUTOMOVE 47
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub PUT look shadow
     gosub PUT search shadow
     pause 0.5
     gosub MOVE go open
     gosub MOVE go cor
athole2:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE out
     gosub MOVE go door
     if ("%HAVEN_LOCATION" = "LOST") && ("%BIN_HAVEN" = "0") then goto hole3
     goto HAVEN.DONE.ASSESS
hole3:
     var LAST hole3
     gosub AUTOMOVE 36
     gosub SEARCH
     pause $roundtime
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub PUT look floor
     gosub MOVE go door
     gosub MOVE go cor
athole3:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     send climb door
     pause 0.5
     gosub MOVE out
     if ("%HAVEN_LOCATION" = "LOST") && ("%BIN_HAVEN" = "0") then goto hole4
     goto HAVEN.DONE.ASSESS
hole4:
     var LAST hole4
     gosub AUTOMOVE 302
     gosub SEARCH
     pause $roundtime
     gosub PUT knock grat
     gosub PUT whisper grat %HAVEN_PW
     gosub MOVE go door
     gosub MOVE ne
     gosub MOVE go nook
athole4:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE sw
     gosub MOVE go door
     gosub MOVE go grate
     gosub MOVE out
     if ("%HAVEN_LOCATION" = "LOST") && ("%BIN_HAVEN" = "0") then goto hole5
     goto HAVEN.DONE.ASSESS
hole5:
     var LAST hole5
     gosub AUTOMOVE 41
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE n
     gosub MOVE go corn
athole5:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE s
     gosub MOVE go door
     if ("%HAVEN_LOCATION" = "LOST") && ("%BIN_HAVEN" = "0") then goto hole6
     goto HAVEN.DONE.ASSESS
hole6:
     var LAST hole6
     gosub AUTOMOVE 305
     gosub SEARCH
     pause $roundtime
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE go arch
     gosub MOVE climb stair
     gosub MOVE go corner
athole6:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
               var BIN_HAVEN 1
               gosub BIN.GOODS
               gosub CIRCLE.CHECK
          }
     gosub MOVE out
     gosub MOVE climb stair
     gosub MOVE go arch
     gosub MOVE go door
     goto HAVEN.DONE.ASSESS
HAVEN.DONE.ASSESS:
     var LAST HAVEN.DONE.ASSESS
     math RunsCompleted add 1
     send exp
     waitforre ^EXP HELP for more information
DONE.STEALING.HAVEN:
     var LAST DONE.STEALING.HAVEN
     gosub AUTOMOVE town
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN)") && ("%RUN_FOREVER" = "ON") then goto TO.ARTHE
     if matchre("%CITY","(SHARD|HIB|LETH|HORSE)") && ("%RUN_FOREVER" = "ON") && ("%FAR_CITIES" = "ON") then goto TO.THEREN
     if ("%SINGLE_RUN" = "ON") || ($Thievery.LearningRate >= 32) || ("%EndEarly" = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(SHARD|CROSSING|HIB|LETH)") && ("%FAR_CITIES" != "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(SHARD|CROSSING|HIB|LETH)") && ("%FAR_CITIES" = "ON") then goto TO.THEREN
     if matchre("%CITY","(RIVERHAVEN|ROSSMAN|THEREN)") && ($Thievery.LearningRate < 32) then goto TO.ARTHE
     goto TO.ARTHE
############################################################################
## ZOLUREN STEALING SECTION (ARTHE / CROSSING / LETH  )                   ##
############################################################################
# ARTHE DALE
CROSSING.STEAL:
ARTHE.STEAL:
TO.ARTHE:
     var ARTHE ON
     var LAST TO.ARTHE
     if ("$zoneid" = "30") then 
          {
               send .%TRAVEL_SCRIPT arthe
               waitforre ^YOU ARRIVED\!
               pause 0.5
          }
     if ("$zoneid" = "1") then gosub AUTOMOVE NTR
ARTHE:
     if ($Thievery.Ranks < 40) then goto TO.CROSSING
     var CURRENT_CITY ARTHE
     var LAST CROSSING
     var PawnLoc GO.PAWN.CROSS
     gosub AUTOMOVE glaysker
     pause 0.5
     ECHO
     ECHO *** STEALING FROM ARTHE DALE!
     ECHO
     put #echo >Log LightCyan *** Stealing from Arthe Dale! ***
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
ARTHE.EXP.CHECK.0:
     if $Thievery.Ranks >= 460 then goto ARTHE.TO.ODDS
ARTHE.TO.PATTERN:
     var LAST ARTHE.TO.FASHION
     gosub AUTOMOVE embroid
ARTHE.THREADS:
     var RETRY ARTHE.THREADS
     var shopcode AD.Thread
     var SHOP Thread
     gosub STEAL %AD.Thread
ARTHE.TO.FASHION:
     var LAST ARTHE.TO.ODDS
     gosub AUTOMOVE clothing
ARTHE.FASHION:
     var RETRY ARTHE.FASHION
     var shopcode AD.Fash
     var SHOP Fashion
     gosub STEAL %AD.Fash
ARTHE.TO.ODDS:
     var LAST ARTHE.EXP.CHECK.1
     gosub AUTOMOVE Odds
ARTHE.ODDS:
     var RETRY ARTHE.ODDS
     var shopcode AD.Odds
     var SHOP Odds'n'Ends
     gosub STEAL %AD.Odds
     if $hidden then gosub unhide
     gosub MOVE out
ARTHE.EXP.CHECK.1:
     if $Thievery.Ranks >= 600 then goto ARTHE.TIME.0
ARTHE.TO.BARD:
     var LAST ARTHE.TIME.0
     gosub AUTOMOVE music
ARTHE.BARD:
     var RETRY ARTHE.BARD
     var shopcode AD.Bard
     var SHOP Bard
     gosub STEAL %AD.Bard
     gosub MOVE out
ARTHE.TIME.0:
     gosub TIME.CHECK
     if ("%TIME" = "NIGHT") then goto ARTHE.EXP.CHECK.2
ARTHE.TO.ARMOR:
     var LAST ARTHE.EXP.CHECK.2
     gosub AUTOMOVE Armor
ARTHE.ARMOR:
     var RETRY ARTHE.ARMOR
     var shopcode AD.Arm
     var SHOP Armor
     gosub STEAL %AD.Arm
ARTHE.EXP.CHECK.2:
     if $Thievery.Ranks >= 300 then goto ARTHE.TO.YULUGRI
ARTHE.TO.FETA:
     var LAST ARTHE.TO.YULUGRI
     gosub AUTOMOVE feta
ARTHE.FETA:
     var RETRY ARTHE.FETA
     var shopcode AD.Feta
     var itemLocation %AD.FETA.Loc
     var SHOP Feta's Kitchen
     gosub STEAL %AD.Feta
ARTHE.TO.YULUGRI:
     var LAST ARTHE.EXP.CHECK.3
     gosub AUTOMOVE Yulugri
ARTHE.YULUGRI:
     var RETRY ARTHE.YULUGRI
     var shopcode AD.Map
     var SHOP Yulugri
     gosub STEAL %AD.Map %AD.Map.Loc
ARTHE.EXP.CHECK.3:
     if $Thievery.Ranks >= 360 then goto LEAVE.ARTHE
ARTHE.TO.SMOKE:
     var LAST ARTHE.EXP.CHECK.4
     gosub AUTOMOVE smoking
ARTHE.SMOKE:
     var RETRY ARTHE.SMOKE
     var shopcode AD.Smoke
     var SHOP Smoke
     gosub STEAL %AD.Smoke
ARTHE.EXP.CHECK.4:
     if $Thievery.Ranks >= 260 then goto LEAVE.ARTHE
     if $Thievery.Ranks >= 220 then goto ARTHE.EXP.CHECK.7
ARTHE.TO.TART:
     var LAST ARTHE.EXP.CHECK.5
     gosub AUTOMOVE 631
ARTHE.TART:
     var RETRY ARTHE.TART
     var shopcode AD.Tart.E
     var SHOP TART E
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.5:
     if $Thievery.Ranks >= 195 then goto ARTHE.EXP.CHECK.6
ARTHE.TO.TART.C:
     var LAST ARTHE.EXP.CHECK.6
     gosub AUTOMOVE 630
ARTHE.TART.C:
     var RETRY ARTHE.TART.C
     var shopcode AD.Tart.C
     var SHOP TART C
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.6:
     if $Thievery.Ranks >= 212 then goto ARTHE.EXP.CHECK.7
ARTHE.TO.TART.M:
     var LAST ARTHE.EXP.CHECK.7
     gosub AUTOMOVE 629
ARTHE.TART.M:
     var RETRY ARTHE.TART.M
     var shopcode AD.Tart.M
     var SHOP TART M
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.7:
     if $Thievery.Ranks >= 230 then goto LEAVE.ARTHE
ARTHE.TO.TART.L:
     var LAST ARTHE.EXP.CHECK.8
     gosub AUTOMOVE 628
ARTHE.TART.L:
     var RETRY ARTHE.TART.L
     var shopcode AD.Tart.L
     var SHOP TART L
     gosub STEAL %AD.Tart.E
ARTHE.EXP.CHECK.8:
     if $Thievery.Ranks >= 181 then goto LEAVE.ARTHE
ARTHE.TO.TART.F:
     gosub AUTOMOVE 627
ARTHE.TART.F:
     var RETRY ARTHE.TART.F
     var shopcode AD.Tart.F
     var SHOP TART F
     gosub STEAL %AD.Tart.E
LEAVE.ARTHE:
     var LAST ARTHE.EXP.CHECK.9
     if $hidden = 1 then gosub unhide
     pause 0.1
ARTHE.EXP.CHECK.9:
     if $Thievery.Ranks >= 890 then goto DONE.KAERNA
ARTHE.TO.KAERNA:
     var LAST DONE.KAERNA
     gosub AUTOMOVE grek
KAERNA.GENERAL:
     var RETRY KAERNA.GENERAL
     var shopcode KA.Grek
     var SHOP Kaerna General
     gosub STEAL %KA.Grek
DONE.KAERNA:
     var ARTHE OFF
     if $hidden = 1 then gosub unhide
     if ("$Guild" = "Thief") then
          {
               gosub KHRI.START meditate
          }
     pause 0.5
     goto TO.CROSSING
##################################
#### CROSSINGS
##################################
TO.CROSSING:
     gosub AUTOMOVE crossing
XING:
CROSS:
CROSSING:
CROSSINGS:
     var LAST CROSSINGS
     var CURRENT_CITY CROSSING
     var PawnLoc GO.PAWN.CROSS
     ECHO
     ECHO *** STEALING FROM CROSSING!
     ECHO
     put #echo >Log LightCyan *** Stealing from The Crossing! ***
     if matchre("$roomobjs","(town guard)") then put surrender guard
     pause 0.5
CROSSING.EXP.CHECK.0:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     pause 0.2
CROSSING.TO.SCRIPT:
     var CURRENT_CITY CROSSING
     var LAST CROSSING.EXP.CHECK.1
     gosub AUTOMOVE temple
     pause 0.5
     pause 0.5
     gosub AUTOMOVE 34
CROSSING.SCRIPTORIUM:
     var RETRY CROSSING.SCRIPTORIUM
     var shopcode C.Script
     var SHOP Scriptorium
     gosub STEAL %C.Script.Num %C.Script
     if $hidden then gosub unhide
     gosub AUTOMOVE cross
CROSSING.EXP.CHECK.1:
     if ("$zoneid" = "2a") then gosub AUTOMOVE cross
     if ($Thievery.Ranks >= 487) then goto CROSSING.EXP.CHECK.2
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.CARD:
     var LAST CROSSING.EXP.CHECK.2
     gosub AUTOMOVE Card shop
CROSSING.CARD:
     var RETRY CROSSING.CARD
     var shopcode C.Card
     var SHOP Card
     gosub STEAL %C.Card
CROSSING.EXP.CHECK.2:
     if ($Thievery.Ranks >= 400) then goto CROSSING.EXP.CHECK.3
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.CLOTHING:
     var LAST CROSSING.EXP.CHECK.3
     if ($Thievery.LearningRate > 32) then goto GO.CROSS.PAWN
     gosub AUTOMOVE clothing
CROSSING.CLOTHING:
     var RETRY CROSSING.CLOTHING
     var shopcode C.Stitch
     var SHOP Clothing
     gosub STEAL %C.Stitch
CROSSING.EXP.CHECK.3:
     if ($Thievery.Ranks >= 610) then goto CROSSING.TO.JEWELRY2
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.JEWELRY:
     var LAST CROSSING.EXP.CHECK.4
     gosub AUTOMOVE jewel
CROSSING.JEWELRY:
     var RETRY CROSSING.JEWELRY
     var shopcode C.Jewel
     var SHOP Jewelry
     gosub STEAL %C.Jewel
CROSSING.TO.JEWELRY2:
     var LAST CROSSING.TO.JEWELRY2
     gosub AUTOMOVE gems
CROSSING.JEWELRY2:
     var RETRY CROSSING.JEWELRY2
     var shopcode C.Jewel2
     var SHOP Jewelry Gemroom
     gosub STEAL %C.Jewel2
CROSSING.EXP.CHECK.4:
     if ($Thievery.Ranks >= 750) then goto CROSSING.EXP.CHECK.5
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.GENERAL:
     var LAST CROSSING.TO.GENERAL.STORAGE
     gosub AUTOMOVE berolt
CROSSING.GENERAL:
     var RETRY CROSSING.GENERAL
     var shopcode C.Gen
     var SHOP General Store
     gosub STEAL %C.Gen
CROSSING.TO.GENERAL.STORAGE:
     var LAST CROSSING.EXP.CHECK.5
     if ($Thievery.Ranks >= 420) then goto CROSSING.EXP.CHECK.5
     gosub AUTOMOVE general storage
CROSSING.GENERAL.STORAGE:
     var RETRY CROSSING.GENERAL.STORAGE
     var shopcode C.Gen.B
     var SHOP General Store (Storage)
     gosub STEAL %C.Gen.B
CROSSING.EXP.CHECK.5:
     if ($Thievery.Ranks >= 481) then goto CROSSING.EXP.CHECK.6
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.CLERIC:
     var LAST CROSSING.EXP.CHECK.6
     gosub AUTOMOVE duran
CROSSING.CLERIC:
     var RETRY CROSSING.CLERIC
     var shopcode C.Cler
     var SHOP Cleric
     gosub STEAL %C.Cler
CROSSING.EXP.CHECK.6:
     if matchre("$Guild","Cleric") && ($Thievery.Ranks >= 487) then goto CROSSING.TO.CLERIC2
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     goto CROSSING.EXP.CHECK.7
CROSSING.TO.CLERIC2:
     var LAST CROSSING.EXP.CHECK.7
     gosub AUTOMOVE 957
CROSSING.CLERIC2:
     var RETRY CROSSING.CLERIC2
     var shopcode C.Cler2
     var SHOP Cleric2
     gosub STEAL %C.Cler2
CROSSING.EXP.CHECK.7:
     if ($Thievery.Ranks >= 520) then goto CROSSING.TO.MUSIC
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.BATH:
     var LAST CROSSING.TO.LOCK
     gosub AUTOMOVE bathhouse
CROSSING.BATHHOUSE:
     var RETRY CROSSING.BATHHOUSE
     var shopcode C.Bath
     var SHOP Bathhouse
     var itemLocation %C.Bath.Loc
     gosub STEAL %C.Bath.Num %C.Bath
CROSSING.TO.LOCK:
     var itemLocation
     var LAST CROSSING.TO.MUSIC
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     if (($Thievery.Ranks >= 150) && ($Thievery.Ranks < 250)) then goto CROSSING.TO.MUSIC
     gosub AUTOMOVE locks
CROSSING.LOCKSMITH:
     var RETRY CROSSING.LOCKSMITH
     var shopcode C.Lock
     var SHOP Locksmith
     gosub STEAL %C.Lock
CROSSING.TO.MUSIC:
     var LAST CROSSING.TO.ARMOR
     gosub AUTOMOVE Music
CROSSING.EXP.CHECK.8:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     if ($Thievery.Ranks >= 600) then goto CROSSING.TO.MUSIC.BACKROOM
CROSSING.MUSIC:
     var RETRY CROSSING.MUSIC
     var shopcode C.Music
     var SHOP Music
     gosub STEAL %C.Music
CROSSING.TO.MUSIC.BACKROOM:
     var LAST CROSSING.TO.ARMOR
     if $hidden then gosub unhide
     gosub MOVE go curtain
CROSSING.MUSIC.BACKROOM:
     var RETRY CROSSING.MUSIC.BACKROOM
     var shopcode C.Music2
     var SHOP Music (backroom)
     var LAST CROSSING.TO.ARMOR
     gosub STEAL %C.Music2
     gosub MOVE go curtain
CROSSING.TO.ARMOR:
     var LAST CROSSING.TO.WEAPON
     gosub AUTOMOVE Armor
CROSSING.ARMOR:
     var RETRY CROSSING.ARMOR
     var shopcode C.Arm
     var SHOP Armor
     gosub STEAL %C.Arm
CROSSING.TO.WEAPON:
     var LAST CROSSING.EXP.CHECK.9
     gosub AUTOMOVE Weapon
CROSSING.WEAPON:
     var RETRY CROSSING.WEAPON
     var shopcode C.Weap
     var SHOP Weapon
     gosub STEAL %C.Weap
CROSSING.EXP.CHECK.9:
     if ($Thievery.Ranks >= 350) then goto CROSSING.EXP.CHECK.10
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.FLORIST:
     var LAST CROSSING.EXP.CHECK.10
     if ($Thievery.LearningRate > 52) then
          {
               if ($Thievery.LearningRate < 150) then goto CROSSING.EXP.CHECK.10
          }
     gosub AUTOMOVE Florist
CROSSING.FLORIST:
     var RETRY CROSSING.FLORIST
     var shopcode C.Flow
     var SHOP Florist
     gosub STEAL %C.Flow
CROSSING.EXP.CHECK.10:
     if ($Thievery.Ranks >= 300) then goto CROSSING.TO.EMPATH
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.SHOE:
     var LAST CROSSING.TO.EMPATH
     gosub AUTOMOVE Shoe
CROSSING.SHOES:
     var RETRY CROSSING.SHOES
     var shopcode C.Cobb
     var SHOP Shoe
     gosub STEAL %C.Cobb
CROSSING.TO.EMPATH:
     var LAST CROSSING.TO.EMPATH2
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     if !matchre("$Guild","(Thief|Empath)") then goto CROSSING.EXP.CHECK.11
     gosub AUTOMOVE Emmiline
CROSSING.EMPATH:
     var RETRY CROSSING.EMPATH
     var shopcode C.Empath
     var SHOP Empath
     var SECOND_ITEM 1
     var secondary %C.Empath.Alt
     gosub STEAL %C.Empath
CROSSING.TO.EMPATH2:
     var LAST CROSSING.TO.EMPATH3
     gosub AUTOMOVE 480
CROSSING.EMPATH2:
     var RETRY CROSSING.EMPATH2
     var shopcode C.Empath2
     var SHOP Empath 2
     gosub STEAL %C.Empath2
CROSSING.TO.EMPATH3:
     var LAST CROSSING.EXP.CHECK.11
     gosub AUTOMOVE 482
CROSSING.EMPATH3:
     var RETRY CROSSING.EMPATH3
     var shopcode C.Empath3
     var SHOP Empath 3
     var SECOND_ITEM 1
     var itemLocation %C.Empath3.Loc
     var secondary %C.Empath3.Alt
     gosub STEAL %C.Empath3
CROSSING.EXP.CHECK.11:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
     if ($Thievery.Ranks >= 340) then goto CROSSING.TO.ALCHEMY
CROSSING.TO.HERBS:
     var LAST CROSSING.TO.ALCHEMY
     gosub AUTOMOVE Herb
CROSSING.HERBS:
     var RETRY CROSSING.HERBS
     var shopcode C.Herb
     var SHOP Herb
     gosub STEAL %C.Herb
CROSSING.TO.ALCHEMY:
     #if ($Thievery.Ranks >= 1050) then goto CROSSING.EXP.CHECK.12
     var LAST CROSSING.EXP.CHECK.12
     gosub AUTOMOVE Chizil
CROSSING.ALCHEMY:
     var RETRY CROSSING.ALCHEMY
     var shopcode C.Alch
     var itemLocation %C.Alch.Loc
     var SHOP Alchemy
     gosub STEAL %C.Alch
CROSSING.TO.GROCER:
     if ($Thievery.Ranks >= 50) then goto CROSSING.EXP.CHECK.12
     var LAST CROSSING.EXP.CHECK.12
     gosub AUTOMOVE grocer
CROSSING.GROCER:
     var RETRY CROSSING.GROCER
     var shopcode C.Grocer
     var SHOP Grocery
     gosub STEAL %C.Grocer
CROSSING.EXP.CHECK.12:
     if ($Thievery.Ranks >= 640) then goto CROSSING.EXP.CHECK.13
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.TANNER:
     var LAST CROSSING.EXP.CHECK.13
     if $hidden then gosub unhide
     gosub AUTOMOVE tanner
CROSSING.TANNER:
     var RETRY CROSSING.TANNER
     var shopcode C.Tann
     var SHOP Tanner
     var itemLocation %C.Tann.Loc
     gosub STEAL %C.Tann
CROSSING.EXP.CHECK.13:
     if ($Thievery.Ranks >= 670) then goto CROSSING.TO.ARTIFICE
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto GO.CROSS.PAWN
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto GO.CROSS.PAWN
CROSSING.TO.HABER:
     var LAST CROSSING.TO.ARTIFICE
     gosub AUTOMOVE haber
CROSSING.HABERDASHERY:
     var RETRY CROSSING.HABERDASHERY
     var shopcode C.Haber
     var SHOP Haberdashery
     gosub STEAL %C.Haber
CROSSING.TO.ARTIFICE:
     var LAST GO.CROSS.PAWN
     #if $Thievery.Ranks >= 975 then goto GO.CROSS.PAWN
     gosub AUTOMOVE magic
CROSSING.ARTIFICER:
     var RETRY CROSSING.ARTIFICER
     var shopcode C.Artif
     var SHOP Artificer
     gosub STEAL %C.Artif
GO.PAWN.CROSS:
GO.CROSS.PAWN:
     var CURRENT_CITY CROSSING
     var LAST GO.CROSS.PAWN
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     if ("$zoneid" = "7") then gosub AUTOMOVE crossing
     if ("$zoneid" = "1") then gosub AUTOMOVE 152
     if (toupper("%PAWN") = "OFF") then goto GO.CROSS.BIN
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
### OLD OBSOLETE SAND SPIT METHOD TO THIEF GUILD - Accounts for both Prime and TF room differences
     #gosub AUTOMOVE sand spit tavern
     #gosub MOVE go back area
     #gosub MOVE climb ladder
     #if matchre("$roomobjs" , "^You also see a witchclaw door with a large stone archway, a dark yew door, some old barrels, a rickety ladder and an old barrel with a thieves guild sign carved into the side") then
     #     {
     #          gosub MOVE go other barrel
     #          goto GO.BIN.CONT
     #     }
     #if matchre("$roomobjs" , "^You also see some old barrels") then
     #     {
     #          gosub MOVE go other barrel
     #          goto GO.BIN.CONT
     #     }
     #if matchre("$roomobjs" , "^You also see an old barrel with a thieves guild sign") then
     #     {
     #          gosub MOVE go barrel
     #          goto GO.BIN.CONT
     #     }
GO.CROSS.BIN:
     var LAST GO.CROSS.BIN
     if ("$Guild" != "Thief") then goto GO.CROSS.BANK
     if (toupper("%BIN") = "OFF") then goto GO.CROSS.BANK
     gosub AUTOMOVE 72
     gosub AUTOMOVE 549
     gosub PUT tap knocker
     pause 0.5
CROSS.BIN:
     gosub AUTOMOVE bin
     gosub BIN.GOODS
DONE.BIN.CROSS:
     var LAST DONE.BIN.CROSS
     gosub MOVE go door
     gosub CIRCLE.CHECK
     pause 0.5
     gosub MOVE go door
# Leaving the THIEF GUILD
GO.CROSS.BANK:
     var LAST GO.CROSS.BANK
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto CROSSING.DECIDE
                    }
          goto CROSS.TELLER
          }
     if ((toupper("%PREMIUM") = "ON") && (toupper("%EXCHANGE") = "ON")) then goto CROSS.PREMIUM
     if (toupper("%EXCHANGE") != "ON") then goto CROSS.TELLER
     gosub AUTOMOVE exchange
     gosub KRONARS
     goto CROSS.TELLER
CROSS.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub KRONARS
CROSS.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     send with 10 silver
     gosub MOVE out
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub MOVE out
CROSSING.DECIDE:
     if ("$roomid" != "42") then gosub AUTOMOVE 42
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN)") && ("%RUN_FOREVER" = "ON") then goto TO.LETH
     if matchre("%CITY","(SHARD|HIB|LETH|HORSE)") && ("%RUN_FOREVER" = "ON") then goto TO.RIVERHAVEN
     if (toupper("%SINGLE_RUN") = "ON") || ($Thievery.LearningRate >= 32) || (toupper("%EndEarly") = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(SHARD|CROSSING|HIB|LETH)") && ($Thievery.LearningRate < 32) && ("%FAR_CITIES" = "ON") then goto TO.RIVERHAVEN
     if matchre("%CITY","(RIVERHAVEN|ROSSMAN|THEREN)") && ($Thievery.LearningRate < 32) && ("%FAR_CITIES" = "ON") then goto TO.LETH
     goto TO.LETH
#####################################
## LETH DERIEL
#####################################
TO.LETH:
     pause 0.5
     send .%TRAVEL_SCRIPT leth
     waitforre ^YOU ARRIVED\!
LETH.STEAL:
     var LAST LETH.STEAL
     var CURRENT_CITY LETH
     var PawnLoc GO.PAWN.LETH
     if matchre("$roomobjs","(Elven Warden)") then put surrender warden
     pause 0.5
     ECHO
     ECHO *** STEALING FROM LETH DERIEL!
     ECHO
     put #echo >Log LightCyan *** Stealing from Leth Deriel! ***
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
LETH.EXP.CHECK.0:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto DONE.STEALING.LETH
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto DONE.STEALING.LETH
     if ($Thievery.Ranks >= 500) then goto LETH.TO.BOWYER
LETH.TO.SKIN:
     var LAST LETH.TO.BOWYER
     gosub AUTOMOVE morik
LETH.SKIN:
     var RETRY LETH.SKIN
     var shopcode L.Skin
     var SHOP Skin
     gosub STEAL %L.Skin
LETH.TO.BOWYER:
     var LAST LETH.TO.ORIGAMI
     gosub AUTOMOVE Bow
LETH.BOWYER:
     var RETRY LETH.BOWYER
     var shopcode L.Bow
     var SHOP Bowyer
     gosub STEAL %L.Bow
LETH.TO.ORIGAMI:
     var LAST LETH.EXP.CHECK.1
     gosub AUTOMOVE Origami
LETH.ORIGAMI:
     var RETRY LETH.ORIGAMI
     var shopcode L.Orig
     var SHOP Origami
     gosub STEAL %L.Orig.Num %L.Orig
LETH.EXP.CHECK.1:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto DONE.STEALING.LETH
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto DONE.STEALING.LETH
     if ($Thievery.Ranks > 400) then goto LETH.TO.WEAPON
     goto LETH.EXP.CHECK.2
LETH.TO.WEAPON:
     var LAST LETH.EXP.CHECK.2
     if $hidden then gosub unhide
     gosub AUTOMOVE weapon
LETH.WEAPON:
     var RETRY LETH.WEAPON
     var shopcode L.Weap
     var SHOP Weapon
     gosub STEAL %L.Weap
LETH.EXP.CHECK.2:
     if $Thievery.Ranks >= 487 then goto LETH.TO.BARD2
LETH.TO.WICKER:
     var LAST LETH.EXP.CHECK.3
     gosub AUTOMOVE Wicker
LETH.WICKER:
     var RETRY LETH.WICKER
     var shopcode L.Wick
     var SHOP Wicker
     gosub STEAL %L.Wick
LETH.EXP.CHECK.3:
     if ($Thievery.Ranks >= 300) then goto LETH.TO.BARD2
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto DONE.STEALING.LETH
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto DONE.STEALING.LETH
LETH.TO.BARD:
     var LAST LETH.TO.BARD2
     gosub AUTOMOVE music
LETH.BARD:
     var RETRY LETH.BARD
     var shopcode L.Bard
     var SHOP Bard
     gosub STEAL %L.Bard
LETH.TO.BARD2:
     var LAST LETH.EXP.CHECK.4
     if ($Thievery.Ranks > 980) then goto LETH.EXP.CHECK.4
     gosub AUTOMOVE siny
LETH.BARD2:
     var RETRY LETH.BARD2
     var shopcode L.Bard2
     var SHOP Bard2
     gosub STEAL %L.Bard2
LETH.EXP.CHECK.4:
     if ($Thievery.LearningRate > 32) then goto DONE.STEALING.LETH
     if ($Thievery.Ranks >= 700) then goto LETH.TO.WOOD
LETH.TO.CLOTHES:
     var LAST LETH.TO.WOOD
     gosub AUTOMOVE Clothing
LETH.CLOTHES:
     var RETRY LETH.CLOTHES
     var shopcode L.Cloth
     var SHOP Clothes
     gosub STEAL %L.Cloth
     if $hidden then gosub unhide
LETH.TO.WOOD:
     var LAST LETH.TO.GENERAL
     if $hidden then gosub unhide
     gosub AUTOMOVE wood
LETH.WOOD:
     var RETRY LETH.WOOD
     var shopcode L.Wood
     var SHOP Wood
     gosub STEAL %L.Wood
LETH.TO.GENERAL:
     var LAST LETH.EXP.CHECK.5
     gosub AUTOMOVE General
LETH.GENERAL:
     var RETRY LETH.GENERAL
     var shopcode L.Gen
     var SHOP General Store
     var SECOND_ITEM 1
     var secondary %L.Gen.Alt
     gosub STEAL %L.Gen
LETH.EXP.CHECK.5:
     if ($Thievery.LearningRate > 32) && ("%STEALTH" != "ON") then goto DONE.STEALING.LETH
     if ($Thievery.LearningRate > 32) && ($Stealth.LearningRate > 32) then goto DONE.STEALING.LETH
     if ($Thievery.Ranks >= 465) then goto DONE.STEALING.LETH
LETH.TO.PERFUME:
     var LAST DONE.STEALING.LETH
     gosub AUTOMOVE Perfume
LETH.PERFUME:
     var RETRY LETH.PERFUME
     var shopcode L.Perf
     var SHOP Perfume
     gosub STEAL %L.Perf
DONE.STEALING.LETH:
LETH.BANK:
     var LAST LETH.BANK
     if (toupper("%EXCHANGE") != "ON") then goto LETH.TELLER
     gosub AUTOMOVE exchange
     gosub KRONARS
LETH.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     gosub PUT withdraw 3 silver
GO.PAWN.LETH:
GO.LETH.PAWN:
     var CURRENT_CITY LETH
     var LAST GO.LETH.PAWN
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     if ("$zoneid" = "61") then
           {
                gosub AUTOMOVE portal
                send .%TRAVEL_SCRIPT crossing
                waitforre ^YOU ARRIVED\!
           }
     pause 0.5
     if (toupper("%PAWN") = "OFF") then goto GO.LETH.BIN
     gosub AUTOMOVE PAWN
     gosub PAWN.GOODS
GO.LETH.BIN:
     var LAST GO.LETH.BIN
     if ("$Guild" != "Thief") then goto LETH.TO.XING.BANK
     if (toupper("%BIN") = "OFF") then goto LETH.TO.XING.BANK
     gosub AUTOMOVE 72
     gosub AUTOMOVE 549
     gosub PUT tap knocker
     pause 0.5
     gosub AUTOMOVE bin
     gosub BIN.GOODS
LETH.BIN:
     var LAST LETH.BIN
     # Leaving the THIEF GUILD
     gosub MOVE go door
     gosub CIRCLE.CHECK
     pause 0.5
     gosub MOVE go door
LETH.TO.XING.BANK:
     var LAST LETH.TO.XING.BANK
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto LETH.DECIDE
                    }
          goto LETH.TO.XING.TELLER
          }
     if ((toupper("%PREMIUM") = "ON") && (toupper("%EXCHANGE") = "ON")) then goto LETH.TO.XING.PREMIUM
     if (toupper("%EXCHANGE") != "ON") then goto LETH.TO.XING.TELLER
     gosub AUTOMOVE exchange
     gosub KRONARS
     goto LETH.TO.XING.TELLER
LETH.TO.XING.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub KRONARS
LETH.TO.XING.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
LETH.DECIDE:
     if (("$zoneid" = "1") && ("$roomid" != "42")) then gosub AUTOMOVE 42
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN)") && ("%RUN_FOREVER" = "ON") then goto TO.SHARD
     if matchre("%CITY","(SHARD|HIB|LETH|HORSE)") && ("%RUN_FOREVER" = "ON") then goto TO.ARTHE
     if (toupper("%SINGLE_RUN") = "ON") || ($Thievery.LearningRate >= 32) || ("%EndEarly") = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN|ARTHE)") && ($Thievery.LearningRate < 32) && ("%FAR_CITIES" = "ON") then goto TO.SHARD
     if matchre("%CITY","(SHARD|HIB|LETH|HORSE)") && ($Thievery.LearningRate < 32) && ("%FAR_CITIES" = "ON") then goto TO.ARTHE
     goto FINISHED.SCRIPT
############################################################################
## ILLITHI STEALING SECTION (SHARD / HIB / BOAR CLAN ETC                  ##
############################################################################
TO.SHARD:
     var LAST TO.SHARD
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.1
     if ("$zoneid" = 61) && ($roomid != 18) then gosub AUTOMOVE 18
     send .%TRAVEL_SCRIPT shard
     waitforre ^YOU ARRIVED\!
OUTSIDE.SHARD:
     var LAST OUTSIDE.SHARD
     if ("$zoneid" = "66") then gosub AUTOMOVE east
     pause 0.2
     if ("$zoneid" = "66") then send go gate
SHARD.STEAL:
SHARD.STEALING:
     var LAST SHARD.STEAL
     var CURRENT_CITY SHARD
     var PawnLoc GO.PAWN.SHARD
     var horsePawn 0
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     ECHO
     ECHO *** STEALING FROM SHARD!
     ECHO
     put #echo >Log LightCyan *** Stealing from Shard! ***
     pause 0.5
     gosub TIME.CHECK
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then
          {
               put #echo >Log Yellow *** Night time in Shard, many shops closed. Reduced stealing.
               put #echo >Log Yellow *** Become a Shard Citizen so you can steal from closed shops at night!
          }
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
SHARD.TO.GENERAL:
     var LAST SHARD.TIME.0
     gosub AUTOMOVE general
SHARD.GENERAL:
     var RETRY SHARD.GENERAL
     var shopcode S.Gen
     var SHOP General
     gosub STEAL %S.Gen
SHARD.TIME.0:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.TO.CLERIC
SHARD.TO.WEAPON:
     var LAST SHARD.EXP.CHECK.0
     gosub AUTOMOVE fiona
SHARD.WEAPON:
     var RETRY SHARD.WEAPON
     var shopcode S.Weap
     var SHOP Weapon
     gosub STEAL %S.Weap
SHARD.EXP.CHECK.0:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if $Thievery.Ranks >= 655 then goto SHARD.TO.CLERIC
SHARD.TO.CLOTHING:
     var LAST SHARD.TO.CLERIC
     gosub AUTOMOVE stitchery
SHARD.CLOTHING:
     var RETRY SHARD.CLOTHING
     var shopcode S.Stitch
     var SHOP Stitchery
     gosub STEAL %S.Stitch
SHARD.TO.CLERIC:
     var LAST SHARD.TO.ALCHEMIST
     if $Thievery.Ranks >= 400 then goto SHARD.TO.ALCHEMIST
     gosub AUTOMOVE cleric shop
SHARD.CLERIC:
     var RETRY SHARD.CLERIC
     var shopcode S.Cleric
     var SHOP Cleric
     gosub STEAL %S.Cleric
SHARD.TO.ALCHEMIST:
     if ($Thievery.Ranks >= 1050) then goto SHARD.EXP.CHECK.1
     var LAST SHARD.EXP.CHECK.1
     gosub AUTOMOVE zieq
SHARD.ALCHEMIST:
     var RETRY SHARD.ALCHEMIST
     var shopcode S.Alch
     var SHOP Alchemist
     gosub STEAL %S.Alch
SHARD.EXP.CHECK.1:
     if $Thievery.Ranks >= 334 then goto SHARD.TIME.1
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
SHARD.TO.HERB:
     var LAST SHARD.TIME.1
     gosub AUTOMOVE herb
SHARD.HERB:
     var RETRY SHARD.HERB
     var shopcode S.Herb
     var SHOP Herb
     gosub STEAL %S.Herb
     gosub MOVE out
SHARD.TIME.1:
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.TO.REED
SHARD.TO.ARTIFICER:
     var LAST SHARD.TIME.2
     gosub AUTOMOVE magic
SHARD.ARTIFICER:
     var RETRY SHARD.ARTIFICER
     var shopcode S.Artif
     var SHOP Artificer
     gosub STEAL %S.Artif
     send out
     wait
     pause 0.5
     pause 0.5
SHARD.TIME.2:
     pause 0.0001
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.TO.ARMORY
SHARD.TO.MUSIC:
     var LAST SHARD.TO.LOCK
     gosub AUTOMOVE music
SHARD.MUSIC:
     var RETRY SHARD.MUSIC
     var shopcode S.Music
     var SHOP Music
     gosub STEAL %S.Music
SHARD.TO.LOCK:
     var LAST SHARD.TIME.3
     if ($invisible = 1) then gosub stopinvis
     pause 0.1
     if ($invisible = 1) then gosub stopinvis
     gosub AUTOMOVE music
     pause 0.1
     gosub PUT ask malik about thieves
     gosub PUT order pick
     gosub PUT offer 999999999
     gosub PUT offer 999999999
     pause 0.5
     pause 0.0001
     pause 0.0001
     pause 0.0001
     gosub STAND
SHARD.LOCK:
     var RETRY SHARD.LOCK
     var shopcode S.Lock
     var SHOP Lockpick
     gosub STEAL %S.Lock
SHARD.TIME.3:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.TO.REED
SHARD.TO.ARMORY:
     pause 0.1
     var LAST SHARD.TO.REED
     gosub AUTOMOVE armor
SHARD.ARMORY:
     var RETRY SHARD.ARMORY
     var shopcode S.Armor
     var SHOP Armory
     gosub STEAL %S.Armor
SHARD.TO.REED:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     var LAST SHARD.TO.SCHOLAR
     gosub AUTOMOVE 593
SHARD.REED:
     var RETRY SHARD.REED
     var shopcode S.Reed
     var SHOP House of Floating Reed
     gosub STEAL %S.Reed.Num %S.Reed
SHARD.TO.SCHOLAR:
     var LAST SHARD.TIME.4
     gosub AUTOMOVE scholar
SHARD.SCHOLAR:
     var RETRY SHARD.SCHOLAR
     var shopcode S.Museum
     var SHOP Scholar's Museum Gift
     gosub STEAL %S.Museum
SHARD.TIME.4:
     var CURRENT_CITY SHARD
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.EXP.CHECK.2
SHARD.TO.BOWS:
     var LAST SHARD.EXP.CHECK.2
     gosub AUTOMOVE bows
SHARD.BOWS:
     var RETRY SHARD.BOWS
     var shopcode S.Bow
     var SHOP Bowyer
     gosub STEAL %S.Bow
     send out
     wait
     pause 0.5
     pause 0.1
SHARD.EXP.CHECK.2:
     if $Thievery.Ranks < 200 then goto SHARD.TO.COIN
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
SHARD.TO.SPIRE:
     var LAST SHARD.TO.COIN
     if ("%TIME" = "NIGHT") && (toupper("%SHARD_CITIZEN") != "YES") then goto SHARD.TO.COIN
     gosub AUTOMOVE spire
SHARD.SPIRE:
     var RETRY SHARD.SPIRE
     var shopcode S.Spire
     var SHOP Spires of Glory
     gosub STEAL %S.Spire
SHARD.TO.COIN:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ($Thievery.Ranks > 500) then goto SHARD.TO.TOKEN
     var LAST SHARD.TO.TOKEN
     gosub AUTOMOVE coin
SHARD.COIN:
     var RETRY SHARD.COIN
     var shopcode S.Coin
     var SHOP Coin of the Realm
     var itemLocation %S.Coin.Loc
     gosub STEAL %S.Coin
SHARD.TO.TOKEN:
     var LAST SHARD.TO.BARBER
     gosub AUTOMOVE token
SHARD.TOKEN:
     var RETRY SHARD.TOKEN
     var shopcode S.Token
     var SHOP Token Shop
     var itemLocation %S.Token.Loc
     gosub STEAL %S.Token
SHARD.TO.BARBER:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ($Thievery.Ranks > 950) then goto SHARD.TO.FRILLS
     var LAST SHARD.TO.FRILLS
     gosub AUTOMOVE barber
SHARD.BARBER:
     var RETRY SHARD.BARBER
     var shopcode S.Barber
     var SHOP Barber Shop
     gosub STEAL %S.Barber
SHARD.TO.FRILLS:
     if ($Thievery.Ranks >= 1050) then goto SHARD.TO.HERALDRY
     var LAST SHARD.TO.HERALDRY
     gosub AUTOMOVE Little
SHARD.FRILLS:
     var RETRY SHARD.FRILLS
     var shopcode S.Frill
     var SHOP Little Frills
     gosub STEAL %S.Frill
SHARD.TO.HERALDRY:
     var LAST SHARD.TO.GIFT
     gosub AUTOMOVE herald
SHARD.HERALDRY:
     var RETRY SHARD.HERALDRY
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     var shopcode S.Herald
     var SHOP Heraldry Shop
     var itemLocation %S.Herald.Loc
     gosub STEAL %S.Herald
SHARD.TO.TRAVEL:
     var LAST SHARD.TO.TOY
     gosub AUTOMOVE gift
SHARD.TRAVEL:
     var RETRY SHARD.TRAVEL
     var shopcode S.Travel
     var SHOP Travel Tours Gift Shop
     var itemLocation %S.Travel.Loc
     gosub STEAL %S.Travel.Num %S.Travel
SHARD.TO.TOY:
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if ($Thievery.Ranks >= 1050) then goto SHARD.TO.MEMORY
     var LAST SHARD.TO.MEMORY
     gosub AUTOMOVE toy
SHARD.TOY:
     var RETRY SHARD.TOY
     var shopcode S.Toy
     var SHOP Toy
     var itemLocation %S.Toy.Loc
     gosub STEAL %S.Toy
SHARD.TO.MEMORY:
     var LAST SHARD.TO.EASTGATE
     gosub AUTOMOVE 629
SHARD.MEMORY:
     var RETRY SHARD.MEMORY
     var shopcode S.Memory
     var SHOP Memories
     gosub STEAL %S.Memory.Num %S.Memory
SHARD.TO.EASTGATE:
     var LAST SHARD.TO.EASTGATE
     var CURRENT_CITY SHARD
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if $hidden then gosub unhide
     gosub AUTOMOVE East Gate
SHARD.EXP.CHECK.3:
     if ($Thievery.Ranks >= 600) then goto SHARD.TO.SURVIVAL
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
EASTGATE.TO.TANNER:
     gosub AUTOMOVE tanner
SHARD.TANNER:
     var RETRY SHARD.TANNER
     var shopcode S.Tanner
     var SHOP Tanner
     var itemLocation %S.Tanner.Loc
     gosub STEAL %S.Tanner
SHARD.TO.SURVIVAL:
     var LAST GO.PAWN.SHARD
     if ($Thievery.LearningRate > 32) then goto GO.PAWN.SHARD
     if $hidden then gosub unhide
     gosub AUTOMOVE survival
SHARD.SURVIVAL:
     var RETRY SHARD.SURVIVAL
     var shopcode S.Surv
     var SHOP Survivalist
     var itemLocation %S.Surv.Loc
     var SECOND_ITEM 1
     var secondary %S.Surv.Alt
     var secondaryLocation %S.Surv.Alt.Loc
     gosub STEAL %S.Surv
SHARD.TO.SURVIVAL2:
     gosub AUTOMOVE 33
SHARD.SURVIVAL2:
     var RETRY SHARD.SURVIVAL2
     var shopcode S.Surv2
     var SHOP Survivalist (Back)
     var itemLocation %S.Surv2.Loc
     var SECOND_ITEM 1
     var secondary %S.Surv2.Alt
     gosub STEAL %S.Surv2.Num %S.Surv2
     goto DONE.STEAL.SHARD
TO.STEELCLAW.WEAPON:
     if $hidden then gosub unhide
     pause 0.5
     gosub AUTOMOVE struan
STEELCLAW.WEAPON:
     var RETRY STEELCLAW.WEAPON
     var shopcode SC.Weap
     var SHOP SC Weapons
     gosub STEAL %SC.Weap
DONE.STEAL.SHARD:
     var LAST GO.PAWN.SHARD
     var CURRENT_CITY SHARD
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE East
GO.PAWN.SHARD:
     var LAST GO.PAWN.SHARD
     if ("$zoneid" = "66") then gosub automove east
     if (toupper("%PAWN") = "OFF") then goto GO.BIN.SHARD
     gosub AUTOMOVE PAWN
     gosub PAWN.GOODS
GO.BIN.SHARD:
     var LAST GO.BIN.SHARD
     if ("$Guild" != "Thief") then goto SHARD.TO.BANK
     if (toupper("%BIN") = "OFF") then goto SHARD.TO.BANK
     gosub AUTOMOVE 93
     gosub MOVE go well
     gosub MOVE climb ladder
     gosub MOVE w
     gosub MOVE out
     gosub MOVE w
     gosub MOVE se
     gosub MOVE go gap
     send knock door
     wait
     pause 0.5
     pause 0.2
     send '%SHARD_PW
     wait
     pause 0.5
     pause 0.2
     gosub MOVE go door
     gosub MOVE go arch
     gosub MOVE go door
AT.SHARD.BIN:
     gosub BIN.GOODS
DONE.STEALING.SHARD:
     var LAST DONE.STEALING.SHARD
     gosub CIRCLE.CHECK
     pause 0.5
     gosub MOVE go door
     gosub MOVE go arch
     gosub MOVE go door
     gosub MOVE n
     gosub MOVE nw
     gosub MOVE e
     gosub MOVE go fiss
     gosub MOVE e
     gosub MOVE climb ladder
     gosub MOVE up
     pause 0.1
SHARD.TO.BANK:
     var LAST SHARD.TO.BANK
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto DONE.SHARD
                    }
          goto SHARD.TELLER
          }
     if (toupper("%EXCHANGE") != "ON") then goto SHARD.TELLER
     gosub AUTOMOVE exchange
     gosub DOKORAS
SHARD.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
DONE.SHARD:
     if (%horsePawn = 1) && ($Thievery.LearningRate < 32) then goto SHARD.STEAL
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN)") && ("%RUN_FOREVER" = "ON") then goto TO.HORSE
     if matchre("%CITY","(SHARD|HIB|LETH|HORSE)") && ("%RUN_FOREVER" = "ON") then goto TO.LETH
     if ($Thievery.LearningRate >= 32) || ("%SINGLE_RUN" = "ON") || ("%EndEarly" = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(HIB|SHARD)") && ("%FAR_CITIES" != "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH)") && ("%FAR_CITIES" != "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH)") && ("%FAR_CITIES" = "ON") then goto TO.HORSE
SHARD.TO.CROSS:
     var LAST SHARD.TO.CROSS
     if ("%CITY" = "SHARD") || ("%CITY" = "HIB") then goto TO.LETH
TO.CROSS:
     var LAST TO.CROSS
     var BIN.CROSS 1
     pause 0.1
     send .%TRAVEL_SCRIPT cross
     waitforre ^YOU ARRIVED\!
     pause
     if ("%CITY" = "CROSSING") || ("%CITY" = "RIVERHAVEN") || ("%CITY" = "ROSSMAN") || ("%CITY" = "THEREN") then goto FINISHED.SCRIPT
     goto TO.ARTHE
TO.HORSE:
var LAST TO.HORSE
     var BIN.HIB 1
     if (toupper("%SHARD_CITIZEN") = "YES") then
          {
          gosub AUTOMOVE west
          gosub AUTOMOVE horse
          goto HORSE.STEAL
          }
     else gosub AUTOMOVE east
     gosub AUTOMOVE W Gate
####################################
# Horse Clan
####################################
HORSE.STEAL:
HORSE.TO.JAHTINIT:
     var CURRENT_CITY HORSE
     var LAST HORSE.STEAL
     var PawnLoc GO.PAWN.HORSE
     var itemLocation
     gosub AUTOMOVE horse
     ECHO
     ECHO **** STEALING FROM HORSE CLAN! ****
     ECHO *** TAKING ADVANTAGE OF NO JUSTICE SYSTEM!! ****
     ECHO *** MWAAHAHAHAHAHAHAHAHAHAHHAAAAAAA
     ECHO
     put #echo >Log LightCyan *** Stealing from Horse Clan! ***
     pause 3
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub AUTOMOVE jahtinit
HORSE.JAHTINIT:
     var RETRY HORSE.JAHTINIT
     var shopcode HC.JAHTINIT
     var SHOP Jahtinit's Corner
     gosub STEAL %HC.Jahtinit
HORSE.TO.FALCONER:
     if ($Thievery.LearningRate > 32) then goto HORSE.DECIDE
     var LAST HORSE.TO.YASNAH
     gosub AUTOMOVE falconer
HORSE.FALCONER:
     var RETRY HORSE.FALCONER
     var shopcode HC.FALCONER
     var SHOP Falconer's Chadir
     gosub STEAL %HC.Falconer.Num %HC.Falconer
HORSE.TO.YASNAH:
     var LAST HORSE.TO.BOWYER
     gosub AUTOMOVE yasnah
HORSE.YASNAH:
     var RETRY HORSE.YASNAH
     var shopcode HC.YASNAH
     var SHOP Yasnah's Cashmere
     gosub STEAL %HC.Yasnah
HORSE.TO.BOWYER:
     if ($Thievery.LearningRate > 32) then goto HORSE.DECIDE
     var LAST HORSE.TO.BOWYER2
     gosub AUTOMOVE bowyer
HORSE.BOWYER:
     var RETRY HORSE.BOWYER
     var shopcode HC.BOWYER
     var SHOP Bowyer
     gosub STEAL %HC.Bowyer
HORSE.TO.BOWYER2:
     if ($Thievery.LearningRate > 32) then goto HORSE.DECIDE
     var LAST HORSE.TO.EQUINE
     gosub AUTOMOVE 215
HORSE.BOWYER2:
     var RETRY HORSE.BOWYER2
     var shopcode HC.BOWYER2
     var SHOP Bowyer 2
     var itemLocation %HC.Bowyer2.Loc
     gosub STEAL %HC.Bowyer2
HORSE.TO.EQUINE:
     if ($Thievery.LearningRate > 32) then goto HORSE.DECIDE
     var LAST HORSE.TO.FELTERIE
     gosub AUTOMOVE 218
HORSE.EQUINE:
     var RETRY HORSE.EQUINE
     var shopcode HC.EQUINE
     var SHOP Ela's Equine Supplies
     gosub STEAL %HC.Equine
HORSE.TO.FELTERIE:
     if ($Thievery.LearningRate > 32) then goto HORSE.DECIDE
     var LAST HORSE.TO.FELTERIE2
     gosub AUTOMOVE anaylisse
HORSE.FELTERIE:
     var RETRY HORSE.FELTERIE
     var shopcode HC.FELTERIE
     var SHOP Anaylisse's Felterie
     gosub STEAL %HC.Felterie
HORSE.TO.FELTERIE2:
     var LAST HORSE.DECIDE
     gosub AUTOMOVE 220
HORSE.FELTERIE2:
     var RETRY HORSE.FELTERIE2
     var shopcode HC.Felterie2
     var SHOP Anaylisse's Felterie 2
     gosub STEAL %HC.Felterie2
HORSE.DECIDE:
     gosub AUTOMOVE 168
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH|SHARD)") && ("%RUN_FOREVER" = "ON") && ("%FAR_CITIES" = "ON") then goto TO.HIB
     if matchre("%CITY","(HIB|HORSE)") && ("%RUN_FOREVER" = "ON") then goto TO.SHARD.BIN
     if ($Thievery.LearningRate >= 32) || ("%SINGLE_RUN" = "ON") || ("%EndEarly" = "ON") then goto TO.SHARD.BIN
     if matchre("%CITY","(SHARD|CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH)") && ($Thievery.LearningRate < 32) && ("%FAR_CITIES" = "ON") then goto TO.HIB
     if matchre("%CITY","(SHARD|CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH)") && ("%FAR_CITIES" != "ON") then goto TO.SHARD.BIN
     if ("%CITY" = "HIB") || ("%CITY" = "HORSE") then goto TO.SHARD.BIN
TO.SHARD.BIN:
     var horsePawn 1
     if (toupper("%SHARD_CITIZEN") = "YES") then
          {
          gosub automove shard
          goto GO.PAWN.SHARD
          }
     gosub AUTOMOVE north
     gosub AUTOMOVE east
     goto GO.PAWN.SHARD
TO.HIB:
     pause 0.5
     send .%TRAVEL_SCRIPT hib
     waitforre ^YOU ARRIVED\!
####################################
# Hibarnhvidar
####################################
HIB.STEAL:
HIB.TO.SHIELD:
     var CURRENT_CITY HIB
     var LAST HIB.EXP.CHECK.0
     var PawnLoc GO.PAWN.HIB
     gosub AUTOMOVE 37
     ECHO
     ECHO **** STEALING FROM HIB! ****
     ECHO
     put #echo >Log LightCyan *** Stealing from Hib! ***
     pause 0.5
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     gosub KHRI
     pause 0.1
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     if ($Thievery.LearningRate > 32) then goto DONE.STEAL.HIB
     gosub AUTOMOVE shield
HIB.SHIELD:
     var RETRY HIB.SHIELD
     var shopcode H.Shield
     var SHOP Shield
     gosub STEAL %H.Shield %H.Shield.Loc
HIB.EXP.CHECK.0:
     if ($Thievery.LearningRate > 32) then goto DONE.STEAL.HIB
     if ($Thievery.Ranks < 650) then goto HIB.TO.TOGGERY
HIB.TO.JEWELRY:
     var LAST HIB.TO.TOGGERY
     gosub AUTOMOVE jewelry
HIB.JEWELRY:
     var RETRY HIB.JEWELRY
     var shopcode H.Jewel
     var SHOP Jewelry
     gosub STEAL %H.Jewel
HIB.TO.TOGGERY:
     var LAST HIB.TO.SUNDRIES
     gosub AUTOMOVE togger
HIB.TOGGERY:
     var RETRY HIB.TOGGERY
     var shopcode H.Tog
     var SHOP Toggery
     gosub STEAL %H.Tog.Num %H.Tog
HIB.TO.SUNDRIES:
     var LAST HIB.TO.LAMPS
     gosub AUTOMOVE general
HIB.SUNDRIES:
     var RETRY HIB.SUNDRIES
     var shopcode H.Sund
     var itemLocation %H.Sund.Loc
     var SHOP Sundries
     gosub STEAL %H.Sund
     gosub MOVE OUT
HIB.TO.LAMPS:
     var LAST HIB.EXP.CHECK.1
     gosub AUTOMOVE lamp
HIB.LAMPS:
     var RETRY HIB.LAMPS
     var shopcode H.Lamp
     var SHOP Lamps
     gosub STEAL %H.Lamp
HIB.EXP.CHECK.1:
     if ($Thievery.LearningRate > 32) then goto DONE.STEAL.HIB
     if $Thievery.Ranks >= 450 then goto HIB.TO.MUSIC
HIB.TO.HERBS:
     var LAST HIB.TO.MUSIC
     gosub AUTOMOVE herb
HIB.HERBS:
     var RETRY HIB.HERBS
     var shopcode H.Herb
     var SHOP Herbs
     gosub STEAL %H.Herb
HIB.TO.MUSIC:
     var LAST HIB.TO.ALCHEMY
     gosub AUTOMOVE music
HIB.MUSIC:
     var RETRY HIB.MUSIC
     var shopcode H.Music
     var SHOP Music Store
     gosub STEAL %H.Music
HIB.TO.ALCHEMY:
     var LAST HIB.EXP.CHECK.2
     gosub AUTOMOVE alchemy
HIB.ALCHEMY:
     var RETRY HIB.ALCHEMY
     var shopcode H.Alch
     var SHOP Alchemist
     gosub STEAL %H.Alch
HIB.EXP.CHECK.2:
     if ($Thievery.LearningRate > 32) then goto DONE.STEAL.HIB
     if $Thievery.Ranks >= 430 then goto DONE.STEAL.HIB
HIB.TO.FORGE:
     var LAST DONE.STEAL.HIB
     gosub AUTOMOVE forge
HIB.FORGE:
     var RETRY HIB.FORGE
     var shopcode H.Forge
     var SHOP Forge
     var itemLocation %H.Forge.Loc
     gosub STEAL %H.Forge
DONE.STEAL.HIB:
     var LAST GO.PAWN.HIB
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.5
GO.PAWN.HIB:
     var CURRENT_CITY HIB
     var LAST GO.PAWN.HIB
     if (toupper("%PAWN") = "OFF") then goto GO.BIN.HIB
     gosub AUTOMOVE PAWN
     gosub PAWN.GOODS
GO.BIN.HIB:
     var CURRENT_CITY HIB
     var LAST GO.BIN.HIB
     if ("$Guild" != "Thief") then goto HIB.TO.BANK
     if (toupper("%BIN") = "OFF") then goto HIB.TO.BANK
     gosub AUTOMOVE Thief bin
AT.HIB.BIN:
     gosub BIN.GOODS
HIB.TO.BANK:
     var LAST HIB.TO.BANK
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto HIB.DECIDE
                    }
          goto HIB.TELLER
          }
     if (toupper("%EXCHANGE") != "ON") then goto HIB.TELLER
     gosub AUTOMOVE 1exch
     gosub DOKORAS
HIB.TELLER:
     var LAST LEAVE.HIB
     gosub AUTOMOVE 1tell
     gosub BANK
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
HIB.DECIDE:
     if matchre("%CITY","(CROSSING|RIVERHAVEN|ROSSMAN|THEREN|LETH|SHARD)") && ("%RUN_FOREVER" = "ON") && ("%FAR_CITIES" = "ON") then goto FINISHED.SCRIPT
     if matchre("%CITY","(HIB)") && ("%RUN_FOREVER" = "ON") then goto LEAVE.HIB
     if ($Thievery.LearningRate >= 32) || ("%SINGLE_RUN" = "ON") || ("%EndEarly" = "ON") then goto FINISHED.SCRIPT
     if ("%CITY" = "THEREN") || ("%CITY" = "CROSSING") || ("%CITY" = "LETH") || ("%CITY" = "HAVEN") || ("%CITY" = "ARTHE") || ("%CITY" = "ROSSMAN") || ("%CITY" = "SHARD") then goto FINISHED.SCRIPT
LEAVE.HIB:
     var LAST LEAVE.HIB
     gosub AUTOMOVE 75
     gosub PUT open my %SAFE_CONTAINER
     pause 0.3
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     pause 0.5
     pause 0.5
     send .%TRAVEL_SCRIPT raven
     waitforre ^YOU ARRIVED\!
     pause 0.5
     gosub PUT close my %SAFE_CONTAINER
     pause 0.3
     pause 0.5
RAVEN.STEAL:
     var LAST RAVEN.EXP.CHECK.0
     gosub AUTOMOVE 179
RAVEN.GENERAL:
     var RETRY RAVEN.GENERAL
     var shopcode RP.Gen
     var SHOP Raven's Point General
     gosub STEAL %RP.Gen
RAVEN.EXP.CHECK.0:
     if ($Thievery.Ranks >= 530) then goto RETURN.TO.SHARD
RAVEN.TO.TOBACCO:
     var LAST RETURN.TO.SHARD
     gosub AUTOMOVE 144
RAVEN.TOBACCO:
     var RETRY RAVEN.TOBACCO
     var shopcode RP.Tobac
     var SHOP Raven's Point Tobacco
     gosub STEAL %RP.Tobac
RETURN.TO.SHARD:
HIB.TO.HORSE:
     var LAST HIB.TO.HORSE
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE 133
     send .%TRAVEL_SCRIPT horse
     waitforre ^YOU ARRIVED\!
     goto HORSE.STEAL
####################################
# RATHA STEALING
####################################
RATHA.STEAL:
     var CURRENT_CITY RATHA
     var PawnLoc GO.PAWN.RATHA
     ECHO
     ECHO **** STEALING FROM RATHA! ****
     ECHO
     put #echo >Log LightCyan *** Stealing from Ratha! ***
     pause 0.5
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
RATHA.EXP.CHECK.0:
     if ($Thievery.Ranks < 500) then goto RATHA.TO.GENERAL
RATHA.TO.BAIT:
     var LAST RATHA.TO.GENERAL
     gosub AUTOMOVE bait
RATHA.BAIT:
     var RETRY RATHA.BAIT
     var shopcode R.Bait
     var SHOP Bait Shop
     gosub STEAL %R.Bait
RATHA.TO.GENERAL:
     var LAST RATHA.TO.HERB
     gosub AUTOMOVE general
RATHA.GENERAL:
     var RETRY RATHA.GENERAL
     var shopcode R.Gen
     var SHOP General Store
     gosub STEAL %R.Gen
RATHA.TO.HERB:
     var LAST RATHA.TO.FORGE
     gosub AUTOMOVE herbalist
RATHA.HERB:
     var RETRY RATHA.HERB
     var shopcode R.Herb
     var SHOP Herbalist
     gosub STEAL %R.Herb
RATHA.TO.FORGE:
     var LAST RATHA.TO.TAILOR
     gosub AUTOMOVE weapon
RATHA.FORGE:
     var RETRY RATHA.FORGE
     var shopcode R.Forge
     var SHOP Krrikt'k's Forge
     gosub STEAL %R.Forge
     gosub MOVE OUT
RATHA.TO.TAILOR:
     var LAST RATHA.TO.LEATHER
     gosub AUTOMOVE tailor
RATHA.TAILOR:
     var RETRY RATHA.TAILOR
     var shopcode R.Tailor
     var SHOP Tailor
     gosub STEAL %R.Tailor
RATHA.TO.LEATHER:
     var LAST RATHA.TO.HAIR
     gosub AUTOMOVE leather
RATHA.LEATHER:
     var RETRY RATHA.GENERAL
     var shopcode R.Leather
     var SHOP Leather
     gosub STEAL %R.Leather
RATHA.EXP.CHECK.1:
     if ($Thievery.Ranks >= 206) then goto RATHA.TO.MUSIC
RATHA.TO.HAIR:
     var LAST RATHA.TO.MUSIC
     gosub AUTOMOVE hair
RATHA.HAIR:
     var RETRY RATHA.HAIR
     var shopcode R.Hair
     var SHOP Hair Care
     gosub STEAL %R.Hair
RATHA.TO.MUSIC:
     var LAST RATHA.TO.MAGIC
     gosub AUTOMOVE music
RATHA.MUSIC:
     var RETRY RATHA.MUSIC
     var shopcode R.Music
     var SHOP Music
     gosub STEAL %R.Music
RATHA.TO.MAGIC:
     var LAST RATHA.TO.ORIGAMI
     gosub AUTOMOVE magic
RATHA.MAGIC:
     var RETRY RATHA.MAGIC
     var shopcode R.Magic
     var SHOP Magic Supplies
     gosub STEAL %R.Magic
RATHA.TO.ORIGAMI:
     var LAST RATHA.TO.JEWELRY
     gosub AUTOMOVE origami
RATHA.ORIGAMI:
     var RETRY RATHA.ORIGAMI
     var shopcode R.Origami
     var SHOP Origami
     var itemLocation %R.Origami.Loc
     gosub STEAL %R.Origami
RATHA.TO.JEWELRY:
     var LAST RATHA.EXP.CHECK.2
     gosub AUTOMOVE jewelry
RATHA.JEWELRY:
     var RETRY RATHA.JEWELRY
     var shopcode R.Jewelry
     var SHOP Jewelry
     gosub STEAL %R.Jewelry
RATHA.EXP.CHECK.2:
     #if $Thievery.Ranks >= 430 then goto RATHA.TO.RING
RATHA.TO.CLERIC:
     var LAST RATHA.TO.CLERIC2
     gosub AUTOMOVE divine
RATHA.CLERIC:
     var RETRY RATHA.CLERIC
     var shopcode R.Cleric
     var SHOP Cleric
     gosub STEAL %R.Cleric
RATHA.TO.CLERIC2:
     var LAST RATHA.TO.RING
     gosub AUTOMOVE odds
RATHA.CLERIC2:
     var RETRY RATHA.CLERIC2
     var shopcode R.Cleric2
     var SHOP Cleric
     gosub STEAL %R.Cleric2
RATHA.TO.RING:
     var LAST GO.PAWN.RATHA
     gosub AUTOMOVE chabalu
RATHA.RING:
     var RETRY RATHA.RING
     var shopcode R.Ring
     var SHOP Ring
     gosub STEAL %R.Ring
GO.PAWN.RATHA:
GO.RATHA.PAWN:
     var CURRENT_CITY RATHA
     var LAST GO.RATHA.PAWN
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.5
     if (toupper("%PAWN") = "OFF") then goto GO.RATHA.BIN
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
GO.RATHA.BIN:
     var LAST GO.RATHA.BIN
     if ("$Guild" != "Thief") then goto DONE.STEALING.RATHA2
     if (toupper("%BIN") = "OFF") then goto DONE.STEALING.RATHA2
     gosub AUTOMOVE chabalu
     pause 0.5
     send ask chabalu about cellar
     wait
     pause 0.5
     gosub MOVE go trap door
     gosub MOVE go tunnel
     gosub MOVE west
     gosub AUTOMOVE GL Thief
     pause 0.5
     gosub BIN.GOODS
DONE.STEALING.RATHA:
     var LAST DONE.STEALING.RATHA
     # Leaving the THIEF GUILD
     gosub CIRCLE.CHECK
     pause
DONE.STEALING.RATHA2:
     var LAST DONE.STEALING.CROSS2
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto DONE.RATHA
                    }
          goto RATHA.TELLER
          }
     if ("%PREMIUM" = "ON") && ("%EXCHANGE" = "ON) then goto RATHA.PREMIUM
     if (toupper("%EXCHANGE") != "ON") then goto RATHA.TELLER
     gosub AUTOMOVE 1exchange
     gosub LIRUMS
     goto RATHA.TELLER
RATHA.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
RATHA.TELLER:
     gosub AUTOMOVE 1teller
     gosub BANK
     #send with 10 silver
DONE.RATHA:
RATHA.SURRENDER:
     #var LAST RATHA.SURRENDER
     #gosub AUTOMOVE 1guard
     #if matchre("$roomobjs","(high guard)") then put surrender guard
     #pause 0.5
     #pause 0.5
     #gosub AUTOMOVE 252
     goto FINISHED.SCRIPT

####################################
# AESRY STEALING
####################################
AESRY.STEAL:
AESRY.TO.HERB:
     var CURRENT_CITY AESRY
     var LAST AESRY.EXP.CHECK.0
     var PawnLoc GO.PAWN.AESRY
     ECHO
     ECHO **** STEALING FROM AESRY! ****
     ECHO
     put #echo >Log LightCyan *** Stealing from Aesry! ***
     pause 0.5
     gosub KHRI
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     gosub AUTOMOVE herb
AESRY.HERB:
     var RETRY AESRY.HERB
     var shopcode A.Herb
     var SHOP Herb
     gosub STEAL %A.Herb
AESRY.EXP.CHECK.0:
     if $Thievery.Ranks < 600 then goto AESRY.TO.CLOTHING
AESRY.TO.TANNER:
     var LAST AESRY.EXP.CHECK.1
     gosub AUTOMOVE tanning
AESRY.TANNER:
     var RETRY AESRY.TANNER
     var shopcode A.Tanner
     var SHOP Tanning Supplies
     gosub STEAL %A.Tanner
AESRY.EXP.CHECK.1:
     #if $Thievery.Ranks >= 700 then goto AESRY.TO.SCRIPT
AESRY.TO.CLOTHING:
     var LAST AESRY.TO.SCRIPT
     gosub AUTOMOVE clothing
AESRY.CLOTHING:
     var RETRY AESRY.CLOTHING
     var shopcode A.Clothing
     var SHOP Clothing
     gosub STEAL %A.Clothing
AESRY.TO.SCRIPT:
     var LAST AESRY.TO.CLERIC
     gosub AUTOMOVE script
AESRY.SCRIPT:
     var RETRY AESRY.SCRIPT
     var shopcode A.Script
     var SHOP Scriptorium
     gosub STEAL %A.Script
AESRY.TO.CLERIC:
     var LAST AESRY.TO.ORIGAMI
     gosub AUTOMOVE clerical
AESRY.CLERIC:
     var RETRY AESRY.CLERIC
     var shopcode A.Cleric
     var SHOP Clerical Supplies
     gosub STEAL %A.Cleric
AESRY.TO.ORIGAMI:
     var LAST AESRY.TO.JEWELRY
     gosub AUTOMOVE origami
AESRY.ORIGAMI:
     var RETRY AESRY.ORIGAMI
     var shopcode A.Origami
     var SHOP Origami
     gosub STEAL %A.Origami
AESRY.TO.JEWELRY:
     var LAST AESRY.TO.MAGIC
     gosub AUTOMOVE jewelry
AESRY.JEWELRY:
     var RETRY AESRY.JEWELRY
     var shopcode A.Jewelry
     var SHOP Jewelry
     gosub STEAL %A.Jewelry
AESRY.TO.MAGIC:
     var LAST AESRY.TO.SLINGS
     gosub AUTOMOVE magic
AESRY.MAGIC:
     var RETRY AESRY.MAGIC
     var shopcode A.Magic
     var SHOP Magic Supplies
     gosub STEAL %A.Magic
AESRY.TO.SLINGS:
     var LAST AESRY.TO.PUZZLE
     gosub AUTOMOVE bowyer
AESRY.SLINGS:
     var RETRY AESRY.SLINGS
     var shopcode A.Slings
     var SHOP Slings and Arrows
     gosub STEAL %A.Slings
     gosub PUT kneel
     send go open
     gosub stand
AESRY.TO.PUZZLE:
     var LAST AESRY.TO.FOOTWEAR
     gosub AUTOMOVE puzzle
AESRY.EXP.CHECK.2:
     #if $Thievery.Ranks >= 430 then goto AESRY.TO.SHIELDS
AESRY.PUZZLE:
     var RETRY AESRY.PUZZLE
     var shopcode A.Puzzle
     var SHOP Puzzle
     gosub STEAL %A.Puzzle
AESRY.TO.FOOTWEAR:
     var LAST AESRY.TO.SHIELDS
     gosub AUTOMOVE footwear
AESRY.FOOTWEAR:
     var RETRY AESRY.FOOTWEAR
     var shopcode A.Footwear
     var SHOP Footwear
     gosub STEAL %A.Footwear
AESRY.TO.SHIELDS:
     var LAST AESRY.TO.WEAPON
     gosub AUTOMOVE shield
AESRY.SHIELDS:
     var RETRY AESRY.SHIELDS
     var shopcode A.Shields
     var SHOP Shields
     var itemLocation %A.Shields.Loc
     gosub STEAL %A.Shields
AESRY.TO.WEAPON:
     var LAST AESRY.TO.ARMOR
     gosub AUTOMOVE weapon
AESRY.WEAPON:
     var RETRY AESRY.WEAPON
     var shopcode A.Weapon
     var SHOP Weapon
     gosub STEAL %A.Weapon
AESRY.TO.ARMOR:
     var LAST AESRY.TO.GENERAL
     gosub AUTOMOVE armor
AESRY.ARMOR:
     var RETRY AESRY.ARMOR
     var shopcode A.Armor
     var SHOP Armor
     gosub STEAL %A.Armor
AESRY.TO.GENERAL:
     var LAST AESRY.TO.FLOWER
     gosub AUTOMOVE general
AESRY.GENERAL:
     var RETRY AESRY.GENERAL
     var shopcode A.General
     var SHOP General Store
     gosub STEAL %A.Gen
AESRY.TO.FLOWER:
     var LAST AESRY.TO.MUSIC
     gosub AUTOMOVE flower
AESRY.FLOWER:
     var RETRY AESRY.FLOWER
     var shopcode A.Flower
     var SHOP Flower
     gosub STEAL %A.Flower
AESRY.TO.MUSIC:
     var LAST GO.PAWN.AESRY
     gosub AUTOMOVE bardic
AESRY.MUSIC:
     var RETRY AESRY.MUSIC
     var shopcode A.Music
     var SHOP Music
     gosub STEAL %A.Music
GO.PAWN.AESRY:
GO.AESRY.PAWN:
     var CURRENT_CITY AESRY
     var LAST GO.PAWN.AESRY
     if $hidden then gosub unhide
     #if ("$Guild" = "Thief") then send khri stop
     pause 0.5
     gosub AUTOMOVE pawn
     gosub PAWN.GOODS
DONE.STEALING.AESRY:
     var LAST DONE.STEALING.AESRY
     if ("$Guild" = "Necromancer") then
          {
               if (toupper("%SKIPBANK") = "ON") then
                    {
                    echo *** SKIPPING BANK
                    goto DONE.AESRY
                    }
          goto AESRY.TELLER
          }
     if ((toupper("%PREMIUM") = "ON") && ("%EXCHANGE" = "ON")) then goto AESRY.PREMIUM
     if (toupper("%EXCHANGE") != "ON") then goto AESRY.TELLER
     gosub AUTOMOVE exchange
     gosub LIRUMS
     goto AESRY.TELLER
AESRY.PREMIUM:
     gosub AUTOMOVE premium exchange
     gosub LIRUMS
AESRY.TELLER:
     gosub AUTOMOVE teller
     gosub BANK
DONE.AESRY:
     goto FINISHED.SCRIPT
#######################
# PAWN SKIP
#######################
# SKIPS STRAIGHT TO PAWNING
PAWN.SKIP.PRE:
     ECHO
     ECHO
     ECHO **** WARNING!! DANGER!! DANGER!!
     ECHO **** SKIPPING BAG CHECK AND GOING STRAIGHT TO PAWNING ANY OLD STOLEN ITEMS IN LOOT BAGS
     ECHO **** THIS FEATURE IS ONLY INTENDED FOR CLEANING OUT YOUR LOOT BAGS
     ECHO **** INTENDED TO BE RUN ONLY IF YOU KILLED SCRIPT IN THE MIDDLE OF A RUN AND NEED TO CLEAN OUT BAGS
     ECHO
     ECHO **** CONTINUE AT YOUR OWN RISK!
     ECHO **** STOP SCRIPT NOW IF YOU DID NOT MEAN TO DO THIS!
     ECHO
     ECHO
     pause 8
PAWN.SKIP:
     ECHO
     ECHO **** SKIPPING STRAIGHT TO PAWNING
     ECHO
     gosub clear
     gosub CITY.CHECK
     var goPawn OFF
     var EndEarly ON
     goto %PawnLoc
############################################################################################
############################################################################################
FINISHED.SCRIPT:
     timer stop
     gosub TIME.CALC
     gosub COMBINE.BANK
     #put #var StealingProfit %TotalProfit
     var GlobalProfit $StealingProfit
     math GlobalProfit add %TotalProfit
     put #var StealingProfit %GlobalProfit
     put #var save
     gosub TOTAL.CHECK
     gosub WARRANT.CHECK
     ECHO
     ECHO *** DONE STEALING!
     ECHO
     put #echo >Log Lime ************* ~ FINAL STEALING REPORT ~ *****************
     put #echo >Log Lime **** Guild: $Guild - Circle: $Circle - Script v.%version
     put #echo >Log Lime **** Thievery Ranks: $Thievery.Ranks - $Thievery.LearningRate/34
     put #echo >Log Lime **** Start: %CITY | End: %CURRENT_CITY | Time: %runTime min
     put #echo >Log Lime **** %Charges Stealing Charge(s) |  %Jailed trip(s) to jail
     if (%Jailed = 1) then put #echo >Log Lime **** Visited %JAIL jail
     if (%Jailed = 2) then put #echo >Log Lime **** Visited %JAIL & %JAIL2 jails
     if (%Jailed = 3) then put #echo >Log Lime **** Visited %JAIL, %JAIL2, %JAIL3 jails
     if (%Jailed = 4) then put #echo >Log Lime **** Visited %JAIL, %JAIL2, %JAIL3, %JAIL4 jails
     if (%warrants = 1) then put #echo >Log Yellow **** Active Warrants: %Active.Warrants
     if ("$Guild" = "Thief") then put #echo >Log Lime **** Binned: %Binned Items | Pawned: %Pawned Items
     if ("$Guild" != "Thief") then put #echo >Log Lime **** Pawned: %Pawned Items
     if (toupper("%SKIPBANK") != "ON") then put #echo >Log Lime **** Session Profit: %Plats Plat, %Golds Gold, %Silvers Silver and change.
     put #echo >Log Lime **** Lifetime Profit: %Platz plat, %Goldz gold, %Silverz silvers and some change.
     put #echo >Log Lime *****************************************************************
     ECHO
     ECHO **************** ~ FINAL STEALING REPORT ~ ********************
     ECHO **** Guild: $Guild - Circle: $Circle - Script v.%version
     ECHO **** Thievery Ranks: $Thievery.Ranks - $Thievery.LearningRate/34
     ECHO **** Start: %CITY | End: %CURRENT_CITY | Time: %runTime min
     ECHO **** %Charges Stealing Charge(s) | %Jailed trip(s) to jail
     if (%Jailed = 1) then ECHO **** Visited %JAIL jail
     if (%Jailed = 2) then ECHO **** Visited %JAIL & %JAIL2 jails
     if (%Jailed = 3) then ECHO **** Visited %JAIL, %JAIL2, %JAIL3 jails
     if (%Jailed = 4) then ECHO **** Visited %JAIL, %JAIL2, %JAIL3, %JAIL4 jails
     if (%warrants = 1) then ECHO **** Active Warrants: %Active.Warrants
     if ("$Guild" = "Thief") then ECHO **** Binned: %Binned Items | Pawned: %Pawned Items
     if ("$Guild" != "Thief") then ECHO **** Pawned: %Pawned Items
     if (toupper("%SKIPBANK") != "ON") then ECHO **** Total Profit: %Plats Plat, %Golds Gold, %Silvers Silver, %Bronzes Bronze and %Coppers Copper
     ECHO **** All-Time Profit: %Platz plat, %Goldz gold, %Silverz silvers and some change.
     ECHO ***********************************************************************
     ECHO
     pause 2
     gosub PUT open my %SAFE_CONTAINER
     gosub PUT open my %BACKUP_CONTAINER
     pause 0.1
     if (toupper("%ARMOR_STOW") = "ON") then gosub WEAR.ARMOR
     if (toupper("%RETURN_HOME") = "ON") then goto TRAVEL.HOME
     goto COMPLETE
TRAVEL.HOME:
     ECHO
     ECHO *******************************************************
     ECHO * Traveling back to your original starting city!
     ECHO * Destination: %CITY
     ECHO *******************************************************
     ECHO
     pause 2
     if ("$zoneid" = "1") then
          {
               if ("%CITY" != "CROSSING") then
                    {
                         gosub AUTOMOVE 42
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "30") then
          {
               if ("%CITY" != "RIVERHAVEN") then
                    {
                         gosub AUTOMOVE 8
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "42") then
          {
               if ("%CITY" != "THEREN") then
                    {
                         gosub AUTOMOVE gate
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "61") then
          {
               if ("%CITY" != "LETH") then
                    {
                         gosub AUTOMOVE portal
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "67") then
          {
               if ("%CITY" != "SHARD") then
                    {
                         gosub AUTOMOVE east
                         gosub AUTOMOVE 65
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "116") then
          {
               if ("%CITY" != "HIB") then
                    {
                         gosub AUTOMOVE 75
                         goto TRAVEL
                    }
               else goto AT.STARTING.CITY
          }
     if ("$zoneid" = "99") then goto ALREADY.THERE
     if ("$zoneid" = "90") then goto ALREADY.THERE
     pause 0.5
     goto COMPLETE
ALREADY.THERE:
     ECHO
     ECHO *** YOU ARE ON AN ISLAND! THIS IS YOUR STARTING CITY DOOFUS!
     ECHO *** (TURN OFF THE RETURN HOME VARIABLE)
     pause
     goto COMPLETE
AT.STARTING.CITY:
     ECHO
     ECHO *** ALREADY AT YOUR STARTING CITY!
     ECHO
     pause
     goto COMPLETE
TRAVEL:
     pause 0.5
     send .%TRAVEL_SCRIPT %CITY
     waitforre ^YOU ARRIVED\!
     if ("$zoneid" = "66") then gosub automove east
TRAVEL.COMPLETE:
     put #echo >Log MediumSpringGreen *** Returned you to your Starting City: %CITY
COMPLETE:
     ECHO
     ECHO **** DONE STEALING!!
     ECHO
     put #parse DONE PAWNING
     put #parse DONE STEALING
     put #parse DONE STEALING
     exit
#################################################################################
#### END OF MAIN LOGIC PATH
#################################################################################
#################################################################################
#### BEGIN SCRIPT ENGINE
#################################################################################
STEAL:
     delay 0.001
     var item $0
     var stolen 0
     var grabbed 0
     var marked 0
     var heat 0
     if ("$Guild" != "Thief") then
          {
               if ("%CUSTOM_STEALCOUNT" = "OFF") then var STEALCOUNT %%shopcodeQuant
          }
     if ("$Guild" = "Empath") && ("%POWER" = "ON") then gosub POWER.CHECK.NOOB
     if ("$Guild" = "Empath") && ("%PercHealth" = "ON") then gosub PERC.HEALTH
STEAL.1:
     if (%skipping = 1) then goto STEAL.RETURN
     if ("%noSteal" = "ON") then goto STEAL.RETURN
     if contains("%item" , "nothing") then goto STEAL.RETURN
     if (%stolen >= %STEALCOUNT) then goto TOO.HOT
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then gosub stowing
     pause 0.001
     pause 0.001
     pause 0.001
MARKING:
     delay 0.001
     math marked add 1
     if (%caught = 1) then goto TOO.HOT
     if ("$righthand" != "Empty") && ("$lefthand" != "Empty") then gosub stowing
     if ("$Guild" != "Thief") || ("%marking" = "OFF") then goto STEALING
     if !$hidden then
          {
               gosub HIDE
               pause $roundtime
               pause 0.5
               pause 0.1
          }
     if $roundtime > 0 then pause 0.5
     pause 0.001
     pause 0.001
     pause 0.001
     matchre MARKING ^\.\.\.wait|^Sorry\,
     matchre WEAK.STEAL ^You learned very poorly|^You don't feel you learned anything
     matchre MARK.LAST to take unwanted notice of you|You manage to avoid the shopkeep's notice this time|You trace an X across your chest|decide to wait a while before trying
     matchre SECONDARY.CHECK Mark what\?|^Something appears different
     matchre HOT.STEAL perhaps it's a little risky|troublesome to be unnoticed|troublesome to lift|about even odds|looks your way suspiciously|should be possible
     matchre TOO.HOT you are being watched|looking for a reason to call the guards|beyond foolish|pretty sure you'll be caught
     matchre TOO.HOT it would likely be futile|judge's gavel echoes through your mind|feel the taste of bitter failure|paying far too much attention to it
     matchre TOO.HOT somewhat of a long shot|don't think well of your chances to lift it|quite the struggle|Guards\! Guards\!|points to where you lie concealed
     matchre TOO.HOT miracles occasionally happen|you'll be spotted pretty easily|maybe you shouldn't try it|begins to shout loudly for help
     matchre STEALING Roundtime|^You can not make marks on|it should be possible|more than likely liftable|it should be more likely liftable
     send mark %item %itemLocation
     matchwait 20
     put #echo >Log Red *** Missing Match Label in MARKING - %item ***
     put #log $datetime MISSING MATCH IN MARKING! - %item ***
     goto STEALING
MARK.LAST:
     var marking OFF
     goto STEALING
HOT.STEAL:
     math stolen add 1
     if ("%RISKY" != "ON") then goto TOO.HOT
STEALING:
     if (%caught = 1) then goto TOO.HOT
     if ("$Guild" != "Thief") && (%stolen >= %STEALCOUNT) then goto TOO.HOT
     if (%stolen >= %STEALCOUNT) then goto TOO.HOT
     math stolen add 1
     math grabbed add 1
STEAL.REAL:
     delay 0.001
     if !$hidden then
          {
               gosub HIDE
               pause $roundtime
               pause 0.5
               pause 0.1
          }
     if $roundtime > 0 then pause 0.5
     pause 0.2
     pause 0.1
     pause 0.1
     pause 0.0001
     pause 0.0001
     matchre WEAK.STEAL ^You don't feel you learned anything
     matchre STEAL.REAL ^\.\.\.wait|^Sorry\,
     matchre STEAL.1 ^You need at least one hand free
     matchre STEAL.RETURN ^You haven't picked something|^You can't steal
     matchre TOO.HOT begins to shout loudly for help|realize that you are being watched|^Guards! Guards!|decide to wait a while before trying|watching you very closely
     matchre STEAL.CHECK Roundtime|^Something appears different
     send steal %item %itemLocation
     matchwait 20
     put #echo >Log Red *** Missing Match Label in STEAL.REAL ! ***
     put #log $datetime MISSING MATCH IN STEAL.REAL ***
STEAL.CHECK:
     if ("%noLearn" = "ON") then goto STEAL.RETURN
     if (%stolen >= %STEALCOUNT) then goto TOO.HOT
     if (%stolen = 1) then goto MARKING
     if (%stolen = 2) then
          {
          if ("%MARK_ALL" = "ON") then
               {
                    gosub STOW
                    goto MARKING
               }
               gosub STOW
               goto STEALING
          }
     if (%stolen = 3) then goto MARKING
     if (%stolen = 4) then
          {
          if ("%MARK_ALL" = "ON") then
               {
                    gosub STOW
                    goto MARKING
               }
               gosub STOW
               goto STEALING
          }
     if (%stolen = 5) then goto MARKING
     if (%stolen = 6) then
          {
               gosub STOW
               goto MARKING
          }
     if (%stolen >= 7) then
          {
               gosub STOW
               goto STEAL.RETURN
          }
SECONDARY.CHECK:
     if (%SECOND_ITEM = 0) then goto STEAL.RETURN
     ECHO
     ECHO *** OUT OF STOCK! CHECKING FOR SECONDARY ITEMS..
     ECHO
     var item %secondary
     var itemLocation
     if def(secondaryLocation) then put #var itemLocation %secondaryLocation
     var SECOND_ITEM 0
     goto STEAL.1
WEAK.STEAL:
     gosub STOW
     if ((%changed < 2) && (%caught = 0)) then goto MARK.ADJUST.UP
     if ((%changed = 2) && (%downshift = 1)) then goto TOO.HOT3
SHOP.MAXED:
     put #echo >log Red *** No learning - Capped %SHOP @ $Thievery.Ranks ranks. Leaving..
     pause 0.1
     goto STEAL.RETURN
TOO.HOT:
     pause 0.1
     if (%stolen >= %STEALCOUNT) then goto TOO.HOT2
     if (%marked > 3) then goto TOO.HOT2
     if ((%grabbed < 2) && (%marked < 4) && (%changed < 3) && (%caught = 0)) then goto MARK.ADJUST
     #if (%grabbed = 1) then put #echo >log Magenta Leaving %SHOP - %item too hot after %grabbed grab
     #if (%grabbed <> 1) then put #echo >log Magenta Leaving %SHOP - %item too hot after %grabbed grabs
TOO.HOT2:
     put #echo >log Fuchsia Leaving %SHOP Shop - Too hot! Made %grabbed grabs at: %item
     goto STEAL.RETURN
TOO.HOT3:
     put #echo >log Fuchsia Leaving %SHOP - At odd middle ground. Items all too hard or too easy.
     goto STEAL.RETURN

STEAL.RETURN:
     action remove You don't feel you learned anything useful from this trivial theft
     action remove notices you attempting to make the grab and begins to shout for help.
     gosub ITEM.STRIP
     if (%adjusted = 1) then
          {
               ECHO *** Adding temp item to stealing list for pawning..
               math AltCount add 1
               var ALT%AltCount %item
               pause 0.1
               gosub STEAL.LIST.SETUP
               gosub MARK.RESET
               gosub STEAL.LIST.SETUP
               pause 0.1
          }
     var stolen 0
     var grabbed 0
     var adjusted 0
     var downshift 0
     var marked 0
     var caught 0
     var heat 0
     var changed 0
     var skipping 0
     var noLearn OFF
     var noSteal OFF
     var itemLocation
     var tempItem none
     if ("$Guild" = "Thief") then var marking ON
     if $hidden then if ("%SNEAK" = "OFF") then gosub unhide
     gosub stowing
     if ("$Guild" = "Necromancer") && (%ROC = 0) then gosub NECRO.PREP
     RETURN
###############################################
### MARK ADJUST LOGIC
MARK.ADJUST:
     gosub clear
     var tempItem %item
     math changed add 1
     var adjusted 1
     var downshift 1
     put #echo >Log Yellow * %item too hard @ %SHOP @ $Thievery.Ranks - Downshifting...
     if (%changed = 2) then goto ADJUST.2
     if (%changed = 3) then goto ADJUST.3
     if (%changed > 3) then goto STEAL.RETURN
     if $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 0 && $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then gosub CLASS0
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then gosub CLASS1
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 80 then gosub CLASS2
     if $Thievery.Ranks >= 80 && $Thievery.Ranks < 100 then gosub CLASS3
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then gosub CLASS4
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then gosub CLASS5
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then gosub CLASS6
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then gosub CLASS7
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then gosub CLASS8
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then gosub CLASS9
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then gosub CLASS10
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then gosub CLASS11
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then gosub CLASS12
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then gosub CLASS13
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then gosub CLASS14
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then gosub CLASS15
     if $Thievery.Ranks >= 1200 && $Thievery.Ranks < 1450 then gosub CLASS16
     if $Thievery.Ranks >= 1450 then gosub CLASS17
     goto %RETRY
ADJUST.2:
     if $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 0 && $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then gosub NOPE
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then gosub CLASS0
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 80 then gosub CLASS1
     if $Thievery.Ranks >= 80 && $Thievery.Ranks < 100 then gosub CLASS2
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then gosub CLASS3
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then gosub CLASS4
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then gosub CLASS5
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then gosub CLASS6
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then gosub CLASS7
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then gosub CLASS8
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then gosub CLASS9
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then gosub CLASS10
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then gosub CLASS11
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then gosub CLASS12
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then gosub CLASS13
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then gosub CLASS14
     if $Thievery.Ranks >= 1200 && $Thievery.Ranks < 1450 then gosub CLASS15
     if $Thievery.Ranks >= 1450 then gosub CLASS16
     goto %RETRY
ADJUST.3:
     if $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 0 && $Thievery.Ranks < 20 then gosub NOPE
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then gosub NOPE
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then gosub NOPE
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 80 then gosub CLASS0
     if $Thievery.Ranks >= 80 && $Thievery.Ranks < 100 then gosub CLASS1
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then gosub CLASS2
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then gosub CLASS3
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then gosub CLASS4
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then gosub CLASS5
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then gosub CLASS6
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then gosub CLASS7
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then gosub CLASS8
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then gosub CLASS9
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then gosub CLASS10
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then gosub CLASS11
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then gosub CLASS12
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then gosub CLASS13
     if $Thievery.Ranks >= 1200 && $Thievery.Ranks < 1450 then gosub CLASS14
     if $Thievery.Ranks >= 1450 then gosub CLASS15
     goto %RETRY
MARK.ADJUST.UP:
     gosub clear
     var tempItem %item
     var adjusted 1
     math changed add 1
     put #echo >log Yellow * %item too easy @ %SHOP @ $Thievery.Ranks - Upshifting...
     pause 0.1
### Saving stolen item to Stealing List before re-adjusting
     ECHO *** Adding temp item to stealing list for pawning..
     math AltCount add 1
     var ALT%AltCount %item
     pause 0.1
     gosub STEAL.LIST.SETUP
     gosub MARK.RESET
     gosub STEAL.LIST.SETUP
     pause 0.1
     if (%changed = 2) then goto MARK.ADJUST.UP2
     if (%changed = 3) then goto TOO.HOT
     if $Thievery.Ranks < 20 then gosub CLASS0
     if $Thievery.Ranks >= 0 && $Thievery.Ranks < 20 then gosub CLASS1
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then gosub CLASS2
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then gosub CLASS3
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 80 then gosub CLASS4
     if $Thievery.Ranks >= 80 && $Thievery.Ranks < 100 then gosub CLASS5
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then gosub CLASS6
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then gosub CLASS7
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then gosub CLASS8
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then gosub CLASS9
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then gosub CLASS10
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then gosub CLASS11
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then gosub CLASS12
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then gosub CLASS13
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then gosub CLASS14
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then gosub CLASS15
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then gosub CLASS16
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then gosub CLASS17
     if $Thievery.Ranks >= 1200 && $Thievery.Ranks < 1450 then gosub CLASS18
     if $Thievery.Ranks >= 1450 then gosub CLASS19
     goto %RETRY
MARK.ADJUST.UP2:
     gosub clear
     if $Thievery.Ranks < 20 then gosub CLASS1
     if $Thievery.Ranks >= 0 && $Thievery.Ranks < 20 then gosub CLASS2
     if $Thievery.Ranks >= 20 && $Thievery.Ranks < 40 then gosub CLASS3
     if $Thievery.Ranks >= 40 && $Thievery.Ranks < 60 then gosub CLASS4
     if $Thievery.Ranks >= 60 && $Thievery.Ranks < 80 then gosub CLASS5
     if $Thievery.Ranks >= 80 && $Thievery.Ranks < 100 then gosub CLASS6
     if $Thievery.Ranks >= 100 && $Thievery.Ranks < 150 then gosub CLASS7
     if $Thievery.Ranks >= 150 && $Thievery.Ranks < 200 then gosub CLASS8
     if $Thievery.Ranks >= 200 && $Thievery.Ranks < 250 then gosub CLASS9
     if $Thievery.Ranks >= 250 && $Thievery.Ranks < 300 then gosub CLASS10
     if $Thievery.Ranks >= 300 && $Thievery.Ranks < 400 then gosub CLASS11
     if $Thievery.Ranks >= 400 && $Thievery.Ranks < 500 then gosub CLASS12
     if $Thievery.Ranks >= 500 && $Thievery.Ranks < 600 then gosub CLASS13
     if $Thievery.Ranks >= 600 && $Thievery.Ranks < 700 then gosub CLASS14
     if $Thievery.Ranks >= 700 && $Thievery.Ranks < 800 then gosub CLASS15
     if $Thievery.Ranks >= 800 && $Thievery.Ranks < 900 then gosub CLASS16
     if $Thievery.Ranks >= 900 && $Thievery.Ranks < 1000 then gosub CLASS17
     if $Thievery.Ranks >= 1000 && $Thievery.Ranks < 1200 then gosub CLASS18
     if $Thievery.Ranks >= 1200 && $Thievery.Ranks < 1450 then gosub CLASS19
     if $Thievery.Ranks >= 1450 then gosub CLASS20
     goto %RETRY
## Reset back to default class level
MARK.RESET:
     if ($Thievery.Ranks < 20) then gosub NOOB
     if (($Thievery.Ranks >= 0) && ($Thievery.Ranks < 20)) then gosub CLASS0
     if (($Thievery.Ranks >= 20) && ($Thievery.Ranks < 40)) then gosub CLASS1
     if (($Thievery.Ranks >= 40) && ($Thievery.Ranks < 60)) then gosub CLASS2
     if (($Thievery.Ranks >= 60) && ($Thievery.Ranks < 80)) then gosub CLASS3
     if (($Thievery.Ranks >= 80) && ($Thievery.Ranks < 100)) then gosub CLASS4
     if (($Thievery.Ranks >= 100) && ($Thievery.Ranks < 150)) then gosub CLASS5
     if (($Thievery.Ranks >= 150) && ($Thievery.Ranks < 200)) then gosub CLASS6
     if (($Thievery.Ranks >= 200) && ($Thievery.Ranks < 250)) then gosub CLASS7
     if (($Thievery.Ranks >= 250) && ($Thievery.Ranks < 300)) then gosub CLASS8
     if (($Thievery.Ranks >= 300) && ($Thievery.Ranks < 400)) then gosub CLASS9
     if (($Thievery.Ranks >= 400) && ($Thievery.Ranks < 500)) then gosub CLASS10
     if (($Thievery.Ranks >= 500) && ($Thievery.Ranks < 600)) then gosub CLASS11
     if (($Thievery.Ranks >= 600) && ($Thievery.Ranks < 700)) then gosub CLASS12
     if (($Thievery.Ranks >= 700) && ($Thievery.Ranks < 800)) then gosub CLASS13
     if (($Thievery.Ranks >= 800) && ($Thievery.Ranks < 900)) then gosub CLASS14
     if (($Thievery.Ranks >= 900) && ($Thievery.Ranks < 1000)) then gosub CLASS15
     if (($Thievery.Ranks >= 1000) && ($Thievery.Ranks < 1200)) then gosub CLASS16
     if (($Thievery.Ranks >= 1200) && ($Thievery.Ranks < 1450)) then gosub CLASS17
     if ($Thievery.Ranks >= 1450) then gosub CLASS18
ITEM.STRIP:
     #eval tempitem replace("%item","first",  "")
     #eval tempitem replace("%item","second",  "")
     #eval tempitem replace("%item","third",  "")
     #eval tempitem replace("%item","fourth",  "")
     #eval tempitem replace("%item","fifth",  "")
     #eval tempitem replace("%item","sixth",  "")
     #eval tempitem replace("%item","seventh",  "")
     #eval tempitem replace("%item","eighth",  "")
     #eval tempitem replace("%item","ninth",  "")
     #eval tempitem replace("%item","cambrinth",  "")
     eval item replacere("%item", "[\w'-]+\s", "")
     pause 0.001
     var item %item
     var shopcode %item
     RETURN
############################################################################################
# ARMOR REMOVAL
############################################################################################
ARMOR.CHECK:
ARMOR.INIT:
     ECHO
     ECHO **** Checking for worn armor...
     ECHO
     counter set 0
     gosub PUT open my %SAFE_CONTAINER
     gosub PUT open my %BACKUP_CONTAINER
     pause 0.5
ARMOR.CHECK.1:
     delay 0.1
     pause 0.1
     pause 0.001
     matchre REMOVE.AND.STOW (gauntlet|gloves|shield|claw guards|steel mail gloves|parry stick|handwraps|\bhat\b|hand claws|jacket|armwraps|footwraps|aegis|buckler|\bhood\b|\bcowl\b|\bheater|pavise|scutum|shield|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|coat|\bcowl|cuirass|fauld|greaves|hauberk|helm|\bhood\b|jerkin|leathers|lorica|mantle|mask|morion|pants|(?<=(field|fluted|full|half) )\bplate\b|handguards|robe|sallet|shirt|sleeves|ticivara|tabard|tasset|thorakes|\blid\b|vambraces|vest|collar|coif|mitt|steel mail)
     matchre ARMOR.NONE You have nothing of that sort|You are wearing nothing of that sort|You aren't wearing anything like that
     send inv armor
     matchwait 15
     goto ARMOR.WARN
ARMOR.CHECK.2:
     delay 0.1
     pause 0.1
     matchre REMOVE.AND.STOW (gauntlet|gloves|shield|claw guards|steel mail gloves|parry stick|handwraps|\bhat\b|hand claws|jacket|armwraps|footwraps|aegis|buckler|\bhood\b|\bcowl\b|\bheater|pavise|scutum|shield|sipar|\btarge\b|aventail|backplate|balaclava|barbute|bascinet|breastplate|\bcap\b|coat|\bcowl|cuirass|fauld|greaves|hauberk|helm|\bhood\b|jerkin|leathers|lorica|mantle|mask|morion|pants|(?<=(field|fluted|full|half) )\bplate\b|handguards|robe|sallet|shirt|sleeves|ticivara|tabard|tasset|thorakes|\blid\b|vambraces|vest|collar|coif|mitt|steel mail)
     matchre ARMOR.COMPLETE You have nothing of that sort|You are wearing nothing of that sort|You aren't wearing anything like that
     send inv armor
     matchwait 15
     goto ARMOR.WARN
REMOVE.AND.STOW:
     var armor $0
REMOVE.ARMOR:
     delay 0.1
     pause 0.1
     pause 0.001
     var LAST REMOVE.ARMOR
     matchre REMOVE.ARMOR ^\.\.\.wait|^Sorry\,
     matchre STOW.ARMOR ^You remove|^You loosen the straps securing|^You take|^You slide
     matchre STOW.ARMOR ^You sling|^You work your way out of|^You pull|^You slip|^You aren't|^Remove what\?
     send remove %armor
     matchwait 15
STOW.ARMOR:
     delay 0.001
     pause 0.1
     var LAST STOW.ARMOR
     matchre STOW.ARMOR ^\.\.\.wait|^Sorry\,
     matchre ARMOR.DONE ^You put|^You slip|^What were you
     matchre STOW.ARMOR.ALT any more room in|closed|no matter how you arrange|too heavy|too long|too wide
     send put %armor in my %SAFE_CONTAINER
     matchwait 15
STOW.ARMOR.ALT:
     delay 0.001
     pause 0.1
     var LAST STOW.ARMOR.ALT
     matchre STOW.ARMOR.ALT ^\.\.\.wait|^Sorry\,
     matchre ARMOR.DONE ^You put|^You slip|^What were you
     matchre NO.MORE.STOWING any more room in|closed|no matter how you arrange|too heavy|too long|too wide
     send put %armor in my %BACKUP_CONTAINER
     matchwait 15
ARMOR.DONE:
     counter add 1
     pause 0.5
     var total_armor %c
     var armor%c %armor
     goto ARMOR.CHECK.2
ARMOR.NONE:
     ECHO **** NO ARMOR FOUND!
     var ARMOR_STOW OFF
     RETURN
NO.MORE.STOWING:
     put #echo >Log Red *** WARNING! OUT OF ROOM IN %SAFE_CONTAINER TO STORE ARMOR! MAKE ROOM! ***
     ECHO
     ECHO ******************************************************************************************************
     ECHO ***  WARNING!!!  YOUR SAFE CONTAINER - %SAFE_CONTAINER IS TOO FULL! MAKE SOME ROOM!
     ECHO ***  YOU HAVE NO MORE FREE BAG SPACE TO STORE ARMOR! MAKE SOME ROOM OR GET BIGGER BAGS!!
     ECHO ***  GONNA GO FOR IT ANYWAY, YOUR STEALING MAY BE HINDERED!
     ECHO ***  HIT 'ESC' IF YOU WANT TO ABORT SCRIPT NOW !
     ECHO ******************************************************************************************************
     ECHO
     put wear %armor
     pause 8
     ECHO
     ECHO *************************************************************************
     ECHO ***  CONTINUING SCRIPT IN 10 SECONDS IF YOU DO NOT ABORT SCRIPT
     ECHO *************************************************************************
     ECHO
     pause 10
     goto ARMOR.COMPLETE
ARMOR.COMPLETE:
     var ARMOR_STOW ON
     ECHO #######################################
     ECHO # Saved Armor Count: %total_armor
     if (%total_armor < 1)  then
          {
               ECHO # NO ARMOR FOUND
               ECHO #######################################
               RETURN
          }
     ECHO # Armor1: %armor1
     if (%total_armor < 2)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor2: %armor2
     if (%total_armor < 3)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor3: %armor3
     if (%total_armor < 4)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor4: %armor4
     if (%total_armor < 5)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor5: %armor5
     if (%total_armor < 6)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor6: %armor6
     if (%total_armor < 7)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor7: %armor7
     if (%total_armor < 8)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor8: %armor8
     if (%total_armor < 9)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor9: %armor9
     if (%total_armor < 10)  then
          {
               ECHO #######################################
               RETURN
          }
     ECHO # Armor10: %armor10
     ECHO #######################################
     ECHO
     pause 0.2
     gosub PUT close my %SAFE_CONTAINER
     pause 0.5
     RETURN
############################################################################################
WEAR.ARMOR:
     ECHO **** PUTTING YOUR ARMOR BACK ON! ****
     gosub PUT open my %SAFE_CONTAINER
     pause 0.5
     if (%total_armor = 0) then RETURN
     if ("%armor1" != "null") then
          {
               ECHO *** ARMOR: %armor1 ***
               gosub PUT get my %armor1 from my %SAFE_CONTAINER
               gosub PUT wear my %armor1
               pause 0.5
          }
     if ("%armor2" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 2: %armor2 ***
               gosub PUT get my %armor2 from my %SAFE_CONTAINER
               gosub PUT wear my %armor2
               pause 0.5
          }
     if ("%armor3" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 3: %armor3 ***
               gosub PUT get my %armor3 from my %SAFE_CONTAINER
               gosub PUT wear my %armor3
               pause 0.5
          }
     if ("%armor4" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 4: %armor4 ***
               gosub PUT get my %armor4 from my %SAFE_CONTAINER
               gosub PUT wear my %armor4
               pause 0.5
          }
     if ("%armor5" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 5: %armor5 ***
               gosub PUT get my %armor5 from my %SAFE_CONTAINER
               gosub PUT wear my %armor5
               pause 0.5
          }
     if ("%armor6" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 6: %armor6 ***
               gosub PUT get my %armor6 from my %SAFE_CONTAINER
               gosub PUT wear my %armor6
               pause 0.5
          }
     if ("%armor7" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 7: %armor7 ***
               gosub PUT get my %armor7 from my %SAFE_CONTAINER
               gosub PUT wear my %armor7
               pause 0.5
          }
     if ("%armor8" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 8: %armor8 ***
               gosub PUT get my %armor8 from my %SAFE_CONTAINER
               gosub PUT wear my %armor8
               pause 0.5
          }
     if ("%armor9" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 9: %armor9 ***
               gosub PUT get my %armor9 from my %SAFE_CONTAINER
               gosub PUT wear my %armor9
               pause 0.5
          }
     if ("%armor10" != "null") then
          {
               gosub stowing
               ECHO *** ARMOR 10: %armor10 ***
               gosub PUT get my %armor10 from my %SAFE_CONTAINER
               gosub PUT wear my %armor10
               pause 0.5
          }
     RETURN
###############################################################################################
#### UB3R 1337 CONTAINER CHECK SECTION
###############################################################################################
#### PAWNING / BINNING EMPTY BAG LOGIC
BAG.EMPTY:
     var bag $0
     pause 0.0001
     echo *** EMPTYING %bag 
     var contents null
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.|^You rummage
     action remove ^In the .* you see (.*)\.|^You rummage through .+ and see (.*)\.
     if "%contents" = "null" then RETURN
     pause 0.0001
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     eval contents replace("%contents"," with a miner's lamp on it",  "")
     eval contents replace("%contents"," with a wax label on it",  "")
     eval contents replace("%contents"," on it",  "")
     var contents |%contents|
     eval total count("%contents", "|")
BAG.EMPTY.Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub BAG.EMPTY.RemoveLoop
     action setvariable item $1 when ^@(?:an?|some).* (\S+)$
     put #parse @%item
     counter set %count
     if matchre("%STEAL.LIST", "%item") then gosub BAG.EMPTY.ItemAction
     #if matchre(("%ALT1|%ALT2|%ALT3|%ALT4|%ALT5|%ALT6|%ALT7|%ALT8|%ALT9"), "%item") then gosub BAG.EMPTY.ItemAction
     # if contains("%STEAL.LIST", "%item") then gosub %BINORPAWN %item
     if "%contents" != "|" then goto BAG.EMPTY.Loop
     RETURN
BAG.EMPTY.RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents" , "|%item|" , "|")
     eval contents replace("%contents" , "||" , "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto BAG.EMPTY.RemoveLoop
BAG.EMPTY.ItemAction:
     gosub %BINORPAWN %item
     #counter subtract 1
     if (%c < 1) then RETURN
     goto BAG.EMPTY.ItemAction
###############################################################################################
#### PERSONAL ITEM PROTECTION MODULE
BAG.CHECK:
     var bag $0
     #var count 0
     pause 0.001
     var contents null
     gosub PUT open my %SAFE_CONTAINER
     gosub PUT open my %BACKUP_CONTAINER
     pause 0.5
     echo
     echo *** PRE-SCANNING %bag FOR ANY CONFLICTING PERSONAL ITEMS
     echo
     # action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.
     action remove ^In the .* you see (.*)\.|^There is nothing in there\.
     pause 0.001
     pause 0.001
     pause 0.001
     if ("%contents" = "null") then RETURN
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     eval contents replace("%contents"," with a miner's lamp on it",  "")
     eval contents replace("%contents"," with a wax label on it",  "")
     eval contents replace("%contents"," on it",  "")
     var contents |%contents|
     eval total count("%contents", "|")
Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub RemoveLoop
     action var item $1 when ^@(?:an?|some) .* (\S+)$
     put #parse @%item
     counter set %count
     #if contains("%IMPORTANT_ITEMS", "%item") then gosub storeitem
     #if contains("%STEAL.LIST", "%item") then gosub storeitem
     if matchre("%STEAL.LIST|%IMPORTANT_ITEMS", "%item") then gosub storeitem
     if (%contents != "|") then goto Loop
     ECHO **** DONE STASHING ITEMS FROM %bag
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
     var stowedItems 1
     echo
     echo **** STASHING: %item
     echo
     gosub GET %item from my %bag
     gosub PUT_IT my %item in my %SAFE_CONTAINER
     pause 0.001
     pause 0.001
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then gosub PUT_IT my %item in my %BACKUP_CONTAINER
     pause 0.001
     pause 0.001
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then gosub ALT.STOW
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then goto BAG.FULL
     if (%c < 1) then RETURN
     goto storeitem
ALT.STOW:
     delay 0.001
     if ("$righthand" != "Empty") then send stow right in my %SAFE_CONTAINER
     if ("$lefthand" != "Empty") then send stow left in my %SAFE_CONTAINER
     pause 0.5
     pause 0.2
     if ("$righthand" != "Empty") then send stow right in my %BACKUP_CONTAINER
     if ("$lefthand" != "Empty") then send stow left in my %BACKUP_CONTAINER
     pause 0.5
     pause 0.2
     RETURN
###############################################################################################
#### CLEARS MESSED UP ITEM NAMES IN JAIL SACK THAT INTERFERE WITH SCRIPT
JAIL.EMPTY:
     var bag $0
     pause 0.0001
     var contents null
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.|^You rummage
     action remove ^In the .* you see (.*)\.|^You rummage through .+ and see (.*)\.
     if "%contents" = "null" then RETURN
     pause .0001
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     eval contents replace("%contents"," with a miner's lamp on it",  "")
     eval contents replace("%contents"," with a wax label on it",  "")
     eval contents replace("%contents"," on it",  "")
     var contents |%contents|
     eval total count("%contents", "|")
JAIL.EMPTY.Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub JAIL.EMPTY.RemoveLoop
     action setvariable item $1 when ^@(?:an?|some).* (\S+)$
     put #parse @%item
     counter set %count
     gosub JAIL.EMPTY.ItemAction
     if "%contents" != "|" then goto JAIL.EMPTY.Loop
     RETURN
JAIL.EMPTY.RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents" , "|%item|" , "|")
     eval contents replace("%contents" , "||" , "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto JAIL.EMPTY.RemoveLoop
JAIL.EMPTY.ItemAction:
     counter subtract 1
     gosub GET %item from my %bag
     #gosub WEAR my %item
     pause 0.2
     if ("%item" = "%SAFE_CONTAINER") then gosub PUT open my %SAFE_CONTAINER
     gosub PUT_IT my %item in my %BIN_CONTAINER
     if (%c < 1) then RETURN
     goto JAIL.EMPTY.ItemAction
###############################################################
################################
#  PAWNING / BINNING LOGIC     #
################################
PAWN.GOODS:
     ECHO
     ECHO #### GETTING SOME COIN!  ####
     ECHO #### PAWNING %CURRENT_CITY HAUL! ####
     ECHO
     put #echo >Log Yellow *** Pawning %CURRENT_CITY Haul! ***
     pause 0.0001
     var BINORPAWN PAWN
     gosub BAG.EMPTY %PAWN_CONTAINER
     pause 0.0001
     if (toupper("%BIN") = "OFF") || ("%PAWN.ALL" = "ON") then gosub BAG.EMPTY %BIN_CONTAINER
     pause 0.0001
     gosub STOWING
     RETURN
BIN.GOODS:
     ECHO
     ECHO ########  Binning %CURRENT_CITY Haul!  ########
     ECHO
     put #echo >Log Yellow *** Binning %CURRENT_CITY Haul! ***
     pause 0.0001
     var BINORPAWN BIN
     gosub BAG.EMPTY %BIN_CONTAINER
     pause 0.0001
     gosub BAG.EMPTY %PAWN_CONTAINER
     pause 0.0001
     # send dump junk
     gosub STOWING
     RETURN
#######################
#   PAWN ROUTINE      #
#######################
PAWN:
     var PAWN.ITEM $0
     var emptyLoop 0
PAWN.GET:
     if (%c < 1) then RETURN
     counter subtract 1
     if ($invisible = 1) then gosub stopinvis
     pause 0.0001
     matchre PAWN.GET ^\.\.\.wait|^Sorry\,
     matchre PAWN.BIN ^You need a free hand
     matchre PAWN.SELL ^You get
     matchre PAWN.SELL ^You are already
     matchre PAWN.SELL ^You pick up
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.|^I could not
     send get my %PAWN.ITEM in my %bag
     matchwait
INVIS.PAWN:
     pause 0.0001
     if ("$Guild" = "Thief") then send khri stop silence vanish
     if ("$Guild" != "Thief") then 
          {
          send hum scale
          pause 0.2
          put stop hum
          pause 0.2
          }
     pause 0.3
     pause 0.1
PAWN.SELL:
     if ($invisible = 1) then gosub stopinvis
     if ((matchre("%nosell", "$righthand")) || (matchre("%nosell", "$lefthand")) then goto PAWN.BIN
     matchre PAWN.SELL ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You sell your|he hands you
     matchre PAWN.BIN ^(\S+) scowls
     matchre PAWN.BIN ^(\S+) shakes his head
     matchre PAWN.BIN ^Pawnmonger Aelik shakes his head
     matchre PAWN.BIN ^You can't pawn|not worth the effort|I don't want that
     matchre PAWN.BIN slit a throat for this|no need|not worth anything
     matchre PAWN.BIN Waste all my money|isn't worth my time
     matchre PAWN.BIN ^I could not find what you were referring to\.
     matchre PAWN.BIN ^Please rephrase that command\.
     matchre PAWN.BIN ^What were you referring to\?
     matchre INVIS.PAWN ^You might want to be visible
     matchre EMPTY.ITEM You'll want to empty that
     send sell my %PAWN.ITEM
     matchwait 15
     put #echo >Log Red *** Missing match label - PAWN.SELL
     put #log $datetime MISSING MATCH IN PAWN.SELL ***
PAWN.BIN:
     if (toupper("%BIN") = "OFF") then goto BUCKET
     matchre PAWN.BIN ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You put|^You drop
     matchre PAWN.GET ^What were you referring to\?
     matchre PAWN.GET ^You aren't holding that\.
     matchre PAWN.GET ^Please rephrase that command\.
     matchre SAFETY ^That's too heavy to go in there\!
     matchre SAFETY ^You can't put that in there\!
     matchre SAFETY ^There is no more room|too long to fit
     matchre BUCKET ^But that's closed\.
     matchre BUCKET ^What were you|^You can't do that
     matchre BUCKET ^There isn't enough room .* for your .* to fit\.
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %BIN_CONTAINER
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %BIN_CONTAINER
     matchwait 15
SAFETY:
     pause 0.1
     ECHO **** Not enough room!
     ECHO **** STORING ITEM IN SAFE CONTAINER FOR SAFEKEEPING *****
     gosub put open my %SAFE_CONTAINER
     pause 0.2
     pause 0.2
     pause 0.0001
     if (toupper("%BIN") = "OFF") then goto BUCKET
     matchre SAFETY ^\.\.\.wait|^Sorry\,
     matchre SAFETY.DONE ^You put|^You drop
     matchre SAFETY.DONE ^What were you referring to\?
     matchre SAFETY.DONE ^You aren't holding that\.
     matchre SAFETY.DONE ^Please rephrase that command\.
     matchre SAFETY2 ^That's too heavy to go in there\!
     matchre SAFETY2 ^You can't put that in there\!
     matchre SAFETY2 ^There is no more room|too long to fit
     matchre SAFETY2 ^But that's closed\.
     matchre SAFETY2 ^What were you|^You can't do that
     matchre SAFETY2 ^There isn't enough room .* for your .* to fit\.
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %SAFE_CONTAINER
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %SAFE_CONTAINER
     matchwait 15
SAFETY2:
     pause 0.01
     ECHO **** NOT ENOUGH ROOM IN SAFE CONTAINER!!!
     ECHO **** STORING ITEM IN BACKUP CONTAINER *****
     gosub put close my %SAFE_CONTAINER
     pause 0.2
     pause 0.2
     pause 0.1
     gosub put open my %BACKUP_CONTAINER
     pause 0.5
     pause 0.1
     pause 0.0001
     pause 0.0001
     matchre SAFETY2 ^\.\.\.wait|^Sorry\,
     matchre SAFETY.DONE ^You put|^You drop
     matchre SAFETY.DONE ^What were you referring to\?
     matchre SAFETY.DONE ^You aren't holding that\.
     matchre SAFETY.DONE ^Please rephrase that command\.
     matchre BUCKET ^That's too heavy to go in there\!
     matchre BUCKET ^You can't put that in there\!
     matchre SAFETY ^There is no more room|too long to fit
     matchre BUCKET ^But that's closed\.
     matchre BUCKET ^What were you|^You can't do that
     matchre BUCKET ^There isn't enough room .* for your .* to fit\.
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %BACKUP_CONTAINER
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %BACKUP_CONTAINER
     matchwait 15
SAFETY.DONE:
     gosub put close my %SAFE_CONTAINER
     gosub put close my %BACKUP_CONTAINER
     pause 0.3
     GOTO PAWN.GET

BUCKET:
     delay 0.0001
     #if matchre("%PAWN.ITEM","(%IMPORTANT_ITEMS)") then
          #{
          #if (%stowedItems = 0) then 
          #     {               
          #          ECHO ***** POSSIBLE NON-STOLEN PERSONAL ITEM!! - %PAWN.ITEM
          #          ECHO ***** STORING IN %SAFE_CONTAINER FOR SAFETY
          #          send open my %SAFE_CONTAINER
          #         pause 0.5
          #          gosub PUT put my %PAWN.ITEM in my %SAFE_CONTAINER
          #          pause 0.4
          #          gosub PUT close my %SAFE_CONTAINER
          #          pause 0.2
          #     }
          #}
     if ("$zoneid" = "30") then
          {
               gosub EMPTY.HANDS
               goto PAWN.GET
          }
     pause 0.1
     matchre BUCKET ^\.\.\.wait|^Sorry\,
     matchre PAWN.GET ^You put
     matchre PAWN.GET ^You drop
     matchre PAWN.GET ^You toss
     matchre DROP.IT ^You should be holding
     if ("$lefthand" = "Empty") && ("$righthand" = "Empty") then goto PAWN.GET
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in bucket
     if ("$righthand" != "Empty") then send put my $righthandnoun in bucket
     matchwait 15
     gosub EMPTY.HANDS
     goto PAWN.GET
DROP.IT:
     delay 0.0001
     if ("$lefthand" != "Empty") then gosub empty left
     if ("$righthand" != "Empty") then gosub empty right
     goto PAWN.GET
EMPTY.ITEM:
     math emptyLoop add 1
     if (%emptyLoop > 2) then goto BUCKET
     delay 0.0001
     pause 0.1
     if ("$lefthand" != "candle mold") then gosub PUT pour my mold
     if ("$righthand" != "candle mold") then gosub PUT pour my mold
     if matchre("$righthandnoun|$lefthandnoun", "mold") then goto PAWN.SELL
     pause 0.3
     pause 0.2
     if ("$lefthand" != "Empty") then gosub PUT open my $lefthandnoun
     if ("$righthand" != "Empty") then gosub PUT open my $righthandnoun
     pause 0.3
     pause 0.2
     if ("$righthand" != "Empty") then gosub PUT get paper from my $righthand
     if ("$lefthand" != "Empty") then gosub PUT get paper from my $lefthand
     pause 0.5
     pause 0.3
     pause 0.2
     if ("$lefthandnoun" = "paper") then gosub empty left
     if ("$righthandnoun" = "paper") then gosub empty right
     pause 0.1
     goto PAWN.SELL
#######################
#   BINNING ROUTINE   #
#######################
BIN:
     var BIN_ITEM $0
BIN.GET:
     if %c < 1 then RETURN
     counter subtract 1
     pause 0.0001
     matchre BIN.GET ^\.\.\.wait|^Sorry\,
     matchre BIN.DROP ^You need a free hand
     matchre BIN.ITEM ^You get
     matchre BIN.ITEM ^You are already
     matchre BIN.ITEM ^You pick up
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.
     put get my %BIN_ITEM in my %bag
     matchwait 15
BIN.ITEM:
     matchre BIN.ITEM ^\.\.\.wait|^Sorry\,
     matchre BIN.DROP \"You're not fooling anyone\, $charactername\.
     matchre BIN.DROP shakes
     matchre BIN.DROP .* raises an eyebrow in your direction
     matchre BIN.GET \"Nice work\, $charactername\.\"
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You aren't holding that\.
     matchre RETURN ^Please rephrase that command\.
     put put my %BIN_ITEM in bin
     matchwait 15
BIN.DROP:
     pause 0.0001
     gosub STOW.BIN
     gosub EMPTY.HANDS
     goto BIN.GET
STOW.BIN:
     ECHO ###########################################################################################
     ECHO * # WARNING! ITEM ALERT!! ODD NON-BINNABLE ITEM!! - %item
     ECHO * Most likely an expired stolen item 
     ECHO * BUT COULD BE A PERSONAL ITEM DUE TO SKIPPING BAG CHECK?
     ECHO * Putting in %Safe_Container for safe-keeping!
     ECHO * If you see this message spam, it's probably because you restarted the script
     ECHO * Midway through a stealing run and it's finding old stolen items 
     ECHO * IF THIS IS NOT A STOLEN ITEM OR YOU DID NOT RESTART 
     ECHO * PLEASE REPORT THE ITEM(S) IT DID NOT CATCH AND INCLUDE A LOG 
     ECHO ###########################################################################################
     put #echo >Log White *** Odd non-binnable item alert - %item
     pause 0.5
STOWBINGO:
     gosub PUT open my %SAFE_CONTAINER
     pause 0.2
     pause 0.1
     matchre STOWBINGO ^\.\.\.wait|^Sorry\,
     matchre STOWBIN2 /You just can't get|You can't do|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.BIN.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %SAFE_CONTAINER
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %SAFE_CONTAINER
     matchwait 15
STOWBIN2:
     gosub PUT open my %BACKUP_CONTAINER
     pause 0.2
     pause 0.1
     matchre STOWBIN2 ^\.\.\.wait|^Sorry\,
     matchre DROPIT /You just can't get|You can't do|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit/i
     matchre STOW.BIN.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %BACKUP_CONTAINER
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %BACKUP_CONTAINER
     matchwait 15
STOW.BIN.RETURN:
     pause 0.001
     gosub PUT close my %SAFE_CONTAINER
     gosub PUT close my %BACKUP_CONTAINER
     pause 0.1
     pause 0.1
     RETURN
DROPIT:
     echo
     echo FUCK! Ran out of room in safe and backup containers! 
     echo THIS ERROR SHOULD NEVER HAPPEN. If you see this, please send me a log of the items it did not catch 
     echo Also consider freeing up some damn room in your SAFE and BACKUP containers.. or use/get bigger bags. 
     echo EXITING SCRIPT TO BE ON THE SAFE SIDE SO WE DON'T POTENTIALLY LOSE ITEMS 
     echo Send all logs to skultamaphon@gmail.com / Shroom#0046 Discord 
     echo
     exit
#############################
#       STOW ROUTINE        #
#############################
STOW:
     delay 0.001
     if (("$righthand" = "Empty") && ("$lefthand" = "Empty")) then return
     math STOW.LOOP add 1
     pause 0.1
     pause 0.1
     if matchre("%item","(%BIN_CONTAINER|%PAWN_CONTAINER)") then 
          {
          echo *** Stolen item has the same name as one of our loot containers!
          echo *** Discarding item for safety/To avoid clusterfuck issues
          gosub EMPTY.HANDS
          }
     if (%STOW.LOOP > 1) then goto SECOND.BAG
     matchre STOW ^\.\.\.wait|^Sorry\,
     matchre STOW.WTF ^Something appears different
     matchre SECOND.BAG /You just can't get|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit|You can't do that\!
     matchre STOW.RETURN /You put|What were you|You can't do|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %PAWN_CONTAINER
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %BIN_CONTAINER
     matchwait 15
     RETURN
SECOND.BAG:
     delay 0.001
     pause 0.1
     pause 0.1
     if matchre("$lefthand"|"$righthand","%LARGE.ITEMS") then gosub EMPTY.HANDS
     matchre SECOND.BAG ^\.\.\.wait|^Sorry\,
     matchre DROP.ITEM /You just can't get|no matter how you arrange|^There isn't any more room|too wide|too heavy|too long to fit|won't fit|You can't do that\!
     matchre STOW.RETURN /You put|What were you|I could not|Perhaps you|Stow what/i
     if ("$righthand" != "Empty") then send put my $righthandnoun in my %BIN_CONTAINER
     if ("$lefthand" != "Empty") then send put my $lefthandnoun in my %PAWN_CONTAINER
     matchwait 15
     RETURN
STOW.WTF:
     delay 0.001
     if matchre("$lefthand"|"$righthand","%LARGE.ITEMS") then gosub EMPTY.HANDS
     if ("$righthand" != "Empty") then send stow right in my %PAWN_CONTAINER
     if ("$lefthand" != "Empty") then send stow left in my %BIN_CONTAINER
     pause 0.5
     pause 0.2
STOW.RETURN:
     var STOW.LOOP 0
     pause 0.1
     RETURN
DROP.ITEM:
     var STOW.LOOP 0
     echo *** NO ROOM TO STORE ITEM - DROPPING
     gosub EMPTY.HANDS
     pause 0.1
     RETURN
#####################################
# WARRANT CHECK
#####################################
WARRANT.CHECK:
     delay 0.1
     action var hib.warrant 1;var warrants 1 when Hibarnhvidar
     action var shard.warrant 1;var warrants 1 when Shard|Illithi
     action var leth.warrant 1;var warrants 1 when Leth
     action var cross.warrant 1;var warrants 1 when Crossing|Zoluren
     action var haven.warrant 1;var warrants 1 when Riverhaven|Therengia
     action var theren.warrant 1;var warrants 1 when Therenborough
     action var ratha.warrant 1;var warrants 1 when Ratha
     action var aesry.warrant 1;var warrants 1 when Aesry
     action var warrants 0 when you are certain you do not have any outstanding warrants
     send recall warrant
     pause
     pause 0.5
     action remove Hibarnhvidar
     action remove Shard|Illithi
     action remove Leth
     action remove Crossing|Zoluren
     action remove Riverhaven|Therengia
     action remove Therenborough
     action remove you are certain you do not have any outstanding warrants
     if (%hib.warrant = 1) then var Active.Warrants %Active.Warrants|Hibarnhvidar
     if (%shard.warrant = 1) then var Active.Warrants %Active.Warrants|Shard
     if (%leth.warrant = 1) then var Active.Warrants %Active.Warrants|Leth
     if (%cross.warrant = 1) then var Active.Warrants %Active.Warrants|Crossing
     if (%haven.warrant = 1) then var Active.Warrants %Active.Warrants|Riverhaven
     if (%theren.warrant = 1) then var Active.Warrants %Active.Warrants|Therenborough
     if (%ratha.warrant = 1) then var Active.Warrants %Active.Warrants|Ratha
     if (%aesry.warrant = 1) then var Active.Warrants %Active.Warrants|Aesry
     eval Active.Warrants replace("%Active.Warrants", "None|" "")
     eval Active.Warrants replace("%Active.Warrants", "Null|" "")
     eval Active.Warrants replace("%Active.Warrants", "null|" "")
     RETURN
#####################################
# THIEF BUFFS
#####################################
KHRI:
     if ("$Guild" = "Barbarian") then goto DANCE
     if ("$Guild" != "Thief") then RETURN
     if ("%khri1" = "null") then RETURN
     ECHO *** PUTTING UP KHRI ***
     if ($concentration < 40) then goto KHRI.BREAK
     gosub KHRI.START %khri1
     pause 0.2
     if !matchre(tolower("%khri2"),"(null)") then gosub KHRI.START %khri2
     pause 0.5
     if !matchre(tolower("%khri3"),"(null)") then gosub KHRI.START %khri3
     RETURN
KHRI.START:
     var khri $0
KHRI.START.CONTINUE:
     delay 0.001
     pause 0.001
     matchre KHRI.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre KHRI.KNEEL ^Your mind and body are willing|Sitting, kneeling, or lying
     matchre KHRI.START.CONTINUE ^\.\.\.wait|^Sorry\,
     matchre KHRI.RETURN ^You're already using the .* meditation\.
     matchre KHRI.RETURN ^You already
     matchre KHRI.RETURN ^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?
     matchre KHRI.RETURN ^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]
     matchre KHRI.RETURN ^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)
     matchre KHRI.RETURN ^Focusing|^With intense focus|^You carefully relax|Your hand|With deep|Letting your thoughts|Your mental
     matchre KHRI.RETURN ^You are not|Your mind|valid khri|^Your thoughts|Usage:
     matchre KHRI.BREAK You strain, but cannot focus|You have not recovered from|Your mind is already focused
     send khri %khri
     matchwait 15
KHRI.BREAK:
     send khri stop
KHRI.WAIT:
     pause 0.5
     ECHO
     ECHO *** Waiting for concentration to recover...
     ECHO
     if !$hidden then gosub hide
     pause
     send khri meditate
     pause 40
     if ($concentration < 60) then goto KHRI.WAIT
KHRI.WAIT.CONT:
     matchre KHRI.WAIT preoccupying your thoughts
     matchre KHRI.BREAK.DONE ^You are under|^You are not currently under
     put khri check
     matchwait 15
KHRI.BREAK.DONE:
     gosub EMPTY.HANDS
     goto KHRI
KHRI.KNEEL:
     gosub PUT kneel
     gosub PUT khri %khri
     pause $roundtime
     pause 0.5
     pause 0.1
     gosub stand
     RETURN
KHRI.RETURN:
     pause $roundtime
     pause 0.1
     pause 0.1
     delay .001
     RETURN
#####################################
# BARB BUFFS
#####################################
DANCE:
     ECHO *** BARB DANCE ***
     gosub PUT form monkey
     pause $roundtime
     pause 0.5
     pause 0.3
     gosub PUT form panther
     pause $roundtime
     pause 0.5
     pause 0.3
     gosub PUT berserk wildfire
     pause 0.5
     pause 0.1
     RETURN
#####################################
# MOONIE
#####################################
MOONIE.PREP:
     ECHO *** Casting Shadows ***
     pause 0.5
     send prep shadows 25
     waitforre ^You feel fully prepared
     send cast
     pause 0.5
     ECHO *** Casting RF ***
     pause 0.5
     send prep RF 25
     waitforre ^You feel fully prepared
     send cast
     pause 0.5
     RETURN
#####################################
# EMPATH BUFFS
#####################################
POWER.CHECK.NOOB:
     if ($Attunement.LearningRate > 30) then RETURN
     pause 0.5
     gosub PUT power
     pause
     pause
POWER.STUN.CHECK:
     if ($stunned = 1) then
          {
               ECHO *** STUNNED! PAUSING...
               pause 5
               goto POWER.STUN.CHECK
          }
     RETURN
PERC.HEALTH:
     if ($Empathy.LearningRate > 32) then RETURN
     if ($Attunement.LearningRate > 32) then RETURN
     if ("%GuardianSpirit" = "ON") then GOSUB POWER.CHECK
     if ($zoneid = 42) then RETURN
     ECHO *** PERCEIVING HEALTH ***
     pause 0.001
     pause 0.001
     gosub PUT perceive health
     pause
POWER.STUN.CHECK2:
     if $stunned = 1 then
          {
               ECHO *** STUNNED! PAUSING...
               pause 5
               goto POWER.STUN.CHECK2
          }
     pause 0.001
     pause 0.001
     RETURN
POWER.CHECK:
     if ($Attunement.LearningRate > 30) then RETURN
     if ($zoneid = 42) then RETURN
     pause 0.001
     pause 0.001
     matchre RETURN ^You sense the Guardian Spirit spell upon you
     matchre GUARDIAN.SPIRIT ^Roundtime
     send power
     matchwait 15
     GOTO GuardianSpirit
GS1:
pause 5
GUARDIAN.SPIRIT:
     if (*"%GuardianSpirit" != "ON") then RETURN
     if ($zoneid = 42) then RETURN
          if ($Empathy.Ranks < 75) && ($Attunement.Ranks < 75) || ($Empathy.Ranks < 50) && ($Attunement.Ranks < 100) || ($Empathy.Ranks < 100) && ($Attunement.Ranks < 50) then
          {
               ECHO
               ECHO *** You do not appear to have enough combined Empathy or Attunement for Guardian Spirit ***
               ECHO *** If this is an error, please email/IM me with your Empathy and Attunement Ranks
               ECHO *** Turning Guardian Spirit OFF for now.
               pause 5
               var GuardianSpirit OFF
               RETURN
          }
     ECHO *** GUARDIAN SPIRIT ***
     pause 0.5
     gosub PREPARE gs %gsMana
     if (%ECastPause > 0) then gosub SPELL.WAIT
     else pause %ECastPause
     gosub SPELL.CAST
     RETURN
#####################################
# NECRO BUFFS
#####################################
NECRO.START:
     var Rite OFF
     var Eyes OFF
     action var $1 ON when ^You sense the (\w+)
     gosub PUT power
     pause 0.5
     pause 0.1
     action remove ^You sense the (\w+)
NECRO.PREP:
     if ("$Guild" != "Necromancer") then RETURN
     var cast $0
     pause 0.1
     gosub ROC
     gosub EOTB
     RETURN
ROC:
     if ("%Rite" = "ON") then goto NECRO.DONE
     if ("%ROC" != "ON") then goto NECRO.DONE
     ECHO **** Checking ROC ****
     if ("$preparedspell" != "None") then gosub RELEASE
     if (((matchre("$roomobjs", "exchange board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) then RETURN
     gosub NECRO.CHECKROOM
     gosub PREPARE roc %rocMana
     if (%castPause > 0) then gosub SPELL.WAIT
     else
          {
               pause %castPause
               if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
               gosub SPELL.CAST
          }
     RETURN
EOTB:
     if ("%EOTB" != "ON") then goto NECRO.DONE
     if (("%Eyes" = "ON") && ($invisible = 1)) then goto NECRO.DONE
     ECHO  **** Checking EOTB ****
     if ("$preparedspell" != "None") then gosub RELEASE
## ** Waits for invis pulse or casts the spell if invisible is off..
     if (("%Eyes" = "ON") && ($invisible = 0)) then
          {
## ** This return is slightly different, it will not wait for pulse inside the exchange.
## ** It will also not wait for a pulse if destination = exchange, account or any teller trips to the exchange when moving areas.
## ** It should wait for a pulse inside the teller if going anywhere else.
          if (((matchre("$roomobjs", "exchange rate board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) && ((matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) && (matchre("%Destination", "(teller|exchange)")))) then RETURN
          matchre EOTB ^Your spell subtly|^Your corruptive mutation fades
          matchwait 30
          put #echo >log Red *** Error with EOTB not pulsing invis. Attempting to recast.
          }
    if ($invisible = 1) then RETURN
## ** If script made it to this section then EOTB must be recast.
## ** This will not cast while inside the bank or any other unapproved rooms.
     if (((matchre("$roomobjs", "exchange rate board")) || (matchre("$roomname", "([T|t]eller|[E|e]xchange|[B|b]ank)")) || (matchre("$roomname", "(%donotcastlist)"))) then RETURN
     if ($stamina < 50) then RETURN
     gosub NECRO.CHECKROOM
     gosub PREPARE eotb %eotbMana
     if (%castPause > 0) then gosub SPELL.WAIT
     else
          {
               pause %castPause
               if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
               gosub SPELL.CAST
          }
    RETURN
NECRO.DONE:
     delay 0.0001
     RETURN
NECRO.CHECKROOM:
     if !("$roomplayers" = "") then gosub MOVE.RANDOM
     send search
     waitforre ^Roundtime|^You scan the
     pause $roundtime
     pause 0.5
     if !("$roomplayers" = "") then gosub MOVE.RANDOM
     ECHO **** FOUND EMPTY ROOM! ***
RETURN
stopinvis:
     delay 0.001
     gosub PUT hum scale
     pause 0.2
     gosub PUT stop hum
     RETURN
############################################################################################
##########################
# MOVEMENT ENGINE
##########################
##### AUTOMOVE SUBROUTINE #####
AUTOMOVE:
     delay 0.0001
     pause 0.0001
     var Destination $0
     var automovefailCounter 0
     if $roomid = 0 then GOSUB MOVE.RANDOM
     if (!$standing) then gosub AUTOMOVE.STAND
     if ("%goPawn" = "ON") then goto PAWN.SKIP
     if ("$roomid" = "%Destination") then return
AUTOMOVE.GO:
     matchre AUTOMOVE.FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE.RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE.RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE.RETURN ^SHOP IS CLOSED(?:\!)?
     matchre AUTOMOVE.INVIS ^The shop appears to be closed, and you can't flag anyone down without being seen
     matchre AUTOMOVE.FAIL.BAIL ^DESTINATION NOT FOUND
     send #goto %Destination
     matchwait
AUTOMOVE.STAND:
     pause 0.1
     matchre AUTOMOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE.STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE.STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE.STAND ^You are still stunned\.
     matchre AUTOMOVE.STAND.PLAYING ^You are a bit too busy performing to do that\.
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
     put #echo >$Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear
     goto %LAST
AUTOMOVE.RETURN:
     if matchre("%Destination", "teller|exchange|debt|PAWN") then if $invisible = 1 then gosub stopinvis
     pause 0.001
     RETURN
AUTOMOVE.STAND.PLAYING:
     matchre AUTOMOVE.STAND ^You stop playing your song\.|^In the name of love\?
     send stop play
     matchwait 15
     goto AUTOMOVE.STAND
AUTOMOVE.INVIS:
     send hum scale
     pause 0.2
     send stop hum
     pause 0.5
     goto AUTOMOVE.GO
#####################################################################################################
####################################################################################
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
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear
     goto %LAST
MOVE.RETURN:
     RETURN
##########################################################################################################################################
# LOCATION CHECKING LOGIC
##########################################################################################################################################
CITY.CHECK:
     if $zoneid = 65 then gosub AUTOMOVE 1
     if $zoneid = 68 then gosub AUTOMOVE shard
     if $zoneid = 69 then gosub AUTOMOVE shard
     if $zoneid = 66 then gosub AUTOMOVE east
     if $zoneid = 31 then gosub AUTOMOVE river
     if $zoneid = 32 then gosub AUTOMOVE river
     if $zoneid = 33 then gosub AUTOMOVE river
     if $zoneid = 13 then gosub AUTOMOVE NTR
     if $zoneid = 7 then gosub AUTOMOVE cross
     if $zoneid = 6 then gosub AUTOMOVE cross
     if $zoneid = 4 then gosub AUTOMOVE cross
     if $zoneid = 8 then gosub AUTOMOVE cross
     if $zoneid = 7 then gosub AUTOMOVE cross
     pause 0.1
     if $zoneid = 69 then var CITY HORSE
     if $zoneid = 99 then var CITY AESRY
     if $zoneid = 90 then var CITY RATHA
     if $zoneid = 42 then var CITY THEREN
     if $zoneid = 30 then var CITY RIVERHAVEN
     if $zoneid = 7 then var CITY ARTHE
     if $zoneid = 1 then var CITY CROSSING
     if $zoneid = 61 then var CITY LETH
     if $zoneid = 67 then var CITY SHARD
     if $zoneid = 116 then var CITY HIB
     pause 0.001
     if $zoneid = 69 then var PawnLoc GO.PAWN.SHARD
     if $zoneid = 99 then var PawnLoc GO.PAWN.AESRY
     if $zoneid = 90 then var PawnLoc GO.PAWN.RATHA
     if $zoneid = 42 then var PawnLoc GO.PAWN.THEREN
     if $zoneid = 30 then var PawnLoc GO.PAWN.HAVEN
     if $zoneid = 7 then var PawnLoc GO.PAWN.CROSS
     if $zoneid = 1 then var PawnLoc GO.PAWN.CROSS
     if $zoneid = 61 then var PawnLoc GO.PAWN.LETH
     if $zoneid = 67 then var PawnLoc GO.PAWN.SHARD
     if $zoneid = 116 then var PawnLoc GO.PAWN.HIB
     if !matchre("$zoneid","(1|7|42|30|61|66|67|68|69|90|99|116)") then goto UNKNOWN.LOCATION
     ECHO
     ECHO *** CITY: %CITY
     ECHO
     var CURRENT_CITY %CITY
     pause 0.1
     RETURN
##########################################################################################################################################
######################
# Random Movement Subroutine
######################
MOVE.RANDOM:
     delay 0.0001
     random 1 13
     if (%r = 1) && (!$north) then goto MOVE.RANDOM
     if (%r = 2) && (!$northeast) then goto MOVE.RANDOM
     if (%r = 3) && (!$east) then goto MOVE.RANDOM
     if (%r = 4) && (!$southeast) then goto MOVE.RANDOM
     if (%r = 5) && (!$south) then goto MOVE.RANDOM
     if (%r = 6) && (!$southwest) then goto MOVE.RANDOM
     if (%r = 7) && (!$west) then goto MOVE.RANDOM
     if (%r = 8) && (!$northwest) then goto MOVE.RANDOM
     if (%r = 9) && (!$out) then goto MOVE.RANDOM
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
     #if (%Occupied) then goto MOVE.RANDOM
     RETURN
##########################################
#  UTILITY GOSUBS                        #
##########################################
SKILL.CHECK:
     ECHO
     ECHO **** Checking Your Skillz....
     ECHO
     send skill thievery
     pause 0.3
     if !def(Thievery.Ranks) then goto NOSKILLS
     if ($Thievery.Ranks < 20) then gosub NOOB
     if (($Thievery.Ranks >= 0) && ($Thievery.Ranks < 20)) then gosub CLASS0
     if (($Thievery.Ranks >= 20) && ($Thievery.Ranks < 40)) then gosub CLASS1
     if (($Thievery.Ranks >= 40) && ($Thievery.Ranks < 60)) then gosub CLASS2
     if (($Thievery.Ranks >= 60) && ($Thievery.Ranks < 80)) then gosub CLASS3
     if (($Thievery.Ranks >= 80) && ($Thievery.Ranks < 100)) then gosub CLASS4
     if (($Thievery.Ranks >= 100) && ($Thievery.Ranks < 150)) then gosub CLASS5
     if (($Thievery.Ranks >= 150) && ($Thievery.Ranks < 200)) then gosub CLASS6
     if (($Thievery.Ranks >= 200) && ($Thievery.Ranks < 250)) then gosub CLASS7
     if (($Thievery.Ranks >= 250) && ($Thievery.Ranks < 300)) then gosub CLASS8
     if (($Thievery.Ranks >= 300) && ($Thievery.Ranks < 400)) then gosub CLASS9
     if (($Thievery.Ranks >= 400) && ($Thievery.Ranks < 500)) then gosub CLASS10
     if (($Thievery.Ranks >= 500) && ($Thievery.Ranks < 600)) then gosub CLASS11
     if (($Thievery.Ranks >= 600) && ($Thievery.Ranks < 700)) then gosub CLASS12
     if (($Thievery.Ranks >= 700) && ($Thievery.Ranks < 800)) then gosub CLASS13
     if (($Thievery.Ranks >= 800) && ($Thievery.Ranks < 900)) then gosub CLASS14
     if (($Thievery.Ranks >= 900) && ($Thievery.Ranks < 1000)) then gosub CLASS15
     if (($Thievery.Ranks >= 1000) && ($Thievery.Ranks < 1200)) then gosub CLASS16
     if (($Thievery.Ranks >= 1200) && ($Thievery.Ranks < 1450)) then gosub CLASS17
     if ($Thievery.Ranks >= 1450) then gosub CLASS18
     RETURN
############################################################################################
GUILD.CHECK:
     pause 0.1
     echo
     echo **** CHECKING GUILD...................
     echo
     if ("$Guild" = "Warrior") then put #var Guild Warrior Mage
     if ("$Guild" = "Moon") then put #var Guild Moon Mage
     pause 0.2
     pause 0.2
     if !def(Guild) || !matchre("$Guild","(Thief|Barbarian|Empath|Warrior Mage|Cleric|Bard|Moon Mage|Ranger|Necromancer|Trader)") then
          {
               action var Guild $1;put #var Guild $1 when Guild: (\D+)
               action var Circle $1;put #var Circle $1 when Circle: (\D+)
               send info;encum
               waitforre ^\s*Encumbrance\s*\:
               action remove Guild: (\S+)
               action remove Circle: (\d+)
               put #var save
               pause 0.5
          }     
     ECHO **** Guild: $Guild  *****
     ECHO **** Circle: $Circle *****
     if ("$Guild" = "Thief") then
        {
            var marking ON
            if ("%HAVEN_PW" = "null") || ("%SHARD_PW" = "null") then goto NO.PASSWORD
            if ("%BIN" = "ON") && ("%PAWN" = "ON") && ("%BIN_CONTAINER" = "%PAWN_CONTAINER") then goto BAG.ALERT
            #if (%STEALCOUNT > 4) && ($Thievery.Ranks < 120) then var STEALCOUNT 4
        }
     if ("$Guild" != "Thief") then
        {
            var BIN OFF
            var marking OFF
        }
     if $gamename != DRF then var ClanItem NO
     put #var save
     RETURN
############################################################################################
TIME.CALC:
     evalmath runTime (%t / 60)
     evalmath runTime round(%runTime,2)
     RETURN
TIME.CHECK:
     ECHO **** CHECKING TIME....
     matchre NIGHT.TIME early evening|mid-evening|late evening|evening|midnight|night|dawn|sunset|approaching sunrise|sunrise|you can't tell
     matchre DAY.TIME early morning|mid-morning|midday|late morning|noon|early afternoon|mid-afternoon|late afternoon|dusk
     send time
     matchwait 15
     goto NIGHT.TIME
DAY.TIME:
     put #var TIME DAY
     var TIME DAY
     send observe weather
     pause 0.5
     RETURN
NO.TIME:
NIGHT.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     send observe weather
     pause 0.5
     RETURN
##############################################################################################
PREMIUM.CHECK:
     matchre PREMIUM.NO ^You are not currently a Premium
     matchre PREMIUM.YES ^Your premium service has been continuous
     put ltb info
     matchwait 15
     goto PREMIUM.NO
PREMIUM.NO:
     var PREMIUM OFF
     ECHO *** PREMIUM ACCOUNT NOT ACTIVE - USING REGULAR BANK TO EXCHANGE COINS
     pause
     RETURN
PREMIUM.YES:
     var PREMIUM ON
     ECHO *** PREMIUM ACCOUNT ENABLED - USING PREMIUM BANK TO EXCHANGE COINS
     pause
     RETURN
##############################################################################################
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
     if ("$righthand" != "Empty") then send lower $righthandnoun
     if ("$lefthand" != "Empty") then send lower $lefthandnoun
     pause 0.1
     pause 0.1
     pause 0.1
     RETURN
CIRCLE.CHECK:
     if (toupper("%CIRCLE.UP") != "ON") then return
     if ("$zoneid" = "1") then var GL kalag
     if ("$zoneid" = "30") then var GL crow
     if ("$zoneid" = "67") then var GL saishla
     if ("$zoneid" = "90") then var GL dwillig
     pause 0.5
     matchre CIRCLE.UP Excellent work, $charactername|Congrats, $charactername|$charactername, you made it to the next rank|I'll let it be known you've moved up in the underworld|You're ready to train for your next rank|You are ready to train for your next level
     matchre CIRCLE.RETURN You have some work to do|you should work on
     put ask %GL about exp
     put ask %GL about exp
     matchwait 15
     RETURN
CIRCLE.UP:
     pause 0.1
     pause 0.1
     action var circle $1;put #var circle $1 when Circle: (\d+)
     send info;encum
     waitforre ^\s*Encumbrance\s*\:
     action remove Circle: (\d+)
     pause 0.1
     put #echo >Log DarkOrchid *******************************************
     put #echo >Log DarkOrchid *** DING! Leveled up! Circle $Circle ! ****
     put #echo >Log DarkOrchid *******************************************
     goto CIRCLE.CHECK
CIRCLE.RETURN:
     pause 0.1
     pause 0.1
     RETURN
PAUSE:
     if ($roundtime > 0) then pause $roundtime
     pause 0.5
     pause 0.01
     RETURN
KNEEL:
     pause 0.2
     send kneel
     pause 0.5
STAND:
     pause 0.1
     pause 0.1
     matchre STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre STAND.PLAYING ^You are a bit too busy performing
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
     matchwait 15
     goto STAND
STAND.PLAYING:
     send stop play
     pause 0.1
     goto STAND
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
     matchre RETURN ^You don't think
     matchre RETURN ^.* notices your attempt to hide\!
     matchre RETURN ^.* reveals you, ruining your hiding attempt\!|
     matchre RETURN ^.* discovers you, ruining your hiding place\!
     matchre RETURN ^You melt|^You blend|^Eh\?|^You slip|^Roundtime|^You look around
     send hide
     matchwait 15
     RETURN
SNEAK:
     var direction $0
     if (("$Guild" = "Thief") && ($Circle < 50)) then goto SNEAK.HIDE
SNEAKING:
     pause 0.1
     matchre SNEAK.PAUSE ^\.\.\.wait|^Sorry\,
     matchre RETURN Roundtime|You sneak|You duck|You quickly slip
     send sneak %direction
     matchwait 15
SNEAK.PAUSE:
     pause
     goto SNEAKING
SNEAK.HIDE:
     pause 0.1
     pause 0.1
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SNEAK.HIDE notices your attempt|reveals you|ruining your hiding place|discovers you
     matchre SNEAKING ^You melt|^You blend|^Eh\?|^You slip|^Roundtime|You look around
     send hide
     matchwait
UNHIDE:
     pause 0.1
     pause 0.1
     matchre UNHIDE ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STAND ^You try to creep out of hiding but your injuries
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are not hidden\!
     matchre RETURN ^You come out of hiding\.
     matchre RETURN ^You slip out of hiding
     send UNHIDE
     matchwait 15
     RETURN
STOWING:
     var location STOWING
     pause 0.1
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     if matchre("$righthandnoun","(crossbow|bow|short bow)") then gosub unload
     #if matchre("$righthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     #if matchre("$lefthand","(partisan|shield|buckler|crossbow|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN
STOWIT:
     var location STOW1
     var todo $0
STOW1:
     pause 0.1
     pause 0.1
     if matchre("$righthand","longbow") then goto stow4
     matchre STOW2 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^You stop as you realize
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^That can't be picked up
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo
     goto retry
STOW2:
     pause 0.3
     pause 0.1
     var location STOW2
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %PAWN_CONTAINER
     goto retry
STOW3:
     pause 0.3
     pause 0.1
     var location STOW3
     if "$lefthandnoun" = "bundle" then send drop bun
     if "$righthandnoun" = "bundle" then send drop bun
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %BIN_CONTAINER
     send stow %todo in my %BIN_CONTAINER
     goto retry
STOW4:
     pause 0.5
     pause 0.1
     var location STOW4
     if "$lefthandnoun" = "bundle" then send drop bun
     if "$righthandnoun" = "bundle" then send drop bun
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your|^You easily|^You strap
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW.DROP any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     send stow %todo in my %PAWN_CONTAINER
     send stow %todo in my %SAFE_CONTAINER
     goto retry
REM.WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto wear1
#### WEAR SUB
WEAR:
     delay 0.0001
     var stow $0
     var LOCATION WEAR.1
     WEAR.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW1 ^You can't wear that\!
     matchre STOW1 ^You can't wear any more items like that\.
     matchre STOW1 ^You need at least one free hand for that\.
     matchre STOW1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|slide|slip|attach|work|strap) .*\.
     matchre RETURN ^You are already wearing that\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %stow
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %stow
     put #log $datetime MISSING MATCH IN WEAR (utility.inc)
     return
search.p:
pause
pause
search:
     var todo $0
     var location search
     matchre RETURN ^Success\!
     matchre search.p ^Roundtime
     matchre search.p ^You search around for a moment
     put search %todo
     matchwait 15
     goto retry
retry:
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
     matchwait
location.unload:
     gosub unload
     var location stow1
     gosub stow1
     goto %location
location.unload1:
     gosub unload
     var location wear1
     gosub wear1
     goto %location
location1:
     gosub stop.humming1
     goto %location
location.p:
     pause
location:
     pause 0.3
     goto %location
RETURN.p:
     pause 0.1
unload:
     var location unload
     matchre RETURN ^You unload the
     matchre RETURN ^You remain concealed by your surroundings, convinced that your unloading
     matchre RETURN ^Roundtime:
     matchre RETURN ^But your
     matchre RETURN ^You don't have a
     matchre RETURN ^You can't unload such a weapon\.
     matchre RETURN ^Your
     send unload
     goto retry
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
     matchre RETURN_CLEAR ^You (?:hand|slide|get|work|pull|tug|shuffle|attach|push|move|put|now|scan|wear|sling|slowly|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^But (that|you) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^The|^That|too injured
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already|has already
     matchre RETURN_CLEAR ^Tie it off
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^Your (?:actions|dance|fingers|song).*\.
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^Subservient type|^The shadows|^Close examination|^Try though
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Using slow
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
     matchre RETURN_CLEAR ^You're already stalking
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
     gosub stow
     goto PUT_1
#### GET SUB
GET:
     delay 0.0001
     var get $0
     var LOCATION GET_1
     GET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     # matchre RETURN ^\s*You get .*\.
     matchre RETURN_CLEAR ^You pick up .*\.
     matchre RETURN_CLEAR ^You carefully remove .* from the bundle\.
     matchre RETURN_CLEAR ^You are already holding that\.
     matchre RETURN_CLEAR ^Get what\?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^You (?:get|grab) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET
     RETURN
#### HOLD SUB
HOLD:
     delay 0.0001
     var get $0
     var LOCATION HOLD_1
     HOLD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN_CLEAR ^You (?:sling|slide|work|slip|loosen|get|take|pull|remove|are already) .*(?:\.|\!|\?)?
     matchre RETURN_CLEAR ^Get what\?
     matchre RETURN_CLEAR ^Hold hands with whom\?
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     send hold %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN HOLD (base.inc)
     RETURN
#### DOUBLE PUT SUB
PUT_IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT_IT.1
     PUT_IT.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:hand|push|move|put|whisper|lean|tap|pick|silently|slip|stop|open|close|drop|place|knock|grab|fade|toss|set|add|offer|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^That's too heavy
     matchre RETURN_CLEAR ^There isn't
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^Perhaps you should be holding that first\.
     send put %putit
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT_IT!  ***
     put #echo >$Log Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT_IT
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
     matchre RETURN_CLEAR ^\[You have marked this room to be cleaned by the janitor\.  It should arrive shortly\.\]
     matchre RETURN_CLEAR ^The janitor was recently summoned to this room\.\s+Please wait \d+ seconds\.
     matchre RETURN_CLEAR ^You should just kick yourself in the shin\.  There is no junk here\.
     send dump junk
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
     matchwait
KICKEM:
     delay 0.0001
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     pause 0.001
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     pause 0.001
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
PREPARE:
     delay 0.0001
     var prepare $0
     var LOCATION PREPARE.1
     PREPARE.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL.CAST.RETURN ^You are already preparing the .* spell\!
     matchre SPELL.CAST.RETURN ^You begin chanting .* to invoke the .* spell\.
     matchre SPELL.CAST.RETURN ^You mutter .* to yourself while preparing the .* spell\.
     matchre SPELL.CAST.RETURN ^With .* movements you prepare your body for the .* spell\.
     matchre SPELL.CAST.RETURN ^You raise your .* skyward\, chanting the .* of the .* spell\.
     matchre SPELL.CAST.RETURN ^You trace .* sigil in the air\, shaping the pattern of the .* spell\.
     matchre SPELL.CAST.RETURN ^You rock back and forth\, humming tunelessly as you invoke the .* spell\.
     matchre SPELL.CAST.RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL.CAST.RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^You close your eyes and breathe deeply, gathering energy for the .* spell\.
     matchre SPELL.CAST.RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL.CAST.RETURN ^A soft breeze surrounds your body as you confidently prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^Tiny tendrils of lightning jolt between your hands as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^Heatless orange flames blaze between your fingertips as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^Entering a trance-like state\, your hands begin to tremble as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^You adeptly sing the incantations for the .* spell\, setting the words to a favorite tune\.
     matchre SPELL.CAST.RETURN ^You bring your hand slowly to your forehead as you begin chanting the words of the .* spell\.
     matchre SPELL.CAST.RETURN ^Icy blue frost crackles up your arms with the ferocity of a blizzard as you begin to prepare the .* spell\!
     matchre SPELL.CAST.RETURN ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL.CAST.RETURN ^You giggle to yourself as you move through the syncopated gestures that accompany the preparations of the .* spell\.
     matchre SPELL.CAST.RETURN ^Darkly gleaming motes of sanguine light swirl briefly about your fingertips as you gesture while uttering the .* spell\.
     matchre SPELL.CAST.RETURN ^As you begin to solemnly intone the .* spell a blue glow swirls about forming a nimbus that surrounds your entire being\.
     matchre SPELL.CAST.RETURN ^Your skin briefly withers and tightens\, becoming gaunt as the energies of the .* spell begin to build up through your body\.
     matchre SPELL.CAST.RETURN ^You trace an intricate rune in the air with your finger\, illusory lines lingering several seconds as you prepare the .* spell\.
     matchre SPELL.CAST.RETURN ^You begin reciting a solemn incantation\, causing familiar patterns of geometric shapes to circle your hand as the .* spell forms\.
     matchre SPELL.CAST.RETURN ^You take up a handful of dirt in your palm to prepare the .* spell\.  As you whisper arcane words\, you gently blow the dust away and watch as it becomes swirling motes of glittering light that veil your hands in a pale aura\.
     matchre SPELL.CAST.RETURN ^You recall the exact details of the .* symbiosis\, preparing to integrate it with the next spell you cast\.
     matchre SPELL.CAST.RETURN ^But you've already prepared the .* symbiosis\!
     matchre SPELL.CAST.DONE ^What do you want to prepare\?
     matchre SPELL.CAST.DONE ^That is not a spell you can cast\.
     matchre SPELL.CAST.DONE ^You wouldn't have the first clue how to do that\.
     matchre SPELL.CAST.DONE ^You stop\, convinced that there's no way to control that much mana\.
     matchre SPELL.CAST.FAIL ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL.CAST.FAIL ^You feel intense strain as you try to manipulate the mana streams to form this pattern\, and you are not certain that you will have enough mental stamina to complete it\.
     send prepare %prepare
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PREPARE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Prepare = %prepare
     put #log $datetime MISSING MATCH IN PREPARE! (utility.inc)
     goto SPELL.CAST.RETURN
SPELL.WAIT:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre SPELL.CAST ^You feel fully prepared to cast your spell\.
     matchre SPELL.CAST.FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     matchwait
SPELL.CAST:
     delay 0.0001
     var LOCATION SPELL.CAST.1
     if ((!("$roomplayers" = "")) && (matchre("$preparedspell", "(Rite of Contrition|Eyes of the Blind)")) then gosub MOVE.RANDOM
     SPELL.CAST.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL.CAST.DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL.CAST.DONE ^You wave your hand\.
     matchre SPELL.CAST.DONE ^You gesture\.
     matchre SPELL.CAST.DONE ^Your heart skips a beat
     matchre SPELL.CAST.DONE ^Focus the power of justice on whom\?
     matchre SPELL.CAST.DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL.CAST.FAIL ^You don't have a spell prepared\!
     matchre SPELL.CAST.FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast;-2 gesture
     matchwait
SPELL.WAIT.TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre RETURN ^You feel fully prepared to cast your spell\.
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Your target pattern dissipates because the creature is dead\, but the main spell remains intact
     matchwait
SPELL.CAST.TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     var target $0
     var LOCATION SPELL.CAST.TARGET_1
     SPELL.CAST.TARGET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL.CAST.DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL.CAST.DONE ^You gesture\.
     matchre SPELL.CAST.DONE ^Your heart skips
     matchre SPELL.CAST.DONE ^Focus the power of justice on whom\?
     matchre SPELL.CAST.DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL.CAST.FAIL ^You don't have a spell prepared\!
     matchre SPELL.CAST.FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast %target;-2 gesture
     matchwait
SPELL.CAST.DONE:
     delay 0.0001
     put #queue clear
     return
SPELL.CAST.FAIL:
     delay 0.0001
     gosub RELEASE
SPELL.CAST.RETURN:
     delay 0.0001
     return
RELEASE.MANA:
     delay 0.0001
     if ("$preparedspell" != "None") then gosub RELEASE spell
     gosub RELEASE mana
     put #echo Crimson *****************************************************
     put #echo Crimson ***** ATTUNEMENT IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson *****************************************************
     if ($mana < 80) then waiteval ($mana > 79)
CHECK.MANA:
     delay 0.0001
     if ($mana < 25) then goto RELEASE.MANA
     return
RELEASE:
     delay 0.0001
     var release $0
     var LOCATION RELEASE.1
     RELEASE.1:
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
     var LOCATION HARNESS.1
     HARNESS.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RELEASE ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You tap into the mana from .* of the surrounding streams and
     send harness %harness
     matchwait

#### HEALTH CHECKING
HEALTH.CHECK:
     if ("%HEALTH_CHECK" != "ON") then
          {
               ECHO *** SKIPPING HEALTH CHECK - YOU BAD PERSON YOU
               ECHO *** Don't blame me if you script with bleeders and get caught a ton!
               pause 4
               RETURN
          }
     delay 0.0001
     put #tvar needHealing 0
     delay 0.5
     matchre HEALTH.GOOD ^You have no significant injuries\.
     matchre HEALTH.BAD ^hand
     matchre HEALTH.BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH.CHECK
HEALTH.BAD:
     delay 0.0001
     put #tvar needHealing 1
     delay 0.5
     goto TOO.HURT
HEALTH.GOOD:
     delay 0.0001
     put #queue clear
     put #tvar needHealing 0
     delay 0.5
     RETURN
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
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return
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

     if (%Banked > 0) then
          {
               put #tvar Plat 0
               put #tvar Gold 0
               put #tvar Silver 0
               put #tvar Bronze 0
               put #tvar Copper 0
          }
     math Banked add 1
## Combines profit from multiple bank runs to show total profit at end
## Saves your profit from all bank deposits in temp global variables so you can add total profit to your main script profit tracking
SAVE.PROFIT:
     put #tvar Plat %Plat
     put #tvar Gold %Gold
     put #tvar Silver %Silver
     put #tvar Bronze %Bronze
     put #tvar Copper %Copper
     pause 0.1
     put #statusbar 1 Stealing Profit: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper
     put #parse MONEY DONE
     RETURN
## FOR GLOBAL PROFIT TRACKING - THE TOTAL PROFIT OVER ALL TIME
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
     put #parse PROFITPARSE $StealingProfit PROFITPARSE
     action (profitparse) off
     RETURN
#############################################
# BANK GOSUBS
#############################################
COMBINE.BANK:
     math Plats add $Plat
     math Golds add $Gold
     math Silvers add $Silver
     math Bronzes add $Bronze
     math Coppers add $Copper
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
############################################################################################
#### JAIL HANDLING
#### DEBT PAYING ROUTINE
#### ROBUST AS A MOTHERFUCKER
############################################################################################
JAILED:
JAIL.CHECK:
     put #parse TAKING CARE OF BUSINESS
     action instant goto PLEAD when ^The eyes of the court|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying|You don't seem to be able
     #put #script pause %ScriptName
     if ("$zoneid" = "1") then goto CROSSING.JAIL
     if ("$zoneid" = "30") then goto HAVEN.JAIL
     if ("$zoneid" = "42") then goto THEREN.JAIL
     if ("$zoneid" = "61") then goto LETH.JAIL
     if ("$zoneid" = "116") then goto HIB.JAIL
     if ("$zoneid" = "67") then goto SHARD.JAIL
     if ("$zoneid" = "99") then goto AESRY.JAIL
     if ("$zoneid" = "90") then goto RATHA.JAIL
     pause 0.2
     goto JAILED
AESRY.JAIL:
     var CURRENT_CITY AESRY
     ECHO Aesry JAIL
     put #parse AESRY JAIL
     goto INIT.JAIL
RATHA.JAIL:
     var CURRENT_CITY RATHA
     ECHO Ratha JAIL
     put #parse RATHA JAIL
     goto INIT.JAIL
THEREN.JAIL:
     var CURRENT_CITY THEREN
     ECHO Theren JAIL
     put #parse THEREN JAIL
     goto INIT.JAIL
HAVEN.JAIL:
     var CURRENT_CITY RIVERHAVEN
     ECHO RIVERHAVEN JAIL
     put #parse RIVERHAVEN JAIL
     goto INIT.JAIL
LETH.JAIL:
     var CURRENT_CITY LETH
     ECHO LETH JAIL
     put #parse LETH JAIL
     goto INIT.JAIL
CROSSING.JAIL:
     var CURRENT_CITY CROSSING
     ECHO CROSSING JAIL
     put #parse CROSS JAIL
     goto INIT.JAIL
HIB.JAIL:
     var CURRENT_CITY HIB
     ECHO HIB JAIL
     put #parse HIB JAIL
     goto INIT.JAIL
SHARD.JAIL:
     var CURRENT_CITY SHARD
     ECHO SHARD JAIL
     put #parse SHARD JAIL
     goto INIT.JAIL
INIT.JAIL:
     math Jailed add 1
     ECHO
     ECHO *** YOU'VE BEEN JAILED IN %CURRENT_CITY! ***
     ECHO
     ECHO *** Taking care of business..
     put #echo >log Orange **** ARRESTED IN %CURRENT_CITY ****
     if (%Jailed = 1) then var JAIL %CURRENT_CITY
     if (%Jailed = 2) then var JAIL2 %CURRENT_CITY
     if (%Jailed = 3) then var JAIL3 %CURRENT_CITY
     if (%Jailed = 4) then var JAIL4 %CURRENT_CITY
     if ("$zoneid" = "67") && ($roomid = 528) then goto GET.SACK
     if ("$zoneid" = "1") && ($roomid = 409) then goto GET.SACK
     if ("$zoneid" = "30") && ($roomid = 270) then goto GET.SACK
     if ("$zoneid" = "42") && ($roomid = 125) then goto GET.SACK
     if ("$zoneid" = "61") && ($roomid = 172) then goto GET.SACK
     if ("$zoneid" = "116") && ($roomid = 202) then goto GET.SACK
     pause 0.0001
     ECHO *** WAITING FOR SENTENCE! ***
JAIL.FORAGE:
     pause 0.2
     if (!$standing) then gosub STAND
     if !matchre("$zoneid" , "(67|61)") then goto PLEAD.WAIT
     gosub KICKEM
     if ("$zoneid" = "67") then gosub collect dust bunny
     if ("$zoneid" = "61") then gosub collect coin
     pause 0.5
     goto JAIL.FORAGE
PLEAD.WAIT:
     waitforre ^The eyes of the court|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying|You don't seem to be able
PLEAD:
     action remove ^The eyes of the court|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying|You don't seem to be able
     pause 0.5
     pause 0.2
     pause 0.1
     send plead %PLEAD
     pause 2
     if ("$zoneid" = "1") && ("$roomid" = "23") then goto STOCKS
GET.SACK:
     pause 0.1
     pause 0.1
     matchre GET.SACK ^\.\.\.wait|^Sorry\,
     matchre DEBT ^You glance down at your empty hands
     matchre PLEAD ^You don't seem to be able to move
     match SACK small sack
     send glance
     matchwait
DEBT:
     gosub STAND
     if matchre("$roomobjs","(rat)") then
          {
               gosub put get rat
               gosub put wear rat
          }
     ECHO
     ECHO **** GETTING COIN TO PAY FINE ****
     ECHO
     pause 0.5
     if ("$zoneid" = "42") then goto THEREN.JAIL.GET.FINE
     gosub clear
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     if ("$zoneid" = "90") then
          {
               var GUARD 1guard
               if ("$roomid" = "349") then var GUARD 1guard
               if ("$roomid" = "581") then var GUARD 3guard
          }
     pause 0.1
TO.TELLER:
     var plat 20
     if ("$zoneid" = "116") then
          {
               gosub automove 1teller
               goto FINECHECK.FORFEDHDAR
          }
     if ("$zoneid" = "90") then
          {
               gosub AUTOMOVE 1teller
               goto FINECHECK.QI
          }
     gosub AUTOMOVE teller
     if ("$zoneid" = "99") then goto FINECHECK.QI
     if ("$zoneid" = "61") then goto FINECHECK.ZOLUREN
     if ("$zoneid" = "1") then goto FINECHECK.ZOLUREN
     if ("$zoneid" = "30") then goto FINECHECK.THERENGIA
     if ("$zoneid" = "34a") then goto FINECHECK.THERENGIA
     if ("$zoneid" = "42") then goto FINECHECK.THERENGIA
     if ("$zoneid" = "67") then goto FINECHECK.ILITHI
     pause
     ECHO
     ECHO *** CRITICAL ERROR!
     ECHO *** UKNOWN JAIL LOCATION!!
     ECHO
     put #echo >Log Red *** CRITICAL ERROR!!!!
     put #echo >Log Red *** UNKOWN JAIL LOCATION: Zone- $zoneid Room- $roomid
     put #echo >Log Red *** PAY YOUR FINE MANUALLY!
     pause 0.1
     exit
FINECHECK.QI:
var LOCATION FINECHECK.QI
     matchre SET.FINE Qi\.\s*\((\d+) copper Lirums\)
     match NO.FINE Wealth:
     send wealth
     matchwait
FINECHECK.THERENGIA:
var LOCATION FINECHECK.THERENGIA
     matchre SET.FINE Therengia\.\s*\((\d+) copper Lirums\)
     match NO.FINE Wealth:
     send wealth
     matchwait
FINECHECK.ZOLUREN:
var LOCATION FINECHECK.ZOLUREN
     matchre SET.FINE Zoluren\.\s*\((\d+) copper Kronars\)
     match NO.FINE Wealth:
     send wealth
     matchwait
FINECHECK.ILITHI:
var LOCATION FINECHECK.ILITHI
     matchre SET.FINE Ilithi\.\s*\((\d+) copper Dokoras\)
     match NO.FINE Wealth:
     send wealth
     matchwait
FINECHECK.FORFEDHDAR:
var LOCATION FINECHECK.FORFEDHDAR
     matchre SET.FINE Forfedhdar\.\s*\((\d+) copper Dokoras\)
     match NO.FINE Wealth:
     send wealth
     matchwait
SET.FINE:
     pause 0.1
     var fine $1
     if (%fine > 250000) then goto BIGGER.FINE
     if (%fine > 100000) then goto BIG.FINE
     goto WITHDRAW
WITHDRAW:
var LOCATION WITHDRAW
     if ($invisible = 1) then gosub stopinvis
     pause 0.2
     pause 0.1
     matchre WITHDRAW ^\.\.\.wait|^Sorry\,
     matchre BANK.INVIS ^How can you withdraw money when the clerk can't even see
     matchre TO.TELLER ^You must be at a bank teller's window
     matchre PAY.DEBT ^The clerk counts out
     matchre NO.FUNDS we are not lending money|You don't have that much
     send withdraw %fine copper
     matchwait 15
     goto NO.FUNDS
BIG.FINE:
var LOCATION BIG.FINE
     if ($invisible = 1) then gosub stopinvis
     pause 0.2
     pause 0.1
     matchre BIG.FINE ^\.\.\.wait|^Sorry\,
     matchre BANK.INVIS ^How can you withdraw money when the clerk can't even see
     matchre TO.TELLER ^You must be at a bank teller's window
     matchre PAY.DEBT ^The clerk counts out
     matchre NO.FUNDS we are not lending money|You don't have that much
     send withdraw %plat plat
     matchwait 15
     goto NO.FUNDS
BANK.INVIS:
     gosub PUT hum scale
     pause 0.1
     gosub PUT stop hum
     pause 0.1
     goto %LOCATION
BIGGER.FINE:
var LOCATION BIGGER.FINE
     if (%fine >= 2000000) then var plat 300
     if (%fine >= 1500000) then var plat 200
     if (%fine >= 1200000) then var plat 150
     if (%fine >= 900000) then var plat 120
     if (%fine >= 500000) then var plat 90
     if (%fine >= 450000) then var plat 50
     if (%fine >= 400000) then var plat 45
     if (%fine >= 350000) then var plat 40
     if (%fine >= 250000) then var plat 35
     if (%fine >= 200000) then var plat 25
     goto BIG.FINE
NO.FINE:
     ECHO
     ECHO *** You have no fine
     ECHO
     goto RETURN.TO.JAIL
PAY.DEBT:
var LOCATION PAY.DEBT
     ECHO
     ECHO **** Paying off your debt! ***
     ECHO
     pause
     pause 0.5
     # Walking to pay off the debt
     gosub AUTOMOVE debt
     if ($invisible = 1) then gosub stopinvis
     send pay %fine
     pause
     if ("$zoneid" = "116") then
          {
               gosub automove 1teller
               goto DONE.DEBT
          }
     if ("$zoneid" = "90") then
          {
               gosub AUTOMOVE 1teller
               goto DONE.DEBT
          }
     gosub AUTOMOVE teller
DONE.DEBT:
var LOCATION DONE.DEBT
     pause 0.1
     if ($invisible = 1) then gosub stopinvis
     send dep all
     pause 0.1
RETURN.TO.JAIL:
     ECHO
     ECHO **** Heading back to jail now ****
     ECHO
     pause 0.5
     if ("$zoneid" = "42") then goto THEREN.KEEP.JAIL
     if ("$zoneid" = "90") then goto RATHA.JAIL.RETURN
     if ("$zoneid" = "67") then goto SHARD.JAIL.RETURN
     if ("$zoneid" = "116") then goto HIB.JAIL.RETURN
     # Walking to the Guard House
     gosub AUTOMOVE Guard
     goto CLAN
RATHA.JAIL.RETURN:
     gosub AUTOMOVE 1GUARD
     goto CLAN
HIB.JAIL.RETURN:
     gosub AUTOMOVE 200
     goto CLAN
SHARD.JAIL.RETURN:
     gosub AUTOMOVE sentin
CLAN:
     var removed no
     var itemsRemoved 0
CLAN2:
     ECHO *** Checking for worn items before grabbing sack
     ECHO
     pause 0.6
     matchre CLAN.ITEM ^You aren't wearing anything
     matchre REMOVE.ITEM (\S+)(\.)
     put inv
     matchwait 15
     put #echo >Log Red *** Missing Match Label in CLAN.ITEM.PAUSE
     put #log $datetime MISSING MATCH IN CLAN.ITEM.PAUSE ***
REMOVE.ITEM:
     var wornItem $0
     var removed yes
     if ("$lefthand" != "Empty") && ("$righthand" != "Empty") then goto CRIT.ERROR
     gosub PUT remove my %wornItem
     pause 0.5
     pause 0.2
     if %itemsRemoved = 0 then var item1 %wornItem
     if %itemsRemoved = 1 then var item2 %wornItem
     math items.removed add 1
CLAN.ITEM:
     if ("%ClanItem" = "NO") then goto THE.SACK
     if ("$gamename" = "DRF") then send remove %CLAN.ITEM.NAME
THE.SACK:
     if ($invisible = 1) then gosub stopinvis
     pause 0.5
     matchre THE.SACK ^\.\.\.wait|^Sorry\,|^What were you|^I could not|^Please rephrase
     matchre SACK.PRE ^You reach for your sack and retrieve the equipment
     matchre CLAN2 ^You'll need to not be wearing anything
     matchre CLAN2 ^Realizing you're wearing too much
     matchre DEBT paid off your debt to society
     send get $charactername sack
     matchwait 15
     goto GET.SACK
STOCKS:
     ECHO
     ECHO *** You got the stocks! Wait it out or plead for mercy
     ECHO
     pause
     send plead release
     waitforre ^You accept a sack and retrieve the equipment|^YOU HAVE BEEN
     pause 0.5
     pause 0.5
     pause 0.2
     if (!$standing) then gosub STAND
SACK.PRE:
     if ("%ClanItem" = "YES") then gosub put wear %CLAN_ITEM_NAME
     if ("%ClanItem" = "YES") then gosub put rub %CLAN_ITEM_NAME
     pause 0.2
     pause 0.1
     gosub PUT open my %SAFE_CONTAINER
     gosub PUT open my %BACKUP_CONTAINER
     pause 0.2
     pause 0.3
     if ("%removed" = "yes") then
          {
          gosub PUT wear my %wornItem
          pause 0.1
          if ("%item2" != "null") then gosub PUT wear my %item2
          pause 0.1
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my ring
          if matchre("$righthandnoun|$lefthandnoun", "key") then gosub PUT wear my key
          if matchre("$righthandnoun|$lefthandnoun", "toad") then gosub PUT wear my toad
          if matchre("$righthandnoun|$lefthandnoun", "obsidian") then gosub PUT wear my obsidian
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT wear my rat
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT stow my rat
          if matchre("$righthandnoun|$lefthandnoun", "kitten") then gosub PUT wear my kitten
          if matchre("$righthandnoun|$lefthandnoun", "kitten") then gosub PUT stow my kitten
          if matchre("$righthandnoun|$lefthandnoun", "pig") then gosub PUT wear my pig
          if matchre("$righthandnoun|$lefthandnoun", "pig") then gosub PUT stow my pig
          if matchre("$roomobjs","(pig|kitten|rat)") then gosub stow $0
          pause 0.3
          pause 0.01
          pause 0.01
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my second ring
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT wear my second rat
          pause 0.3
          pause 0.01
          pause 0.01
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my third ring
          pause 0.3
          pause 0.01
          pause 0.01
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my fourth ring
          if matchre("$righthandnoun|$lefthandnoun", "kitten") then gosub PUT stow my kitten
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT stow my rat
          if matchre("$righthandnoun|$lefthandnoun", "pig") then gosub PUT stow my pig
          pause 0.3
          pause 0.01
          pause 0.01
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my fifth ring
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT STOW my ring in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT STOW my rat in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "pig") then gosub PUT STOW my pig in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "kitten") then gosub PUT STOW my kitten in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT STOW my second ring in my %SAFE_CONTAINER
          pause 0.1
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT STOW my third ring in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT STOW my fourth ring in my %SAFE_CONTAINER
          pause 0.1
          }
     pause 0.001
     pause 0.001
     if ("$righthand" != "Empty") then
          {
               if ("$righthandnoun" != "sack") then gosub PUT stow right in my %SAFE_CONTAINER
          }
     if ("$lefthand" != "Empty") then
          {
               if ("$lefthandnoun" != "sack") then gosub PUT stow left in my %SAFE_CONTAINER
          }
     pause 0.1
     pause 0.1
     if ("$righthand" != "Empty") || ("$lefthand" != "Empty") then
          {
               if ("$righthandnoun" != "sack") then gosub PUT stow right in my %BACKUP_CONTAINER
               if ("$lefthandnoun" != "sack") then gosub PUT stow left in my %BACKUP_CONTAINER
               pause 0.2
          }
SACK:
     pause 0.1
     pause 0.2
     gosub PUT open my small sack
     gosub JAIL.EMPTY sack
     pause 0.5
     pause 0.5
     matchre PET \brat\b|kitten|\bpig\b
     matchre STOW.IT backpack|duffel bag|haversack|knapsack
     matchre STOW.IT mining (\S+)(\.)
     matchre ODD.ITEM khuj|quarterstaff|quarter staff|halberd|toad|key
     matchre GET.SACK.ITEM (\S+)(\.)
     matchre NO.MORE.ITEMS ^There is nothing in there|^I could not find|^What were you
     match SACK That is closed.
     send look in my small sack
     matchwait 15
     put #echo >Log Red *** Missing match label in - SACK:
     put #log $datetime MISSING MATCH IN SACK: ***
     gosub stowing
     goto NO.MORE.ITEMS
PET:
     var item $0
     pause 0.1
     gosub PUT get %item
     pause 0.5
     send wear %item
     pause 0.2
     gosub stowing
     pause 0.5
     goto SACK
STOW.IT:
     var item $0
     send get %item from my small sack
     pause 0.5
     pause 0.2
     send put my %item in my %SAFE_CONTAINER
     pause 0.5
     pause 0.1
     if ("$lefthand" != "Empty") then gosub PUT my $lefthand in my %PAWN_CONTAINER
     pause 0.1
     pause 0.5
     if ("$lefthand" != "Empty") then gosub PUT my $lefthand in my %BIN_CONTAINER
     pause 0.2
     goto SACK
ODD.ITEM:
     var item $0
     gosub GET %item from my small sack
     pause 0.5
     pause 0.2
     send wear my %item
     pause 0.5
     pause 0.2
     send put my $lefthand in my %SAFE_CONTAINER
     pause 0.5
     if ("$lefthand" != "Empty") then send put my $lefthand in my %BACKUP_CONTAINER
     pause 0.4
     if ("$lefthand" != "Empty") then send wear my $lefthand
     pause 0.4
     if ("$lefthand" = "Empty") then goto SACK
     if ("$lefthand" != "Empty") then gosub PUT stow left in my %BIN_CONTAINER
     if ("$lefthand" != "Empty") then gosub PUT stow left in my %PAWN_CONTAINER
     pause 0.3
     goto SACK
GET.SACK.ITEM:
     pause 0.5
     if $1 = there then goto NO.MORE.ITEMS
     send get $1 from my small sack
     pause 0.5
     pause 0.1
     pause 0.1
     pause 0.1
     if matchre("%IMPORTANT_ITEMS", "$1") then send put my $1 in my %SAFE_CONTAINER
     if matchre("%ring", "$1") then send put my $1 in my %SAFE_CONTAINER
     if matchre("%STEAL.LIST", "$1") then send put my $1 in my %PAWN_CONTAINER
     pause 0.1
     pause 0.1
     if (("$1" = "backpack") || ("$1" = "cauldron")) then
          {
               pause 0.5
               goto SACK
          }
     if ("$1" = ("obsidian") || ("$1" = "toad") || ("$1" = "rat") then
          {
               send wear my $1
               pause 0.5
               send stow my $1
               pause 0.5
          }
     else
          {
               send put my $lefthand in my %SAFE_CONTAINER
               pause 0.5
               if ("$lefthand" != "Empty") then send put my $lefthand in my %BACKUP_CONTAINER
               pause 0.4
               if ("$lefthand" != "Empty") then send wear my $lefthand
               pause 0.4
               if ("$lefthand" = "Empty") then goto SACK
               if ("$lefthand" != "Empty") then gosub PUT stow left in my %BIN_CONTAINER
               if ("$lefthand" != "Empty") then gosub PUT stow left in my %PAWN_CONTAINER
               pause 0.1
          }
     pause 0.5
     goto SACK
NO.MORE.ITEMS:
     pause 0.001
     pause 0.001
     pause 0.001
     send drop my small sack
     pause 0.2
     pause 0.1
     if matchre("$roomobjs","(rat)") then
          {
               gosub put get rat
               gosub put wear rat
          }
     pause 0.1
     if ("$righthand" != "Empty") then gosub put stow right in my %SAFE_CONTAINER
     if ("$lefthand" != "Empty") then gosub put stow left in my %SAFE_CONTAINER
     pause 0.2
     if ("$righthand" != "Empty") then gosub put stow right in my %BACKUP_CONTAINER
     if ("$lefthand" != "Empty") then gosub put stow left in my %BACKUP_CONTAINER
     pause 0.1
     gosub PUT close my %SAFE_CONTAINER
     gosub PUT close my %BACKUP_CONTAINER
     ECHO
     ECHO **** DONE WITH JAIL / SACK SEQUENCE ****
     ECHO
     pause
     if (!$standing) then gosub STAND
     if contains("$lefthand" "$righthand" , "%LARGE.ITEMS") then gosub EMPTY.HANDS
CHECKLOC:
     if ("$zoneid" = "67") then goto SHARD.JAIL.DONE
     if ("$zoneid" = "116") then goto HIB.JAIL.DONE
     if ("$zoneid" = "61") then goto LETH.JAIL.DONE
     if ("$zoneid" = "1") then goto CROSS.JAIL.DONE
     if ("$zoneid" = "30") then goto HAVEN.JAIL.DONE
     if ("$zoneid" = "42") then goto THEREN.JAIL.LEAVE
     if ("$zoneid" = "90") then goto RATHA.JAIL.DONE
     if ("$zoneid" = "99") then goto AESRY.JAIL.DONE
RATHA.JAIL.DONE:
     gosub AUTOMOVE 51
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
AESRY.JAIL.DONE:
     gosub AUTOMOVE 76
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
CROSS.JAIL.DONE:
     gosub AUTOMOVE 42
     if ("%ARTHE" = "ON") then gosub AUTOMOVE NTR
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
LETH.JAIL.DONE:
     gosub AUTOMOVE portal
     put #script resume %ScriptName
     pause 0.5
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
HAVEN.JAIL.DONE:
     gosub AUTOMOVE town
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
SHARD.JAIL.DONE:
     gosub AUTOMOVE 57
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
HIB.JAIL.DONE:
     gosub AUTOMOVE 75
     put #script resume %ScriptName
     put #parse TAKING CARE OF BUSINESS
     pause 0.5
     goto END
THEREN.JAIL.LEAVE:
     save THEREN.JAIL.END
     goto THEREN.KEEP.ESCAPE
THEREN.JAIL.GET.FINE:
     save TO.TELLER
     goto THEREN.KEEP.ESCAPE
THEREN.KEEP.ESCAPE:
     gosub AUTOMOVE 69
     send jump moat
     pause 12
THEREN.STUNNED.WAIT:
     pause 10
     if $stunned = 1 then goto THEREN.STUNNED.WAIT
     pause 0.5
     gosub STAND
     pause 0.5
     goto THEREN.MOAT.LEAVE
THEREN.MOAT.LEAVE:
     var location THEREN.MOAT.LEAVE
     gosub MOVE s
     pause 2
     goto %s
THEREN.KEEP.JAIL:
     var location THEREN.KEEP.JAIL
     pause 0.2
     if ("$Guild" = "Necromancer") then gosub NECRO.PREP
     if ("$Guild" = "Thief") then gosub KHRI.START silence
     if ("$Guild" = "Moon") then gosub MOONIE.PREP
     pause 0.1
     pause 0.2
     gosub AUTOMOVE 102
     gosub AUTOMOVE moat
     gosub AUTOMOVE 116
     gosub AUTOMOVE 162
     gosub AUTOMOVE dungeon
     gosub STAND
     goto CLAN.ITEM
THEREN.JAIL.END:
THEREN.JAIL.DONE:
     gosub AUTOMOVE 1
     pause 2
END:
     put #script resume %ScriptName
     put #script abort jail
     put #echo >Log SkyBlue *** RECOVERED FROM JAIL VIA ~STEALING~ SCRIPT - CONTINUING...
     put #parse FREE FROM JAIL
     if matchre("$roomobjs","(rat)") then
          {
               gosub put get rat
               gosub put stow rat
          }
     ECHO *** FREE FROM JAIL!
     ECHO *** CONTINUING STEALING RUN
     pause 0.1
     pause
     goto %LAST
### END JAIL SECTION
###########################################################################################
###########################################################################################
### DISCONNECT
DISCONNECTED:
put #parse STEAL SCRIPT DISCONNECT
pause 0.2
put #script pause %ScriptName
ECHO *** YOU HAVE BEEN DISCONNECTED!  Attempting to reconnect in 10 seconds.. ***
put #echo >Log Red *** Disconnected... Attempting to reconnect ***
put #script abort all except %ScriptName
pause 10

CONNECT:
GOSUB clear
pause
math LOGOUT add 1
action goto CONNECTED when You look around, taking a moment to get your bearings|Welcome to DragonRealms
pause
goto CONNECTING

RECONNECT:
put #echo >Log Red *** FAILED TO CONNECT!
pause 15

CONNECTING:
send #connect
pause 30
if $connected = 0 then goto reconnect
goto CONNECTING

CONNECTED:
pause .001
put #script resume %ScriptName
ECHO *** You have been Reconnected ***
put #echo >Log Lime  *** Reconnected via Stealing Script!
put #echo >Log Lime  *** Resuming script from checkpoint..
action remove You look around, taking a moment to get your bearings|Welcome to DragonRealms
put #parse RECONNECTED NOW
pause 0.5
pause 0.5
goto %LAST
#########################################################################################
##########################################################################################
###########################################################################################
###############      PROGRESSIVE ITEM VARIABLE SECTION
###########################################################################################
##########################################################################################
#########################################################################################
NOPE:
     put #echo >Log Yellow *** Already at lowest level - skipping shop ***
     var stolen 7
     var skipping 1
     ECHO
     ECHO *** ALREADY AT THE LOWEST LEVEL ***
     ECHO *** SKIPPING SHOP ***
     pause 0.5
     RETURN
CLASS0:
     ## THEREN
     var skillrange 0-20
     var T.Tarsha <nothing>
     var T.Rose <nothing>
     var T.Music <nothing>
          var T.Music.Num
     var T.Hats <nothing>
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet <nothing>
     var T.Cupcake <nothing>
     var T.Gen charcoal
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric <nothing>
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge <nothing>
     ## HAVEN
     var skillrange 0-20
     var RH.Herb water
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli <nothing>
     var RH.Arms <nothing>
     var RH.Gen purse
     var RH.Cloth <nothing>
     var RH.Artif <nothing>
     var RH.Joy torte
     var RH.Joy2 card
     var RH.Smoke <nothing>
     var RH.Weap <nothing>
     var RH.Bard <nothing>
     var RH.Bard2 pick
     var RH.Cleric grey-brown feather
     var RH.Cleric2  <nothing>
     var RH.Lock <nothing>
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     ## ARTHE DALE
     var skillrange 0-20
     var AD.Feta <nothing>
          var AD.FETA.Loc
     var AD.Thread <nothing>
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm <nothing>
     var AD.Smoke <nothing>
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek <nothing>
     ## CROSSINGS
     var skillrange 0-20
     var C.Alch water
          var C.Alch.Loc in vat
     var C.Grocer cheese
     var C.Artif <nothing>
     var C.Bath <nothing>
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen envelope
     var C.Gen.B <nothing>
     var C.Weap <nothing>
     var C.Arm <nothing>
     var C.Music pick
     var C.Music2 <nothing>
     var C.Lock <nothing>
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc
          var C.Empath3.Alt <nothing>
     var C.Cler feather
     var C.Haber <nothing>
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel <nothing>
     var C.Jewel2 <nothing>
     var C.Stitch <nothing>
     var C.Cobb <nothing>
     var C.Herb <nothing>
     var C.Flow <nothing>
     ## LETH
     var skillrange 0-20
     var L.Skin <nothing>
     var L.Bow <nothing>
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 <nothing>
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     ## SHARD
     var skillrange 0-20
     var S.Gen hairbrush
     var S.Weap <nothing>
     var S.Cleric chamomile
     var S.Stitch <nothing>
     var S.Alch stick
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music rag
     var S.Armor <nothing>
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow <nothing>
     var S.Lock <nothing>
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill <nothing>
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel <nothing>
          var S.Travel.Num
          var S.Travel.Loc
     var S.Toy <nothing>
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber alcohol
     var S.Tanner <nothing>
          var S.Tanner.Loc on counter
     var S.Surv chicken flights
          var S.Surv.Loc
          var S.Surv.Alt <nothing>
          var S.Surv.Alt.Loc
     var S.Surv2 <nothing>
          var S.Surv2.Num
          var S.Surv2.Loc
          var S.Surv2.Alt <nothing>
     var S.Spire <nothing>
     # HORSE CLAN
     var HC.Jahtinit <nothing>
     var HC.Falconer <nothing>
     var HC.Yasnah <nothing>
     var HC.Bowyer <nothing>
     var HC.Bowyer2 <nothing>
     var HC.Equine <nothing>
     var HC.Felterie <nothing>
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 0-20
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog <nothing>
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund <nothing>
     var H.Lamp charcoal
     var H.Music <nothing>
     var H.Alch <nothing>
     var H.Forge <nothing>
          var H.Forge.Loc on tab
     var RP.Gen flights
     var RP.Tobac <nothing>
     # RATHA
     var skillrange 0-20
     var R.Bait worms
     var R.Gen rope
     var R.Herb water
     var R.Forge <nothing>
     var R.Tailor <nothing>
     var R.Leather <nothing>
     var R.Hair <nothing>
     var R.Music <nothing>
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.Loc
     var R.Jewelry <nothing>
     var R.Cleric <nothing>
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 0-20
     var A.Herb water
     var A.Tanner <nothing>
     var A.Clothing <nothing>
     var A.Script <nothing>
     var A.Cleric <nothing>
     var A.Origami <nothing>
     var A.Jewelry <nothing>
     var A.Magic <nothing>
     var A.Slings <nothing>
     var A.Puzzle <nothing>
     var A.Footwear <nothing>
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen charcoal
     var A.Flower <nothing>
     var A.Music pick
     pause 0.1
     gosub ITEM.COUNT0
     RETURN
###########################
# SKILLS 20-39
###########################
CLASS1:
     ## THEREN
     var skillrange 20-39
     var T.Tarsha canons
     var T.Rose <nothing>
     var T.Music <nothing>
     var T.Music.Num
     var T.Hats <nothing>
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen charcoal
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric block
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     var skillrange 20-39
     var RH.Herb mixing stick
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli <nothing>
     var RH.Arms <nothing>
     var RH.Gen flint
     var RH.Cloth <nothing>
     var RH.Artif <nothing>
     var RH.Joy perfume
     var RH.Joy2 card
     var RH.Smoke <nothing>
     var RH.Weap <nothing>
     var RH.Bard drum stick
     var RH.Bard2 <nothing>
     var RH.Cleric blue-grey plume feather
     var RH.Cleric2  <nothing>
     var RH.Lock ordinary lockpick
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     ## ARTHE DALE
     var skillrange 20-39
     var AD.Feta <nothing>
          var AD.FETA.Loc
     var AD.Thread <nothing>
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm <nothing>
     var AD.Smoke <nothing>
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek <nothing>
     ## CROSSINGS
     var skillrange 20-39
     var C.Alch water
          var C.Alch.Loc in vat
     var C.Grocer cheese
     var C.Artif <nothing>
     var C.Bath <nothing>
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen coin purse
     var C.Gen.B <nothing>
     var C.Weap <nothing>
     var C.Arm <nothing>
     var C.Music pick
     var C.Music2 <nothing>
     var C.Lock <nothing>
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc
          var C.Empath3.Alt <nothing>
     var C.Cler grey-brown feather
     var C.Haber <nothing>
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel <nothing>
     var C.Jewel2 <nothing>
     var C.Stitch <nothing>
     var C.Cobb <nothing>
     var C.Herb <nothing>
     var C.Flow rose
     ## LETH
     var skillrange 20-39
     var L.Skin <nothing>
     var L.Bow flights
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 <nothing>
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     ## SHARD
     var skillrange 20-39
     var S.Gen charcoal
     var S.Weap <nothing>
     var S.Cleric sage
     var S.Stitch <nothing>
     var S.Alch mixing stick
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music pick
     var S.Armor leather gloves
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow flights
     var S.Lock <nothing>
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill <nothing>
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel <nothing>
          var S.Travel.Num
          var S.Travel.Loc
     var S.Toy <nothing>
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber alcohol
     var S.Tanner <nothing>
          var S.Tanner.Loc on counter
     var S.Surv <nothing>
          var S.Surv.Loc
          var S.Surv.Alt <nothing>
          var S.Surv.Alt.Loc
     var S.Surv2 stone arrowhead
          var S.Surv2.Num
          var S.Surv2.Loc
          var S.Surv2.Alt falcon flights
     var S.Spire <nothing>
     # HORSE CLAN
     var HC.Jahtinit <nothing>
     var HC.Falconer <nothing>
     var HC.Yasnah <nothing>
     var HC.Bowyer <nothing>
     var HC.Bowyer2 <nothing>
     var HC.Equine <nothing>
     var HC.Felterie <nothing>
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 20-39
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog <nothing>
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund incense
          var H.Sund.Loc on shel
     var H.Lamp charcoal
     var H.Music <nothing>
     var H.Alch <nothing>
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen flights
          var RP.Gen.Loc in chest
     var RP.Tobac <nothing>
     # RATHA
     var skillrange 20-39
     var R.Bait worms
     var R.Gen rope
     var R.Herb water
     var R.Forge <nothing>
     var R.Tailor stockings
     var R.Leather <nothing>
     var R.Hair unguent
     var R.Music <nothing>
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.Loc
     var R.Jewelry <nothing>
     var R.Cleric chamomile
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 20-39
     var A.Herb water
     var A.Tanner <nothing>
     var A.Clothing <nothing>
     var A.Script <nothing>
     var A.Cleric pao
     var A.Origami <nothing>
     var A.Jewelry <nothing>
     var A.Magic <nothing>
     var A.Slings flights
     var A.Puzzle <nothing>
     var A.Footwear <nothing>
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen charcoal
     var A.Flower <nothing>
     var A.Music pick
     pause 0.1
     gosub ITEM.COUNT0
     RETURN
##################################
# SKILLS 40-59
##################################
CLASS2:
     ## THEREN
     var skillrange 40-59
     var T.Tarsha canons
     var T.Rose socks
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen charcoal
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric incense
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     var skillrange 40-59
     var RH.Herb mixing stick
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli <nothing>
     var RH.Arms dart
     var RH.Gen flint
     var RH.Cloth <nothing>
     var RH.Artif <nothing>
     var RH.Joy water
     var RH.Joy2 card
     var RH.Smoke pouch
     var RH.Weap <nothing>
     var RH.Bard drum stick
     var RH.Bard2 <nothing>
     var RH.Cleric candle
     var RH.Cleric2  <nothing>
     var RH.Lock <nothing>
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 40-59
     var AD.Feta biscuit
          var AD.FETA.Loc on counter
     var AD.Thread <nothing>
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard <nothing>
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm <nothing>
     var AD.Smoke <nothing>
     var AD.Tart.E <nothing>
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek belt
     # CROSSINGS
     var skillrange 40-59
     var C.Alch alcohol
          var C.Alch.Loc in vat
     var C.Grocer bunny
     var C.Artif <nothing>
          var C.Artif.Loc in bucket
     var C.Bath reed
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen coin purse
     var C.Gen.B <nothing>
     var C.Weap sling
     var C.Arm rugged gloves
     var C.Music rag
     var C.Music2 <nothing>
     var C.Lock stout lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 <nothing>
     var C.Empath3 <nothing>
          var C.Empath3.Loc on hook
          var C.Empath3.Alt
     var C.Cler sage
     var C.Haber <nothing>
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel <nothing>
     var C.Jewel2 <nothing>
     var C.Stitch <nothing>
     var C.Cobb anklets
     var C.Herb <nothing>
     var C.Flow rose
     # LETH DERIEL
     var skillrange 40-59
     var L.Skin <nothing>
     var L.Bow shears
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 <nothing>
     var L.Cloth <nothing>
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 40-59
     var S.Gen flint
     var S.Weap <nothing>
     var S.Cleric sirese flower
     var S.Stitch cap
     var S.Alch small vial
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music ocarina
     var S.Armor leather gloves
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow glue
     var S.Lock <nothing>
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill gloves
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel <nothing>
          var S.Travel.Num
          var S.Travel.Loc
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber <nothing>
     var S.Tanner <nothing>
          var S.Tanner.Loc on counter
     var S.Surv oil
          var S.Surv.Loc on stand
          var S.Surv.Alt <nothing>
          var S.Surv.Alt.Loc on stand
     var S.Surv2 glue
          var S.Surv2.Num
          var S.Surv2.Loc
          var S.Surv2.Alt hawk flights
      var S.Spire <nothing>
     # HORSE CLAN
     var HC.Jahtinit <nothing>
     var HC.Falconer <nothing>
     var HC.Yasnah <nothing>
     var HC.Bowyer <nothing>
     var HC.Bowyer2 <nothing>
     var HC.Equine <nothing>
     var HC.Felterie <nothing>
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 40-59
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog toothpicks
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund incense
          var H.Sund.Loc on shel
     var H.Lamp torch
     var H.Music cloth
     var H.Alch mixing stick
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
          var RP.Gen.Loc in chest
     var RP.Tobac pine pipe
     # RATHA
     var skillrange 40-59
     var R.Bait cheese
     var R.Gen biscuit
     var R.Herb alcohol
     var R.Forge <nothing>
     var R.Tailor stockings
     var R.Leather <nothing>
     var R.Hair unguent
     var R.Music rag
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.Loc
     var R.Jewelry <nothing>
     var R.Cleric plume feather
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 40-59
     var A.Herb stick
     var A.Tanner thread
     var A.Clothing <nothing>
     var A.Script <nothing>
     var A.Cleric sage
     var A.Origami paper
     var A.Jewelry <nothing>
     var A.Magic <nothing>
     var A.Slings fishtail arrowhead
     var A.Puzzle beanbags
     var A.Footwear socks
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen flint
     var A.Flower <nothing>
     var A.Music pick
     pause 0.1
     gosub ITEM.COUNT0
     RETURN
##################################
# SKILLS 60-79
##################################
CLASS3:
     ## THEREN
     var skillrange 60-79
     var T.Tarsha canons
     var T.Rose socks
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric incense
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     var skillrange 60-79
     var RH.Herb pestle
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli claw gloves
     var RH.Arms dart
     var RH.Gen small box
     var RH.Cloth cap
     var RH.Artif <nothing>
     var RH.Joy card
     var RH.Joy2 card
     var RH.Smoke pouch
     var RH.Weap club
     var RH.Bard drum stick
     var RH.Bard2 hairpin
     var RH.Cleric candle
     var RH.Cleric2  <nothing>
     var RH.Lock ordinary lockpick
     var RH.Tog <nothing>
     var RH.Tog2 <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 60-79
     var AD.Feta muffin
          var AD.FETA.Loc
     var AD.Thread pouch
     var AD.Fash <nothing>
     var AD.Odds <nothing>
     var AD.Bard rag
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm knife
     var AD.Smoke sungrown cigar
     var AD.Tart.E tart
     var AD.Tart.C <nothing>
     var AD.Tart.M <nothing>
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek hat
     # CROSSINGS
     var skillrange 60-79
     var C.Alch oil
          var C.Alch.Loc in vat
     var C.Grocer crusher
     var C.Artif <nothing>
          var C.Artif.Loc in bucket
     var C.Bath reed
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen herb bag
     var C.Gen.B <nothing>
     var C.Weap rocks
     var C.Arm rugged gloves
     var C.Music rag
     var C.Music2 maple guiro
     var C.Lock stout lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 scalpel
     var C.Empath3 button
          var C.Empath3.Loc on hook
          var C.Empath3.Alt <nothing>
     var C.Cler lavender
     var C.Haber hood
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel hairpin
     var C.Jewel2 <nothing>
     var C.Stitch <nothing>
     var C.Cobb anklets
     var C.Herb <nothing>
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 60-79
     var L.Skin <nothing>
     var L.Bow shears
     var L.Orig <nothing>
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard <nothing>
     var L.Bard2 cotton cloth
     var L.Cloth moufles
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 60-79
     var S.Gen arrows
     var S.Weap <nothing>
     var S.Cleric incense
     var S.Stitch cap
     var S.Alch pestle
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music cloth
     var S.Armor collar
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow shears
     var S.Lock iron keyblank
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill straw hat
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel <nothing>
          var S.Travel.Num
          var S.Travel.Loc
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber oil
     var S.Tanner thread
          var S.Tanner.Loc on counter
     var S.Surv lamp oil
          var S.Surv.Loc on stand
          var S.Surv.Alt stone pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 falcon flights
          var S.Surv2.Num
          var S.Surv2.Alt wood shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 60-79
     var HC.Jahtinit physalis
     var HC.Falconer hair wrap
          var HC.Falconer.Num
     var HC.Yasnah ring
     var HC.Bowyer pouch
          var HC.Bowyer.Num second
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 60-79
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog white soap
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund bone comb
          var H.Sund.Loc on shel
     var H.Lamp lamp oil
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
          var RP.Gen.Loc in chest
     var RP.Tobac pipe
     # RATHA
     var skillrange 60-79
     var R.Bait pole
     var R.Gen lobscouse stew
     var R.Herb pestle
     var R.Forge <nothing>
     var R.Tailor stockings
     var R.Leather <nothing>
     var R.Hair hairbrush
     var R.Music pick
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.Loc
     var R.Jewelry chain
     var R.Cleric wine
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 60-99
     var A.Herb pestle
     var A.Tanner thread
     var A.Clothing britches
     var A.Script <nothing>
     var A.Cleric incense
     var A.Origami <nothing>
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings shaper
     var A.Puzzle beanbags
     var A.Footwear socks
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen trowel
     var A.Flower wristlet
     var A.Music bow
     pause 0.1
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 80-99
##################################
CLASS4:
     var skillrange 80-99
     ## THEREN
     var T.Tarsha canons
     var T.Rose socks
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric incense
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory <nothing>
     var T.Forge copper slug
     ## HAVEN
     # skillrange 80-99
     var RH.Herb oil
     var RH.Iron <nothing>
     var RH.Naph <nothing>
          var RH.Naph.Loc on cart
     var RH.Flow black orchid
     var RH.Seli claw gloves
     var RH.Arms bolts
     var RH.Gen bark
     var RH.Cloth sash
     var RH.Artif <nothing>
     var RH.Joy card
     var RH.Joy2 card
     var RH.Smoke sungrown cigar
     var RH.Weap club
     var RH.Bard silk cloth
     var RH.Bard2 hairpin
     var RH.Cleric wine
     var RH.Cleric2  <nothing>
     var RH.Lock stout lockpick
     var RH.Tog  <nothing>
     var RH.Tog2  <nothing>
     var RH.Mirg <nothing>
     # ARTHE DALE
     # skillrange 80-99
     var AD.Feta milk
          var AD.FETA.Loc
     var AD.Thread pouch
     var AD.Fash snood
     var AD.Odds <nothing>
     var AD.Bard rag
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm knife
     var AD.Smoke sungrown cigar
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L <nothing>
     var AD.Tart.F <nothing>
     var KA.Grek gloves
     # CROSSINGS
     # skillrange 80-99
     var C.Alch oil
          var C.Alch.Loc in vat
     var C.Grocer stew
     var C.Artif flake
          var C.Artif.Loc in bucket
     var C.Bath reed
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card <nothing>
     var C.Gen flint
     var C.Gen.B <nothing>
     var C.Weap rocks
     var C.Arm rugged aventail
     var C.Music cloth
     var C.Music2 drum stick
     var C.Lock stout lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 scalpel
     var C.Empath3 button
          var C.Empath3.Loc on hook
          var C.Empath3.Alt <nothing>
     var C.Cler incense
     var C.Haber skullcap
     var C.Script <nothing>
     var C.Tann <nothing>
          var C.Tann.Loc
     var C.Jewel anklet
     var C.Jewel2 <nothing>
     var C.Stitch hair bow
     var C.Cobb anklets
     var C.Herb <nothing>
     var C.Flow <nothing>
     # LETH DERIEL
     # skillrange 80-99
     var L.Skin <nothing>
     var L.Bow small rocks
     var L.Orig white paper
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick <nothing>
     var L.Bard recorder
     var L.Bard2 cotton cloth
     var L.Cloth moufles
     var L.Wood <nothing>
     var L.Gen <nothing>
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     # skillrange 80-99
     var S.Gen carving knife
     var S.Weap <nothing>
     var S.Cleric incense
     var S.Stitch hood
     var S.Alch pestle
     var S.Herb <nothing>
     var S.Artif <nothing>
     var S.Music ocarina
     var S.Armor collar
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow shears
     var S.Lock iron keyblank
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill straw hat
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel <nothing>
          var S.Travel.Num
          var S.Travel.Loc
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber oil
     var S.Tanner thread
          var S.Tanner.Loc on counter
     var S.Surv lamp oil
          var S.Surv.Loc on stand
          var S.Surv.Alt stone pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 falcon flights
          var S.Surv2.Num
          var S.Surv2.Alt wood shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 60-79
     var HC.Jahtinit physalis
     var HC.Falconer hair wrap
          var HC.Falconer.Num
     var HC.Yasnah ring
     var HC.Bowyer pouch
          var HC.Bowyer.Num second
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 60-99
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog white soap
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund bone comb
          var H.Sund.Loc on shel
     var H.Lamp lamp oil
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
          var RP.Gen.Loc in chest
     var RP.Tobac pipe
     # RATHA
     # skillrange 80-99
     var R.Bait pole
     var R.Gen lobscouse stew
     var R.Herb pestle
     var R.Forge <nothing>
     var R.Tailor badge
     var R.Leather <nothing>
     var R.Hair hairbrush
     var R.Music pick
     var R.Magic <nothing>
     var R.Origami <nothing>
          var R.Origami.Loc
     var R.Jewelry chain
     var R.Cleric wine
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     # skillrange 80-99
     var A.Herb pestle
     var A.Tanner thread
     var A.Clothing britches
     var A.Script <nothing>
     var A.Cleric incense
     var A.Origami <nothing>
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings shaper
     var A.Puzzle beanbags
     var A.Footwear socks
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen trowel
     var A.Flower wristlet
     var A.Music bow
     pause 0.1
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 100-149
##################################
CLASS5:
     ## THEREN
     var skillrange 100-149
     var T.Tarsha gorget
     var T.Rose kilt
     var T.Music cloth
          var T.Music.Num
     var T.Hats nightcap
     var T.Arm <nothing>
     var T.Gift <nothing>
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen satchel
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric mortar
     var T.Men <nothing>
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 100-149
     var RH.Herb yelith root
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow <nothing>
     var RH.Seli studded helm
     var RH.Arms kris
     var RH.Gen knapsack
     var RH.Cloth robes
     var RH.Artif <nothing>
     var RH.Joy gift box
     var RH.Joy2 card
     var RH.Smoke apple pipe
     var RH.Weap club
     var RH.Bard tipper
     var RH.Bard2 beaded earrings
     var RH.Cleric herbs
     var RH.Cleric2 bottle
     var RH.Lock stout lockpick
     var RH.Tog <nothing>
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 100-149
     var AD.Feta kirm cheese
          var AD.FETA.Loc
     var AD.Thread pouch
     var AD.Fash neckerchief
     var AD.Odds fan
     var AD.Bard rag
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm bodkin
     var AD.Smoke telgi cigar
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek boots
     # CROSSINGS
     var skillrange 100-149
     var C.Alch small jar
          var C.Alch.Loc on count
     var C.Grocer cheese
     var C.Artif shaving
          var C.Artif.Loc in bucket
     var C.Bath soap
          var C.Bath.Num
          var C.Bath.Loc in basin
     var C.Card <nothing>
     var C.Gen knapsack
     var C.Gen.B brush
     var C.Weap dagger
     var C.Arm rugged aventail
     var C.Music tambourine skin
     var C.Music2 oak guiro
     var C.Lock slim lockpick
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 scalpel
     var C.Empath3 button
          var C.Empath3.Loc on case
          var C.Empath3.Alt <nothing>
     var C.Cler wine
     var C.Haber tam
     var C.Script <nothing>
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel pin
     var C.Jewel2 <nothing>
     var C.Stitch sash
     var C.Cobb sandals
     var C.Herb jadice flower
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 100-149
     var L.Skin buckskin pelt
     var L.Bow bolts
     var L.Orig silver paper
          var L.Orig.Num
     var L.Weap <nothing>
     var L.Wick wicker quiver
     var L.Bard ocarina
     var L.Bard2 cloth
     var L.Cloth moufles
     var L.Wood <nothing>
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 100-149
     var S.Gen shoulder sack
     var S.Weap <nothing>
     var S.Cleric candle
     var S.Stitch shawl
     var S.Alch pestle
     var S.Herb riolur leaf
     var S.Artif <nothing>
     var S.Music fife
     var S.Armor armbands
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow shears
     var S.Lock copper keyblank
     var S.Coin <nothing>
          var S.Coin.Loc
     var S.Frill willow fan
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel doll
          var S.Travel.Num
          var S.Travel.Loc on shelf
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber mold
     var S.Tanner bodkin
          var S.Tanner.Loc on counter
     var S.Surv lamp oil
          var S.Surv.Loc on stand
          var S.Surv.Alt stone pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 wood shaper
          var S.Surv2.Num
          var S.Surv2.Alt steel shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 100-149
     var HC.Jahtinit physalis
     var HC.Falconer hair wrap
          var HC.Falconer.Num
     var HC.Yasnah ring
     var HC.Bowyer pouch
          var HC.Bowyer.Num sixth
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 100-149
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog white soap
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund bone comb
          var H.Sund.Loc on shel
     var H.Lamp lamp oil
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge copper slug
          var H.Forge.Loc on tab
     var RP.Gen flights
          var RP.Gen.Loc in chest
     var RP.Tobac pipe
     # RATHA
     var skillrange 100-149
     var R.Bait pole
     var R.Gen polish
     var R.Herb large jar
     var R.Forge dagger
     var R.Tailor shirt
     var R.Leather <nothing>
     var R.Hair clippers
     var R.Music tambourine
     var R.Magic talisman
     var R.Origami white paper
          var R.Origami.Loc on shelf
     var R.Jewelry bangle
     var R.Cleric candle
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 100-149
     var A.Herb pestle
     var A.Tanner shears
     var A.Clothing britches
     var A.Script trimmed scroll
     var A.Cleric candle
     var A.Origami <nothing>
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings canvas sling
     var A.Puzzle basic puzzle
     var A.Footwear pouch
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon <nothing>
     var A.Armor <nothing>
     var A.Gen tinderbox
     var A.Flower wristlet
     var A.Music cloth
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 150-199
##################################
CLASS6:
     ## THEREN
     var skillrange 150-199
     var T.Tarsha canons
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen carving knife
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric pestle
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth suspenders
          var T.Cloth.Loc on rack
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 150-199
     var RH.Herb riolur leaf
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow <nothing>
     var RH.Seli studded helm
     var RH.Arms rapier
     var RH.Gen razor
     var RH.Cloth jerkin
     var RH.Artif simple talisman
     var RH.Joy troll
     var RH.Joy2 card
     var RH.Smoke lanival pipe
     var RH.Weap <nothing>
     var RH.Bard tipper
     var RH.Bard2 earrings
     var RH.Cleric holy oil
     var RH.Cleric2 bottle
     var RH.Lock slim lockpick
     var RH.Tog beaded slippers
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg <nothing>
     # ARTHE DALE
     var skillrange 150-199
     var AD.Feta butter cheese
          var AD.FETA.Loc
     var AD.Thread bobbin
     var AD.Fash shawl
     var AD.Odds fan
     var AD.Bard four strings
     var AD.Map <nothing>
          var AD.Map.Loc
     var AD.Arm sword
     var AD.Smoke cigarillo
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek skinning knife
     # CROSSINGS
     var skillrange 150-199
     var C.Alch goggles
          var C.Alch.Loc on rack
     var C.Grocer stew
     var C.Artif shard
          var C.Artif.Loc in bucket
     var C.Bath towel
          var C.Bath.Num
          var C.Bath.Loc on stand
     var C.Card <nothing>
     var C.Gen canvas sack
     var C.Gen.B brush
     var C.Weap dagger
     var C.Arm scale aventail
     var C.Music flute
     var C.Music2 guiro
     var C.Lock lockpick ring
     var C.Empath <nothing>
          var C.Empath.Alt <nothing>
     var C.Empath2 garland
     var C.Empath3 button
          var C.Empath3.Loc on case
          var C.Empath3.Alt <nothing>
     var C.Cler silver vial
     var C.Haber jerkin
     var C.Script <nothing>
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel band
     var C.Jewel2 <nothing>
     var C.Stitch vest
     var C.Cobb snowshoes
     var C.Herb junliar stem
     var C.Flow <nothing>
     # LETH DERIEL
     var skillrange 150-199
     var L.Skin deer skin
     var L.Bow long arrows
     var L.Orig case
          var L.Orig.Num fourth
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick wicker quiver
     var L.Bard flute
     var L.Bard2 four strings
     var L.Cloth tunic
     var L.Wood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf <nothing>
     # SHARD
     var skillrange 150-199
     var S.Gen clippers
     var S.Weap targe
     var S.Cleric armband
     var S.Stitch blouse
     var S.Alch large vial
     var S.Herb riolur leaf
     var S.Artif <nothing>
     var S.Music tipper
     var S.Armor mail gauntlets
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow crossbow bolts
     var S.Lock copper keyblank
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill lace fan
     var S.Herald <nothing>
          var S.Herald.Loc on rack
     var S.Travel boggle doll
          var S.Travel.Num
          var S.Travel.Loc in black basket
     var S.Toy whistle
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num first
     var S.Token <nothing>
     var S.Museum <nothing>
     var S.Barber tincture jar
     var S.Tanner scraper
          var S.Tanner.Loc on counter
     var S.Surv stone pestle
          var S.Surv.Loc on cabinet
          var S.Surv.Alt wood pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 steel shaper
          var S.Surv2.Num
          var S.Surv2.Alt pine box
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 150-199
     var HC.Jahtinit physalis
     var HC.Falconer hair wrap
          var HC.Falconer.Num
     var HC.Yasnah ring
     var HC.Bowyer pouch
          var HC.Bowyer.Num sixth
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 150-199
     var SC.Weap <nothing>
     var H.Shield <nothing>
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog white soap
          var H.Tog.Num
     var H.Herb <nothing>
     var H.Sund bone comb
          var H.Sund.Loc on shel
     var H.Lamp <nothing>
     var H.Music cloth
     var H.Alch stone pestle
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen pestle
          var RP.Gen.Loc on table
     var RP.Tobac pipe
     # RATHA
     var skillrange 150-199
     var R.Bait pole
     var R.Gen bodkin arrows
     var R.Herb large jar
     var R.Forge dagger
     var R.Tailor shirt
     var R.Leather <nothing>
     var R.Hair clippers
     var R.Music flute
     var R.Magic <nothing>
     var R.Origami white paper
          var R.Origami.Loc on shelf
     var R.Jewelry clasp
     var R.Cleric vial
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 150-199
     var A.Herb cebi root
     var A.Tanner bodkin
     var A.Clothing tunic
     var A.Script trimmed scroll
     var A.Cleric wine
     var A.Origami plain paper
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings rocks
     var A.Puzzle intermediate puzzle
     var A.Footwear woolen tights
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon telek
     var A.Armor <nothing>
     var A.Gen razor
     var A.Flower necklace
     var A.Music bow
     gosub ITEM.COUNT1
     RETURN
##################################
# SKILLS 200-249
##################################
CLASS7:
     ## THEREN
     var skillrange 200-249
     var T.Tarsha greques
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen reed torch
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric mortar
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 200-249
     var RH.Herb muljin sap
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen shears
     var RH.Cloth doublet
     var RH.Artif simple talisman
     var RH.Joy bunny
     var RH.Joy2 <nothing>
     var RH.Smoke baron tobacco
     var RH.Weap mace
     var RH.Bard lyre
     var RH.Bard2 wristlet
     var RH.Cleric chalice
     var RH.Cleric2 black bottle
     var RH.Lock slim lockpick
     var RH.Tog beaded slippers
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg anklet
     # ARTHE DALE
     var skillrange 200-249
     var AD.Feta butter cheese
          var AD.FETA.Loc
     var AD.Thread bobbin
     var AD.Fash trousers
     var AD.Odds earrings
     var AD.Bard six strings
     var AD.Map pipe
          var AD.Map.Loc
     var AD.Arm sword
     var AD.Smoke cigarillo
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek shirt
     # CROSSINGS
     var skillrange 200-249
     var C.Alch large jar
          var C.Alch.Loc on counter
     var C.Grocer stew
     var C.Artif shard
          var C.Artif.Loc in bucket
     var C.Bath bathrobe
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card case
     var C.Gen leather sheath
     var C.Gen.B brush
     var C.Weap sling
     var C.Arm chain gloves
     var C.Music bodhran skin
     var C.Music2 flute
     var C.Lock <nothing>
     var C.Empath scalpel
          var C.Empath.Alt <nothing>
     var C.Empath2 garland
     var C.Empath3 oak stylus
          var C.Empath3.Loc on box
          var C.Empath3.Alt <nothing>
     var C.Cler basin
     var C.Haber trousers
     var C.Script satchel
          var C.Script.Num third
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel wedding ring
     var C.Jewel2 <nothing>
     var C.Stitch shawl
     var C.Cobb thigh boots
     var C.Herb riolur leaf
     var C.Flow corsage
     # LETH DERIEL
     var skillrange 200-249
     var L.Skin sluagh hide
     var L.Bow long arrows
     var L.Orig case
          var L.Orig.Num fourth
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick mesh sack
     var L.Bard woodwind case
     var L.Bard2 four strings
     var L.Cloth doublet
     var L.Wood applewood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf panther perfume
     # SHARD
     var skillrange 200-249
     var S.Gen scabbard
     var S.Weap targe
     var S.Cleric armband
     var S.Stitch cloak
     var S.Alch large bowl
     var S.Herb genich stem
     var S.Artif <nothing>
     var S.Music recorder
     var S.Armor choker
     var S.Reed <nothing>
          var S.Reed.Num
     var S.Bow crossbow bolts
     var S.Lock bronze lockpick
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill sandals
     var S.Herald target shield
          var S.Herald.Loc on rack
     var S.Travel boggle doll
          var S.Travel.Num
          var S.Travel.Loc in black basket
     var S.Toy beard
          var S.Toy.Loc
     var S.Memory <nothing>
          var S.Memory.Num
     var S.Token <nothing>
     var S.Museum doll
     var S.Barber tincture jar
     var S.Tanner shears
          var S.Tanner.Loc on counter
     var S.Surv stone pestle
          var S.Surv.Loc on cabinet
          var S.Surv.Alt wood pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 steel shaper
          var S.Surv2.Num
          var S.Surv2.Alt stone-tipped arrows
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 200-249
     var HC.Jahtinit physalis
     var HC.Falconer pouch
          var HC.Falconer.Num second
     var HC.Yasnah torque
     var HC.Bowyer pouch
          var HC.Bowyer.Num sixth
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 200-249
     var SC.Weap <nothing>
     var H.Shield ordinary shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog towel
          var H.Tog.Num
     var H.Herb yelith root
     var H.Sund bone comb
          var H.Sund.Loc on shel
     var H.Lamp serpent lamp
     var H.Music scroll
     var H.Alch stone pestle
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen knife
          var RP.Gen.Loc on rack
     var RP.Tobac pipe
     # RATHA
     var skillrange 200-249
     var R.Bait pole
     var R.Gen breaker
     var R.Herb large jar
     var R.Forge dagger
     var R.Tailor tunic
     var R.Leather <nothing>
     var R.Hair <nothing>
     var R.Music six strings
     var R.Magic talisman
     var R.Origami white paper
          var R.Origami.Loc on shelf
     var R.Jewelry silver chain
     var R.Cleric censer
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 200-249
     var A.Herb nemoih root
     var A.Tanner scraper
     var A.Clothing shirt
     var A.Script painted scroll
     var A.Cleric sandals
     var A.Origami plain paper
     var A.Jewelry bracelet
     var A.Magic <nothing>
     var A.Slings rocks
     var A.Puzzle bunny
     var A.Footwear lace stockings
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon telek
     var A.Armor <nothing>
     var A.Gen razor
     var A.Flower circlet
     var A.Music four strings
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 250-299
##################################
CLASS8:
     ## THEREN
     var skillrange 250-299
     var T.Tarsha greques
     var T.Rose shirt
     var T.Music four strings
          var T.Music.Num
     var T.Hats sailor hat
     var T.Arm <nothing>
     var T.Gift blue shirt
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen reed torch
     var T.Krrish <nothing>
     var T.Lense <nothing>
     var T.Cleric oil
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 250-299
     var RH.Herb riolur leaf
     var RH.Iron bronze gauntlets
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow wreath
     var RH.Seli bronze gauntlets
     var RH.Arms composite bow
     var RH.Gen shears
     var RH.Cloth houpelande
     var RH.Artif cambrinth ring
     var RH.Joy bunny
     var RH.Joy2 <nothing>
     var RH.Smoke riverhaven tobacco
     var RH.Weap thorny mace
     var RH.Bard refill
     var RH.Bard2 necklace
     var RH.Cleric pomander
     var RH.Cleric2 black bottle
     var RH.Lock slim lockpick
     var RH.Tog ivory shirt
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg anklet
     # ARTHE DALE
     var skillrange 250-299
     var AD.Feta kirm cheese
          var AD.FETA.Loc
     var AD.Thread pattern
     var AD.Fash trousers
     var AD.Odds earrings
     var AD.Bard refill
     var AD.Map pipe
          var AD.Map.Loc
     var AD.Arm sword
     var AD.Smoke baron tobacco
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek shirt
     # CROSSINGS
     var skillrange 250-299
     var C.Alch large jar
          var C.Alch.Loc on count
     var C.Grocer stew
     var C.Artif scrap
          var C.Artif.Loc in bucket
     var C.Bath bathrobe
          var C.Bath.Num
          var C.Bath.Loc
     var C.Card case
     var C.Gen rugged backpack
     var C.Gen.B weapon strap
     var C.Weap kris
     var C.Arm chain helm
     var C.Music refill
     var C.Music2 flute
     var C.Lock <nothing>
     var C.Empath slippers
          var C.Empath.Alt <nothing>
     var C.Empath2 mortar
     var C.Empath3 ebony stylus
          var C.Empath3.Loc from box
          var C.Empath3.Alt <nothing>
     var C.Cler coffer
     var C.Haber doublet
     var C.Script satchel
          var C.Script.Num second
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 <nothing>
     var C.Stitch leggings
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow corsage
     # LETH DERIEL
     var skillrange 250-299
     var L.Skin cougar pelt
     var L.Bow leather quiver
     var L.Orig case
          var L.Orig.Num seventh
     var L.Weap <nothing>
          var L.Weap.Loc in catalog
     var L.Wick mesh sack
     var L.Bard mirliton
     var L.Bard2 refill
     var L.Cloth jerkin
     var L.Wood hazelwood log
     var L.Gen dice
          var L.Gen.Alt <nothing>
     var L.Perf panther perfume
     # SHARD
     var skillrange 250-299
     var S.Gen quiver
     var S.Weap stiletto
     var S.Cleric bell
     var S.Stitch dress
     var S.Alch seolarn weed
     var S.Herb hisan salve
     var S.Artif calavarite runestone
     var S.Music refill
     var S.Lock wrist sheath
     var S.Armor mask
     var S.Coin coin case
          var S.Coin.Loc
     var S.Frill silk fan
     var S.Herald ordinary shield
          var S.Herald.Loc on rack
     var S.Travel badge
          var S.Travel.Num
          var S.Travel.Loc on stand
     var S.Toy beard
          var S.Toy.Loc
     var S.Reed wooden ring
          var S.Reed.Num
     var S.Memory <nothing>
          var S.Memory.Num
     var S.Token <nothing>
     var S.Museum doll
     var S.Barber clippers
     var S.Bow barbed arrows
     var S.Tanner shears
          var S.Tanner.Loc on counter
     var S.Surv marble pestle
          var S.Surv.Loc on cabinet
          var S.Surv.Alt stone pestle
          var S.Surv.Alt.Loc on cabinet
     var S.Surv2 belt knife
          var S.Surv2.Num
          var S.Surv2.Alt steel shaper
          var S.Surv2.Loc
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 250-299
     var HC.Jahtinit physalis
     var HC.Falconer pouch
          var HC.Falconer.Num second
     var HC.Yasnah torque
     var HC.Bowyer pouch
          var HC.Bowyer.Num sixth
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 250-299
     var SC.Weap dirk
     var H.Shield ordinary shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog shirt
          var H.Tog.Num
     var H.Herb hisan salve
     var H.Sund lamp
          var H.Sund.Loc on rack
     var H.Lamp serpent lamp
     var H.Music repair kit
     var H.Alch granite mortar
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen knife
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 250-299
     var R.Bait pole
     var R.Gen strap
     var R.Herb cebi root
     var R.Forge sap
     var R.Tailor trousers
     var R.Leather gauntlets
     var R.Hair razor
     var R.Music refill
     var R.Magic talisman
     var R.Origami blue paper
          var R.Origami.Loc on shelf
     var R.Jewelry collar
     var R.Cleric censer
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 250-299
     var A.Herb ithor potion
     var A.Tanner shears
     var A.Clothing trousers
     var A.Script canvas scroll
     var A.Cleric armband
     var A.Origami white paper
     var A.Jewelry earcuff
     var A.Magic marble
     var A.Slings canvas sling
     var A.Puzzle wand
     var A.Footwear lace stockings
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon telek
     var A.Armor chausses
     var A.Gen mirror
     var A.Flower wreath
     var A.Music seven strings
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 300-399
##################################
CLASS9:
     ## THEREN
     var skillrange 300-399
     var T.Tarsha houppelande
     var T.Rose shirt
     var T.Music repair kit
          var T.Music.Num
     var T.Hats ermine hat
     var T.Arm <nothing>
     var T.Gift throwing dagger
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen backsheath
     var T.Krrish bone
     var T.Lense <nothing>
     var T.Cleric oil
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth <nothing>
     var T.Armory dagger
     var T.Forge copper slug
     ## HAVEN
     var skillrange 300-399
     var RH.Herb ithor potion
     var RH.Iron steel greaves
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow silk orchid
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen backpack
     var RH.Cloth gown
     var RH.Artif cambrinth ring
     var RH.Joy troll
     var RH.Joy2 plain envelope
     var RH.Smoke baron tobacco
     var RH.Weap thorny mace
     var RH.Bard drawstring boots
     var RH.Bard2 amulet
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock lockpick ring
     var RH.Tog linen shirt
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg toe-bells
     # ARTHE DALE
     var skillrange 300-399
     var AD.Feta anlibues cheese
          var AD.FETA.Loc
     var AD.Thread pattern
     var AD.Fash frock
     var AD.Odds purse
     var AD.Bard silverlock
     var AD.Map pipe
          var AD.Map.Loc
     var AD.Arm cuirass
     var AD.Smoke whiskey cigar
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 300-399
     var C.Alch large jar
          var C.Alch.Loc on count
     var C.Grocer <nothing>
     var C.Artif cambrinth ring
          var C.Artif.Loc in bucket
     var C.Bath bath towel
          var C.Bath.Num
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen rugged backpack
     var C.Gen.B weapon strap
     var C.Weap sabre
     var C.Arm bascinet
     var C.Music repair kit
     var C.Music2 bohdran
     var C.Lock lockpick ring
     var C.Empath scalpel
          var C.Empath.Alt slippers
     var C.Empath2 mortar
     var C.Empath3 silver stylus
          var C.Empath3.Loc
          var C.Empath3.Alt ebony stylus
     var C.Cler habit
     var C.Haber tabard
     var C.Script satchel
          var C.Script.Num first
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 <nothing>
     var C.Stitch shirt
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 300-399
     var L.Skin reaver pelt
     var L.Bow composite bow
     var L.Orig origami case
          var L.Orig.Num seventh
     var L.Weap wolf-tail shield
     var L.Wick pannier
     var L.Bard keyed flute
     var L.Bard2 twelve strings
     var L.Cloth mantle
     var L.Wood ironwood log
     var L.Gen mesh backpack
          var L.Gen.Alt <nothing>
     var L.Perf spice perfume
     # SHARD
     var skillrange 300-399
     var S.Gen broadsword
     var S.Weap stiletto
     var S.Cleric silver bell
     var S.Stitch dress
     var S.Alch seolarn weed
     var S.Herb ithor potion
     var S.Artif calavarite runestone
     var S.Music refill
     var S.Lock wrist sheath
     var S.Armor veil
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill tunic
     var S.Herald ordinary shield
          var S.Herald.Loc on rack
     var S.Travel badge
          var S.Travel.Num
          var S.Travel.Loc on stand
     var S.Toy beard
          var S.Toy.Loc on lion
     var S.Reed wooden ring
          var S.Reed.Num
     var S.Memory pin
          var S.Memory.Num first
     var S.Token <nothing>
          var S.Token.Loc
     var S.Museum tunic
     var S.Barber clippers
     var S.Bow barbed arrows
     var S.Tanner shears
          var S.Tanner.Loc on counter
     var S.Surv armband
          var S.Surv.Loc on table
          var S.Surv.Alt neckband
          var S.Surv.Alt.Loc on table
     var S.Surv2 belt knife
          var S.Surv2.Num sixth
          var S.Surv2.Loc
          var S.Surv2.Alt broad-barbed arrows
      var S.Spire <nothing>
     # HORSE CLAN
     var skillrange 300-399
     var HC.Jahtinit physalis
     var HC.Falconer pouch
          var HC.Falconer.Num second
     var HC.Yasnah torque
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 300-399
     var SC.Weap dirk
     var H.Shield ordinary shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog soap
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund lamp
          var H.Sund.Loc on rack
     var H.Lamp peccary lamp
     var H.Music wine scroll
     var H.Alch granite mortar
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen mortar
          var RP.Gen.Loc on table
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 300-399
     var R.Bait pole
     var R.Gen quiver
     var R.Herb tincture jar
     var R.Forge sap
     var R.Tailor vest
     var R.Leather gauntlets
     var R.Hair razor
     var R.Music lyre
     var R.Magic naphtha
     var R.Origami bird instructions
          var R.Origami.Loc on case
     var R.Jewelry collar
     var R.Cleric oil
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 300-399
     var A.Herb seolarn weed
     var A.Tanner potion
     var A.Clothing doublet
     var A.Script canvas scroll
     var A.Cleric armband
     var A.Origami blue paper
     var A.Jewelry torque
     var A.Magic cube
     var A.Slings canvas sling
     var A.Puzzle rings
     var A.Footwear spidersilk stockings
     var A.Shields <nothing>
          var A.Shields.Loc on table
     var A.Weapon garz
     var A.Armor chausses
     var A.Gen lantern
     var A.Flower pillow
     var A.Music drum pouch
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 400-499
##################################
CLASS10:
     ## THEREN
     var skillrange 400-499
     var T.Tarsha houppelande
     var T.Rose cloak
     var T.Music harp case
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift throwing dagger
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen backsheath
     var T.Krrish bone
     var T.Lense bone ring
     var T.Cleric mobar blood
     var T.Men trousers
     var T.Women <nothing>
     var T.Cloth black suspenders
     var T.Armory quiver
     var T.Forge hilt
     ## HAVEN
     var skillrange 400-499
     var RH.Herb ithor potion
     var RH.Iron steel greaves
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli aventail
     var RH.Arms sword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif cambrinth ring
     var RH.Joy troll
     var RH.Joy2 plain envelope
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard furred boots
     var RH.Bard2 amulet
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock slim lockpick
     var RH.Tog linen shirt
     var RH.Tog2 <nothing>
          var RH.Tog2.Num
     var RH.Mirg toe-bells
     # ARTHE DALE
     var skillrange 400-499
     var AD.Smoke whiskey cigar
     var AD.Thread pattern
     var AD.Fash overall
     var AD.Odds doll
     var AD.Bard silverlock
     var AD.Map map
          var AD.Map.Loc
     var AD.Arm breastplate
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 400-499
     var C.Alch stove
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm bascinet
     var C.Artif inkwell
          var C.Artif.Loc on trunk
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B weapon strap
     var C.Weap cane
     var C.Music case of silver
     var C.Music2 bohdran
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 journal
          var C.Empath3.Loc
          var C.Empath3.Alt silver stylus
     var C.Cler silver bell
     var C.Cler2 burlap sack
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num fourth
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 <nothing>
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 400-499
     var L.Skin blood wolf pelt
     var L.Bow composite bow
     var L.Orig origami case
          var L.Orig.Num sixth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood apple
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 400-499
     var S.Gen chain helm
     var S.Weap stiletto
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch glaysker flower
     var S.Herb ithor potion
     var S.Artif rhodonite runestone
     var S.Music repair kit
     var S.Armor balaclava
     var S.Reed skirt
          var S.Reed.Num second
     var S.Museum doll
     var S.Bow barbed arrows
     var S.Lock copper lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill tunic
     var S.Herald medium shield
          var S.Herald.Loc on rack
     var S.Travel doll
          var S.Travel.Num
          var S.Travel.Loc in basket
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory flute
          var S.Memory.Num third
     var S.Token <nothing>
          var S.Token.Loc
     var S.Barber brass razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv poncho
          var S.Surv.Loc on table
          var S.Surv.Alt throwing blades
          var S.Surv.Alt.Loc on table
     var S.Surv2 belt knife
          var S.Surv2.Num fifth
          var S.Surv2.Loc
          var S.Surv2.Alt broad-barbed arrows
     var S.Spire pouch
     # HORSE CLAN
     var skillrange 400-499
     var HC.Jahtinit physalis
     var HC.Falconer pouch
          var HC.Falconer.Num fourth
     var HC.Yasnah torque
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 <nothing>
     # HIB AND RAVEN'S POINT
     var skillrange 400-499
     var SC.Weap adze
     var H.Shield target shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog wax
          var H.Tog.Num second
     var H.Herb lujeakave elixir
     var H.Sund hatchet
          var H.Sund.Loc on shel
     var H.Lamp peccary lamp
     var H.Music horn
     var H.Alch granite mortar
     var H.Forge shaft
          var H.Forge.Loc on rack
     var RP.Gen quiver
          var RP.Gen.Loc on table
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 400-499
     var R.Bait <nothing>
     var R.Gen barbed arrows
     var R.Herb portable stove
     var R.Forge poignard
     var R.Tailor kilt
     var R.Leather gloves
     var R.Hair razor
     var R.Music repair kit
     var R.Magic naphtha
     var R.Origami primer
          var R.Origami.Loc
     var R.Jewelry wedding band
     var R.Cleric mobar blood
     var R.Cleric2 <nothing>
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 400-499
     var A.Herb ithor potion
     var A.Tanner pattern
     var A.Clothing trousers
     var A.Script parchment
     var A.Cleric mobar blood
     var A.Origami yak instructions
     var A.Jewelry chain
     var A.Magic marble
     var A.Slings wool sling
     var A.Puzzle bunny
     var A.Footwear clogs
     var A.Shields kite shield
          var A.Shields.Loc on table
     var A.Weapon telek
     var A.Armor chausses
     var A.Gen lantern
     var A.Flower pillow
     var A.Music syrinx
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 500-599
##################################
CLASS11:
     ## THEREN
     var skillrange 500-599
     var T.Tarsha houppelande
     var T.Rose shirt
     var T.Music harp case
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift throwing dagger
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen backsheath
     var T.Krrish bone
     var T.Lense bone ring
     var T.Cleric mobar blood
     var T.Men trousers
     var T.Women silvery veil
     var T.Cloth black suspenders
     var T.Armory quiver
     var T.Forge hilt
     ## HAVEN
     var skillrange 500-599
     var RH.Herb ithor potion
     var RH.Iron chain helm
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms sword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif potion
     var RH.Joy troll
     var RH.Joy2 plain envelope
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard lace shawl
     var RH.Bard2 amulet
     var RH.Cleric pomander
     var RH.Cleric2 pendant
     var RH.Lock slim lockpick
     var RH.Tog leggings
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg silk fan
     # ARTHE DALE
     var skillrange 500-599
     var AD.Smoke whiskey cigar
     var AD.Thread pattern
     var AD.Fash overall
     var AD.Odds monocle
     var AD.Bard peri'el's song
     var AD.Map map
          var AD.Map.Loc
     var AD.Arm leather coat
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 500-599
     var C.Alch stove
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm chain tasset
     var C.Artif plain scroll
          var C.Artif.Loc on stand
     var C.Bath towel
          var C.Bath.Num fourth
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B weapon strap
     var C.Weap scimitar
     var C.Music case of silver
     var C.Music2 bohdran
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt targe
     var C.Empath2 silver chart
     var C.Empath3 journal
          var C.Empath3.Loc on shelf
          var C.Empath3.Alt petal
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num first
     var C.Tann scraper
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 anklet
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow boutonniere
     # LETH DERIEL
     var skillrange 500-599
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num sixth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 500-599
     var S.Gen backtube
     var S.Weap hatchet
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch stove
     var S.Herb ithor potion
     var S.Artif asketine runestone
     var S.Music gittern
     var S.Armor helmet
     var S.Reed skirt
          var S.Reed.Num third
     var S.Museum slippers
     var S.Bow short bow
     var S.Lock copper lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald ordinary shield
          var S.Herald.Loc on rack
     var S.Travel dagger
          var S.Travel.Num
          var S.Travel.Loc on table
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory flute
          var S.Memory.Num third
     var S.Token <nothing>
          var S.Token.Loc
     var S.Barber brass razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv thigh quiver
          var S.Surv.Loc on table
          var S.Surv.Alt pack
          var S.Surv.Alt.Loc on chest
     var S.Surv2 belt knife
          var S.Surv2.Num fifth
          var S.Surv2.Loc
          var S.Surv2.Alt short bow
      var S.Spire tabard
     # HORSE CLAN
     var skillrange 500-599
     var HC.Jahtinit flute
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah shawl
     var HC.Bowyer pouch
          var HC.Bowyer.Num fifth
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 500-599
     var SC.Weap adze
     var H.Shield target shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog wax
          var H.Tog.Num second
     var H.Herb lujeakave elixir
     var H.Sund haversack
          var H.Sund.Loc on rack
     var H.Lamp dragon lamp
     var H.Music horn
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen scimitar
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 500-599
     var R.Bait <nothing>
     var R.Gen flint-tipped bolts
     var R.Herb bucket
     var R.Forge handaxe
     var R.Tailor jacket
     var R.Leather boots
     var R.Hair razor
     var R.Music repair kit
     var R.Magic potion
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 500-599
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric thumb ring
     var A.Origami case
     var A.Jewelry haedor
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear harness
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower pillow
     var A.Music drum
     gosub ITEM.COUNT2
     RETURN
##################################
# SKILLS 600-699
##################################
CLASS12:
     ## THEREN
     var skillrange 600-699
     var T.Tarsha brocade bilaud
     var T.Rose leather shoes
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift pyramid
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen towel
     var T.Krrish bones
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men silk tie
     var T.Women silvery veil
     var T.Cloth black suspenders
     var T.Armory longsword
     var T.Forge hilt
     ## HAVEN
     var skillrange 600-699
     var RH.Herb ithor potion
     var RH.Iron ring mail
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms longsword
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif potion
     var RH.Joy troll
     var RH.Joy2 plain envelope
     var RH.Smoke baron tobacco
     var RH.Weap goat-head mace
     var RH.Bard tapestry shawl
     var RH.Bard2 spirit earrings
     var RH.Cleric pomander
     var RH.Cleric2 wood shaper
     var RH.Lock slim lockpick
     var RH.Tog slippers
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg belt
     # ARTHE DALE
     var skillrange 600-699
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds monocle
     var AD.Bard peri'el's song
     var AD.Map map
          var AD.Map.Loc
     var AD.Arm leather coat
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 600-699
     var C.Alch apron
          var C.Alch.Loc on rack
     var C.Grocer <nothing>
     var C.Arm chain shirt
     var C.Artif anklet
          var C.Artif.Loc 
     var C.Bath towel
          var C.Bath.Num fourth
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap cane
     var C.Music case of silver
     var C.Music2 drum
     var C.Lock lockpick ring
     var C.Empath leather boots
          var C.Empath.Alt targe
     var C.Empath2 silver chart
     var C.Empath3 petal
          var C.Empath3.Loc
          var C.Empath3.Alt needle
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num second
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 anklet
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 600-699
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 600-699
     var S.Gen light crossbow
     var S.Weap sabre
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch stove
     var S.Herb ithor potion
     var S.Artif rattle
     var S.Music gittern
     var S.Armor helmet
     var S.Reed thigh bag
          var S.Reed.Num
     var S.Museum slippers
     var S.Bow short bow
     var S.Lock quality copper lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald medium shield
          var S.Herald.Loc on rack
     var S.Travel dagger
          var S.Travel.Num
          var S.Travel.Loc on table
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory flute
          var S.Memory.Num third
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv thigh quiver
          var S.Surv.Loc on table
          var S.Surv.Alt pack
          var S.Surv.Alt.Loc on chest
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt short bow
      var S.Spire tabard
     # HORSE CLAN
     var skillrange 600-699
     var HC.Jahtinit flute
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah shawl
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 600-699
     var SC.Weap adze
     var H.Shield medium shield
          var H.Shield.Loc on rack
     var H.Jewel <nothing>
     var H.Tog wax
          var H.Tog.Num second
     var H.Herb lujeakave elixir
     var H.Sund haversack
          var H.Sund.Loc on rack
     var H.Lamp dragon lamp
     var H.Music horn
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen scimitar
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 600-699
     var R.Bait <nothing>
     var R.Gen pin
     var R.Herb bucket
     var R.Forge handaxe
     var R.Tailor jacket
     var R.Leather boots
     var R.Hair razor
     var R.Music repair kit
     var R.Magic potion
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring <nothing>
     # AESRY SURLAENIS'A
     var skillrange 600-699
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric thumb ring
     var A.Origami case
     var A.Jewelry ring
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear harness
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower flask
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 700-799
##################################
CLASS13:
     # THEREN
     var skillrange 700-799
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm leather sheath
     var T.Gift pyramid
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Gen towel
     var T.Krrish bones
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men silk tie
     var T.Women silvery veil
     var T.Cloth purse
     var T.Armory longsword
     var T.Forge hilt
     # HAVEN
     var skillrange 700-799
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli skull helm
     var RH.Arms spear
     var RH.Gen stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap mattock
     var RH.Bard tweed kilt
     var RH.Bard2 spirit earrings
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Lock slim lockpick
     var RH.Tog boots
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg chain anklet
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 700-799
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds spectacles
     var AD.Bard peri'el's song
     var AD.Map map
          var AD.Map.Loc
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 700-799
     var C.Alch coat
          var C.Alch.Loc on rack
     var C.Grocer <nothing>
     var C.Arm scale shirt
     var C.Artif urn
          var C.Artif.Loc 
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap light crossbow
     var C.Music case of silver
     var C.Music2 drum
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 needle
          var C.Empath3.Loc
          var C.Empath3.Alt petal
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num third
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 anklet
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 700-799
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap hide shield
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 700-799
     var S.Gen two-handed sword
     var S.Weap cutlass
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif cambrinth ring
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed thigh bag
          var S.Reed.Num second
     var S.Museum slippers
     var S.Bow light crossbow
     var S.Lock quality copper lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Travel glass
          var S.Travel.Num
          var S.Travel.Loc in case
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory flute
          var S.Memory.Num third
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv helm
          var S.Surv.Loc on hook
          var S.Surv.Alt cowl
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
      var S.Spire armband
     # HORSE CLAN
     var skillrange 700-799
     var HC.Jahtinit flute
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah shawl
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie amulet
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 700-799
     var SC.Weap adze
     var H.Shield medium shield
          var H.Shield.Loc on rack
     var H.Jewel gold chain
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund broadsword
          var H.Sund.Loc on shel
     var H.Lamp dragon lamp
     var H.Music gemshorn
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen scimitar
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 700-799
     var R.Bait <nothing>
     var R.Gen broadsword
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 crystal vial
     var R.Ring ironwood ring
     # AESRY SURLAENIS'A
     var skillrange 700-799
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 800-899
##################################
CLASS14:
     # THEREN
     var skillrange 800-899
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men velvet sash
     var T.Women silvery veil
     var T.Cloth silk scarf
     var T.Armory longsword
     var T.Forge hilt
     # HAVEN
     var skillrange 800-899
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms spear
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap mattock
     var RH.Bard wool kilt
     var RH.Bard2 spirit tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog shawl
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg chain anklet
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 800-899
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds spectacles
     var AD.Bard peri'el's song
     var AD.Map map
          var AD.Map.Loc
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 800-899
     var C.Alch coat
          var C.Alch.Loc on rack
     var C.Grocer <nothing>
     var C.Arm scale shirt
     var C.Artif armband
          var C.Artif.Loc in bucket
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap light crossbow
     var C.Music case of silver
     var C.Music2 tapani
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 silver chart
     var C.Empath3 needle
          var C.Empath3.Loc
          var C.Empath3.Alt petal
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num fourth
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 anklet
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 800-899
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 800-899
     var S.Gen great helm
     var S.Weap shield
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif axinite runestone
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed anklet
          var S.Reed.Num
     var S.Museum blouse
     var S.Bow silverwillow crossbow
     var S.Lock quality copper lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald tower shield
          var S.Herald.Loc on rack
     var S.Travel bracelet
          var S.Travel.Num
          var S.Travel.Loc on table
     var S.Toy doll
          var S.Toy.Loc
     var S.Memory flute
          var S.Memory.Num fourth
      var S.Token token
           var S.Token.Loc on quint
     var S.Barber silver razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv cap
          var S.Surv.Loc on hook
          var S.Surv.Alt cowl
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HORSE CLAN
     var skillrange 800-899
     var HC.Jahtinit didjeridu
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah shawl
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on stand
     var HC.Equine saddle
          var HC.Equine.Loc on rack
     var HC.Felterie robe
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 800-899
     var SC.Weap adze
     var H.Shield medium shield
          var H.Shield.Loc on rack
     var H.Jewel necklace
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund broadsword
          var H.Sund.Loc on shel
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen backpack
          var RP.Gen.Loc on table
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 800-899
     var R.Bait <nothing>
     var R.Gen pike
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 prayer beads
     var R.Ring ironwood ring
     # AESRY SURLAENIS'A
     var skillrange 800-899
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 900-999
##################################
CLASS15:
     # THEREN
     var skillrange 900-999
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music ebony harp
          var T.Music.Num
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men breeches
     var T.Women sheer veil
     var T.Cloth gold cufflinks
     var T.Armory pick
     var T.Forge hilt
     # HAVEN
     var skillrange 900-999
     var RH.Herb ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard silk breeches
     var RH.Bard2 spirit tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog breeches
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg chainmail belt
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 900-999
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds hat
     var AD.Bard peri'el's song
     var AD.Map pipe
          var AD.Map.Loc in chest
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 900-999
     var C.Alch toolbox
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm plate fauld
     var C.Artif cambrinth orb
          var C.Artif.Loc in bucket
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap sledgehammer
     var C.Music case of silver
     var C.Music2 violin bow
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 compendium
     var C.Empath3 band
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num first
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 steel ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 900-999
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
     var L.Orig origami case
          var L.Orig.Num fifth
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 hat
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh backpack
          var L.Gen.Alt ankle sheath
     var L.Perf venom oil
     # SHARD
     var skillrange 900-999
     var S.Gen heavy crossbow
     var S.Weap shield
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif selenite runestone
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed crystal pendant
          var S.Reed.Num
     var S.Museum earrings
     var S.Bow silverwillow crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Travel globe
          var S.Travel.Num
          var S.Travel.Loc on counter
     var S.Toy museum globe
          var S.Toy.Loc on lion
     var S.Memory wrap
          var S.Memory.Num
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv mining cap
          var S.Surv.Loc on hook
          var S.Surv.Alt mining helm
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HORSE CLAN
     var skillrange 900-999
     var HC.Jahtinit skull
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah cloak
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on rack
     var HC.Equine bridle
          var HC.Equine.Loc on table
     var HC.Felterie slippers
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 900-999
     var SC.Weap adze
     var H.Shield kwarf
          var H.Shield.Loc on shelf
     var H.Jewel necklace
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund envelope
          var H.Sund.Loc on desk
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 900-999
     var R.Bait <nothing>
     var R.Gen drop-trigger crossbow
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 prayer beads
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 900-999
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 1000-1200
##################################
CLASS16:
     var skillrange 1000-1200+
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music bagpipe
          var T.Music.Num third
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men tunic
     var T.Women dark veil
     var T.Cloth cane
          var T.Cloth.Loc on cane stand
     var T.Armory longsword
     var T.Forge hilt
     var skillrange 1000-1200
     var RH.Herb  ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard silk trews
     var RH.Bard2 knot tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog kidskin boots
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg charm
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 1000-1200+
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds hat
     var AD.Bard peri'el's song
     var AD.Map pipe
          var AD.Map.Loc in chest
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 1000-1200+
     var C.Alch toolbox
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm kite shield
     var C.Artif cambrinth orb
          var C.Artif.Loc in bucket
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap greataxe
     var C.Music case of silver
     var C.Music2 violin bow
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 compendium
     var C.Empath3 medallion
          var C.Empath3.Loc on bask
          var C.Empath3.Alt band
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num second
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 rose ring
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 1000-1200+
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 leather songbook
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh tunic
          var L.Gen.Alt mesh backpack
     var L.Perf venom oil
     # SHARD
     var skillrange 1000-1200
     var S.Gen leather armor
     var S.Weap axe
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif cambrinth ring
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed duffel bag
          var S.Reed.Num
     var S.Museum blouse
     var S.Bow ironwood crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Travel plate
          var S.Travel.Num
          var S.Travel.Loc on counter
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
            var S.Memory.Num
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
            var S.Barber.Num
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv cap
          var S.Surv.Loc on hook
          var S.Surv.Alt cowl
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HORSE CLAN
     var skillrange 1000-1200+
     var HC.Jahtinit skull
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah cloak
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on rack
     var HC.Equine bridle
          var HC.Equine.Loc on table
     var HC.Felterie gutalles
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 1000-1200+
     var SC.Weap adze
     var H.Shield curved shield
          var H.Shield.Loc on shelf
     var H.Jewel necklace
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund envelope
          var H.Sund.Loc on desk
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 1000-1200+
     var R.Bait <nothing>
     var R.Gen windlass-drawn crossbow
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 gold vial
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 1000-1200+
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 1200-1450
##################################
CLASS17:
     var skillrange 1200-1450
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music bagpipe
          var T.Music.Num third
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men tunic
     var T.Women dark veil
     var T.Cloth cane
          var T.Cloth.Loc on cane stand
     var T.Armory longsword
     var T.Forge hilt
     var skillrange 1000-1200
     var RH.Herb  ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard silk mantle
     var RH.Bard2 knot tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog tunic
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg charm
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 1200-1450
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds shawl
     var AD.Bard peri'el's song
     var AD.Map pipe
          var AD.Map.Loc in chest
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 1200-1450
     var C.Alch toolbox
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm chain shirt
     var C.Artif staff
          var C.Artif.Loc on trunk
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap halberd
     var C.Music case of silver
     var C.Music2 oboe
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 kaldar chart
     var C.Empath3 cebi root
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num third
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 platinum wristcuff
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 1200-1450
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 leather songbook
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh tunic
          var L.Gen.Alt mesh backpack
     var L.Perf venom oil
     # SHARD
     var skillrange 1200-1450
     var S.Gen chain armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif large talisman
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed backpack
          var S.Reed.Num
     var S.Museum plate
     var S.Bow ironwood crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Travel globe
          var S.Travel.Num
          var S.Travel.Loc on counter
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
            var S.Memory.Num
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
            var S.Barber.Num
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv cap
          var S.Surv.Loc on hook
          var S.Surv.Alt cowl
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HORSE CLAN
     var skillrange 1200-1450
     var HC.Jahtinit skull
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah cloak
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on rack
     var HC.Equine bridle
          var HC.Equine.Loc on table
     var HC.Felterie gutalles
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 1200-1450
     var SC.Weap adze
     var H.Shield curved shield
          var H.Shield.Loc on shelf
     var H.Jewel necklace
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund envelope
          var H.Sund.Loc on desk
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 1200-1450
     var R.Bait <nothing>
     var R.Gen windlass-drawn crossbow
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 gold vial
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 1200-1450
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##################################
# SKILLS 1450-1750
##################################
CLASS18:
CLASS19:
CLASS20:
     var skillrange 1450-1750
     var T.Tarsha brocade bilaud
     var T.Rose woolen cloak
     var T.Music bagpipe
          var T.Music.Num third
     var T.Hats head-dress
     var T.Arm chain handguards
     var T.Gift pyramid
     var T.Gen towel
     var T.Sweet cake
     var T.Cupcake cupcake
     var T.Krrish bowl
     var T.Lense telescope
     var T.Cleric mobar blood
     var T.Men tunic
     var T.Women dark veil
     var T.Cloth cane
          var T.Cloth.Loc on cane stand
     var T.Armory longsword
     var T.Forge hilt
     var skillrange 1450-1750
     var RH.Herb  ithor potion
     var RH.Iron chain shirt
     var RH.Naph naphtha
          var RH.Naph.Loc on cart
     var RH.Flow velvet rose
     var RH.Seli sheepskin robe
     var RH.Arms flamberge
     var RH.Gen portable stove
     var RH.Cloth gown
     var RH.Artif cambrinth orb
     var RH.Joy troll
     var RH.Joy2 envelope
     var RH.Smoke barons choice
     var RH.Weap lucerne hammer
     var RH.Bard silk mantle
     var RH.Bard2 knot tailband
     var RH.Cleric pomander
     var RH.Cleric2 cambrinth ring
     var RH.Tog trousers
     var RH.Tog2 slippers
          var RH.Tog2.Num
     var RH.Mirg charm
     var RH.Lock slim lockpick
     # ARTHE DALE
     var skillrange 1450-1750
     var AD.Smoke whiskey cigar
     var AD.Thread thief pattern
     var AD.Fash overall
     var AD.Odds shawl
     var AD.Bard peri'el's song
     var AD.Map silver flask
          var AD.Map.Loc 
     var AD.Arm ring mail
     var AD.Feta biscuit
          var AD.FETA.Loc
     var AD.Tart.E tart
     var AD.Tart.C tart
     var AD.Tart.M tart
     var AD.Tart.L tart
     var AD.Tart.F tart
     var KA.Grek barrel
     # CROSSINGS
     var skillrange 1450-1750
     var C.Alch toolbox
          var C.Alch.Loc on counter
     var C.Grocer <nothing>
     var C.Arm tower shield
     var C.Artif staff
          var C.Artif.Loc on trunk
     var C.Bath towel
          var C.Bath.Num second
          var C.Bath.Loc on rack
     var C.Card case
     var C.Gen portable stove
     var C.Gen.B <nothing>
     var C.Weap claymore
     var C.Music case of silver
     var C.Music2 harp
     var C.Lock lockpick ring
     var C.Empath silk shirt
          var C.Empath.Alt broadsword
     var C.Empath2 peccary chart
     var C.Empath3 cebi root
          var C.Empath3.Loc
          var C.Empath3.Alt medallion
     var C.Cler silver bell
     var C.Cler2 armband
     var C.Haber tail coat
     var C.Script satchel
          var C.Script.Num fourth
     var C.Tann kit
          var C.Tann.Loc
     var C.Jewel bloodstone hairpin
     var C.Jewel2 copper necklace
     var C.Stitch long coat
     var C.Cobb hip boots
     var C.Herb ithor potion
     var C.Flow velvet rose
     # LETH DERIEL
     var skillrange 1450-1750
     var L.Skin blood wolf pelt
     var L.Bow heavy crossbow
          var L.Orig.Num fifth
     var L.Orig case
     var L.Weap takouba
     var L.Wick willow backpack
     var L.Bard silverwood mirliton
     var L.Bard2 leather songbook
     var L.Cloth silk jaque
     var L.Wood caravan
     var L.Gen mesh tunic
          var L.Gen.Alt mesh backpack
     var L.Perf venom oil
     # SHARD
     var skillrange 1450-1750
     var S.Gen plate armor
     var S.Weap blade
     var S.Cleric mobar blood
     var S.Stitch gown
     var S.Alch bucket
     var S.Herb ithor potion
     var S.Artif celestite runestone
     var S.Music case of gold
     var S.Armor great helm
     var S.Reed backpack
          var S.Reed.Num
     var S.Museum globe
     var S.Bow ironwood crossbow
     var S.Lock diamondique lockpick
     var S.Coin coin case
          var S.Coin.Loc on table
     var S.Frill doll
     var S.Herald oval shield
          var S.Herald.Loc on rack
     var S.Travel globe
          var S.Travel.Num
          var S.Travel.Loc on counter
     var S.Toy marionette
          var S.Toy.Loc on lion
     var S.Memory wrap
            var S.Memory.Num
     var S.Token token
          var S.Token.Loc on quint
     var S.Barber silver razor
            var S.Barber.Num
     var S.Tanner potion
          var S.Tanner.Loc on counter
     var S.Surv cap
          var S.Surv.Loc on hook
          var S.Surv.Alt cowl
          var S.Surv.Alt.Loc on hook
     var S.Surv2 chunenguti
          var S.Surv2.Num
          var S.Surv2.Loc on stand
          var S.Surv2.Alt longbow
     var S.Spire armband
     # HORSE CLAN
     var skillrange 1450-1750
     var HC.Jahtinit skull
     var HC.Falconer pouch
          var HC.Falconer.Num third
     var HC.Yasnah cloak
     var HC.Bowyer pouch
          var HC.Bowyer.Num third
     var HC.Bowyer2 bow
          var HC.Bowyer2.Loc on rack
     var HC.Equine bridle
          var HC.Equine.Loc on table
     var HC.Felterie gutalles
     var HC.Felterie2 blanket
     # HIB AND RAVEN'S POINT
     var skillrange 1450-1750
     var SC.Weap adze
     var H.Shield curved shield
          var H.Shield.Loc on shelf
     var H.Jewel necklace
     var H.Tog robe
          var H.Tog.Num
     var H.Herb lujeakave elixir
     var H.Sund envelope
          var H.Sund.Loc on desk
     var H.Lamp dragon lamp
     var H.Music bagpipe
     var H.Alch bucket
     var H.Forge zinc bar
          var H.Forge.Loc on tab
     var RP.Gen hammer
          var RP.Gen.Loc on rack
     var RP.Tobac tobacco pouch
     # RATHA
     var skillrange 1450-1750
     var R.Bait <nothing>
     var R.Gen windlass-drawn crossbow
     var R.Herb bucket
     var R.Forge jambaya
     var R.Tailor cloak
     var R.Leather zombie mask
     var R.Hair razor
     var R.Music cittern
     var R.Magic charm
     var R.Origami case
          var R.Origami.Loc on shelf
     var R.Jewelry pectoral
     var R.Cleric mobar blood
     var R.Cleric2 gold vial
     var R.Ring garnet ring
     # AESRY SURLAENIS'A
     var skillrange 1450-1750
     var A.Herb bucket
     var A.Tanner potion
     var A.Clothing robe
     var A.Script parchment
     var A.Cleric chalice
     var A.Origami case
     var A.Jewelry pilonu
     var A.Magic marble
     var A.Slings crossbow
     var A.Puzzle box
     var A.Footwear thigh-boots
     var A.Shields oval shield
          var A.Shields.Loc on table
     var A.Weapon kasai
     var A.Armor coif
     var A.Gen lantern
     var A.Flower vial
     var A.Music drum
     gosub ITEM.COUNT3
     RETURN
##########################################################################################
# END OF STEAL VARIABLES
##########################################################################################
###############################################
# ITEM QUANTITY
# DEFINES STEALCOUNT PER SHOP FOR NON-THIEVES
###############################################
########################
# 0-49
########################
ITEM.COUNT0:
     var T.TarshaQuant 1
     var T.RoseQuant 1
     var T.MusicQuant 1
     var T.HatsQuant 1
     var T.ArmQuant 1
     var T.GiftQuant 1
     var T.SweetQuant 1
     var T.CupcakeQuant 1
     var T.GenQuant 1
     var T.KrrishQuant 1
     var T.LenseQuant 1
     var T.ClericQuant 1
     var T.MenQuant 1
     var T.WomenQuant 1
     var T.ClothQuant 1
     var T.ArmoryQuant 1
     var T.ForgeQuant 1

     var RH.HerbQuant 4
     var RH.IronQuant 1
     var RH.NaphQuant 1
     var RH.FlowQuant 4
     var RH.SeliQuant 1
     var RH.ArmsQuant 1
     var RH.GenQuant 4
     var RH.ClothQuant 1
     var RH.ArtifQuant 1
     var RH.JoyQuant 1
     var RH.Joy2Quant 2
     var RH.Joy2Quant 2
     var RH.SmokeQuant 1
     var RH.WeapQuant 1
     var RH.BardQuant 1
     var RH.Bard2Quant 1
     var RH.ClericQuant 1
     var RH.Cleric2Quant 1
     var RH.LockQuant 1
     var RH.TogQuant 1
     var RH.Tog2Quant 1
     var RH.MirgQuant 1

     var AD.FetaQuant 2
     var AD.ThreadQuant 2
     var AD.FashQuant 1
     var AD.OddsQuant 1
     var AD.BardQuant 2
     var AD.MapQuant 2
     var AD.ArmQuant 2
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 2
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 2
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 2
     var KA.GrekQuant 2

     var C.AlchQuant 6
     var C.ArtifQuant 1
     var C.GrocerQuant 4
     var C.BathQuant 2
     var C.CardQuant 1
     var C.GenQuant 4
     var C.Gen.BQuant 2
     var C.WeapQuant 2
     var C.ArmQuant 2
     var C.MusicQuant 2
     var C.Music2Quant 2
     var C.LockQuant 2
     var C.EmpathQuant 1
     var C.Empath2Quant 1
     var C.Empath3Quant 1
     var C.ClerQuant 2
     var C.HaberQuant 2
     var C.ScriptQuant 1
     var C.TannQuant 1
     var C.JewelQuant 1
     var C.Jewel2Quant 1
     var C.StitchQuant 2
     var C.CobbQuant 2
     var C.HerbQuant 2
     var C.FlowQuant 2

     var L.SkinQuant 1
     var L.BowQuant 1
     var L.OrigQuant 1
     var L.WeapQuant 1
     var L.WickQuant 1
     var L.BardQuant 1
     var L.Bard2Quant 1
     var L.ClothQuant 1
     var L.WoodQuant 1
     var L.GenQuant 3
     var L.PerfQuant 1

     var S.GenQuant 3
     var S.WeapQuant 1
     var S.ClericQuant 2
     var S.StitchQuant 1
     var S.AlchQuant 4
     var S.HerbQuant 2
     var S.ArtifQuant 1
     var S.MusicQuant 1
     var S.ArmorQuant 1
     var S.ReedQuant 1
     var S.MuseumQuant 1
     var S.BowQuant 1
     var S.SpireQuant 1
     var S.LockQuant 1
     var S.CoinQuant 1
     var S.FrillQuant 1
     var S.HeraldQuant 1
     var S.TravelQuant 1
     var S.ToyQuant 1
     var S.MemoryQuant 1
     var S.TokenQuant 1
     var S.BarberQuant 2
     var S.TannerQuant 1
     var S.SurvQuant 1
     var S.Surv2Quant 1
     var RP.GenQuant 1
     var RP.TobacQuant 1

     var HC.JahtinitQuant 2
     var HC.FalconerQuant 2
     var HC.YasnahQuant 2
     var HC.BowyerQuant 2
     var HC.Bowyer2Quant 2
     var HC.EquineQuant 2
     var HC.FelterieQuant 2
     var HC.Felterie2Quant 2

     var SC.WeapQuant 1
     var H.ShieldQuant 1
     var H.JewelQuant 1
     var H.TogQuant 1
     var H.HerbQuant 1
     var H.SundQuant 1
     var H.LampQuant 3
     var H.MusicQuant 1
     var H.AlchQuant 1
     var H.ForgeQuant 1
     var H.GenQuant 3
     var H.TobacQuant 1

     var R.BaitQuant 1
     var R.GenQuant 3
     var R.HerbQuant 3
     var R.ForgeQuant 1
     var R.TailorQuant 1
     var R.LeatherQuant 1
     var R.HairQuant 1
     var R.MusicQuant 1
     var R.MagicQuant 1
     var R.OrigamiQuant 1
     var R.JewelryQuant 1
     var R.ClericQuant 1
     var R.RingQuant 1

     var A.HerbQuant 3
     var A.TannerQuant 1
     var A.ClothingQuant 1
     var A.ScriptQuant 1
     var A.ClericQuant 2
     var A.OrigamiQuant 1
     var A.JewelryQuant 1
     var A.MagicQuant 1
     var A.SlingsQuant 1
     var A.PuzzleQuant 1
     var A.FootwearQuant 1
     var A.ShieldsQuant 1
     var A.WeaponQuant 1
     var A.ArmorQuant 1
     var A.GenQuant 3
     var A.FlowerQuant 1
     var A.MusicQuant 1
     RETURN
########################
# 50-199
########################
ITEM.COUNT1:
     var T.TarshaQuant 1
     var T.RoseQuant 1
     var T.MusicQuant 1
     var T.HatsQuant 1
     var T.ArmQuant 1
     var T.GiftQuant 2
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 3
     var T.KrrishQuant 1
     var T.LenseQuant 1
     var T.ClericQuant 1
     var T.MenQuant 2
     var T.WomenQuant 1
     var T.ClothQuant 1
     var T.ArmoryQuant 2
     var T.ForgeQuant 1

     var RH.HerbQuant 3
     var RH.IronQuant 2
     var RH.NaphQuant 1
     var RH.FlowQuant 2
     var RH.SeliQuant 1
     var RH.ArmsQuant 1
     var RH.GenQuant 4
     var RH.ClothQuant 2
     var RH.ArtifQuant 2
     var RH.JoyQuant 2
     var RH.Joy2Quant 2
     var RH.SmokeQuant 2
     var RH.WeapQuant 2
     var RH.BardQuant 2
     var RH.Bard2Quant 2
     var RH.ClericQuant 2
     var RH.Cleric2Quant 2
     var RH.LockQuant 2
     var RH.TogQuant 2
     var RH.Tog2Quant 2
     var RH.MirgQuant 2

     var AD.FetaQuant 2
     var AD.ThreadQuant 2
     var AD.FashQuant 1
     var AD.OddsQuant 1
     var AD.BardQuant 1
     var AD.MapQuant 1
     var AD.ArmQuant 1
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 2
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 2
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 2
     var KA.GrekQuant 2

     var C.AlchQuant 2
     var C.ArtifQuant 2
     var C.GrocerQuant 4
     var C.BathQuant 2
     var C.CardQuant 2
     var C.GenQuant 4
     var C.Gen.BQuant 2
     var C.WeapQuant 2
     var C.ArmQuant 2
     var C.MusicQuant 2
     var C.Music2Quant 1
     var C.LockQuant 1
     var C.EmpathQuant 1
     var C.Empath2Quant 1
     var C.Empath3Quant 1
     var C.ClerQuant 2
     var C.HaberQuant 2
     var C.ScriptQuant 1
     var C.TannQuant 2
     var C.JewelQuant 2
     var C.Jewel2Quant 1
     var C.StitchQuant 2
     var C.CobbQuant 2
     var C.HerbQuant 2
     var C.FlowQuant 2

     var L.SkinQuant 2
     var L.BowQuant 2
     var L.OrigQuant 1
     var L.WeapQuant 1
     var L.WickQuant 1
     var L.BardQuant 2
     var L.Bard2Quant 2
     var L.ClothQuant 2
     var L.WoodQuant 1
     var L.GenQuant 3
     var L.PerfQuant 2

     var S.GenQuant 4
     var S.WeapQuant 1
     var S.ClericQuant 3
     var S.StitchQuant 2
     var S.AlchQuant 2
     var S.HerbQuant 2
     var S.ArtifQuant 1
     var S.MusicQuant 2
     var S.ArmorQuant 2
     var S.ReedQuant 2
     var S.MuseumQuant 2
     var S.BowQuant 2
     var S.SpireQuant 1
     var S.LockQuant 1
     var S.CoinQuant 1
     var S.FrillQuant 1
     var S.HeraldQuant 1
     var S.TravelQuant 1
     var S.ToyQuant 1
     var S.MemoryQuant 1
     var S.TokenQuant 1
     var S.BarberQuant 2
     var S.TannerQuant 1
     var S.SurvQuant 2
     var S.Surv2Quant 2
     var RP.GenQuant 2
     var RP.TobacQuant 2

     var HC.JahtinitQuant 2
     var HC.FalconerQuant 2
     var HC.YasnahQuant 2
     var HC.BowyerQuant 2
     var HC.Bowyer2Quant 2
     var HC.EquineQuant 2
     var HC.FelterieQuant 2
     var HC.Felterie2Quant 2

     var SC.WeapQuant 1
     var H.ShieldQuant 1
     var H.JewelQuant 1
     var H.TogQuant 1
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 1
     var H.MusicQuant 1
     var H.AlchQuant 2
     var H.ForgeQuant 1
     var H.GenQuant 3
     var H.TobacQuant 1

     var R.BaitQuant 2
     var R.GenQuant 2
     var R.HerbQuant 2
     var R.ForgeQuant 2
     var R.TailorQuant 2
     var R.LeatherQuant 2
     var R.HairQuant 2
     var R.MusicQuant 2
     var R.MagicQuant 1
     var R.OrigamiQuant 2
     var R.JewelryQuant 1
     var R.ClericQuant 2
     var R.RingQuant 2

     var A.HerbQuant 3
     var A.TannerQuant 2
     var A.ClothingQuant 1
     var A.ScriptQuant 1
     var A.ClericQuant 2
     var A.OrigamiQuant 1
     var A.JewelryQuant 1
     var A.MagicQuant 2
     var A.SlingsQuant 1
     var A.PuzzleQuant 1
     var A.FootwearQuant 2
     var A.ShieldsQuant 1
     var A.WeaponQuant 2
     var A.ArmorQuant 2
     var A.GenQuant 3
     var A.FlowerQuant 1
     var A.MusicQuant 1
     RETURN
########################
# 200-599
########################
ITEM.COUNT2:
     var T.TarshaQuant 2
     var T.RoseQuant 2
     var T.MusicQuant 2
     var T.HatsQuant 2
     var T.ArmQuant 2
     var T.GiftQuant 2
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 2
     var T.KrrishQuant 2
     var T.LenseQuant 2
     var T.ClericQuant 2
     var T.MenQuant 2
     var T.WomenQuant 1
     var T.ClothQuant 1
     var T.ArmoryQuant 2
     var T.ForgeQuant 2

     var RH.HerbQuant 3
     var RH.IronQuant 2
     var RH.NaphQuant 2
     var RH.FlowQuant 2
     var RH.SeliQuant 2
     var RH.ArmsQuant 2
     var RH.GenQuant 2
     var RH.ClothQuant 2
     var RH.ArtifQuant 2
     var RH.JoyQuant 3
     var RH.Joy2Quant 2
     var RH.SmokeQuant 2
     var RH.WeapQuant 2
     var RH.BardQuant 2
     var RH.Bard2Quant 2
     var RH.ClericQuant 2
     var RH.Cleric2Quant 1
     var RH.LockQuant 2
     var RH.TogQuant 2
     var RH.Tog2Quant 2
     var RH.MirgQuant 1

     var AD.FetaQuant 2
     var AD.ThreadQuant 2
     var AD.FashQuant 2
     var AD.OddsQuant 2
     var AD.BardQuant 2
     var AD.MapQuant 2
     var AD.ArmQuant 2
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 2
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 2
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 2
     var KA.GrekQuant 2

     var C.AlchQuant 3
     var C.ArtifQuant 2
     var C.GrocerQuant 4
     var C.BathQuant 2
     var C.CardQuant 2
     var C.GenQuant 3
     var C.Gen.BQuant 3
     var C.WeapQuant 2
     var C.ArmQuant 3
     var C.MusicQuant 2
     var C.Music2Quant 1
     var C.LockQuant 3
     var C.EmpathQuant 2
     var C.Empath2Quant 2
     var C.Empath3Quant 2
     var C.ClerQuant 3
     var C.HaberQuant 2
     var C.ScriptQuant 2
     var C.TannQuant 2
     var C.JewelQuant 2
     var C.Jewel2Quant 2
     var C.StitchQuant 3
     var C.CobbQuant 2
     var C.HerbQuant 2
     var C.FlowQuant 2

     var L.SkinQuant 3
     var L.BowQuant 2
     var L.OrigQuant 2
     var L.WeapQuant 2
     var L.WickQuant 2
     var L.BardQuant 2
     var L.Bard2Quant 2
     var L.ClothQuant 2
     var L.WoodQuant 2
     var L.GenQuant 2
     var L.PerfQuant 2

     var S.GenQuant 3
     var S.WeapQuant 2
     var S.ClericQuant 2
     var S.StitchQuant 2
     var S.AlchQuant 3
     var S.HerbQuant 3
     var S.ArtifQuant 2
     var S.MusicQuant 2
     var S.ArmorQuant 2
     var S.ReedQuant 2
     var S.MuseumQuant 2
     var S.BowQuant 2
     var S.SpireQuant 2
     var S.LockQuant 2
     var S.CoinQuant 2
     var S.FrillQuant 2
     var S.HeraldQuant 2
     var S.TravelQuant 2
     var S.ToyQuant 2
     var S.MemoryQuant 2
     var S.TokenQuant 2
     var S.BarberQuant 2
     var S.TannerQuant 2
     var S.SurvQuant 2
     var S.Surv2Quant 3
     var RP.GenQuant 2
     var RP.TobacQuant 2

     var HC.JahtinitQuant 3
     var HC.FalconerQuant 3
     var HC.YasnahQuant 3
     var HC.BowyerQuant 3
     var HC.Bowyer2Quant 3
     var HC.EquineQuant 3
     var HC.FelterieQuant 3
     var HC.Felterie2Quant 3

     var SC.WeapQuant 2
     var H.ShieldQuant 2
     var H.JewelQuant 2
     var H.TogQuant 2
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 2
     var H.MusicQuant 2
     var H.AlchQuant 2
     var H.ForgeQuant 2
     var H.GenQuant 2
     var H.TobacQuant 2

     var R.BaitQuant 2
     var R.GenQuant 2
     var R.HerbQuant 2
     var R.ForgeQuant 2
     var R.TailorQuant 2
     var R.LeatherQuant 2
     var R.HairQuant 2
     var R.MusicQuant 2
     var R.MagicQuant 2
     var R.OrigamiQuant 2
     var R.JewelryQuant 2
     var R.ClericQuant 2
     var R.RingQuant 2

     var A.HerbQuant 2
     var A.TannerQuant 2
     var A.ClothingQuant 2
     var A.ScriptQuant 2
     var A.ClericQuant 2
     var A.OrigamiQuant 2
     var A.JewelryQuant 2
     var A.MagicQuant 2
     var A.SlingsQuant 2
     var A.PuzzleQuant 2
     var A.FootwearQuant 2
     var A.ShieldsQuant 2
     var A.WeaponQuant 2
     var A.ArmorQuant 2
     var A.GenQuant 2
     var A.FlowerQuant 2
     var A.MusicQuant 2
     RETURN
########################
# 600-1500
########################
ITEM.COUNT3:
     var T.TarshaQuant 2
     var T.RoseQuant 2
     var T.MusicQuant 3
     var T.HatsQuant 2
     var T.ArmQuant 2
     var T.GiftQuant 2
     var T.SweetQuant 2
     var T.CupcakeQuant 2
     var T.GenQuant 3
     var T.KrrishQuant 2
     var T.LenseQuant 2
     var T.ClericQuant 3
     var T.MenQuant 2
     var T.WomenQuant 2
     var T.ClothQuant 2
     var T.ArmoryQuant 2
     var T.ForgeQuant 2

     var RH.HerbQuant 3
     var RH.IronQuant 3
     var RH.NaphQuant 2
     var RH.FlowQuant 2
     var RH.SeliQuant 2
     var RH.ArmsQuant 3
     var RH.GenQuant 2
     var C.Gen.BQuant 2
     var RH.ClothQuant 2
     var RH.ArtifQuant 2
     var RH.JoyQuant 2
     var RH.Joy2Quant 2
     var RH.SmokeQuant 2
     var RH.WeapQuant 3
     var RH.BardQuant 3
     var RH.Bard2Quant 2
     var RH.ClericQuant 3
     var RH.Cleric2Quant 2
     var RH.LockQuant 3
     var RH.TogQuant 2
     var RH.Tog2Quant 2
     var RH.MirgQuant 1

     var AD.FetaQuant 3
     var AD.ThreadQuant 2
     var AD.FashQuant 2
     var AD.OddsQuant 2
     var AD.BardQuant 2
     var AD.MapQuant 2
     var AD.ArmQuant 2
     var AD.SmokeQuant 2
     var AD.Tart.EQuant 2
     var AD.Tart.CQuant 2
     var AD.Tart.MQuant 2
     var AD.Tart.LQuant 2
     var AD.Tart.FQuant 2
     var KA.GrekQuant 2

     var C.AlchQuant 3
     var C.ArtifQuant 2
     var C.GrocerQuant 4
     var C.BathQuant 2
     var C.CardQuant 2
     var C.GenQuant 3
     var C.Gen.BQuant 2
     var C.WeapQuant 3
     var C.ArmQuant 3
     var C.MusicQuant 3
     var C.Music2Quant 2
     var C.LockQuant 2
     var C.EmpathQuant 2
     var C.Empath2Quant 2
     var C.Empath3Quant 2
     var C.ClerQuant 3
     var C.HaberQuant 2
     var C.ScriptQuant 2
     var C.TannQuant 2
     var C.JewelQuant 2
     var C.Jewel2Quant 2
     var C.StitchQuant 2
     var C.CobbQuant 3
     var C.HerbQuant 2
     var C.FlowQuant 2

     var L.SkinQuant 3
     var L.BowQuant 3
     var L.OrigQuant 2
     var L.WeapQuant 2
     var L.WickQuant 3
     var L.BardQuant 3
     var L.Bard2Quant 2
     var L.ClothQuant 2
     var L.WoodQuant 3
     var L.GenQuant 3
     var L.PerfQuant 2

     var S.GenQuant 3
     var S.WeapQuant 3
     var S.ClericQuant 2
     var S.StitchQuant 3
     var S.AlchQuant 3
     var S.HerbQuant 3
     var S.ArtifQuant 2
     var S.MusicQuant 2
     var S.ArmorQuant 2
     var S.ReedQuant 3
     var S.MuseumQuant 2
     var S.BowQuant 2
     var S.SpireQuant 2
     var S.LockQuant 3
     var S.CoinQuant 3
     var S.FrillQuant 3
     var S.HeraldQuant 3
     var S.TravelQuant 3
     var S.ToyQuant 2
     var S.MemoryQuant 3
     var S.TokenQuant 2
     var S.BarberQuant 3
     var S.TannerQuant 3
     var S.SurvQuant 2
     var S.Surv2Quant 2
     var RP.GenQuant 3
     var RP.TobacQuant 3

     var HC.JahtinitQuant 5
     var HC.FalconerQuant 5
     var HC.YasnahQuant 5
     var HC.BowyerQuant 5
     var HC.Bowyer2Quant 5
     var HC.EquineQuant 5
     var HC.FelterieQuant 5
     var HC.Felterie2Quant 5

     var SC.WeapQuant 3
     var H.ShieldQuant 2
     var H.JewelQuant 2
     var H.TogQuant 2
     var H.HerbQuant 2
     var H.SundQuant 2
     var H.LampQuant 2
     var H.MusicQuant 2
     var H.AlchQuant 2
     var H.ForgeQuant 2
     var H.GenQuant 2
     var H.TobacQuant 2

     var R.BaitQuant 3
     var R.GenQuant 3
     var R.HerbQuant 3
     var R.ForgeQuant 2
     var R.TailorQuant 3
     var R.LeatherQuant 3
     var R.HairQuant 2
     var R.MusicQuant 2
     var R.MagicQuant 2
     var R.OrigamiQuant 2
     var R.JewelryQuant 2
     var R.ClericQuant 2
     var R.RingQuant 2

     var A.HerbQuant 3
     var A.TannerQuant 2
     var A.ClothingQuant 2
     var A.ScriptQuant 2
     var A.ClericQuant 2
     var A.OrigamiQuant 2
     var A.JewelryQuant 2
     var A.MagicQuant 2
     var A.SlingsQuant 2
     var A.PuzzleQuant 2
     var A.FootwearQuant 3
     var A.ShieldsQuant 2
     var A.WeaponQuant 2
     var A.ArmorQuant 3
     var A.GenQuant 3
     var A.FlowerQuant 3
     var A.MusicQuant 2
     RETURN
##############################
# WARNINGS
##############################
WELCOME:
     put #echo >Log Lime ***********************************************************************
     put #echo >Log Lime ***  Shroom's Ultimate Progressive Stealing Script - v %version     ***
     put #echo >Log Lime ***  100% Progressive - Automated Thievery Bot!                     ***
     put #echo >Log Lime ***  Type PAWNNOW at any time to skip straight to pawning           ***
     put #echo >Log Lime ***********************************************************************
     ECHO
     ECHO *****************************************************************
     ECHO *  Welcome $charactername - Circle $Circle $Guild !~
     ECHO *  SHROOM'S ULTIMATE PROGRESSIVE STEALING SCRIPT version %version
     ECHO *  100% Automated Progressive Stealing!
     ECHO *  Send bug reports/feedback to skultamaphon@gmail.com
     ECHO *****************************************************************
     ECHO
     ECHO *****************************************************************
     ECHO *** MAKE SURE YOU HAVE PLATS IN THE BANK
     ECHO *** IN THE CITIES YOU ARE STEALING IN TO COVER YOUR FINES!
     ECHO *****************************************************************
     ECHO
     pause 3
     RETURN
UNKNOWN.LOCATION:
     ECHO ********************************************************
     ECHO **** ERROR: UNKNOWN STARTING LOCATION!
     ECHO **** SCRIPT ONLY SUPPORTS THE FOLLOWING CITIES:
     ECHO **** THEREN / RIVERHAVEN / ARTHE DALE
     ECHO **** CROSSING / LETH / SHARD / HIB / HORSE CLAN
     ECHO **** RATHA / AESRY
     ECHO **** MOVE TO A VALID CITY AND RESTART SCRIPT
     ECHO *********************************************************
     pause 5
     ECHO **** ABORTING SCRIPT
     pause
     put #parse DONE STEALING
     put #parse STEALING DONE
     exit
TOO.HURT:
     ECHO
     ECHO **********************************************************
     ECHO *   YOU ARE TOO INJURED TO STEAL!
     ECHO *   GO GET HEALED FIRST NUB!
     ECHO **********************************************************
     put #parse DONE STEALING
     exit
BAG.ALERT:
     ECHO
     ECHO **************************************************************************************************
     ECHO *  !!!! ERROR!!! ERROR!!!! ERROR!!!! ERROR!!!! ERROR!!!! ERROR!!!!
     ECHO *  You CANNOT set BIN_CONTAINER and PAWN_CONTAINER as the same container!!
     ECHO *  If you are binning AND pawning.. You MUST set them to different containers!
     ECHO *  THIEVES - If you are binning and pawning, you MUST have THREE different containers (bin/pawn/safe).
     ECHO *  If you want to use only two containers and have bin/pawn as the same container, set PAWN to OFF
     ECHO *  It is NOT recommended to turn BIN OFF, as over time this will kill your THIEF REP
     ECHO ***************************************************************************************************
     ECHO
     exit
THEREN.NOSTEAL:
     ECHO
     ECHO ***************************************************************************************************
     ECHO **** Sorry! Theren is a bit too hard for noobs.
     ECHO **** Come back when you have a little more Thievery skill (~100+)
     ECHO **** It is recommended to start in either Crossings or Riverhaven as a noob
     ECHO **** AUTOMATICALLY SENDING YOU TO RIVERHAVEN IN 10 SECONDS
     ECHO **** ABORT NOW IF YOU DO NOT WISH TO CONTINUE
     ECHO ***************************************************************************************************
     ECHO
     pause 10
     gosub AUTOMOVE portal
     send .%TRAVEL_SCRIPT haven
     waitforre ^YOU ARRIVED\!
     goto HAVEN.STEAL
     put #parse DONE STEALING
     exit
TOO.MANY.FINES:
     put #echo >Log Red **** WARNING!!! TOO MANY FINES TO STEAL!! PAY OFF ALL FINES!!
     ECHO
     ECHO ******** WARNING !!!! *********** WARNING !!!! ******* WARNING !!!! ********* WARNING !!!! ************************
     ECHO **** YOU ARE AT MAXIMUM HEAT LEVEL IN THIS PROVINCE OR HAVE TOO MANY FINES TO STEAL
     ECHO **** SURRENDER TO TOWN GUARDS AT ANY CITY YOU ARE WANTED IN, YOU MAY HAVE MULTIPLE OUTSTANDING WARRANTS
     ECHO ****
     ECHO **** OR YOU MAY JUST HAVE A MULTI-PLAT DEBT SOMEWHERE! PAY OFF ALL YOUR LARGE DEBTS BEFORE YOU CAN STEAL AGAIN!
     ECHO **** YOU ARE AT HIGH RISK OF BEING THUGGED (IF THIEF)! GO TO JAIL NOW AND PAY ALL FINES!!!
     ECHO
     ECHO **** YOU MUST GO SURRENDER/CLEAR ANY WARRANTS AND PAY YOUR FINES IN EVERY CITY CONNECTED TO THIS PROVINCE!
     ECHO **** LAY LOW FOR A FEW DAYS OR STEAL FROM A DIFFERENT PROVINCE TO LET YOUR HEAT "COOL DOWN" IN THIS PROVINCE - AFTER YOU CLEAR THE HEAT
     ECHO **** YOU ~MUST~ GO TO JAIL FIRST AND PAY ALL YOUR FINES TO LET YOUR HEAT BEGIN TO RESET!!
     ECHO **** IF IN ZOLUREN - Check Xing/Leth - If Therengia - Check Theren/Haven
     ECHO ******************************************************************************************************************
     pause 10
     ECHO ******************************************************************************************************************
     ECHO *** DO NOT PASS GO! DO NOT COLLECT $200!!!
     ECHO *** GO ~DIRECTLY~ TO JAIL AND THEN ~DO NOT STEAL IN THIS PROVINCE~ FOR A FEW DAYS TO LET YOUR HEAT RESET!!
     ECHO *** If you are getting caught too often, email me your thievery ranks and log of your items you are getting caught on
     ECHO *** skultamaphon@gmail.com -  shroomismschism @ AIM
     ECHO ******************************************************************************************************************
     ECHO
     pause 4
     var fineLoop 0
TOO.MANY.FINES2:
     var LAST TOO.MANY.FINES2
     math fineLoop add 1
     ECHO *** LOOKING FOR A GUARD TO SURRENDER TO!
     if $hidden then gosub unhide
     pause 0.5
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     if matchre("$roomobjs","(town guard)") then put surrender guard
     if matchre("$roomobjs","(high guard)") then put surrender guard
     pause
     if ("$zoneid" = "42") then gosub AUTOMOVE 5
     if ("$zoneid" != "42") then gosub AUTOMOVE guard
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     if matchre("$roomobjs","(town guard)") then put surrender guard
     if matchre("$roomobjs","(high guard)") then put surrender guard
     pause
     gosub AUTOMOVE 33
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     if matchre("$roomobjs","(town guard)") then put surrender guard
     if matchre("$roomobjs","(high guard)") then put surrender guard
     gosub AUTOMOVE 3
     if matchre("$roomobjs","(Khal Gwaerd)") then put surrender gwaerd
     if matchre("$roomobjs","(Shard sentinel)") then put surrender sentin
     if matchre("$roomobjs","(Riverhaven Warden)") then put surrender warden
     if matchre("$roomobjs","(Baronial guardsman)") then put surrender guard
     if matchre("$roomobjs","(town guard)") then put surrender guard
     if matchre("$roomobjs","(high guard)") then put surrender guard
     pause 0.5
     if "%fineLoop" < 3 then goto TOO.MANY.FINES2
     put #parse DONE STEALING
     put #parse DONE STEALING
     pause 0.5
     exit
NOSKILLS:
     if (%noskills = 1) then goto NOSKILLS.DONE
     var noskills 1
     put #echo >Log Red **** ERROR: Missing your Thievery.Ranks variable in Genie!!
     put #echo >Log Red **** Attempting to fix automatically...
     ECHO
     ECHO ***************************** ERROR!!! *************************************
     ECHO **** MISSING YOUR THIEVERY.RANKS VARIABLE IN GENIE!!
     ECHO **** THIS IS USUALLY DUE TO LOGGING MULTIPLE CHARACTERS ON THE SAME CLIENT
     ECHO **** OR IF YOU DO NOT HAVE THE EXPTRACKER PLUGIN INSTALLED/ENABLED!
     ECHO **** TYPE EXP 0 ON YOUR STEALING CHARACTER, CLOSE GENIE AND RE-OPEN
     ECHO ****************************************************************************
     ECHO
     ECHO ************************************************************
     ECHO **** ATTEMPTING TO FIX IT AUTOMATICALLY.... STAND BY!
     ECHO ************************************************************
     put exp 0
     pause
     pause
     action instant var skillValue $1 when ^.*\:\s*(\d+)\s\d+\.\d+\%
     send skill thievery
     waitforre ^EXP HELP
     action remove ^.*\:\s*(\d+)\s\d+\.\d+\%
     ECHO
     ECHO Thievery Ranks - %skillValue
     ECHO
     put #var Thievery.Ranks %skillValue
     put #var save
     pause 0.5
     ECHO **** THIEVERY: $Thievery.Ranks
     ECHO
     ECHO **** RESTARTING SCRIPT...
     ECHO
     pause
     goto INIT.SETUP
NOSKILLS.DONE:
     put #echo >Log Red **** ERROR: Missing your Thievery.Ranks variable in Genie!!
     put #echo >Log Red **** REINSTALL EXP TRACKER PLUGIN
     ECHO *** FAILED TO FIX Thievery.Ranks GENIE VARIABLE!
     ECHO *** YOU MAY NOT HAVE THE EXPTRACKER PLUGIN INSTALLED !
     put #parse DONE STEALING
     put #parse DONE STEALING
     pause 0.5
     exit
BAG.FULL:
     put #echo >Log Red **** STEAL SCRIPT CRITICAL ERROR - SAFE CONTAINER TOO FULL!!
     put #echo >Log Red **** EMPTY OUT SOME SPACE IN YOUR %SAFE_CONTAINER
     ECHO
     ECHO *********************************************************************************************************
     ECHO ***** CRITICAL ERROR! SAFE CONTAINER - %SAFE_CONTAINER IS TOO FULL!
     ECHO ***** CLEAN UP YOUR SAFE CONTAINER AND/OR GET RID OF UNNECESSARY ITEMS IN YOUR BAGS
     ECHO ***** SAFE CONTAINER SHOULD BE YOUR LARGEST CONTAINER! MAKE SURE YOU DON'T USE SMALL BAGS
     ECHO ***** AND HAVE ENOUGH ROOM FOR ALL YOUR ARMOR AND OTHER THINGS
     ECHO ****  SCRIPT USES THIS CONTAINER TO SAFEGUARD ALL YOUR IMPORTANT OR CONFLICTING ITEMS
     ECHO **********************************************************************************************
     ECHO
     put #parse DONE STEALING
     put #parse DONE STEALING
     pause 0.5
     exit
NO.FUNDS:
     put #echo >Log Red ************************************************************************************
     put #echo >Log Red **** CRITICAL ERROR!!! WARNING!! OUT OF FUNDS TO PAY FINE IN %CITY !!
     put #echo >Log Red **** DO NOT PASS GO! DO NOT COLLECT 200 DOLLARS!
     put #echo >Log Red **** GO GET SOME MONEY FROM ANOTHER TOWN AND PAY YOUR FINE ASAP!
     put #echo >Log Red **** YOU MUST PAY YOUR FINE IN %CITY WITHIN ~24 HOURS OR YOU COULD LOSE YOUR STUFF!
     put #echo >Log Red ************************************************************************************
     ECHO
     ECHO ***********************************************************************************************
     ECHO * WARNING! YOU DON'T HAVE ENOUGH MONEY TO PAY THIS FINE!
     ECHO * GO GET SOME FUNDS FROM ANOTHER BANK AND PAY YOUR FINE AND GET YOUR STUFF!
     ECHO * IT IS RECOMMENDED TO KEEP PLENTY OF PLATS IN THE BANK IN THE CITIES YOU STEAL IN!
     ECHO * THE FINES CAN RACK UP ESPECIALLY IF YOU DO NOT REGULARLY CLEAR YOUR HEAT!
     ECHO ***********************************************************************************************
     ECHO
     ECHO
     ECHO **** GET SOME MONEY FROM ANOTHER BANK AND PAY YOUR FINE IN %CITY !!!!!!!!!!
     ECHO
     put #parse DONE STEALING
     put #parse DONE STEALING
     pause 0.5
     exit
NO.PASSWORD:
     ECHO
     ECHO ***********************************************************************************************
     ECHO *  YOU DIDN'T SET YOUR THIEF GUILD PASSWORDS! THESE ARE MANDATORY TO STEAL IN HAVEN AND SHARD!
     ECHO *  SET VARIABLES HAVEN_PW and SHARD_PW TO ~YOUR~ PASSWORD IN stealVariables.inc
     ECHO ***********************************************************************************************
     ECHO
     exit
NOOB:
     ECHO
     ECHO ***********************************************************************************************
     ECHO * It appears you have under 20 ranks in thievery!
     ECHO * I just recently added support for complete noobs, so learning may not be totally optimal.
     ECHO * If you run into bugs or consistently get caught on the same things, let me know.
     ECHO ***********************************************************************************************
     ECHO
     pause 5
     RETURN
ARMOR.WARN:
     ECHO
     ECHO *************************************************************************************
     ECHO ** WARNING: SCRIPT COULD NOT REMOVE ALL YOUR ARMOR
     ECHO ** Remove any remaining armor and type "GO" to continue
     ECHO ** Please send me a log of the item name so I can add it
     ECHO *************************************************************************************
     ECHO
     matchre RETURN GO|go
     matchwait
CRIT.ERROR:
     ECHO
     ECHO ***********************************************************************************************
     ECHO *** CRITICAL ERROR!  WARNING! WARNING!
     ECHO *** You have run into some crazy never before seen error!!
     ECHO *** Your hands are too full to remove all of your items before getting your jail sack
     ECHO ***
     ECHO *** Consider reducing the number of items you use which persist through jail. Most are just fluff anyway.
     ECHO *** Script is really only set up to support 2. I don't want to potentially lose an important item.
     ECHO *** ABORTING SCRIPT TO BE ON THE SAFE SIDE SO YOU DON'T LOSE ANYTHING
     ECHO *** REMOVE ALL YOUR WORN ITEMS - RETRIEVE YOUR JAIL SACK MANUALLY
     ECHO *** SEND ME A LOG OF YOUR HANGUP AND I WILL SEE IF I CAN CODE FOR IT IN THE SCRIPT
     ECHO ***********************************************************************************************
     ECHO
     pause 5
     exit
HELP:
     ECHO
     ECHO # - USAGE - Simply start script with .steal
     ECHO # - For Troubleshooting/testing - .steal 1st variable: <label to skip to>  2nd variable: <type anything to SKIP INITIAL BAG CHECK AND TURN ON DEBUG MODE>
     ECHO # - For example - .steal CROSSING BLAH will skip directly to CROSSING label and skip the intial bag check and turn on debug mode
     ECHO # - THIS IS FOR TESTING/TROUBLESHOOTING PURPOSES ONLY!!! Usually after already starting stealing script and you want to restart it halfway through.
     ECHO # - Skips the bag check so it doesn't put already stolen items in your safe container
     ECHO # - This is assuming you already went through the beginning bag check - USE AT YOUR OWN RISK!
     ECHO # - I am not responsible for any lost items if you use this incorrectly.
     ECHO
     exit
### DEFAULT VARIABLES
DefaultVariables:
     if !def(StealingProfit) then put #var StealingProfit 0
     put #tvar Plat 0
     put #tvar Gold 0
     put #tvar Silver 0
     put #tvar Bronze 0
     put #tvar Copper 0
     var GlobalProfit 0
     var Banked 0
     var TotalProfit 0
     var Profit 0
     var Plat 0
     var Plats 0
     var Platz 0
     var Gold 0
     var Golds 0
     var Goldz 0
     var Silver 0
     var Silvers 0
     var Silverz 0
     var Bronze 0
     var Bronzes 0
     var Bronzez 0
     var Copper 0
     var Coppers 0
     var Copperz 0
     var runTime 0
     var itemLocation
     var skipping 0
     var stolen 0
     var grabbed 0
     var adjusted 0
     var downshift 0
     var stowedItems 0
     var horsePawn 0
     var caught 0
     var Jailed 0
     var JAIL NULL
     var JAIL2 NULL
     var JAIL3 NULL
     var JAIL4 NULL
     var Charges 0
     var Binned 0
     var Pawned 0
     var AltCount 0
     var noskills 0
     var warrants 0
     var Active.Warrants None
     var hib.warrant 0
     var shard.warrant 0
     var leth.warrant 0
     var cross.warrant 0
     var haven.warrant 0
     var theren.warrant 0
     var ratha.warrant 0
     var aesry.warrant 0
     var EndEarly OFF
     var SECOND_ITEM 0
     var SECOND_PAWN OFF
     var goPawn OFF
     var marking OFF
     var noLearn OFF
     var noSteal OFF
     var Rite OFF
     var Eyes OFF
     var nosell null
     var armor null
     var armor1 null
     var armor2 null
     var armor3 null
     var armor4 null
     var armor5 null
     var armor6 null
     var armor7 null
     var armor8 null
     var armor9 null
     var armor10 null
     var total_armor 0
     var tempItem null
     var item null
     var item1 null
     var item2 null
     var item3 null
     var item4 null
     var ALT1 null
     var ALT2 null
     var ALT3 null
     var ALT4 null
     var ALT5 null
     var ALT6 null
     var ALT7 null
     var ALT8 null
     var ALT9 null
     var ALT10 null
     var ALT11 null
     var ALT12 null
     var ALT13 null
     var ALT14 null
     var ALT15 null
     RETURN
