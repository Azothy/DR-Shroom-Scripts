#COMPENDIUM SCRIPT BY SHROOM OF TF

var first.compendium black
var second.compendium leather
var third.compendium heavy
var SECOND.COMP YES
var THIRD.COMP NO
var BookOne 0
var BookTwo 0
var LOOP 0

action var doneplay yes when You finish (humming|playing)
action put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type

if "$righthand" != "Empty" then put stow right
if "$lefthand" != "Empty" then put stow left
pause 0.5
pause 0.5
put khri focus hasten sight avoidance
pause 2
pause
COMPENDIUM:
echo
echo #######################################
echo #         ~COMPENDIUM TIME~           #
echo #   TRAINING FIRST AID/SCHOLARSHIP!   #
echo #######################################
echo

GET_COMP:
pause 0.5
matchre OPEN ^You are already holding that
matchre OPEN ^You get a .* from inside your
matchre NOCOM ^What were you referring to
put get my %first.compendium compendium
matchwait 15
echo *** Error with starting ***
goto FINISH_COMP

OPEN:
math LOOP add 1
matchre SETSTART ^You open your .* to the section on (.+) physiology
matchre CLOSECOM ^That is already open
put open my compendium
matchwait 15
echo *** Error with opening ***
goto FINISH_COMP

CLOSECOM:
put close my compendium
pause 0.5
goto OPEN

SETSTART:
setvariable startpage $1
setvariable currentpage NULL
pause 0.5
pause 0.5
goto STUDY

STUDY:
pause 0.5
matchre DOTURN ^You begin studying .* gradually absorbing the knowledge
matchre DOTURN ^You continue studying
matchre DOTURN ^In a sudden moment of clarity
matchre DOTURN ^With a sudden moment of clarity
matchre DOTURN having a difficult time comprehending|almost impossible
matchre DOTURN.STUDIED ^Why do you need to study this chart again
put study my compend
matchwait 15
echo *** Error with STUDY ***
goto FINISH_COMP

DOTURN.STUDIED:
var STUDIED YES
DOTURN:
pause 0.5
matchre SETNEWPAGE ^You turn to the section containing (.+) physiology
put turn my compend
matchwait 20
echo *** Error in DOTURN ***
goto FINISH_COMP

SETNEWPAGE:
setvariable currentpage $1
goto STUDYCHECK

STUDYCHECK:
if match("%startpage","%currentpage") then goto FINISH_COMP
else if $First_Aid.LearningRate > 29 then goto FINISH_COMP3
else goto STUDY

FINISH_COMP:
if ("%SECOND.COMP" != "YES") then goto FINISH_COMP3
if (%BookOne = 1) then goto FINISH_COMP2
pause 0.5
put put my compen in my cloak
pause 0.5
put get my %second.compendium compendium
pause 0.5
var BookOne 1
goto OPEN

FINISH_COMP2:
if ("%THIRD.COMP" != "YES") then goto FINISH_COMP3
if (%BookTwo = 1) then goto FINISH_COMP3
pause 0.5
put put my compen in my cloak
pause 0.5
put get my %third.compendium compendium
pause 0.5
var BookTwo 1
goto OPEN

FINISH_COMP3:
pause 0.5
put put my compen in my cloak
pause 0.5
goto DONE.COMP

NOCOM:
echo *** You don't have a compendium ***
goto FINISH_COMP

DONE.COMP:
echo
echo *** Finished Reading Compendiums! ***
echo
send exp
waitfor EXP HELP
put #parse DONE STUDY
put #parse COMP DONE
put #parse COMPENDIUM DONE
put #parse STUDY DONE
exit
