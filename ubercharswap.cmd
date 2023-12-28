##debug 10
# version 1.4
# THIS SCRIPT IS USED TO AUTO-SWAP BETWEEN 2-4 CHARACTERS ON THE ~SAME ACCOUNT!!~ USING UBER COMBAT
# THE CHARACTERS MUST ALL BE ON THE SAME ACCOUNT FOR OBVIOUS REASONS - IT LOGS OUT OF ONE AND LOGS INTO THE OTHER CHARACTER
# AT THE END OF THE TOWN RUN - IT WILL CHECK IF PASSED YOUR SET SWAP TIME (IN VARS BELOW)
# IF PASSED YOUR SWAP TIME, WILL SLEEP AND LOGOUT TO BUILD RESTED XP AND SWAP TO YOUR OTHER CHARACTER(S)
# THEN REPEAT - CYCLING TO THE NEXT CHARACTER AFTER EVERY SWAP PERIOD 

## MANDATORY FOR THIS SCRIPT TO WORK: (update in: ubercombat-vars.inc )
## - YOU MUST SET " var ONLINE.TIME 0 " in each character's variables 
## - YOU MUST SET " var Custom.Script ubercharswap " in each character's variables
## Putting this in other characters' Custom.Script variable will result in a log message, but nothing more. It won't break them
 
# These variables should be your CHARACTERS' ACTUAL NAMES. It does not matter what order you put them in.
# IF YOU ARE ONLY SWAPPING BETWEEN 2/3 CHARACTERS - SET THE OTHER CHARACTERS TO 'NULL' OR 'OFF'
# USE PROPER PUNCTUATION! THE FIRST LETTER OF THE NAME IS ALWAYS CAPITAL FOLLOWED BY LOWERCASE
var character1 Shroom
var character2 Hashish
var character3 Fuku
var character4 NULL

# These will be your profile names. The character name followed by "DR / DRF (Fallen) / DRX (Plat)". 
# Ex: Prime character named Jim would be - JimDR | In TF - JimTF  | In Plat - JimDRX
# These need to be in the same order as your characters above.
# (IF UNSURE - CLICK IN GENIE FILE -> CONNECT USING PROFILE and you can see the Profile Names) 
var profile1 ShroomDRF
var profile2 HashishDRF
var profile3 FukuDRF
var profile4 NULL

# SWAP.TIME is the DEFAULT TIME (in SECONDS) between character rotations. After this time has expired, you will switch at the end of the next town run.
# Default is 41400 (11.5 hours), to get the max rested exp without spending too much time over 12 hours per character (which would waste potential REXP).
# Lower time = more frequent swaps = less rested exp, but you can set it low enough to swap every full run if you want
# DEFAULT SWAP TIME HERE FOR POSTERITY - MOST IMPORTANTLY IS NOW YOU CAN SET THE TIME FOR EACH CHARACTER BELOW
var SWAP.TIME 41400
############################################################################################################################
######## IMPORTANT: For each character listed, you should set your ONLINE.TIME variable in ubercombat-vars.inc to 0.########
######## FAILING TO SET ONLINE.TIME IN THE VARS FILE CAN CAUSE THIS SCRIPT TO NEVER RUN.                            ########
############################################################################################################################
# SET THE SWAP.TIME FOR EACH INDIVIDUAL CHARACTER 
# YOU CAN CHOOSE LONGER OR SHORTER RUN TIMES FOR EACH DIFFERENT CHARACTER
var SWAP.TIME.CHAR1 8000
var SWAP.TIME.CHAR2 35000
var SWAP.TIME.CHAR3 41400
var SWAP.TIME.CHAR4 41400

# Do not edit anything below this line.
###################################################################
###################################################################
###################################################################

if matchre("$charactername", "%character1") then var SWAP.TIME %SWAP.TIME.CHAR1
if matchre("$charactername", "%character2") then var SWAP.TIME %SWAP.TIME.CHAR2
if matchre("$charactername", "%character3") then var SWAP.TIME %SWAP.TIME.CHAR3
if matchre("$charactername", "%character4") then var SWAP.TIME %SWAP.TIME.CHAR4

pause 0.001
evalmath TIME.TO.SWAP (%SWAP.TIME - $UC_totalTime)
pause 0.5
echo
echo * CHECKING ONLINE TIME FOR CHARACTER SWITCH
echo * SWAP TIME SETTING: %SWAP.TIME
echo * TOTAL RUN DURATION: $UC_totalTime
echo
put #echo >Log #cc00ff CHECKING ONLINE TIME FOR CHARACTER SWITCH
put #echo >Log #cc00ff SWAP TIME SETTING: %SWAP.TIME
put #echo >Log #cc00ff TOTAL RUN DURATION: $UC_totalTime
pause
if ($UC_totalTime > %SWAP.TIME) then goto SWAP
pause 0.5
put #echo >Log #cc00ff NOT SWITCHING YET. SWAP IN: %TIME.TO.SWAP
put #parse SCRIPT FINISHED!
exit

SWAP:
	if matchre ("$charactername", "%character1") then 
	{
		put #script abort uber
		put #script abort uberwatch
		pause
          echo
          echo ***  SWITCHING TO CHARACTER %character2
		echo
          put #echo >Log #b3ffff SWITCHING TO CHARACTER %character2
          pause 0.2
          put sleep
          pause 0.5
          pause 0.2
          put sleep
          pause 0.5
          pause 0.5
		put quit
          put exit
		pause 5
          gosub RESET_SPELLTRACKER
          put #clear Main
          pause 0.5
		put #connect %profile2
		pause 10
          pause
          send awake
          pause 0.7
          pause 0.5
          put /track clear
          pause 0.5
          put exp all all
          pause 4
		put .uber
          pause 0.3
		EXIT
	}
	if matchre ("$charactername", "%character2") then
	{
		put #script abort uber
          put #script abort uberwatch
		pause
          if matchre("%character3", "(?i)(NULL|OFF|^%|^\s*$)") then goto SWAPTOSTART
          echo
          echo ***  SWITCHING TO CHARACTER %character3
		echo
          put #echo >Log #b3ffff SWITCHING TO CHARACTER %character3
          pause 0.2
          put sleep
          pause 0.5
          pause 0.2
          put sleep
          pause 0.5
          pause 0.5
		put quit
          put exit
		pause 5
          gosub RESET_SPELLTRACKER
          put #clear Main
          pause 0.5
		put #connect %profile3
		pause 10
          pause
          send awake
          pause 0.7
          pause 0.5
          put /track clear
          pause 0.5
          put exp all all
          pause 4
		put .uber
          pause 0.3
		EXIT
	}
CHARSWAP3:
	if matchre ("$charactername", "%character3") then
	{
		put #script abort uber
          put #script abort uberwatch
		pause
          if matchre("%character4", "(?i)(NULL|OFF|^%|^\s*$)") then goto SWAPTOSTART
          echo
          echo ***  SWITCHING TO CHARACTER %character4
		echo
          put #echo >Log #b3ffff SWITCHING TO CHARACTER %character4
          pause 0.2
          put sleep
          pause 0.5
          pause 0.2
          put sleep
          pause 0.5
          pause 0.5
		put quit
          put exit
		pause 5
          gosub RESET_SPELLTRACKER
          put #clear Main
          pause 0.5
		put #connect %profile4
		pause 10
          pause
          send awake
          pause 0.7
          pause 0.5
          put /track clear
          pause 0.5
          put exp all all
          pause 4
		put .uber
          pause 0.3
		EXIT
	}
SWAPTOSTART:
     if !matchre("$charactername", "%character1") then
     {
		put #script abort uber
          put #script abort uberwatch
		pause
          echo
          echo ***  SWITCHING TO CHARACTER %character1
		echo
          put #echo >Log #b3ffff SWITCHING TO CHARACTER %character1
          pause 0.2
          put sleep
          pause 0.5
          pause 0.2
          put sleep
          pause 0.5
          pause 0.5
		put quit
          put exit
		pause 5
          gosub RESET_SPELLTRACKER
          put #clear Main
          pause 0.5
		put #connect %profile1
		pause 10
          pause
          send awake
          pause 0.7
          pause 0.5
          put /track clear
          pause 0.5
          put exp all all
          pause 4
		put .uber
          pause 0.3
		EXIT
     }
put #echo >Log #cc00ff NOT SWITCHING YET. SWAP IN: %TIME.TO.SWAP
put #parse SCRIPT FINISHED!
EXIT

RESET_SPELLTRACKER:
######################################################################################
### NEW ~ RESET ALL EXPTRACKER VARIABLES TO 0 (FOR CHARACTER SWITCH ON SAME GENIE INSTANCE)
#####################################################################################
     put #var Shield_Usage.Ranks 0
     put #var Chain_Armor.Ranks 0
     put #var Light_Armor.Ranks 0
     put #var Brigandine.Ranks 0
     put #var Plate_Armor.Ranks 0
     put #var Parry Ability.Ranks 0
     put #var Small_Edged.Ranks 0
     put #var Large_Edged.Ranks 0
     put #var Twohanded_Edged.Ranks 0
     put #var Small_Blunt.Ranks 0
     put #var Large_Blunt.Ranks 0
     put #var Twohanded_Blunt.Ranks 0
     put #var Slings.Ranks 0
     put #var Bow.Ranks 0
     put #var Crossbow.Ranks 0
     put #var Staves.Ranks 0
     put #var Polearms.Ranks 0
     put #var Inner_Magic.Ranks 0
     put #var Primary_Magic.Ranks 0
     put #var Attunement.Ranks 0
     put #var Arcana.Ranks 0
     put #var Augmentation.Ranks 0
     put #var Debilitation.Ranks 0
     put #var Utility.Ranks 0
     put #var Warding.Ranks 0
     put #var Sorcery.Ranks 0
     put #var Evasion.Ranks 0
     put #var Athletics.Ranks 0
     put #var Perception.Ranks 0
     put #var Stealth.Ranks 0
     put #var Locksmithing.Ranks 0
     put #var Thievery.Ranks 0
     put #var First_Aid.Ranks 0
     put #var Outdoorsmanship.Ranks 0
     put #var Skinning.Ranks 0
     put #var Backstab.Ranks 0
     put #var Engineering.Ranks 0
     put #var Forging.Ranks 0
     put #var Outfitting.Ranks 0
     put #var Alchemy.Ranks 0
     put #var Enchanting.Ranks 0
     put #var Scholarship.Ranks 0
     put #var Mechanical_Lore.Ranks 0
     put #var Appraisal.Ranks 0
     put #var Performance.Ranks 0
     put #var Tactics.Ranks 0
     put #var Instinct.Ranks 0
     put #var Empathy.Ranks 0
     put #var Astrology.Ranks 0
     put #var Expertise.Ranks 0
     put #var Summoning.Ranks 0
     put #var Bardic_Lore.Ranks 0
     put #var Conviction.Ranks 0
     put #var Theurgy.Ranks 0
     put #var Thanatology.Ranks 0
     put #var Trading.Ranks 0
     return