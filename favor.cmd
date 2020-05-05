#favorcrossing

##  Modified by Shroom of TF.  Start the script outside the Crossing Bank  ############


match AtBank The hustle of crowds making their way between the secular and relig
match NotAtBank Obvious paths:
match NotAtBank Obvious exits:
put LOOK
MATCHWAIT

NotAtBank:
echo
echo
echo
echo
echo ******************************************************
echo Please start this script outside of the Crossing bank.
echo ******************************************************
echo
echo
exit

AtBank:
echo
echo
echo
echo
echo *************
echo Here we go...
echo *************
echo
echo

move nw
move n
move n
move n
move n
move n
move n
move w
move w
move w
move w
move go bridge
move w
move w
move w
move w
move go gate
move nw
move w
move sw
move sw
move s
move w
move sw
move go path
move sw
move s
move sw
move sw
move se
move up
move up
move nw
move go trail
move go arch
move go stone

pray:
pause 1
put kneel
put pray
pause 1
put pray
pause 1
put pray
pause 1
put say Damaris
pause 1
put stand
pause 1
put get Damaris orb
pause 1
put go arch
pause 1

puzzle:
match puzzle ...wait
match plant plant
match sponge sponge
match jug jug
match tinders tinders
match vase vase
match GoOn bubbling pool
match look difficult
put look
matchwait

plant:
pause .5
matchre plant shimy|shimmy
match plant loosen
match open swift breeze moves into the room
put open window
matchwait

open:
pause .5
put go window
goto puzzle

sponge:
put clean altar
pause 1
put climb stair
pause 1
put go door
pause 1
goto puzzle

jug:
put fill font
pause 1
put climb stair
pause 1
put go door
pause 1
goto puzzle

tinders:
put light candle
pause 1
put climb stair
pause 1
put go door
pause 1
goto puzzle

vase:
put get flower
pause 1
put go path
pause 1
goto puzzle

look:
put look

GoOn:
move e
move go arch
pause 1
move go trail
pause 1
move se
move down
move down
move nw
move ne
move ne
move n
move ne
move go path
move ne
move e
move n
move ne
move ne
move e
move se
move go gate
move e
move e
move e
move e
move e
move e
move e
move e
move e
move s
move s
move s
move s
move s
move s
move se
pause                              
echo
echo ************** YOU GOT A NEW FAVOR! **************
echo
put #echo >Log Blue *** GOT A FAVOR *** 
put #parse FAVOR DONE
exit

automove:
var toroom $1
automovecont:
matchre automove.return YOU HAVE ARRIVED|SHOP CLOSED
matchre automovecont YOU HAVE FAILED|MOVE FAILED
put #goto %toroom
matchwait

automove.return:
pause 0.1
RETURN
RETURN:
RETURN
