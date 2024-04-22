ECHO 
ECHO ##################################
ECHO *** WILL SELL/DUMP ALL OF X ITEM YOU TELL IT TO 
ECHO
ECHO ** SYNTAX IS .getsell <item> 
ECHO 
ECHO ** IF YOU WANT TO ONLY GET ITEMS FROM A SPECIFIC CONTAINER:
ECHO ** .getsell itemname.from.my.containername
ECHO
ECHO ** .getsell knife - will sell/dump ALL 'knife' in your inventory
ECHO ** .getsell knife.from.my.backpack - will sell/dump ALL 'knife' in your backpack only
ECHO ##################################
ECHO
pause 0.01
if "$righthand" != "Empty" then GOSUB STOW right
if "$lefthand" != "Empty" then GOSUB STOW left
if_1 then goto Loop
exit

Loop:
     pause 0.00001
     matchre Loop ^\.\.\.wait|^Sorry\,
     matchre Loop2 ^What were|^But that
     matchre SELL ^You get|^You are
     put get my %1 %2
     matchwait 3
     goto DONE

Loop2:
     pause 0.00001
     matchre Loop ^\.\.\.wait|^Sorry\,
     matchre DONE ^What were
     matchre SELL ^You get|^You are
     put get my %1 %2 from my port
     matchwait 3
     goto DONE

SELL:
     matchre SELL ^\.\.\.wait|^Sorry\,
     matchre Loop ^You sell your|hands you
     matchre DROP ^You can't pawn|not worth the effort
     matchre DROP slit a throat for this|worth my time|shakes his head|no need
     matchre DROP ^I could not find what you were referring to\.
     matchre DROP ^Please rephrase that command\.
     matchre DROP ^What were you referring to\?
     matchre DROP You'll want to empty that first
     matchre DROP I don't want
     put sell my $righthandnoun
     matchwait
DROP:
     pause 0.000001
     if matchre("$roomobjs", "(a bucket of viscous gloop|a waste bucket|a bucket|metal bucket|iron bucket)") then var dumpster bucket
     if matchre("$roomobjs", "(a disposal bin|a waste bin|firewood bin|azurite bin)") then var dumpster bin
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
     if ("%dumpster" != "null") then
          {
               put put my $righthandnoun in %dumpster
               pause 0.1
               goto Loop
          }
     if contains("$righthand","(grass|vine|rope)") then put drop my $righthand
     if contains("$lefthand","(grass|vine|rope)") then put drop my $lefthand
     if contains("$righthand|$lefthand","%1") then put drop my $righthandnoun
     pause 0.0001
     pause 0.0001
     goto Loop

DONE:
     echo *** DONE! ***
     exit
     
STOW:
var item $0
pause 0.001
send STOW %item
pause 0.3
pause 0.2
return