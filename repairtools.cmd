########################
# MINI REPAIR TOOLS SCRIPT BY SHROOM
# STARTS AT YLONO REPAIR SHOP!
# REPAIRS ANY TOOLS YOU SET
#######################


var REPAIRER ylono

var Tool.Storage $MC_ENGINEERING.STORAGE

send stop play
pause 0.2

if_1 then goto %1

START:
## ENGINEERING TOOLS
var TOOL chisel
gosub REPAIR
var TOOL rasp
gosub REPAIR
var TOOL riffler
gosub REPAIR
var TOOL saw
gosub REPAIR
var TOOL plier
gosub REPAIR
## ALCHEMTY TOOLS
var TOOL bowl
gosub REPAIR
var TOOL mortar
gosub REPAIR
var TOOL pestle
gosub REPAIR
var TOOL sieve
gosub REPAIR
var TOOL mixing stick
gosub REPAIR
## ENCHANTING TOOLS
var TOOL burin
gosub REPAIR
var TOOL loop
gosub REPAIR
var TOOL fount
gosub REPAIR
var TOOL brazier
gosub REPAIR
var TOOL NULL
gosub REPAIR

WAIT.FOR.REPAIR:
     var repairloop 0
     put out
     pause 0.5
     send stop play
WAITING.REPAIR.LOOP:
     pause 0.5
     math repairloop add 1
     if (%repairloop > 30) then goto DONE.REPAIR 
     send collect coin
     pause 2
     pause
     send kick pile
     pause
     goto WAITING.REPAIR.LOOP
     
DONE.REPAIR:
     pause 0.5
     gosub automove ylono
     pause 0.3
     put .repairdone
     waitforre REPAIR DONE\!
     goto DONE

REPAIR:
     pause 0.001
     gosub GET MY %TOOL
     gosub PUT give my %TOOL to %REPAIRER
     gosub PUT give my %TOOL to %REPAIRER
     gosub EMPTY.HANDS
     return

REPAIR.DONE:
     gosub GET MY TICKET
     gosub PUT give my ticket to %REPAIRER
     gosub EMPTY.HANDS
     return

GET:
     var Get $0
GET.CONTINUE:
     pause 0.001
     matchre GET.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
     matchre GET.CONTINUE ^You struggle with .* great weight but can't quite lift it\!
     matchre GET2 ^You should untie
     matchre GET2 ^Get what\?
     matchre GET2 ^I could not find what you were referring to\.
     matchre GET2 ^What were you referring to\?
     matchre GET2 ^You pull at it
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^You remove|Please rephrase
     send get %Get
     matchwait
GET2:
     pause 0.001
     matchre GET.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
     matchre GET.CONTINUE ^You struggle with .* great weight but can't quite lift it\!
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^Untie what\?
     matchre RETURN ^You are already holding that\.
     matchre RETURN ^Get what\?
     matchre RETURN ^You remove
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?|Please rephrase
     send untie %Get
     matchwait
STOW:
     var Stow $0
STOW.CONT:
     pause 0.001
     matchre STOW.CONT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
     matchre RETURN ^You put your .*\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
     send put my %Stow in my %Tool.Storage
     matchwait 7
STOW.2:
     pause 0.001
     matchre STOW.2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
     matchre RETURN ^You put your .*\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Stow what\?  Type 'STOW HELP' for details\.
     send stow my %Stow
     matchwait
PUT:
     var Command $0
PUT.CONT:
     pause 0.001
     matchre PUT.CONT ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,
     matchre PUT.CONT ^You don't seem to be able to move to do that|^You can't do that while entangled in a web
     matchre PUT.STOW ^You need a free hand|You will need more coin
     matchre RETURN ^\>|^You|^Please rephrase that command\.|^.* what\?|^Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?|^\[Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\]|^\(Roundtime\:?\s+\d+\s+sec(?:onds|s)?\.?\)|^I could not find what you were referring to\.|^What were you referring to\?
     send %Command
     matchwait
PUT.STOW:
     if ("$righthand" != "Empty") then gosub STOW RIGHT
     if ("$lefthand" != "Empty") then gosub STOW LEFT
     goto PUT.CONT
EMPTY.HANDS:
	pause 0.1
     if matchre("$righthand","(mortar|pestle|sieve|mixing stick) then
          {
          put tie $righthand to my alch belt
          pause 0.5
          }
     if ("$righthand" != "Empty") then 
     {
          eval Item tolower($righthandnoun)
          gosub put put my %Item in my %Tool.Storage
     }
     if ("$lefthand" != "Empty") then
     {
          eval Item tolower($lefthandnoun)
          gosub put put my %Item in my %Tool.Storage
     }
     return
RETURN:
	pause 0.1
     return
	
DONE:
     gosub clear
     pause 0.5
	echo *** TOOL REPAIR COMPLETE!
     put #parse TOOL REPAIR COMPLETE!
	exit
	
#### AUTOMOVE
AUTOMOVE:
     delay 0.0001
     action (moving) on
     var Moving 0
     var Destination $0
     var automovefailCounter 0
     if (!$standing) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub moveRandomDirection
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.0001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
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
     matchwait
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
     pause 0.1
     pause 0.2
     return

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
     if matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog") then
          {
               gosub RANDOMMOVE
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
     random 1 13
     if (%r = 1) && ($north) then gosub MOVE n
     if (%r = 2) && ($northeast) then gosub MOVE ne
     if (%r = 3) && ($east) then gosub MOVE e
     if (%r = 4) && ($northwest) then gosub MOVE nw
     if (%r = 5) && ($southeast) then gosub MOVE se
     if (%r = 6) && ($south) then gosub MOVE s
     if (%r = 7) && ($southwest) then gosub MOVE sw
     if (%r = 8) && ($west) then gosub MOVE w
     if (%r = 9) && ($out) then gosub MOVE out
     if (%r = 10) && matchre("$roomobjs","\bdoor\b") then gosub MOVE go door
     if (%r = 11) && matchre("$roomobjs","\bgate\b") then gosub MOVE go gate
     if (%r = 12) && matchre("$roomobjs","\barch\b") then gosub MOVE go arch
     if (%r = 13) && matchre("$roomobjs","\bportal\b") then gosub MOVE go port
     # if $roomid == 0 then goto moveRandomDirection_2
     return