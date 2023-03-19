######################################
### EMPATH SHOCK QUEST - By Shroom
### Requires: Updated Genie Maps
### Genie .travel Script and ExpTracker plugin
### Must have at least 50+ Athletics
######################################

action instant put look when ^YOU HAVE BEEN IDLE
put #config usertimeout 20000
put #script abort all except empathshock
if ($Athletics.Ranks < 70) then goto ABORT
echo ====================
echo ** BEGINNING EMPATH SHOCK QUEST
echo ** NOTE THIS CAN TAKE ~6+ HOURS TO COMPLETE!!
echo ====================
if_1 then goto %1
pause 3
START:
if ($zoneid != 127) then
     {
          put .travel boar
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid != 127) then goto START
if ($roomid != 628) then gosub automove nadigo
if ($roomid != 628) then gosub automove nadigo
pause 0.1
SHOCK:
put ask nadigo about shock
pause 0.5
matchre CANCEL_TASK I cannot start you on the shock quest until you have finished your other task for me
matchre FOREST_GO ^Nadigo says\, \"It\'s strung on a medallion\, don\'t take it off again until you\'re ready for me to germinate it for you
put ask nadigo about shock
matchwait 80
goto FOREST_GO

CANCEL_TASK:
put ask nadigo about cancel
pause
goto SHOCK

FOREST_GO:
QUEST:
pause 0.5
put .travel wolf
waitforre ^YOU ARRIVED\!
if ($zoneid = 1) then gosub automove w gate
gosub automove 415

SEED.1:
if ($zoneid = 1) then gosub automove w gate
if ($zoneid != 4) then
     {
          put .travel wolf
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid != 4) then goto SEED.1
var last SEED.1
if ($roomid != 415) then gosub automove 415
if ($roomid != 415) then gosub automove 415
matchre SEED.2 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED1 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED1:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
put .travel alfren
waitforre ^YOU ARRIVED\!
gosub automove 5

SEED.2:
if ($zoneid != 60) then 
     {
          put .travel alfren
          waitforre ^YOU ARRIVED
     }
if ($zoneid != 60) then goto SEED.2
var last SEED.2
if ($roomid != 5) then gosub automove 5
if ($roomid != 5) then gosub automove 5
if ($roomid != 5) then gosub automove 5
matchre SEED.3 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED2 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED2:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
put .travel shard
waitforre ^YOU ARRIVED\!
gosub automove east
if ($zoneid = 67) then gosub automove east
gosub automove 125

SEED.3:
if !matchre("$zoneid", "(67|66)") then 
     {
          put .travel shard
          waitforre ^YOU ARRIVED
     }
if ($zoneid = 67) then gosub automove east
if ($zoneid != 66) then goto SEED.3
var last SEED.3
if ($roomid != 125) then gosub automove 125
if ($roomid != 125) then gosub automove 125
matchre SEED.4 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED3 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED3:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
gosub automove s gate
if ($zoneid = 67) then gosub automove east
if ($zoneid = 66) then gosub automove s gate
gosub automove 62
gosub automove 65
gosub automove 71

SEED.4:
if !matchre("$zoneid", "(67|66|68)") then 
     {
          put .travel shard
          waitforre ^YOU ARRIVED
     }
if ($zoneid = 67) then gosub automove east
if ($zoneid = 66) then gosub automove 3
var last SEED.4
if ($zoneid != 68) then goto SEED.4
if ($roomid != 71) then gosub automove 71
if ($roomid != 71) then gosub automove 71
matchre SEED.5 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED4 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED4:
if ($zoneid = 68) then 
{
     gosub automove 68
     gosub automove 65
     gosub automove e gate
}
pause 0.2
if ($zoneid = 68) then gosub automove e gate
if ($zoneid = 66) then gosub automove 260
pause 0.2
SEED4WAIT:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
put .travel boar
waitforre ^YOU ARRIVED\!
gosub automove hib
if ($zoneid != 126) then gosub automove hib
gosub automove 53

SEED.5:
if !matchre("$zoneid", "(127|126|116)") then 
     {
          put .travel hib
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid = 116) then gosub automove boar
if ($zoneid = 127) then gosub automove hib
if ($zoneid != 126) then goto SEED.5
var last SEED.5
if ($roomid != 53) then gosub automove 53
if ($roomid != 53) then gosub automove 53
matchre SEED.6 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED5 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED5:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE

SEED.6:
if !matchre("$zoneid", "(127|126|116)") then 
     {
          put .travel hib
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid = 116) then gosub automove boar
if ($zoneid = 127) then gosub automove hib
var last SEED.6
if ($zoneid != 126) then goto SEED.6
if ($roomid != 13) then gosub automove 13
if ($roomid != 13) then gosub automove 13
matchre SEED.7 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre SEED6 As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 20
SEED6:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
gosub automove 172

SEED.7:
var last SEED.7
if !matchre("$zoneid", "(127|126)") then 
     {
          put .travel boar
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid = 126) then gosub automove boar
if ($zoneid != 127) then goto SEED.7
if ($roomid != 19) then gosub automove 19
if ($roomid != 19) then gosub automove 19
matchre SEED.8 Bewildering alien visions flash through your mind\'s eye\, and you sense that the nascent consciousness growing within the seed is already familiar with this area\.
matchre SEED_PAUSE Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre QUEST_COMPLETE As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 5
SEED7:
if ($hidden = 0) then put hide
echo *** WAITING 30+ MINUTES FOR THE NEXT MEDITATION
gosub WAITING
if ($hidden) then gosub UNHIDE
gosub automove 172


SEED.8:
var last SEED.8
if !matchre("$zoneid", "127") then 
     {
          put .travel boar
          waitforre ^YOU ARRIVED\!
     }
if ($zoneid != 127) then goto SEED.8
if ($roomid != 172) then gosub automove 172
if ($roomid != 172) then gosub automove 172
matchre SEED_PAUSE ^Bewildering images briefly flash through your mind\'s eye|As the confusing sensations subside\, you sense that the seed is still processing the energy 
matchre QUEST_CHECK As the strange sensations subside\, you feel suddenly fatigued and unsteady\.
send meditate seed
matchwait 5

WAITING:
var waitloop 0
WAITING_1:
math waitloop add 1
echo 
echo **** Waiting for seed cooldown
echo
pause 100
put look
pause
if (%waitloop > 38) then return
goto WAITING

QCHECK:
QUEST_CHECK:
gosub automove nadigo
pause 0.7
matchre QUEST_COMPLETE you sense that your bond with the vela\'tohr seed is complete
matchre QUEST_COMPLETE successfully meditated on the seed 8 times so far
put meditate seed
matchwait 7
goto QUEST_RESTART

QUEST_RESTART:
echo =====================
echo *** DID WE MISS ONE?
echo *** RESTARTING TO RECHECK SPOTS...
echo =====================
goto SEED.1

QUEST_COMPLETE:
pause 0.1
echo =====================
echo *** EMPATH SHOCK QUEST COMPLETE!!!
echo *** GOING TO TURN IN 
echo =====================
gosub automove nadigo
pause 0.2
send remove seed
pause 0.5
pause 0.2
if ($roomid != 628) then gosub automove nadigo
send give seed to nadigo
put #echo >Log Lime *** COMPLETED EMPATH SHOCK QUEST! WAY TO GO! ***
pause 3
waitforre As you swim|Nadigo smiles at you
echo =======================
echo *** EMPATH SHOCK QUEST COMPLETE!!!
echo =======================
exit

SEED_PAUSE:
pause 0.1
echo ==============
echo * USED SEED TOO RECENTLY - PAUSING
echo ==============
if ($hidden = 0) then put hide
put look
pause 100
goto %last

ABORT:
echo =============================
echo * OH NO! NOT ENOUGH ATHLETICS 
echo * TO MAKE IT ALL THE WAY TO BOAR CLAN!
echo * GO PRACTICE CLIMBING!!!!!!
echo =============================
pause 
exit















#########################
AUTOMOVE:
     delay 0.0001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($hidden = 1) then send unhide
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub moveRandomDirection
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.0001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchre AUTOMOVE_FAILED ^You don\'t seem
     put #goto %Destination
     matchwait 4
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 45
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     pause 0.1
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait 20
     goto AUTOMOVE_STAND
AUTOMOVE_FAILED:
     pause 0.1
     # put #script abort automapper
     pause 0.2
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     send #mapper reset
     pause 0.1
     put look
     pause 0.5
     pause 0.2
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub moveRandomDirection
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     put #echo
     put #echo >Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     return
AUTOMOVE_RETURN:
     action (moving) off
     pause 0.5
     pause 0.2
     return
################################
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
     var randomloop 0
     var moved 1
     var lastmoved %Direction
MOVE_RESUME:
     pause 0.1
     matchre MOVE_RETRY ^\.\.\.wait|^Sorry\, you may only type|^Please wait\.|You are still stunned\.
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
     matchre MOVE_FAILED ^Noticing your attempt
     matchre MOVE_FAILED ^You can't go there
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait 15
     goto MOVE_RETURN
MOVE_RETRY:
     pause
     goto MOVE_RESUME
MOVE_STAND:
     pause 0.1
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_STAND ^You don\'t
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait 15
     goto MOVE_STAND
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
     matchwait 10
     goto MOVE_RETREAT
MOVE_DIG:
     pause 0.1
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait 10
     goto MOVE_DIG
MOVE_DIG_STAND:
     pause 0.1
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
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
     pause 0.4
     goto MOVE_RESUME
MOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     return
MOVE_RETURN:
     return
FIND_MYSELF:
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
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     if matchre("$roomobjs","\b(stairs|staircase|stairway)\b") then
          {
               gosub MOVE climb stair
               return
          }
     if matchre("$roomobjs","\bsteps\b") then
          {
               gosub MOVE climb step
               return
          }
     if matchre("$roomobjs","\b(arch|door|gate|hole|hatch|trapdoor|path|animal trail|tunnel|portal)\b") then
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
     if (%moveloop > 5) then
          {
               echo *** Cannot find a room exit!! Stupid fog!
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               # gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM
               return
          }
     goto moveRandomDirection_2
### GO IN RANDOM DIRECTIONS AND DON'T BACKTRACK FROM LAST MOVED DIRECTION IF POSSIBLE
RANDOMMOVE:
     pause 0.001
     var moved 0
     var NPC.count 0
     math randomloop add 1
     if (%randomloop > 40) then
          {
               var lastmoved null
               var randomloop 0
          }
     random 1 20
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%r = 12) && matchre("$roomobjs","\bdoor\b") && ("%lastmoved" != "go door") then gosub MOVE go door
     if (%r = 13) && matchre("$roomobjs","\bgate\b") && ("%lastmoved" != "go gate") then gosub MOVE go gate
     if (%r = 14) && matchre("$roomobjs","\barch\b") && ("%lastmoved" != "go arch") then gosub MOVE go arch
     if (%r = 15) && matchre("$roomobjs","\bportal\b") && ("%lastmoved" != "go portal") then gosub MOVE go portal
     if (%r = 16) && matchre("$roomobjs","\btunnel\b") && ("%lastmoved" != "go tunnel") then gosub MOVE go tunnel
     if (%r = 17) && matchre("$roomobjs","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair") then gosub MOVE climb stair
     if (%r = 18) && matchre("$roomobjs","\bsteps\b") && ("%lastmoved" != "climb step") then gosub MOVE climb step
     if (%r = 19) && matchre("$roomobjs","\bpanel\b") && ("%lastmoved" != "go panel") then gosub MOVE go panel
     if (%r = 20) && matchre("$roomobjs","\bnarrow track\b") && ("%lastmoved" != "go track") then gosub MOVE go track
     if (%moved = 0) then goto RANDOMMOVE
     return
TRUE_RANDOM:
     pause 0.001
     var moved 0
     math randomloop add 1
     if (%randomloop > 12) then
          {
               var lastmoved null
               var randomloop 0
          }
     random 1 16
     if (%r = 1) then gosub MOVE n
     if (%r = 2) then gosub MOVE ne
     if (%r = 3) then gosub MOVE e
     if (%r = 4) then gosub MOVE nw
     if (%r = 5) then gosub MOVE se
     if (%r = 6) then gosub MOVE s
     if (%r = 7) then gosub MOVE sw
     if (%r = 8) then gosub MOVE w
     if (%r = 9) then gosub MOVE out
     if (%r = 10) then gosub MOVE go open
     if (%r = 11) then gosub MOVE go door
     if (%r = 12) then gosub MOVE go path
     if (%r = 13) then gosub MOVE climb stair
     if (%r = 14) then gosub MOVE climb step
     if (%r = 15) then gosub MOVE go panel
     if (%r = 16) then gosub MOVE go arch
     return 
     
UNHIDE:
     pause 0.0001
     if ($standing = 0) then gosub STAND
     if ($hidden = 0) then return
     var LOCATION UNHIDE_1
     UNHIDE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are not hidden\!
     matchre RETURN ^You come out of hiding\.
     send unhide
     matchwait 20
     return
STAND:
     delay 0.0001
     var LOCATION STAND_1
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre WAIT ^The weight of all your possessions prevents you from standing\.
     matchre WAIT ^You are overburdened and cannot manage to stand\.
     matchre WAIT ^You\'re unconscious\!
     #matchre EXIT_DEATH ^You are a ghost\!
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STAND_RETURN ^You stand (?:back )?up\.
     matchre STAND_RETURN ^You stand up in the water
     matchre STAND_RETURN ^You are already standing\.
     matchre STAND_RETURN ^As you stand
     send stand
     matchwait 20
     STAND_RETURN:
     pause 0.1
     pause 0.1
     if ($standing = 0) then goto STAND
     return
WAIT:
     delay 0.0001
     pause 0.1
     if ($standing = 0) then gosub STAND
     goto %LOCATION
WEBBED:
     delay 0.0001
     if ($webbed) then waiteval (!$webbed)
     if ($standing = 0) then gosub STAND
     goto %LOCATION
IMMOBILE:
     delay 0.0001
     if contains("$prompt" , "I") then pause 20
     if ($standing = 0) then gosub STAND
     goto %LOCATION
STUNNED:
     delay 0.0001
     if ($stunned) then waiteval (!$stunned)
     if ($standing = 0) then gosub STAND
     goto %LOCATION
CALMED:
     delay 5
     if ($stunned) then waiteval (!$stunned)
     if ($standing = 0) then gosub STAND
     goto %LOCATION
RETURN:
     delay 0.3
     return