############################
# SNAKEPIT SCRIPT BY SHROOM
# For Hollow's Eve Festival
############################

var junk mouse
var searchloop 0
var item null
action goto GET_HEALED when ^Unfortunately\, your wounds make it impossible for you to play the Darkbox
action goto GET_COIN when ^You try to play the Darkbox\, but realize you don't have the 100 Dokoras required
action goto DEAD when eval ($dead = 1)
action var item $1;goto DROPPED_ITEM when ^Your (.*) falls to the ground\.
pause 0.1
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
PLAY:
     if ($roomid != 254) then gosub automove 254
     if ($bleeding) && ($health < 90) then goto GET_HEALED
     if (!$standing) then gosub STAND
     pause 0.1
     pause 0.2
     send get treaure
     pause 2
     pause
     if ("$righthandnoun" = "pouch") then put open my $righthand
     if ("$lefthandnoun" = "pouch") then put open my $lefthand
     pause 0.5
     pause 0.2
     if matchre("$righthand $lefthand", "pouch") then put get ticket
     pause 0.4
     if ("$righthand" != "Empty") then put #echo >Log Pink *** SNAKE PIT - Found $righthand
     if ("$lefthand" != "Empty") then put #echo >Log Pink *** SNAKE PIT - Found $lefthand
     pause 0.2
     if ("$righthand" != "Empty") && matchre("%junk", "$righthandnoun") then gosub EMPTY_RIGHT
     if ("$lefthand" != "Empty") && matchre("%junk", "$lefthandnoun") then gosub EMPTY_LEFT
     pause 0.2
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
     pause .1
     goto PLAY
     
     
DROPPED_ITEM:
     pause 0.1
     pause 0.1
     if contains("%item", "pouch") then put open pouch
     pause 0.2
     if contains("%item", "pouch") then put get ticket
     pause 0.2
     if !matchre("%junk", "%item") then goto PLAY
     put get %item
     pause 0.5
     if ("$righthand" != "Empty") then put #echo >Log Pink *** Darkbox - Found $righthand
     if ("$lefthand" != "Empty") then put #echo >Log Pink *** Darkbox - Found $lefthand
     put stow %item
     pause 0.4
     goto PLAY

EMPTY_RIGHT:
     gosub TRASH_CHECK
     pause 0.2
     if ("%trash" != "null") then put put my $righthand in %trash
     else put drop my $righthand
     pause 0.5
     if ("$righthand" != "Empty") then send empty right
     pause 0.5
     return
EMPTY_LEFT:
     gosub TRASH_CHECK
     pause 0.2
     if ("%trash" != "null") then put put my $lefthand in %trash
     else put drop my $lefthand
     pause 0.5
     if ("$lefthand" != "Empty") then send empty right
     pause 0.5
     return
TRASH_CHECK:
     var trash null
     if matchre("$roomobjs", "trash receptacle") then var trash receptacle
     if matchre("$roomobjs", "a small hole") then var trash hole
     if matchre("$roomobjs", "a small mud puddle") then var trash puddle
     if matchre("$roomobjs", "a marble statue ") then var trash statue
     if matchre("$roomobjs", "a bucket of viscous gloop|a waste bucket|a bucket|metal bucket") then var trash bucket
     if matchre("$roomobjs", "a large stone turtle") then var trash turtle
     if matchre("$roomobjs", "a tree hollow|darken hollow") then var trash hollow
     if matchre("$roomobjs", "an oak crate") then var trash crate
     if matchre("$roomobjs", "a driftwood log") then var trash log
     if matchre("$roomobjs", "a disposal bin|a waste bin|firewood bin") then var trash bin
     if matchre("$roomobjs", "ivory urn") then var trash urn
     if matchre("$roomobjs", "a bottomless pit") then var trash pit
     if matchre("$roomname", "^\[Garden Rooftop, Medical Pavilion\]") then var trash gutter
     return
     
####################################################
GET_HEALED:
     pause 0.1
     if matchre("%item", "pouch") then 
          {
               send open pouch
               pause 0.5
               send get ticket
               pause 0.5
          }
     gosub automove clearing
     pause 0.5
     if ("$game" != "DRF") then goto PRIME_HEAL 
     put lean marino
     pause 25
     put #echo >Log DeepPink *** Got healed
     goto RETURN_TO_BOX
     
PRIME_HEAL:
     pause 0.5
     send go path
     waitforre ^Out of the corner of your eye\, you spy a colorfully garbed attendant approaching you\, a silver knife in his hand\.
     pause 0.5
     put #mapper reset
     pause 0.5
     if ($zoneid = 66) then gosub automove east
     gosub automove healer
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     goto AUTO_HEALER
DONE_AUTOEMPATH:
     put #echo >Log DeepPink *** Got healed
     if ($zoneid = 67) then gosub automove east
     if ($zoneid != 66) then gosub automove portal 
     send go path
     waitforre ^\[Paasvadh Forest\, Clearing\]
     pause 0.5
     pause 0.4
     goto RETURN_TO_BOX
     
GET_COIN:
     pause 0.1
     gosub automove teller
     pause 0.5
     matchre COIN_DONE ^The clerk counts out
     matchre BROKE ^The clerk tells you\, \"You don't have that much money
     put withdraw 15 plat
     matchwait 20
     goto BROKE
COIN_DONE:
     pause 0.5
     put #echo >Log Yellow *** Got 15 plat from bank
RETURN_TO_BOX:
     pause 0.5
     gosub automove snake pit
     goto PLAY
     
DEAD:
     put #echo >Log Red *** Snakepit Death!
     echo =============
     echo *** We Dead. 
     echo =============
     exit
#######################################################
AUTO_HEALER:
     var LAST AUTO_HEALER
     pause 0.1
     pause 0.2
     if matchre ("$roomplayers", "Kinoko who is lying down") then goto LIE_DOWN
     if matchre ("$roomplayers", "Aksel who is lying down") then goto LIE_DOWN
     if matchre ("$roomplayers", "who is lying down") then goto HEALTH_WAIT
HEALTH_ANYWAY:
LIE_DOWN:
     var empathloop 0
     if matchre("$roomobjs", "(Shalvard|Dokt|Arthianna|Kaiva|Martyr Saedelthorp|Fraethis|Srela|Yrisa|Quentin|Elys)") then var Empath $1
     pause 0.001
     send lie
     pause 0.5
     pause 0.2
     send join list
     pause 0.5
     if ($standing) then send lie
     pause 0.5
     if ($standing) then send lie
     pause 0.2
EMPATH_WAIT:
     math empathloop add 1
     if (%empathloop > 8) then goto EMPATH_HEALTH_CHECK
     if ($sitting) then goto DONE_AUTOEMPATH
     if ($standing) then send lie
     #if matchre ("$roomplayers", "who is lying down") && ($bleeding = 0) then goto HEALTH_WAIT
     matchre DONE_AUTOEMPATH ^Shalvard says, "Please get up|Shalvard looks around and says, "Kindly leave|^Kaiva crosses your name off|you look fine and healthy to me
     matchre DONE_AUTOEMPATH ^You sit up|^Arthianne nudges you|I think you don't really need healing|you are well|Quentin whispers, "Just between you and me and the Queen
     matchre DONE_AUTOEMPATH ^Srela says, "You're healthy|A little rest and exercise and you'll be good as new
     matchre DONE_AUTOEMPATH ^Dokt waves a large hand at you and says|Dokt give you a quick glance\, "Look fine to me
     put exp
     pause 5
     if ($standing) then send lie
     pause 8
     if ($standing) then send lie
     pause 8
     if ($standing) then send lie
     pause 8
     if ($standing) then send lie
     pause 8
     if ($standing) then send lie
     put look
     matchwait 30
     goto EMPATH_WAIT
EMPATH_HEALTH_CHECK:
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     if !matchre("$roomobjs", "(Shalvard|Dokt|Arthianna|Kaiva|Martyr Saedelthorp|Fraethis|Srela|Yrisa|Quentin|Elys)") then goto AUTOHEAL
     pause 5
     goto EMPATH_WAIT
HEALTH_WAIT:
     pause 0.2
     var healcounter 0
     if ($sitting = 0) then send sit
     pause 0.2
     var healingwaitlist $roomplayers
     eval healingwaitlist replacere("%healingwaitlist", "Also here\:\s+", "")
     eval healingwaitlist replacere("%healingwaitlist", "Pirate", "")
     eval healingwaitlist replacere("%healingwaitlist", "King of the Road", "")
     eval healingwaitlist replace("%healingwaitlist", " and", ",")
     eval healingwaitlist replace("%healingwaitlist", ".", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is lying down", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is kneeling", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is sitting", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is in .+ cage", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho has .+ visage", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is almost invisible", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is in a globe of blue fire", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is radiating a glowing aura", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is emanating a .+ holy aura", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is who is mounted on .+ horse", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is shrouded in ghostly flames", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is blurred by hazy afterimages", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by a fiery mantle", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is covered with whitened ridges", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is shrouded by swirling grey fog", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is darkened by an unnatural shadow", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is behind a plexus of azure lines", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is bathed in pale golden sunlight", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is enveloped in a hellish inferno", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is shining with a dark golden glow", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by a hellish inferno", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is behind a plexus of azure lines", ",")
	eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by an electric storm", ",")
	eval healingwaitlist replacere("%healingwaitlist", "\swho is engulfed in a hazy cloud of dust", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is shining with a dark golden glow", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by .+ shimmering shield", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by .+ circling blades? of ice", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is sheathed in an aura of crackling electricity", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by a band of twittering songbirds", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is followed by a rabid confusion of smirking weasels", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is being harassed by an intrigue of phantasmal kittens", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is surrounded by a ring of jagged stone spears at melee range", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is trailed by a discombobulated shadow jumping in and out of view", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho is covered in layers of filth and surrounded by a cloud of putrescence", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\swho has coalesced into a battle of light and shadow, each warring for dominance", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\.", ",")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s[\w'-]+\s", ", ")
     eval healingwaitlist replacere("%healingwaitlist", "\,\s", "|")
     var healingwaitlist |%healingwaitlist|
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|[\w'-]+\s", "|")
     eval healingwaitlist replace("%healingwaitlist", "," "")
     eval healingwaitlist replace("%healingwaitlist", "||" "|")
     eval healingwaitlist replacere("%healingwaitlist", "\|$", "")
     eval healtotal count("%healingwaitlist", "|")
     # eval healtotal count("%healingwaitlist", "|%healingwaitlist")
     echo Waiting list: %healingwaitlist
     echo %healtotal people ahead of us in line
     pause 2
     goto HEALING_WAIT
HEAL_WAIT_PAUSE:
     var healcounter 0
     echo *** Waiting for %healingwaitlist to finish healing
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     if matchre ("$roomplayers", "the body of .* who is lying down") then goto LIE_DOWN
     if !matchre ("$roomplayers", "who is lying down") then goto AUTO_HEALER
     if matchre ("$roomplayers", "Kinoko who is lying down") then goto LIE_DOWN
     if matchre ("$roomplayers", "Aksel who is lying down") then goto LIE_DOWN
     if ($health < 50) && ($bleeding = 1) then goto HEALTH_ANYWAY
     pause 6
HEALING_WAIT:
     math healcounter add 1
     var healplayer %healingwaitlist(%healcounter)
     if matchre("$roomplayers", "%healplayer who is lying down") then goto HEAL_WAIT_PAUSE
     pause 0.5
     if (%healcounter > %healtotal) then goto LIE_DOWN
     goto HEALING_WAIT
     
QUIT:
     echo =================================
     echo ** CANNOT FIND DARKBOX ANYWHERE!
     echo =================================
     exit
BROKE:
     echo ================================
     echo * NOT ENOUGH MONEY IN BANK
     echo * Too broke to play darkbox
     echo ================================
     exit
     
AUTOMOVE:
     delay 0.0001
     var Destination $0
     var automovefailCounter 0
     if (!$standing) then gosub AUTOMOVE_STAND
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     delay 0.0001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     put #goto %Destination
     matchwait
AUTOMOVE_STAND:
     pause 0.1
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing\.
     send stand
     matchwait
AUTOMOVE_FAILED:
     evalmath automovefailCounter (automovefailCounter + 1)
     if (%automovefailCounter > 5) then goto AUTOMOVE_FAIL_BAIL
     send #mapper reset
     pause 0.5
     pause 0.1
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     put #echo
     put #echo >$Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >$Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
     exit
AUTOMOVE_RETURN:
     return
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