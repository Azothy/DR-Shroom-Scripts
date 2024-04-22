var numbers first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|eleventh|twelfth|thirteenth|fourteenth|fifteenth|sixteenth|seventeenth|eighteenth|nineteenth|twenty
var location on shelf
START:
if_1 then var location %1
pause 0.001
gosub LOOK scroll
gosub LOOK vellum
gosub LOOK tablet
gosub LOOK bark
echo *** DONE CHECKING SCROLLS
exit

LOOK:
var thing $0
var number.count 0
LOOK_1:
pause 0.0001
matchre SCROLL_NEXT ^It is|You see
matchre NO_MORE ^I could not find what|^What were
put look %numbers(%number.count) %thing %location
matchwait 2
SCROLL_NEXT:
pause 0.1
math number.count add 1
goto LOOK_1

NO_MORE:
return
