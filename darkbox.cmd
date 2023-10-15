#######################################
# DARKBOX BY SHROOM
# Hollow's Eve DarkBox Script 
# UPDATED 11/11/22 FOR ANDRESHLEW HE!
#######################################
# Finds the Darkbox and plays
# Runs to get healed when hurt
# Gets money from bank when broke
#
# IMPORTANT! - IF RUNNING THIS AS AN EMPATH
# SCRIPT ASSUMES YOU HAVE HEAL / REGEN FOR SELF-HEALING
# IF YOU DO NOT HAVE EITHER - WILL PROBABLY RUN INTO ISSUES
#############################################################

# YOUR VARIABLES HERE
# PREMIUM USER? ON OR OFF
var PREMIUM ON

# MAIN CONTAINER
var CONTAINER backpack
# BACKUP CONTAINER
var CONTAINER2 vortex
# BACKUP BACKUP CONTAINER
var CONTAINER3 portal

# JUNK IS ITEMS TO ALWAYS THROW AWAY WHEN YOU FIND THEM 
# SET 'var junk NULL' - TO KEEP EVERYTHING - BUT BEWARE IF YOU DO THERE WILL BE A TON OF CRAP LOOT TO SORT THROUGH!
# THIS DEFAULT LIST SHOULD BE FAIRLY AGGRESSIVE IN GETTING RID OF ALMOST ALL JUNK THAT I DONT CARE ABOUT
# SHOULD DUMP ALL FOOD / CLOTHING / FLUFF / CAMBRINTHS / CHARMS / ALCHEMY HERBS
var junk ascot|small pouch|coin|rockweed|kelp|sharkskin|cloak|captain's hat|cambrinth (ring|viper|cobra|earcuff|anklet|coyote|armband)|bulging pouch|cebi root|yelith root|flowers|ocarina|powder|skullcap|surcoat|burlap cloth|headscarf|shirt|cape|pants|belt|sash|boots|\bcap\b|\bhat\b|necklace|badger|centaur|frog|heron|welkin|coyote|cobra|viper|bacon|venison|bread|kabob|rolls|pineapple|pie|jerky|tobacco|cigar|whistle|nectarine|pear|quince|pipe|armband|earcuff|jacket|breeches|raspberry|silk blouse|chocolate cake|felt hat|ascot|sundress|crackers|\bham\b|walking stick|\bbeer\b|apple|eye patch|moccasin|hisan flowers|spiked axe|hunterman's axe|cheesecake|spareribs|hardtack|orange slice|steak|stew|quince|strawberry|moccasins|mage's robe|pipe|silk shirt|bodice dagger|blouse|mash|trousers|muffin|carving knife|dagger|axe|wizard's robe|acolyte's alb|robe|wheel|truffle|nectarine|pear|coconut ball|square

# END USER VARIABLES - DO NOT TOUCH BELOW HERE
##########################################################################
##########################################################################
##########################################################################
eval junk replacere("%junk", "\|+", "|")
eval junk replacere("%junk", "\|$", "")
eval junk replacere("%junk", "^\|", "")
var searchloop 0
var DarkboxRoom 3
var item null
action goto GET_HEALED when ^HEALME|^HEALNOW
action goto GET_HEALED when ^Unfortunately\, your wounds make it impossible for you to play the Darkbox
action goto GET_COIN when ^You try to play the Darkbox\, but realize you don't have the 100 .+ required
action goto GET_COIN when ^You try to play the Darkbox\, but realize you don't have the 200 .+ required
action var item $1;goto DROPPED_ITEM when ^Your (.*) falls to the ground\.
action var tickets $1 when ^You pick up (\d+) Hollow Eve tickets
echo
echo ######################
echo # DARKBOX SCRIPT BY SHROOM
echo # SEARCHING FOR THE DARKBOX!
echo ######################
echo
echo
echo ######################
echo # TRASH ITEMS WE WILL AUTO-DUMP:
echo # %junk
echo ######################
echo
pause 0.1
     var boxloop 0
     if matchre("$righthand $lefthand", "(bow|crossbow|sling)") then send unload
     pause 0.2
     pause 0.1
     pause 0.1
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
     if ("$zoneid" = "150") then goto DONE_AUTOEMPATH
PLAY:
     math boxloop add 1
     if !contains("$roomobjs", "the Darkbox") then goto FIND_DARKBOX
     if ($bleeding) && ($health < 90) then goto GET_HEALED
     var DarkboxRoom $roomid
     if ($standing = 0) then gosub STAND
     pause 0.01
     pause 0.2
     send play darkbox
     pause 2
     pause
     if ("$righthandnoun" = "pouch") then put open my $righthand
     if ("$lefthandnoun" = "pouch") then put open my $lefthand
     pause 0.001
     if matchre("$righthand $lefthand", "pouch") then 
          {
               put get ticket
               pause 0.5
               put #echo >Log MediumOrchid *** Darkbox - %tickets HE tickets
          }
     pause 0.1
PLAY_2:
     pause 0.1
     if ("$righthand" != "Empty") then
          {
               echo
               echo #################
               echo FOUND ITEM: $righthand 
               echo #################
               echo
               put #echo >Log MediumOrchid *** Darkbox - $righthand
          }
     if ("$lefthand" != "Empty") then
          {
               echo
               echo #################
               echo FOUND ITEM: $lefthand 
               echo #################
               echo
               put #echo >Log MediumOrchid *** Darkbox - $lefthand
          }
     pause 0.1
     if matchre("$righthand", "(?i)\b(%junk)\b") then gosub EMPTY_RIGHT
     if matchre("$lefthand", "(?i)\b(%junk)\b") then gosub EMPTY_LEFT
     pause 0.1
     if (("$lefthand" != "Empty") || ("$lefthand" != "Empty")) then
          {
               echo
               echo ####################
               echo *** KEEPING: $lefthand ! ***
               echo ####################
               echo
               if ("$lefthand" != "Empty") then put put $lefthandnoun in my %CONTAINER
               pause 0.8
               pause 0.5
               pause 0.5
               if ("$lefthand" != "Empty") then put put $lefthandnoun in my %CONTAINER2
               pause 0.9
               pause 0.5
               if ("$righthand" != "Empty") then put put $righthandnoun in my %CONTAINER3
               pause 0.1
               pause 0.3
          }
     if (("$righthand" != "Empty") || ("$righthand" != "Empty")) then
          {
               echo
               echo ####################
               echo *** KEEPING: $righthand ! ***
               echo #####################
               echo
               if ("$righthand" != "Empty") then put put $righthandnoun in my %CONTAINER
               pause 0.8
               pause 0.5
               pause 0.5
               if ("$righthand" != "Empty") then put put $righthandnoun in my %CONTAINER2
               pause 0.9
               pause 0.5
               if ("$righthand" != "Empty") then put put $righthandnoun in my %CONTAINER3
               pause 0.1
               pause 0.3
          }
     if ("$righthand" != "Empty") then put STOW right
     if ("$lefthand" != "Empty") then put STOW left
     pause 0.1
     pause 0.1
     if ("$righthand" != "Empty") then
          {
               echo
               echo ###################
               echo *** NO ROOM IN YOUR CONTAINERS!
               echo *** MAKE SOME ROOM
               echo *** DROPPING ITEM!
               echo ###################
               echo
               gosub EMPTY_RIGHT
          }
     if ("$lefthand" != "Empty") then
          {
               echo
               echo ###################
               echo *** NO ROOM IN YOUR CONTAINERS!
               echo *** MAKE SOME ROOM
               echo *** DROPPING ITEM!
               echo ###################
               echo
               gosub EMPTY_LEFT
          }
     if (%boxloop > 10) then 
          {
               send dump junk
               var boxloop 0
          }
     goto PLAY
     
DROPPED_ITEM:
     pause 0.1
     pause 0.1
     pause 0.1
     pause 0.1
     if contains("%item", "pouch") then put open pouch
     pause 0.2
     if contains("%item", "pouch") then put get ticket
     pause 0.2
     if !matchre("%junk", "%item") then goto PLAY
     put get %item
     pause 0.5
     goto PLAY_2
     
EMPTY_RIGHT:
     echo
     echo ######################
     echo * DUMPING JUNK: $righthand
     echo ######################
     echo
     gosub TRASH_CHECK
     pause 0.2
     if ("%trash" != "null") then put put my $righthandnoun in %trash
     else put drop my $righthand
     pause 0.5
     if ("$righthand" != "Empty") then send empty right
     pause 0.5
     return
EMPTY_LEFT:
     echo
     echo ######################
     echo * DUMPING JUNK: $lefthand
     echo ######################
     echo
     gosub TRASH_CHECK
     pause 0.2
     if ("%trash" != "null") then put put my $lefthandnoun in %trash
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

     
FIND_DARKBOX:
     math searchloop add 1
     echo
     echo *** No Darkbox found! Searching...
     echo
     # waitforre the Darkbox
     # goto PLAY
BABY_ARACHNID:
     echo
     echo *** SEARCHING FOR DARKBOX
     echo
     gosub BOX_SEARCH 1
     gosub BOX_SEARCH 3
     gosub BOX_SEARCH 8
     gosub BOX_SEARCH 10
     gosub BOX_SEARCH 11
     gosub BOX_SEARCH 12
     gosub BOX_SEARCH 13
     gosub BOX_SEARCH 21
     gosub BOX_SEARCH 22
     gosub BOX_SEARCH 23
     gosub BOX_SEARCH 24
     gosub BOX_SEARCH 25
     gosub BOX_SEARCH 26
     gosub BOX_SEARCH 27
     gosub BOX_SEARCH 28
     gosub BOX_SEARCH 29
     gosub BOX_SEARCH 30
     gosub BOX_SEARCH 31
     gosub BOX_SEARCH 32
     gosub BOX_SEARCH 33
     gosub BOX_SEARCH 34
     gosub BOX_SEARCH 35
     gosub BOX_SEARCH 36
     gosub BOX_SEARCH 41
     gosub BOX_SEARCH 42
     gosub BOX_SEARCH 43
     gosub BOX_SEARCH 44
     gosub BOX_SEARCH 45
     gosub BOX_SEARCH 46
     gosub BOX_SEARCH 47
     gosub BOX_SEARCH 48
     gosub BOX_SEARCH 49
     gosub BOX_SEARCH 50
     gosub BOX_SEARCH 51
     gosub BOX_SEARCH 52
     gosub BOX_SEARCH 55
     gosub BOX_SEARCH 56
     gosub BOX_SEARCH 57
     gosub BOX_SEARCH 58
     gosub BOX_SEARCH 130
     gosub BOX_SEARCH 59
     gosub BOX_SEARCH 60
     gosub BOX_SEARCH 61
     gosub BOX_SEARCH 62
     gosub BOX_SEARCH 63
     gosub BOX_SEARCH 64
     gosub BOX_SEARCH 65
     gosub BOX_SEARCH 66
     if (%searchloop > 4) then goto QUIT
echo
echo =====================================
echo *** NO DARKBOX FOUND!!! 
echo *** Maybe it moved.. checking again.
echo =====================================
echo
pause 3
goto FIND_DARKBOX

BOX_SEARCH:
     var room $0
     pause 0.1
     gosub automove %room
     if contains("$roomobjs", "the Darkbox") then goto FOUND_DARKBOX
     return

FOUND_DARKBOX:
     pause 0.1
     echo
     echo ======================
     echo ** FOUND THE DARKBOX! 
     echo ** RoomID: $roomid
     echo ======================
     echo 
     put #echo >Log Lime *** Found Darkbox - Room: $roomid
     goto PLAY
####################################################
GET_HEALED:
     var healloop 0
     echo
     echo ===============
     echo * GETTING HEALED!
     echo ===============
     echo
     pause 0.001
     if ("$guild" = "Empath") then
          {
               gosub AUTOMOVE 11
               pause 0.01
               if ($SpellTimer.Regenerate.active = 0) then
                    {
                         put prep regen 20
                         pause 15
                         put cast
                         pause 0.5
                    }
               if ($SpellTimer.Heal.active = 0) then
                    {
                         put prep heal 24
                         pause 16
                         put cast
                         pause 0.5
                    }
               goto WAIT_HEAL_2
          }
     if matchre("%item", "pouch") then 
          {
               send open pouch
               pause 0.5
               send get ticket
               pause 0.5
          }
     gosub automove 2
     pause 0.5
     if ("$game" != "DRF") then goto PRIME_HEAL 
WAIT_HEAL:
     var Empath NULL
     math healloop add 1
     if !matchre("$roomplayers","(Gwyddion|Marino|Sawbones|Bedlam|Skrillex|Odium|Spinebreaker|Thad|Bayndayd|Beerfest|Healbitch)") then goto PRIME_HEAL
     if matchre("$roomplayers", "Bayndayd") then var Empath Bayndayd
     if matchre("$roomplayers", "Thad") then var Empath Thad
     if matchre("$roomplayers", "Marino") then var Empath Marino
     if matchre("$roomplayers", "Sawbones") then var Empath Sawbones
     if matchre("$roomplayers", "Skrillex") then var Empath Skrillex
     if matchre("$roomplayers", "Bedlam") then var Empath Bedlam
     if matchre("$roomplayers", "Odium") then var Empath Odium
     if matchre("$roomplayers", "Spinebreaker") then var Empath Spinebreaker
     if matchre("$roomplayers", "Beerfest") then var Empath Beerfest
     if matchre("$roomplayers", "Healbitch") then var Empath Healbitch
     if ("%Empath" = "NULL") then goto PRIME_HEAL 
	put lean %Empath
WAIT_HEAL_2:
     pause 40
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     if (%healloop > 3) then goto PRIME_HEAL
     goto WAIT_HEAL
     
PRIME_HEAL:
     gosub automove dolphin
     pause 0.001
     if ("$guild" = "Empath") then goto GET_HEALED
     send go corral
     waitforre ^You also see|Obvious paths|Nearby in the water
     pause 0.1
     put #mapper reset
     pause 0.1
     if ("$game" = "DRF") then
          {
               gosub automove 85
               goto WAIT_HEAL
          }
     if matchre("%PREMIUM", "ON") then 
          {
               if ($zoneid = 67) then gosub automove east
               put go meeting portal
               pause 0.5
          }
     if ($zoneid = 66) then gosub automove east
     gosub automove healer
     if ($zoneid = 1) then 
          {
               gosub automove w gate
               pause 0.2
               gosub automove dok
          }
     gosub HEALTH_CHECK
     if !($needHealing) then goto DONE_AUTOEMPATH
     goto AUTO_HEALER
DONE_AUTOEMPATH:
     put #echo >Log DeepPink *** Got healed
     if matchre("$roomname", "Andreshlew") then goto RETURN_TO_BOX
     if ($zoneid = 4) then gosub automove cross
     if ($zoneid = 67) then gosub automove east
     if ($zoneid = 66) then gosub automove portal
     if matchre("$zoneid", "\b(1|30|90|99)\b") then gosub automove dock
     if ($zoneid = 150) then gosub automove mammoth
     send whistle for dolphin transport
     waitforre ^\[Andreshlew, South Dock\]
     put west
     pause 0.4
     goto RETURN_TO_BOX
     
GET_COIN:
     pause 0.1
     gosub automove teller
     pause 0.5
     if !matchre("$roomname", "Purser's Office") then gosub automove teller
     pause 0.5
     matchre COIN_DONE ^The clerk counts out
     matchre BROKE ^The clerk tells you\, \"You don't have that much money
     ##"
     put withdraw 15 plat
     matchwait 20
     goto BROKE
COIN_DONE:
     pause 0.5
     put #echo >Log Yellow *** Got 15 plat from bank
RETURN_TO_BOX:
     #put #echo >Log DeepPink *** Got healed
     pause 0.3
     gosub automove %DarkboxRoom
     put #echo >Log Lime *** Returning to darkbox - Room %DarkboxRoom
     if !contains("$roomobjs", "the Darkbox") then goto FIND_DARKBOX
     goto PLAY
     
TEETH:
     matchre RETURN ^What|^I could not
     matchre GIVE_TEETH ^You get|You pull
     put get my shark tooth
     matchwait 3
GIVE_TEETH:
     put give tooth to work
     pause 0.4
     goto TEETH
#######################################################
AUTO_HEALER:
     var LAST AUTO_HEALER
     pause 0.1
     pause 0.2
     if ("$zoneid" = "4") then goto LIE_DOWN
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
     if ("$guild" = "Empath") then 
         {
            send prep heal 25
	       pause 25
	       send cast
         }
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
     ###"
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
##### STANDING SUB
STAND:
     delay 0.0001
     var LOCATION STAND_1
     STAND_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,|^Please wait\.
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
     matchwait 20
     goto AUTOMOVE_RETURN
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