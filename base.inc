## OBSOLETE - NOW USING MASTER-TRIGGERS.INC AND UTILITY.INC
#debuglevel 10
include move.inc
counter set 0
timer clear

var trash splintered war club|vulture|pick|$origami|arrowhead|mining cowl
var skins malchata rib|scale|barb|claw
var retry.command.triggers ^\.\.\.wait\s+\d+\s+sec(?:onds?|s)?\.?$|^Sorry\,|^You are still stunned|^You don't seem to be able to move to do that|^You can't do that while entangled in a web|^You struggle against the shadowy webs to no avail\.|^You struggle with .* great weight but can't quite lift it\!|^You attempt that, but end up getting caught in an invisible box\.|^Sorry, you may|^It's all a blur\!|You notice a single flea leap off of your|Something tickles under your arm|Several fleas the size of rice-grains swarm|Your feet are suddenly consumed by the painful biting|A tremendous itching begins|A slight tickle precedes a painful itch
var boxtype brass|copper|deobar|driftwood|iron|ironwood|mahogany|oaken|pine|steel|wooden
var boxes coffer|crate|strongbox|caddy|casket|skippet|trunk|chest

#put .scriptcheck
#pause 0.1
put /expecho on
put /expecho pulse off
##########################################################################################
##DEFAULT VARIABLES
var LOOPED NO
var STOLEN NO
var COMBAT_LOOP 0
var HEALING_LOOP 0
var JAILED 0
var LOGOUT 0
var RANKS 0
var DEATHS 0
var startingtdp 0
var currenttdp 0
var BOXES OFF
var HEALING OFF
var STEALING OFF
var GEMS OFF
var REPAIR OFF
var TOTAL.PROFIT 0
var lirums 0
var kronars 0
var dokoras 0
var healingloop 0
var bagsFull 0
var Plat 0
var Gold 0
var Silver 0
var Bronze 0
var Copper 0
var Plats 0
var Golds 0
var Silvers 0
var Bronzes 0
var Coppers 0
var reset 0
var stun.connect OFF
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
var POISON NO
var INFECTED NO
#############################
# MAIN ACTIONS
#############################
ACTION.INIT:
### CHARACTER TRIGGERS
     action goto ROPE.BRIDGE.STUCK when ^You find it hard to concentrate on anything but getting across the bridge
     #action send 7 nod $1 when (\S+) asks you
     action instant send 4 'yep when anyone here/?
     action instant send 4 'aye when hunting here/?
     
### PRIME ACTIONS
     #action send teach debil to psi when Psilocybe just arrived
     action put #echo >Log Pink *** Healed by player $1 when ^(\S+) lays (.*) hand on your arm
     action send 7 bow $1 when ^(\S+) lays (.*) hand on your arm
     action send 7 cheer $1 when Small tendrils of curious silvery light slither from (\S+)'s fingertips toward you
     action send 6 nod when healing\?|heal\?|healin\?
     #action send 3 nod $1 when (\S+) asks you
     #action send 3 nod when class\?*|healing\?|heal\?
### RETREAT TRIGGER
     action (retreat) send retreat when closes to pole weapon range on you|charges|closes to melee range on you|lands a.*to your|retreat back to pole|isn't loaded
     action (retreat) off
### MATH TRIGGERS
     action math JAILED add 1; put #statusbar 4 JAILED: %JAILED when NAILED AND JAILED
     action math RANKS add 1; put #statusbar 7 RANKS: %RANKS when ^You've gained a new
     action var currenttdp $1;put #statusbar 9 *CURRENT TDPs: %currenttdp when Time Development Points: (\d+)  
     action send #math rtotalmoney add $1 when hands you (\d+) Kronars.
     action send #math rtotalmoney add $1 when hands you (\d+) Lirums.
     action send #math rtotalmoney add $1 when hands you (\d+) Dokoras.
     action send #math rtotalranks add 1 when You've gained a new rank
### MISC TRIGGERS
     action put #echo >Log DeepPink **** GOT LOCATED!!! **** when You get an odd feeling that someone is watching you
     action goto GENIE.ERROR when ^Your worn items are\:
     action var ORIGAMI.RESTOCK ON when ORIGAMI.ENVELOPES.OUT
     action goto %LAST when AUTOMAPPER MOVEMENT FAILED
     action goto REPAIR.TOOLS when REPAIR.TOOLS
     #action goto STEALDONE when TAKING CARE OF BUSINESS
     action goto RESET when RESET COMBAT PLZ|RESET GENIEHUNTER
     action goto COMBAT.TIMEOUT when COMBAT.TIMEOUT
     action goto ORB.DONE when your sacrifice is properly prepared
     action goto GET.FAVOR when ^Note: Some rub locations may not be available
     action goto SLEEP.WAKE when Use WAKE to wake yourself|You abruptly stop in your tracks and fall over into a deep sleep|You're unconscious
     action goto SOCIAL.OUTRAGE when The first blow hits you square in the stomach, knocking the wind out of you|Let's leave him for the vultures
     action send dump junk when ^The room is too cluttered to find anything here\!
     #action var itemtostow $2;goto stowfootitem when ^You notice (.*) (\S+) at your feet\, and do not wish to leave it behind\.
     action var itemtostow $1;goto stowfootitem when ^You notice .* (\w+)(?: with a tempered \w+| with a wire-bound black ironwood handle at your feet| with a reinforced \w+| etc)? at your feet, and do not wish to leave it behind\.
	action put #echo >Log Crimson **** LOST AND FOUND HAS ONE OF YOUR ITEMS!! when Our paperwork indicates you have a lost item in our possession
     action put #echo >Log Red *** YOU DROPPED YOUR $1 !!!! **** when Your (.+) falls to the ground\.
     action put #echo >Log2 Lime *** GOT GM RP AWARD! *** when Congratulations $charactername!  You just received an award for roleplaying! 
     action put #echo >Log2 Lime *** GOT $1 PIRP POINTS! *** when You just received (\d+) PIRP points
     #action put #echo >Log Chartreuse *** DING!!! CIRCLE $circle ! **** when Excellent work, $charactername|Congrats, $charactername|$charactername, you made it to the next rank|I'll let it be known you've moved up in the underworld|You're ready to train for your next rank|You are ready to train for your next level
### TF ACTIONS
     #action put #queue clear;send khri silence;goto KILL when ^Galantie turns to face you.
     #action send give $1 $2 $3 $4 when ^(\S+) gives you (\d+) (\w+) (\S+)\.
### JAIL TRIGGERS
     action (jail) goto JAIL when ^The eyes of the court are upon you|PLEAD INNOCENT or PLEAD GUILTY|Your silence shall be taken|How do you plead\?|Shouldn't you be worrying about something else
     action (jail) goto JAIL when ^You slowly wake up again to find that all your belongings|a sound not unlike that of a tomb|binds you in chains|firmly off to jail|drag you off to jail|brings you to the jail|Dwarves burst out from everywhere|your belongings have been stripped|in a jail cell wearing a set of heavy manacles
     action (jail) goto JAIL when strip you of all your possessions|binds your hands behind your back|your possessions have been stripped|the last thing you see before you black out|Do not resist, for your crimes must be answered for|Jail Cell|Gallows Tree, Cell
     action (jail) goto JAIL when Your silence shall be taken as an indication of your guilt|The eyes of the court are upon you|Your silence can only be taken as evidence of your guilt
     action (jail) on
### COMBAT / ESCAPE ACTIONS
     action (cough) if $hidden = 1 then send 1 cough when ^.+ just arrived\.
     action (cough) off
     action instant (escape) goto ESCAPE when ESCAPE PLZ|HELP.ESCAPE.PLZ|ESCAPE.PLZ
     action instant goto COMBAT.TIMEOUT when COMBAT TIMEOUT
     action instant goto ESCAPE.AMMO when OUT.OF.AMMO
     action instant goto ESCAPE.SKINS when GO.SELL.SKINS
     action instant goto ESCAPE.BOXES when GO.PICK.BOXES
     action instant (escape) goto ESCAPE.SHIELD when destroys your shield
     action instant (escape) goto ESCAPE when ^Feeling depressed\?
     action instant (escape) goto HEAL when ^A tingling sensation spreads through your body\.
     action instant (escape) goto HEAL when ^The spell pattern resists the influx of .* mana though you are able to channel the worst of the backlash into your nervous system\.
     action instant (escape) goto HEAL when ^A sudden and violent explosion of pale\, sickly green light ruptures from within your fingertips\, cascading up in a dramatic\, shuddering display that finally collapses upon you like a tidal wave\!
     action instant (escape) goto STUNNEDOUT when eval ($health <= 45)
     action instant (escape) goto STUNNEDOUT when ^You're.*(extremely bad shape|smashed up|terribly wounded)
     action instant (escape) goto STUNNEDOUT when ^You're.*(badly hurt|very badly hurt)
     action instant (escape) goto STUNNEDOUT when ^Your body feels (extremely beat up|bad shape)
     action instant (escape) goto ESCAPE.START when ^You move along to follow your mark
     action (escape) off
     action instant (combat) goto ESCAPE when eval ($health < 85)
     action instant (combat) goto ESCAPE when eval ($bleeding = 1)
     action instant (combat) goto ESCAPE when eval ($poisoned = 1)
     action instant (combat) goto ESCAPE when eval ($diseased = 1)
     action (combat) off
### PANIC EXIT TRIGGERS
     action instant put #echo >$Log Crimson $datetime $1 held my hand!;put #echo >Log Crimson $datetime $1 held my hand!;goto EXIT_TEMP when ^(\S+) reaches over and holds your hand\.
     action instant put #echo >$Log Crimson $datetime $1 held my hand!;put #echo >Log Crimson $datetime $1 held my hand!;goto EXIT_TEMP when ^(\S+) clasps your hand tenderly\.
     action instant put #echo >$Log Crimson $datetime $1 dragged me!;put #echo >Log Crimson $datetime $1 dragged me!;goto EXIT_TEMP when ^(\S+) grabs your arm and drags you.*\. \. \.
     action instant put #echo >$Log Crimson $datetime $1 dragged me!;put #echo >Log Crimson $datetime $1 dragged me!;goto EXIT_TEMP when ^(\S+) grabs you and drags you.*\. \. \.
     action instant put #echo >$Log Crimson $datetime $1 dragged me!;put #echo >Log Crimson $datetime $1 dragged me!;goto EXIT_TEMP when ^(\S+) grabs your arm and tries to drag you, but you resist and stand firm\.
     action instant put #echo >$Log Crimson $datetime $1 faced me!;put #echo >Log Crimson $datetime $1 faced me!;goto EXIT_TEMP when ^(\S+) turns to face you\.
     action instant put #echo >$Log Crimson $datetime $1 advanced on me!;put #echo >Log Crimson $datetime $1 advanced on me!;goto EXIT_TEMP when ^(\S+) begins to advance on you\!
     action instant put #echo >$Log Crimson $datetime $1 advanced at me!;put #echo >Log Crimson $datetime $1 advanced on me!;goto EXIT_TEMP when ^(\S+) begins to stealthily advance on you\!
     action instant put #echo >$Log Crimson $datetime $1 advanced at me!;put #echo >Log Crimson $datetime $1 advanced on me!;goto EXIT_TEMP when ^You notice (\S+) as (he|she) stealthily closes to (pole weapon|melee) range on you\.
     action instant put #echo >$Log Crimson $datetime $1 aimed at me!;put #echo >Log Crimson $datetime $1 aimed at me!;goto EXIT_TEMP when ^(\S+) appears to be aiming at you with .*\.
     action instant put #echo >$Log Crimson $datetime Entered Combat when we weren't expecting it!;put #echo >Log Crimson $datetime Entered combat unexpectedly!;goto EXIT_TEMP when ^You are a little too busy with combat to worry about that
     #action goto exit when rushes in and engages you!
     #action goto exit when is slain before your eyes! 
### FULL EXIT TRIGGERS 
     action instant put #echo >$Log Crimson $datetime I'm dying!;goto EXIT_FULL when ^You feel yourself falling\.\.\.
     action instant put #echo >$Log Crimson $datetime I died!;goto EXIT_FULL when eval ($dead = 1)
     #action instant put #echo >$Log Crimson $datetime Low Health!;goto EXIT_FULL when eval ($health < 30)
     action instant put #echo >$Log Crimson $datetime Dammit, Genie!;goto GENIE_FUCKUP when ^Your worn items are\:
# RECONNECT ACTIONS
     action instant goto RESET.SCRIPT when eval $useridle = 1
     action instant goto RESET.SCRIPT when ^YOU HAVE BEEN IDLE TOO LONG
     action instant goto RESET.SCRIPT when prods you between the shoulder
     action (reconnect) goto DISCONNECTED when eval $connected = 0
     action (reconnect) goto DISCONNECTED when ^Reconnect aborted|^Unable to contact Genie Key server|^Unable to get login key|^Please make sure that your internet connection|^Connection closed|(ConnectionTimedOut)
     action (reconnect) goto DISCONNECTED when ^Connection lost|^ConnectionAborted|^Socket Error|connection dropped|connection closed|^ReceiveCallback Exception|Unable to contact Genie Key server
     action (reconnect) goto RECONNECTED when ^You look around, taking a moment to get your bearings|^Welcome to DragonRealms|reconnect now
     action (reconnect) goto RECONNECTED when Please check for new or updated items in NEWS\!
     
#WEAPON EXP TRIGGERS FOR GENIEHUNT SMART WEAPON TRAINING
     action (weapon) goto COMBAT.DECIDE when GH WEAPON FINISHED
     action var WEAPON_EXP Brawling when BRAWLING\!
     action var WEAPON_EXP Small_Edged when SMALL_EDGED! 
     action var WEAPON_EXP Offhand_Weapon when OFFHAND!
     action var WEAPON_EXP Slings when SLING!
     action var WEAPON_EXP Heavy_Thrown when HEAVY_THROWN!
     action var WEAPON_EXP Light_Thrown when LIGHT_THROWN!
     action var WEAPON_EXP Twohanded_Edged when TWOHANDED_EDGED!
     action var WEAPON_EXP Large_Edged when LARGE_EDGED!
     action var WEAPON_EXP Small_Edged when SMALL_EDGED!
     action var WEAPON_EXP Twohanded_Blunt when TWOHANDED_BLUNT!
     action var WEAPON_EXP Small_Blunt when SMALL_BLUNT!
     action var WEAPON_EXP Large_Blunt when LARGE_BLUNT!
     action var WEAPON_EXP Polearm when POLEARM!
     action var WEAPON_EXP Staves when STAVES!
     action var WEAPON_EXP Bow when BOW\!|Training Bow\!
     action var WEAPON_EXP Crossbow when CROSSBOW\!|Training Crossbow\!
### END OF ACTIONS
goto end.of.file
###############################################################################################################################################
### OLD OBSOLETE ACTIONS
     #action goto UBERMONSTER when NOTHINGRIGHTNOWXXX
     #action put #queue clear; send 1 $lastcommand when (\.\.\.wait|type ahead|^You don't seem to be able to move to do that)
     #action goto STUNNEDOUT when ^You are still stunned 
     #action goto ENEMY.LOGOUT when ^\w+ begins to focus on you\!
     #action goto ENEMY.LOGOUT when ^\w+ begins to aim at you
     #action goto ENEMY.LOGOUT when ^\w+ turns to face you\.
     #action goto ENEMY.LOGOUT when ^\w+ gestures at you\.
     #action goto ENEMY.LOGOUT when ^\w+ appears to be aiming at you
     #action goto ENEMY.LOGOUT when ^Something grabs your arm and drags you \w+ with it . . .
     #action goto ENEMY.LOGOUT when ^Something grabs your arm and tries to drag you, but you resist and stand firm\.
     #action goto DEAD when ^Your death cry echoes in your brain 
     #action goto DEAD when ^You feel like you're dying
     #action goto DEAD when ^You are a ghost\!
     #action goto DEAD when ^You are dead
     #action goto DEAD when ^The dead can't dance!
     #action goto DEAD when ^Your body will decay beyond its ability to hold your soul
     #action goto DEAD when ^You are somewhat comforted that you have gained favor with your God and are in no danger of walking the Starry Road, never to RETURN\.
     #action goto ESCAPE when ^\[You're.*beat up 
     #action goto ESCAPE when ^\[You're.*very beat up
     #action goto ESCAPE when ^You are carrying between 400
     #action goto ESCAPE when reduce your inventory count below 400 items
     #action goto STUNNED when ^\[You're.*badly hurt 
     #action goto STUNNED when ^\[You're.*very badly hurt 
     #action goto STUNNED when ^\[You're.*smashed up
     #action goto STUNNED when ^\[You're.*terribly wounded
     #action goto STUNNED when ^\[You're.*near death
     #action goto STUNNED when \[You're.*in death's grasp
     #action goto DEAD when ^Your death cry echoes in your brain 
     #action goto DEAD when ^You feel yourself falling... 
     #action goto DEAD when ^You feel like you're dying!
     #action goto DEAD when ^You are dead
     #action goto DEAD when ^The dead can't dance!
     #action goto DEAD when ^You are a ghost\!  You must wait until someone resurrects you, or you decay\.
     #action send give galantie $1 copper $2; goto killgal when ^Galantie gives you (\d+) copper (.+)\.
     #action (killgal) on
     #action (killgal) goto killgal when ^Galantie appears to be aiming at you
     #action (killgal) goto killgal when ^You notice Galantie attempting to stealthily advance upon you
     #action (killgal) goto killgal when ^Galantie closes to melee range on you
     #action (killgal) goto killgal when ^You notice Galantie trying to edge quietly past you
     #if contains("$roomplayers","Galantie") then goto killgal
     #action (killgal) goto killgal when ^Galantie moves into the area\, hunting you down
     #action (killgal) goto killgal when ^Galantie whispers
     #action (killgal) goto killgal when Galantie just arrived
################################################################################################

################################################################################################
#################################
###GENIEHUNTER WEAPON CONTROL
### SORT GOSUB
### USAGE:
### var skills Medium_Edged|Heavy_Edged|Long_Bow
### var count 3
### gosub sort %skills %count
### echo %sort
sort:
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
#############################
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
					#put .geniehunter multi %%sort(%ix)
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
##############################################################
LEAVE.SEACAVES:
     gosub automove exit
     send go exit portal
     wait
     RETURN
     
TO.SEACAVE:
TO.SEACAVES:
     gosub automove portal
     pause 0.5
     send go meeting portal
     wait
     RETURN


     
DISARM.CHECK:
pause .1
#if matchre("$roomobjs", "%boxes") then goto GET_BOX
 
container.Check:
        pause .01
        pause .01
        pause .01
                matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
                match container.Check1 Encumbrance
        send look in my back;enc
        matchwait
container.Check1:
        pause .1
        pause .01
        pause .01
                matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
                match container.Check2 Encumbrance
        send look in my bag;enc
        matchwait
container.Check2:
        pause .1
        pause .01
        pause .01
                matchre DISARM.ON (coffer|trunk|chest|strongbox|skippet|caddy|crate|casket|box)
                match RETURN Encumbrance
        send look in my hav;enc
        matchwait
       
DISARM.ON:
var BOXES ON
RETURN
##########################################
#### DUMPS TRASH
##########################################
EMPTY.PACK.CHECK:
     var bag $1
     action var contents $1 when ^You rummage through .+ and see (.*)\.  
     put rummage my %bag
     waitforre ^You rummage
     eval contents replace("%contents", ", ", "|")  
     eval contents replace("%contents", " and ", "|")  
     var contents |%contents|
     eval total count("%contents", "|")  
Loop:  
     eval item element("%contents", 1)  
     eval number count("%contents", "|%item")  
     var count 0
     gosub RemoveLoop
     action setvariable item $1 when ^@a .* (\S+)$
     put #parse @%item
     counter set %count
     if contains("%trash", "%item") then gosub storeitem
     if %contents != "|" then goto Loop  
     RETURN
RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents", "|%item|", "|")
     eval contents replace("%contents", "||" "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto RemoveLoop
storeitem:
     counter subtract 1
     pause 0.2
     send get my %item
     pause 0.2
     if contains("$roomobjs","driftwood log") then GOSUB putmy %item in log
     if contains("$roomobjs"," bucket of viscous gloop") then GOSUB putmy %item in bucket
     if contains("$roomobjs","waste bin") then GOSUB putmy %item in bin
     if contains("$roomobjs","oak crate") then GOSUB putmy %item in crate
     if contains("$roomobjs","firewood bin") then GOSUB putmy %item in bin
     else put drop my %item
     pause 0.2
     pause 0.1
     pause 0.1
     if %c = 0 then RETURN
     goto storeitem
putmy:
     if matchre("%item", "(%skins)") then put bund
     if "%item" = "rib" then put bund
     if "%item" = "barb" then put bund
     pause 0.1
     matchre RETURN You drop|You put
     matchre putmydrop What were you
     if contains("$roomobjs","driftwood log") then 
          {
          put put my %item in log
          matchwait
          }
     if contains("$roomobjs"," bucket of viscous gloop") then 
          {
          put put my %item in bucket
          matchwait
          }
     if contains("$roomobjs","waste bin") then 
          {
          put put my %item in bucket
          matchwait
          }
     if contains("$roomobjs","oak crate") then 
          {
          put put my %item in crate
          matchwait
          }
     send drop my %item
     matchwait
putmydrop:
     send drop my %item
     RETURN
###############################################################################################################################
#SEARCHES THE GROUND FOR AMMO / WEAPONS / ARMOR
stowAmmo:
     delay 0.001
     #gosub BLEEDERCHECK
     if contains("$righthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$lefthand" != "Empty") then gosub wear my $1
     if contains("$lefthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$righthand" != "Empty") then gosub wear my $1
     if contains("$roomobjs","(double-stringed crossbow|repeating crossbow|bloodwood dako'gi crossbow|forester's crossbow|bamboo crossbow|forester's bow|battle bow|assassin's crossbow") then gosub stow $1
     if contains("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then gosub STOWARROW
     if contains("$roomobjs","(river rock|river rocks|small rock|spider-carved rock)") then gosub STOWROCK
     if contains("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|drake-fang bolt|jagged-horn bolt|leafhead bolt|barbed bolt)") then gosub STOWBOLT
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
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt|crossbow bolt)") then
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
     if matchre("$righthand" "$lefthand" ,"grass") then put drop grass
     if matchre("$righthand" "$lefthand" ,"grass") then put drop grass
     if "$righthand" = "grass" then put drop grass
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
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
     var LOCATION STOW1
     var todo $0
STOW1:
     delay 0.0001
     if "$righthand" = "vine" then put drop vine
     if "$lefthand" = "vine" then put drop vine
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW2 not designed to carry anything|any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|^But that's closed|I can't find your container|^You can't 
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW (base.inc)
STOW2:
     delay 0.0001
     var LOCATION STOW2
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre stow3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %DEFAULT.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW2! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW2 (base.inc)
STOW3:
     delay 0.0001
     var LOCATION STOW3
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put
     matchre RETURN ^But that is already in your inventory\.
     matchre STOW4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %BOX.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW3! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW3 (base.inc)
STOW4:
     delay 0.0001
     var LOCATION stow4
     var bagsFull 1
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre RETURN ^Wear what\?|^Stow what\?
     matchre RETURN ^You put your
     matchre RETURN ^But that is already in your inventory\.
     matchre REM.WEAR any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre LOCATION.unload ^You should unload the
     matchre LOCATION.unload ^You need to unload the
     put stow %todo in my %GEM.CONTAINER
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN STOW4! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %todo
     put #log $datetime MISSING MATCH IN STOW4 (base.inc)
OPEN.THING:
     put open %BOX.CONTAINER
     put open %DEFAULT.CONTAINER
     pause 0.2
     goto STOWING
REM.WEAR:
     put rem bund
     put drop bund
     wait
     pause 0.5
     goto WEAR1
#### FILL GEM POUCHES
GEM_POUCHES:
GEM.POUCHES:
     gosub get my gem pouch
     pause 0.1
     gosub put tie my pouch
     pause 0.1
     pause 0.1
     var fill %DEFAULT.CONTAINER
     gosub FILL.POUCH
     pause 0.1
     var fill %BOX.CONTAINER
     gosub FILL.POUCH
     pause 0.1
     var fill %GEM.CONTAINER
     gosub FILL.POUCH
     pause 0.1
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
     send put my pouch in my %GEMPOUCH.CONTAINER
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
#### EMPTY HANDS
EMPTY_HANDS:
     delay 0.0001
     if ("$lefthand" != "Empty") then gosub STOW my $lefthandnoun
     if ("$righthand" != "Empty") then gosub STOW my $righthandnoun
     RETURN
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
     if ("$righthand" != "Empty") then gosub put put $righthand in my %CRAFTING.CONTAINER
     if ("$leftthand" != "Empty") then gosub put put $lefthand in my %CRAFTING.CONTAINER
     pause 0.5
     ORDER_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre ORDER_1 ^The attendant says\,\s*\"You can purchase .*\.\s*Just order it again and we'll see it done\!\"
     matchre RETURN ^The attendant takes some coins from you and hands you .*\.
     send order %order
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ORDER! (base.inc) ***
     put #echo >$Log Crimson $datetime Order = %order
     put #log $datetime MISSING MATCH IN ORDER! (base.inc)
     RETURN
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
     matchre RETURN_CLEAR ^You (?:hand|slide|get|work|pull|lob|spread|shuffle|attach|push|not|will|move|put|now|scan|wear|sling|slowly|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^But (that|you) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^The|^That|too injured
	 matchre RETURN_CLEAR ^You're
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already|has already
     matchre RETURN_CLEAR ^Tie it off
	 matchre RETURN_CLEAR ^What are you trying to attack\?
	 matchre RETURN_CLEAR ^At what are you trying to 
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
     matchre RETURN ^You (?:get|grab|pick|pull|push|twist|carefully|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^As best it can\, .* moves in your direction\.
     send get %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN GET! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN GET (base.inc)
     RETURN
REM:
REMOVE:
     var LOCATION REMOVE1
     var remove $0
     REMOVE1:
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
     put remove %remove
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN REMOVE! (base.inc) ***
     put #echo >$Log Crimson $datetime Remove = %remove
     put #log $datetime MISSING MATCH IN Remove (base.inc)
     RETURN
#### HOLD SUB
HOLD:
     delay 0.0001
     var get $0
     var LOCATION HOLD1
     HOLD1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre WAIT ^You struggle with .* great weight but can't quite lift it\!
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You are not experienced
     matchre RETURN ^You (?:sling|slide|work|slip|loosen|get|take|pull|remove|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^Get what\?
     matchre RETURN ^Hold hands with whom\?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^I could not find what you were referring to\.
     send hold %get
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN HOLD! (base.inc) ***
     put #echo >$Log Crimson $datetime Get = %get
     put #log $datetime MISSING MATCH IN HOLD (base.inc)
     RETURN
#### WEAR SUB
WEAR:
     delay 0.0001
     var stow $0
     var LOCATION WEAR1
     WEAR1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre STOW1 ^You can't wear that\!
     matchre STOW1 ^You can't wear any more items like that\.
     matchre STOW1 ^You need at least one free hand for that\.
     matchre STOW1 ^This .* can't fit over the .* you are already wearing which also covers and protects your .*\.
     matchre RETURN ^You (?:sling|put|slide|slip|attach|work|strap|hang|are already) .*(?:\.|\!|\?)?
     matchre RETURN ^What were you referring to\?
     matchre RETURN ^Wear what\?
     send wear %stow
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN WEAR! (base.inc) ***
     put #echo >$Log Crimson $datetime Stow = %stow
     put #log $datetime MISSING MATCH IN WEAR (base.inc)
     RETURN
#### DOUBLE PUT SUB
PUT_IT:
     delay 0.0001
     var putit $0
     var LOCATION PUT_IT_1
     PUT_IT_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre RETURN ^You (?:hand|slide|get|work|pull|shuffle|attach|push|move|put|now|scan|wear|sling|whisper|lean|tap|spin|filter|pick|silently|slip|realize|stop|open|close|need|drop|place|shouldn't|knock|grab|fade|toss|pour|set|add|offer|search|circle|fake|weave|shove|carefully|attach|remove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|exhale|blow|begin|rub|sprinkle|twist|struggle|vigorously) .*(?:\.|\!|\?)
     matchre RETURN ^Please rephrase that command\.
     matchre RETURN ^.* what\?
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What were you referring to\?
     send put %putit
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT_IT! (base.inc) ***
     put #echo >$Log Crimson $datetime PutIt = %putit
     put #log $datetime MISSING MATCH IN PUT_IT (base.inc)
     RETURN
#### COMBAT ATTACK SUBS
ATTACK:
     delay 0.0001
     if ($stamina < 85) then gosub STAMINA_WAIT
     var LOCATION ATTACK_1
     ATTACK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre CALMED ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN ^You can not slam with .*\!
     matchre RETURN ^There is nothing else to face
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^At what are you trying to .*\?
     matchre RETURN ^You need two hands to wield this weapon\!
     send attack
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN ATTACK! (base.inc) ***
     put #log $datetime MISSING MATCH IN ATTACK (base.inc)
     goto ATTACK
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
     matchre RETURN ^You aren't close enough to attack
     matchre RETURN ^You turn to face
     matchre RETURN ^You spin around to face
     matchre RETURN ^You stop advancing because
     matchre RETURN ^At what are you trying to .*\?
     send draw
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN DRAW! (base.inc) ***
     put #log $datetime MISSING MATCH IN DRAW (base.inc)
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
     # matchre PARRY ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     send parry
     matchwait
STAND_RET:
     put stand
     pause 0.5
RETREAT:
     var LOCATION RETREAT
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (base.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (base.inc)
2RETREAT:
     var LOCATION 2RETREAT
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN RETREAT! (base.inc) ***
     put #log $datetime MISSING MATCH IN RETREAT (base.inc)
#### WAIT FOR STAMINA
STAMINA_WAIT:
     delay 0.0001
     put #echo Crimson **************************************************
     put #echo Crimson ***** STAMINA IS LOW.  WAITING TO REGAIN IT. *****
     put #echo Crimson **************************************************
     if ($stamina < 85) then waiteval ($stamina > 90)
     RETURN
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
     matchre RETURN ^I could not find what you were referring to\.
     matchre RETURN ^What are you trying to attack\?
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
#### PREP
PREP_SPELL:
if $mana < 70 then goto return
PREP:
var location PREP1
var todo $0
PREP1:
matchre return ^You begin chanting a prayer
matchre return ^You direct your attention toward the heavens
matchre return ^You close your eyes and breathe deeply,
matchre return ^You trace an arcane sigil in the air,
matchre return ^Heatless orange flames blaze between your fingertips
matchre return ^Your eyes darken to black as a starless night
matchre return ^You raise your (arms|palms) skyward
matchre return ^You are already preparing
matchre return ^You begin chanting
matchre return ^Icy blue frost crackles up your arms
matchre return ^You make a careless gesture as you chant the words
matchre return ^Tiny tendrils of lightning jolt between your hands
matchre return ^The wailing of lost souls accompanies your preparations
matchre return ^Your skin briefly withers and tightens, becoming gaunt
matchre return ^Images of streaking stars falling from the heavens flash across your vision
matchre return ^A nagging sense of desperation guides your hands through the motions
matchre return ^You hastily shout the arcane phrasings needed to prepare
matchre return ^You deftly waggle your fingers in the precise motions needed to prepare
matchre return ^With great force, you slap your hands together before you and slowly pull them apart,
matchre return ^With no small amount of effort, you slowly recall the teachings
matchre return ^You struggle against your bindings to prepare
matchre return ^You have already
matchre return ^You raise one hand before you and concentrate
matchre return ^As you begin to focus on preparing
matchre return ^That won't affect your current attunement very much\.
put prepare %todo
matchwait 3
return

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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN TARGET_PREP! (base.inc) ***
     put #log $datetime MISSING MATCH IN TARGET_PREP (base.inc)
     RETURN
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
     RETURN
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
APPRAISE_CRITTER:
     delay 0.0001
     var critter NULL
     if matchre("$monsterlist" , "$KnownMonsters") then var critter $0
     if ("%critter" = "NULL") then RETURN
     gosub APPRAISE %critter quick
     RETURN
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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN APPRAISE! (base.inc) ***
     put #echo >$Log Crimson $datetime Appraise = %appraise
     put #log $datetime MISSING MATCH IN APPRAISE! (base.inc)
     RETURN
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
#### STOP HUMMING
STOP.HUMMING:
     pause 0.1
     put stop play
     pause
     put stop hum
     pause
     RETURN
#### PAUSE SUB
PAUSE:
     if ($roundtime > 0) then pause $roundtime
     pause 0.5
     pause 0.1
     RETURN
#### RETREAT HIDE SUB
RET.HIDE:
     put stop hum
     pause 0.1
     pause 0.1
     pause 0.1
     send ret
     send ret
     pause 0.5
     pause 0.2
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
     if %hideCounter > 1 then RETURN
     goto HIDE_1
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
KNEEL:
     pause 0.2
     send kneel
     pause 0.5
#### KHRI SUB
KHRI:
     delay 0.0001
     pause 0.01
     var LOCATION KHRI1
     var khri $0
KHRI1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
	matchre KHRI ^\.\.\.wait|^You are still stunned
	matchre KHRI.KNEEL ^Your mind and body are willing
	matchre RETURN not recognizable as a valid khri\.
	matchre RETURN ^Roundtime
	matchre RETURN ^Tapping into the well of mental power within
	matchre RETURN ^You have not recovered from your previous use of the \w+ meditation\.$
	matchre RETURN ^Focusing intently|^Roundtime|^Your mind is already focused
	matchre RETURN ^You are not trained in the
	matchre RETURN ^You strain, but cannot focus your mind enough to manage that\.$
	matchre RETURN ^You're already using the \w+ meditation.
	matchre RETURN ^Knowing that a dose of paranoia is healthy for any aspiring Thief, your mind fixates on every possible avenue of escape available to you\.$
	matchre RETURN ^Remembering the mantra of mind over matter, you let your dedicated focus seep into your muscles, feeling a sense of heightened strength as well a deeper instinctive understanding of your weaponry\.$
	matchre RETURN ^Focusing your mind, you look around yourself to find the subtle differences lurking in the shadows nearby\.  After several deep breaths, your senses have attuned themselves to finding the best hiding spots\.$
	matchre RETURN ^Willing your body to meet the heightened functionality of your mind, you feel your motions steady considerably\.$
	matchre RETURN ^With deep breaths, you recall your training and focus your mind into the most universal of meditations, improving your overall performance\.$
	matchre RETURN ^Taking a deep breath, you focus on making your mind and body one, your mental discipline trained on quickly noticing, analyzing, and evading approaching threats\.$
	matchre RETURN ^Centering your mind, you allow your practiced discipline to spread throughout your body, making thought and motion one\.$
	matchre RETURN ^You calm your body and mind, recalling your training on how to seek the vital part of any opponent.  Wrapping yourself in this cool composure, your eyes quickly become drawn to exposed weaknesses around you\.$
	matchre RETURN ^Purging yourself of all distractions and extraneous thoughts, you allow your mind and body to become one, becoming preternaturally aware of threats around you and the best ways to defend yourself\.$
	matchre RETURN ^Focusing your mind, you attempt to attune your senses to the paths between shadows\.$
	matchre RETURN ^Placing all of your worries and concerns aside, you mentally wall them off where they no longer bother you\.$
     put khri %khri
     matchwait 7
     RETURN
KHRI.KNEEL:
	pause 0.1
	send kneel
	pause 0.5
	pause 0.1
	send khri %khri
	pause 2
	pause
	gosub stand
	pause 0.1
	if !$standing then gosub stand
	RETURN
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
     matchre STAND_RETURN ^You are already standing\.
     send stand
     matchwait
     STAND_RETURN:
     pause 0.1
     pause 0.1
     if (!$standing) then goto STAND
     RETURN
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
     matchre RETURN ^Your .* falls
     matchre RETURN ^You remain concealed
     matchre RETURN ^But your .* isn't loaded\!
     matchre RETURN ^You don't have a ranged weapon to unload\.
     matchre RETURN ^You must be holding the weapon to do that\.
     send unload
     matchwait
SWAP:
     var LOCATION SWAP1
     var todo $0
SWAP1:
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
SHEATH:
     delay 0.0001
     var item $0
     var LOCATION SHEATH_1
     SHEATH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You slip
     matchre RETURN ^You sheathe
     matchre RETURN ^Sheathe what\?
     matchre RETURN ^Sheathe your.*where\?
     matchre RETURN ^A .* is too long to fit in .*\.
     matchre RETURN ^The .* is too long to fit in .*\.
     send sheath %item
     matchwait
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
     RETURN
BUNDLE_SET_ZERO:
     delay 0.0001
     put #tvar bundleFull 0
     put #tvar bundleCount 0
     RETURN
#### FORAGING SUBS
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
FORAGE:
     delay 0.0001
     var forage $0
     var LOCATION FORAGE_1
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
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
CLEAN_ROOM:
     delay 0.0001
     var dumpster NULL
     if matchre("$roomobjs", "origami|an Imperial dira|glass reservoir|steel striker|black cube|tiny chitinous leg|coiled spring|brown clay|bloated animal bladder|sharp blade|tiny hammer|sealed vial|stoppered vial|iron disc|metal spring|tiny metal lever|broken needle|short needle|short curved blade|silver studs|thin metal circle|steel pin|broken rune|runestone|bronze seal|glass sphere|tiny bronze face|cracked black crystal|capillary tube|some junk") then gosub DUMP_CHECK 
     if matchre("$roomobjs", "a bucket of viscous gloop|a waste bucket") then var dumpster bucket
     if matchre("$roomobjs", "a disposal bin|a waste bin|firewood bin") then var dumpster bin
     if matchre("$roomname", "Garden Rooftop\, Medical Pavilion") then var dumpster gutter
     if matchre("$roomobjs", "a large stone turtle") then var dumpster turtle
     if matchre("$roomobjs", "trash receptacle") then var dumpster receptacle
     if matchre("$roomobjs", "a waste basket") then var dumpster basket
     if matchre("$roomobjs", "a tree hollow") then var dumpster hollow
     if matchre("$roomobjs", "a bottomless pit") then var dumpster pit
     if matchre("$roomobjs", "a driftwood log") then var dumpster log
     if matchre("$roomobjs", "an oak crate") then var dumpster crate
     if matchre("$roomobjs", "ivory urn") then var dumpster urn
     pause 0.1
     if ("%dumpster" = "NULL") then return
     CLEAN_ROOM_2:
     delay 0.0001
     var object NULL
     if matchre("$roomobjs", "a rock") then var object rock
     if matchre("$roomobjs", "razorsharp claw") then var object claw
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
#### SPELL CASTING
CAST:
     var location CAST1
     var todo $0
     CAST1:
     matchre cast2 ^You can't cast that at yourself\!
     matchre return ^You gesture
     matchre return ^You raise your hand in an imaginary
     matchre return ^You don't have a spell prepared\!
     matchre return ^Your spell pattern collapses
     matchre return ^With a wave of your hand,
     matchre return ^Your target pattern dissipates
     matchre return ^You wave your hand\.
     matchre return ^You place your hands on your temples
     matchre return ^A newfound fluidity of your mind
     matchre return ^Your heart skips a beat as your spell
     matchre return ^With a flick of your wrist,
     matchre return ^Your secondary spell pattern dissipates
     matchre return ^You can't cast .+ on yourself\!
     matchre return ^You make a holy gesture
     matchre return ^You raise your palms and face to the heavens
     matchre return ^I could not find what you were referring to\.
     matchre return ^You have difficulty manipulating the mana streams, causing the spell pattern to collapse at the last moment\.
     put cast %todo
     matchwait

cast2:
     put face next
     goto cast1

POWER:
     var location power1
     var todo $0
     POWER1:
     matchre return ^Roundtime
     matchre return ^Something in the area is interfering
     matchre return ^I could not find who you were referring to\.
     put PERCEIVE %todo
     matchwait

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
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PREPARE! (base.inc) ***
     put #echo >$Log Crimson $datetime Prepare = %prepare
     put #log $datetime MISSING MATCH IN PREPARE! (base.inc)
     goto SPELL_CAST_RETURN
SPELL_WAIT:
     delay 0.0001
     if ("$preparedspell" = "None") then RETURN
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
     if ("$preparedspell" = "None") then RETURN
     matchre RETURN ^You feel fully prepared to cast your spell\.
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Your target pattern dissipates because the creature is dead\, but the main spell remains intact
     matchwait
SPELL_CAST_TARGET:
     delay 0.0001
     if ("$preparedspell" = "None") then RETURN
     var target $0
     var LOCATION SPELL_CAST_TARGET1
     SPELL_CAST_TARGET1:
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
     RETURN
SPELL_CAST_FAIL:
     delay 0.0001
     gosub RELEASE
SPELL_CAST_RETURN:
     delay 0.0001
     RETURN
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
     RETURN
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
#### ARCANA SUBS
CHARGE:
     delay 0.0001
     var charge $0
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
     send charge %charge
     matchwait
INVOKE:
     delay 0.0001
     var invoke $0
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
     send invoke %invoke
     matchwait
REMOVE_CAMBRINTH:
     delay 0.0001
     var cambrinth $0
     var LOCATION REMOVE_CAMBRINTH_1
     REMOVE_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:slide|remove|take off)
     send remove my %cambrinth
     matchwait
WEAR_CAMBRINTH:
     delay 0.0001
     var cambrinth $0
     var LOCATION WEAR_CAMBRINTH_1
     WEAR_CAMBRINTH_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You (?:hang|slide|place|attach|put on)
     matchre RETURN ^Wear what\?
     matchre RETURN ^You are already wearing that\.
     send wear my %cambrinth
     matchwait
#### FOCUS SUB
FOCUS:
     delay 0.0001
     var focus $0
     var LOCATION FOCUS_1
     FOCUS_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^You focus your magical senses on .*\.
     matchre RETURN ^You move into the chaotic tides
     matchre RETURN ^Your link to the .+ is intact\.
     matchre RETURN ^You reach out into the seemingly infinite strands of Lunar mana
     send focus %focus
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN FOCUS! (base.inc) ***
     put #log $datetime MISSING MATCH IN FOCUS! (base.inc)
     RETURN
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
     matchre RETURN ^You aren't trained in the ways of magic\, but you fake it\.
     send perceive %perceive
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PERCEIVE! (base.inc) ***
     put #log $datetime MISSING MATCH IN PERCEIVE! (base.inc)
     RETURN
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
     RETURN
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
     RETURN
PERCEIVE_PAUSE:
     delay 0.0001
     pause 5
     goto PERCEIVE_HEALTH
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

location.p:
pause
location:
pause .1
goto %location

location.unload:
GOSUB unload
var location stow1
GOSUB stow1
return

location.unload1:
GOSUB unload
var location wear1
GOSUB wear1
return

location1:
GOSUB stop.humming1
goto %location

return.p:
pause .1
return



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
               RETURN
          }
     if ("$2" != "NULL") then var stance1 $2
     if ("$3" != "NULL") then var stance2 $3
     if ("$4" != "NULL") then var stance3 $4
     if ("$5" != "NULL") then var stance4 $5
     send stance %stance %stance1 %stance2 %stance3 %stance4
     RETURN
#### HEALTH CHECKING
HEALTH_CHECK:
     delay 0.0001
     put #tvar needHealing 0
     delay 0.5
     matchre HEALTH_GOOD ^You have no significant injuries\.
     matchre HEALTH_BAD ^\s*Encumbrance\s+\:
     put -health;-2 encumbrance
     matchwait 15
     goto HEALTH_CHECK
HEALTH_BAD:
     delay 0.0001
     put #tvar needHealing 1
     delay 0.5
     RETURN
HEALTH_GOOD:
     delay 0.0001
     put #queue clear
     put #tvar needHealing 0
     delay 0.5
     RETURN

#### RETURNS
RETURN:
     delay 0.0001
     RETURN
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     RETURN
#### END OF FILE
end.of.file: