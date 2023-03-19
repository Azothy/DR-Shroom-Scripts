
#debug 10
#######################################
## GET-DROP SCRIPT BY SHROOM
## GETS ALL OF X ITEM AND DUMPS/DROPS IT
## WILL USE ANY TRASH CONTAINERS IT SEES
## USAGE: .getdrop <item> 
######################################
var dumpster null
ECHO
ECHO ** SYNTAX IS .getdrop <item>
ECHO ** .getdrop marauder.blade
ECHO ** .getdrop treasure.map
ECHO ** .getdrop shield
ECHO
var item %1
if matchre("$roomobjs", "(bucket of viscous gloop|waste bucket|a bucket|metal bucket|iron bucket)") then var dumpster bucket
if matchre("$roomobjs", "(disposal bin|waste bin|firewood bin|azurite bin)") then var dumpster bin
if matchre("$roomname", "^\[Garden Rooftop, Medical Pavilion\]") then var dumpster gutter
if matchre("$roomobjs", "(a tree hollow|darken hollow)") then var dumpster hollow
if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
if matchre("$roomobjs", "a small mud puddle") then var dumpster puddle
if matchre("$roomobjs", "a marble statue ") then var dumpster statue
if matchre("$roomobjs", "a waste basket") then var dumpster basket
if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
if matchre("$roomobjs", "driftwood log") then var dumpster log
if matchre("$roomobjs", "an oak crate") then var dumpster crate
if matchre("$roomobjs", "a small hole") then var dumpster hole
if matchre("$roomobjs", "gelapod") then var dumpster gelapod
if matchre("$roomobjs", "ivory urn") then var dumpster urn
if_1 then goto GetDropLoop
echo *** ABORT! DID NOT SPECIFY A VARIABLE!
exit

GetDropLoop:
pause 0.0001
matchre GetDropLoop ^\.\.\.wait|^Sorry\,
matchre GetDropLoop2 ^What were|^I could not
matchre DROP ^You get|You carefully
matchre DROP ^You are already
matchre GetDropLoop2 ^But that is
put get my %item
matchwait 4
goto DONE
GetDropLoop2:
pause 0.0001
matchre GetDropLoop ^\.\.\.wait|^Sorry\,
matchre DONE ^What were|^I could not
matchre DROP ^You get|You carefully
matchre DROP ^You are already
matchre DONE ^But that is
put get my %item from my portal
matchwait 4
goto DONE

DROP:
if ("%dumpster" != "null") then
     {
          put put my %item in %dumpster
          pause 0.1
          goto GetDropLoop
     }
if contains("$righthand","(grass|vine|rope)") then put drop my $righthand
if contains("$lefthand","(grass|vine|rope)") then put drop my $lefthand
if contains("$righthand|$lefthand","%item") then put drop my %item
goto GetDropLoop

DONE:
echo *** DONE dumping %item! ***
put #parse DONE
exit