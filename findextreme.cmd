#######################################
# FIND THE EXTREME SHOP IN HE FEST
#######################################
pause 0.1
     if matchre("$righthand $lefthand", "(bow|crossbow|sling)") then send unload
     pause 0.2
     pause 0.1
     pause 0.1
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
PLAY:
     if !matchre("$roomobjs", "\b((broken-down|ruined|decaying|decrepit|dingy|neglected|rickety|ramshackle|run-down|tumble-down) (stone|wooden)? ?(arch|archway|cabana|cabin|curtain|door|doorway|entrance|entryway|house|hovel|lean-to|shack|shed|shelter|stall|wagon|opening))\b") then goto FIND_SHOP
     var XtremeShop $roomid
     var door $4
     pause 0.1
     pause 0.2
ENTER:
     pause 0.2
     matchre NOPE ^A voice inside calls out\, \"Nope\.
     #"
     matchre NOPE ^Bonk\!
     matchre INSIDE The Extreme Shop
     put go %door
     matchwait
     
INSIDE:
     pause 0.5
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
     pause .1
     echo =============================
     echo ** FOUND THE EXTREME SHOP!!
     echo ** BUY SOMETHING!!
     echo =============================
     exit

FIND_SHOP:
     math searchloop add 1
     echo
     echo *** No Extreme Shop found! Searching...
     echo
     gosub SHOP_SEARCH 1
     gosub SHOP_SEARCH 2
     gosub SHOP_SEARCH 3
     gosub SHOP_SEARCH 4
     gosub SHOP_SEARCH 5
     gosub SHOP_SEARCH 6
     gosub SHOP_SEARCH 8
     gosub SHOP_SEARCH 9
     gosub SHOP_SEARCH 10
     gosub SHOP_SEARCH 11
     gosub SHOP_SEARCH 12
     gosub SHOP_SEARCH 13
     gosub SHOP_SEARCH 14
     gosub SHOP_SEARCH 15
     gosub SHOP_SEARCH 16
     gosub SHOP_SEARCH 17
     gosub SHOP_SEARCH 18
     gosub SHOP_SEARCH 19
     gosub SHOP_SEARCH 20
     gosub SHOP_SEARCH 101
     gosub SHOP_SEARCH 102
     gosub SHOP_SEARCH 103
     gosub SHOP_SEARCH 104
     gosub SHOP_SEARCH 105
     gosub SHOP_SEARCH 21
     gosub SHOP_SEARCH 22
     gosub SHOP_SEARCH 23
     gosub SHOP_SEARCH 24
     gosub SHOP_SEARCH 25
     gosub SHOP_SEARCH 26
     gosub SHOP_SEARCH 27
     gosub SHOP_SEARCH 28
     gosub SHOP_SEARCH 29
     gosub SHOP_SEARCH 30
     gosub SHOP_SEARCH 31
     gosub SHOP_SEARCH 32
     gosub SHOP_SEARCH 33
     gosub SHOP_SEARCH 34
     gosub SHOP_SEARCH 35
     gosub SHOP_SEARCH 36
     gosub SHOP_SEARCH 41
     gosub SHOP_SEARCH 42
     gosub SHOP_SEARCH 43
     gosub SHOP_SEARCH 44
     gosub SHOP_SEARCH 45
     gosub SHOP_SEARCH 46
     gosub SHOP_SEARCH 81
     gosub SHOP_SEARCH 47
     gosub SHOP_SEARCH 48
     gosub SHOP_SEARCH 49
     gosub SHOP_SEARCH 50
     gosub SHOP_SEARCH 51
     gosub SHOP_SEARCH 52
     gosub SHOP_SEARCH 73
     gosub SHOP_SEARCH 74
     gosub SHOP_SEARCH 75
     gosub SHOP_SEARCH 76
     gosub SHOP_SEARCH 78
     gosub SHOP_SEARCH 53
     gosub SHOP_SEARCH 54
     gosub SHOP_SEARCH 55
     gosub SHOP_SEARCH 56
     gosub SHOP_SEARCH 57
     gosub SHOP_SEARCH 58
     gosub SHOP_SEARCH 130
     gosub SHOP_SEARCH 59
     gosub SHOP_SEARCH 60
     gosub SHOP_SEARCH 61
     gosub SHOP_SEARCH 62
     gosub SHOP_SEARCH 63
     gosub SHOP_SEARCH 64
     gosub SHOP_SEARCH 65
     gosub SHOP_SEARCH 66
     if (%searchloop > 4) then goto QUIT
     echo =====================================
     echo *** NO EXTREME SHOP FOUND!!! 
     echo *** Maybe it moved.. checking again..
     echo =====================================
     pause 3
     goto FIND_SHOP

SHOP_SEARCH:
     var room $0
     pause 0.001
     echo goto %room
     gosub automove %room
     echo Scanning........
     if matchre("$roomobjs", "\b((broken-down|ruined|decaying|decrepit|dingy|neglected|rickety|ramshackle|run-down|tumble-down) (stone|wooden)? ?(arch|archway|cabana|cabin|door|doorway|entryway|house|hovel|lean-to|shack|shed|shelter|wagon))\b") then goto FOUND_SHOP
     return

FOUND_SHOP:
     pause 0.1
     echo ======================
     echo ** FOUND THE EXTREME SHOP! 
     echo ** RoomID: $roomid
     echo ======================
     put #echo >Log Lime *** Found Extreme Shop - Zone: $zoneid Room: $roomid
     goto PLAY
     
NOPE:
     echo ==================================
     echo ** UNABLE TO ENTER EXTREME SHOP
     echo ** SOMEONE ELSE MUST ENTER FIRST
     echo ** ECHOING TO CHATTER IN 5
     echo ==================================
     pause 5
     put chatter Extreme Shop Spotted in HE - Roomid: $roomid - [$roomname]
     pause 0.5
     
     pause 0.5
     exit
####################################################
##### STANDING SUB
STAND:
     delay 0.0001
     var LOCATION STAND_1
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
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



MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
     var randomloop 0
     var moved 1
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RESUME ^\.\.\.wait|^Sorry\,|^Please wait\.
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
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE_FAILED ^Noticing your attempt
     matchre MOVE_FAILED ^You can't go there
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait
MOVE_STAND:
     pause 0.1
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
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
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You stop advancing
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait
MOVE_DIG:
     pause 0.1
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait
MOVE_DIG_STAND:
     pause 0.1
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait
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
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     return
MOVE_RETURN:
     if matchre("$roomobjs","corn maze pass") then gosub verb stow pass
     if matchre("$roomobjs","passes") then gosub verb stow pass
     return
     
AUTOMOVE:
     delay 0.0001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub RANDOMMOVE
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     put #goto %Destination
     matchwait 5
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 8
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     pause 0.001
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait
AUTOMOVE_FAILED:
     pause 0.001
     # put #script abort automapper
     pause 0.2
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     pause 0.1
     put look
     pause 0.5
     pause 0.2
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub RANDOMMOVE
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     var moved 0
     put #echo
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     return
AUTOMOVE_RETURN:
     action (moving) off
     pause 0.001
     if matchre("$roomobjs","corn maze pass") then gosub verb stow pass
     if matchre("$roomobjs","passes") then gosub verb stow pass
     pause 0.001
     return

MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
     if (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then gosub TRUE_RANDOM
     if (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then gosub TRUE_RANDOM
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
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomobjs","\b(arch|door|gate|hole|hatch|trapdoor|path|animal trail)\b") then
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
     if (%moveloop > 4) then
          {
               echo *** Cannot find a room exit!! Stupid fog!
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               gosub RANDOMMOVE
               return
          }
     goto moveRandomDirection_2

RANDOMMOVE:
     pause 0.0001
     var moved 0
     var moving 0
     math randomloop add 1
     if (%randomloop > 4) then 
          {
               var lastmoved null
               var randomloop 0
          }
     random 1 16
     if ((%r = 1) && ($north) && ("%lastmoved" != "s")) then gosub MOVE n
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "sw")) then gosub MOVE ne
     if ((%r = 3) && ($east) && ("%lastmoved" != "w")) then gosub MOVE e
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "se")) then gosub MOVE nw
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "nw")) then gosub MOVE se
     if ((%r = 6) && ($south) && ("%lastmoved" != "n")) then gosub MOVE s
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "ne")) then gosub MOVE sw
     if ((%r = 8) && ($west) && ("%lastmoved" != "e")) then gosub MOVE w
     if (%r = 9) && ($out) then gosub MOVE out
     if (%r = 10) && matchre("$roomobjs","\bdoor\b") && ("%lastmoved" != "go door") then gosub MOVE go door
     if (%r = 11) && matchre("$roomobjs","\bgate\b") && ("%lastmoved" != "go gate") then gosub MOVE go gate
     if (%r = 12) && matchre("$roomobjs","\barch\b") && ("%lastmoved" != "go arch") then gosub MOVE go arch
     if (%r = 13) && matchre("$roomobjs","\bportal\b") && ("%lastmoved" != "go portal") then gosub MOVE go portal
     if (%r = 14) && matchre("$roomobjs","\btunnel\b") && ("%lastmoved" != "go tunnel") then gosub MOVE go tunnel
     if (%r = 15) && matchre("$roomobjs","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair") then gosub MOVE climb stair
     if (%r = 16) && matchre("$roomobjs","\bpanel\b") && ("%lastmoved" != "go panel") then gosub MOVE go panel
     if (%moved = 0) && (%randomloop < 4) then goto RANDOMMOVE
     if ($roomid = 0) && (%randomloop < 18) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
#### HEALTH CHECKING
HEALTH_CHECK:
     delay 0.0001
     put #var needHealing 0
     delay 0.5
     matchre HEALTH_GOOD ^You have no significant injuries\.
     matchre HEALTH_BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH_CHECK
HEALTH_BAD:
     delay 0.0001
     put #var needHealing 1
     delay 0.5
     return
HEALTH_GOOD:
     delay 0.0001
     put #queue clear
     put #var needHealing 0
     delay 0.5
     return
#### RETURNS
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return