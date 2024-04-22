#### MASTER UTILITY SUBS BY PELIC 
#### SHROOM'S VERSION
#### Version 7.0
#### Last Update: Nov 18, 2022
##########################################
## THIS SCRIPT IS JUST USED AS A BASE INCLUDE FOR COMMON SUBS
### YOU DO NOT HAVE TO SET OR USE THESE VARIABLES - THIS WAS JUST USED FOR TESTING PURPOSES
     if ("$charactername" = "Shroom") then
          {
               # Steal from XING or LETH?
               var stealing SHARD
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container backpack
               var boxstore vortex
               var sheathcontainer archeologist's toolbelt
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH %sheathcontainer
          }
     if "$charactername" = "Raidboss" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container lootsack
               var boxstore bottomless bag
               var sheathcontainer hip pouch
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH  %sheathcontainer
          }
     if "$charactername" = "Healbitch" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container haversack
               var boxstore backpack
               var sheathcontainer hip pouch
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH  %sheathcontainer
          }
     if "$charactername" = "Fuku" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container haversack
               var boxstore backpack
               var sheathcontainer hip pouch
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH  %sheathcontainer
          }
     if "$charactername" = "Illuminati" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container haversack
               var boxstore backpack
               var sheathcontainer hip pouch
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH %sheathcontainer
          }
     if "$charactername" = "Hashish" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container carryall
               var boxstore duffel bag
               var sheathcontainer oilcloth bag
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH  %sheathcontainer
          }
     if "$charactername" = "Hvinir" then
          {
               # Steal from XING or LETH?
               var stealing LETH
               # Log window to use
               put #tvar Log Log
               # Container variables
               var container carryall
               var boxstore duffel bag
               var sheathcontainer oilcloth bag
               var DEFAULT.CONTAINER %container
               var BOX.CONTAINER %boxstore
               var SHEATH  %sheathcontainer
          }
var skinables \b(antenna|ashu'a|barb|beak|(?<!divination )bones?|bristle|carapace|clay strip|catgut|pelt|claw|collarbone|ear|(?<!golden )eye|eyeball|(?<!curving )fang|feather|foreclaw|foreleg|(?<!iron |Iron )fragment|furry tuft|gland|hair|(?<!verdant )heart|(?<!wrapped in lava-drake )hide|hoof|horn(?! (crossbow|bow|latchbow|sling))|(?<!capped with a viciously sharp warklin )impaler|mandible|milk-tooth|mosshair|paw|pseudopod|quill|remnant|rib|sac|scale|scalp|shell|skin|sliver|(?<!book |along the )spine|spinneret|stinger|tail(?!brush|band)|talon|tentacle|toenail|tongue|(?<!angiswaerd |ivory )tooth|tusk|tusks|vertebra|(?<!wyvern )wing|(?<!farmer's )hand)\b
var skins malchata rib|scale|barb|claw
var retry.command.triggers ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,|^You are still stunned|^You don't seem to be able to move to do that|^You can't do that while entangled in a web|^You struggle against the shadowy webs to no avail\.|^You struggle with .* great weight but can't quite lift it\!|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!|You notice a single flea leap off of your|Something tickles under your arm|Several fleas the size of rice-grains swarm|Your feet are suddenly consumed by the painful biting|A tremendous itching begins|A slight tickle precedes a painful itch
var boxtype brass|copper|deobar|driftwood|iron|ironwood|mahogany|oaken|pine|steel|wooden
var boxes coffer|crate|strongbox|caddy|casket|skippet|trunk|chest
put #var sellGems 0
goto endof

DEATH.ACTIONS:
DEATH.DEACTIVATE:
action clear
return

CLEARHANDS:
     delay 0.0005
     # debuglevel 10
     if matchre("$righthand $lefthand", "%ALLWEAPONS") then if !matchre("%WEAPON", "$charactername|NULL") then gosub SHEATH
     if matchre("$righthand $lefthand", "$SBWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$LBWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$THBWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$SEWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$LEWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$THEWEAPON") then gosub SHEATH
     if matchre("$righthand $lefthand", "$HTWEAPON") then gosub STOW my $HTWEAPON
     if matchre("$righthand $lefthand", "$LTWEAPON") then gosub STOW my $LTWEAPON
     if matchre("$righthand $lefthand", "$RANGED.BOW") then
          {
               gosub UNLOAD
               gosub WEAR $RANGED.BOW
          }
     if matchre("$righthand $lefthand", "$RANGED.BOW") then gosub STOW $RANGED.BOW
     if matchre("$righthand $lefthand", "$RANGED.SLINGS") then
          {
               gosub UNLOAD
               gosub WEAR $RANGED.SLINGS
          }
     if matchre("$righthand $lefthand", "$RANGED.SLINGS") then gosub STOW $RANGED.SLINGS
     if matchre("$righthand $lefthand", "$RANGED.CROSSBOW") then
          {
               gosub UNLOAD
               gosub WEAR $RANGED.CROSSBOW
          }
     if matchre("$righthand $lefthand", "$RANGED.CROSSBOW") then gosub STOW $RANGED.CROSSBOW
     if matchre("$righthand $lefthand", "$POLEARMS") then gosub WEAR $POLEARMS
     if matchre("$righthand $lefthand", "$POLEARMS") then gosub STOW $POLEARMS
     if matchre("$righthand $lefthand", "$STAVES") then gosub WEAR $STAVES
     if matchre("$righthand $lefthand", "$STAVES") then gosub STOW $STAVES
     if matchre("$righthand $lefthand", "$varshield") then gosub WEAR $varshield
     if matchre("$roomobjs" , "%ALLWEAPONS") then gosub STOW $1
     if matchre("$roomobjs" , "$LTWEAPON") then gosub STOW $LTWEAPON
     if matchre("$roomobjs" , "$HTWEAPON") then gosub STOW $HTWEAPON
     if matchre("$roomobjs" , "%MAINARROW") then gosub STOW %MAINARROW
     if matchre("$roomobjs" , "%MAINARROW") then gosub STOW %MAINARROW
     if matchre("$roomobjs" , "%MAINARROW") then gosub STOW %MAINARROW
     if matchre("$roomobjs" , "%MAINARROW") then gosub STOW %MAINARROW
     if ("$lefthand" != "Empty") then gosub STOW left
     # debuglevel 0
     return
#### EMPTY HANDS SUB
EMPTY_HANDS:
     delay 0.0001
     if ("$lefthand" != "Empty") then gosub STOW my $lefthandnoun
     if ("$righthand" != "Empty") then gosub STOW my $righthandnoun
     return
#### EMPTY LEFT HAND
EMPTY_LEFT:
     delay 0.0001
     var LOCATION EMPTY_LEFT_1
     EMPTY_LEFT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
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
     matchwait
#### EMPTY RIGHT HAND
EMPTY_RIGHT:
     delay 0.0001
     var LOCATION EMPTY_RIGHT_1
     EMPTY_RIGHT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
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
     matchwait
### ORDERING SUB, FOR SHOPS
ORDER:
     delay 0.0001
     var order $0
     var LOCATION ORDER_1
     gosub stowing
     ORDER_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre ORDER_1 ^The attendant says\,\s*\"You can purchase .*\.\s*Just order it again and we'll see it done\!\"
     matchre RETURN ^The attendant takes some coins from you and hands you .*\.
     send order %order
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ORDER! (utility.inc) ***
     put #echo >$Log Crimson $datetime Order = %order
     put #log $datetime MISSING MATCH IN ORDER! (utility.inc)
     return
PUT:
     var putaction $0
     var LOCATION PUT_1
     PUT_1:
     matchre PUT_1 ^\.\.\.wait|^Sorry,|^You are still stunned\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You can't pick that up with your hands that damaged\.|^Both your hands are missing\!
     matchre PUT_UNTIE ^You should untie
     matchre PUT_ROLL_IT ^You should roll it up
     matchre PUT_STOW ^You need a free hand|^Free one of your hands|^That will be hard with both your hands full\!
     matchre PUT_STAND ^You should stand up first\.|^Maybe you should stand up\.
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN (^You'?r?e?|^As|^With|^Using).*(?:\.|\!|\?)?
     matchre RETURN (You'?r?e?|As|With|Using) (?:accept|adeptly|add|adjust|allow|already|are|aren't|ask|cut|attach|attempt|.+ to|.+ fan|bash|begin|bend|blow|breathe|briefly|bring|bundle|cannot|can't|carefully|cautiously|chop|circle|clasp|close|collect|collector's|corruption|count|combine|come|dance|decide|dodge|don't|drum|draw|effortlessly|eyes|gracefully|deftly|desire|detach|drop|drape|exhale|fade|fail|fake|feel(?! fully rested)|feint|fill|find|filter|focus|form|fumble|gaze|gesture|giggle|gingerly|get|glance|grab|hand|hang|have|icesteel|inhale|insert|kiss|kneel|knock|leap|lean|let|lose|lift|loosen|lob|load|move|must|mutter|mind|not|now|need|offer|open|parry|place|pick|push|pout|pour|put|pull|prepare|press|quietly|quickly|raise|read|reach|ready|realize|recall|remain|release|remove|retreat|reverently|rock|roll|rub|scan|search|secure|sense|set|sheathe|shield|should|shouldn't|shove|silently|sit|skin|slide|sling|slip|slow|slowly|spin|spread|sprinkle|start|stop|strap|struggle|swiftly|swing|switch|tap|take|the|though|tie|tilt|toss|trace|try|tug|turn|twist|unload|untie|vigorously|wave|wear|weave|whisper|whistle|will|wink|wring|work|yank|you|zills) .*(?:\.|\!|\?)?
     matchre RETURN ^Brother Durantine|^Durantine|^Mags|^Ylono|^Malik|^Kilam|^Ragge|^Randal|^Catrox|^Kamze|^Unspiek|^Wyla|^Ladar|^Dagul|^Granzer|^Gemsmith|^Fekoeti|^Diwitt|(?:An|The|A) attendant|^The clerk|A Dwarven|^.*He says,
     matchre RETURN ^The(.*)?(clerk|teller|attendant|mortar|pestle|tongs|bowl|riffler|hammer|gem|book|page|lockpick|sconce|voice|waters|contours|person|is|has|are|slides|fades|hinges|spell|not)
     matchre RETURN ^It('s)?(?:'s|a|and|the)?\s+?(?:would|will|is|a|already|dead|keen|practiced|graceful|stealthy|resounding|full|has)
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime|\[Roundtime
     matchre RETURN ^That('s)?\s+?(?:is|has|was|a|cannot|area|can't|won't|would|already|tool|will|cost|too)
     matchre RETURN ^With(?: (a|and|the))?\s+?(?:keen|practiced|graceful|stealthy|resounding)
     matchre RETURN ^This (is a .+ spell|is an exclusive|spell|ritual)
     matchre RETURN ^The .*(is|has|are|slides|fades|hinges|spell|not|vines|antique|(.+) spider|pattern)
     matchre RETURN ^There('s)?\s+?(?:is(n't)?|does(n't)?|already|no|not)
     matchre RETURN ^But (?:that|you|you're|you've|the)
     matchre RETURN ^Obvious (?:exits|paths)
     matchre RETURN ^There's no room|any more room|no matter how you arrange|have all been used\.
     matchre RETURN ^That's too heavy|too thick|too long|too wide|not designed to carry|cannot hold any more
     matchre RETURN ^(You|I) can't|^Tie what\?|^You just can't|As you attempt to place your
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     matchre RETURN ^Brushing your fingers|^Sensing your intent|^Quietly touching your lips
     matchre RETURN Lucky for you\!\s*That isn't damaged\!|I will not repair something that isn't broken\.
     matchre RETURN I'm sorry, but I don't work on those|There isn't a scratch on that, and I'm not one to rob you\.
     matchre RETURN I don't work on those here\.|I don't repair those here|Please don't lose this ticket\!
     matchre RETURN ^Please rephrase that command\.|^I could not find|^Perhaps you should|^I don't|^Weirdly,|That can't
     matchre RETURN \[You're|\[This is|too injured
     matchre RETURN ^Moving|Brushing|Recalling|Unaware
     matchre RETURN ^.*\[Praying for \d+ sec\.\]
     matchre RETURN ^.+ is not in need|^That is closed\.
     matchre RETURN ^What (?:were you|is it)
     matchre RETURN ^In the name of love\?|^Play on|^(.+) what\?
     matchre RETURN ^It's kind of wet out here\.
     matchre RETURN ^Some (?:polished|people|tarnished|.* zills)
     matchre RETURN ^(\S+) has accepted
     matchre RETURN ^Subservient type|^The shadows|^Close examination|^Try though
     matchre RETURN ^USAGE\:|^Using your|^You.*analyze
     matchre RETURN ^Allows a Moon Mage|^Smoking commands are
     matchre RETURN ^A (?:slit|pair|shadow) .*(?:\.|\!|\?)?
     matchre RETURN ^Your (?:actions|dance|nerves) .*(?:\.|\!|\?)?
     matchre RETURN ^Having no further use for .*, you discard it\.
     matchre RETURN ^After a moment, .*\.
     matchre RETURN ^.* (?:is|are) not in need of cleaning\.
     matchre RETURN \[Type INVENTORY HELP for more options\]|\[Use INVENTORY HELP for more options\.\]
     matchre RETURN ^A vortex|^A chance for|^In a flash|^It is locked|^An aftershock
     matchre RETURN ^In the .* you see .*\.
     matchre RETURN .* (?:Dokoras|Kronars|Lirums)
     matchre RETURN ^You will now store .* in your .*\.
     matchre RETURN ^\[Ingredients can be added by using ASSEMBLE Ingredient1 WITH Ingredient2\]
     matchre RETURN ^\s\*LINK ALL CANCEL\s\*- Breaks all links
     matchre RETURN ^Stalking is an inherently stealthy endeavor, try being out of sight\.
     matchre RETURN ^You're already stalking|^There aren't any
     matchre RETURN ^An offer|shakes (his|her) head
     matchre RETURN ^Tie it off when it's empty\?
     matchre RETURN ^But the merchant can't see you|are invisible
     matchre RETURN Page|^As the world|^Obvious|^A ravenous energy
     matchre RETURN ^In the|^The attendant|^That is already open\.|^Your inner
     matchre RETURN ^(.+) hands you|^Searching methodically|^But you haven't prepared a symbiosis\!
     matchre RETURN ^Illustrations of complex,|^It is labeled|^Your nerves
     matchre RETURN ^The lockpick|^Doing that|is not required to continue crafting
     matchre RETURN ^Without (any|a|the)|^Wouldn't (it|that|you)
     matchre RETURN ^Weirdly, you can't manage
     matchre RETURN ^Hold hands with whom\?
     matchre RETURN ^Something in the area interferes
     matchre RETURN ^With a .+ to your voice,
     matchre RETURN ^Turning your focus solemnly inward
     matchre RETURN ^Slow, rich tones form a somber introduction
     matchre RETURN ^Images of streaking stars falling from the heavens
     matchre RETURN ^Strangely, you don't feel like fighting right now\.
     matchre RETURN ^With .* movements you prepare your body for the .* spell\.
     matchre RETURN ^A strong wind swirls around you as you prepare the .* spell\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre RETURN ^Shadow and light collide wildly around you as you prepare the .* spell\.
     matchre RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre RETURN ^A soft breeze surrounds your body as you confidently prepare the .* spell\.
     matchre RETURN ^Light withdraws from around you as you speak arcane words for the .* spell\.
     matchre RETURN ^Tiny tendrils of lightning jolt between your hands as you prepare the .* spell\.
     matchre RETURN ^Low, hummed tones form a soft backdrop for the opening notes of the .* enchante\.
     matchre RETURN ^Heatless orange flames blaze between your fingertips as you prepare the .* spell\.
     matchre RETURN ^Throwing your head back, you release a savage roar and growl words for the .* spell\.
     matchre RETURN ^Entering a trance-like state, your hands begin to tremble as you prepare the .* spell\.
     matchre RETURN ^Glowing geometric patterns arc between your upturned palms as you prepare the .* spell\.
     matchre RETURN ^Focusing intently, you slice seven straight lines through the air as you invoke the .* spell.\.
     matchre RETURN ^Accompanied with a flash of light, you clap your hands sharply together in preparation of the .* spell\.
     matchre RETURN ^Icy blue frost crackles up your arms with the ferocity of a blizzard as you begin to prepare the .* spell\!
     matchre RETURN ^A radiant glow wreathes your hands as you weave lines of light into the complicated pattern of the .* spell\.
     matchre RETURN ^Kaleidoscopic ribbons of light swirl between your outstretched hands, coalescing into a spectral wildling spider\.
     matchre RETURN ^Darkly gleaming motes of sanguine light swirl briefly about your fingertips as you gesture while uttering the .* spell\.
     matchre RETURN ^As you begin to solemnly intone the .* spell a blue glow swirls about forming a nimbus that surrounds your entire being\.
     matchre RETURN ^As you slam your fists together and inhale sharply, a glowing outline begins to form and a matrix of blue and white motes surround you\.
     matchre RETURN ^In one fluid motion, you bring your palms close together and a fiery crimson mist begins to burn within them as you prepare the .* spell\.
     matchre RETURN ^The first gentle notes of .* waft from you with delicate ease, riddled with low tones that gradually give way to a higher\-pitched theme\.
     matchre RETURN ^Droplets of water coalesce around your fingertips as your arms undulate like gracefully flowing river currents to form the pattern of the .* spell\.
     matchre RETURN ^Inhaling deeply, you adopt a cyclical rhythm in your breaths to reflect the ebb and flow of the natural world and steel yourself to prepare the .* spell\.
     matchre RETURN ^Calmly reaching out with one hand, a silvery-blue beam of light descends from the sky to fill your upturned palm with radiance as you prepare the .* spell\.
     matchre RETURN ^Turning your head slightly and gazing directly ahead with a calculating stare, tiny sparks of crystalline light flash around your eyes as you prepare the .* spell\.
     matchre RETURN ^You take up a handful of dirt in your palm to prepare the .* spell\.  As you whisper arcane words, you gently blow the dust away and watch as it becomes swirling motes of glittering light that veil your hands in a pale aura\.
     send %putaction
     matchwait 20
     echo * MISSING MATCH IN PUT! ***
     put #echo >Log Crimson *** MISSING MATCH IN PUT! (%scriptname.cmd) ***
     put #echo >Log Crimson Command = %putaction
     put #log $datetime MISSING MATCH IN PUT! Command = %putaction (%scriptname.cmd)
     return
PUT_ROLL_IT:
     delay 0.00001
     put roll my %putaction
     pause 0.4
     goto PUT_1
PUT_UNTIE:
     delay 0.00001
     eval putaction replacere("%putaction", "\bget\b", "")
     eval putaction replacere("%putaction", "\bmy\b", "")
     put untie %putaction
     pause 0.4
     return
PUT_STOW:
     gosub EMPTY_HANDS
     goto PUT_1
PUT_STAND:
     gosub stand
     goto PUT_1
#### DOUBLE PUT SUB
PUT_IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT_IT_1
     PUT_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN (You'?r?e?|As|With) (?:accept|adeptly|add|adjust|allow|already|are|aren't|ask|cut|attach|attempt|.+ to|.+ fan|bash|begin|bend|blow|breathe|briefly|bring|bundle|cannot|can't|carefully|cautiously|chop|circle|clasp|close|collect|collector's|corruption|count|combine|come|dance|decide|dodge|don't|drum|draw|effortlessly|eyes|gracefully|deftly|desire|detach|drop|drape|exhale|fade|fail|fake|feel(?! fully rested)|feint|fill|find|filter|focus|form|fumble|gaze|gesture|giggle|gingerly|get|glance|grab|hand|hang|have|icesteel|inhale|insert|kiss|kneel|knock|leap|lean|let|lose|lift|loosen|lob|load|move|must|mutter|mind|not|now|need|offer|open|parry|place|pick|push|pout|pour|put|pull|prepare|press|quietly|quickly|raise|read|reach|ready|realize|recall|remain|release|remove|retreat|reverently|rock|roll|rub|scan|search|secure|sense|set|sheathe|shield|should|shouldn't|shove|silently|sit|skin|slide|sling|slip|slowly|spin|spread|sprinkle|start|stop|strap|struggle|swiftly|swing|switch|tap|take|the|though|tie|tilt|toss|trace|try|tug|turn|twist|unload|untie|vigorously|wave|wear|weave|whisper|whistle|will|wink|wring|work|yank|you|zills) .*(?:\.|\!|\?)?
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^Without (any|a)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^Perhaps you should be holding that first\.
     matchre RETURN ^.* what\?
     matchre RETURN ^What do you want
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send put %putit
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN PUT_IT! (ubercombat.cmd) ***
     put #echo >Log Crimson  PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT_IT (ubercombat.cmd)
     return
#### GET SUB
GET_IT:
     delay 0.0001
     var todo $0
     var LOCATION GET_IT_1
     GET_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?|Brushing
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre UNTIE_IT ^You should untie
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.+ to|.+ fan|can't|leap|tug|quickly|dance|gracefully|reverently|breathe|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|tap|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|detach|unload|briefly|zills|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN ^The .* (is|are|slides|decays)
     matchre RETURN ^Without (any|a)|Brushing|^Please rephrase
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     if ($UC_Bonded = 1) then
          {
               put invoke
               pause 0.2
               pause 0.1
               if !matchre("$righthand|$lefthand", "%todo") then put get %todo
               return
          }
     else send get %todo
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN GET_IT! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN GET_IT (ubercombat.cmd)
     return
#### UNTIE SUB
UNTIE_IT:
     delay 0.0001
     var LOCATION UNTIE_IT
     UNTIE_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?|Brushing
     matchre RETURN ^Untie what\?
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully rested)|read|reach|gingerly|come|effortlessly|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     send untie %todo
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN UNTIE! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN UNTIE (ubercombat.cmd)
     return
#### GET SUB
GET:
     delay 0.0001
     pause 0.1
     var todo $0
     var LOCATION GET1
     GET1:
     if ($standing = 0) then gosub STAND
     pause 0.1
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?|Brushing
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre UNTIE_IT ^You should untie
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|might|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully (rested|prepared))|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^Without (any|a)|Brushing
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     send get %todo
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN GET! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN GET (ubercombat.cmd)
     return
GET2:
     delay 0.0001
     pause 0.1
     var LOCATION GET3
     GET3:
     if ($standing = 0) then gosub STAND
     pause 0.1
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre HOLD_1 ^But that is already in your inventory\.
     matchre RETURN ^Get what\?|Brushing
     matchre RETURN ^You carefully remove .* from the bundle\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^What do you want
     matchre UNTIE_IT ^You should untie
     matchre RETURN You'?r?e? (?:hand|slip|put|get|.* to|can't|might|quickly|switch|deftly|swiftly|untie|sheathe|strap|slide|desire|raise|sling|pull|drum|trace|wear|tap|recall|press|hang|gesture|push|move|whisper|lean|tilt|cannot|mind|drop|drape|loosen|work|lob|spread|not|fill|will|now|slowly|quickly|spin|filter|need|shouldn't|pour|blow|twist|struggle|place|knock|toss|set|add|search|circle|fake|weave|shove|try|must|wave|sit|fail|turn|already|can\'t|glance|bend|swing|chop|bash|dodge|feint|draw|parry|carefully|quietly|sense|begin|rub|sprinkle|stop|combine|take|decide|insert|lift|retreat|load|fumble|exhale|yank|allow|have|are|wring|icesteel|scan|vigorously|adjust|bundle|ask|form|lose|remove|accept|pick|silently|realize|open|grab|fade|offer|aren't|kneel|don\'t|close|let|find|attempt|tie|roll|attach|feel(?! fully (rested|prepared))|read|reach|gingerly|come|corruption|count|secure|unload|remain|release|shield) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     matchre RETURN ^The .* (is|are|slides)
     matchre RETURN ^Without (any|a)|Brushing
     matchre RETURN suddenly leaps toward you|and flies towards you|with a flick
     send get %todo from my portal
     matchwait 20
     put #echo >Log Crimson  *** MISSING MATCH IN GET! (ubercombat.cmd) ***
     put #echo >Log Crimson  Get = %todo
     put #log $datetime MISSING MATCH IN GET (ubercombat.cmd)
     return
#### HOLD SUB
HOLD:
     delay 0.0001
     var todo $0
     var LOCATION HOLD_1
     HOLD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:get|sling|slide|slip|work|loosen|take|pull|remove|grab|pick|pull|push|twist|carefully|are|loosen) .*(?:\.|\!|\?)?
     matchre RETURN ^Get what\?
     matchre RETURN ^Hold hands with whom\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^I could not find what you were referring to\.
     send hold %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (utility.inc) ***
     put #echo >$Log Crimson $datetime Get = %todo
     put #log $datetime MISSING MATCH IN HOLD (utility.inc)
     return
REM:
REMOVE:
     var LOCATION REMOVE_1
     var todo $0
     REMOVE_1:
     matchre RETURN ^You take
     matchre RETURN ^You slide
     matchre RETURN ^You sling
     matchre RETURN ^You slip
     matchre RETURN ^Roundtime
     matchre RETURN ^You remove
     matchre RETURN ^You pull off
     matchre RETURN ^You pull your
     matchre RETURN ^Remove what\?
     matchre RETURN ^You count out
     matchre RETURN ^You work your way out of
     matchre RETURN ^You aren't wearing
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You loosen the straps securing
     put remove %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN REMOVE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Remove = %todo
     put #log $datetime MISSING MATCH IN Remove (utility.inc)
     RETURN
###############################################################################################################################
#SEARCHES THE GROUND FOR AMMO / WEAPONS / ARMOR
stowAmmo:
     delay 0.001
     #gosub BLEEDERCHECK
     if !matchre($righthand|$lefthand, "Empty") then gosub EMPTY_HANDS
     if contains("$righthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$lefthand" != "Empty") then gosub wear my $1
     if contains("$lefthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$righthand" != "Empty") then gosub wear my $1
     if contains("$roomobjs","(double-stringed crossbow|repeating crossbow|bloodwood dako'gi crossbow|forester's crossbow|bamboo crossbow|forester's bow|battle bow|assassin's crossbow") then gosub stow $1
     if contains("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then gosub STOWARROW
     if contains("$roomobjs","(river rock|river rocks|small rock|spider-carved rock)") then gosub STOWROCK
     if contains("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|drake-fang bolt|jagged-horn bolt|leafhead bolt|barbed bolt|crossbow bolt)") then gosub STOWBOLT
     if matchre("$roomobjs","throwing blade") then gosub STOWBLADE
     if matchre("$roomobjs","telothian bola") then gosub STOW bola
     if matchre("$roomobjs","silver-edged star") then gosub STOWSTARS
     if matchre("$roomobjs","quartzite stone shard") then gosub STOW shard
     if matchre("$roomobjs","(ironwood shield|wooden shield)") then gosub stow $1
     if matchre("$roomobjs","(elongated stones|granite stone|panther-carved stone|goblin-carved stones|unicorn-carved stone)") then gosub stow stone
     if matchre("$roomobjs","(pyrite clump|smoky-quartz clump)") then gosub stow clump
     if matchre("$roomobjs","sleek quadrello") then gosub stow quadrello
     if matchre("$roomobjs","small shield|azure-scale shield") then gosub stow shield
     if matchre("$roomobjs","stones") then gosub stow stones
     if matchre("$roomobjs","hand claws") then gosub stow hand claw
     if matchre("$roomobjs","T'Kashi mirror flamberge") then gosub stow mirror flamberge
     if matchre("$roomobjs","T'Kashi mirror flail") then gosub stow mirror flail
     if matchre("$roomobjs","mirror blade") then gosub stow mirror blade
     if matchre("$roomobjs","mirror knife") then gosub stow mirror knife
     if matchre("$roomobjs","Nisha short bow") then gosub stow nisha bow
     if matchre("$roomobjs","razor-sharp damascus steel sabre") then gosub stow sabre
     if matchre("$roomobjs","glaes and kertig-alloy katana capped with an ornate dragonfire amber pommel") then gosub stow katana
     if !matchre("$roomobjs","(mirror axe|stonebow|pasabas|briquet|battle bow|akabo|mallet|throwing spike|steel scimitar|thrusting blade|flail|kneecapper|spear|hammer|throwing hammer|bone club|javelin|tago|staff sling|bludgeon|quarrel|short bow|\btelo\b|flamberge|flail|nightstick|khuj|iltesh|ngalio|hirdu bow|halberd|mirror blade|katana|morning star|war club|shadowy-black sling|staff sling|mattock|leathers|balaclava|helmet|helm|gauntlets|mail gloves|sniper's crossbow|light crossbow|targe\b|great helm|throwing axe|throwing club|bastard sword|jambiya|katar|throwing blade|composite bow|bola|short bow)") then RETURN
     gosub stow $1
     pause 0.1
     goto stowAmmo
STOWSTARS:
     delay 0.001
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","silver-edged star") then 
          {
               send stow star
               send stow star
               waitforre ^You|^I|^What|^Sorry|^Stow|...wait
          }
     pause 0.1
     pause 0.1
     pause 0.001
     if contains("$roomobjs","silver-edged star") then goto STOWSTARS
     RETURN
STOWBLADE:
     delay 0.001
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","throwing blade") then 
          {
               send stow throwing blade
               send stow throwing blade
               waitforre ^You|^I|^What|^Sorry|^Stow|...wait
          }
     pause 0.1
     pause 0.1
     pause 0.001
     if contains("$roomobjs","throwing blade") then goto stowblade
     RETURN
STOWARROW:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then 
          {
               gosub stow $1
               gosub stow $1
          }
     pause 0.1
     pause 0.1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then goto stowarrow
     RETURN
STOWBOLT:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt)") then
          {
               gosub stow $1
               gosub stow $1
          }
     pause 0.1
     pause 0.1
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt)") then goto STOWBOLT
     RETURN
STOWROCK:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","a small rock") then 
          {
               put stow small rock
               put stow small rock
          }
     pause 0.1
     pause 0.1
     if contains("$roomobjs","a small rock") then goto STOWROCK
     RETURN

#### MAIN STOW ROUTINE
STOWING:
     delay 0.0001
     var LOCATION STOWING
     if matchre("$righthandnoun|$lefthandnoun", "zills") then put wear my zill
     if matchre("$righthand","(grass|braided grass)") then put drop my grass
     if matchre("$lefthand","(grass|braided grass)") then put drop my grass
     if matchre("$righthand","(vine|braided vine)") then put drop my vine
     if matchre("$lefthand","(vine|braided vine)") then put drop my vine
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     #if matchre("$righthandnoun","(crossbow|bow|short bow)") then gosub unload
     if matchre("$righthandnoun","(block|granite block)") then put drop block
     if matchre("$lefthandnoun","(block|granite block)") then put drop block
     if matchre("$righthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN
STOW:
     var LOCATION STOW_1
     var todo $0
STOW_1:
     delay 0.0001
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW_2 not designed to carry anything|any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|^But that's closed|I can't find your container|^You can't 
     matchre RETURN ^Wear what\?|^Stow what\?  Type 'STOW HELP' for details\.
     matchre RETURN ^You put
     matchre RETURN ^You open
     matchre RETURN needs to be
     matchre RETURN ^You stop as you realize
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^That can't be picked up
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW (utility.inc)
STOW_2:
     delay 0.0001
     var LOCATION STOW_2
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre STOW_3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %container
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW2! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW2 (utility.inc)
STOW_3:
     delay 0.0001
     var LOCATION STOW_3
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre STOW_4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %boxstore
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW3! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (utility.inc)
STOW_4:
     delay 0.0001
     var LOCATION STOW_4
     var bagsFull 1
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre OPEN_THING ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your
     matchre RETURN ^But that is already in your inventory\.
     matchre RETURN ^You stop as you realize
     matchre REM_WEAR any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %sheathcontainer
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW4! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW4 (utility.inc)
OPEN_THING:
     pause 0.1
     send open %boxstore
     send open %container
     pause 0.5
     goto STOWING
REM_WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto WEAR_1
#### WEAR SUB
WEAR:
     delay 0.0001
     var todo $0
     var LOCATION WEAR_1
     WEAR_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW_1 ^You can't wear that\!
     matchre STOW_1 ^You can't wear any more items like that\.
     matchre STOW_1 ^You need at least one free hand for that\.
     matchre STOW_1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|drape|slide|slip|attach|work|strap|hang|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (utility.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN WEAR (utility.inc)
     return
################################################################################################
### HUNTING SCRIPT WEAPON CONTROL - SORT GOSUB
### SORTS WEAPONS BY SKILL LEVEL - TRAINS LOWEST TO HIGHEST
### USAGE:
### var skills Medium_Edged|Heavy_Edged|Long_Bow
### var count 3
### gosub sort %skills %count
### echo %sort
SORT:
     var items $1
     var count $2
     math count subtract 1
     var i 0
     if %count < 1 then var count 16
SORT.I:
     var j %i
     math j add 1
SORT.J:
     if $%items(%j).Ranks < $%items(%i).Ranks or ($%items(%j).Ranks = $%items(%i).Ranks and $%items(%j).LearningRate < $%items(%i).LearningRate) then
     {
          var itemi %items(%i)
          var itemj %items(%j)
          eval items replace("%items", "%items(%i)", "temp2")
          eval items replace("%items", "%items(%j)", "temp1")
          eval items replace("%items", "temp1", "%itemi")
          eval items replace("%items", "temp2", "%itemj")
     }
     math j add 1
     if %j <= %count then goto SORT.J
     math i add 1
     if %i < %count then goto SORT.I
     var sort %items
     return
SORT2:
skillcheck1:
     gosub sort %skills %count
     pause .1
     if $%sort(%ix).LearningRate > %maxexp then
          {
               evalmath ix (%ix + 1)
               goto skillcheck1
          }
     if $%sort(%ix).LearningRate < %globalexp then
          {
               if "%sort(%ix)" = "%priorskill" then
                    {
                         evalmath ix (%ix + 1)
                         goto skillcheck1
                    }
     #gosub %sort(%ix)
     var priorskill %sort(%ix)
     evalmath i (%ix + 1)
     #put .hunter multi %%sort(%ix)
     return
          }
     if %ix != %countskills then
          {
               evalmath ix (%ix + 1)
               var ix 1
               goto skillcheck1
          }
     if %ix = %countskills then
          {
               evalmath ix (%ix + 1)
               var ix 16
               goto skillcheck1
          }
     return
#### DUMPS TRASH SUB
EMPTY.PACK.CHECK:
     var bag $0
     pause 0.0001
     echo *** EMPTYING %bag 
     var contents null
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.|^You rummage
     action remove ^In the .* you see (.*)\.|^You rummage through .+ and see (.*)\.
     if "%contents" = "null" then return
     pause 0.0001
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     eval contents replace("%contents"," with a miner's lamp on it",  "")
     eval contents replace("%contents"," with a wax label on it",  "")
     eval contents replace("%contents"," on it",  "")
     var contents |%contents|
     eval total count("%contents", "|")
BAG.EMPTY.Loop:
     pause 0.1
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub BAG.EMPTY.RemoveLoop
     action setvariable item $1 when ^@(?:an?|some).* (\S+)$
     put #parse @%item
     counter set %count
     if matchre("%TRASH", "%item") then gosub BAG.EMPTY.ItemAction
     if contains("%TRASH", "%item") then gosub BAG.EMPTY.ItemAction
     # if contains("%STEAL.LIST", "%contents") then gosub BAG.EMPTY.ItemAction
     # if matchre(("%ALT1|%ALT2|%ALT3|%ALT4|%ALT5|%ALT6|%ALT7|%ALT8|%ALT9"), "%item") then gosub BAG.EMPTY.ItemAction
     # if contains("%STEAL.LIST", "%item") then gosub %BINORPAWN %item
     if "%contents" != "|" then goto BAG.EMPTY.Loop
     return
BAG.EMPTY.RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents" , "|%item|" , "|")
     eval contents replace("%contents" , "||" , "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then return
     goto BAG.EMPTY.RemoveLoop
BAG.EMPTY.ItemAction:
     gosub storeitem %item
     if %c < 1 then return
     goto BAG.EMPTY.ItemAction
storeitem:
     counter subtract 1
     var dumpster NULL
     echo
     echo **** Dumping: %item
     echo
     pause 0.1
     pause 0.2
     gosub GET %item from my %bag
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomobjs", "a bucket of viscous gloop|a waste bucket") then var dumpster bucket
     if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
     if matchre("$roomobjs", "a tree hollow") then var dumpster hollow
     if matchre("$roomobjs", "an oak crate") then var dumpster crate
     if matchre("$roomobjs", "a driftwood log") then var dumpster log
     if matchre("$roomobjs", "a disposal bin|a waste bin|firewood bin") then var dumpster bin
     if matchre("$roomobjs", "ivory urn") then var dumpster urn
     if matchre("$roomobjs", "a waste basket") then var dumpster basket
     if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomname", "^\[Garden Rooftop, Medical Pavilion\]") then var dumpster gutter   
     pause 0.1
     if ("%dumpster" != "NULL") then gosub PUT put %item in %dumpster
     if ("%dumpster" = "NULL") then put drop my %item
     pause 0.2
     pause 0.1
     pause 0.1
     if (%c < 1) then return
     goto storeitem
#####################################
#  THE FALLEN SEACAVES SUBS
###################################
LEAVE.SEACAVE:
LEAVE.SEACAVES:
     if ("$zoneid" = "150") then gosub automove exit
     send go portal
     pause 0.5
     pause 0.1
     RETURN
TO.SEACAVE:
TO.SEACAVES:
GO.SEACAVE:
GO.SEACAVES:
     gosub automove portal
     pause 0.5
     send go meeting portal
     pause 0.5
     pause 0.1
     RETURN
##################################
# BOXES CHECK
DISARM.CHECK:
     pause 0.1
#if matchre("$roomobjs", "%boxes") then goto GET_BOX
BOX.CONTAINER.CHECK:
     pause 0.1
     matchre BOX.CONTAINER.CHECK ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
     matchre BOX.CONTAINER.CHECK2 Encumbrance
     send look in my %DEFAULT.CONTAINER;enc
     matchwait
BOX.CONTAINER.CHECK2:
     pause 0.1
     matchre BOX.CONTAINER.CHECK2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
     matchre BOX.CONTAINER.CHECK3 Encumbrance
     send look in my %BOX.CONTAINER;enc
     matchwait
BOX.CONTAINER.CHECK3:
     pause 0.1
     matchre BOX.CONTAINER.CHECK2 ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
     matchre RETURN Encumbrance
     send look in my %GEM.CONTAINER;enc
     matchwait   
DISARM.ON:
     var BOXES ON
     return
###################################################################################
#### COMBAT ATTACK SUBS
ATTACK:
     delay 0.0001
     if ($stamina < 35) then gosub STAMINA_WAIT
     var LOCATION ATTACK_1
     ATTACK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^At what are you trying to .*\?
     matchre RETURN ^You need two hands to wield this weapon\!
     send attack
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ATTACK! (utility.inc) ***
     put #log $datetime MISSING MATCH IN ATTACK (utility.inc)
     goto ATTACK
FEINTLEFTEYE:
     delay 0.0001
     if ($stamina < 35) then gosub STAMINA_WAIT
     var LOCATION FEINTLEFTEYE_1
     FEINTLEFTEYE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^Wouldn't it be better
     matchre RETURN ^At what are you trying to .*\?
     send feint left eye
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN FEINTLEFTEYE! (utility.inc) ***
     put #log $datetime MISSING MATCH IN FEINTLEFTEYE (utility.inc)
     goto FEINTLEFTEYE
BACKSTAB:
BACKSTABING:
	if (!$monstercount) then goto RETURN
     delay 0.0001
     #if ($stamina < 35) then gosub STAMINA_WAIT
     var LOCATION BACKSTAB_1
	if (!$hidden) then gosub hide
	pause 0.4
     pause 0.2
     BACKSTAB_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
	matchre FEINTLEFTEYE It would help if you were closer to the .*\.
	matchre FEINTLEFTEYE ^You can\'t backstab that\.
     matchre FEINTLEFTEYE ^You can\'t blindside that\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^It's flying
     matchre RETURN ^At what are you trying to .*\?
     send backstab
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN BACKSTAB! (utility.inc) ***
     put #log $datetime MISSING MATCH IN BACKSTAB (utility.inc)
     goto BACKSTAB 
DRAW:
     delay 0.0001
     var LOCATION DRAW_1
     DRAW_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^It's flying
     matchre RETURN ^At what are you trying to .*\?
     send draw
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN DRAW! (utility.inc) ***
     put #log $datetime MISSING MATCH IN DRAW (utility.inc)
     goto DRAW
FEINT:
     delay 0.0001
     pause 0.01
     if ($stamina < 35) then gosub STAMINA_WAIT
     var LOCATION FEINT_1
     FEINT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^It's flying
     matchre RETURN ^At what are you trying to .*\?
     matchre RETURN You're
	send feint
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN FEINT! (utility.inc) ***
     put #log $datetime MISSING MATCH IN FEINT (utility.inc)
     goto FEINT
CHOP:
     delay 0.0001
     var LOCATION CHOP_1
     CHOP_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You (?:put|must|need|can|turn|aren't|stop|spin|drop|set|are|slip|carefully) .*\.
     matchre RETURN ^It's flying
     matchre RETURN ^At what are you trying to .*\?
     matchre RETURN You're
     send chop
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN CHOP! (utility.inc) ***
     put #log $datetime MISSING MATCH IN CHOP (utility.inc)
     goto DRAW
#### DODGE AND PARRY
DODGE:
     delay 0.0001
     var LOCATION DODGE_1
     DODGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are already dodging\!
     matchre RETURN ^You move into a position to dodge\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     # matchre DODGE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send dodge
     matchwait
PARRY:
     delay 0.0001
     var LOCATION PARRY_1
     PARRY_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You are already in a position to parry\.
     matchre RETURN ^You move into a position to parry\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     # matchre PARRY ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send parry
     matchwait
#### WAIT FOR STAMINA
STAMINA_WAIT:
     delay 0.0001
     put #echo Crimson **************************************************
     put #echo Crimson ***** STAMINA IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson **************************************************
     if ($stamina < 45) then waiteval ($stamina > 80)
     return
#### Swappable Weapon State
SWAPPABLE:
     delay 0.0001
	matchre SWAPPABLE_SETPOSITION ^You .* a (.*)\.
	matchre SWAPPABLE_SETPOSITION ^You .* and (.*)\.
	matchre SWAPPABLE_FAIL You move a .* to your left hand\.
	put swap my $righthandnoun
	matchwait
SWAPPABLE_OPEN:	
     delay 0.0001
	matchre SWAPPABLE_CLOSE Your .* is already open.  Be careful -- it's sharp!
	matchre SWAPPABLE_SETPOSITION You .* to a grip for using your .* as a short staff weapon.
	matchre SWAPPABLE_SETPOSITION You .* easily in your hands and end with it in position to be used as a light edged weapon.
	put open my $righthandnoun
	matchwait
SWAPPABLE_CLOSE:
     delay 0.0001
	matchre SWAPPABLE_OPEN Your thin-bladed fan is already closed.  It'd make a great club.
	matchre SWAPPABLE_SETPOSITION You .* to a grip for using your .* as a short staff weapon.
	matchre SWAPPABLE_SETPOSITION You .* easily in your hands and end with it in position to be used as a light edged weapon.
	put close my $righthandnoun
	matchwait
SWAPPABLE_SETPOSITION:
     delay 0.0001
	var POSITION-DIRECTION $1
	if ("%POSITION-DIRECTION" = "two-handed edged weapon") then put #tvar swappable-state Twohanded_Edged
	if ("%POSITION-DIRECTION" = "heavy edged weapon") then put #tvar swappable-state Large_Edged
	if ("%POSITION-DIRECTION" = "medium edged weapon") then put #tvar swappable-state Small_Edged
	if ("%POSITION-DIRECTION" = "light edged weapon") then put #tvar swappable-state Small_Edged
	if ("%POSITION-DIRECTION" = "light blunt weapon") then put #tvar swappable-state Small_Blunt
	if ("%POSITION-DIRECTION" = "medium blunt weapon") then put #tvar swappable-state Small_Blunt
	if ("%POSITION-DIRECTION" = "heavy blunt weapon") then put #tvar swappable-state Large_Blunt
	if ("%POSITION-DIRECTION" = "two-handed blunt weapon") then put #tvar swappable-state Twohanded_Blunt
	if ("$swappable-state" != "%LEARNING") then goto SWAPPABLE
     return
SWAPPABLE_FAIL:
     delay 0.0001
     put #echo Crimson  Non-swappable Weapon!
     put #echo >$Log Crimson $datetime Non-swappable Weapon!
     put #log $datetime Non-swappable Weapon!
     return
#### RANGED ATTACK SUBS
LOAD:
     delay 0.0001
     if (!$standing) then gosub STAND
     var LOCATION LOAD_1
     LOAD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre AIM ^You reach into your .* to load .*\.
     matchre AIM ^You load .* in your hand\.
     matchre AIM ^.* is already loaded with
     matchre LOAD_RETRIEVE ^You don't have the (?:right|proper) ammunition
     matchre LOAD_RETRIEVE ^As you try to
     matchre LOAD_STOW ^.* in your left hand
     send load
     matchwait
LOAD_STOW:
     delay 0.0001
     gosub STOW left
     goto LOAD
LOAD_RETRIEVE:
     delay 0.0001
     gosub RETRIEVE_CHECK
     put #parse OUT.OF.AMMO!
	echo OUT.OF.AMMO!
     goto LOAD
AIM:
     delay 0.0001
     if (!$standing) then gosub STAND
     if ($hidden) && ("$Guild" = "Paladin") then gosub UNHIDE
     var LOCATION AIM_1
     AIM_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre AIM_WAIT ^You begin to target
     matchre AIM_WAIT ^You are already targetting that\!
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^\[You're .*balanced?\]
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     send aim
     matchwait
AIM_WAIT:
     delay 0.0001
     matchre FIRE ^You think you have your best shot possible now\.
     matchre AIM ^You stop concentrating on aiming your weapon\.
     matchwait
FIRE:
     delay 0.0001
     if (!$standing) then gosub STAND
     var LOCATION FIRE_1
     FIRE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned\.
     matchre WEBBED ^You can't do that while entangled in a web\.
     matchre IMMOBILE ^You don't seem to be able to move to do that
	matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre FIRE_1 ^How can you poach if you are not hidden\?
     matchre RETURN ^You were aiming at a different target\, but you fire anyway\.
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^\[You're .*balanced?\]
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     if ($hidden) then send poach
     else send fire
     matchwait
#### FACING SUBS
FACE:
     delay 0.0001
     gosub FACE_NEXT
     goto ASSESS
FACE_NEXT:
     delay 0.0001
     var LOCATION FACE_NEXT_1
     FACE_NEXT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You turn
     matchre RETURN ^There is nothing else to face\!
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Face what\?
     send face next
     matchwait
#### HUNT SUB
HUNT:
     delay 0.0001
     var LOCATION HUNT_1
     HUNT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You find yourself unable to hunt in this area\.
     matchre RETURN ^You take note of all the tracks in the area\, so that you can hunt anything nearby down\.
     send hunt
     matchwait
##### CRITTER APPRAISAL SUB
# APPRAISE_CRITTER:
     # delay 0.0001
     # var critter NULL
     # if matchre("$monsterlist" , "$KnownMonsters") then var critter $0
     # if ("%critter" = "NULL") then return
     # gosub APPRAISE %critter quick
     # return
##### APPRAISAL SUB
APPRAISE:
     delay 0.0001
     var appraise $0
     var LOCATION APPRAISE_1
     APPRAISE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^It's dead\!
     matchre RETURN ^Appraise what\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You cannot appraise that when you are in combat\!
     matchre RETURN ^You can't determine anything about this creature\.
     matchre RETURN ^It's hard to appraise the .* when it's inside something\.
     matchre RETURN ^Appraise what\?  Type APPRAISE HELP for more information\.
     matchre RETURN ^You ponder that\, briefly\, but decide to let it go for now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send appraise %appraise
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN APPRAISE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Appraise = %appraise
     put #log $datetime MISSING MATCH IN APPRAISE! (utility.inc)
     return
#### HIDING SUB
HIDE:
     delay 0.0001
     var hideCounter 0
     var LOCATION HIDE_1
     HIDE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre HIDE_INCREMENT ^.* notices your attempt to hide\!
     matchre HIDE_INCREMENT ^.* reveals you, ruining your hiding attempt\!
     matchre HIDE_INCREMENT ^.* discovers you, ruining your hiding place\!
     matchre RETURN ^You slip into a hiding
     matchre RETURN ^You melt into the background
     matchre RETURN ^Eh\?  But you're already hidden\!
     matchre RETURN ^You blend in with your surroundings
     send hide
     matchwait
HIDE_INCREMENT:
     delay 0.0001
     math hideCounter add 1
     if %hideCounter > 1 then return
     goto HIDE_1
#### STALKING SUB
STALK:
	delay 0.0001
	var hideCounter 0
	var LOCATION STALK_1
	STALK_1:
     if (%Circle < 50) then put hide
     pause 0.3
     pause 0.1
     pause 0.1
     pause 0.1
     if (($hidden = 0) && (%Circle < 50)) then
     {
          send hide
          pause $roundtime
          pause 0.5
     }
     pause 0.1
     pause 0.001
     matchre STALK_1 ^\.\.\.wait|^Sorry\,
     matchre RETURN Stalk what|Face what|^There is nothing else to face|trying to stalk
     matchre AMBUSH.STALK.FAIL reveals|try being out of sight|discovers you|^You think|^You fail|^Stalking is an inherently
     matchre RETURN ^You move into position|^You are already stalking|^You quickly slip|^You're already stalking
     send stalk
     matchwait 7
	RETURN
AMBUSH.STALK.FAIL:
	delay 0.0001
	math hideCounter add 1
	if %hideCounter > 1 then return
	goto STALK_1
#### UNHIDING SUB
UNHIDE:
     delay 0.0001
     var LOCATION UNHIDE_1
     UNHIDE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^But you are not hidden\!
     matchre RETURN ^You come out of hiding\.
     send unhide
     matchwait
##### STANDING SUB
STAND:
     delay 0.0001
     var LOCATION STAND_1
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre WAIT ^The weight of all your possessions prevents you from standing\.
     matchre WAIT ^You are overburdened and cannot manage to stand\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STAND_RETURN ^You stand (?:back )?up\.
     matchre STAND_RETURN ^You stand up in the water
     matchre STAND_RETURN ^You are already standing\.
     send stand
     matchwait
     STAND_RETURN:
     pause 0.1
     pause 0.1
     if (!$standing) then goto STAND
     return
#### UNLOAD RANGED SUB
UNLOAD:
     delay 0.0001
     var LOCATION UNLOAD_1
     UNLOAD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You unload .*\.
     matchre RETURN ^You stop aiming\.
     matchre RETURN ^You remain concealed
     matchre RETURN ^But your .* isn't loaded\!
     matchre RETURN ^Your .* falls
     matchre RETURN ^You don't have a ranged weapon to unload\.
     matchre RETURN ^You must be holding the weapon to do that\.
     send unload
     matchwait
#### WEAPON MANAGEMENT SUBS
WIELD:
     delay 0.0001
     var item $0
     var LOCATION WIELD_1
     WIELD_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You draw
     matchre RETURN ^You're already holding .*\!
     matchre RETURN ^Your .* is too injured to draw .*\!
     matchre RETURN ^You slip
     matchre RETURN ^You can't seem to find
     matchre REMOVE_WEAPON ^Wield what\?
     matchre REMOVE_WEAPON ^What were you referring to\?
     matchre REMOVE_WEAPON ^You're wearing a.*\!  You'll need to remove it first\!
     send wield %item
     matchwait
REMOVE_WEAPON:
     delay 0.0001
     var LOCATION REMOVE_WEAPON_1
     REMOVE_WEAPON_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Remove what\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You remove .* from your belt\.
     matchre RETURN ^You sling .* off from over your shoulder\.
     send remove %item
     matchwait
SHEATH_UNLOAD:
     pause 0.1
     gosub unload
     pause 0.1
     gosub stowing
     goto SHEATH_1
SHEATH:
     delay 0.0001
     var item $0
     var LOCATION SHEATH_1
     SHEATH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SHEATH_UNLOAD ^You should unload
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^You slip
     matchre RETURN ^You sheathe
     matchre RETURN ^Sheathe what\?
     matchre RETURN ^Sheathe your.*where\?
     matchre RETURN ^A .* is too long to fit in .*\.
     matchre RETURN ^The .* is too long to fit in .*\.
     send sheath %item
     matchwait
SWAP:
     delay 0.0001
     var LOCATION SWAP_1
     var todo $0
     SWAP_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You have nothing to swap\!
     matchre RETURN ^You
     matchre RETURN ^You turn
     matchre RETURN ^You deftly change
     matchre RETURN ^You effortlessly switch
     matchre RETURN ^You fiercely switch
     matchre RETURN ^You switch your
     matchre RETURN ^Your eyes blaze
     matchre RETURN ^With a quiet
     put swap %todo
     matchwait
SWAPBOW:
	delay 0.0001
	var LOCATION SWAPBOW_1
	SWAPBOW_1:
	matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
	matchre SWAPBOW You move a .* to your left hand.
	matchre SHEATH You move a .* to your right hand.
	send swap
	matchwait
#### STANCE SUB
####
####  To use STANCE SET, type STANCE SET [EVASION #] [PARRY #] [SHIELD #] {ATTACK #}.
####  Evasion, Parry, and Shield are all required, while Attack is optional.
####
STANCETO:
     delay 0.0001
     eval stance tolower($1)
     delay 0.2
     if ("%stance" != "set") then
          {
               send stance %stance
               return
          }
     if ("$2" != "NULL") then var stance1 $2
     if ("$3" != "NULL") then var stance2 $3
     if ("$4" != "NULL") then var stance3 $4
     if ("$5" != "NULL") then var stance4 $5
     send stance %stance %stance1 %stance2 %stance3 %stance4
     return
STAND_RET:
     put stand
     pause 0.5
RETREAT:
     var LOCATION RETREAT
     matchre RETREAT ^\.\.\.wait|^Sorry\,
     matchre RETREAT ^You stop advancing
     matchre 2RETREAT ^You retreat back to pole range\.
     matchre 2RETREAT ^You sneak back out
     matchre STAND_RET ^You must stand first\.
     matchre RETURN ^You retreat from combat\.
     matchre RETURN ^You are already as far away as you can get\!
     matchre RETURN ^You try to
     matchre RETURN revealing your hiding place\!
     put retreat
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (utility.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (utility.inc)
2RETREAT:
     var LOCATION 2RETREAT
     matchre 2RETREAT ^\.\.\.wait|^Sorry\,
     matchre RETURN ^You stop advancing
     matchre RETURN ^You retreat from combat\.
     matchre RETURN ^You retreat back to pole range\.
     matchre RETURN ^You sneak back out
     matchre RETURN ^You are already as far away as you can get\!
     matchre RETURN ^You try to
     matchre RETURN revealing your hiding place\!
     put retreat
     goto retry
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (utility.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (utility.inc)
     RETURN
#### BUNDLE COUNTING SUBS
BUNDLE_COUNT:
     delay 0.0001
     var LOCATION BUNDLE_COUNT_1
     BUNDLE_COUNT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre BUNDLE_SET_ZERO ^What were you referring to\?
     matchre BUNDLE_SET_ZERO ^I could not find what you were referring to\.
     matchre BUNDLE_SET ^You flip through .* and find (\d+) skins? in it\.
     send count my bundle
     matchwait
BUNDLE_SET:
     delay 0.0001
     put #tvar bundleFull 0
     put #tvar bundleCount $1
     if ($bundleCount > 199) then put #tvar bundleFull 1
     return
BUNDLE_SET_ZERO:
     delay 0.0001
     put #tvar bundleFull 0
     put #tvar bundleCount 0
     return
#### SPELL CASTING
PREPARE:
     delay 0.0001
     var prepare $0
     var LOCATION PREPARE_1
     PREPARE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_RETURN ^You are already preparing the .* spell\!
     matchre SPELL_CAST_RETURN ^You begin chanting .* to invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^You mutter .* to yourself while preparing the .* spell\.
     matchre SPELL_CAST_RETURN ^With .* movements you prepare your body for the .* spell\.
     matchre SPELL_CAST_RETURN ^You raise your .* skyward\, chanting the .* of the .* spell\.
     matchre SPELL_CAST_RETURN ^You trace .* sigil in the air\, shaping the pattern of the .* spell\.
     matchre SPELL_CAST_RETURN ^You rock back and forth\, humming tunelessly as you invoke the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You close your eyes and breathe deeply, gathering energy for the .* spell\.
     matchre SPELL_CAST_RETURN ^Your eyes darken to black as a starless night as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^The wailing of lost souls accompanies your preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^A soft breeze surrounds your body as you confidently prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Tiny tendrils of lightning jolt between your hands as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Heatless orange flames blaze between your fingertips as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^Entering a trance-like state\, your hands begin to tremble as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You adeptly sing the incantations for the .* spell\, setting the words to a favorite tune\.
     matchre SPELL_CAST_RETURN ^You bring your hand slowly to your forehead as you begin chanting the words of the .* spell\.
     matchre SPELL_CAST_RETURN ^Icy blue frost crackles up your arms with the ferocity of a blizzard as you begin to prepare the .* spell\!
     matchre SPELL_CAST_RETURN ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_RETURN ^You giggle to yourself as you move through the syncopated gestures that accompany the preparations of the .* spell\.
     matchre SPELL_CAST_RETURN ^Darkly gleaming motes of sanguine light swirl briefly about your fingertips as you gesture while uttering the .* spell\.
     matchre SPELL_CAST_RETURN ^As you begin to solemnly intone the .* spell a blue glow swirls about forming a nimbus that surrounds your entire being\.
     matchre SPELL_CAST_RETURN ^Your skin briefly withers and tightens\, becoming gaunt as the energies of the .* spell begin to build up through your body\.
     matchre SPELL_CAST_RETURN ^You trace an intricate rune in the air with your finger\, illusory lines lingering several seconds as you prepare the .* spell\.
     matchre SPELL_CAST_RETURN ^You begin reciting a solemn incantation\, causing familiar patterns of geometric shapes to circle your hand as the .* spell forms\.
     matchre SPELL_CAST_RETURN ^You take up a handful of dirt in your palm to prepare the .* spell\.  As you whisper arcane words\, you gently blow the dust away and watch as it becomes swirling motes of glittering light that veil your hands in a pale aura\.
     matchre SPELL_CAST_RETURN ^You recall the exact details of the .* symbiosis\, preparing to integrate it with the next spell you cast\.
     matchre SPELL_CAST_RETURN ^But you've already prepared the .* symbiosis\!
     matchre SPELL_CAST_DONE ^What do you want to prepare\?
     matchre SPELL_CAST_DONE ^That is not a spell you can cast\.
     matchre SPELL_CAST_DONE ^You wouldn't have the first clue how to do that\.
     matchre SPELL_CAST_DONE ^You stop\, convinced that there's no way to control that much mana\.
     matchre SPELL_CAST_FAIL ^You have to strain to harness the energy for this spell, and you aren't sure you can get enough to cast it\.
     matchre SPELL_CAST_FAIL ^You feel intense strain as you try to manipulate the mana streams to form this pattern\, and you are not certain that you will have enough mental stamina to complete it\.
     send prepare %prepare
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PREPARE! (utility.inc) ***
     put #echo >$Log Crimson $datetime Prepare = %prepare
     put #log $datetime MISSING MATCH IN PREPARE! (utility.inc)
     goto SPELL_CAST_RETURN
SPELL_WAIT:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre SPELL_CAST ^You feel fully prepared to cast your spell\.
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     matchwait
SPELL_CAST:
     delay 0.0001
     var LOCATION SPELL_CAST_1
     SPELL_CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You wave your hand\.
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast;-2 gesture
     matchwait
SPELL_WAIT_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     matchre RETURN ^You feel fully prepared to cast your spell\.
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Your target pattern dissipates because the creature is dead\, but the main spell remains intact
     matchwait
SPELL_CAST_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then return
     var target $0
     var LOCATION SPELL_CAST_TARGET_1
     SPELL_CAST_TARGET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre SPELL_CAST_DONE ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre SPELL_CAST_DONE ^You gesture\.
     matchre SPELL_CAST_DONE ^Focus the power of justice on whom\?
     matchre SPELL_CAST_DONE ^A brilliant silver glow surrounds .* for a few moments\, then fades\, leaving it somehow changed\.
     matchre SPELL_CAST_FAIL ^You don't have a spell prepared\!
     matchre SPELL_CAST_FAIL ^Your concentration slips for a moment\, and your spell is lost\.
     put -cast %target;-2 gesture
     matchwait
SPELL_CAST_DONE:
     delay 0.0001
     put #queue clear
     return
SPELL_CAST_FAIL:
     delay 0.0001
     gosub RELEASE
SPELL_CAST_RETURN:
     delay 0.0001
     return
RELEASE_MANA:
     delay 0.0001
     if ("$preparedspell" != "None") then gosub RELEASE spell
     gosub RELEASE mana
     put #echo Crimson *****************************************************
     put #echo Crimson ***** ATTUNEMENT IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson *****************************************************
     if ($mana < 80) then waiteval ($mana > 79)
CHECK_MANA:
     delay 0.0001
     if ($mana < 25) then goto RELEASE_MANA
     return
RELEASE:
     delay 0.0001
     var release $0
     var LOCATION RELEASE_1
     RELEASE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^\s*Encumbrance\s*\:
     put -release %release;-encumbrance
     matchwait
HARNESS:
     delay 0.0001
     var harness $0
     var LOCATION HARNESS_1
     HARNESS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RELEASE ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You tap into the mana from .* of the surrounding streams and
     send harness %harness
     matchwait
#### TM SPELL SUBS
TARGET_PREP:
     delay 0.0001
     var targetprep $0
     var LOCATION TARGET_PREP_1
     TARGET_PREP_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre TARGET_RELEASE ^You are not engaged to anything\, so you must specify a target to focus on\!
     matchre TARGET_RELEASE ^There is no need to target a .*\.  It is already dead\.
     matchre TARGET_RELEASE ^I could not find what you were referring to\.
     matchre TARGET_RELEASE ^This spell cannot be targeted\.
     matchre RETURN ^You begin to weave mana lines into a target pattern around .*\.
     matchre RETURN ^You begin chanting a psalm to invoke the .* spell\.
     send target %targetprep
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN TARGET_PREP! (utility.inc) ***
     put #log $datetime MISSING MATCH IN TARGET_PREP (utility.inc)
     return
TARGET_WAIT:
     delay 0.0001
     matchre TARGET_RELEASE ^Your concentration slips for a moment, and your spell is lost\.
     matchre TARGET_RELEASE ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your target pattern dissipates because .* is dead\, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your pattern dissipates with the loss of your target\.
     matchre TARGET_CAST ^You feel fully prepared to cast your spell\.
     matchre TARGET_CAST ^Your target pattern has finished forming around the area\.
     matchre TARGET_CAST ^The formation of the target pattern around .* has completed\.
     matchre TARGET_CAST ^Your formation of a targeting pattern around .* has completed\.
     matchwait
TARGET_CAST:
     delay 0.0001
     var LOCATION TARGET_CAST_1
     TARGET_CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre TARGET_RELEASE ^You don't have a spell prepared\!
     matchre TARGET_RELEASE ^.* is already dead, so that's a bit pointless\.
     matchre TARGET_RELEASE ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your target pattern dissipates because the .* is dead\, but the main spell remains intact\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^You gesture
     send cast
     matchwait
TARGET_RELEASE:
     delay 0.0001
     gosub RELEASE
     return
#### CAST SUB
CAST:
     var location CAST_1
     var todo $0
     CAST_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre CAST_2 ^You can't cast that at yourself\!
     matchre TARGET_RELEASE ^You don't have a spell prepared\!
     matchre TARGET_RELEASE ^.* is already dead, so that's a bit pointless\.
     matchre TARGET_RELEASE ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre TARGET_RELEASE ^Your target pattern dissipates because the .* is dead\, but the main spell remains intact\.
     matchre RETURN ^You gesture
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You raise your hand in an imaginary
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^Your spell pattern collapses
     matchre RETURN ^With a wave of your hand,
     matchre RETURN ^Your target pattern dissipates
     matchre RETURN ^You wave your hand\.
     matchre RETURN ^You place your hands on your temples
     matchre RETURN ^A newfound fluidity of your mind
     matchre RETURN ^Your heart skips a beat as your spell
     matchre RETURN ^With a flick of your wrist,
     matchre RETURN ^Your secondary spell pattern dissipates
     matchre RETURN ^You can't cast .+ on yourself\!
     matchre RETURN ^You make a holy gesture
     matchre RETURN ^You raise your palms and face to the heavens
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last moment\.
     put cast %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN CAST! - %todo (utility.inc) ***
     put #log $datetime MISSING MATCH IN CAST : %todo (utility.inc)
     return
CAST_2:
     send face next
     pause 0.2
     pause 0.1
     goto CAST_1

POWER:
     var location power_1
     var todo $0
POWER_1:
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^Something in the area is interfering
     matchre RETURN ^I could not find who you were referring to\.
     matchre RETURN ^You cannot detect the slightest trace
     matchre RETURN ^You aren't trained in the ways of magic\.
     matchre RETURN ^You aren't trained in the ways of magic\, but you fake it\.
     put PERCEIVE %todo
     matchwait
#### ARCANA SUBS
CHARGE:
     delay 0.0001
     var todo $0
     var LOCATION CHARGE_1
     CHARGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^The .* absorbs .* of the energy\.
     matchre RETURN ^You fail to channel any energy into the .* \.
     matchre RETURN ^You strain\, but cannot harness that much power\.
     matchre RETURN ^You fail to channel any of the energy into .*\.
     matchre RETURN ^You strain\, but lack the mental stamina to charge .* this much\.
     matchre RETURN ^The .* is already holding as much power as you could possibly charge it with\.
     matchre RETURN ^The .* resists\, only absorbing part of the energy while the rest dissipates harmlessly\.
     send charge %todo
     matchwait
INVOKE:
     delay 0.0001
     var todo $0
     var LOCATION INVOKE_1
     INVOKE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Your link to the .* is intact
     matchre RETURN ^The .* dim\, almost magically null\.  A very faint pattern indicates its readiness to absorb .*energy\.
     matchre RETURN ^The .* pulses .* energy\.  You reach for its center and forge a magical link to it\, readying .* mana for your use\.
     matchre INVOKE_1 ^The .* pulses .* energy\.  You reach for its center\, attempting to forge a magical link\, but fail\.
     send invoke %todo
     matchwait
REMOVE_CAMBRINTH:
     delay 0.0001
     var todo $0
     var LOCATION REMOVE_CAMBRINTH_1
     REMOVE_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:slide|remove|take off)
     send remove my %todo
     matchwait
WEAR_CAMBRINTH:
     delay 0.0001
     var todo $0
     var LOCATION WEAR_CAMBRINTH_1
     WEAR_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:hang|slide|place|attach|put on)
     matchre RETURN ^Wear what\?
     matchre RETURN ^You are already wearing that\.
     send wear my %todo
     matchwait
#### FOCUS SUB
FOCUS:
     delay 0.0001
     var todo $0
     var LOCATION FOCUS_1
     FOCUS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You focus your magical senses on .*\.
     send focus %todo
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN FOCUS! (utility.inc) ***
     put #log $datetime MISSING MATCH IN FOCUS! (utility.inc)
     return
#### PERCEIVE POWER SUB
PERCEIVE:
     delay 0.0001
     var perceive $0
     var LOCATION PERCEIVE_1
     PERCEIVE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^There isn't the slightest trace
     matchre RETURN ^You cannot detect the slightest trace
     matchre RETURN ^You aren't trained in the ways of magic\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You aren't trained in the ways of magic
     matchre RETURN ^You aren't trained in the ways of magic\, but you fake it\.
     send perceive %perceive
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PERCEIVE! (utility.inc) ***
     put #log $datetime MISSING MATCH IN PERCEIVE! (utility.inc)
     return
#### INFUSE THAT ORB (Thanks to Dasffion)
CHARGE_ORB:
     delay 0.0001
     var infuse $0
     var LOCATION CHARGE_ORB_1
     CHARGE_ORB_1:
     if ($Attunement.Ranks < 600) then
          {
               gosub HARNESS %infuse
               pause 1
          }
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     match RETURN having reached its full capacity
     matchre CHARGE_ORB_1 ^You sense that you were able to channel .*\.\s*A faint tugging sensation emanates from the orb\, as if it hungers for more\.
     match CHARGE_ORB_1 You strain
     match CHARGE_ORB_1 backfire
     match RETURN You sense that it cannot accept any more power
     match RETURN unable
     matchre RETURN ^You sense that you were able to channel .*\.\s*A sense of fullness emanates from the orb\.
     match RETURN You don't have a spell prepared
     # match cast.orb You do not
     put infuse OM %infuse
     matchwait 15
     return
#### PERCEIVE HEALTH SUBS
PERCEIVE_HEALTH:
     delay 0.0001
     var LOCATION PERCEIVE_HEALTH_1
     PERCEIVE_HEALTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre PERCEIVE_RETURN ^You sense.*
     matchre PERCEIVE_RETURN ^You fail to sense anything\, however\.
     matchre PERCEIVE_PAUSE ^You're not ready to do that again\, yet\.
     send perceive health
     matchwait
PERCEIVE_RETURN:
     delay 0.0001
     return
PERCEIVE_PAUSE:
     delay 0.0001
     pause 5
     goto PERCEIVE_HEALTH
#### GUILD CHECK
GUILD_CHECK:
     # echo
     # echo **** CHECKING GUILD...................
     # echo
     action put #var race $2;put #var guild $3 when ^Name\:\s*(.*)\s*Race\:\s*(.*)\s*Guild\:\s*(.*)$
     action put #var circle $3 when ^Gender\:\s*(.*)\s*Age\:\s*(\d+)\s*Circle\:\s*(\d+)$
     action put #var favors $1 when ^\s*Favors\s*\:\s*(\d*)
     send info;encumbrance
     waitforre ^\s*Encumbrance\s*\:
     if "$Guild" = "Warrior" then put #var Guild Warrior Mage
     if "$Guild" = "Moon" then put #var Guild Moon Mage
     action remove ^Name\:\s*(.*)\s*Race\:\s*(.*)\s*Guild\:\s*(.*)$
     action remove ^Gender\:\s*(.*)\s*Age\:\s*(\d+)\s*Circle\:\s*(\d+)$
     action remove ^\s*Favors\s*\:\s*(\d*)
     pause 0.2
     echo
     echo **** Guild: $guild ****
     echo **** Circle: $circle ****
     echo
     pause 0.2
     return
#### FORAGING SUBS
FORAGE:
     delay 0.0001
     var forage $0
     var LOCATION FORAGE_1
     FORAGE_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You manage to find .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send forage %forage
     matchwait
COLLECT:
     delay 0.0001
     var collect $0
     var LOCATION COLLECT_1
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
     COLLECT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You cannot collect anything while in combat\!
     matchre RETURN ^You manage to collect a pile of .*\.
     matchre RETURN ^The room is too cluttered to find anything here\!
     matchre RETURN ^You survey the area and realize that any collecting efforts would be futile\.
     matchre WAIT ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send collect %collect
     matchwait
KICKEM:
     delay 0.0001
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     if matchre("$roomobjs" , "a pile of \S+") then gosub KICKIT
     return
KICKIT:
     delay 0.0001
     var LOCATION KICKIT_1
     KICKIT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^You take a step back and run up to the pile of .*\.
     send kick pile
     matchwait
CLEAN_ROOM:
     delay 0.0001
     var dumpster NULL
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomobjs", "a bucket of viscous gloop|a waste bucket") then var dumpster bucket
     if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
     if matchre("$roomobjs", "a tree hollow") then var dumpster hollow
     if matchre("$roomobjs", "an oak crate") then var dumpster crate
     if matchre("$roomobjs", "a driftwood log") then var dumpster log
     if matchre("$roomobjs", "a disposal bin|a waste bin|firewood bin") then var dumpster bin
     if matchre("$roomobjs", "ivory urn") then var dumpster urn
     if matchre("$roomobjs", "a waste basket") then var dumpster basket
     if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomname", "^\[Garden Rooftop, Medical Pavilion\]") then var dumpster gutter
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK
     pause 0.1
     if ("%dumpster" = "NULL") then return
CLEAN_ROOM_2:
     delay 0.0001
     var object NULL
     if matchre("$roomobjs", "a rock") then var object rock
     if matchre("$roomobjs", "claw") then var object claw
     if matchre("$roomobjs", "a vine") then var object vine
     if matchre("$roomobjs", "some grass") then var object grass
     if !matchre("%object", "NULL") then
          {
               gosub GET %object
               gosub PUT_IT my %object in %dumpster
               goto CLEAN_ROOM_2
          }
     gosub KICKEM
     else return 
DUMP_CHECK:
     delay 0.0001
     if !def(Dump.Time) then put #var Dump.Time $gametime
     put #var Dump.Last {#evalmath ($gametime - $Dump.Time)}
     if ($Dump.Last < 600) then return
     gosub DUMP_JUNK
     put #var Dump.Time $gametime
     put #save var
     return
DUMP_JUNK:
     delay 0.0001
     var LOCATION DUMP_JUNK_1
DUMP_JUNK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^\[You have marked this room to be cleaned by the janitor\.  It should arrive shortly\.\]
     matchre RETURN ^The janitor was recently summoned to this room\.\s+Please wait \d+ seconds\.
     matchre RETURN ^You should just kick yourself in the shin\.  There is no junk here\.
     send dump junk
     matchwait 
#### STUDYING SUB
STUDY:
     delay 0.0001
     var study $0
     var LOCATION STUDY_1
     STUDY_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send study %study
     matchwait
#### FILL GEM POUCHES
GEM_POUCHES:
GEM.POUCHES:
     gosub GET my gem pouch
     gosub PUT tie my pouch
     pause 0.1
     var fill %DEFAULT.CONTAINER
     gosub FILL.POUCH
     var fill %BOX.CONTAINER
     gosub FILL.POUCH
     var fill %GEM.CONTAINER
     gosub FILL.POUCH
     send stow my pouch
     pause 0.1
     RETURN
FILL.POUCH:
     delay 0.0001
     pause 0.1
     matchre NEW.POUCH ^The pouch is too full to fit|^The gem pouch is too full|You can't fill anything|^The pouch is too full
     matchre RETURN ^You fill|^There aren't|^You open your|^What were you
     put fill my gem pouch with my %fill
     matchwait 10
     RETURN
NEW.POUCH:
     delay 0.0001
     pause 0.1
     send open my %GEMPOUCH.CONTAINER
     pause 0.5
     pause 0.5
STOW.POUCH:
     matchre CLOSE.POUCH ^You put|^You fill|^You open
     matchre SELL.THESE.GEMS ^That's too heavy|too wide|too long
     send put my pouch in my %GEMPOUCH.CONTAINER
     matchwait 10
     goto SELL.THESE.GEMS
CLOSE.POUCH:
     pause 0.1
     pause 0.5
     send close my %GEMPOUCH.CONTAINER
     pause 0.5
     pause 0.1
GET.POUCH:
     pause 0.2
     send get my gem pouch
     pause 0.5
     send tie my pouch
     pause 0.3
     pause 0.1
     RETURN
SELL.THESE.GEMS:
     put #echo >Log Lime *** Gem pouch container full!!!!
     put #var sellGems 1
     RETURN
#### SEARCH SUB
SEARCH:
     var todo $0
     var LOCATION SEARCH
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Success\!
     matchre RETURN ^Roundtime
     matchre RETURN ^You search around for a moment
     put search %todo
     matchwait 10
     RETURN
#### TIME SUB
TIME:
TIME.CHECK:
     matchre DAY.TIME dawn|early morning|mid-morning|midday|late morning|noon|early afternoon|mid-afternoon|late afternoon|sunrise
     matchre NIGHT.TIME early evening|mid-evening|late evening|evening|midnight|night|almost dawn|sunset|dusk|approaching sunrise
     matchre NO.TIME you can't tell
     put time
     matchwait 8
     goto NO.TIME
DAY.TIME:
     put #var TIME DAY
     var TIME DAY
     put observe weather
     RETURN
NIGHT.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     put observe weather
     RETURN
NO.TIME:
     put #var TIME NIGHT
     var TIME NIGHT
     put observe weather
     RETURN
##############################################################################################
#   UBER 1337 PROFIT TRACKING / BANK EXCHANGE V.9000    W/ CROSS SCRIPT INJECTION            #
##############################################################################################
BANK:
     if $invisible then send khri stop silence
	send wealth
	wait
	pause 0.1
     pause 0.1
     action (balancecheck) var Plat $1 when ^.*\s(\d+)\splatinum\,?
     action (balancecheck) var Gold $1 when ^.*\s(\d+)\sgold\,?
     action (balancecheck) var Silver $1 when ^.*\s(\d+)\ssilver\,?
     action (balancecheck) var Bronze $1 when ^.*\s(\d+)\sbronze\,?
     action (balancecheck) var Copper $1 when ^.*\s(\d+)\scopper
     action (balancecheck) off
     action (profitparse) var Plat $1 when ^PROFITPARSE\s(\d+)\d\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s\d+(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Gold $1 when ^PROFITPARSE\s(\d)\d\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d+\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s\d(\d)\d\d\sPROFITPARSE
     action (profitparse) var Silver $1 when ^PROFITPARSE\s(\d)\d\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d+\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s\d(\d)\d\sPROFITPARSE
     action (profitparse) var Bronze $1 when ^PROFITPARSE\s(\d)\d\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d+\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s\d(\d)\sPROFITPARSE
     action (profitparse) var Copper $1 when ^PROFITPARSE\s(\d)\sPROFITPARSE
     action (profitparse) off
     var preDeposit 0
     var postDeposit 0
     var profit 0
     gosub BANK.COIN.CLEAR
     pause 0.1
     action (balancecheck) on
     pause 0.001
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     action (balancecheck) off
     pause 0.1
     gosub BANK.COIN.MATH
     gosub BANK.PREDEP.MATH
     pause 0.1
     put -deposit all;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     gosub BANK.COIN.CLEAR
     action (balancecheck) on
	pause 0.001
     put -check balance;-1 encumbrance
     waitforre ^\s*Encumbrance\s*\:
     pause 0.1
     action (balancecheck) off
     gosub BANK.COIN.MATH
     gosub BANK.POSTDEP.MATH
     evalmath profit (%postDeposit - %preDeposit)
     math Profit add %profit
     pause 0.1
     gosub BANK.COIN.CLEAR
	pause 0.1
     action (profitparse) on
     put #parse PROFITPARSE %Profit PROFITPARSE
     action (profitparse) off
     # put #statusbar 1 Profit: %Plat Plat, %Gold Gold, %Silver Silver, %Bronze Bronze and %Copper Copper.
     put #parse MONEY DONE
     pause 0.1
     RETURN
BANK.COIN.CLEAR:
     var Copper 0
     var Bronze 0
     var Silver 0
     var Gold 0
     var Plat 0
     pause 0.1
     RETURN
BANK.COIN.MATH:
     math Bronze multiply 10
     math Silver multiply 100
     math Gold multiply 1000
     math Plat multiply 10000
     pause 0.1
     RETURN
BANK.PREDEP.MATH:
     math preDeposit add %Copper
     math preDeposit add %Bronze
     math preDeposit add %Silver
     math preDeposit add %Gold
     math preDeposit add %Plat
     pause 0.1
     RETURN
BANK.POSTDEP.MATH:
     math postDeposit add %Copper
     math postDeposit add %Bronze
     math postDeposit add %Silver
     math postDeposit add %Gold
     math postDeposit add %Plat
     pause 0.1
     RETURN

COMBINE.BANK:
	math Plats add %Plat
	math Golds add %Gold
	math Silvers add %Silver
	math Bronzes add %Bronze
	math Coppers add %Copper
	pause 0.1
	RETURN

GLOBAL.PROFIT.ADD:
	math Plats add $Plat
	math Golds add $Gold
	math Silvers add $Silver
	math Bronzes add $Bronze
	math Coppers add $Copper
	RETURN

CLEAR.BANK:
	var Plat 0
	var Gold 0
	var Silver 0
	var Bronze 0
	var Copper 0
	var preDeposit 0
	var postDeposit 0
	var profit 0
	var Profit 0
	put #tvar Plat 0
	put #tvar Gold 0
	put #tvar Silver 0
	put #tvar Bronze 0
	put #tvar Copper 0
	pause 0.1
	RETURN

#####################################
# COIN EQUALIZE 
#####################################
EQUALIZECOIN:
     EQ.COPPER:
     var cointype Coppers
     var convertto Bronzes
     gosub CONVERT.IT
     EQ.BRONZE:
     var cointype Bronzes
     var convertto Silvers
     gosub CONVERT.IT
     EQ.SILVER:
     var cointype Silvers
     var convertto Golds
     gosub CONVERT.IT
     EQ.GOLD:
     var cointype Golds
     var convertto Plats
     gosub CONVERT.IT
     pause 0.1
     RETURN 
CONVERT.IT:
     if (%cointype > 9) then RETURN
     if (%%cointype > 9) && (%%cointype < 21) then 
          {
          math %convertto add 1 
          math %cointype subtract 10
          }
     if (%%cointype > 19) && (%%cointype < 31) then 
          {
          math %convertto add 2
          math %cointype subtract 20
          }
     if (%%cointype > 29) && (%%cointype < 41) then 
          {
          math %convertto add 3
          math %cointype subtract 30
          }
     if (%%cointype > 39) && (%%cointype < 51) then 
          {
          math %convertto add 4
          math %cointype subtract 40
          }
     if (%%cointype > 49) && (%%cointype < 61) then 
          {
          math %convertto add 5
          math %cointype subtract 50
          }
     if (%%cointype > 59) && (%%cointype < 71) then 
          {
          math %convertto add 6
          math %cointype subtract 60
          }
     if (%%cointype > 69) && (%%cointype < 81) then 
          {
          math %convertto add 7
          math %cointype subtract 70
          }
     if (%%cointype > 79) && (%%cointype < 91) then 
          {
          math %convertto add 8
          math %cointype subtract 80
          }
     if (%%cointype > 89) && (%%cointype < 101) then 
          {
          math %convertto add 9
          math %cointype subtract 90
          }
     RETURN
#############################################
# MONEY EXCHANGE
#############################################
LIRUMS:
     var Target.Currency LIRUMS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
KRONARS:
     var Target.Currency KRONARS
     gosub EXCHANGE LIRUMS
     gosub EXCHANGE DOKORAS
     goto EXCHANGE.FINISH
DOKORAS:
     var Target.Currency DOKORAS
     gosub EXCHANGE KRONARS
     gosub EXCHANGE LIRUMS
     goto EXCHANGE.FINISH
EXCHANGE.INVIS:
     put hum scale
     pause 0.2
     put stop hum
     pause 0.1
     pause 0.1
     goto EXCHANGE.CONTINUE
EXCHANGE:
     var Coin $0
EXCHANGE.CONTINUE:
     pause 0.1
     matchre EXCHANGE.INVIS ^How can you .* when you can't be seen\?
     matchre EXCHANGE.CONTINUE ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre RETURN Enjoy the holiday, friend\!
     matchre RETURN ^You hand your money to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre RETURN ^But you don't have any .*\.
     matchre EXCHANGE.SMALLER transactions larger than a thousand
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE ALL %Coin FOR %Target.Currency
     matchwait
EXCHANGE.SMALLER:
     pause 0.1
     pause 0.2
     pause 0.1
     matchre EXCHANGE.SMALLER ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?|^Sorry\,
     matchre EXCHANGE.SMALLER ^You hand your .* to the money-changer\.\s*After collecting a.* fee, .* hands you .*\.
     matchre RETURN ^The money-changer says crossly, \"A transaction that small isn't worth my time\.\s*The minimum is one bronze or ten coppers\.\"
     matchre RETURN ^One of the guards mutters\, \"None of that\, $charactername\.\s*You'd be lucky to get anything at all with an exchange that small\.\"
     matchre EXCHANGE.CONTINUE Enjoy the holiday, friend\!
     matchre EXCHANGE.CONTINUE ^You count out all of your .* and drop them in the proper jar\.\s*After figuring a .* fee in the ledger beside the jar\, you reach into the one filled with .* and withdraw .*\.
     matchre EXCHANGE.CONTINUE ^But you don't have any .*\.
     matchre EXCHANGE.CONTINUE ^You don't have that many
     matchre EXCHANGE.FINISH ^There is no money-changer here\.
     put EXCHANGE 1000 plat %Coin FOR %Target.Currency
     matchwait   
EXCHANGE.FINISH:
     put #parse EXCHANGE DONE!
     RETURN
################################
# BLEEDER CHECK/TENDING SYSTEM
################################
BLEEDERCHECK:
BLEEDER.CHECK:
BLEEDCHECK:
     debuglevel 5
     delay 0.0001
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
     pause 0.001
     action goto BLEEDCHECK when The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
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
     action var BLEEDING_HEAD YES when lodged\s*.* into your head
     action var BLEEDING_HEAD YES when lodged\s*.* in your head
     action var BLEEDING_NECK YES when lodged\s*.* into your neck
     action var BLEEDING_NECK YES when lodged\s*.* in your neck
     action var BLEEDING_CHEST YES when lodged\s*.* into your chest
     action var BLEEDING_CHEST YES when lodged\s*.* in your chest
     action var BLEEDING_ABDOMEN YES when lodged\s*.* into your abdomen
     action var BLEEDING_ABDOMEN YES when lodged\s*.* in your abdomen
     action var BLEEDING_BACK YES when lodged\s*.* into your back
     action var BLEEDING_BACK YES when lodged\s*.* in your back
     action var BLEEDING_R_ARM YES when lodged\s*.* into your right arm
     action var BLEEDING_R_ARM YES when lodged\s*.* in your right arm
     action var BLEEDING_L_ARM YES when lodged\s*.* into your left arm
     action var BLEEDING_L_ARM YES when lodged\s*.* in your left arm
     action var BLEEDING_R_LEG YES when lodged\s*.* into your right leg
     action var BLEEDING_R_LEG YES when lodged\s*.* in your right leg
     action var BLEEDING_L_LEG YES when lodged\s*.* into your left leg
     action var BLEEDING_L_LEG YES when lodged\s*.* into your left leg
     action var BLEEDING_R_HAND YES when lodged\s*.* into your right hand
     action var BLEEDING_R_HAND YES when lodged\s*.* in your right hand
     action var BLEEDING_L_HAND YES when lodged\s*.* into your left hand
     action var BLEEDING_L_HAND YES when lodged\s*.* in your left hand
     action var BLEEDING_L_EYE YES when lodged\s*.* into your left eye
     action var BLEEDING_L_EYE YES when lodged\s*.* in your left eye
     action var BLEEDING_R_EYE YES when lodged\s*.* into your right eye
     action var BLEEDING_R_EYE YES when lodged\s*.* in your right eye
     action var POISON YES when ^You.+(poisoned)
     action var POISON YES when ^You.+(poisoned)
BLEEDYES:
     if "$righthandnoun" = "arrow" then send drop arrow
     if "$lefthandnoun" = "arrow" then send drop arrow
     if "$righthandnoun" = "bolt" then send drop bolt
     if "$lefthandnoun" = "bolt" then send drop bolt
     pause 0.1
     echo [Checking for Bleeders]
     pause 0.1
     matchre yesbleeding Bleeding|arrow lodged|bolt lodged
     matchre END.OF.BLEEDER ^You pause a moment|^The THINK verb|Syntax:
     match bleedyes It's all a blur!
     put health;think
     matchwait 6
     echo [No bleeder found - exiting bleeder check]
     goto END.OF.BLEEDER
YESBLEEDING:
     echo **** HEALING BLEEDER ****
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
     if "%BLEEDING_SKIN" = "YES" then gosub tend skin
     var BLEEDING_HEAD NO
     var BLEEDING_NECK NO
     var BLEEDING_CHEST NO
     var BLEEDING_ABDOMEN NO
     var BLEEDING_BACK NO
     var BLEEDING_R_ARM NO
     var BLEEDING_L_ARM NO
     var BLEEDING_R_LEG NO
     var BLEEDING_L_LEG NO
     var BLEEDING_R_HAND NO
     var BLEEDING_L_HAND NO
     var BLEEDING_L_EYE NO
     var BLEEDING_R_EYE NO
     var BLEEDING_SKIN NO
     goto END.OF.BLEEDER
TEND: 
     var bleeder $0
     echo ***************************
     echo [Tending Bleeder: %bleeder] 
     echo ***************************
     if $prone then gosub put stand
tend_bleeder:
     gosub put tend my %bleeder 
     pause 0.2
     pause 0.2
     pause 0.1
          if contains("$roomobjs","driftwood log") && ("$righthand" = "crossbow bolt") || ("$lefthand" = "crossbow bolt") then 
          {
          put put my bolt in log
          pause .1
          }
     pause 0.2
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
tend_bleeder2:
     pause 0.1
     gosub put tend my %bleeder 
     pause 0.1
          if contains("$roomobjs","driftwood log") && ("$righthand" = "crossbow bolt") || ("$lefthand" = "crossbow bolt") then 
          {
          put put my bolt in log
          pause .1
          }
     pause 0.2
     if "$righthandnoun" = "arrow" then put drop arrow
     if "$lefthandnoun" = "arrow" then put drop arrow
     if "$righthand" = "crossbow bolt" then put drop bolt
     if "$lefthand" = "crossbow bolt" then put drop bolt
     pause 0.1
     pause 0.1
     echo [Leaving Bleeder System]
     RETURN
END.OF.BLEEDER:
     var BLEEDING_HEAD NO
     var BLEEDING_NECK NO
     var BLEEDING_CHEST NO
     var BLEEDING_ABDOMEN NO
     var BLEEDING_BACK NO
     var BLEEDING_R_ARM NO
     var BLEEDING_L_ARM NO
     var BLEEDING_R_LEG NO
     var BLEEDING_L_LEG NO
     var BLEEDING_R_HAND NO
     var BLEEDING_L_HAND NO
     var BLEEDING_L_EYE NO
     var BLEEDING_R_EYE NO
     var BLEEDING_SKIN NO
     action remove The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
     debuglevel 0
     RETURN
#version 1.0
	Base.ListExtract:
		var Base.ListVar $1
		var Base.NounListVar $2
		var Base.ItemCountVar $3

		eval %Base.ListVar replace("%%Base.ListVar", ", ", "|")
		eval %Base.ListVar replacere("%%Base.ListVar", "( and )(?:a |an |some )(?!.*and (a |an |some ))","|")
		var %Base.ListVar |%%Base.ListVar
		eval %Base.ItemCountVar count("%%Base.ListVar", "|")
		var %Base.NounListVar %%Base.ListVar
	Base.ListExtract.Loop.Trim:
		eval %Base.NounListVar replacere ("%%Base.NounListVar", "\|[\w'-]+ ", "|")
		if contains("%%Base.NounListVar", " ") then goto Base.ListExtract.Loop.Trim
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
CALMED:
     delay 5
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub STAND
     goto %LOCATION
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
matchre location1 ^You should stop playing before you do that\.
matchre location1 ^You are a bit too busy performing to do that\.
matchre location1 ^You are concentrating too much upon your performance to do that\.
matchwait 22
put #echo >Log yellow matchwait %location %todo
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
     gosub STOP.HUMMING1
     goto %LOCATION
#### HEALTH CHECKING
HEALTH_CHECK:
     delay 0.0001
     put #var needHealing 0
     delay 0.5
     matchre HEALTH_GOOD ^You have no significant injuries\.
     matchre HEALTH_BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH_CHECK
HEALTH_BAD:
     delay 0.0001
     put #var needHealing 1
     delay 0.5
     return
HEALTH_GOOD:
     delay 0.0001
     put #queue clear
     put #var needHealing 0
     delay 0.5
     return
#### RETURNS
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     return
RETURN:
     delay 0.0001
     return
#### END OF FILE
endof: