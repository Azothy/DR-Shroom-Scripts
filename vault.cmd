#################################################
# VAULT script by Shroom of TF
# Auto-enters vault and looks on all the shelves
# Waits for you to be done
# Type "DONE" to auto-leave vault 
# Pays your rent automatically if needed
# Start inside any city you own a vault 
##############################################
     echo
     echo =================
     echo ** VAULT SCRIPT START!
     echo =================
     echo
     action goto VAULT when The attendant bursts into the chamber
     if contains("$roomname", "Carousel Chamber") then goto VAULT.LOOK
     gosub automove vault
     pause 0.1
     if contains("$roomname", "Carousel Desk") then put out
     pause 0.001
     if contains("$roomobjs", "Carousel Square") then put go square
     pause 0.001
     if contains("$roomname", "Carousel Desk") then put out
     pause 0.001
     if contains("$roomobjs", "vault") then put go vault
     pause 0.001
     pause 0.001
     put go door
     pause 0.001
     pause 0.001
     pause 0.1
VAULT:
1.ARCH:
     matchre PAY.RENT rent
     matchre VAULT.GO escorts you
     matchre 2.ARCH blocks|someone|using|Sorry
     put go arch
     matchwait
2.ARCH:
     matchre PAY.RENT rent
     matchre VAULT.GO escorts you
     matchre 3.ARCH blocks|someone|using|Sorry
     put go second arch
     matchwait
3.ARCH:
     matchre PAY.RENT rent
     matchre VAULT.GO escorts you
     matchre NO.ARCH blocks|someone|using|Sorry
     put go third arch
     matchwait
NO.ARCH:
     echo NO ARCH AVAILABLE! WAITING.... 
     pause 10
     goto 1.ARCH

PAY.RENT:
     echo
     echo =================
     echo ** PAYING VAULT RENT
     echo =================
     echo
     pause 0.1
     gosub automove teller
     send with 8 gold
     pause 0.1
     pause 0.1
     pause 0.1
     gosub automove exchange
     pause 0.001
     pause 0.001
     put exchan all dok to kro
     pause 0.2
     pause 0.1
     pause 0.001
     put exchan all lir to kro
     pause 0.2
     pause 0.1
     pause 0.001
     if ("$zoneid" = "67") then gosub automove 138
     if ("$zoneid" = "116") then gosub automove 288
     if ("$zoneid" = "61") then gosub automove 169
     if ("$zoneid" = "47") then gosub automove 273
     if ("$zoneid" = "42") then gosub automove 28
     if ("$zoneid" = "30") then gosub automove 362
     if ("$zoneid" = "1") then gosub automove 188
     if ("$zoneid" = "99") then gosub automove 141
     if ("$zoneid" = "107") then gosub automove 219
     if ("$zoneid" = "90") then gosub automove 261
     if ("$zoneid" = "127") then gosub automove 532
     pause 0.001
     pause 0.001
     pause 0.001
     put pay 5000
     pause 0.1
     pause 0.1
     move out
     pause 0.001
     goto 1.ARCH

VAULT.GO:
     put pull lever
     pause 0.1
     pause 0.01
     pause 0.001
     pause 0.001
     send go door
     pause 0.1
     pause 0.01
     send open vault
     pause 0.1
     pause 0.01
     echo =========================
     echo ***   VAULT SCRIPT ACTIVE 
     echo *** TYPE "DONE" to LEAVE VAULT!
     echo =========================
VAULT.LOOK:
     send rummage vault
     pause 0.1
     pause 0.01
     pause 0.001
     send rumm on shelf
     pause 0.1
     pause 0.1
     pause 0.001
     send rumm on second shelf
     pause 0.2
     pause 0.001
     send rumm on hook
     pause 0.1
     pause 0.001
     send rumm drawer
     pause 0.2
     pause 0.001
     send rumm second drawer
     pause 0.1
     pause 0.1
     send rumm third drawer
     pause 0.2
     pause 0.1
     pause 0.1
     echo
     echo =========================
     echo ***   VAULT SCRIPT ACTIVE 
     echo *** TYPE DONE or done to LEAVE VAULT
     echo =========================
     echo
     put #parse VAULT
     matchre VAULT.LEAVE DONE
     matchre VAULT.LEAVE done
     matchwait 120
     goto VAULT.LOOK

VAULT.LEAVE:
     echo
     echo LEAVING VAULT!
     echo
     pause 0.1
     send close vault
     pause 0.2
     pause 0.1
     put go door
     pause 0.2
     pause 0.001
     put go arch
     pause 0.5
     pause 0.001
     move out
     pause 0.3
     pause 0.001
     put out
     pause 0.2
     pause 0.001
     pause 0.001
VAULT.DONE:
     echo
     echo *** DONE WITH VAULT SCRIPT!
     echo
     exit

AUTOMOVE:
     delay 0.0001
     var Destination $0
     var automovefailCounter 0
     if (!$standing) then gosub AUTOMOVE_STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     delay 0.0001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     put #goto %Destination
     matchwait 10
     if ($north) then put n
     if ($south) then put s
     if ($east) then put e
     if ($west) then put w
     if ($northeast) then put ne
     if ($northwest) then put nw
     if ($southwest) then put sw
     pause 0.5
     pause 0.3
     goto AUTOMOVE_GO
AUTOMOVE_STAND:
     pause 0.1
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait
AUTOMOVE_FAILED:
     evalmath automovefailCounter (automovefailCounter + 1)
     if (%automovefailCounter > 5) then goto AUTOMOVE_FAIL_BAIL
     send #mapper reset
     pause 0.5
     pause 0.1
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     exit
AUTOMOVE_RETURN:
     return