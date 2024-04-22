#### MOVEMENT INCLUDE
## CHANGELOG:
#              11 May, 2015 - Tulkas - added a stun match for AUTOMOVE_STAND
#              13 May, 2015 - ~PELIC - changed both MOVE and AUTOMOVE to retry three times then exit on movement errors.
#              04 Aug, 2015 - Shroom - Added Connie's Random Movement Subroutine 
#              22 Sep, 2022 - Shroom - Added Streamlined Automove/Movement Subs and fail retry triggers
####################################################################################
action (moving) var Moving 1 when Obvious (path|exits)|Roundtime
goto endfile
################################
# MOVEMENT ROUTINES
################################
AUTOMOVE:
     delay 0.00001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($hidden = 1) then gosub UNHIDE
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub RANDOMMOVE
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     delay 0.00001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchre AUTOMOVE_FAILED ^You don\'t seem
     put #goto %Destination
     matchwait 3
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 160
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     delay 0.00001
     if ($standing = 1) then goto AUTOMOVE_RETURN
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing
     send stand
     matchwait 20
     goto AUTOMOVE_STAND
AUTOMOVE_FAILED:
     delay 0.00001
     # put #script abort automapper
     pause 0.00001
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     if (%automovefailCounter > 1) then send #mapper reset
     pause 0.1
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub RANDOMMOVE
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     put #echo
     put #echo >Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
AUTOMOVE_RETURN:
     action (moving) off
     var automovefailCounter 0
     var randomloop 0
     delay 0.00001
     return
########################################################################
MOVE:
     delay 0.00001
     var Direction $0
     var movefailCounter 0
     var moveRetreat 0
     var randomloop 0
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RETRY ^\.\.\.wait|^Sorry\, you may only type|^Please wait\.|You are still stunned\.
     matchre MOVE_RETURN_CHECK ^You can't (swim|move|climb) in that direction\.
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
     matchre MOVE_STAND ^You don\'t seem
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE_FAIL_BAIL ^You can't go there
     matchre MOVE_FAILED ^Noticing your attempt
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait 8
     goto MOVE_RETURN
MOVE_RETRY:
     pause
     goto MOVE_RESUME
MOVE_STAND:
     delay 0.00001
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_STAND ^You don\'t
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait 8
     goto MOVE_STAND
MOVE_RETREAT:
     delay 0.00001
     math moveRetreat add 1
     if (%moveRetreat > 4) then
          {
               send search
               pause 0.5
               pause 0.3
               var moveRetreat 0
          }
     if ($invisible = 1) then gosub STOP_INVIS
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You stop advancing
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait 10
     goto MOVE_RETREAT
MOVE_DIG:
     delay 0.00001
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait 10
     goto MOVE_DIG
MOVE_DIG_STAND:
     delay 0.00001
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait 10
     goto MOVE_DIG_STAND
MOVE_FAILED:
     var moved 0
     math movefailCounter add 1
     if (%movefailCounter > 3) then goto MOVE_FAIL_BAIL
     pause 0.5
     put look
     delay 0.4
     goto MOVE_RESUME
MOVE_FAIL_BAIL:
     put #echo
     # put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     return
MOVE_RETURN_CHECK:
     put look
     delay 0.001
MOVE_RETURN:
     var moved 1
     var randomloop 0
     delay 0.00001
     unvar moveloop
     unvar movefailCounter
     return
FIND_MYSELF:
MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
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
     if matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") then
          {
               gosub MOVE climb stair
               return
          }
     if matchre("$roomobjs $roomdesc","\bsteps\b") then
          {
               gosub MOVE climb step
               return
          }
     if matchre("$roomobjs $roomdesc","\b(exit|curtain|arch|door|gate|hole|hatch|trapdoor|path|animal trail|tunnel|portal)\b") then
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
     delay 0.2
     if (%moveloop > 6) then
          {
               echo *** Cannot find a room exit!! Stupid fog!
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               return
          }
     goto moveRandomDirection_2
###################################################################################
### RANDOM MOVEMENT ENGINE BY SHROOM
### GO IN RANDOM DIRECTIONS AND DON'T BACKTRACK FROM LAST MOVED DIRECTION IF POSSIBLE
### IF IT CANNOT FIND A DIRECTION, WILL TAKE ANY POSSIBLE EXIT IT CAN SEE
### WILL MOVE IN RANDOM DIRECTIONS IF IT CANNOT SEE ANY ROOM EXITS (PITCH BLACK)
###################################################################################
RANDOMMOVE:
     delay 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop = 1) then gosub DARK_CHECK_1
     if !($standing) then gosub STAND
     if matchre("%randomloop", "\b(20|40)\b") then
          {
               echo **** CANNOT FIND A ROOM EXIT??!
               put look
               pause 0.4
               gosub FERRY_CHECK
          }
     if (%randomloop > 15) then
          {
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               var lastmoved null
               gosub TRUE_RANDOM_2
          }
     ### TRY A LIGHT SOURCE IF ROOM IS BLACK AND THEN TRY RANDOM DIRECTIONS
     if (%randomloop > 30) then
          {
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               var lastmoved null
               gosub TRUE_RANDOM_2
          }
     if (%randomloop > 50) then
          {
               echo ################################
               echo *** Cannot find a room exit??? Stupid fog???
               echo *** ZONE: $zoneid | ROOM: $roomid
               echo *** SEND THE ROOM DESCRIPTION/EXITS WHEN YOU TYPE LOOK
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               echo *** SHOULD AUTO-RECOVER IF YOU CAN FIND AN EXIT
               echo ###############################
               pause 0.5
               gosub FERRY_CHECK
               pause 0.5
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               var lastmoved null
               var randomloop 0
               return
          }
     if matchre("$roomname", "\[Skeletal Claw\]") then
          {
               echo ##################################
               echo # IN THE SKELETAL CLAW! OH NO!!!
               echo # WE MIGHT DIE IF SOMEONE DOESN'T CAST UNCURSE ON IT!
               echo # ATTEMPTING TO ESCAPE.............
               echo ##################################
               gosub MOVE out
               return
          }
     if (matchre("$roomname", "Deadman's Confide, Beach") || matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname","Smavold's Toggery") then
          {
               gosub MOVE go door
               return
          }
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then
          {
               gosub MOVE climb pine branches
               return
          }
     if matchre("$roomname","Darkling Wood, Pine Tree") then
          {
               gosub MOVE climb white pine
               return
          }
     if matchre("$roomname","The Sewers, Beneath the Grate") then
     {
          gosub MOVE go grate
          return
     }
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     if matchre("$roomobjs","underside of the Bridge of Rooks") then
          {
               gosub MOVE climb bridge
               return
          }
     if (%randomloop > 10) then
          {
          if matchre("$roomobjs","stone wall") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","narrow ledge") then
               {
                    gosub MOVE climb ledge
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","craggy niche") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","double door") then
               {
                    gosub MOVE go door
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","staircase") then
               {
                    gosub MOVE climb stair
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","the exit") then
               {
                    gosub MOVE go exit
               }
          if matchre("$roomobjs","\bdoor\b") then
               {
                    gosub MOVE go door
               }
          }
     if (%moved = 1) then return
     random 1 11
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if (%moved = 1) then return
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if (%moved = 1) then return
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%moved = 1) then return
     ### IF DONE 13 LOOPS WITH NO MATCH THEN CHECK FOR ANY OBVIOUS ROOM EXIT (AS LONG AS THAT WASN'T OUR LAST MOVE)
     if (%randomloop > 13) then
          {
               if ($out) then gosub MOVE out
               if (%moved = 1) then return
               if (($north) && ("%lastmoved" != "south")) then gosub MOVE north
               if (($south) && ("%lastmoved" != "north")) then gosub MOVE south
               if (%moved = 1) then return
               if (($east) && ("%lastmoved" != "west")) then gosub MOVE east
               if (($west) && ("%lastmoved" != "east")) then gosub MOVE west
               if (%moved = 1) then return
               if (($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
               if (($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
               if (%moved = 1) then return
               if (($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
               if (($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","narrow hole") && ("%lastmoved" != "go hole")) then gosub MOVE go hole
               if (matchre("$roomobjs $roomdesc","\bcrevice") && ("%lastmoved" != "go crevice")) then gosub MOVE go crevice
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bgate\b") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (matchre("$roomobjs $roomdesc","\barch\b") && ("%lastmoved" != "go arch")) then gosub MOVE go arch
               if (%moved = 1) then return
               if (matchre("$roomexits","\bforward") && ("%lastmoved" != "forward")) then gosub MOVE forward
               if (matchre("$roomexits","\baft\b") && ("%lastmoved" != "aft")) then gosub MOVE aft
               if (%moved = 1) then return
               if (matchre("$roomexits","\bstarboard") && ("%lastmoved" != "starboard")) then gosub MOVE starboard
               if (matchre("$roomexits","\bport\b") && ("%lastmoved" != "port")) then gosub MOVE port
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit")) then gosub MOVE go exit
               if (matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path")) then gosub MOVE go path
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\btrapdoor\b") && ("%lastmoved" != "go trapdoor")) then gosub MOVE go trapdoor
               if (matchre("$roomobjs $roomdesc","\bcurtain\b") && ("%lastmoved" != "go curtain")) then gosub MOVE go curtain
               if (matchre("$roomobjs $roomdesc","\bdoor") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (matchre("$roomobjs $roomdesc","double door") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bportal\b") && ("%lastmoved" != "go portal")) then gosub MOVE go portal
               if (matchre("$roomobjs $roomdesc","\btunnel\b") && ("%lastmoved" != "go tunnel")) then gosub MOVE go tunnel
               if (matchre("$roomobjs $roomdesc","\bjagged crack\b") && ("%lastmoved" != "go crack")) then gosub MOVE go crack
               if (matchre("$roomobjs $roomdesc","\bthe street\b") && ("%lastmoved" != "go street")) then gosub MOVE go street
               if (matchre("$roomobjs $roomdesc","(?i)\ba gate\b") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair")) then gosub MOVE climb stair
               if (matchre("$roomobjs $roomdesc","\bsteps\b") && ("%lastmoved" != "climb step")) then gosub MOVE climb step
               if (matchre("$roomobjs $roomdesc","\btrail\b") && ("%lastmoved" != "go trail")) then gosub MOVE go trail
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bpanel\b") && ("%lastmoved" != "go panel")) then gosub MOVE go panel
               if (matchre("$roomobjs $roomdesc","\btent flap\b") && ("%lastmoved" != "go flap")) then gosub MOVE go flap
               if (matchre("$roomobjs $roomdesc","\bnarrow track\b") && ("%lastmoved" != "go track")) then gosub MOVE go track
               if (matchre("$roomobjs $roomdesc","\blava field\b") && ("%lastmoved" != "go lava field")) then gosub MOVE go lava field
          }
     if (%moved = 0) then goto RANDOMMOVE
     # if ($roomid = 0) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
####################################################################################

endfile: