if contains("$roomobjs", "Carousel Square") then put go square
pause 0.001
pause 0.001
if contains("$roomobjs", "vault") then put go vault
pause 0.001
pause 0.001
put go door
pause 0.2
pause 0.2
pause 0.1
vault:
1.ARCH:
pause 0.1
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
pause 0.5
put #goto teller
waitfor YOU HAVE ARRIVED
send with 8 gold
pause 0.1
pause 0.1
pause 0.1
put #goto exch
waitfor YOU HAVE ARRIVED
put exchan all dok to kro
put exchan all lir to kro
pause 0.1
pause 0.1
put #goto 138
waitfor YOU HAVE ARRIVED
put pay 5000
pause 0.1
pause 0.1
move out
goto 1.ARCH

VAULT.GO:
put pull lever
pause 0.3
pause 0.4
send go door
pause 0.2
pause 0.2
pause 0.2
pause 0.4
send open vault
echo
echo *** TYPE "DONE" to LEAVE VAULT
echo
pause 0.1
pause 0.2
pause 0.2
VAULT.LOOK:
send look in vault
echo **** LOOKING IN YOUR VAULT!
echo **** TYPE DONE to LEAVE VAULT
put #parse VAULT
matchre VAULT.LEAVE \b(DONE|done)\b
matchwait 120
goto VAULT.LOOK

VAULT.LEAVE:
echo DONE WITH VAULT!
pause 0.1
pause 0.1
put close vault
wait
pause 0.2
pause 0.1
move go door
pause 0.1
pause 0.1
move go arch
pause 0.1
move out
pause 0.1
pause 0.1
put out
VAULT.DONE:
exit