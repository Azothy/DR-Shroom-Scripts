#debuglevel 5
####################################
## FIND RIVERHAVEN THIEVES GUILD 
# By Shroom
####################################
# MUST PUT IN PASSWORD (Have to ask Jackwater) 
var HAVEN_PW toveustorto

HAVEN.TELLER:
     gosub AUTOMOVE teller
     PUT with 4 silver
     gosub MOVE go arch
     gosub MOVE out
     goto NO.CONTACTS
HAVEN.FIND.GUILD:
     var LAST HAVEN.FIND.GUILD
     pause 0.5
     match hole1 selling off some stolen goods
     match hole2 Crescent Way
     match hole3 Silvermoon Road
     match hole4 the boss is with his own kind
     match hole5 cooped up
     match hole6 around the rookery
     matchre NO.CONTACTS Apparently there are too many eyes on you|USAGE|walks off|look of disgust
     send contact guild
     matchwait 7
     goto NO.CONTACTS
NO.CONTACTS:
     var HAVEN_LOCATION LOST
hole1:
     var LAST hole1
     gosub AUTOMOVE 33
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE climb stair
     gosub MOVE ne
     gosub MOVE go corner
athole1:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     gosub MOVE sw
     send climb stair
     pause 0.5
     send go door
     pause 0.5
     if ("%HAVEN_LOCATION" = "LOST") then goto hole2
     goto HAVEN.DONE.ASSESS
hole2:
     var LAST hole2
     gosub AUTOMOVE 47
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub PUT look shadow
     gosub PUT search shadow
     pause 0.5
     gosub MOVE go open
     gosub MOVE go cor
athole2:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     gosub MOVE out
     gosub MOVE go door
     if ("%HAVEN_LOCATION" = "LOST") then goto hole3
     goto HAVEN.DONE.ASSESS
hole3:
     var LAST hole3
     gosub AUTOMOVE 36
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub PUT look floor
     gosub MOVE go door
     gosub MOVE go cor
athole3:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     send climb door
     pause 0.5
     gosub MOVE out
     if ("%HAVEN_LOCATION" = "LOST") then goto hole4
     goto HAVEN.DONE.ASSESS
hole4:
     var LAST hole4
     gosub AUTOMOVE 302
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock grat
     gosub PUT whisper grat %HAVEN_PW
     gosub MOVE go door
     gosub MOVE ne
     gosub MOVE go nook
athole4:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     gosub MOVE sw
     gosub MOVE go door
     gosub MOVE go grate
     gosub MOVE out
     if ("%HAVEN_LOCATION" = "LOST") then goto hole5
     goto HAVEN.DONE.ASSESS
hole5:
     var LAST hole5
     gosub AUTOMOVE 41
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE n
     gosub MOVE go corn
athole5:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     gosub MOVE s
     gosub MOVE go door
     if ("%HAVEN_LOCATION" = "LOST") then goto hole6
     goto HAVEN.DONE.ASSESS
hole6:
     var LAST hole6
     gosub AUTOMOVE 305
     gosub SEARCH
     pause $roundtime
     pause 0.5
     gosub PUT knock door
     gosub PUT whisper door %HAVEN_PW
     gosub MOVE go arch
     gosub MOVE climb st
     gosub MOVE go cor
athole6:
     if matchre("$roomobjs","(Crow|Lady Swan)") then
          {
          echo *** Found Crow and Swan ***
          echo *** type CONT to get out ***
          waitfor CONT
          }
     gosub MOVE out
     gosub MOVE climb sta
     gosub MOVE go arc
     gosub MOVE go door
     goto HAVEN.DONE.ASSESS
HAVEN.DONE.ASSESS:
     gosub AUTOMOVE town
     send exp
     exit
     

####################################
# GOSUBS
####################################
#### PUT SUB
PUT:
     delay 0.0001
     var command $0
     var LOCATION PUT_1
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN_CLEAR ^You (?:hand|slide|get|work|pull|shuffle|attach|push|move|put|now|scan|wear|sling|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^But (that|you) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^The|^That|too injured
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already|has already
     matchre RETURN_CLEAR ^Tie it off
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^Your (?:actions|dance|fingers|song).*\.
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^Subservient type|^The shadows|^Close examination|^Try though  
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Allows a Moon Mage
     matchre RETURN_CLEAR ^A slit across the door
     matchre RETURN_CLEAR ^You.*analyze
     matchre RETURN_CLEAR ^Having no further use for .*\, you discard it\.
     matchre RETURN_CLEAR ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN_CLEAR ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN_CLEAR ^Brother Durantine nods slowly\.
     matchre RETURN_CLEAR ^Durantine waves a small censer over a neatly-wrapped package and intones a short prayer before he hands it to you\.
     matchre RETURN_CLEAR ^After a moment\, .*\.
     matchre RETURN_CLEAR ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN_CLEAR ^Maybe you should stand up\.
     matchre RETURN_CLEAR ^The clerk counts out .*\.
     matchre RETURN_CLEAR ^The gem pouch
     matchre RETURN_CLEAR ^An attendant
     matchre RETURN_CLEAR ^The .* is not damaged enough to warrant repair\.
     matchre RETURN_CLEAR ^There is no more room in .*\.
     matchre RETURN_CLEAR ^There is nothing in there\.
     matchre RETURN_CLEAR ^In the .* you see .*\.
     matchre RETURN_CLEAR ^This spell cannot be targeted\.
     matchre RETURN_CLEAR ^You cannot figure out how to do that\.
     matchre RETURN_CLEAR ^You will now store .* in your .*\.
     matchre RETURN_CLEAR ^That tool does not seem suitable for that task\.
     matchre RETURN_CLEAR ^There isn't any more room in .* for that\.
     matchre RETURN_CLEAR ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN_CLEAR ^\s*LINK ALL CANCEL\s*\- Breaks all links
     matchre RETURN_CLEAR STOW HELP
     matchre RETURN_CLEAR ^This ritual may only be performed on a corpse\.
     matchre RETURN_CLEAR ^There is nothing else to face\!
     matchre RETURN_CLEAR ^You're already stalking
     matchre RETURN_CLEAR ^There aren't
     matchre RETURN_CLEAR ^An offer
     matchre RETURN_CLEAR ^That area
     matchre RETURN_CLEAR ^Ylono (?:looks|frowns|shrugs|smiles) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Malik (?:nods|shakes) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Obvious exits
     matchre RETURN_CLEAR ^Obvious paths
     matchre RETURN_CLEAR ^But the merchant can't see you|are invisible|^Doing that would
     matchre STAND ^You should stand up first\.
     # matchre RETURN_CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Log Crimson $datetime Command = %command
     put #echo >Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >Log Crimson $datetime Command = %command
     put #log $datetime MISSING MATCH IN PUT
     RETURN
RETURN_CLEAR:
     return
PUT_STOW:
     delay 0.0001
     gosub EMPTY_HANDS
     goto PUT_1
#### GET SUB
GET:
     delay 0.0001
     var get $0
     var LOCATION GET1
     GET1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You (?:get|grab|pick|carefully|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET (base.inc)
     RETURN
     
search.p:
pause
pause
search:
     var todo $0
     var location search
     matchre RETURN ^Success\!
     matchre search.p ^Roundtime
     matchre search.p ^You search around for a moment
     put search %todo
     matchwait 15
     goto retry
     
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
MOVE.RESUME:
     matchre MOVE.RESUME ^\.\.\.wait|^Sorry\,
     matchre MOVE.RESUME ^You make your way up the .*\.\s*Partway up\, you make the mistake of looking down\.\s*Struck by vertigo\, you cling to the .* for a few moments\, then slowly climb back down\.
     matchre MOVE.RESUME ^You pick your way up the .*\, but reach a point where your footing is questionable\.\s*Reluctantly\, you climb back down\.
     matchre MOVE.RESUME ^You approach the .*\, but the steepness is intimidating\.
     matchre MOVE.RESUME ^You struggle
     matchre MOVE.RESUME ^You blunder
     matchre MOVE.RESUME ^You slap
     matchre MOVE.RESUME ^You work
     matchre MOVE.RESUME make much headway
     matchre MOVE.RESUME ^You flounder around in the water\.
     matchre MOVE.RETREAT ^You are engaged to .*\!
     matchre MOVE.STAND ^You start up the .*\, but slip after a few feet and fall to the ground\!\s*You are unharmed but feel foolish\.
     matchre MOVE.STAND ^Running heedlessly over the rough terrain\, you trip over an exposed root and land face first in the dirt\.
     matchre MOVE.STAND ^You can't do that while lying down\.
     matchre MOVE.STAND ^You can't do that while sitting\!
     matchre MOVE.STAND ^You must be standing to do that\.
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.STAND ^Stand up first.
     matchre MOVE.DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE.DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE.DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE.DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE.DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE.DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE.FAILED ^You can't go there
     matchre MOVE.FAILED ^I could not find what you were referring to\.
     matchre MOVE.FAILED ^What were you referring to\?
     matchre MOVE.RETURN ^It's pitch dark
     matchre MOVE.RETURN ^Obvious
     send %Direction
     matchwait
MOVE.STAND:
     pause 0.1
     matchre MOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE.STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE.STAND ^The weight
     matchre MOVE.STAND ^You try
     matchre MOVE.RETREAT ^You are already standing\.
     matchre MOVE.RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE.RETREAT ^You stand up\.
     send stand
     matchwait
MOVE.RETREAT:
     pause 0.1
     matchre MOVE.RETREAT ^\.\.\.wait|^Sorry\,
     matchre MOVE.RETREAT ^You retreat back to pole range\.
     matchre MOVE.RETREAT ^You try to back away
     matchre MOVE.STAND ^You must stand first\.
     matchre MOVE.RESUME ^You retreat from combat\.
     matchre MOVE.RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait
MOVE.DIG:
     pause 0.1
     matchre MOVE.DIG ^\.\.\.wait|^Sorry\,
     matchre MOVE.DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE.STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE.DIG.STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE.RESUME ^You will have to kneel
     send dig
     matchwait
MOVE.DIG.STAND:
     pause 0.1
     matchre MOVE.DIG.STAND ^\.\.\.wait|^Sorry\,
     matchre MOVE.DIG.STAND ^The weight
     matchre MOVE.DIG.STAND ^You try
     matchre MOVE.DIG.STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE.DIG ^You stand(?:\s*back)? up\.
     matchre MOVE.DIG ^You are already standing\.
     send stand
     matchwait
MOVE.FAILED:
     evalmath movefailCounter (movefailCounter + 1)
     if (%movefailCounter > 3) then goto MOVE.FAIL.BAIL
     pause 0.5
     goto MOVE.RESUME
MOVE.FAIL.BAIL:
     put #echo
     put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear
     RETURN
MOVE.RETURN:
     RETURN
MOVE.RANDOM:
     delay 0.0001
     random 1 13
     if (%r = 1) && (!$north) then goto MOVE.RANDOM
     if (%r = 2) && (!$northeast) then goto MOVE.RANDOM
     if (%r = 3) && (!$east) then goto MOVE.RANDOM
     if (%r = 4) && (!$southeast) then goto MOVE.RANDOM
     if (%r = 5) && (!$south) then goto MOVE.RANDOM
     if (%r = 6) && (!$southwest) then goto MOVE.RANDOM
     if (%r = 7) && (!$west) then goto MOVE.RANDOM
     if (%r = 8) && (!$northwest) then goto MOVE.RANDOM
     if (%r = 9) && (!$out) then goto MOVE.RANDOM
     if (%r = 10) && (!$up) then goto MOVE.RANDOM
     if (%r = 11) && (!$down) then goto MOVE.RANDOM
     if (%r = 12) && !matchre("$roomobjs","doorway|door") then goto MOVE.RANDOM
     if (%r = 13) && !matchre("$roomobjs","archway|arch") then goto MOVE.RANDOM
     #
     if (%r = 1) then var Direction north
     if (%r = 2) then var Direction northeast
     if (%r = 3) then var Direction east
     if (%r = 4) then var Direction southeast
     if (%r = 5) then var Direction south
     if (%r = 6) then var Direction southwest
     if (%r = 7) then var Direction west
     if (%r = 8) then var Direction northwest
     if (%r = 9) then var Direction out
     if (%r = 10) then var Direction up
     if (%r = 11) then var Direction down
     if (%r = 12) then var Direction go door
     if (%r = 13) then var Direction go arch
     #
     if (%r = 1) then var Reverse.Direction south
     if (%r = 2) then var Reverse.Direction southwest
     if (%r = 3) then var Reverse.Direction west
     if (%r = 4) then var Reverse.Direction northwest
     if (%r = 5) then var Reverse.Direction north
     if (%r = 6) then var Reverse.Direction northeast
     if (%r = 7) then var Reverse.Direction east
     if (%r = 8) then var Reverse.Direction southeast
     if (%r = 9) then var Reverse.Direction out
     if (%r = 10) then var Reverse.Direction down
     if (%r = 11) then var Reverse.Direction up
     if (%r = 12) then var Reverse.Direction go door
     if (%r = 13) then var Reverse.Direction go arch
     #
     var Exits 0
     if ($north) then math Exits add 1
     if ($northeast) then math Exits add 1
     if ($east) then math Exits add 1
     if ($southeast) then math Exits add 1
     if ($south) then math Exits add 1
     if ($southwest) then math Exits add 1
     if ($west) then math Exits add 1
     if ($out) then math Exits add 1
     if ($up) then math Exits add 1
     if ($down) then math Exits add 1
     if matchre("$roomobjs","doorway|door") then math Exits add 1
     if matchre("$roomobjs","archway|arch") then math Exits add 1
     #
     # don't move "back" on a path unless we hit a dead end
     if (%Exits > 1) && ("%Last.Direction" = "%Reverse.Direction") then goto MOVE.RANDOM
     #
     var Last.Direction %Direction
     # Trigger to set variable for occupied room, when roaming.
     action instant var Occupied 1 when ^Also here\:|^Also in the room\:
     var Occupied 0
     gosub MOVE.RESUME
     #if (%Occupied) then goto MOVE.RANDOM
     RETURN
     
##### AUTOMOVE SUBROUTINE #####
AUTOMOVE:
     delay 0.0001
     var Destination $0
     var automovefailCounter 0
     if $roomid = 0 then GOSUB MOVE.RANDOM
     if (!$standing) then gosub AUTOMOVE.STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE.GO:
     matchre AUTOMOVE.FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE.RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE.RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE.FAIL.BAIL ^DESTINATION NOT FOUND
     send #goto %Destination
     matchwait
AUTOMOVE.STAND:
     pause 0.1
     matchre AUTOMOVE.STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE.STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE.STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE.STAND ^You are still stunned\.
     matchre AUTOMOVE.RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE.RETURN ^You are already standing\.
     matchre AUTOMOVE.RETURN ^You begin to get up and 
     send stand
     matchwait
AUTOMOVE.FAILED:
     evalmath automovefailCounter (automovefailCounter + 1)
     if (%automovefailCounter > 3) then goto AUTOMOVE.FAIL.BAIL
     send #mapper reset
     pause 0.5
     goto AUTOMOVE.GO
AUTOMOVE.FAIL.BAIL:
     put #echo
     put #echo >$Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo Crimson Skipping to next shop
     put #echo
     put #parse MOVE FAILED
     gosub clear 
AUTOMOVE.RETURN:
     if matchre("%Destination", "teller|exchange|debt|PAWN") then if $invisible = 1 then gosub stopinvis
     pause 0.001
     RETURN
     
#### CATCH AND RETRY SUBS
WAIT:
     delay 0.0001
     pause 0.1
     if (!$standing) then gosub STAND
     goto %LOCATION
WEBBED:
     delay 0.0001
     if ($webbed) then waiteval (!$webbed)
     if (!$standing) then gosub STAND
     goto %LOCATION
IMMOBILE:
     delay 0.0001
     if contains("$prompt" , "I") then pause 20
     if (!$standing) then gosub STAND
     goto %LOCATION
STUNNED:
     delay 0.0001
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
#### RETURNS
RETURN.CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return