#########################
# OTTER SMASH SCRIPT By Shroom
# HOLLOWS EVE 2020
#########################
var bag1 rucksack
var bag2 vortex
var bag3 shadows
var keeploot potency crystal|infuser stone|lootpouch|codex|serpent totem
put #echo >Log Lime *** OTTER SMASH SCRIPT
LOOP:
action goto HEAL when You should clean
if !matchre("$righthand", "Empty") then put stow right
if !matchre("$lefthand", "Empty") then put stow left
pause 0.3
if ($roomid != 169) then gosub AUTOMOVE 169
AT.BOX:
pause 0.2
put grab box
pause 0.5
pause 0.3
if !matchre("$righthand", "shell") then goto AT.BOX
gosub MOVE east
pause 0.1
put break my shell
pause 0.4
pause 0.3
if ($bleeding = 1) then gosub BLEEDERCHECK
if !matchre("$righthand", "Empty") then
     {
          put #echo >Log Yellow ** Won $righthand
          if matchre("$righthand", "green sack") then
               {
                    put open my sack
                    pause 0.1
                    put look in my sack
                    pause 0.2
                    put get coin
                    put get coin
                    pause 0.5
                    put get coin
                    pause 0.3
               }
          if !matchre("$righthand", "%keeploot") then
               {
                    echo **** $righthand is not in our keeploot var - Dumping
                    put put $righthand in bucket
               }
          else put stow right
          pause 0.7
     }
if !matchre("$righthand", "Empty") then
     {
          put $righthand in my %bag2
          pause 0.7
     }
if !matchre("$righthand", "Empty") then
     {
          put $righthand in my %bag3
          pause 0.7
     }
pause 0.1
goto LOOP
HEAL:
gosub automove 3
pause 0.4
put lean bay
matchre LOOP You are fully healed
matchre 30
goto HEAL
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################
#######################################################



DUMPSTER_SET:
DUMPSTER_CHECK:
     var dumpster NULL
     if matchre("$roomobjs", "a small hole") then var dumpster hole
     if matchre("$roomobjs", "a small mud puddle") then var dumpster puddle
     if matchre("$roomobjs", "a marble statue ") then var dumpster statue
     if matchre("$roomobjs", "(a disposal bin|a waste bin|firewood bin)") then var dumpster bin
     if matchre("$roomobjs", "(a tree hollow|darken hollow)") then var dumpster hollow
     if matchre("$roomobjs", "a bucket of viscous gloop|(a|metal|iron|steel|rusted|waste) bucket") then var dumpster bucket
     if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
     if matchre("$roomobjs", "an oak crate") then var dumpster crate
     if matchre("$roomobjs", "a driftwood log") then var dumpster log
     if matchre("$roomobjs", "(ivory|stone) urn") then var dumpster urn
     if matchre("$roomobjs", "a waste basket") then var dumpster basket
     if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomobjs", "domesticated gelapod") then var dumpster gelapod
     if matchre("$roomobjs", "large wooden barrel") then var dumpster barrel
     if matchre("$roomname", "^\[Garden Rooftop, Medical Pavilion\]") then var dumpster gutter
     return

STOWING:
     delay 0.0001
     var LOCATION STOWING
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     return
     
PUT_STOW:
     gosub EMPTY_HANDS
     goto PUT_1
PUT_STAND:
     gosub stand
     goto PUT_1
#### PUT SUB
PUT:
     delay 0.0001
     var putaction $0
     var LOCATION PUT_1
     PUT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand|^Free one of your hands
     matchre PUT_STAND ^You should stand up first\.|^Maybe you should stand up\.
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|manage|count|secure|unload|track|notice|report|rush|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^Brother Durantine|^Durantine|^Mags|^Ylono|^Malik|^Kilam|^Ragge|^Randal|^Catrox|^Kamze|^Unspiek|^Wyla|^Ladar|^Dagul|^Granzer|^Fekoeti|^Diwitt|(?:An|The|A) attendant|^The clerk|A Dwarven|^.*He says\,
     matchre RETURN ^The (?: clerk|teller|attendant|mortar|pestle|tongs|bowl|riffler|hammer|gem|book|page|lockpick|sconce|voice|waters) .*(?:\.|\!|\?)?
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre RETURN \[Roundtime
     matchre RETURN \[You're
     matchre RETURN ^Moving|Brushing
     matchre RETURN too injured
     matchre RETURN ^.*\[Praying for \d+ sec\.\]
     matchre RETURN ^You cannot do that while engaged\!
     matchre RETURN ^I could not find
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^Perhaps you should
     matchre RETURN ^That (?:is|has) already
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^.* is not in need
     matchre RETURN ^This is a .* spell|The spell requires
     matchre RETURN ^But (?:that|you|the)
     matchre RETURN ^What (?:were you|is it)
     matchre RETURN ^There (?:is|is not|isn't|doesn\'t)
     matchre RETURN ^In the name of love\?|^Play on
     matchre RETURN ^That (?:cannot|area|can't|won't)
     matchre RETURN ^With a (?:keen|practiced)
     matchre RETURN ^.* what\?
     matchre RETURN ^I don\'t|^Weirdly\,
     matchre RETURN ^Some (?:polished|people|tarnished|.* zills)
     matchre RETURN ^(\S+) has accepted
     matchre RETURN ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN ^Subservient type|^The shadows|^Close examination|^Try though
     matchre RETURN ^USAGE\:|^Using your
     matchre RETURN ^Smoking commands are
     matchre RETURN ^Allows a Moon Mage
     matchre RETURN ^A (?:slit|pair|shadow) .*(?:\.|\!|\?)?
     matchre RETURN ^Your (?:actions|dance|nerves) .*(?:\.|\!|\?)?
     matchre RETURN ^You.*analyze
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^You don't have a .* coin on you\!\s*The .* spider looks at you in forlorn disappointment\.
     matchre RETURN ^The .* spider turns away\, looking like it's not hungry for what you're offering\.
     matchre RETURN ^After a moment\, .*\.
     matchre RETURN ^.* (?:is|are) not in need of cleaning\.
     matchre RETURN ^Quietly touching your lips with the tips of your fingers as you kneel\, you make the Cleric's sign with your hand\.
     matchre RETURN ^The .* is not damaged enough to warrant repair\.
     matchre RETURN \[Type INVENTORY HELP for more options\]
     matchre RETURN ^A vortex|^A chance for
     matchre RETURN ^In a flash
     matchre RETURN ^An aftershock
     matchre RETURN ^In the .* you see .*\.
     matchre RETURN .* (?:Dokoras|Kronars|Lirums)
     matchre RETURN ^That is closed\.
     matchre RETURN ^This spell cannot be targeted\.
     matchre RETURN ^You cannot figure out how to do that\.S
     matchre RETURN ^You will now store .* in your .*\.
     matchre RETURN ^That tool does not seem suitable for that task\.
     matchre RETURN ^There (isn\'t|doesn\'t seem to be) any more room in .*
     matchre RETURN ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN ^\s*LINK ALL CANCEL\s*\- Breaks all links
     matchre RETURN ^This ritual may only be performed on a corpse\.
     matchre RETURN ^There is nothing else to face\!
     matchre RETURN ^Stalking is an inherently stealthy endeavor\, try being out of sight\.
     matchre RETURN ^You're already stalking
     matchre RETURN ^There aren't any .*\.
     matchre RETURN ^You don't think you have enough focus to do that\.
     matchre RETURN ^You have no idea how to cast that spell\.
     matchre RETURN ^An offer
     matchre RETURN ^Tie it off when it's empty\?
     matchre RETURN ^Obvious (?:exits|paths)
     matchre RETURN ^But the merchant can't see you|are invisible
     matchre RETURN Page|^As the world|^Obvious|^A ravenous energy
     matchre RETURN ^In the|^The attendant|^That is already open\.|^Your inner
     matchre RETURN ^(\S+) hands you|^Searching methodically|^But you haven\'t prepared a symbiosis\!
     matchre RETURN ^Illustrations of complex\,|^It is labeled|^Your nerves
     matchre RETURN ^The lockpick|^Doing that|is not required to continue crafting
     matchre RETURN ^Without (any|a)
     send %putaction
     matchwait 20
     put #echo >Log Crimson *** MISSING MATCH IN PUT! (%scriptname.cmd) ***
     put #echo >Log Crimson Command = %putaction
     put #log $datetime MISSING MATCH IN PUT! Command = %putaction (%scriptname.cmd)
     return
###############################################################
STOWING:
     delay 0.0001
     var LOCATION STOWING
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     return
STOWLEFT:
     gosub PUT stow my $lefthand
     pause 0.3
CLOSEIT:
     if ("$righthand" != "Empty") then send stow right
     pause 0.2
     if ("$righthand" != "Empty") then send close my $righthand
     if ("$lefthand" != "Empty") then send close my $lefthand
     pause 0.5
     goto STOW_1
GET1:
     pause 0.2
     put get %todo
     pause 0.2
     pause 0.2
     goto STOW1
STOW:
     var stowloop 0
     var LOCATION STOW1
     var todo $0
STOW1:
     delay 0.0001
     pause 0.1
     math stowloop add 1
     if (%stowloop > 3) then return
     if matchre("%todo","passes") then var todo pass
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre OPEN.THING ^But that's closed
     matchre STOW2 ^There\'s no room|^There isn\'t any more room|no matter how you arrange|^What were you|^Where are you|^Weirdly\,
     matchre STOW2 ^(That\'s|The .*) too (heavy|thick|long|wide)|not designed to carry|cannot hold any more|^(You|I) can't|^Perhaps you should
     matchre STOWLEFT ^You need a free hand
     matchre CLOSEIT ^You'll need to close the
     matchre LOCATION.unload ^You (should|need to) unload
     matchre STOW_RETURN ^But that is
     matchre STOW_RETURN ^That can't be picked up
     matchre STOW_RETURN ^Wear what\?|^Stow what\?|Type 'STOW HELP'
     matchre STOW_RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre STOW_RETURN ^As you reach for .* it slides quickly out of reach
     matchre STOW_RETURN needs to be
     matchre GET1 ^But that is already
     put stow %todo
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN STOW1! (cornmaze.cmd) ***
     put #echo >Log Crimson  Stow = %todo
     put #log $datetime MISSING MATCH IN STOW1 (cornmaze.cmd)
STOW2:
     if matchre("%todo", "(?i)right") then var todo $righthandnoun
     if matchre("%todo","(?i)left") then var todo $lefthandnoun
     delay 0.0001
     pause 0.1
     var LOCATION STOW2
     matchre OPEN.THING ^But that's closed
     matchre CLOSEIT ^You'll need to close the
     matchre LOCATION.unload ^You (should|need to) unload
     matchre STOW3 ^Perhaps you should
     matchre STOW3 ^There\'s no room|^There isn\'t any more room|no matter how you arrange|^What were you|^Where are you|^Weirdly\,
     matchre STOW3 ^(That\'s|The .*) too (heavy|thick|long|wide)|not designed to carry|cannot hold any more|^(You|I) can't
     matchre STOW_RETURN ^Wear what\?|^Stow what\?
     matchre STOW_RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre STOW_RETURN ^But that is already in your inventory\.
     matchre STOW_RETURN ^You stop as you realize
     matchre STOW_RETURN ^As you reach for .* it slides quickly out of reach
     put put %todo in my %bag1
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN STOW2! (cornmaze.cmd) ***
     put #echo >Log Crimson  Stow = %todo
     put #log $datetime MISSING MATCH IN STOW2 (cornmaze.cmd)
STOW3:
     delay 0.0001
     var LOCATION STOW3
     gosub PUT open my %BACKUP.BAG
     pause 0.1
     if ("$righthand" = "Empty") && ("$lefthand" = "Empty") then goto STOW_RETURN
     matchre OPEN.THING ^But that's closed
     matchre STOW4 ^Perhaps you should
     matchre STOW4 ^There\'s no room|^There isn\'t any more room|no matter how you arrange|^What were you|^Where are you|^Weirdly\,
     matchre STOW4 ^(That\'s|The .*) too (heavy|thick|long|wide)|not designed to carry|cannot hold any more|^(You|I) can't
     matchre CLOSEIT ^You'll need to close the
     matchre LOCATION.unload ^You (should|need to) unload
     matchre STOW_RETURN ^Wear what\?|^Stow what\?
     matchre STOW_RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre STOW_RETURN ^But that is already in your inventory\.
     matchre STOW_RETURN ^You stop as you realize
     matchre STOW_RETURN ^As you reach for .* it slides quickly out of reach
     put put %todo in my %bag2
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN STOW3! (cornmaze.cmd) ***
     put #echo >Log Crimson  Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (cornmaze.cmd)
STOW4:
     delay 0.0001
     var LOCATION STOW3
     gosub PUT open my %BACKUP2.BAG
     pause 0.1
     if ("$righthand" = "Empty") && ("$lefthand" = "Empty") then goto STOW_RETURN
     matchre OPEN.THING ^But that's closed
     matchre STOW_DROP ^Perhaps you should
     matchre STOW_DROP ^There\'s no room|^There isn\'t any more room|no matter how you arrange|^What were you|^Where are you|^Weirdly\,
     matchre STOW_DROP ^(That\'s|The .*) too (heavy|thick|long|wide)|not designed to carry|cannot hold any more|^(You|I) can't
     matchre CLOSEIT ^You'll need to close the
     matchre LOCATION.unload ^You (should|need to) unload
     matchre STOW_RETURN ^Wear what\?|^Stow what\?
     matchre STOW_RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre STOW_RETURN ^But that is already in your inventory\.
     matchre STOW_RETURN ^You stop as you realize
     matchre STOW_RETURN ^As you reach for .* it slides quickly out of reach
     put put %todo in my %bag3
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN STOW3! (cornmaze.cmd) ***
     put #echo >Log Crimson  Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (cornmaze.cmd)
OPEN.THING:
     put open %bag1
     pause 0.3
     put open %bag2
     pause 0.3
     put open %bag3
     pause 0.2
     pause 0.1
     goto STOWING
STOW_RETURN:
     if matchre("$righthand", "pass") then send stow right
     if matchre("$lefthand", "pass") then send stow left
     pause 0.3
     return
STOW_DROP:
     if ("$righthand" != "Empty") then gosub EMPTY_RIGHT
     if ("$lefthand" != "Empty") then gosub EMPTY_LEFT
     return
#################################################################
WEAR_UNLOAD:
     gosub unload
     pause 0.2
     goto WEAR_1
WEAR:
     delay 0.0001
     var todo $0
     var LOCATION WEAR_1
     WEAR_1:
     pause 0.1
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW1 ^You can't wear any more items like that\.
     matchre STOW1 ^You can't wear that\!
     matchre STOW1 ^You need at least one free hand for that\.
     matchre STOW1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:get|put|sling|slide|slip|drape|sheathe|attach|strap|hang|work|loosen|take|pull|remove|grab|pick|pull|push|twist|carefully|are) .*(?:\.|\!|\?)?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     matchre WEAR_UNLOAD ^You should unload the
     matchre WEAR_UNLOAD ^You need to unload the
     send wear %todo
     matchwait 10
     put #echo >Log Crimson  *** MISSING MATCH IN WEAR! (ubercombat.cmd) ***
     put #echo >Log Crimson  Stow = %todo
     put #log $datetime MISSING MATCH IN WEAR (ubercombat.cmd)
     return
#### EMPTY LEFT HAND
EMPTY_LEFT:
     delay 0.0001
     var LOCATION EMPTY_LEFT_1
     EMPTY_LEFT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You drop
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^Your left hand is already empty\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^I could not find what you were referring to\.
     send empty left
     matchwait 3
     goto EMPTY_LEFT
#### EMPTY RIGHT HAND
EMPTY_RIGHT:
     delay 0.0001
     var LOCATION EMPTY_RIGHT_1
     EMPTY_RIGHT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You drop
     matchre RETURN ^Having no further use for .*\, you discard it\.
     matchre RETURN ^Your right hand is already empty\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^I could not find what you were referring to\.
     send empty right
     matchwait 3
     goto EMPTY_RIGHT

#### OLD RETRY - STILL USES location.unload
RETRY:
     matchre location ^\.\.\.wait
     matchre location ^Sorry, you may
     matchre location ^Sorry, system is slow
     matchre location ^You don't seem to be able to move to do that
     matchre location.p ^It's all a blur
     matchre location.p ^You're unconscious\!
     matchre location.p ^You are still stunned
     matchre location.p There is no need for violence here\.
     matchre location.p ^You can't do that while entangled in a web
     matchre location.p ^You struggle against the shadowy webs to no avail\.
     matchre location.p ^You attempt that, but end up getting caught in an invisible box\.
     matchre location1 ^You should stop Playing before you do that\.
     matchre location1 ^You are a bit too busy performing to do that\.
     matchre location1 ^You are concentrating too much upon your performance to do that\.
     matchwait 22
     put #echo >Log Gold matchwait %location %todo
LOCATION.P:
     pause
LOCATION:
     pause .1
     goto %LOCATION
LOCATION.UNLOAD:
     gosub unload
     var LOCATION STOW_1
     gosub STOW_1
     return
LOCATION.UNLOAD1:
     gosub unload
     var LOCATION WEAR_1
     gosub WEAR_1
     return
LOCATION1:
     send stop play
     pause 0.1
     goto %LOCATION
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
CALMED:
     delay 5
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
#### RETURNS
RETURN:
     RETURN
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     RETURN

BLEEDERCHECK:
BLEEDER.CHECK:
BLEEDCHECK:
     var INFECTED NO
     delay 0.0001
     gosub stowing
     # action goto BLEEDCHECK when The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
     action var BLEEDING_HEAD YES when ^(?!.*\(tended\))\s*(head)\s{7}(.*)
     action var BLEEDING_NECK YES when ^(?!.*\(tended\))\s*(neck)\s{7}(.*)
     action var BLEEDING_CHEST YES when ^(?!.*\(tended\))\s*(chest)\s{7}(.*)
     action var BLEEDING_ABDOMEN YES when ^(?!.*\(tended\))\s*(abdomen)\s{7}(.*)
     action var BLEEDING_BACK YES when ^(?!.*\(tended\))\s*(back)\s{7}(.*)
     action var BLEEDING_R_ARM YES when ^(?!.*\(tended\))\s*r(?:ight|.) arm\s{7}(.*)
     action var BLEEDING_L_ARM YES when ^(?!.*\(tended\))\s*l(?:eft|.) arm\s{7}(.*)
     action var BLEEDING_R_LEG YES when ^(?!.*\(tended\))\s*r(?:ight|.) leg\s{7}(.*)
     action var BLEEDING_L_LEG YES when ^(?!.*\(tended\))\s*l(?:eft|.) leg\s{7}(.*)
     action var BLEEDING_R_HAND YES when ^(?!.*\(tended\))\s*r(?:ight|.) hand\s{7}(.*)
     action var BLEEDING_L_HAND YES when ^(?!.*\(tended\))\s*l(?:eft|.) hand\s{7}(.*)
     action var BLEEDING_L_EYE YES when ^(?!.*\(tended\))\s*l(?:eft|.) eye\s{7}(.*)
     action var BLEEDING_R_EYE YES when ^(?!.*\(tended\))\s*r(?:ight|.) eye\s{7}(.*)
     action var BLEEDING_SKIN YES when ^(?!.*\(tended\))\s*(skin)\s{7}(.*)
     action var BLEEDING_HEAD YES when (lodged\s*.*|mite|leech) (into|in|on) your head
     action var BLEEDING_NECK YES when (lodged\s*.*|mite|leech) (into|in|on) your neck
     action var BLEEDING_CHEST YES when (lodged\s*.*|mite|leech) (into|in|on) your chest
     action var BLEEDING_ABDOMEN YES when (lodged\s*.*|mite|leech) (into|in|on) your abdomen
     action var BLEEDING_BACK YES when (lodged\s*.*|mite|leech) (into|in|on) your back
     action var BLEEDING_R_ARM YES when (lodged\s*.*|mite|leech) (into|in|on) your right arm
     action var BLEEDING_L_ARM YES when (lodged\s*.*|mite|leech) (into|in|on) your left arm
     action var BLEEDING_R_LEG YES when (lodged\s*.*|mite|leech) (into|in|on) your right leg
     action var BLEEDING_L_LEG YES when (lodged\s*.*|mite|leech) (into|in|on) your left leg
     action var BLEEDING_R_HAND YES when (lodged\s*.*|mite|leech) (into|in|on) your right hand
     action var BLEEDING_L_HAND YES when (lodged\s*.*|mite|leech) (into|in|on) your left hand
     action var BLEEDING_L_EYE YES when (lodged\s*.*|mite|leech) (into|in|on) your left eye
     action var BLEEDING_R_EYE YES when (lodged\s*.*|mite|leech) (into|in|on) your right eye
     action var POISON YES when ^You.+(poisoned)
BLEEDYES:
     echo [Checking for Bleeders]
     if matchre("$righthandnoun $lefthandnoun", "(spear|fragment|arrow|thorn|bolt|shard|mite|leech|axe|worm)") then
          {
               put drop $1
               pause 0.4
          }
     if matchre("$righthandnoun $lefthandnoun", "(spear|fragment|arrow|thorn|bolt|shard|mite|leech|axe|worm)") then
          {
               put drop $1
               pause 0.4
          }
     pause 0.01
     matchre BLEEDYES ^\.\.\.wait|^Sorry\,|^You are still stunned\.|^Please rephrase
     matchre YESBLEEDING Bleeding|bleeding|arrow lodged|bolt lodged|spear lodged|fragment lodged|thorn lodged|axe lodged|mite|blood worm
     matchre YESBLEEDING lodged (shallowly|deeply|firmly|savagely|in your)
     matchre END.OF.BLEEDER ^You pause a moment|^The THINK verb|Syntax:|^Thinking
     matchre bleedyes It\'s all a blur\!
     put -health;-1 think
     matchwait 20
     echo [No bleeder found - exiting bleeder check]
     goto END.OF.BLEEDER
YESBLEEDING:
     echo **** BLEEDING! ****
     echo **** TENDING BLEEDER ****
     pause 0.3
     pause 0.2
     if ($monstercount > 0) then gosub RETREAT
     if "%INFECTED" = "YES" then
          {
               echo *************************************
               echo **** WARNING ** YOU ARE INFECTED ****
               echo *************************************
          }
     if "%BLEEDING_HEAD" = "YES" then gosub tend head
     if "%BLEEDING_NECK" = "YES" then gosub tend neck
     if "%BLEEDING_CHEST" = "YES" then gosub tend chest
     if "%BLEEDING_ABDOMEN" = "YES" then gosub tend abdomen
     if "%BLEEDING_BACK" = "YES" then gosub tend back
     if "%BLEEDING_R_ARM" = "YES" then gosub tend right arm
     if "%BLEEDING_L_ARM" = "YES" then gosub tend left arm
     if "%BLEEDING_R_LEG" = "YES" then gosub tend right leg
     if "%BLEEDING_L_LEG" = "YES" then gosub tend left leg
     if "%BLEEDING_R_HAND" = "YES" then gosub tend right hand
     if "%BLEEDING_L_HAND" = "YES" then gosub tend left hand
     if "%BLEEDING_L_EYE" = "YES" then gosub tend left eye
     if "%BLEEDING_R_EYE" = "YES" then gosub tend right eye
     #if "%BLEEDING_SKIN" = "YES" then gosub tend skin
     goto END.OF.BLEEDER
TEND:
     var bleeder $0
     echo ***************************
     echo [Tending Bleeder: %bleeder]
     echo ***************************
     if (%Playing = 1) then send stop play
     pause 0.1
     pause 0.001
     pause 0.001
     # if $prone then gosub STAND
tend_bleeder:
     pause 0.001
     send tend my %bleeder
     pause 0.7
     pause 0.5
     pause 0.5
     gosub DUMPSTER_SET
     if !matchre("%dumpster", "(NULL|gelapod)") then
          {
               pause 0.2
               if !matchre("$righthand", "Empty") then put put my $righthandnoun in %dumpster
               if !matchre("$lefthand", "Empty") then put put my $lefthandnoun in %dumpster
               pause 0.5
          }
     if matchre("%dumpster", "gelapod") then
          {
               pause 0.2
               if !matchre("$righthand", "Empty") then put feed my $righthandnoun to gelapod
               if !matchre("$lefthand", "Empty") then put feed my $lefthandnoun to gelapod
               pause 0.5
          }
     pause 0.2
     if !matchre("$righthand","Empty") && ("%dumpster" != "NULL") then put drop my $righthand
     if !matchre("$lefthand","Empty") && ("%dumpster" != "NULL") then put drop my $lefthand
     pause 0.1
     if matchre("$righthandnoun $lefthandnoun", "axe") then put drop axe
     if matchre("$righthandnoun $lefthandnoun", "spear") then put drop spear
     if matchre("$righthandnoun $lefthandnoun", "fragment") then put drop fragment
     if matchre("$righthandnoun $lefthandnoun", "arrow") then put drop arrow
     if matchre("$righthandnoun $lefthandnoun", "thorn") then put drop thorn
     if matchre("$righthandnoun $lefthandnoun", "bolt") then put drop bolt
     if matchre("$righthandnoun $lefthandnoun", "arrow") then put drop arrow
     if matchre("$righthandnoun $lefthandnoun", "thorn") then put drop thorn
     if matchre("$righthandnoun $lefthandnoun", "bolt") then put drop bolt
tend_bleeder2:
     pause 0.1
     gosub put tend my %bleeder
     pause 0.5
     gosub DUMPSTER_SET
     if !matchre("%dumpster", "(NULL|gelapod)") then
          {
               pause 0.2
               if !matchre("$righthand", "Empty") then put put my $righthandnoun in %dumpster
               if !matchre("$lefthand", "Empty") then put put my $lefthandnoun in %dumpster
               pause 0.5
          }
     if matchre("%dumpster", "gelapod") then
          {
               pause 0.2
               if !matchre("$righthand", "Empty") then put feed my $righthandnoun to gelapod
               if !matchre("$lefthand", "Empty") then put feed my $lefthandnoun to gelapod
               pause 0.5
          }
     pause 0.2
     pause 0.2
     if !matchre("$righthand","Empty") && ("%dumpster" != "NULL") then put drop my $righthand
     if !matchre("$lefthand","Empty") && ("%dumpster" != "NULL") then put drop my $lefthand
     pause 0.1
     if matchre("$righthandnoun $lefthandnoun", "axe") then put drop axe
     if matchre("$righthandnoun $lefthandnoun", "spear") then put drop spear
     if matchre("$righthandnoun $lefthandnoun", "fragment") then put drop fragment
     if matchre("$righthandnoun $lefthandnoun", "arrow") then put drop arrow
     if matchre("$righthandnoun $lefthandnoun", "thorn") then put drop thorn
     if matchre("$righthandnoun $lefthandnoun", "bolt") then put drop bolt
     if matchre("$righthandnoun $lefthandnoun", "arrow") then put drop arrow
     if matchre("$righthandnoun $lefthandnoun", "thorn") then put drop thorn
     if matchre("$righthandnoun $lefthandnoun", "bolt") then put drop bolt
     pause 0.1
     pause 0.1
     echo [Leaving Bleeder System]
     return
END.OF.BLEEDER:
     action remove The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
     action remove ^(?!.*\(tended\))\s*(head)\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*(neck)\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*(chest)\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*(abdomen)\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*(back)\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*r(?:ight|.) arm\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*l(?:eft|.) arm\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*r(?:ight|.) leg\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*l(?:eft|.) leg\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*r(?:ight|.) hand\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*l(?:eft|.) hand\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*l(?:eft|.) eye\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*r(?:ight|.) eye\s{7}(.*)
     action remove ^(?!.*\(tended\))\s*(skin)\s{7}(.*)
     action remove (lodged\s*.*|mite|leech) (into|in|on) your head
     action remove (lodged\s*.*|mite|leech) (into|in|on) your neck
     action remove (lodged\s*.*|mite|leech) (into|in|on) your chest
     action remove (lodged\s*.*|mite|leech) (into|in|on) your abdomen
     action remove (lodged\s*.*|mite|leech) (into|in|on) your back
     action remove (lodged\s*.*|mite|leech) (into|in|on) your right arm
     action remove (lodged\s*.*|mite|leech) (into|in|on) your left arm
     action remove (lodged\s*.*|mite|leech) (into|in|on) your right leg
     action remove (lodged\s*.*|mite|leech) (into|in|on) your left leg
     action remove (lodged\s*.*|mite|leech) (into|in|on) your right hand
     action remove (lodged\s*.*|mite|leech) (into|in|on) your left hand
     action remove (lodged\s*.*|mite|leech) (into|in|on) your left eye
     action remove (lodged\s*.*|mite|leech) (into|in|on) your right eye
     action remove ^You have no significant injuries\.
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
     matchre STAND_RETURN ^You are a ghost\!
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
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
     var randomloop 0
     var moved 1
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RESUME ^\.\.\.wait|^Sorry\,|^Please wait\.
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
     matchwait
MOVE_STAND:
     pause 0.1
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait
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
     matchwait
MOVE_DIG:
     pause 0.1
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait
MOVE_DIG_STAND:
     pause 0.1
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait
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
     if matchre("$roomobjs","corn maze pass") then gosub verb stow pass
     if matchre("$roomobjs","passes") then gosub verb stow pass
     return
     
AUTOMOVE:
     delay 0.0001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub MOVERANDOM
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.001
     pause 0.1
     pause 0.001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     put #goto %Destination
     matchwait 5
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 8
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     pause 0.1
     pause 0.1
     pause 0.1
     pause 0.001
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait
AUTOMOVE_FAILED:
     pause 0.001
     # put #script abort automapper
     pause 0.2
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     pause 0.1
     put look
     pause 0.5
     pause 0.2
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub RANDOMMOVE
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     var moved 0
     put #echo
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     return
AUTOMOVE_RETURN:
     action (moving) off
     pause 0.001
     if matchre("$roomobjs","corn maze pass") then gosub verb stow pass
     if matchre("$roomobjs","passes") then gosub verb stow pass
     pause 0.001
     return

MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
     if (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then gosub TRUE_RANDOM
     if (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then gosub TRUE_RANDOM
     if $east then
          {
               gosub MOVE east
               return
          }
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
     pause 0.0001
     var moved 0
     var moving 0
     math randomloop add 1
     if (%randomloop > 4) then 
          {
               var lastmoved null
               var randomloop 0
          }
     random 1 16
     if ((%r = 1) && ($north) && ("%lastmoved" != "s")) then gosub MOVE n
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "sw")) then gosub MOVE ne
     if ((%r = 3) && ($east) && ("%lastmoved" != "w")) then gosub MOVE e
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "se")) then gosub MOVE nw
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "nw")) then gosub MOVE se
     if ((%r = 6) && ($south) && ("%lastmoved" != "n")) then gosub MOVE s
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "ne")) then gosub MOVE sw
     if ((%r = 8) && ($west) && ("%lastmoved" != "e")) then gosub MOVE w
     if (%r = 9) && ($out) then gosub MOVE out
     if (%r = 10) && matchre("$roomobjs","\bdoor\b") && ("%lastmoved" != "go door") then gosub MOVE go door
     if (%r = 11) && matchre("$roomobjs","\bgate\b") && ("%lastmoved" != "go gate") then gosub MOVE go gate
     if (%r = 12) && matchre("$roomobjs","\barch\b") && ("%lastmoved" != "go arch") then gosub MOVE go arch
     if (%r = 13) && matchre("$roomobjs","\bportal\b") && ("%lastmoved" != "go portal") then gosub MOVE go portal
     if (%r = 14) && matchre("$roomobjs","\btunnel\b") && ("%lastmoved" != "go tunnel") then gosub MOVE go tunnel
     if (%r = 15) && matchre("$roomobjs","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair") then gosub MOVE climb stair
     if (%r = 16) && matchre("$roomobjs","\bpanel\b") && ("%lastmoved" != "go panel") then gosub MOVE go panel
     if (%moved = 0) && (%randomloop < 4) then goto RANDOMMOVE
     if ($roomid = 0) && (%randomloop < 18) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return