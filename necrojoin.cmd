#
# AUTO-JOIN THE NECRO GUILD SCRIPT
# BY SHROOM - FOR GENIE4
# 
# FOR NOOBS - ASSUMES YOU ARE COMMONER!
# START IN CROSSINGS OR AT NORTH GATE OR IN MONASTERY
#

var Complete 0
action (moving) var Moving 1 when Obvious (path|exits)|Roundtime
action instant goto FINISH when ^Your hands are bound together and you are ushered through the corridors rather roughly|Row upon row of volumes and tomes line several darkly stained cedar shelves

START:
echo
echo ######################
echo # AUTO-JOINING NECRO GUILD!
echo ######################
echo
if ("$zoneid" = "1") then gosub AUTOMOVE N gate
if ("$zoneid" = "1") then gosub AUTOMOVE N gate

if matchre("$roomname", "Side Yard") then goto PAINT.1
if matchre("$roomname", "Tower Hall") then goto WINDOWS.1
if matchre("$roomname", "Private Cemetary") then goto CEMETARY.1

if matchre("$roomname", "(Deep Forest|Monastery Grounds)") then goto IN.MONASTERY

if ("$zoneid" = "6") then gosub AUTOMOVE 6
if (("$zoneid" = "6") && ("$roomid" != "6")) then gosub AUTOMOVE 6
if ("$zoneid" != "6") then exit
pause 0.001
pause 0.3
send ask monk about job
pause 0.5
pause 0.2
send ask monk about job
pause 0.5
pause 0.2

IN.MONASTERY:
pause 0.1
gosub AUTOMOVE adano
pause 0.1

TASK:
action instant goto TASK.DONE when You think that you should go back to talk to Abbot Adano for your pay\.|See Abbot Adano for your pay\.|Just ask him about the job and he'll give you your pay
pause 0.00001
if ("$roomid" != "176") then gosub AUTOMOVE 176
pause 0.00001
matchre TASK.PAUSE It'll be a little while before I have something else for you|harrassing me about another job will not get you one any faster
matchre PLANTS tend to the vegetables in the greenhouse|Turn each of the plants so that they're getting sufficient sun
matchre BEANS shell some beans in the greenhouse|To complete this job, you need to open a number of bean pods for dinner
matchre WASH wash some clothes outside the greenhouse|To complete this job, you need to wash some soiled clothing outside the greenhouse
matchre WATER draw water from the pond outside|you need to draw some water from the pond out the south gate of the monastery
matchre CLEAN sweep the cobblestone paths|clean the cobblestone paths
matchre GATHER gather a few herbs in the nearby forest|gather some herbs from the forest nearby
matchre GRAVEYARD clean and weed the graveyard|pull weeds and clean out the private graveyard
matchre WINDOWS wash some dusty windows|wash a few of the windows in the monastery
matchre PAINT paint the siding of a newly\-made building|paint the siding of our new winepress building
matchre SCRIBE transcribe a few texts in the library|copy some pages from a tome for us by scribing them onto new paper
matchre FIX fix the wall separating the cow's pasture from the lawn|repair the wall separating the cow pasture from the green
matchre APPLE pick some apples
matchre RUG dirt out of a rug from one of the hallways
matchre EQUIPMENT need to clean some of the
matchre WOOD chop some firewood
matchre GRAPE prepare some bunches of grapes
matchre KITCHEN repair some broken floor tiles in the kitchen|repair some cracked stone tiles in the monastery kitchen
matchre STEPS clean the steps|clean off the steps leading into
send ask adano about job
matchwait 20
echo
echo ** ERROR! UNKNOWN TASK???
echo
goto TASK

TASK.PAUSE:
echo
echo * TASKS STILL ON COOLDOWN
echo * PAUSING TO WAIT FOR NEW TASK
echo
echo * IT COULD TAKE A WHILE BETWEEN TASKS (~10 mins)
echo * YOU CAN JUST STOP THE SCRIPT, GO TRAIN AND RESTART LATER
echo
pause 90
goto TASK

PLANTS:
pause 0.001
gosub AUTOMOVE greenhouse
pause 0.1
PLANTS.1:
pause 0.001
send turn plant
pause 0.8
pause 0.5
goto PLANTS.1

BEANS:
pause 0.001
gosub AUTOMOVE greenhouse
pause 0.1
BEANS.1:
pause 0.001
send open bean
pause 0.8
pause 0.5
goto BEANS.1

WOOD:
pause 0.001
gosub AUTOMOVE 174
pause 0.5
WOOD.1:
pause 0.001
send cut fire
pause 0.8
pause 0.5
goto WOOD.1

WASH:
pause 0.001
gosub AUTOMOVE 181
pause 0.1
WASH.1:
pause 0.001
send wash clothes
pause 0.8
pause 0.5
goto WASH.1

APPLE:
pause 0.001
gosub AUTOMOVE 173
pause 0.5
APPLE.1:
pause 0.001
send get apple
pause 0.8
pause 0.5
goto APPLE.1

CLEAN:
pause 0.001
gosub AUTOMOVE 181
pause 0.1
CLEAN.1:
pause 0.001
send clean path
pause 0.8
pause 0.5
goto CLEAN.1

WATER:
pause 0.001
gosub AUTOMOVE 171
pause 0.1
WATER.1:
pause 0.001
send get water
pause 0.8
pause 0.5
goto WATER.1

RUG:
pause 0.001
gosub AUTOMOVE side
pause 0.5
RUG.1:
pause 0.001
send clean rug
pause 0.8
pause 0.5
goto RUG.1

GATHER:
pause 0.001
gosub AUTOMOVE tynick
pause 0.1
GATHER.1:
pause 0.001
send get herb
pause 0.8
pause 0.5
goto GATHER.1

GRAVEYARD:
pause 0.001
send go gate
pause 0.5
send pull weed
pause 0.8
pause 0.5
send look headstone
pause 0.6
GRAVEYARD.1:
pause 0.001
send pull weed
pause 0.8
pause 0.5
goto GRAVEYARD.1

WINDOWS:
pause 0.001
send go gate
pause 0.5
send clean window
pause 0.8
pause 0.5
send peer window
pause 0.5
WINDOWS.1:
pause 0.001
send clean window
pause 0.8
pause 0.5
goto WINDOWS.1

STEPS:
pause 0.001
send go gate
pause 0.5
send clean step
pause 0.8
pause 0.5
send peer key
pause 0.5
STEPS.1:
pause 0.001
send clean step
pause 0.8
pause 0.5
goto STEPS.1

PAINT:
pause 0.001
send go gate
pause 0.5
PAINT.1:
pause 0.001
send get paint
pause 0.8
pause 0.5
goto PAINT.1

EQUIPMENT:
pause 0.001
send go gate
pause 0.5
send clean equipment
pause 0.8
pause 0.6
send open cabinet
pause 0.5
EQUIPMENT.1:
pause 0.001
send clean equipment
pause 0.8
pause 0.5
goto EQUIPMENT.1

SCRIBE:
pause 0.001
send go gate
pause 0.5
send scribe tome
pause 0.8
pause 0.5
send open book
pause 0.5
SCRIBE.1:
pause 0.001
send scribe tome
pause 0.8
pause 0.5
goto SCRIBE.1

FIX:
pause 0.001
send go gate
pause 0.5
pause 0.001
send repair wall
pause 0.8
pause 0.8
put peer dirt
pause 0.5
FIX.1:
pause 0.001
send repair wall
pause 0.8
pause 0.5
goto FIX.1

KITCHEN:
pause 0.001
send go gate
pause 0.5
send repair tile
pause 0.8
pause 0.8
send pull curtain
pause 0.5
KITCHEN.1:
pause 0.001
send repair tile
pause 0.8
pause 0.5
goto KITCHEN.1

GRAPE:
pause 0.001
send go gate
pause 0.5
GRAPE.1:
pause 0.001
send pull grape
pause 0.8
pause 0.5
goto GRAPE.1



TASK.DONE:
math Complete add 1
echo
echo * TASK DONE!
echo * TASKS COMPLETE: %Complete
echo
pause 0.1
pause 0.2
pause 0.5
send go out
pause 0.5
pause 0.1
gosub AUTOMOVE adano
pause 0.5
if ("$roomid" != "176") then gosub AUTOMOVE 176
pause 0.2
if ("$roomid" != "176") then gosub AUTOMOVE 176
send ask adano about job
pause 0.2
pause 0.5
goto TASK


FINISH:
echo
echo ** YOU FOUND THE GUILD!!!
echo
exit



AUTOMOVE:
     delay 0.00001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($hidden = 1) then send unhide
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     delay 0.00001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchre AUTOMOVE_FAILED ^You don't seem
     put #goto %Destination
     matchwait 3
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 180
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     delay 0.00001
     if ($standing = 1) then goto AUTOMOVE_RETURN
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry,|^You are still stunned\.
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
     if (%automovefailCounter > 5) then goto AUTOMOVE_FAIL_BAIL
     if (%automovefailCounter > 1) then send #mapper reset
     pause 0.01
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
     pause 0.00001
     var randomloop 0
     var automovefailCounter 0
     action (moving) off
     pause 0.001
     pause 0.001
     pause 0.001
     return
     
RANDOMMOVE:
MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
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
     if (matchre("$roomobjs $roomdesc","\barchway") && ("%lastmoved" != "go archway")) then
          {
               gosub MOVE go archway
               return
          }
     if (matchre("$roomobjs $roomdesc","\barch") && ("%lastmoved" != "go arch")) then
          {
               gosub MOVE go arch
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
     if matchre("$roomobjs $roomdesc","\b(exit|curtain|arch|door|gate|hole|hatch|trapdoor|path|animal trail|tunnel|portal|docks)\b") then
          {
               gosub MOVE go $1
               return
          }
     if matchre("$roomname","(Ylono's Repairs|Catrox's Forge|Unspiek's Repair Shop|Kamze's Repair|Storage Shed)") then gosub MOVE out
     if (matchre("$roomobjs $roomdesc","narrow hole") && ("%lastmoved" != "go hole")) then gosub MOVE go hole
     if (matchre("$roomobjs $roomdesc","bank docks") && ("%lastmoved" != "go dock")) then gosub MOVE go dock
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
     if (matchre("$roomobjs $roomdesc","\barchway") && ("%lastmoved" != "go archway")) then gosub MOVE go archway
     if (matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit")) then gosub MOVE go exit
     if (matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path")) then gosub MOVE go path
     if (matchre("$roomobjs $roomdesc","\bledge\b") && ("%lastmoved" != "go ledge")) then gosub MOVE go ledge
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
     if (%moved = 1) then return
     if (matchre("$roomname", "Deadman's Confide, Beach") || matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then gosub TRUE_RANDOM
     if matchre("$roomname","Smavold's Toggery") then gosub MOVE go door
     if matchre("$roomname","Temple Hill Manor, Grounds") then gosub MOVE go gate
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then gosub MOVE climb pine branches
     if matchre("$roomname","Darkling Wood, Pine Tree") then gosub MOVE climb white pine
     if (%moved = 1) then return
     if matchre("$roomname","The Sewers, Beneath the Grate") then gosub MOVE go grate
     if matchre("$roomobjs","strong creeper") then gosub MOVE climb ladder
     if matchre("$roomobjs","the garden") then gosub MOVE go garden
     if matchre("$roomobjs","underside of the Bridge of Rooks") then gosub MOVE climb bridge
     if (%moved = 1) then return
     if matchre("$roomobjs","stone wall") then gosub MOVE climb niche
     if matchre("$roomobjs","narrow ledge") then gosub MOVE climb ledge
     if matchre("$roomobjs","craggy niche") then gosub MOVE climb niche
     if matchre("$roomobjs","double door") then gosub MOVE go door
     if matchre("$roomobjs","staircase") then gosub MOVE climb stair
     if matchre("$roomobjs","the exit") then gosub MOVE go exit
     if (%moved = 1) then return
     echo * No random direction possible?? Looking to attempt to reset room exit vars
     send search
     pause 0.4
     pause 0.2
     #might need a counter here to prevent infinite loops
     put look
     pause 0.5
     delay 0.2
     goto moveRandomDirection_2
     
MOVE:
     delay 0.00001
     var Direction $0
     var movefailCounter 0
     var moveRetreat 0
     var randomloop 0
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RETRY ^\.\.\.wait|^Sorry, you may only type|^Please wait\.|You are still stunned\.
     matchre MOVE_RETURN_CHECK ^You can't (swim|move|climb) in that direction\.
     matchre MOVE_RESUME ^You make your way up the .*\.\s*Partway up, you make the mistake of looking down\.\s*Struck by vertigo, you cling to the .* for a few moments, then slowly climb back down\.
     matchre MOVE_RESUME ^You pick your way up the .*, but reach a point where your footing is questionable\.\s*Reluctantly, you climb back down\.
     matchre MOVE_RESUME ^You approach the .*, but the steepness is intimidating\.
     matchre MOVE_RESUME ^You struggle
     matchre MOVE_RESUME ^You blunder
     matchre MOVE_RESUME ^You slap
     matchre MOVE_RESUME ^You work
     matchre MOVE_RESUME make much headway
     matchre MOVE_RESUME ^You flounder around in the water\.
     matchre MOVE_RETREAT ^You are engaged to .*\!
     matchre MOVE_RETREAT ^You can't do that while engaged\!
     matchre MOVE_STAND ^You start up the .*, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE_STAND ^Running heedlessly over the rough terrain, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE_STAND ^You can't do that while lying down\.
     matchre MOVE_STAND ^You can't do that while sitting\!
     matchre MOVE_STAND ^You can't do that while kneeling\!
     matchre MOVE_STAND ^You must be standing to do that\.
     matchre MOVE_STAND ^You don't seem
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind, lame duck, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly, preventing you from making much headway\.
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
     matchre MOVE_STAND ^\.\.\.wait|^Sorry,|^You are still stunned\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_STAND ^You don't
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
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry,|^You are still stunned\.
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
     matchre MOVE_DIG ^\.\.\.wait|^Sorry,|^You are still stunned\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait 10
     goto MOVE_DIG
MOVE_DIG_STAND:
     delay 0.00001
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry,|^You are still stunned\.
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