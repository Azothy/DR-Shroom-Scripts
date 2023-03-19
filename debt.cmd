####################################
# Debt paying Script 
# By Shroom of TF 
####################################
echo ===========================
echo *** PAYING OFF YOUR DEBT!!
echo ===========================

TO_TELLER:
     var plat 20
     var fine 0
     var wealth 0
     var nofundloop 0
     gosub AUTOMOVE teller
CHECKING_FINE:
     echo ===============
     echo *** CHECKING DEBT
     echo ===============
     pause 0.3
     if ("$zoneid" = "107") then goto FINECHECK_QI
     if ("$zoneid" = "99") then goto FINECHECK_QI
     if ("$zoneid" = "90") then goto FINECHECK_QI
     if ("$zoneid" = "61") then goto FINECHECK_ZOLUREN
     if ("$zoneid" = "1") then goto FINECHECK_ZOLUREN
     if ("$zoneid" = "30") then goto FINECHECK_THERENGIA
     if ("$zoneid" = "34a") then goto FINECHECK_THERENGIA
     if ("$zoneid" = "42") then goto FINECHECK_THERENGIA
     if ("$zoneid" = "47") then goto FINECHECK_THERENGIA
     if ("$zoneid" = "67") then goto FINECHECK_ILITHI
     if ("$zoneid" = "116") then goto FINECHECK_FORFEDHDAR
     pause
     echo
     echo *** CRITICAL ERROR!
     echo *** UKNOWN JAIL LOCATION!!
     echo
     put #echo >Log Red *** CRITICAL ERROR!!!!
     put #echo >Log Red *** UNKOWN JAIL LOCATION: Zone- $zoneid Room- $roomid
     put #echo >Log Red *** PAY YOUR FINE MANUALLY!
     pause 0.1
     exit
FINECHECK_QI:
var LOCATION FINECHECK_QI
     matchre SET_FINE Qi\.\s*\((\d+) copper Lirums\)
     send wealth
     matchwait 8
     goto NO_FINE
FINECHECK_THERENGIA:
var LOCATION FINECHECK_THERENGIA
     matchre SET_FINE Therengia\.\s*\((\d+) copper Lirums\)
     send wealth
     matchwait 8
     goto NO_FINE
FINECHECK_ZOLUREN:
var LOCATION FINECHECK_ZOLUREN
     matchre SET_FINE Zoluren\.\s*\((\d+) copper Kronars\)
     send wealth
     matchwait 8
     goto NO_FINE
FINECHECK_ILITHI:
var LOCATION FINECHECK_ILITHI
     matchre SET_FINE Ilithi\.\s*\((\d+) copper Dokoras\)
     send wealth
     matchwait 8
     goto NO_FINE
FINECHECK_FORFEDHDAR:
var LOCATION FINECHECK_FORFEDHDAR
     matchre SET_FINE Forfedhdar\.\s*\((\d+) copper Dokoras\)
     send wealth
     matchwait 8
     goto NO_FINE
SET_FINE:
     pause 0.1
     var fine $1
     pause 0.1
     eval fine replacere("%fine", ",", "")
     eval fine replacere("%fine", " ", "")
     math currentfine add %fine
     pause 0.2
     echo =====================
     echo *** CHECKING CURRENT CASH
     echo =====================
     pause 0.3
     if ("$zoneid" = "107") then goto CASHCHECK_QI
     if ("$zoneid" = "99") then goto CASHCHECK_QI
     if ("$zoneid" = "90") then goto CASHCHECK_QI
     if ("$zoneid" = "61") then goto CASHCHECK_ZOLUREN
     if ("$zoneid" = "1") then goto CASHCHECK_ZOLUREN
     if ("$zoneid" = "30") then goto CASHCHECK_THERENGIA
     if ("$zoneid" = "34a") then goto CASHCHECK_THERENGIA
     if ("$zoneid" = "42") then goto CASHCHECK_THERENGIA
     if ("$zoneid" = "47") then goto CASHCHECK_THERENGIA
     if ("$zoneid" = "67") then goto CASHCHECK_ILITHI
     if ("$zoneid" = "116") then goto CASHCHECK_FORFEDHDAR     
##### CHECK CURRENT COINS ON YOU
CASHCHECK_QI:
var LOCATION CASHCHECK_QI
     matchre NO_WEALTH ^No Lirums
     matchre SET_WEALTH Lirums\s\(([\d,]+) copper Lirums\)\.
     send wealth
     matchwait 15
     goto NO_WEALTH
CASHCHECK_THERENGIA:
var LOCATION CASHCHECK_THERENGIA
     matchre NO_WEALTH ^No Lirums
     matchre SET_WEALTH Lirums\s\(([\d,]+) copper Lirums\)\.
     send wealth
     matchwait 15
     goto NO_WEALTH
CASHCHECK_ZOLUREN:
var LOCATION CASHCHECK_ZOLUREN
     matchre NO_WEALTH ^No Kronars
     matchre SET_WEALTH Kronars\s\(([\d,]+) copper Kronars\)\.
     send wealth
     matchwait 15
     goto NO_WEALTH
CASHCHECK_ILITHI:
var LOCATION CASHCHECK_ILITHI
     matchre NO_WEALTH ^No Dokoras
     matchre SET_WEALTH Dokoras\s\(([\d,]+) copper Dokoras\)\.
     send wealth
     matchwait 15
     goto NO_WEALTH
CASHCHECK_FORFEDHDAR:
var LOCATION CASHCHECK_FORFEDHDAR
     matchre NO_WEALTH ^No Dokoras
     matchre SET_WEALTH Dokoras\s\(([\d,]+) copper Dokoras\)\.
     send wealth
     matchwait 15
     goto NO_WEALTH

SET_WEALTH:
     var wealth $1
     eval wealth replacere("%wealth", ",", "")
     eval wealth replacere("%wealth", " ", "")
     goto FINE_PROCESS
NO_WEALTH:
     var wealth 0
FINE_PROCESS:
     echo ================
     echo *** WEALTH: %wealth
     echo ================
     pause 0.1
     if (%fine = 0) then goto NO_FINE
     if (%fine > 20000) then
          {
               put #echo >Log Crimson *** Warning! Large Fines in %CURRENT_CITY! Current Fine: %fine
               if (%Debt = 0) then put #echo >Log Crimson *** Consider laying low from stealing for a few days or switching provinces!
          }
     if (%wealth > %fine) then
          {
               echo =============================
               echo *** Paying debt with cash on hand!
               echo =============================
               pause 0.4
               goto PAY.DEBT
          }
     if (%fine > 250000) then goto BIGGER_FINE
     if (%fine > 100000) then goto BIG_FINE
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
     delay 0.001
     if ("$guild" = "Necromancer") then
          {
               put release eotb
               pause 0.3
          }
     if ("$guild" = "Thief") then
          {
               put khri stop silence vanish
               pause 0.3
          }
     if ("$guild" = "Moon Mage") then
          {
               put release rf
               pause 0.3
          }
     pause 0.3
     goto %LOCATION
BIGGER.FINE:
var LOCATION BIGGER.FINE
     if (%fine > 200000) then var plat 25
     if (%fine > 250000) then var plat 35
     if (%fine > 350000) then var plat 40
     if (%fine > 400000) then var plat 45
     if (%fine > 450000) then var plat 50
     if (%fine > 500000) then var plat 90
     if (%fine > 900000) then var plat 120
     if (%fine > 1200000) then var plat 150
     if (%fine > 1500000) then var plat 200
     if (%fine > 2000000) then var plat 300
     goto BIG.FINE
NO.FINE:
     echo
     echo *** You have no fine!
     echo
     goto DONE.DEBT
PAY.DEBT:
var LOCATION PAY.DEBT
     echo
     echo **** Paying off your debt! ***
     echo
     pause 0.3
     # Walking to pay off the debt
     gosub AUTOMOVE debt
     if ($invisible = 1) then gosub stopinvis
     pause 0.2
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
     send deposit all
     pause 0.1
     echo ===================================
     echo ** DONE! Paid off Debt: %fine 
     echo ===================================
     put #parse SCRIPT FINISHED!
     put #parse SCRIPT FINISHED!
     exit
     
     
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
     return
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