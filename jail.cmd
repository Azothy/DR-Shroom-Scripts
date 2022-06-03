#debuglevel 5
var CLANITEM NO
var CLAN.ITEM.NAME human skull
var PLEAD innocent
var BIN_CONTAINER bag
var PAWN_CONTAINER haversack
var SAFE_CONTAINER backpack
#put #script abort all except jail
action goto PLEAD when How do you plead\?
if_1 then goto %1
############################################################################################
############################################################################################
# JAILED / DEBT PAYING ROUTINE         #
#  ROBUST AS A MOTHERFUCKER            #
############################################################################################
############################################################################################
JAILED:
JAIL.CHECK:
     put #parse TAKING CARE OF BUSINESS
     action instant goto PLEAD when ^The eyes of the court|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying|You don't seem to be able
     #put #script pause %ScriptName
     if ($zoneid = 1) then goto CROSSING.JAIL
     if ($zoneid = 30) then goto HAVEN.JAIL
     if ($zoneid = 42) then goto THEREN.JAIL
     if ($zoneid = 61) then goto LETH.JAIL
     if ($zoneid = 116) then goto HIB.JAIL
     if ($zoneid = 67) then goto SHARD.JAIL
     if ($zoneid = 99) then goto AESRY.JAIL
     if ($zoneid = 90) then goto RATHA.JAIL
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
     ECHO *** YOU'VE BEEN JAILED IN %CURRENT_CITY! ***
     put #echo >log Orange **** ARRESTED IN %CURRENT_CITY ****
     if (%Jailed = 1) then var JAIL %CURRENT_CITY
     if (%Jailed = 2) then var JAIL2 %CURRENT_CITY
     if (%Jailed = 3) then var JAIL3 %CURRENT_CITY
     if (%Jailed = 4) then var JAIL4 %CURRENT_CITY
     if ($zoneid = 67) && ($roomid = 528) then goto GET.SACK
     if ($zoneid = 1) && ($roomid = 406) then goto GET.SACK
     if ($zoneid = 30) && ($roomid = 270) then goto GET.SACK
     if ($zoneid = 42) && ($roomid = 125) then goto GET.SACK
     if ($zoneid = 61) && ($roomid = 172) then goto GET.SACK
     if ($zoneid = 116) && ($roomid = 202) then goto GET.SACK
     pause 0.1
     ECHO *** WAITING FOR SENTENCE! ***
JAIL.FORAGE:
     pause 0.2
     if (!$standing) then gosub STAND
     if !matchre("$zoneid" , "67") then goto PLEAD.WAIT
     gosub KICKEM
     gosub collect dust bunny
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
     if ($zoneid = 1) && ($roomid = 23) then goto STOCKS
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
     ECHO **** Getting some coin to pay fine  ****
     ECHO
     if ($zoneid = 42) then goto THEREN.JAIL.GET.FINE
     gosub clear
     if ($zoneid = 90) then
          {
               var GUARD 1guard
               if ($roomid = 349) then var GUARD 1guard
               if ($roomid = 581) then var GUARD 3guard
          }
     pause 0.1
TO.TELLER:
     var plat 20
     if ($zoneid = 116) then
          {
               gosub automove 1teller
               goto FINECHECK.FORFEDHDAR
          }
     if ($zoneid = 90) then
          {
               gosub AUTOMOVE 1teller
               goto FINECHECK.QI
          }
     gosub AUTOMOVE teller
     if ($zoneid = 99) then goto FINECHECK.QI
     if ($zoneid = 61) then goto FINECHECK.ZOLUREN
     if ($zoneid = 1) then goto FINECHECK.ZOLUREN
     if ($zoneid = 30) then goto FINECHECK.THERENGIA
     if ($zoneid = 34a) then goto FINECHECK.THERENGIA
     if ($zoneid = 42) then goto FINECHECK.THERENGIA
     if ($zoneid = 67) then goto FINECHECK.ILITHI
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
     send hum scale
     pause 0.2
     send stop hum
     pause 0.1
     pause 0.1
     goto %LOCATION
BIGGER.FINE:
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
     if ($zoneid = 116) then
          {
               gosub automove 1teller
               goto DONE.DEBT
          }
     if ($zoneid = 90) then
          {
               gosub AUTOMOVE 1teller
               goto DONE.DEBT
          }
     gosub AUTOMOVE teller
DONE.DEBT:
     pause 0.1
     if ($invisible = 1) then gosub stopinvis
     send dep all
     pause 0.1
RETURN.TO.JAIL:
     ECHO
     ECHO **** Heading back to jail now ****
     ECHO
     pause 0.5
     if ($zoneid = 42) then goto THEREN.KEEP.JAIL
     if ($zoneid = 90) then goto RATHA.JAIL.RETURN
     if ($zoneid = 67) then goto SHARD.JAIL.RETURN
     if ($zoneid = 116) then goto HIB.JAIL.RETURN
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
          if %item2 != "null" then gosub PUT wear my %item2
          pause 0.1
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my ring
          if matchre("$righthandnoun|$lefthandnoun", "key") then gosub PUT wear my key
          if matchre("$righthandnoun|$lefthandnoun", "toad") then gosub PUT wear my toad
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT wear my rat
          if matchre("$righthandnoun|$lefthandnoun", "obsidian") then gosub PUT wear my obsidian
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
          pause 0.3
          pause 0.01
          pause 0.01
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT wear my fifth ring
          if matchre("$righthandnoun|$lefthandnoun", "ring") then gosub PUT STOW my ring in my %SAFE_CONTAINER
          if matchre("$righthandnoun|$lefthandnoun", "rat") then gosub PUT STOW my rat in my %SAFE_CONTAINER
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
               if ("$righthandnoun" != "sack") then gosub PUT stow right in my %BIN_CONTAINER
               if ("$lefthandnoun" != "sack") then gosub PUT stow left in my %BIN_CONTAINER
               pause 0.2
          }
SACK:
     pause 0.1
     pause 0.2
     gosub PUT open my small sack
     gosub JAIL.EMPTY sack
     pause 0.5
     pause 0.5
     matchre RAT \brat\b
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
RAT:
     pause 0.1
     gosub PUT get rat
     pause 0.5
     send wear rat
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
     if ("$lefthand" != "Empty") then send put my $lefthand in my %BIN_CONTAINER
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
     if contains("%IMPORTANT_ITEMS", "$1") then send put my $1 in my %SAFE_CONTAINER
     if contains("%ring", "$1") then send put my $1 in my %SAFE_CONTAINER
     if contains("%STEAL.LIST", "$1") then send put my $1 in my %PAWN_CONTAINER
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
               if ("$lefthand" != "Empty") then send put my $lefthand in my %SAFE_CONTAINER
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
     if ("$righthand" != "Empty") then gosub put stow right in my %BIN_CONTAINER
     if ("$lefthand" != "Empty") then gosub put stow left in my %BIN_CONTAINER
     pause 0.1
     ECHO
     ECHO **** DONE WITH JAIL / SACK SEQUENCE ****
     ECHO
     pause
     if (!$standing) then gosub STAND
     if contains("$lefthand" "$righthand" , "%LARGE.ITEMS") then gosub EMPTY.HANDS
CHECKLOC:
     if ($zoneid = 67) then goto SHARD.JAIL.DONE
     if ($zoneid = 116) then goto HIB.JAIL.DONE
     if ($zoneid = 61) then goto LETH.JAIL.DONE
     if ($zoneid = 1) then goto CROSS.JAIL.DONE
     if ($zoneid = 30) then goto HAVEN.JAIL.DONE
     if ($zoneid = 42) then goto THEREN.JAIL.LEAVE
     if ($zoneid = 90) then goto RATHA.JAIL.DONE
     if ($zoneid = 99) then goto AESRY.JAIL.DONE
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
	put #echo >Log SkyBlue *** RECOVERED FROM JAIL VIA ~JAIL~ SCRIPT
     if matchre("$roomobjs","(rat)") then 
          {
               send get rat
               send stow rat
               pause 0.5
          }
	echo 
	echo *** FREE FROM JAIL!
	echo
     put #parse FREE FROM JAIL
	put #parse FREE FROM JAIL
	exit
#######################################################################################
# END
#######################################################################################

##### AUTOMOVE SUBROUTINE #####
AUTOMOVE:
     delay 0.0001
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
     matchwait 10
     goto AUTOMOVE.STAND
##############################################################################################
MOVE_RANDOM:
     delay 0.0001
     random 1 8
     if (%r = 1) && (!$north) then goto MOVE_RANDOM
     if (%r = 2) && (!$northeast) then goto MOVE_RANDOM
     if (%r = 3) && (!$east) then goto MOVE_RANDOM
     if (%r = 4) && (!$southeast) then goto MOVE_RANDOM
     if (%r = 5) && (!$south) then goto MOVE_RANDOM
     if (%r = 6) && (!$southwest) then goto MOVE_RANDOM
     if (%r = 7) && (!$west) then goto MOVE_RANDOM
     if (%r = 8) && (!$northwest) then goto MOVE_RANDOM
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
     if (%Exits > 1) && ("%Last.Direction" = "%Reverse.Direction") then goto MOVE_RANDOM
     #
     var Last.Direction %Direction
     # Trigger to set variable for occupied room, when roaming.
     action instant var Occupied 1 when ^Also here\:|^Also in the room\:
     var Occupied 0
     gosub MOVE_RESUME
     #if (%Occupied) then goto MOVE_RANDOM
     return
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
     matchre MOVE_FAILED ^You can't go there
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait
MOVE_STAND:
     pause 0.1
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
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
MOVE_DIG:
     pause 0.1
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait
MOVE_DIG_STAND:
     pause 0.1
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait
MOVE_FAILED:
     evalmath movefailCounter (movefailCounter + 1)
     if (%movefailCounter > 3) then goto MOVE_FAIL_BAIL
     pause 0.5
     goto MOVE_RESUME
MOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     exit
MOVE_RETURN:
     return
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
     matchwait 8
     goto STAND
STAND.PLAYING:
     send stop play
     pause 0.1
     goto STAND

## Stow subs
STOWING:
     delay 0.0001
     var LOCATION STOWING
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
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^You (?:hand|slide|get|pull|push|move|put|remove|wear|sling|whisper|lean|tap|pick|silently|slip|realize|stop|open|close|drop|place|knock|grab|fade|toss|set|add|offer|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^Subservient type|^The shadows|^Close examination|^Try though  
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Allows a Moon Mage
     matchre RETURN_CLEAR ^A slit across the door
     matchre RETURN_CLEAR ^Your (?:actions|dance).*\.
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
     matchre RETURN_CLEAR ^This ritual may only be performed on a corpse\.
     matchre RETURN_CLEAR ^There is nothing else to face\!
     matchre RETURN_CLEAR ^You're already stalking
     matchre RETURN_CLEAR ^An offer
     matchre RETURN_CLEAR ^Ylono looks
     matchre RETURN_CLEAR ^Malik nods
     matchre RETURN_CLEAR ^Obvious exits
     matchre RETURN_CLEAR ^Obvious paths
     matchre RETURN_CLEAR ^But the merchant can't see you|are invisible
     matchre STAND ^You should stand up first\.
     # matchre RETURN_CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Log Crimson $datetime Command = %command
     put #log $datetime MISSING MATCH IN PUT
     RETURN
PUT.STOW:
     gosub stow
     goto PUT.1
stopinvis:
     delay 0.001
     gosub PUT hum scale
     pause 0.2
     gosub PUT stop hum
     RETURN
#############################
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
     matchre RETURN ^But that is already in your inventory\.
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! ***
     put #echo >$Log Crimson $datetime Get = %get
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
     matchre RETURN ^You (?:hand|push|move|put|whisper|lean|tap|pick|silently|slip|stop|open|close|drop|place|knock|grab|fade|toss|set|add|offer|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|are already|can't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^.* what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Perhaps you should be holding that first\.
     send put %putit
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT.IT!  ***
     put #echo >$Log Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT.IT
     RETURN
##################
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
##########################################################################################################################################
JAIL.EMPTY:
     var bag $0
     pause .0001
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
     gosub PUT WEAR my %item
     pause 0.1
     pause 0.2
     if ("%item" = "%SAFE_CONTAINER") then gosub PUT open my %SAFE_CONTAINER
     gosub PUT.IT my %item in my %BIN_CONTAINER
     if %c < 1 then RETURN
     goto JAIL.EMPTY.ItemAction
     
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
RETURN.CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return
