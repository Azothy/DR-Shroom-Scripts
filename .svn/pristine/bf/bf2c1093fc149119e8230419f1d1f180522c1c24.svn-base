#debuglevel 5
########################################################################
##                  THIEFHUNTER - By Shroom of TF                     ##
##                 Based on OG Geniehunter by Warneck                 ##
##      This has a LOTS of stuff trimmed, optimized, magic REMOVED    ##
##  Tons of bugs fixed. New features. TONS of THIEF customizations    ##
##  Heavily Optimized for THIEVES - uses Khris, Ambushes, Slip stalk  ##
##
##  REQUIRED PRE-REQUISUTES:
##
########################################################################
put exp 0
waitforre ^EXP HELP for more information
pause 0.1
pause 0.001
put #var save
gosub stowing
gosub stowAmmo
##########################################################################
##                                                                        ##
##                     General combat script                              ##
##               By: Warneck (with help from SFHunter)                    ##
##                                                                        ##
##        General Options:                                                ##
## APPR: appraises monsters, will not appraise if appraisal is locked   ##
## ARRANGE #: arranges skinnable creatures before skinning them         ##
##        The # designates the number of times you want to arrange (1-5)  ##
##        If no # entered, will default to 1 time                         ##
## BARB: Analyzes monsters with Barbarian options for Expertise         ##
##        syntax is BARB (type)                                           ##
##        Valid types are: FLAME, ACCURACY, DAMAGE, INTIMIDATION,         ##
##        FATIGUE, BALANCE, VITALITY, RAGE or CALM.                       ##
## Only one type at a time can be active.                               ##
## BLOCK: sets stance to shield stance                                  ##
## BONE: arranges for bones                                             ##
## BUFF: uses buffing subroutine                                        ##
## BUNDLE: bundles skins if you have ropes.  Bundles are untied, and    ##
##        dropped.  See TIE and WEAR for other options                    ##
## COLLECTIBLE: loots collectibles (diras and cards)                    ##
## COUNT/DANCE: dances with X number of creatues.                       ##
## CUSTOM: sets stance to custom stance                                 ##
## DANGER: part of the BUFF command, it sets BUFF and retreats during   ##
##        casting                                                         ##
## DEFAULT: use the default setting, use DSET fist to set up defaults   ##
##        can also use .hunt with no arguments to do this                 ##
## DMSET: setup for multi-weapon with default settings                  ##
##        use is .hunt dmset weapon1 weapon2 ...                          ##
## DMULTI: Multi-weapon with default settings                           ##
## DODGE/EVADE: sets stance to evasion stance                           ##
## DSET: used to set up the default settings                            ##
##        run .hunt DSET <<all other options>> once to set the            ##
##        defaults, this will go through init like normal, and then       ##
##        save all the settings globally for use as default               ##
## ENCHANTE: casts designated Bard cyclic every 7 minutes               ##
## EXP: checks weapon experience.  Will end script when skill is        ##
##        bewildered or above                                             ##
## HUNT: will use the HUNT verb to train perception and stealth, but    ##
##        will not move around the hunting ground                         ##
## JUGGLE/YOYO: juggles when no more monsters in the room               ##
## JUNK: loots scrolls/runestones/cards, exclusive from LOOT            ##
## KHRI: Uses Thief khri. Please use the khri's name in lowercase       ##
## to set the correct variables on for the khri you use                 ##
## LOOTALL: loots everything it can                                     ##
## LOOTBOXES: loots  boxes, redundant if used with LOOTALL              ##
## LOOTCOINS: loots coins, redundant if used with LOOTALL               ##
## LOOTGEMS: loots gems, redundant if used with LOOTALL                 ##
## MANIP: adds manipulation (empathy training);                         ##
## requires $manipulate variable                                        ##
## MARK (Thief only): Utilizes MARK ALL instead of APPRAISE             ##
## MSET: setup for multi-weapon, break up multi setups with quotation   ##
##        marks: .hunt "setup 1" "setup 2"..."setup 10"                   ##
##        supports up to 10 setups currently                              ##
##        setups are saved as GH_MULTI_# for edittabillity                ##
## MULTI: multi-weapon training, will use a weapon until locked         ##
##        then switch to the next setup when locked                       ##
## NECROHEAL: Necromancer healing.  Only use if you have the consume    ##
##        spell.  Will not activate if below 80% mana or if               ##
##        $roomplayers shows anyone present.  Minor scuffs                ##
##        are not healed.                                                 ##
## NECRORITUAL: Will perform a necromancer ritual, if of right guild    ##
##        and $roomplayers shows no one present.  Options are             ##
##        dissect, preserve, harvest, arise.  If no ritual is specified,  ##
##        will use dissect. Usage is                                      ##
##        .hunt necroritual dissect/preserve/harvest/arise                ##
## NOEVASION: Will skip the evasion stance when switching stances       ##
## NOPARRY: Will skip the parry stance when switching stances           ##
## NOSHIELD: Will skip the shield stance when switching stances         ##
## PARALYSIS: shock-free TM training for Empaths                        ##
##        requires $paralysis variable                                    ##
## PART: arranges for parts                                             ##
## PARRY: sets stance to parry stance                                   ##
## PILGRIM: prays on a pilgrim's badge every 30 minutes                 ##
## POINT: toggles hidden critter pointing (Default is OFF)              ##
## POUCH: changes gem pouches when current one is full.  See help       ##
## POWERP: will power perceive once every 6 minutes.                    ##
## RETREAT: turns on retreating for ranged weapons / spells. This       ##
##        does not work with poaching yet                                 ##
## RITUAL: maintains a ritual spell during                              ##
##        combat (some assembly required)                                 ##
## ROAM: will roam around the hunting area if no more monsters in       ##
##        room to kill                                                    ##
##        !!!CAUTION!!!                                                   ##
##        There is no safeguard for leaving a hunting area or             ##
##        wandering into a more dangerous area.                           ##
## SCRAPE: scrape skins/pelts/hides after skinning, retreating works    ##
##        while doing this activity.  Use SKINRET for this                ##
## SEARCH: Sets loot option.  Treasure/Boxes/Equipment/Goods/All        ##
##        without setting an option, uses game default see in game        ##
##        LOOT HELP for more information on differences                   ##
## SKIN: skins monsters                                                 ##
## SKINRETREAT: will turn on retreating while skinning                  ##
## SLOW: for weaklings or noobs, will wait for stamina to refill        ##
##        before next attack if it drops below 90%                        ##
## STANCE: will cycle through stances once that skill is locked         ##
##        current cycle is evas -> shield -> parry and back               ##
## TACTICS: Will add tactics-training to your hunting routine           ##
## TARGET: specifies a target to aim/target for attacks                 ##
## THIEF: This option uses Thief-only ambushes                          ##
## TIE: Ties bundles when first created, saves inventory space          ##
## TIMER: will set a timer to abort the script after x seconds          ##
## TRAIN: will check experience after every combat cycle, ranged        ##
##        weapon firing/throwing, or spell cast                           ##
## WEAR: Wears bundles.  Uses STOW verb to put skin into bundle if it   ##
##        this is used w/ the TIE option.                                 ##
##                                                                        ##
##        Weapon Options:                                                 ##
## AMBUSH: hides/stalks and attacks from hiding, checks stealth exp     ##
##        has a feature that will attempt to return to your original      ##
##        room if you stalk a creature into another by accident.          ##
##        If you have the ROAM option activated, this part of the         ##
##        feature is deactivated.                                         ##
## ANALYZE: Analyzes monsters to get debuff combos;                     ##
## syntax is ANALYZE # (1-10)                                           ##
## BACKSTAB: backstabs with weapon                                      ##
## BRAWL: brawls, will brawl with a weapon out if so desired            ##
## CONSTRUCT: adds construct check (to avoid Empathic shock) to weapon  ##
##        and TM training                                                                 ##
## DUAL: dual-load (for Rangers and Barbarians                                  ##
## EMPATH: non-lethal brawling (trains tactics)                         ##
## FEINT: use a feinting routine to keep balance up                     ##
## MAGIC: uses magic in the same syntax as TM/PM, but will only cast    ##
##        once per critter, then use the primary weapon to kill           ##
## OFFHAND: uses weapon in offhand, works with melee or thrown          ##
## POACH: poaches with a ranged weapon, checks stealth exp              ##
## SNAP: snap-fires ranged weapon and snapcasting for magic             ##
##        Following this command with a # will pause for that many         ##
##        seconds before casting/firing                                   ##
## SNIPE: snipes with a ranged weapon                                   ##
## STACK: throws stacks of weapons (throwing blades). If you use        ##
##        this, don't use THROW too                                       ##
## SWAP/BASTARD: swappable weapon support, equips the weapon and           ##
## swaps it to the desired weapon "mode"                                        ##
##   Available mode options:                                                    ##
##        SE - Small Edged (Light Edged, Medium Edged)                          ##
##        LE - Large Edged                                                           ##
##        2HE - Two-handed Edged                                                     ##
##        SB - Small Blunt (Light Blunt, Medium Blunt)                          ##
##        LB - Large Blunt                                                           ##
##        2HB - Two-handed Blunt                                                     ##
##        POLE - Polearms (Halberd, Pike)                                            ##
##      S - Staves (Quarter Staff, Short Staff)                            ##
## TSWAP: does the same as SWAP, but for throwing weapons               ##
## FSWAP: does the same as SWAP, but for Fans with open/close              ##
## THROW: throws a thrown weapon                                        ##
## HURL: hurls a thrown weapon, causing puncturing weapons to stick     ##
## LOB: lobs a thrown weapon, preventing weapon from sticking           ##
## TM/PM: uses magic as the primary weapon, with brawling as the        ##
##        backup if no other weapon is specified (and you run out of      ##
##        mana). The extra harness is optional. TM for targeted exp       ##
##        check, PM for primary magic exp checks. SNAP will snapcast.     ##
##        Use as follows:                                                 ##
##        (SNAP) <TM|PM> <spell> <mana> (extra mana) <weapon> <shield>    ##
##                                                                        ##
## Use:                                                                 ##
##   .hunt (General options) (Weapon Options) weapon shield              ##
##                                                                        ##
## Note: You must have the EXPTracker Plugin for this script to work    ##
##########################################################################
0:
UBERTOP:
pause 0.1
timer clear
timer start

## LOWRANKS - ANYTHING UNDER THIS WILL UTILIZE AMBUSH STUN SPAM
var LOWRANKS 900

## GAG_ECHO can be YES or NO
## YES - Will not show any of the informative echoes
## NO - Default, will show all informative echoes
var GAG_ECHO YES
var TACTICS weave|circle|bob
var tact_move 0
var DSET OFF
var HUNT_TIME 0
var CRYS.TIME 0
var PERC.TIME 0
#WEAPON SORTING
var SORT ON

VARIABLES.INIT:
##LOOT Variables
var gems1 agate|alexandrite|amber|amethyst|andalusite|aquamarine|bead|beryl|bloodgem|bloodstone|carnelian|chalcedony|chrysoberyl|chrysoprase|citrine
var gems2 coral|crystal|diamond|diopside|\begg\b|eggcase|emerald|garnet|\bgem\b|glossy malachite|goldstone|(chunk of|some|piece of).*granite|hematite|iolite|ivory
var gems3 jade|jasper|kunzite|lapis lazuli|malachite stone|minerals|moonstone|morganite|onyx|opal|pearl|pebble|peridot|quartz|ruby
var gems4 sapphire|spinel|star-stone|sunstone|talon|tanzanite|tooth|topaz|tourmaline|tsavorite|turquoise|zircon|electrum|pewter|muracite
var gweths (jadeite|lantholite|lasmodi|sjatmal|waermodi) stones
var boxtype brass|copper|deobar|driftwood|iron|ironwood|mahogany|oaken|pine|steel|wooden
var boxes \bbox\b|caddy|casket|chest|coffer|crate|skippet|strongbox|trunk
var junkloot fragment|hhr'lav'geluhh bark|lockpick|ostracon|package|papyrus roll|scroll|sheiska leaf|smudged parchment|tablet|vellum
var collectibles crystal ring|\bdira\b|flarmencrank|\bgear\b|glarmencoupler|\bmap\b|\bnuts?\b|rackensprocket|soulstone|spangleflange|runestone

##Monster Variables
var monsters1 ashu hhinvi|atik'et|bloodvine|bucca|clay archer|clay mage|clay soldier|\bcrag\b|creeper|cutthroat|Dragon Priest assassin|Dragon Priest intercessor
var monsters2 dragon fanatic|dragon priest|dragon priestess|dryad|dummy|dusk ogre|dyrachis|eviscerator|faenrae assassin|fendryad|fire maiden|folsi immola
var monsters3 footpad|frostweaver|gam chaga|\bgeni\b|gidii|goblin shaman|graverobber|guardian|gypsy marauder|\bimp\b|juggernaut
var monsters4 kelpie|kra'hei|kra'hei hatchling|lipopod|lun'shele hunter|madman|malchata|mountain giant|nipoh oshu|\bnyad\b|orc bandit
var monsters5 orc clan chief|orc raider|orc reiver|orc scout|pile of rubble|pirate|river sprite|ruffian|scavenger troll|scout ogre|screamer
var monsters6 sentinel|shadow master|shadoweaver|sky giant|sleazy lout|sprite|swain|swamp troll|telga moradu|\bthug\b|trekhalo
var monsters7 tress|umbramagii|velver|\bvine\b|vykathi builder|vykathi excavator|wood troll|young ogre|zealot|ice archon|pile of broken ice|cabalist|charred husk

var undead1 skeleton|emaciated umbramagus|soul|boggle|zombie|wind hound|fiend|spirit|ur hhrki'izh|spectral pirate|spectral sailor|shylvic
var undead2 skeleton kobold savage|skeleton kobold headhunter|skeletal sailor|olensari mihmanan|zombie mauler|zombie stomper|zombie head-splitter
var undead3 emaciated umbramagus|zombie nomad|sinister maelshyvean heirophant|gargantuan bone golem|plague wraith|snaer hafwa|wir dinego
var undead4 skeletal peon|revivified mutt|zombie head-splitter|asketian harbinger|skorik nadhar|wind hag|black zephyr|blue ghast|Asketian harbinger|Asketian Herald|wind wretch

var skinnablemonsters1 angiswaerd hatchling|antelope|arbelog|armadillo|armored warklin|arzumo|asaren celpeze|badger|barghest|basilisk|\bbear\b|beisswurm|black ape
var skinnablemonsters2 blight ogre|blood warrior|\bboa\b|\bboar\b|bobcat|boobrie|brocket deer|burrower|caiman|caracal|carcal|cave troll
var skinnablemonsters3 cinder beast|cougar|\bcrab\b|crayfish|crocodile|\bdeer\b|dobek moruryn|faenrae stalker|firecat|\bfrog\b|gargoyle|giant blight bat
var skinnablemonsters4 goblin|grass eel|\bgrub\b|gryphon|Isundjen conjurer|jackal|kartais|kobold|la'heke|larva|la'tami|leucro
var skinnablemonsters5 marbled angiswaerd|merrows|\bmoda\b|\bmoth\b|mottled westanuryn|musk hog|\bpard\b|peccary|pivuh|poloh'izh|pothanit|\bram\b
var skinnablemonsters6 \brat\b|retan dolomar|rock troll|scaly seordmaor|serpent|shadow beast|shadow mage|shalswar|silverfish|sinuous elsralael|skunk|S'lai scout
var skinnablemonsters7 sleek hele'la|sluagh|snowbeast|\bsow\b|spider|spirit dancer|steed|trollkin|\bunyn\b|viper|vulture|vykathi harvester
var skinnablemonsters8 vykathi soldier|warcat|\bwasp\b|\bwolf\b|\bworm\b|juvenile wyvern|young wyvern|adult wyvern|bone wyvern

var skinnableundead1 enraged tusky|fell hog|ghoul|ghoul crow|gremlin|grendel|lach|mastiff|mey|misshapen germish'din
var skinnableundead2 mutant togball|reaver|shadow hound|squirrel|zombie kobold headhunter|zombie kobold savage

var construct ashu hhinvi|boggle|bone amalgam|clay archer|clay mage|clay soldier|clockwork assistant|gam chaga|glass construct|granite gargoyle|lachmate|lava drake|marble gargoyle|origami \S+|quartz gargoyle|(alabaster|andesite|breccia|dolomite|marble|obsidian|quartzite|rock) guardian|rough-hewn doll
var skinnableconstruct granite gargoyle|lava drake|marble gargoyle|quartz gargoyle

var invasioncritters bone amalgam|bone warrior|Elpalzi (bowyer|deadeye|dissident|fomenter|hunter|incendiary|instigator|malcontent|malcontent|partisan|rebel|sharpshooter|toxophilite)|flea-ridden beast|putrefying shambler|revivified mutt|shambling horror|skeletal peon|transmogrified oaf

var skinnablecritters %skinnablemonsters1|%skinnablemonsters2|%skinnablemonsters3|%skinnablemonsters4|%skinnablemonsters5|%skinnablemonsters6|%skinnablemonsters7|%skinnablemonsters8|%skinnableundead1|%skinnableundead2|%skinnableconstruct
var nonskinnablecritters %monsters1|%monsters2|%monsters3|%monsters4|%monsters5|%monsters6|%monsters7|%undead1|%undead2|%undead3|%undead4|construct

var skinables1 antenna|ashu'a|barb|beak|bristle|carapace|catgut|claw|collarbone|ear|eye|eyeball
var skinables2 feather|foreclaw|foreleg|fragment|hair|eart|hide|hoof|horn|impaler|mandible|mosshair
var skinables3 paw|pelt|pseudopod|quill|rib|sac|scale|scalp|shell|skin|sliver|spinneret|stinger
var skinables4 tail|tentacle|toenail|tongue|tooth|tusk|tusks|wing|vertebra|fang
var skinables %skinables1|%skinables2|%skinables3|%skinables4

var critters %nonskinnablecritters|%skinnablecritters|%invasioncritters

##Empath Variables
var Empath_Monster

var OPTIONVARS AMB.*?|ANAL.*?|APPR.*?|ARM.*?|ARRA.*?|BACKS.*?|BARB.*?|BAST.*?|BLO.*?|BON.*?|BRA.*?|BS|BUF.*?|BUN.*?|COLL.*?|CONS.*?|COUNT|CUST.*?|DANCE|DANG.*?|DEF.*?|DLOAD|DMSET|DMULTI|DODGE|DSET|DUAL.*?|DYING|EMP.*?|ENCH.*?|EVA.*?|EXP|FEINT|FSWAP|HELP|HUNT|HURL|JUGG.*?|JUNK|KHRI|LOB|LOOTA.*?|LOOTB.*?|LOOTC.*?|LOOTG.*?|MAGIC|MANIP|MARK|MSET|MULTI|NECROH.*?|NECROR.*?|NISS.*?|NOEV.*?|NOPA.*?|NOSH.*?|OFF.*?|PARA(?!NG).*?|PARA.*?|PARRY|PART\b|PILGRIM|PM|POACH|POINT|POUCH|POW.*?|PP|RET.*?|RITUAL|ROAM|SCRAPE.*?|SEARCH|SKIN.*?|SKINRET.*?|SLOW|SNAP|SNIP.*?|STACK|STANCE|SWAP|TAC.*?|TARG.*?|THIEF|THROW\b|TIE|TIME.*?|TM|TRAIN|TSWAP|WEAR|YOYO
var OPTION NONE

var lastmaneuver none
var dist missle
var loot.counter 0
var cloutLoop 0
var HIDE.FAIL 0
var LAST TOP
TOP:
## Initialize multi-weapon variable
# This part will be skipped when multi-weapons are implemented
#############################################################################
###                                                                       ###
###                      USER DEFINED VARIABLES!!!                             ###
###       VARIABLE INIT: ONLY CHANGE VARIABES IN THIS SECTION             ###
###                                                                       ###
#############################################################################
VARIABLE_INIT:
var SHIELD shield
var ARM.WORN.SHIELD YES
#NOOB ON is to remove Plate and Brigandine and put on leather before sniping or backstabbing
var NOOB OFF
# UBERMONSTER IS FOR ANY SPECIAL HIGH LEVEL MONSTER YOU WANT TO ALWAYS TARGET FIRST
# FOR AREAS WITH TWO OR MORE MIXED TYPES OF MONSTERS
var ubermonster tusky
var noobmonster stomper
# HIGH END WEAPON IS MIN NUM OF RANKS REQUIRED WITH CURRENT WEAPON - TO ONLY ATTACK UBERMONSTER IF THEY EXIST IN ROOM
# LOW END WEAPON IS MAX NUM OF RANKS FOR CURRENT WEAPON - TO ONLY ATTACK NOOBMONSTER IF THEY EXIST IN ROOM
# USED WHEN BACKTRAINING LOWER WEAPONS IN SAME AREA WITH DIFFERENT LEVEL CRITTERS
var HIGH.END 200
var LOW.END 200

var DEFAULT_CONTAINER backpack
var BOX_CONTAINER haversack
var GEM_CONTAINER bag
var GEMPOUCH_CONTAINER tort sack
var SHEATH rapier sheath
var BELT_WRIST_KNIFE wrist
var BOW_AMMO cane arrow
var XB_AMMO leafhead bolt
var SLING_AMMO smoky-quartz clump
var QUIVER rucksack
var LT_SHEATH pack
var HT_SHEATH pack

##### PICK WHICH KHRI YOU WANT THE SCRIPT TO USE
var FOCUS ON
var AVOIDANCE ON
var ELUSION ON
var PROWESS ON
var STRIKE ON
var HASTEN ON
var SHADOWSTEP ON
var STEADY ON
var SAGACITY ON
var GUILE ON
var DARKEN ON
var DAMPEN ON
var ELIMINATE OFF
var FLIGHT OFF
var LIBERATION OFF
var SERENITY OFF
var CALM OFF

##### PUT YOUR ARMOR SETS IN HERE IF YOU WANT TO SWAP ARMORS
##### IF YOU DO NOT WANT SCRIPT TO SWAP ARMOR AUTOMATICALLY CHOOSE var ARMOR.SWAP NO
var ARMOR.SWAP NO
var ARMOR1 leather
var ARMOR2 chain gloves
var ARMOR3 lamellar balaclava
var ARMOR4 bronze gauntlets
var ARMOR5 black helm
var GAG_ECHO YES
#############################################################################
###                                                                       ###
###      END VARIABLE INIT: DO NOT CHANGE ANY MORE VARIABLES              ###
###                                                                       ###
#############################################################################

action remove ^You are still stunned

var JUGGLIE $juggle

## Has full aim been attained yet
var FULL_AIM NO

## Has full targetting been attained yet
var FULL_TARGET NO

## Has spell been fully prepped
var FULL_PREP NO

## Already searched the dead creature
var SEARCHED NO

var APPRAISED NO

## Arm-worn shield during ranged attempts
if "%ARM.WORN.SHIELD" = "YES" then var REM_SHIELD NO
else var REM_SHIELD %SHIELD

## Stance variables
var PARRY_LEVEL 0
var EVAS_LEVEL 0
var SHIELD_LEVEL 0

## Tactics-training variables
var moveone none
var movetwo none
var movethree none
var movefour none
var movefive none
var NEXT.MOB none
var ordinals |first|second|third|fourth|fifth|sixth|seventh

## Initialize variable for roaming
var lastdirection none

## Local variable for counting kills, loots, skins, etc
var LOCAL 0
var LOOTED NO
var CURR_WEAPON

## Hurt Variables
var DYING OFF
var BLEEDING OFF
var HURT OFF

## Global variables for kills, loots, skins, etc
if matchre($GH_KILLS, \D+) then put #var GH_KILLS 0
if matchre($GH_LOOTS, \D+) then put #var GH_LOOTS 0
if matchre($GH_SKINS, \D+) then put #var GH_SKINS 0

#######################
## SCRIPT VARIALBLES ##
#######################
gosub stowing
gosub stowammo
## variable LAST is used with the WEBBED and PAUSE subroutines
## LAST is set to the current subroutine you in within the script
if ("%1" != "MULTIWEAPON") then
{
     ## MULTI can be OFF or ON
     ## ON - Will switch weapons to the next multi setup when locked
     ## OFF - Default, attacks with just this weapon
     put #var GH_MULTI OFF
} else
{
     shift
}

## Counter is used to send you back to combat from searching

######################################################
##                 GLOBAL VARIABLES                 ##
## These variables can be changed while Hunter ##
## is running to modify how the script works.       ##
## eg If you get tired of skinning, but have GH set ##
## to skin, just change GH_SKIN to OFF              ##
## All global variables are GH_<<name>> so they are ##
## all in the same spot in the variables window     ##
######################################################

## AMBUSH can be OFF or ON
## ON - Using ambushing attacks, hides and stalks before every attack
## OFF - Default, attacks normally
put #var GH_AMBUSH OFF
action (stalk) off

## ANALYZE can be OFF or ON
## ON - Analyze monsters to get debuff combos
## OFF - Default, attacks normally
put #var GH_ANALYZE OFF

## APPR can be NO or YES
## YES - Kills first creature, then appraises one creature once before entering the combat loop
##      Will appraise once after each kill, will not appraise once skill is dazed or mind locked
## NO - Default, no appraising of creatures
put #var GH_APPR NO

## ARRANGE can be OFF or ON
## ON - Will attempt to arrange a skinnable creature before skinning it.
## OFF - Default, will just skin creatures
put #var GH_ARRANGE OFF

## ARRANGE_ALL can be OFF or ON
## ON - Will arrange kills with the 'ALL' option. Requires outfitter technique.
## OFF - Default, till arrange to MAX_ARRANGE value
put #var GH_ARRANGE_ALL OFF

## BUN can be OFF or ON
## Note: Skinning must be enabled for bundling to work
## ON - Will bundle skinnings with rope
##      If no more bundling ropes are available, will be set to OFF
## OFF - Default, will just drop skins
put #var GH_BUN OFF

## COUNTING can be OFF or ON
## ON - Will dance with specified number of creatures.
##      Checks number of creatures after each pass through loop.
## OFF - Default, will kill everything as fast as possible
put #var GH_DANCING OFF

## EXP can be ON or OFF
## ON - Checks weapons experience after every kill
##      Also checks mindstate and any alternate experience
## OFF - No experience checks
if ("$GH_MULTI" = "OFF") then put #var GH_EXP OFF

## FEINT can be OFF or ON
## ON - Uses a feinting routine (feint slice, etc) to maintain balance
## OFF - Default, will use normal combat routine
## Note: Only usable with melee weapon fighting
put #var GH_FEINT OFF

## HUNT can be OFF or ON
## ON - Uses the HUNT verb every 90 seconds to train perception and stealth
## OFF - Default, will only use HUNT if roaming
put #var GH_HUNT OFF

## JUGGLE can be OFF or ON
## ON - Juggles when no monsters in the room
## OFF - Default, uses standard operations when no monsters in the room
put #var GH_JUGGLE OFF

## LOOT can be OFF or ON
## ON - Loots everything: boxes, gems coins; stores loot in LOOT_CONTAINER
##      If LOOT_CONTAINER fills up, stops looting boxes and gems
## OFF - Default, leaves loot on the ground
## Note: Turning on LOOT turns on LOOT_BOX, LOOT_GEM, LOOT_COIN
put #var GH_LOOT OFF

## LOOT_BOX can be OFF or ON
## ON - Loots boxes until LOOT_CONTAINER is full
## OFF - Default, leaves boxes on the ground
put #var GH_LOOT_BOX OFF

## LOOT_COIN can be OFF or ON
## ON - Loots coins
## OFF - Default, leaves coins on the ground
put #var GH_LOOT_COIN OFF

## LOOT_COLL can be OFF or ON
## ON - Will loot collectibles: Imperial diras and cards
## OFF - Default, will collectibles on the ground
put #var GH_LOOT_COLL OFF

## LOOT_GEM can be OFF or ON
## ON - Loots gems until LOOT_CONTAINER is full
## OFF - Default, leaves gems on the ground
put #var GH_LOOT_GEM OFF

## LOOT_JUNK can be OFF or ON
## ON - Loots junk items until LOOT_CONTAINER is full
## OFF - Default, leaves junk items on the ground
put #var GH_LOOT_JUNK OFF

## Point out hidden creatures
action (point) on

## MARK changes appraise to use ALL for thieves instead of appraise
put #var GH_MARK ON

## RETREAT can be OFF or ON
## ON - Uses the retreats for ranged combat, melee!
## OFF - Default, bypasses retreats for ranged combat
put #var GH_RETREAT OFF

## ROAM can be OFF or ON
## ON - Will roam around the hunting area  on main directions (n,nw,w,sw,s,se,e,ne,u,d)
##      if you kill all the creatures in your area
## OFF - Default, will stay in your own room no matter what
put #var GH_ROAM OFF

## SCRAPE can be OFF or ON
## ON - Scrapes skins/pelts/hides after skinning
## OFF - Default, just searches all creatures
## Note: This works with SKIN_RETREAT and BUNDLING
put #var GH_SCRAPE OFF

## SEARCH can be set to Treasure, Boxes, Equipment, Goods, or All
## Defaults to loot goods, which is game default
## See in game LOOT HELP for more information
put #var GH_SEARCH GOODS

## SKIN can be OFF or ON
## ON - Skin creatures that can be skinned
##      Drops skins unless BUN is set to ON
## OFF - Default, just searches all creatures
put #var GH_SKIN OFF

## SKIN_RET can be OFF or ON
## ON - Turns on the retreat triggers while skinning
## OFF - Default, doesn't retreat for skinning
put #var GH_SKIN_RET OFF

## SLOW can be OFF or ON
## ON - Turns on pauses between weapon strikes
## OFF - Default, no pauses
put #var GH_SLOW OFF

## SNAP can be OFF or ON
## ON - Snap fires a ranged weapon
## OFF - Default, waits for a full aim to fire a ranged
put #var GH_SNAP OFF
var SNIPE OFF

## STANCE can be OFF or ON
## ON - Check stance exp after each kill, switch on dazed or mind lock
## OFF - Default, no stance exp checking
put #var GH_STANCE OFF

## TACTICS can be OFF or ON
## ON - Use tactical moves as part of combat
## OFF - Default, no additional tactics training (other than what may be autoselected from "attack")
put #var GH_TACTICS OFF

## TARGET (global) can be ""(null) or any valid body part spells should target
put #var GH_TARGET ""

## TIE can be OFF or ON
## ON - Will tie bundle when created
## OFF - Default, leaves bundle untied
put #var GH_TIE OFF

## TIMER can be OFF or ON
## ON - If the timer is greater than MAX_TRAIN_TIME, end the script
## OFF - Default, run script endlessly
put #var GH_TIMER OFF

## TRAIN can be ON or OFF
## ON - Weapon or Alternate experience will be checked more often than just when critters die.
## OFF - Default, normal EXP check cycle.
if ("$GH_MULTI" = "OFF") then put #var GH_TRAIN OFF

## WEAR can be OFF or ON
## ON - Will wear a bundle
## OFF - Default, Will drop bundles
put #var GH_WEAR OFF

############################
##  End GLOBAL Variables  ##
############################

############################
## Local Script Variables ##
############################
## ALTEXP can be OFF or ON
## ON - Will check an alternate skill as well as weapon skill
## OFF - Just check weapon experience
var ALTEXP OFF

## BACKSTAB can be OFF or ON
## ON - Will backstab with a weapon
##      If weapon is not suitable for backstabbing, will enter normal combat with weapon
## OFF - Default, will attack normally with weapon
var BACKSTAB OFF

## BONDED can be OFF or ON
## ON - Uses invoke to retrieve bonded throwing weapon.
## OFF - Default.
var BONDED OFF

## BRAWLING can be OFF or ON
## ON - Brawling mode, uses bare hands to kill creatures (or non-lethal for Empaths)
## OFF - Default
var EMPTY_HANDED OFF
var BRAWLING OFF

## CURR_STANCE can be Evasion, Parry_Ability or Shield_Usage
## Note: Used in stance switching
## Evasion - evasion stance is current one set, Default
## Parry_Ability - parry stance is current one set
## Shield_Usage - shield stance is current one set
var CURR_STANCE Evasion

## EXP2 can be Backstab, Hiding, NONE, Offhand_Weapon, Stalking
## Backstab - Used when backstabbing
## Hiding - Used when sniping
## Offhand_Weapon - Used when offhand attacks are done
## Stalking - Used when ambushing and poaching
## NONE - Default
var EXP2 NONE

## FIRE_TYPE can be FIRE, POACH or SNIPE
## FIRE - Default, generic firing of ranged weapon
## POACH - Poaches creatures, hides and stalks before poaching
##         If creatures cannot be poached, fires normally
## SNIPE - Snipe creatures, hides and stalks before sniping
var FIRE_TYPE FIRE

## HAND can be <blank> or left
## <blank> - Default, attacks with the right hand
## left - Attacks with the left hand, used for one-handed weapons and throwing
var HAND

## HAND2 can be left or right
## Note: Used in stackables throwing to ensure you don't fill your hands
## left - Default
## right - Set when HAND = "left"
var HAND2 left

## MAX_TRAIN_TIME is how long, in seconds, you want the script to run before stopping
## Note: MAX_TRAIN_TIME defaults to 10 minutes
var MAX_TRAIN_TIME 600

## NOEVADE, NOPARRY, NOSHIELD are used with stance switching to indicate when you wish to skip a stance
## ON - Will skip the designated stance in the SWITCH_STANCE routine
## OFF - Default, will not skip this stance when switching
## Note: can only use one of these at a time.
var NOEVADE OFF
var NOPARRY OFF
var NOSHIELD OFF

## RANGED can be OFF or ON
## ON - For use with ranged weapons; bows, xbows and thrown
## OFF - Default, used with melee weapons
var RANGED OFF

## RETREATING can be OFF or ON. This variable is set internally.
## ON - Retreat triggers are ON
## OFF - Default, retreat triggers are OFF
var RETREATING OFF

## RUCK can be OFF or ON
## ON - Weapon was tied to a rucksack, used for sheathing while looting/skinning
## OFF - Default
## Note: Not yet implemented
var RUCK OFF

## SHIELD can be NONE or <shield type>
## NONE - Default, no shield used
## <shield type> - This is set either during the weapon check or ranged combat
##                 If set during the weapon check for a melee weapon, the shield is used during combat
##                 If set during ranged, the shield is removed and stowed, and reworn upon leaving the script
var SHIELD %SHIELD

## STACK can be OFF or ON
## ON - Throwing weapon is a stackable
## OFF - Default
var STACK OFF

## THROWN can be OFF or ON
## ON - Throw a weapon
## OFF - Default
var THROWN OFF

## HURL can be OFF or ON
## Will cause thrown weapons to be hurled
## ON - Hurls weapons, causing them to lodge if possible
## OFF - Default, will not use HURL
var HURL OFF

## LOB can be OFF or ON
## Will cause thrown weapons to be lobbed
## ON - Lobs weapons, preventing them from lodging
## OFF - Default, will not use LOB
var LOB OFF

## YOYO can be OFF or ON
## YOYO is a subset of JUGGLING, it uses a yoyo instead of a standard jugglie
## ON - "juggle" with a yoyo
## OFF - Default, normal jugglie
var YOYO OFF
################################
## End Local Script Variables ##
################################
if !$standing then gosub standup
counter set 0
gosub RETREAT_UNTRIGGERS
action var guild $1;put #var guild $1 when Guild: (\S+)
action var circle $1;put #var circle $1 when Circle: (\d+)
action var BONDED ON when sense a deep connection
send info
waitforre ^Debt:$
pause 0.01
pause 0.01
action remove Guild: (\S+)
action remove Circle: (\d+)
pause 0.01
echo **** Guild: %guild  ****
echo **** Circle: %circle ****
var starter.room $roomid
if ("$GH_MULTI" = "DMULTI") then goto LOAD_DEFAULT_SETTINGS
if_1 goto VARIABLE_CHECK
if ("$GH_DEF_SET" = "YES") then goto LOAD_DEFAULT_SETTINGS

DEFAULT_NOT_SET:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** ERROR ***
          echo Your default setting are not set yet.
          echo Run .hunter DSET <<default settings>> to set them
          echo
          echo Now exiting script
     }
     goto DONE

##############################
##                          ##
##  Start of actual script  ##
##                          ##
##############################
VARIABLE_CHECK:
     var LAST VARIABLE_CHECK
     gosub clear
     if matchre (toupper("%1"),"(\b%OPTIONVARS)") then
     {
          var OPTION %1
          #pause 0.1
          shift
          gosub %OPTION
          goto VARIABLE_CHECK
     }
     gosub GENERAL_TRIGGERS

BEGIN:
     var LAST BEGIN
     #if ("%ARM.WORN.SHIELD" = "YES") then GOSUB SHIELD_CHECK
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BEGIN: ***
          echo
     }
          match BEGIN.GET lying at your feet
          matchre WEAPON_CHECK ^With a flick of your wrist|You draw|already holding|free to
          matchre BEGIN_HANDS free hand|need to have your right hand
          matchre BEGINA out of reach|remove|What were you|can't seem|Wield what\?
          matchre BEGINB ^You can only wield a weapon or a shield!
     put wield right my %1
     matchwait 15

BEGINA:
     var LAST BEGINA
          matchre WEAPON_CHECK You sling|already holding|inventory|You remove|You loosen|You slide
          matchre BEGIN_HANDS free hand|hands are full
          matchre BEGINB Remove what\?|You aren't wearing
     put remove my %1
     matchwait 15

BEGINB:
     var LAST BEGINB
          matchre WEAPON_CHECK You get|you get|You are already holding
          match NO_VALUE Please rephrase that command
          matchre SWITCH_WEAPON ^What were you
          matchre UNTIE it is untied.
     put get %1
     matchwait 30
     goto WEAPON_ERROR

UNTIE:
     var RUCK ON
          match WEAPON_CHECK you get
          match NO_VALUE Please rephrase that command
          match SWITCH_WEAPON What were you
     put untie my %1 from ruck
     matchwait 30
     goto WEAPON_ERROR

BEGIN.GET:
     put get %1
     pause 0.1
     goto BEGIN
####################################
##                                ##
##  First input was not a weapon  ##
##  Checking for variables now    ##
##                                ##
####################################

### Ambushing creatures, using the stalking skill for experience checks
AMB:
AMBU:
AMBUS:
AMBUSH:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** AMBUSHING: ***
          echo
     }
     put #var GH_AMBUSH ON
     var starter.room $roomid
     var ALTEXP ON
     var EXP2 Stealth
     if ("$GH_ROAM" = "OFF") then action (stalk) on
     if ("%NOOB" = "ON") then gosub REMOVE.PLATE
     return

### Analyzing creatures, uses analyze combos for Tactics training:
ANA:
ANAL:
ANALY:
ANALYZ:
ANALYZE:
TAC:
TACT:
TACTI:
TACTIC:
TACTICS:
     echo
     echo *** TACTICS: ***
     echo
     put #var GH_TACTICS ON
     return

## Appraising creatures until appraisal is locked
APPR:
APPRAISE:
APPRAISAL:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** APPRAISAL: ***
          echo
     }
     put #var GH_APPR YES
     if "$guild" = "Thief" then put #var GH_MARK ON
     return

## Arranging skinnable creatures before skinning
## Turns skinning on if it is not already
ARRA:
ARRAN:
ARRANG:
ARRANGE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** ARRANGE: ***
          echo
     }
     put #var GH_ARRANGE ON
     if ("$GH_SKIN" != "ON") then gosub SKIN
     if matchre("%1","^\d+$") then
     {
          put #var MAX_ARRANGE %1
          if ("%GAG_ECHO" != "YES") then echo *** Arranging %1 times ***
          shift
          return
     }
     if tolower(%1) = all then
          {
          match ARRANGE_ALL Leather Tanning Expertise
          match ARRANGE_ALL Basic Bone Collecting
          put craft tailor
          put craft carving
          matchwait 2
          echo *** You do not know how to Arrange all. Arranging 5 times ***
          put #var MAX_ARRANGE 5
          shift
          }
     else put #var MAX_ARRANGE 1
     return
ARRANGE_ALL:
     put #var GH_ARRANGE_ALL ON
     shift
     return

## Backstabbing with a weapon
BS:
BACK:
BACKS:
BACKST:
BACKSTA:
BACKSTAB:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BACKSTAB: ***
          echo
     }
     if ("%guild" != "Thief") then
     {
          echo
          echo ***  Can only backstab if you are a thief!!  ***
          echo
          return
     }
     gosub clear
     if ("%NOOB" = "ON") then gosub REMOVE.PLATE
     gosub GENERAL_TRIGGERS
     if ("$GH_ROAM" = "OFF") then action (stalk) on
     if ("$GH_FEINT" = "ON") then put #var GH_FEINT OFF
     put #var GH_AMBUSH ON
     var BACKSTAB ON
     var ALTEXP ON
     var EXP2 Backstab
     var LAST_ATTACK none
     counter set 1300
     var CURR_WEAPON %1
     var LAST GET_BS_WEAPON
     GET_BS_WEAPON:
               matchre APPRAISE_BS You draw|You slip|already holding|free to|You get|With a flick
               match BEGIN_HAND need to have your right hand
      match GET_BS_WEAPON2 out of reach
          put wield my %CURR_WEAPON
          matchwait 15
          goto VARIABLE_ERROR
GET_BS_WEAPON2:
          matchre APPRAISE_BS You draw|You slip|already holding|free to|You get|With a flick
          match BEGIN_HAND need to have your right hand
     put get my %CURR_WEAPON
     matchwait 15
     goto VARIABLE_ERROR
     APPRAISE_BS:
          var LAST APPRAISE_BS
               matchre LE_BS (a|and) light edged
               matchre ME_BS (a|and) medium edged
               matchre WEAPON_APPR_ERROR Roundtime|It's hard to appraise
          put appraise my %CURR_WEAPON quick
          matchwait 15
          goto WEAPON_APPR_ERROR
     LE_BS:
          var WEAPON_EXP Small_Edged
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 unused
          var _COMBO7 unused
          var _COMBO8 unused
          goto 1_HANDED_WEAPON
     ME_BS:
          var WEAPON_EXP Small_Edged
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 unused
          var _COMBO7 unused
          var _COMBO8 unused
          goto 1_HANDED_WEAPON


## Setting the stance to shield/blocking
BLO:
BLOC:
BLOCK:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BLOCK: ***
          echo
     }
     var CURR_STANCE Shield_Usage
     SET_SHIELD_STANCE:
          var LAST SET_SHIELD_STANCE
               match RETURN You are now set to
          put stance shield
          matchwait 15
     return

## Will change arrange for SKIN to BONE
BON:
BONE:
if ("%GAG_ECHO" != "YES") then
{
     echo
     echo *** ARRANGE FOR BONE ***
     echo
}
put #var GH_BONE ON
return

## Will include buffing routine
BUF:
BUFF:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BUFF: ***
          echo
     }
     put #var GH_BUFF ON
     put #var GH_BUFF_INCLUDE 0
     return

## Will bundle anything skinned.  If skinning not enabled this does nothing.
BUN:
BUND:
BUNDL:
BUNDLE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BUNDLE: ***
          echo
     }
     put #var GH_BUN ON
     if ("$GH_SKIN" != "ON") then gosub SKIN
     return

## Implements brawling attacks
BRA:
BRAW:
BRAWL:
BRAWLI:
BRAWLIN:
BRAWLING:
     put #parse BRAWLING!
     put #echo >WeaponLog Lime ** Brawling
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BRAWLING: ***
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     var WEAPON_EXP Brawling
     var BRAWLING ON
     if_1 then goto BRAWL_CHECK
     BRAWL_EMPTY:
          var EMPTY_HANDED ON
          var _COMBO1 bob
          var _COMBO2 circle
          var _COMBO3 shove
          var _COMBO4 punch
          var _COMBO5 kick
          var _COMBO6 claw
          var _COMBO7 attack
          var _COMBO8 attack
          counter add 800
          goto BRAWL_SETUP
     BRAWL_CHECK:
          if matchre ("%1","shield|\baegis\b|\bblock\b|buckler|carapace|heater|\bkwarf\b|\blid\b|pavise|platter|rondache|scutum|\bshell\b|\bsipar\b|\btarge\b|\btray\b|variog|\bwheel\b") then goto BRAWL_EMPTY
          var EMPTY_HANDED OFF
          var _COMBO1 bob
          var _COMBO2 circle
          var _COMBO3 shove
          var _COMBO4 bob
          var _COMBO5 circle
          var _COMBO6 shove
          var _COMBO7 attack
          var _COMBO8 attack
          counter add 800
          var CURR_WEAPON %1
          shift
     BRAWL_WEAPON:
          var LAST BRAWL_WEAPON
          gosub WIELD_WEAPON %CURR_WEAPON
          goto BRAWL_SETUP

COLL:
COLLE:
COLLEC:
COLLECT:
COLLECTIBLE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_COLLECTIBLES: ***
          echo
     }
     if ("$GH_LOOT" != "ON") then put #var GH_LOOT ON
     put #var GH_LOOT_COLL ON
     return

CUST:
CUSTO:
CUSTOM:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** CUSTOM STANCE: ***
          echo
     }
     action var PARRY_LEVEL $1 when ^You are currently using (\d+)% of your weapon parry skill
     action var EVAS_LEVEL $1 when ^You are currently using (\d+)% of your evasion skill
     action var SHIELD_LEVEL $1 when ^You are currently using (\d+)% of your shield block skill
     put stance custom
     waitfor You are now set to
     if (%PARRY_LEVEL > %EVAS_LEVEL) then
     {
          if (%PARRY_LEVEL > %SHIELD_LEVEL) then
          {

               var CURR_STANCE Parry_Ability
          }
          else
          {

               var CURR_STANCE Shield_Usage
          }
     }
     else
     {

          if (%EVAS_LEVEL >= %SHIELD_LEVEL) then
          {

               var CURR_STANCE Evasion
          } else
          {

               var CURR_STANCE Shield_Usage
          }
     }
     action remove ^You are currently using (\d+)% of your weapon parry skill
     action remove ^You are currently using (\d+)% of your evasion skill
     action remove ^You are currently using (\d+)% of your shield block skill
     return

## Dances with a number of creatures
## The number of creatures to dance with
COUNT:
DANCE:
     if ("%GAG_ECHO" != "YES") then
     {

          echo
          echo *** COUNT: ***
          echo
     }
     put #var GH_DANCING ON
     if (%1 > 6) then goto COUNT_6
     goto COUNT_%1
     COUNT_0:
     COUNT_1:
          var xCOUNT COUNT_ONE
          shift
          return
     COUNT_2:
          var xCOUNT COUNT_TWO
          shift
          return
     COUNT_3:
          var xCOUNT COUNT_THREE
          shift
          return
     COUNT_4:
          var xCOUNT COUNT_FOUR
          shift
          return
     COUNT_5:
          var xCOUNT COUNT_FIVE
          shift
          return
     COUNT_6:
          var xCOUNT COUNT_SIX
          shift
          return

DEF:
DEFA:
DEFAU:
DEFAUL:
DEFAULT:
     if ("%GAG_ECHO" != "YES") then
     {

          echo
          echo *** DEFAULT: ***
          echo Using Default Settings
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     if ("$GH_MULTI" != "OFF") then goto DEFAULT_ERROR
     goto LOAD_DEFAULT_SETTINGS

DSET:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** DEFAULT-SET: ***
          echo Preparing to set Default settings
          echo
     }
     var DSET ON
     return

DMSET:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** DEFAULT-MULTI-SET: ***
          echo Preparing to setup up weapons to use in multi.
          echo Using other default settings
          echo
     }
     var SET_NUM 1
     SET_DM_STRING:
          if (SET_NUM > 10) then goto DONE_SET_DM
          put #var GH_MULTI_WEAPON_%SET_NUM %1
          math SET_NUM add 1
          shift
          if_1 goto SET_DM_STRING
     DONE_SET_DM:
     math SET_NUM subtract 1
     put #var GH_MULTI_NUM %SET_NUM
     goto DONE

DMULTI:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** DMULTI: ***
          echo
     }
     gosub clear
     put #var GH_EXP ON
     put #var GH_TRAIN ON
     put #var GH_MULTI DMULTI
     if matchre ("%1","^\d+$") then
          {
               put #var GH_MULTI_CURR_NUM %1
               if ($GH_MULTI_CURR_NUM > $GH_MULTI_NUM) then goto MULTI_ERROR
               put .hunter MULTIWEAPON $GH_MULTI_WEAPON_$GH_MULTI_CURR_NUM
          }
     put #var GH_MULTI_CURR_NUM 1
  put .hunter MULTIWEAPON $GH_MULTI_WEAPON_1
     DMULTI_ERROR:
          echo
          echo *** DMULTI_ERROR: ***
          echo Something bad happened trying to multi-weapon with defaults
     goto DONE

DLOAD:
DUAL:
DUALL:
DUALLO:
DUALLOA:
DUALLOAD:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** DUAL LOAD: ***
          echo
     }
put #var GH_DUAL_LOAD ON
return

## Non-lethal brawling, useful for Empaths or dancing
EMP:
EMPU:
EMPA:
EMPUF:
EMPAT:
EMPUFF:
EMPATH:
put #parse BRAWLING!
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** EMPATH_BRAWLING: ***
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     var WEAPON_EXP Tactics
     var _COMBO1 parry
     var _COMBO2 shove
     var _COMBO3 circle
     var _COMBO4 shove
     var _COMBO5 bob
     var _COMBO6 unused
     var _COMBO7 unused
     var _COMBO8 unused
     var EMPTY_HANDED ON
     counter add 500
     EMPATH_WEAPON_CHECK:
          var LAST EMPATH_WEAPON_CHECK
          if_1 then
          {
               if matchre ("%1","shield|buckler|pavise|heater|kwarf|sipar|lid|targe\b") then goto BRAWL_SETUP
               else
               {
                    var CURR_WEAPON %1
                    shift
                    gosub WIELD_WEAPON %CURR_WEAPON
                    var EMPTY_HANDED OFF
               }
          }
          goto BRAWL_SETUP

## Sets the stance to evasion
DODGE:
EVAS:
EVAD:
EVASI:
EVADE:
EVASIO:
EVASION:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** EVASION: ***
          echo
     }
     var CURR_STANCE Evasion
     SET_EVAS_STANCE:
          var LAST SET_EVAS_STANCE
               match RETURN You are now set to
          put stance evasion
          matchwait 15
     return

## Will check exp, ends scripts when checked skill is locked
EXP:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** EXP: ***
          echo
     }
     put #var GH_EXP ON
     return

## This will use feint during combat to keep balance up
FEINT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** FEINT: ***
          echo
     }
     if ("%BACKSTAB" != "ON") then put #var GH_FEINT ON
     return

## Uses HUNT to train perception and stalk, but not move
HUNT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** HUNT: ***
          echo
     }
     put #var GH_HUNT ON
     var HUNT_TIME 0
     return

## Juggles when no monsters
JUGG:
JUGGL:
JUGGLE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** JUGGLE: ***
          echo
     }
     put #var GH_JUGGLE ON
     return

## Loots gems
JUNK:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_JUNK: ***
          echo
     }
     if ("$GH_LOOT" != "ON") then put #var GH_LOOT ON
     put #var GH_LOOT_JUNK ON
     return

## Loots everything
LOOTA:
LOOTAL:
LOOTALL:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_ALL: ***
          echo
     }
     put #var GH_LOOT ON
     put #var GH_LOOT_GEM ON
     put #var GH_LOOT_BOX ON
     put #var GH_LOOT_COIN ON
     put #var GH_LOOT_COLL ON
     return

## Loots boxes
LOOTB:
LOOTBO:
LOOTBOX:
LOOTBOXE:
LOOTBOXES:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_BOXES: ***
          echo
     }
     if ("$GH_LOOT" != "ON") then put #var GH_LOOT ON
     put #var GH_LOOT_BOX ON
     return

## Loots coins
LOOTC:
LOOTCO:
LOOTCOI:
LOOTCOIN:
LOOTCOINS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_COINS: ***
          echo
     }
     if ("$GH_LOOT" != "ON") then put #var GH_LOOT ON
     put #var GH_LOOT_COIN ON
     return

## Loots gems
LOOTG:
LOOTGE:
LOOTGEM:
LOOTGEMS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOOT_GEMS: ***
          echo
     }
     if ("$GH_LOOT" != "ON") then put #var GH_LOOT ON
     put #var GH_LOOT_GEM ON
     return



## Starts training Multiple weapons
MULTI:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** MULTI: ***
          echo
     }
     gosub clear
     put #var GH_EXP ON
     put #var GH_TRAIN ON
     put #var GH_MULTI MULTI
     if matchre ("%1","^\d+") then
          {
               put #var GH_MULTI_CURR_NUM %1
               if ($GH_MULTI_CURR_NUM > $GH_MULTI_NUM) then goto MULTI_ERROR
               put .hunter MULTIWEAPON $GH_MULTI_$GH_MULTI_CURR_NUM
          }
     put #var GH_MULTI_CURR_NUM 1
  put .hunter MULTIWEAPON $GH_MULTI_1
     MULTI_ERROR:
          echo
          echo *** MULTI_ERROR: ***
          echo Something bad happened trying to multi-weapon
     goto DONE

MSET:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** MULTI-SET: ***
          echo Preparing to setup up multi-weapon training
          echo
     }
     gosub clear
     var SET_NUM 1
     SET_M_STRING:
          if (SET_NUM > 19) then goto DONE_M_SET
          put #var GH_MULTI_%SET_NUM %1
          math SET_NUM add 1
          shift
          if_1 goto SET_M_STRING
     DONE_M_SET:
     math SET_NUM subtract 1
     put #var GH_MULTI_NUM %SET_NUM
     goto DONE

# Not using evasion stance in stance switching
NOEVADE:
NOEVAS:
NOEVASION:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** NOEVADE: ***
          echo
     }
     var NOEVADE ON
     return

# Not using parry stance in stance switching
NOPA:
NOPARRY:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** NOPARRY: ***
          echo
     }
     var NOPARRY ON
     return

# Not using shield stance in stance switching
NOSH:
NOSHIELD:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** NOSHIELD: ***
          echo
     }
     var NOSHIELD ON
     return

## Uses the weapon in the offhand
## Currently just for throwing weapons from the left hand
OFF:
OFFH:
OFFHA:
OFFHAN:
OFFHAND:
     put #parse OFFHAND!
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** OFFHAND: ***
          echo
     }
     var HAND left
     var HAND2 right
     var ALTEXP ON
     var EXP2 Offhand_Weapon
     return

## Sets the stance to parry
PARRY:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** PARRY: ***
          echo
     }
     var CURR_STANCE Parry_Ability
     SET_PARRY_STANCE:
          var LAST SET_PARRY_STANCE
               match RETURN You are now set to
          put stance parry
          matchwait 15
     return

## Poaching a target, if target is unpoachable, just fires
POACH:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** POACH: ***
          echo
     }
     var FIRE_TYPE POACH
     var SNIPE ON
     var ALTEXP ON
     var EXP2 Stealth
     return

## Point out hidden creatures
POINT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** POINT: ***
          echo
     }
     action (point) on
     return

### Turns off Retreating
RET:
RETREAT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** RETREAT: ***
          echo
     }
     put #var GH_RETREAT ON
     return

# Roam hunting area if all creatures in your room are dead
ROAM:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** ROAM: ***
          echo
     }
     put #var GH_ROAM ON
     if "$GH_AMBUSH" = "ON" then action (stalk) off
     return

# Scrape skins/pelts/hides after skinning
SCRAPE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SCRAPE: ***
          echo
     }
     if ("$GH_SKIN" != "ON") then gosub SKIN
     put #var GH_SCRAPE ON
     return

# Sets looting option
SEARCH:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SEARCH: ***
          echo
     }
     if toupper("%1") = "ALL" || toupper("%1") = "TREASURE" || toupper("%1") = "BOXES"  || toupper("%1") = "EQUIPMENT"  || toupper("%1") = "GOODS" then
     {
          put #var GH_SEARCH %1
          shift
     }
     return

## Skins creatures that can be skinned
SKIN:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SKIN: ***
          echo
     }
     var BELT_WORN OFF
     action var BELT_WORN ON when ^You are wearing.+(ankle|arm|belt|outdoors|ritualist'?s?|skinning|tail|thigh|wrist) (blade|knife)
     put inventory
     waitforre ^You are wearing
     action remove ^You are wearing.+(ankle|arm|belt|outdoors|ritualist'?s?|skinning|tail|thigh|wrist) (blade|knife)
     put #var GH_SKIN ON
     if "$GH_BONE" = "ON" then put #var GH_SKINPART BONE
     if "$GH_PART" = "ON" then put #var GH_SKINPART PART
     if "$GH_BONE" = "OFF" && "$GH_PART" = "OFF" then put #var GH_SKINPART SKIN
     return

## Retreats while skinning
SKINR:
SKINRE:
SKINRET:
SKINRETREAT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SKINRET: ***
          echo
     }
     if ("$GH_SKIN" != "ON") then gosub SKIN
     put #var GH_SKIN_RET ON
     return

## Pauses between combat manuevers to sustain stamina
SLOW:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo ***  SLOW:  ***
          echo
     }
     put #var GH_SLOW ON
     if matchre ("%1", "(\d+)") then
     {
          put #var GH_SLOW_PAUSE $1
          shift
     } else put #var GH_SLOW_PAUSE 3
     return

## Snapfires a ranged weapon or snapcasts spells
SNAP:
SNAPFIRE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SNAP: ***
          echo
     }
     put #var GH_SNAP ON
     if matchre ("%1", "(\d+)") then
     {
          put #var GH_SNAP_PAUSE $1
          shift
     } else put #var GH_SNAP_PAUSE 0
     return

## Snipes with a ranged weapon
SNIP:
SNIPE:
SNIPING:
     if contains("Barbarian|Bard|Cleric|Commoner|Empath|Moon Mage|Paladin|Trader|Warrior Mage", "%guild") then return
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SNIPE: ***
          echo
  }
     var starter.room $roomid
     var SNIPE ON
     var FIRE_TYPE SNIPE
     var ALTEXP ON
     var EXP2 Stealth
     if ("%NOOB" = "ON") then gosub REMOVE.PLATE
     if "$GH_ROAM" = "OFF" then action (stalk) on
     return

## Will cycle through stances
STA:
STAN:
STANC:
STANCE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** STANCE: ***
          echo
     }
     action var PARRY_LEVEL $1 when ^You are currently using (\d+)% of your weapon parry skill
     action var EVAS_LEVEL $1 when ^You are currently using (\d+)% of your evasion skill
     action var SHIELD_LEVEL $1 when ^You are currently using (\d+)% of your shield block skill
     put #var GH_STANCE ON
     put stance
     waitfor Last Combat Maneuver:
     if (%PARRY_LEVEL > %EVAS_LEVEL) then
     {
          if (%PARRY_LEVEL > %SHIELD_LEVEL) then
          {
               var CURR_STANCE Parry_Ability
          } else
          {
               var CURR_STANCE Shield_Usage
          }
     } else
     {
          if (%EVAS_LEVEL >= %SHIELD_LEVEL) then
          {
               var CURR_STANCE Evasion
          } else
          {
               var CURR_STANCE Shield_Usage
          }
     }
     action remove ^You are currently using (\d+)% of your weapon parry skill
     action remove ^You are currently using (\d+)% of your evasion skill
     action remove ^You are currently using (\d+)% of your shield block skill
     echo %CURR_STANCE
     return

## Throws a stacked weapon (e.g. throwing blades)
STACK:
STACKS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** STACK: ***
          echo
     }
     var STACK ON
     goto THROW

SWAP:
BAST:
BASTA:
BASTAR:
BASTARD:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SWAP: ***
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     var SWAP_TYPE %1
     var GOING_TO WEAPON_CHECK
     shift
     goto SWAP_WIELD

TSWAP:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** THROWN SWAP: ***
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     var SWAP_TYPE %1
     var GOING_TO THROW_VARI
     counter add 1200
     shift

## Swap but for fans
FSWAP:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** FAN SWAP: ***
          echo
     }
     gosub clear
     gosub GENERAL_TRIGGERS
     var FSWAP_TYPE %1
     var FAN_STATUS CLOSED
     var GOING_TO WEAPON_CHECK
     shift
     goto FSWAP_WIELD
     FSWAP_WIELD:
          var LAST FSWAP_WIELD
          matchre FSWAP_%FSWAP_TYPE You draw|already holding|free to|With a flick of your wrist
          match BEGIN_HANDS free hand|need to have your right hand
          matchre FSWAP_REMOVE out of reach|remove|What were you|can't seem|Wield what\?
          match VARIABLE_ERROR You can only wield a weapon or a shield!
          put wield right my %1
          matchwait 15
     FSWAP_REMOVE:
          var LAST FSWAP_REMOVE
          matchre FSWAP_%FSWAP_TYPE You sling|re already|inventory|you remove
          matchre FSWAP_GET Remove what|You aren't wearing
          match BEGIN_HANDS hands are full
          put remove my %1
          matchwait 15
     FSWAP_GET:
          var LAST FSWAP_GET
          match FSWAP_%FSWAP_TYPE You get
          match VARIABLE_ERROR What were you
          put get my %1
          matchwait 15
          goto VARIABLE_ERROR
     FSWAP_SE:
          var LAST FSWAP_SE
          if ("%FAN_STATUS" = "CLOSED") then
          {
               matchre PAUSE (heavy|two-handed) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               matchre %GOING_TO (medium|light) edged
               put open my %1
               var FAN_STATUS OPENED
               matchwait 15
               goto SWAP_ERROR
          }
          if ("%FAN_STATUS" = "OPENED") then
          {
               matchre PAUSE (heavy|two-handed) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               matchre %GOING_TO (medium|light) edged
               put close my %1
               var FAN_STATUS CLOSED
               matchwait 15
               goto SWAP_ERROR
          }
     FSWAP_S:
          var LAST FSWAP_S
          if ("%FAN_STATUS" = "CLOSED") then
          {
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|medium|light|two-handed) blunt|pike|halberd
               matchre %GOING_TO (short|quarter) staff
               put open my %1
               var FAN_STATUS OPENED
               matchwait 15
               goto SWAP_ERROR
          }
          if ("%FAN_STATUS" = "OPENED") then
          {
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|medium|light|two-handed) blunt|pike|halberd
               matchre %GOING_TO (short|quarter) staff
               put close my %1
               var FAN_STATUS CLOSED
               matchwait 15
               goto SWAP_ERROR
          }

     SWAP_WIELD:
          var LAST SWAP_WIELD
               matchre SWAP_%SWAP_TYPE You slip|You draw|already holding|free to|With a flick of your wrist
               match BEGIN_HANDS free hand|need to have your right hand
               matchre SWAP_REMOVE out of reach|remove|What were you|can't seem|Wield what\?
               match VARIABLE_ERROR You can only wield a weapon or a shield!
          put wield right my %1
          matchwait 15
     SWAP_REMOVE:
          var LAST SWAP_REMOVE
               matchre SWAP_%SWAP_TYPE You slip|You sling|re already|inventory|you remove|You slide
               matchre SWAP_GET Remove what|You aren't wearing
               match BEGIN_HANDS hands are full
          put remove my %1
          matchwait 15
     SWAP_GET:
          var LAST SWAP_GET
               match SWAP_%SWAP_TYPE You get
               match VARIABLE_ERROR What were you
          put get my %1
          matchwait 15
          goto VARIABLE_ERROR
     SWAP_SE:
          var LAST SWAP_SE
               matchre PAUSE (heavy|two-handed) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO (medium|light) edged
          put swap my %1
          matchwait 15
          goto SWAP_ERROR
     SWAP_LE:
          var LAST SWAP_LE
               matchre PAUSE (medium|light|two-handed) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO heavy edged
          put swap my %1
          matchwait 15
          goto SWAP_ERROR
     SWAP_SB:
          var LAST SWAP_SB
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|two-handed) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO (medium|light) blunt
          put swap my %1
          matchwait 15
          goto SWAP_ERROR
     SWAP_LB:
          var LAST SWAP_LB
               matchre PAUSE (heavy|medium|light|two-handed) edged|(medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO heavy blunt
          put swap my %1
          matchwait 15
          goto SWAP_ERROR
     SWAP_2HE:
          var LAST SWAP_2HE
               matchre PAUSE (heavy|medium|light) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO two-handed edged
          put swap my %1
          matchwait 15
          goto SWAP_ERROR
     SWAP_2HB:
          var LAST SWAP_2HB
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|medium|light) blunt|(short|quarter) staff|pike|halberd
               match %GOING_TO two-handed blunt
          put swap my %1
          matchwait 15
          goto SWAP_ERROR

     SWAP_POLE:
          var LAST SWAP_POLE
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|medium|light|two-handed) blunt|(short|quarter) staff
               match %GOING_TO pike|halberd
          put swap my %1
          matchwait 60
          goto SWAP_ERROR
     SWAP_S:
          var LAST SWAP_S
               matchre PAUSE (heavy|medium|light|two-handed) edged|(heavy|medium|light|two-handed) blunt|pike|halberd
               match %GOING_TO (short|quarter) staff
          put swap my %1
          matchwait 60
          goto SWAP_ERROR

## Sets a bodypart to target for ranged & spells
TARG:
TARGET:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** TARGET: ***
          echo
     }
     if matchre ("%1","^\D+$") then
     {
          put #VAR GH_TARGET %1
          echo Targetting the %1 with attacks.
          shift
     }
     return

THIEF:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** THIEF AMBUSHES ***
          echo
     }
     put #var GH_THIEF ON
     return

## Uses HURL to throw weapons and make them stick
HURL:
     var HURL ON
     goto throw

## Uses LOB to throw weapons and prevent them from sticking
LOB:
     var LOB ON
     goto throw

## Throws a weapon
THROW:
THROWN:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** THROWN: ***
          echo
     }
     if !$standing then gosub standup
     gosub clear
     gosub GENERAL_TRIGGERS
     GOSUB stowing
     gosub KHRI
     action var thrown.check 1 when eval $stamina = 100
     action if ("%thrown.check" = "1") then put enc;var thrown.check 0 when eval $stamina < 90
     var THROWN ON
     counter add 1200
     WIELD_THROWN:
          var LAST WIELD_THROWN
               matchre THROW_VARI You draw|free to|already holding|With a flick|You slip
               match BEGIN_HANDS free hand|need to have your right hand
               matchre THROW_EQUIP out of reach|remove|What were you|can't seem|Wield what\?|^You can only wield
          put wield right my %1
          matchwait 25
     THROW_EQUIP:
               matchre THROW_VARI You sling|already holding|inventory|You remove|right hand|You slide
               matchre THROW_EQUIP_2 ^Remove what\?|You aren't wearing that
               match BEGIN_HANDS hands are full
          put remove my %1
          matchwait 25
     THROW_EQUIP_2:
               matchre THROW_VARI ^You get|^You are already holding
               matchre VARIABLE_CHECK ^What were you
          put get my %1
          matchwait 15
     goto VARIABLE_ERROR

     THROW_VARI:
          var LAST THROW_VARI
          var CURR_WEAPON %1
          if ("$GH_FEINT" = "ON") then put #var GH_FEINT OFF
          if (("%HAND" = "left") && ("$lefthand" = "Empty")) then gosub SWAP_LEFT $righthandnoun
          else if_2 then gosub EQUIP_SHIELD %2
     APPRAISE_THROWN:
          var LAST APPRAISE_THROWN
          if (toupper("%CURR_WEAPON") = "LOG") then goto HT
          if (toupper("%CURR_WEAPON") = "ROCK") then goto LT
               match LT light thrown
               match HT heavy thrown
               match HT heavy blunt
               matchre WEAPON_APPR_ERROR Roundtime|It's hard to appraise
          put appraise my %CURR_WEAPON quick
          matchwait 15
          goto WEAPON_APPR_ERROR
     LT:
          put #parse LIGHT_THROWN!
          put #echo >WeaponLog Lime ** LT
          var T_SHEATH %LT_SHEATH
          var WEAPON_EXP Light_Thrown
          if ("%DSET" = "ON") then goto SET_DEFAULT
          else goto %c
     HT:
          put #parse HEAVY_THROWN!
          put #echo >WeaponLog Lime ** HT
          var T_SHEATH %HT_SHEATH
          var WEAPON_EXP Heavy_Thrown
          if ("%DSET" = "ON") then goto SET_DEFAULT
          else goto %c

## Will tie bundles.
TIE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** TIE: ***
          echo
     }
     put #var GH_TIE ON
     if ("$GH_BUNDLE" != "ON") then gosub BUNDLE
     return

## Wears bundles
WEAR:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** WEAR: ***
          echo
     }
     put #var GH_WEAR ON
     if ("$GH_BUNDLE" != "ON") then gosub BUNDLE
     return

TIME:
TIMER:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** TIMER: ***
          echo
     }
     put #var GH_TIMER ON
     var START_TIME %t
     if matchre ("%1", "(\d+)") then
     {
          var MAX_TRAIN_TIME $1
          shift
     }
     math MAX_TRAIN_TIME add %START_TIME
     return

TRAIN:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** TRAIN: ***
          echo
     }
     put #var GH_EXP ON
     put #var GH_TRAIN ON
     return

## Juggles a yoyo when no monsters
YOYO:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** YOYO: ***
          echo
     }
     put #var GH_JUGGLE ON
     var YOYO ON
     return

####################################
##                                ##
##    End variables & options     ##
##                                ##
####################################

BEGIN_HANDS:
     echo
     echo *** BEGIN_HANDS: ***
     echo
     echo *************************************
     echo **  Empty your hands and try again **
     echo **         Ending script           **
     echo *************************************
     echo
     put unload
     pause 0.5
     pause 0.3
  gosub stowing
     goto UBERTOP

###############################
##                           ##
##  Weapon checking section  ##
##                           ##
###############################

WEAPON_CHECK:
     put #var GH_LAST_COMMAND appraise my %CURR_WEAPON quick
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** WEAPON CHECK: ***
          echo
     }
     if !$standing then gosub standup
     var LAST WEAPON_CHECK
     gosub clear
     if ("%BACKSTAB" != "ON") then var CURR_WEAPON %1
          matchre WEAPON_CHECK ^\.\.\.wait\s+\d+\s+sec(?:onds|s)?\.?|^Sorry\,|^The clumps of dirt stinging your eyes
          matchre LE (a|and) light edged
          matchre LE small edged skill
          matchre ME (a|and) medium edged
          matchre HE (a|and) heavy edged
          matchre 2HE (a|and) two-handed edged
          matchre LB (a|and) light blunt
          matchre MB trains the small blunt
          matchre MB (a|and) medium blunt
          matchre HB (a|and) heavy blunt
          matchre 2HB (a|and) two-handed blunt
          matchre STAFF_SLING (a|and) staff sling
          matchre SHORT_BOW (a|and) short bow
          matchre LONG_BOW (a|and) long bow
          matchre COMP_BOW (a|and) composite bow
          matchre LX  (a|and) light crossbow
          matchre HX (a|and) heavy crossbow
          matchre SHORT_STAFF (a|and) short staff
          matchre Q_STAFF (a|and) quarter staff
          matchre PIKE (a|and) pike
          matchre HALBERD (a|and) halberd
          matchre SLING (a|and) sling
          matchre WEAPON_APPR_ERROR Roundtime|It's hard to appraise
     put appraise my %CURR_WEAPON quick
     matchwait 15
     goto WEAPON_APPR_ERROR

     2HE:
          put #parse TWOHANDED_EDGED!
          put #echo >WeaponLog Lime ** 2HE
          var AMMO %XB_AMMO
          echo
          echo *** Twohanded Edge: ***
          echo
          var WEAPON_EXP Twohanded_Edged
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 unused
          counter add 600
          if ("%HAND" = "left") then
          {
               var HAND
               var ALTEXP NONE
          }
          goto 2_HANDED_WEAPON

     HE:
          put #parse LARGE_EDGED!
          put #echo >WeaponLog Lime ** Heavy Edged
          echo
          echo *** HE: ***
          echo
          var WEAPON_EXP Large_Edged
          var RANGED OFF
          if matchre("$righthandnoun", "cinquedea") then goto HE_STAB
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 600
          goto 1_HANDED_WEAPON
     HE_SLICE:
          echo
        echo *** HE Slicer ***
          echo
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 attack
          counter add 800
          goto 1_HANDED_WEAPON

     HE_STAB:
          echo
          echo *** HE Stabber ***
          echo
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 unused
          counter add 700
          goto 1_HANDED_WEAPON
     ME:
          put #parse SMALL_EDGED!
          put #echo >WeaponLog Lime ** Medium Edged
          echo
          echo *** ME: ***
          echo
          var WEAPON_EXP Small_Edged
          var RANGED OFF
          if matchre("$righthand","adze|axe|cleaver|curlade|cutlass|hanger|hatchet|lata'oloh|mallet|mirror blade|nimsha|parang|riste|sapara|scimitar|scythe-blade|shotel|sword|tei'oloh'ata|telo|zobens") then goto ME_SLICE
          if matchre("$righthand","baselard|blade|foil|gladius|nambeli|pasabas|rapier|saber|sabre|shashqa|yataghan") then goto ME_STAB
          if matchre("$righthand","iltesh") then goto ME_ILTESH
          goto WEAPON_APPR_ERROR

          ME_SLICE:
               echo
               echo *** ME SLICE: ***
               echo
               var _COMBO1 parry
               var _COMBO2 feint
               var _COMBO3 attack
               var _COMBO4 attack
               var _COMBO5 attack
               var _COMBO6 attack
               var _COMBO7 unused
               var _COMBO8 unused
               counter add 600
          goto 1_HANDED_WEAPON

          ME_ILTESH:
               echo
               echo *** ME ILTESH: ***
               echo
               var _COMBO1 feint
               var _COMBO2 attack
               var _COMBO3 attack
               var _COMBO4 attack
               var _COMBO5 attack
               var _COMBO6 attack
               var _COMBO7 attack
               var _COMBO8 attack
               counter add 800
          goto 1_HANDED_WEAPON

          ME_STAB:
               echo
               echo *** ME THRUST: ***
               echo
               var _COMBO1 parry
               var _COMBO2 feint
               var _COMBO3 attack
               var _COMBO4 attack
               var _COMBO5 attack
               var _COMBO6 unused
               var _COMBO7 unused
               var _COMBO8 unused
               counter add 500
          goto 1_HANDED_WEAPON

     LE:
          put #parse SMALL_EDGED!
          put #echo >WeaponLog Lime ** Light Edged
          echo
          echo *** LE: ***
          echo
          var WEAPON_EXP Small_Edged
          var RANGED OFF
          if matchre("$righthandnoun", "bin|blade|bodkin|dagger|dirk|kasai|kindjal|lata|marlinspike|misericorde|pick|poignard|pugio|shavi|shriike|stiletto|briquet|takouba|telek") then goto LE_STAB
          if matchre("$righthandnoun", "dao|falcata|jambiya|kanabu|katar|knife|kounmya|kris|kythe|nehlata|oben|sword|tago|uenlata") then goto LE_SLICE
          goto WEAPON_APPR_ERROR

          LE_SLICE:
               echo
               echo *** LE SLICE: ***
               echo
               var _COMBO1 parry
               var _COMBO2 feint
               var _COMBO3 attack
               var _COMBO4 attack
               var _COMBO5 attack
               var _COMBO6 attack
               var _COMBO7 unused
               var _COMBO8 unused
               counter add 600
          goto 1_HANDED_WEAPON

          LE_STAB:
               echo
               echo *** LE STAB: ***
               echo
               var _COMBO1 parry
               var _COMBO2 feint
               var _COMBO3 jab
               var _COMBO4 attack
               var _COMBO5 attack
               var _COMBO6 attack
               var _COMBO7 unused
               var _COMBO8 unused
               counter add 500
          goto 1_HANDED_WEAPON

     2HB:
     put #parse TWOHANDED_BLUNT!
     put #echo >WeaponLog Lime ** Twohanded Blunt
     var AMMO %XB_AMMO
          echo
          echo *** Twohanded Blunt: ***
          echo
          var RANGED OFF
          var WEAPON_EXP Twohanded_Blunt
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 unused
          counter add 700
          if ("%HAND" = "left") then
          {
               var HAND
               var ALTEXP NONE
          }
          goto 2_HANDED_WEAPON

     HB:
     put #parse LARGE_BLUNT!
     put #echo >WeaponLog Lime ** Large Blunt
     var AMMO %XB_AMMO
          echo
          echo *** Large Blunt: ***
          echo
          var WEAPON_EXP Large_Blunt
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 unused
          counter add 700
          goto 1_HANDED_WEAPON

     MB:
          put #parse SMALL_BLUNT!
          put #echo >WeaponLog Lime ** Small Blunt
          echo
          echo *** MB: ***
          echo
          var WEAPON_EXP Small_Blunt
          var RANGED OFF
          var _COMBO1 dodge
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 600
          goto 1_HANDED_WEAPON

     LB:
          put #parse SMALL_BLUNT!
          put #echo >WeaponLog Lime ** Small Blunt
          echo
          echo *** LB: ***
          echo
          var WEAPON_EXP Small_Blunt
          var RANGED OFF
          var _COMBO1 dodge
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 attack
          var _COMBO8 unused
          counter add 700
          goto 1_HANDED_WEAPON

     HALBERD:
     put #parse POLEARM!
     put #echo >WeaponLog Lime ** Halberd
          echo
          echo *** HALBERD: ***
          echo
          var WEAPON_EXP Polearms
          var RANGED OFF
          var _COMBO1 dodge
          var _COMBO2 feint
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 600
          if ("%HAND" = "left") then
          {
               var HAND
               var ALTEXP NONE
          }
          goto 2_HANDED_WEAPON

     PIKE:
     put #parse POLEARM!
     put #echo >WeaponLog Lime ** Pike
          echo
          echo *** PIKE: ***
          echo
          var WEAPON_EXP Polearms
          var RANGED OFF
          var _COMBO1 dodge
          var _COMBO2 attack
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 unused
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 500
          if ("%HAND" = "left") then
          {
               var HAND
               var ALTEXP NONE
          }
          goto 2_HANDED_WEAPON

     SHORT_STAFF:
     put #parse STAVES!
     put #echo >WeaponLog Lime ** Staves
          echo
          echo *** SHORT STAFF: ***
          echo
          var WEAPON_EXP Staves
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 attack
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 unused
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 500
          goto 1_HANDED_WEAPON

     Q_STAFF:
     put #parse STAVES!
     put #echo >WeaponLog Lime ** Quarter Staff
          echo
          echo *** QUARTER STAFF: ***
          echo
          var WEAPON_EXP Staves
          var RANGED OFF
          var _COMBO1 parry
          var _COMBO2 attack
          var _COMBO3 attack
          var _COMBO4 attack
          var _COMBO5 attack
          var _COMBO6 attack
          var _COMBO7 unused
          var _COMBO8 unused
          counter add 600
          if ("%HAND" = "left") then
          {
               var HAND
               var ALTEXP NONE
          }
          goto 2_HANDED_WEAPON

     SHORT_BOW:
     put #parse Bow!
     put #parse Training Bow!
     put #echo >WeaponLog Lime ** Short Bow
          echo
          echo *** Short Bow: ***
          echo
          var WEAPON_EXP Bow
          var RANGED ON
          var AMMO %BOW_AMMO
          pause 1
          put retreat
          counter add 1000
          goto 2_HANDED_WEAPON

     LONG_BOW:
     put #parse Bow!
     put #parse Training Bow!
     put #echo >WeaponLog Lime ** Long Bow
          echo
          echo *** Long Bow: ***
          echo
          var WEAPON_EXP Bow
          var RANGED ON
          var AMMO %BOW_AMMO
          pause 1
          put retreat
          counter add 1000
          goto 2_HANDED_WEAPON

     COMP_BOW:
     put #parse Bow!
     put #parse Training Bow!
     put #echo >WeaponLog Lime ** Comp BOW
          echo
          echo *** Comp Bow: ***
          echo
          var WEAPON_EXP Bow
          var RANGED ON
          var AMMO %BOW_AMMO
          pause 1
          put retreat
          counter add 1000
          goto 2_HANDED_WEAPON

     HX:
     put #parse Crossbow!
     put #parse Training Crossbow!
     put #echo >WeaponLog Lime ** HX
          echo
          echo *** HX: ***
          echo
          var WEAPON_EXP Crossbow
          var RANGED ON
          var AMMO %XB_AMMO
          pause 1
          put retreat
          counter add 1000
          goto 2_HANDED_WEAPON

     LX:
     put #parse Crossbow!
     put #parse Training Crossbow!
     put #echo >WeaponLog Lime ** HX
          echo
          echo *** LX: ***
          echo
          var WEAPON_EXP Crossbow
          var RANGED ON
          var AMMO %XB_AMMO
          pause 1
          put retreat
          counter add 1000
          goto LX_SLING

     SLING:
     put #parse SLING!
     put #echo >WeaponLog Lime ** Sling
          echo
          echo *** SLING: ***
          echo
          var WEAPON_EXP Slings
          var RANGED ON
          var AMMO %SLING_AMMO
          pause 1
          put retreat
          counter add 1000
          goto LX_SLING

     STAFF_SLING:
     put #parse SLING!
     put #echo >WeaponLog Lime ** Staff Sling
          echo
          echo *** STAFF SLING: ***
          echo
          var WEAPON_EXP Slings
          var RANGED ON
          var AMMO %SLING_AMMO
          pause 1
          put retreat
          counter add 1000
          goto 2_HANDED_WEAPON

     2_HANDED_WEAPON:
          var LAST 2_HANDED_WEAPON
          save %c
          if (("%RANGED" = "ON") && ("$GH_FEINT" = "ON")) then put #var GH_FEINT OFF
          if ("%DSET" = "ON") then goto SET_DEFAULT
          goto COUNT_$GH_DANCING

     1_HANDED_WEAPON:
          var LAST 1_HANDED_WEAPON
          save %c
          if ("%DSET" = "ON") then goto SET_DEFAULT
          if (("%HAND" = "left") && ("$lefthand" = "Empty")) then gosub SWAP_LEFT $righthandnoun
          else if_2 then gosub EQUIP_SHIELD %2
          goto COUNT_$GH_DANCING

     LX_SLING:
          var LAST LX_SLING
          save %c
          if ("$GH_FEINT" = "ON") then put #var GH_FEINT OFF
          if ("%DSET" = "ON") then goto SET_DEFAULT
          if_2 then gosub EQUIP_SHIELD %2
          goto COUNT_$GH_DANCING

     BRAWL_SETUP:
          var LAST BRAWL_SETUP
          save %c
          if ("%DSET" = "ON") then goto SET_DEFAULT
          if_1 then gosub EQUIP_SHIELD %1
          goto COUNT_$GH_DANCING

#######################
##                   ##
##   Useful gosubs   ##
##                   ##
#######################
SWAP_LEFT:
     var ITEM $1
SWAPPING_LEFT:
          matchre SWAPPING_LEFT %ITEM(.*)to your right hand
          matchre RETURN %ITEM(.*)to your left hand|You have nothing
     put swap
     matchwait 15
     goto SWAP_ERROR

SWAP_RIGHT:
     var ITEM $1
SWAPPING_RIGHT:
          matchre SWAPPING_RIGHT %ITEM(.*)to your left hand
          matchre RETURN %ITEM(.*)to your right hand|You have nothing
     put swap
     matchwait 15
     goto SWAP_ERROR

EQUIP_SHIELD:
     if ("%SHIELD" = "NONE") then var SHIELD $1
     pause 0.5
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** EQUIP_SHIELD: ***
          echo
     }
     GETTING_SHIELD:
               match WEAPON_APPR_ERROR What were you
               matchre RETURN already|You get|You sling|You remove|But that is|You slide|You loosen
          put remove my %SHIELD
          put get my %SHIELD
          matchwait 15
     EQUIP_SHIELD_FAIL:
     put #echo >Log Yellow EQUIP_SHIELD_FAIL
          echo
          echo *** Something happened while getting shield ***
          echo ***           Aborting script               ***
          echo
          gosub clear
          put #beep
          goto ERROR_DONE

UNEQUIP_SHIELD:
     if ("%SHIELD" = "NONE") then var SHIELD $1
     pause 0.5
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** UNEQUIP_SHIELD ***
          echo
     }
     STOWING_SHIELD:
          matchre RETURN ^You put your|^You sling|^You are already wearing that|^But that is already|You slide your
          put wear my %SHIELD
          put stow my %SHIELD
          matchwait 15
     UNEQUIP_SHIELD_FAIL:
          echo
          echo *** Something happened while stowing shield ***
          echo ***           Aborting script               ***
          echo
          gosub clear
          put #beep
          goto ERROR_DONE

WIELD_WEAPON:
     var STRING $1
     pause 0.5
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** WIELD_WEAPON: ***
          echo
     }
     WIELDING_WEAPON:
               matchre REMOVING_WEAPON out of reach|You'll need to remove|^What were you referring to\?|can't seem|is out of reach|You can only wield
               matchre RETURN You draw|already holding|You deftly remove|With a flick of your wrist|With fluid and stealthy movements|You slip|You get
          put wield my %STRING
          matchwait 12
     REMOVING_WEAPON:
               matchre WIELD_FAIL free hand|hands are full
               matchre GETTING_WEAPON Remove what\?|You aren't wearing|^What were you referring to\?
               matchre RETURN You sling|You slide|already holding|inventory|You remove|You deftly remove|You yank your|With a quick flick of the wrist|With fluid and stealthy movements|You slip
          put remove my %STRING
          matchwait 12
     GETTING_WEAPON:
          pause 0.5
               matchre WIELD_FAIL What were you referring to\?|^Please rephrase that command
               matchre RETURN You get|You are already holding|You draw|already holding|You deftly remove|With a flick of your wrist|With fluid and stealthy movements|You slip
          put get my %STRING
          matchwait 12
     WIELD_FAIL:
          echo
          echo ***    CANT FIND WEAPON!!!    ***
          echo ***     Aborting script       ***
          echo
          gosub clear
          put #beep
          goto ERROR_DONE

SHEATHE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SHEATHE ***
          echo
     }
     if ("$0" = "blades") then var COMM_STRING blade
     else var COMM_STRING $0
     if matchre("$righthandnoun|$lefthandnoun", "dagger") then send put dagg in my wrist sheath
     if matchre("$righthand|$lefthand", "adderwood cane") then send put cane in my %SHEATH
     pause 0.5
     SHEATHING:
               matchre WEAR_WEAPON where\?
               matchre RETURN ^Sheathe what\?|^Sheathing an?|^With a flick of your wrist|^With fluid and stealthy movements|^You easily strap|^You hang|^You secure|^You sheath|^You slip|^You strap|you sheath
          put sheathe my %COMM_STRING
          matchwait 10
     WEAR_WEAPON:
               match STOW_WEAPON You can't wear that
               matchre RETURN You sling|^Wear what\?|You spin|STOW HELP|^You attach|^You easily|You slide your left
          put wear %COMM_STRING
          matchwait 20
     STOW_WEAPON:
               matchre STOW_WEAPON2 There isn't any more|no matter how you arrange|You just can't|too heavy
               matchre SHEATHE_UNLOAD You should unload
               matchre RETURN ^You sheath|^You strap|^You put|^With a flick of your wrist|^You hang|^Sheathe what\?|^You easily strap|^With fluid and stealthy movements|^You slip|already in your|STOW HELP
          put stow %COMM_STRING
          matchwait 15
     STOW_WEAPON2:
               matchre STOW_WEAPON3 There isn't any more|no matter how you arrange|You just can't|too heavy
               matchre SHEATHE_UNLOAD You should unload
               matchre RETURN ^You sheath|^You strap|^You put|^With a flick of your wrist|^You hang|^Sheathe what\?|^You easily strap|^With fluid and stealthy movements|^You slip|already in your|STOW HELP
          put stow %COMM_STRING in my %BOX_CONTAINER
          matchwait 15
     STOW_WEAPON3:
               matchre STOW_WEAPON4 There isn't any more|no matter how you arrange|You just can't|too heavy
               matchre SHEATHE_UNLOAD You should unload
               matchre RETURN ^You sheath|^You strap|^You put|^With a flick of your wrist|^You hang|^Sheathe what\?|^You easily strap|^With fluid and stealthy movements|^You slip|already in your|STOW HELP
          put stow %COMM_STRING in my %DEFAULT_CONTAINER
          matchwait 15
     STOW_WEAPON4:
               matchre SHEATHE_FAIL There isn't any more|no matter how you arrange|You just can't|too heavy
               matchre SHEATHE_UNLOAD You should unload
               matchre RETURN ^You sheath|^You strap|^You put|^With a flick of your wrist|^You hang|^Sheathe what\?|^You easily strap|^With fluid and stealthy movements|^You slip|already in your|STOW HELP
          put stow %COMM_STRING in my %GEM_CONTAINER
          matchwait 15
     SHEATHE_FAIL:
          echo
          echo *** Something happened during sheathing ***
          echo ***           Aborting script           ***
          echo
          gosub clear
          put #beep
          goto ERROR_DONE
     SHEATHE_UNLOAD:
     pause 0.5
     put unload %CURR_WEAPON
     pause 1
     pause 0.5
     put stow %CURR_WEAPON
     pause 0.5
     STOW_AMMOZ:
               matchre STOW_AMMOZ You pick up|You put
               match SHEATHING Stow what?
          if "%AMMO" = "basilisk head arrow" then put stow basilisk arrow
          else
          put stow %AMMO
          matchwait 10
     goto SHEATHING

RANGE_SHEATHE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** RANGE_SHEATHE: ***
          echo
     }
     pause 1
     put retreat
     waitfor You
     pause 1
     put unload %CURR_WEAPON
     pause 1
     STOW_AMMO:
               matchre STOW_AMMO You pick up|You put
               matchre GO_ON ^Stow what\?|^But your
               matchre STOW_AMMO_2 ^That's too heavy
          if "%AMMO" = "basilisk head arrow" then put stow basilisk arrow
    if "%AMMO" = "ice adder arrow" then put stow ice adder arrow
    if "%AMMO" = "cane arrow" then put stow cane arrow
    pause 0.3
    pause 0.2
          if matchre("$roomobjs","(cane arrows|cane arrow|ice adder arrow|basilisk head arrow|stone-tipped arrows|stone-tipped arrow)") then
          {
          send stow $1
          matchwait 20
          }
          put stow %AMMO
          matchwait 15
     STOW_AMMO2:
               matchre STOW_AMMO You pick up|You put
               matchre GO_ON ^Stow what\?|^But your
          if "%AMMO" = "basilisk head arrow" then put stow basilisk arrow
          else
          put stow %AMMO
          matchwait 15
     GO_ON:
          pause 1
          gosub SHEATHE %CURR_WEAPON
     return

############################################
##                                        ##
##  Default section, setting and loading  ##
##                                        ##
############################################
SET_DEFAULT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SET_DEFAULT ***
          echo Setting default values
          echo
     }
     put #var GH_DEF_SET YES
     put #var GH_DEF_COUNTER %c
     put #var GH_DEF_ALTEXP %ALTEXP
     put #var GH_DEF_AMMO %AMMO
     put #var GH_DEF_BACKSTAB %BACKSTAB
     put #var GH_DEF_COMBO1 %_COMBO1
     put #var GH_DEF_COMBO2 %_COMBO2
     put #var GH_DEF_COMBO3 %_COMBO3
     put #var GH_DEF_COMBO4 %_COMBO4
     put #var GH_DEF_COMBO5 %_COMBO5
     put #var GH_DEF_COMBO6 %_COMBO6
     put #var GH_DEF_COMBO7 %_COMBO7
     put #var GH_DEF_COMBO8 %_COMBO8
     put #var GH_DEF_CURR_STANCE %CURR_STANCE
     put #var GH_DEF_WEAPON %CURR_WEAPON
     put #var GH_DEF_EMPTY_HANDED %EMPTY_HANDED
     put #var GH_DEF_EVAS_LVL %EVAS_LEVEL
     put #var GH_DEF_EXP2 %EXP2
     put #var GH_DEF_FIRE_TYPE %FIRE_TYPE
     if ("%HAND" = "") then put #var GH_DEF_HAND none
     else put #var GH_DEF_HAND %HAND
     put #var GH_DEF_HAND2 %HAND2
     put #var GH_DEF_MAX_TRAIN_TIME %MAX_TRAIN_TIME
     put #var GH_DEF_NOEVADE %NOEVADE
     put #var GH_DEF_NOPARRY %NOPARRY
     put #var GH_DEF_NOSHIELD %NOSHIELD
     put #var GH_DEF_PARRY_LVL %PARRY_LEVEL
     put #var GH_DEF_RANGED %RANGED
     put #var GH_DEF_RUCK %RUCK
     put #var GH_DEF_SHIELD %SHIELD
     put #var GH_DEF_SHIELD_LVL %SHIELD_LEVEL
     put #var GH_DEF_STACK %STACK
     put #var GH_DEF_THROWN %THROWN
     put #var GH_DEF_WEAPON_EXP %WEAPON_EXP
     put #var GH_DEF_XCOUNT %xCOUNT
     put #var GH_DEF_YOYO %YOYO

     put #var GH_DEF_AMBUSH $GH_AMBUSH
     put #var GH_DEF_APPR $GH_APPR
     put #var GH_DEF_ARRANGE $GH_ARRANGE
     put #var GH_DEF_BUN $GH_BUN
     put #var GH_DEF_COUNTING $GH_DANCING
     put #var GH_DEF_EXP $GH_EXP
     put #var GH_DEF_HARN $GH_HARN
     put #var GH_DEF_HUNT $GH_HUNT
     put #var GH_DEF_JUGGLE $GH_JUGGLE
     put #var GH_DEF_LOOT $GH_LOOT
     put #var GH_DEF_LOOT_BOX $GH_LOOT_BOX
     put #var GH_DEF_LOOT_COIN $GH_LOOT_COIN
     put #var GH_DEF_LOOT_COLL $GH_LOOT_COLL
     put #var GH_DEF_LOOT_GEM $GH_LOOT_GEM
     put #var GH_DEF_LOOT_JUNK $GH_LOOT_JUNK
     put #var GH_DEF_PP $GH_PP
     put #var GH_DEF_RETREAT $GH_RETREAT
     put #var GH_DEF_ROAM $GH_ROAM
     put #var GH_DEF_SCRAPE $GH_SCRAPE
     put #var GH_DEF_SKIN $GH_SKIN
     put #var GH_DEF_SKIN_RET $GH_SKIN_RET
     put #var GH_DEF_SLOW $GH_SLOW
     put #var GH_DEF_SNAP $GH_SNAP
     put #var GH_DEF_SPELL $GH_SPELL
     put #var GH_DEF_STANCE $GH_STANCE
     if ("$GH_TARGET" = "") then put #var GH_DEF_TARGET none
     else put #var GH_DEF_TARGET $GH_TARGET
     put #var GH_DEF_TIMER $GH_TIMER
     put #var GH_DEF_TRAIN $GH_TRAIN

     echo
     echo Default setting are now ready
     echo
     exit

LOAD_DEFAULT_SETTINGS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** LOAD_DEFAULT_SETTINGS ***
          echo
     }
     gosub GENERAL_TRIGGERS
     ## Loading default nonweapon settings
     var ALTEXP $GH_DEF_ALTEXP
     var BACKSTAB $GH_DEF_BACKSTAB
     var CURR_STANCE $GH_DEF_CURR_STANCE
     var EMPTY_HANDED $GH_DEF_EMPTY_HANDED
     var EVAS_LEVEL $GH_DEF_EVAS_LVL
     var EXP2 $GH_DEF_EXP2
     var FIRE_TYPE $GH_DEF_FIRE_TYPE
     if ("$GH_DEF_HAND" = "none") then var HAND
     else var HAND $GH_DEF_HAND
     var HAND2 $GH_DEF_HAND2
     var PARRY_LEVEL $GH_DEF_PARRY_LVL
     var RANGED $GH_DEF_RANGED
     var RUCK $GH_DEF_RUCK
     var SHIELD_LEVEL $GH_DEF_SHIELD_LVL
     var STACK $GH_DEF_STACK
     var THROWN $GH_DEF_THROWN
     var xCOUNT $GH_DEF_XCOUNT
     var YOYO $GH_DEF_YOYO

     put #var GH_AMBUSH $GH_DEF_AMBUSH
     put #var GH_APPR $GH_DEF_APPR
     put #var GH_ARRANGE $GH_DEF_ARRANGE
     put #var GH_BUN $GH_DEF_BUN
     put #var GH_DANCING $GH_DEF_COUNTING
     if ("$GH_MULTI" = "OFF") then put #var GH_EXP $GH_DEF_EXP
     put #var GH_HUNT $GH_DEF_HUNT
     put #var GH_JUGGLE $GH_DEF_JUGGLE
     put #var GH_LOOT $GH_DEF_LOOT
     put #var GH_LOOT_BOX $GH_DEF_LOOT_BOX
     put #var GH_LOOT_COIN $GH_DEF_LOOT_COIN
     put #var GH_LOOT_COLL $GH_DEF_LOOT_COLL
     put #var GH_LOOT_GEM $GH_DEF_LOOT_GEM
     put #var GH_LOOT_JUNK $GH_DEF_LOOT_JUNK
     put #var GH_RETREAT $GH_DEF_RETREAT
     put #var GH_ROAM $GH_DEF_ROAM
     put #var GH_SCRAPE $GH_DEF_SCRAPE
     put #var GH_SKIN $GH_DEF_SKIN
     put #var GH_SKIN_RET $GH_DEF_SKIN_RET
     put #var GH_SLOW $GH_DEF_SLOW
     put #var GH_SNAP $GH_DEF_SNAP
     put #var GH_STANCE $GH_DEF_STANCE
     if ("$GH_DEF_TARGET" = "none") then put #var GH_TARGET
     else put #var GH_TARGET  $GH_DEF_TARGET
     put #var GH_TIMER $GH_DEF_TIMER
     if ("$GH_MULTI" = "OFF") then put #var GH_TRAIN $GH_DEF_TRAIN

     var MAX_TRAIN_TIME $GH_DEF_MAX_TRAIN_TIME
     DEF_STANCE_SETUP:
          if ("%CURR_STANCE" = "Evasion") then put stance evasion
          elseif ("%CURR_STANCE" = "Parry_Ability") then put stance parry
          elseif ("%CURR_STANCE" = "Shield_Usage") then put stance shield
          elseif ("%CURR_STANCE" = "Custom") then put stance custom

     if ("$GH_MULTI" != "OFF") then goto BEGIN

     ## Loading default weapon settings
     var AMMO $GH_DEF_AMMO
     var _COMBO1 $GH_DEF_COMBO1
     var _COMBO2 $GH_DEF_COMBO2
     var _COMBO3 $GH_DEF_COMBO3
     var _COMBO4 $GH_DEF_COMBO4
     var _COMBO5 $GH_DEF_COMBO5
     var _COMBO6 $GH_DEF_COMBO6
     var _COMBO7 $GH_DEF_COMBO7
     var _COMBO8 $GH_DEF_COMBO8
     counter set $GH_DEF_COUNTER
     var RANGED $GH_DEF_RANGED
     var SHIELD $GH_DEF_SHIELD
     var CURR_WEAPON $GH_DEF_WEAPON
     var WEAPON_EXP $GH_DEF_WEAPON_EXP
     echo
     echo Ready to go!
     echo
     var LAST DEF_WIELD_WEAPON
     DEF_WIELD_WEAPON:
               matchre SWAP_CHECK You draw|already holding|free to|With a flick of your wrist
               match BEGIN_HANDS free hand
               matchre DEF_REMOVE_WEAPON out of reach|remove|What were you|can't seem|Wield what\?
          put wield my %CURR_WEAPON
          matchwait 16
     DEF_REMOVE_WEAPON:
               matchre SWAP_CHECK You sling|already holding|inventory|You remove|You slide
               matchre BEGIN_HANDS free hand|hands are full
               match DEF_GET_WEAPON Remove what\?
          put remove my %CURR_WEAPON
          matchwait 15
     DEF_GET_WEAPON:
               match SWAP_CHECK you get
               matchre NO_VALUE Please rephrase that command|^What were you referring to\?
          put get my %CURR_WEAPON
          matchwait 15
     goto VARIABLE_ERROR
     SWAP_CHECK:
          var LAST SWAP_CHECK
          if (("%HAND" = "left") && ("$lefthand" = "Empty")) then gosub SWAP_LEFT $righthandnound
          elseif ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then gosub EQUIP_SHIELD %SHIELD
     goto %c

#####################################
##                                 ##
##  Action initialization section  ##
##                                 ##
#####################################
GENERAL_TRIGGERS:
     action send STAND when eval $standing = 0
     action goto %LAST when move freely again|free yourself from the webbing
     action goto SWITCH_WEAPON when SWITCH WEAPONS PLZ|SWITCH WEAPON
     action goto DROPPED_WEAPON when Your fingers go numb as you drop|You don't have a weapon|With your bare hands\?
     action goto HUM_STOP when You are a bit too busy performing|You should stop playing|You are concentrating too much upon your performance
     action goto DONE when reaches over and holds your hand|grabs your arm and drags you|clasps your hand tenderly

  action goto MOVE_ROOMS when You hear someone cough
  action goto MOVE_ROOMS when There is no need for violence here
  action if $hidden = 1 then put cough when ^.+ just arrived\.
  action (hunter) put #queue clear; send 1 $lastcommand when ^You are still stunned
  action (hunter) put #queue clear; send 1 $lastcommand when ^\.\.\.wait|^Sorry, you may only type|^You don't seem to be able to move
  action (stalk) put #send #script pause hunter;put #send 1 #goto %starter.room;put;put #send 2 #script resume;put #send 3 stop stalk;put #echo >Log Returned to starting room when eval $roomid != %starter.room
  action (stalk) off
  action (point) send point $1 when (%critters) attempting to stealthily advance upon you
  action (point) off
  action put #beep when ^(.+) (say|says|asks|exlaims|whispers)
  action put #play Speech when ^\w+ asks, \"|exclaims, \"|hisses, \"|lectures, \"|says, \"|^You hear .+ say|^You hear the voice of
  #action goto LOOT_ON when I'm a-pickin' stuff up|I'll be coming back to clean this messy area up in just a minute|Ye have till I count ten t'get it|I seen the janitor|A grumbling janitor wanders into the area|I am returning to this spot and picking up

     action goto WEBBED when eval $webbed = 1
     action goto WEBBED when You can't do that while entangled in a web
     action goto STUNNED when eval $stunned = 1
     action goto DEAD when eval $dead = 1
     action goto ABORT when eval $health < 70
     action var BLEEDING ON when eval $bleeding = 1
     action var HURT ON when eval $health < 80
     action var HURT OFF when eval $health >= 80

     action var concentration $1 when ^Concentration: (\d+)  Max: (\d+)
     action var melee YES when closes to melee range on you|You close to melee range
     action var melee NO when You begin to advance|You aren't close enough|You are already advancing|You close to pole|You are already as far|You retreat from combat

     action var dist melee when .*closes to melee range on you.
     action var dist pole when .*closes to pole weapon range on you.
     action var dist pole when ^You retreat back to pole range
     action var dist missle when ^You retreat from combat
     action var dist missle when ^You are already as far away as you can get
     action var dist missle when ^You begin to advance
     action var dist missle when retreats from you
     action var dist melee when charges
     action var dist melee when ^You close to melee range
     action var dist pole when ^You sneak back out to pole range
     action var dist missle when ^You sneak back out of combat

     action var lastmaneuver parry when Last Combat Maneuver.*Parry
     action var lastmaneuver feint when Last Combat Maneuver.*Feint
     action var lastmaneuver draw when Last Combat Maneuver.*Draw
     action var lastmaneuver sweep when Last Combat Maneuver.*Sweep
     action var lastmaneuver slice when Last Combat Maneuver.*Slice
     action var lastmaneuver chop when Last Combat Maneuver.*Chop
     action var lastmaneuver bash when Last Combat Maneuver.*Bash
     action var lastmaneuver thrust when Last Combat Maneuver.*Thrust
     action var lastmaneuver shove when Last Combat Maneuver.*Shove
     action var lastmaneuver jab when Last Combat Maneuver.*Jab
     action var lastmaneuver dodge when Last Combat Maneuver.*Dodge
     action var lastmaneuver claw when Last Combat Maneuver.*Claw
     action var lastmaneuver dodge when Last Combat Maneuver.*Dodge
     action var lastmaneuver kick when Last Combat Maneuver.*Kick
     action var lastmaneuver weave when Last Combat Maneuver.*Weave
     action var lastmaneuver punch when Last Combat Maneuver.*Punch
     action var lastmaneuver lunge when Last Combat Maneuver.*Lunge
     action var lastmaneuver bob when Last Combat Maneuver.*Bob
     action var lastmaneuver circle when Last Combat Maneuver.*Circle

     action var moveone $1 when by landing an? (\S+)\.
     action var moveone $1;var movetwo $2 when by landing an? (\S+) and an? (\S+)\.
     action var moveone $1;var movetwo $2;var movethree $3 when by landing an? (\S+)\, an? (\S+) and an? (\S+)\.
     action var moveone $1;var movetwo $2;var movethree $3;var movefour $4 when by landing an? (\S+)\, an? (\S+)\, an? (\S+) and an? (\S+)\.
     action var moveone $1;var movetwo $2;var movethree $3;var movefour $4;var movefive $5 when by landing an? (\S+)\, an? (\S+)\, an? (\S+)\, an? (\S+) and an? (\S+)\.

     action var G_AppTarget when You assess your combat situation...
     action var G_AppTarget %ordinals($2) $1 when ^You \(.*\) are (?:advancing on|facing|behind|flanking|moving to flank) a.* (\S+) \((\d)+\) at
     return

RETREAT_TRIGGERS:
     var RETREATING ON
     var RETREATED NO
     action (retreat) if ("%RETREATED" = "YES") then put #queue clear;send retreat;var RETREATED YES when closes to pole weapon range
MELEE_TRIGGERS:
     action (retreat) if ("%RETREATED" = "YES") then put #queue clear;send retreat;send retreat;var RETREATED YES when (^\*.*at you\..*You)|(closes to melee range on you)
     action var RETREATED NO when You retreat from combat
     action var RETREATED NO when You try to back away
     action (retreat) on
     return

RETREAT_UNTRIGGERS:
     var RETREATING OFF
     action remove closes to pole weapon range
     action remove (^\*.*at you\..*You)|(closes to melee range on you)
     action remove You retreat from combat
     action remove You try to back away
     return

#####################################
##                                 ##
##  End of Initialization section  ##
##                                 ##
#####################################
ADVANCE:
if !$standing then gosub standup
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** ADVANCE: ***
          echo
     }
     counter set %s
     ADV_NOW:
     GOSUB get_monster_name
          var LAST ADV_NOW
               match DEAD_MONSTER already quite dead
               matchre FACE ^You stop advancing|You have lost sight
               match NO_MONSTERS advance towards?
               matchre ADVANCING ^You begin|^You slip|^Roundtime
               matchre ADVANCING_FURTHER ^You are already advancing
               match %c already at melee
          put advance
          matchwait 15
          goto ERROR
     ADVANCING:
          if ("$GH_APPR" = "YES") then goto APPR_YES
     ADVANCING_FURTHER:
          waitforre to melee range|\[You're|You stop advancing because|You have lost sight of your target|retreats from you
          goto APPR_NO
     ADVANCING_CHECK:
          if (toupper("$GH_TACTICS") = "ON") && ("%NEXT.MOB" = "YES") then put face first %monster1
          var NEXT.MOB NO
          goto %c

APPR_YES:
     if (("%APPRAISED" = "YES") || ($Appraisal.LearningRate >= 30)) then goto COUNT_$GH_DANCING
     else var APPRAISED YES
     var LAST APPR_YES
     gosub get_monster_name
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** APPR_YES: ***
          echo
     }
     if $monstercount < 1 then goto SEARCH_MONSTER
     if matchre ("$roomobjs","is trying to remain hidden") then goto SEARCH_MONSTER
     if matchre ("$monsterlist", "\b(%nonskinnablecritters)\b") then goto APPR_CREEP
     if matchre ("$monsterlist", "\b(%skinnablecritters)\b") then goto APPR_CREEP
     if matchre ("$monsterlist", "\b(%invasioncritters)\b") then goto APPR_CREEP
     goto APPR_NO
     APPR_CREEP:
          var Monster %monster1
     APPRAISING:
          var LAST APPRAISING
          if ("%dist" != "melee") then put adv
          pause 0.2
          matchre APPR_NO Roundtime|Appraise|You can't determine|appraise|You don't|still stunned|Mark what\?|You trace an X|What|I could
          if ($GH_MARK = ON) then send mark all %Monster
    else put appr %Monster quick
          matchwait 15
     goto APPR_ERROR

APPR_NO:
     var lastdirection none
     goto COUNT_$GH_DANCING

COUNT_ON:
     var LAST COUNT_ON
COUNT_START:
     if (toupper("$GH_STANCE") = "ON")) then gosub SWITCH_STANCE
     if (($Light_Armor.LearningRate > 33) || ($Chain_Armor.LearningRate > 33)) then goto COUNT_OFF
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_START: ***
          echo
     }
     goto %xCOUNT
          match COUNT_WAIT_1 You notice only one
     COUNT_ONE:
          matchre %c ^You notice two
     COUNT_TWO:
          matchre %c ^You notice three
     COUNT_THREE:
          matchre %c ^You notice four
     COUNT_FOUR:
          matchre %c ^You notice five
     COUNT_FIVE:
          matchre %c ^You notice six
     COUNT_SIX:
          matchre %c ^You notice (seven|eight|nine|ten|eleven|twelve|twenty)
          matchre %c ^You notice (.+)teen
          matchre COUNT_WAIT_1 ^You notice no
          matchre COUNT_WAIT_1 ^Roundtime
     put count critter
     matchwait 15
     goto ERROR

COUNT_OFF:
     goto %c

FACE:
if !$standing then gosub standup
     gosub clear
     if "$guild" != "Empath" && matchre("%MAGIC_TYPE","TM|PM") then gosub COMBAT_COMMAND MAGIC_WAIT
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** FACE: ***
          echo
     }
     GOSUB get_monster_name
     var LAST FACE
          matchre CHECK_FOR_MONSTER nothing else to|Face what|the point|^What
          matchre APPR_$GH_APPR You turn to face|You are already|stops you from advancing|closes to melee|You begin to advance|You close to melee|You slip
     put face next
     pause 0.2
     put advance
     matchwait 15
     goto ERROR

CHECK_FOR_MONSTER:
     var LAST CHECK_FOR_MONSTER
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** CHECK_FOR_MONSTER ***
          echo
     }
     if (($hidden = 1) && ("%guild" = "Paladin")) then put unhide
     counter set %s
     if $monstercount < 1 then goto SEARCH_MONSTER
     if matchre ("$roomobjs","is trying to remain hidden") then goto SEARCH_MONSTER
     if matchre ("$monsterlist", "\b(%nonskinnablecritters)\b") then goto APPR_$GH_APPR
     if matchre ("$monsterlist", "\b(%skinnablecritters)\b") then goto APPR_$GH_APPR
     if matchre ("$monsterlist", "\b(%invasioncritters)\b") then goto APPR_$GH_APPR
     goto SEARCH_MONSTER

SEARCH_MONSTER:
     matchre POINT_MONSTER ^You notice a|attempting to remain hidden
     matchre NO_MONSTERS ^You don't find
     put search
     matchwait 15
     goto NO_MONSTERS

POINT_MONSTER:
gosub get_monster_name
put point
pause 0.5
pause 0.1
goto APPR_$GH_APPR

NO_MONSTERS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** NO_MONSTERS: ***
          echo
     }
  if (matchre("$roomobjs", "%AMMO\b")) then gosub RANGED_CLEAN
     if ("%THROWN" = "ON") then
     {
          if (matchre("$roomobjs", "%CURR_WEAPON\b")) then
          {
               put get %CURR_WEAPON
          }
     }
     if "%SEARCHED" = "NO" &&  matchre ("$roomplayers", "Also here: (\S+)") && matchre ("$roomobjs", "((which|that) appears dead|\(dead\))") then goto DEAD_MONSTER
     if ((toupper("$GH_JUGGLE") = "ON") && ($Perception.LearningRate < 34)) then goto JUGGLE_STUFF
     if (toupper("$GH_ROAM") = "ON") then goto MOVE_ROOMS
     else
     {
          if ($hidden = 1) then put unhide
          pause 0.3
          waitforre \.|\?|!|pole|melee|advance
          goto FACE
     }

JUGGLE_STUFF:
     timer stop
     var LAST JUGGLE_STUFF
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then gosub UNEQUIP_SHIELD %SHIELD
     if ("%EMPTY_HANDED" != "ON") then
     {
          if ("%RANGED" = "ON") then gosub RANGE_SHEATHE
          else gosub SHEATHE %CURR_WEAPON
     }
     if ("%YOYO" = "OFF") then
     {
          action put hum %HUM_SONG %HUM_DIFFICULTY when ^You finish
     }
     action goto JUGGLE_STOP when ^\*.*at you\..*You|begins to advance on you|to melee range|to polee range|You're|already at melee
     JUGGLE_TOP:
          var LAST JUGGLE_TOP
          if ("%YOYO" = "OFF") then put hum $HUM_SONG $HUM_DIFFICULTY
          if ("%JUGGLIE" = "pebble") then goto juggle
               match NO_JUGGLIE What were you referring to
               matchre YOYO_%YOYO You get|You are already
          put get my %JUGGLIE
          matchwait 20
          goto JUGGLE_ERROR
     YOYO_ON:
               match JUGGLING You slip the string
          put wear my %JUGGLIE
          matchwait 20
          goto JUGGLE_ERROR
     YOYO_OFF:
     JUGGLING:
          if matchre ("$monsterlist", "%critters") then goto JUGGLE_STOP
          var LAST JUGGLING
               matchre JUGGLE_ERROR Your injuries make juggling|But you're not holding|You realize that if your throw|Your wounds begin aching
               match JUGGLE_EXP Roundtime
          if ("%YOYO" = "ON") then put throw my %JUGGLIE
          else put juggle my $jugglie
          matchwait 10
          goto JUGGLE_ERROR
     JUGGLE_EXP:
          if $Perception.LearningRate > 29 then goto JUGGLE_STOP
          goto JUGGLING
     JUGGLE_ERROR:
          echo *** Juggling error ***
          put #var GH_JUGGLE OFF
          goto JUGGLE_STOP
     NO_JUGGLIE:
          echo *** Can't find your JUGGLIE ***
     JUGGLE_STOP:
          action remove ^You finish
          action remove ^\*.*at you\..*You|begins to advance on you|to melee range|to polee range|You're|already at melee
          var LAST JUGGLE_STOP
          pause
          if ("%YOYO" = "ON") then
          {
               put remove %JUGGLIE
               waitfor off of your finger
          }
          pause 0.5
          put stop play
          put stow %JUGGLIE
          waitfor You put your
          if "$righthand" != "Empty" then put stow right
          if "$lefthand" != "Empty" then put stow left
     JUGGLE_DONE:
          var LAST JUGGLE_DONE
          if ("%EMPTY_HANDED" != "ON") then gosub WIELD_WEAPON %CURR_WEAPON
          if (("%HAND" = "left") && ("$righthand" != "Empty")) then gosub SWAP_LEFT $righthandnoun
          if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then gosub EQUIP_SHIELD %SHIELD
          timer start
          goto FACE

MOVE_ROOMS:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** MOVE_ROOMS: ***
          echo
     }
     echo No monsters here, moving rooms
     pause 1

     var ROOMNUMBER 0
HUNTING_FOR_ROOM:
     var LAST HUNTING_FOR_ROOM
     action math ROOMNUMBER add 1 when ^To the .+:

     var ROOM1OCCUPIED FALSE
     var ROOM2OCCUPIED FALSE
     var ROOM3OCCUPIED FALSE
     var ROOM4OCCUPIED FALSE
     var ROOM5OCCUPIED FALSE
     var ROOM6OCCUPIED FALSE
     var ROOM7OCCUPIED FALSE
     var ROOM8OCCUPIED FALSE
     action var ROOM%ROOMNUMBEROCCUPIED TRUE when ^  \d+\)   \w+$|^  \d+\)   A hidden \w+$
     action var ROOM%ROOMNUMBEROCCUPIED TRUE when ^  --\)   Signs of something hidden from sight\.

     var ROOM1MOBS 0
     var ROOM2MOBS 0
     var ROOM3MOBS 0
     var ROOM4MOBS 0
     var ROOM5MOBS 0
     var ROOM6MOBS 0
     var ROOM7MOBS 0
     var ROOM8MOBS 0

     action math ROOM%ROOMNUMBERMOBS add 1 when ^  \d+\)   (a|an)
     action var ROOM%ROOMNUMBERTARGET $1 when ^  (\d+)\)

     put stop stalk
     waitfor stalking
     put hunt
     waitforre ^Roundtime:|You find yourself unable to
     pause 0.1
     action remove ^To the .+:
     action remove ^  \d+\)   \w+$|^  \d+\)   A hidden \w+$
     action remove ^  --\)   Signs of something hidden from sight\.
     action remove ^  \d+\)   (a|an)
     action remove ^  (\d+)\)

     if "%ROOM1OCCUPIED" = "TRUE" then var ROOM1MOBS 0
     if "%ROOM2OCCUPIED" = "TRUE" then var ROOM2MOBS 0
     if "%ROOM3OCCUPIED" = "TRUE" then var ROOM3MOBS 0
     if "%ROOM4OCCUPIED" = "TRUE" then var ROOM4MOBS 0
     if "%ROOM5OCCUPIED" = "TRUE" then var ROOM5MOBS 0
     if "%ROOM6OCCUPIED" = "TRUE" then var ROOM6MOBS 0
     if "%ROOM7OCCUPIED" = "TRUE" then var ROOM7MOBS 0
     if "%ROOM8OCCUPIED" = "TRUE" then var ROOM8MOBS 0

     var BESTMOBCOUNT 0
     var HUNTNUMBER 0
     if %ROOM1MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM1MOBS
          var HUNTNUMBER %ROOM1TARGET
     }
     if %ROOM2MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM2MOBS
          var HUNTNUMBER %ROOM2TARGET
     }
     if %ROOM3MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM3MOBS
          var HUNTNUMBER %ROOM3TARGET
     }
     if %ROOM4MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM4MOBS
          var HUNTNUMBER %ROOM4TARGET
     }
     if %ROOM5MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM5MOBS
          var HUNTNUMBER %ROOM5TARGET
     }
     if %ROOM6MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM6MOBS
          var HUNTNUMBER %ROOM6TARGET
     }
     if %ROOM7MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM7MOBS
          var HUNTNUMBER %ROOM7TARGET
     }
     if %ROOM8MOBS > %BESTMOBCOUNT then
     {
          var BESTMOBCOUNT %ROOM8MOBS
          var HUNTNUMBER %ROOM8TARGET
     }
     pause 0.5

     if %HUNTNUMBER = 0 then goto RANDOM_MOVE

     if ((toupper("$GH_BUN") = "ON") && contains("$roomobjs", "lumpy bundle")) then
     {
               match HUNT_MOVE You pick up
          put get bundle
          matchwait 16
     }
     HUNT_MOVE:
  if !$standing then gosub standup
          var LAST HUNT_MOVE
               matchre RANDOM_MOVE You don't have that target currently available|Your prey seems to have completely vanished|You were unable to locate|You find yourself unable|You'll need to be in the area
               matchre MOVE_ROOMS Also here: (.*)
               matchre CHECK_OCCUPIED ^You'll need to disengage first|^While in combat?|^Obvious exits|^Obvious paths
          put hunt %HUNTNUMBER
          matchwait 15

     RANDOM_MOVE:
          var exits 0
          if $north = 1 then math exits add 1
          if $northeast = 1 then math exits add 1
          if $east = 1 then math exits add 1
          if $southeast = 1 then math exits add 1
          if $south = 1 then math exits add 1
          if $southwest = 1 then math exits add 1
          if $west = 1 then math exits add 1
          if $northwest = 1 then math exits add 1
          if $up = 1 then math exits add 1
          if $down = 1 then math exits add 1
          if (matchre("$roomexits", "obscured by a thick fog")) then
               {
                    put #var north 1
                    put #var south 1
                    math exits add 1
               }
          if (%exits = 0) then goto CHECK_OCCUPIED

          random 1 10
          var move_cycles 0
          goto MOVE_%r

     MOVE_1:
          if ($north = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "south")) then
               {
                    var direction north
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction north
                    goto GOOD_DIRECTION
               }
          }
     MOVE_2:
          if ($northeast = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "southwest")) then
               {
                    var direction northeast
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction northeast
                    goto GOOD_DIRECTION
               }
          }
     MOVE_3:
          if ($east = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "west")) then
               {
                    var direction east
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction east
                    goto GOOD_DIRECTION
               }
          }
     MOVE_4:
          if ($southeast = 1) then
          {
               if ((%exits > 1) and (("%lastdirection" != "northwest")) then
               {
                    var direction southeast
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction southeast
                    goto GOOD_DIRECTION
               }
          }
     MOVE_5:
          if ($south = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "north")) then
               {
                    var direction south
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction south
                    goto GOOD_DIRECTION
               }
          }
     MOVE_6:
          if ($southwest = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "northeast")) then
               {
                    var direction southwest
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction southwest
                    goto GOOD_DIRECTION
               }
          }
     MOVE_7:
          if ($west = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "east")) then
               {
                    var direction west
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction west
                    goto GOOD_DIRECTION
               }
          }
     MOVE_8:
          if ($northwest = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "southeast")) then
               {
                    var direction northwest
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction northwest
                    goto GOOD_DIRECTION
               }
          }
     MOVE_9:
          if ($up = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "down")) then
               {
                    var direction up
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction up
                    goto GOOD_DIRECTION
               }
          }
     MOVE_10:
          if ($down = 1) then
          {
               if ((%exits > 1) && ("%lastdirection" != "up")) then
               {
                    var direction down
                    goto GOOD_DIRECTION
               } elseif (%exits = 1) then
               {
                    var direction down
                    goto GOOD_DIRECTION
               }
          }
     if (%move_cycles <= 5) then
     {
          math move_cycles add 1
          goto MOVE_1
     } else goto ERROR
GOOD_DIRECTION:
     if ((toupper("$GH_BUN") = "ON")) && contains("$roomobjs", "lumpy bundle")) then
     {
               match MOVING You pick up
          put get bun
          matchwait 20
     }
     MOVING:
          pause 0.1
          var LAST MOVING
               matchre MOVE_ROOMS Also here: (.*)|^You can't go there
               matchre CHECK_OCCUPIED ^You are engaged|^Obvious exits|^Obvious paths|^While in combat
          put %direction
          matchwait 40
          goto CHECK_OCCUPIED
FOUND_ROOM:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** FOUND_ROOM: ***
          echo
     }
     if (toupper("$GH_PP") = "ON") then var PP_TIME %t
     if ((toupper("$GH_BUN") = "ON")) && (("$righthandnoun" = "bundle") || ("$lefthandnoun" = "bundle"))) then
     {
          put drop bundle
          waitfor ^You drop|^What were you referring to
     }
     var lastdirection %direction
     gosub stowammo
     goto FACE
CHECK_OCCUPIED:
     put search
     waitforre ^Roundtime:
     pause 1
     if ("$roomplayers" = "") then goto FOUND_ROOM
     else
     {
          put retreat
          put retreat
          goto %LAST
     }

######################################
###                                ###
### This section handles what to   ###
### do while waiting for more      ###
### creatures                      ###
###                                ###
######################################
COUNT_FACE:
     var LAST COUNT_FACE
          match COUNT_ASSESS_ADV nothing else to face
          match APPR_$GH_APPR You turn to
     put face next
     matchwait 40

COUNT_ASSESS_ADV:
     if (($hidden = 1) && ("%guild" = "Paladin")) then put unhid
          match COUNT_FACE You stop advancing|You have lost sight
          match NO_MONSTERS advance towards?
          matchre APPR_$GH_APPR ^You begin|to melee range|\[You're|already at melee/|^You slip
     put advance
     matchwait 40

COUNT_ADV:
     var LAST_COUNT_ADV
     if (($hidden = 1) && ("%guild" = "Paladin")) then put unhid
          matchre COUNT_FACE You stop advancing|You have lost sight
          match NO_MONSTER advance towards?
          matchre ADVANCING You begin|already advancing|You slip
          match %LAST already at melee
     put advance
     matchwait 40
     goto ERROR
COUNT_ADVANCING:
          waitforre to melee range|\[You're
          goto %LAST

COUNT_FATIGUE_PAUSE:
     pause
COUNT_FATIGUE:
     var LAST COUNT_FATIGUE
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_FATIGUE: ***
          echo
     }
          matchre PAUSE \[You're|You stop advancing|Roundtime
          match COUNT_FATIGUE_CHECK You cannot back away from a chance to continue your slaughter!
          matchre COUNT_FATIGUE_CHECK You retreat from combat.|You sneak back|already as far
     put retreat
     put retreat
     matchwait 40
     goto COUNT_FATIGUE

COUNT_FATIGUE_CHECK:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_FATIGUE_CHECK: ***
          echo
     }
     if ($stamina < 80) then
     {
          goto COUNT_FATIGUE_WAIT
     } else
     {
          goto COUNT_START
     }

COUNT_FATIGUE_WAIT:
     echo
     echo COUNT_FATIGUE_WAIT:
     echo
          matchre COUNT_FATIGUE melee|pole|\[You're
     matchwait

#######################################
###                                 ###
### This section is for waiting for ###
### new creatures to show up.       ###
### Brawls until more creatures.    ###
###                                 ###
#######################################
COUNT_WAIT_1:
     var LAST COUNT_WAIT_1
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     {
          echo
          echo *** COUNT_WAIT_1: parry ***
          echo
     }
          matchre COUNT_WAIT_2 You are already in a position|But you are already dodging|You move into a position to|Roundtime|pointlessly hack
          matchre COUNT_FATIGUE You're beat,|You're exhausted|You're bone-tired|worn-out
          matchre COUNT_ADV aren't close enough
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead
          matchre COUNT_FACE nothing else
     put parry
     matchwait 30
     goto ATTACK_ERROR

COUNT_WAIT_2:
     var LAST COUNT_WAIT_2
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_WAIT_2: shove ***
          echo
     }
          matchre COUNT_WAIT_3 You are already in a position|But you are already dodging|You move into a position to|Roundtime|pointlessly hack
          matchre COUNT_FATIGUE You're beat,|You're exhausted|You're bone-tired|worn-out
          matchre COUNT_ADV aren't close enough
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead
          matchre COUNT_FACE nothing else
     put shove
     matchwait 30
     goto ATTACK_ERROR

COUNT_WAIT_3:
     var LAST COUNT_WAIT_3
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_WAIT_3: circle ***
          echo
     }
          matchre COUNT_WAIT_4 You are already in a position|But you are already dodging|You move into a position to|Roundtime|pointlessly hack
          matchre COUNT_FATIGUE You're beat,|You're exhausted|You're bone-tired|worn-out
          matchre COUNT_ADV aren't close enough
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead
          matchre COUNT_FACE nothing else
     put circle
     matchwait 30
     goto ATTACK_ERROR

COUNT_WAIT_4:
     var LAST COUNT_WAIT_4
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_WAIT_4: weave ***
          echo
     }
          matchre COUNT_WAIT_5 You are already in a position|But you are already dodging|You move into a position to|Roundtime|pointlessly hack
          matchre COUNT_FATIGUE You're beat,|You're exhausted|You're bone-tired|worn-out
          matchre COUNT_ADV aren't close enough
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead
          matchre COUNT_FACE nothing else
     put weave
     matchwait 30
     goto ATTACK_ERROR

COUNT_WAIT_5:
     var LAST COUNT_WAIT_5
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** COUNT_WAIT_5: bob ***
          echo
     }
          matchre COUNT_START You are already in a position|But you are already dodging|You move into a position to|Roundtime|pointlessly hack
          matchre COUNT_FATIGUE You're beat,|You're exhausted|You're bone-tired|worn-out
          matchre COUNT_ADV aren't close enough
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead
          matchre COUNT_FACE nothing else
     put bob
     matchwait 20
     goto ATTACK_ERROR

######################################
###                                ###
###        KHRI SECTION!!!         ###
###                                ###
######################################

KHRI:
     if ($concentration < 20) then RETURN
     pause 0.001
     send khri check
     pause 0.001
KHRI.CHECK:
     pause 0.001
     if ("%RANGED" = "ON") && ("$steady" = "ON") then put khri stop strike
     if ("%RANGED" = "OFF") && ("$steady" = "ON") then put khri stop steady
     
     if ((toupper("$GH_AMBUSH") = "ON") && ("$calm" = "ON") || ("$GH_AMBUSH") = "ON") && ("$flight" = "ON")) then put khri stop calm flight
  #if ("%RANGED" = "ON") &&  ("%THROWN" = "OFF") && ("$strike" = "ON") then put khri stop strike
     pause 0.001
     if ("$avoidance" = "OFF") && ("%AVOIDANCE" = "ON") && ($concentration > 40)  then gosub khri.start "avoidance"
     if ("$elusion" = "OFF") && ("%ELUSION" = "ON") && ($concentration > 40) then gosub khri.start "elusion"
     if ("$sagacity" = "OFF") && ("%SAGACITY" = "ON") && ($concentration > 50) then gosub khri.start "sagacity"
     if ("$prowess" = "OFF") && ("%PROWESS" = "ON") && ($concentration > 50) then gosub khri.start "prowess"
     if ("%RANGED" = "OFF") && ("$strike" = "OFF") && ("%STRIKE" = "ON") && ($concentration > 40) then gosub khri.start "strike"
     if ("$flight" = "OFF") && ("%FLIGHT" = "ON") && ($concentration > 60) then gosub khri.start "flight"
     if ("$focus" = "OFF") && ("%FOCUS" = "ON") && ($concentration > 60) then gosub khri.start "focus"
     if ("%RANGED" = "OFF") && ("$hasten" = "OFF") && ("%HASTEN" = "ON") && ($concentration > 60) then gosub khri.start "hasten"
     if ("%RANGED" = "ON") && ("$steady" = "OFF") && ("%STEADY" = "ON") && ($concentration > 60) then gosub khri.start "steady"
     if ("%THROWN" = "ON") && ("$steady" = "OFF") && ("%STEADY" = "ON") && ($concentration > 60) then gosub khri.start "steady"
     if ((toupper("$GH_AMBUSH") = "ON") && ("$darken" = "OFF") && ("%DARKEN" = "ON") && ($concentration > 60)) then gosub khri.start "darken"
     if ((toupper("$GH_AMBUSH") = "ON") && ("$dampen" = "OFF") && ("%DAMPEN" = "ON") && ($concentration > 60)) then gosub khri.start "dampen"
     if ((toupper("$GH_AMBUSH") = "ON") && ("$shadowstep" = "OFF") && ("%SHADOWSTEP" = "ON") && ($concentration > 60)) then gosub khri.start "shadowstep"
     if ("$guile" = "OFF") && ("%GUILE" = "ON") && ($concentration > 70) then gosub khri.start "guile"
     if ("$serenity" = "OFF") && ("%SERENITY" = "ON") && ($concentration > 60) then gosub khri.start "serenity"
     if ("$eliminate" = "OFF") && ("%ELIMINATE" = "ON") && ($concentration > 70) then gosub khri.start "eliminate"
     if ("$liberation" = "OFF") && ("%LIBERATION" = "ON") && ($concentration > 70) then gosub khri.start "liberation"
     if ("$calm" = "OFF") && ("%CALM" = "ON") && ($concentration > 60) then gosub khri.start "calm"
     if $standing = 0 then put stand
     pause 0.01
     if $standing = 0 then put stand
     RETURN

KHRI.KNEEL:
     action remove $standing = 0
     pause 0.1
     action (standup) off
     send kneel
     pause 0.1
     pause 0.1
     send khri %khri
     pause
     pause 0.5
     pause 0.1
     send stand
     pause 0.1
     pause 0.1
     if $standing = 0 then put stand
     action goto STAND when eval $standing = 0
     RETURN
KHRI.START:
     var khri $1
     pause 0.1
     matchre KHRI.START ^\.\.\.wait|^You are still stunned
     matchre KHRI.KNEEL ^Your mind and body are willing
     matchre KHRI.DONE ^You have not recovered from your previous use of the \w+ meditation\.$
     matchre KHRI.DONE ^Focusing intently|^Roundtime|^Your mind is already focused
     matchre KHRI.DONE ^You are not trained in the
     matchre KHRI.DONE ^Nothing happens\.
     matchre KHRI.DONE ^You strain, but cannot focus your mind enough to manage that\.$
     matchre KHRI.DONE ^You're already using the \w+ meditation.
     matchre KHRI.DONE ^Knowing that a dose of paranoia is healthy for any aspiring Thief, your mind fixates on every possible avenue of escape available to you\.$
     matchre KHRI.DONE ^Remembering the mantra of mind over matter, you let your dedicated focus seep into your muscles, feeling a sense of heightened strength as well a deeper instinctive understanding of your weaponry\.$
     matchre KHRI.DONE ^Focusing your mind, you look around yourself to find the subtle differences lurking in the shadows nearby\.  After several deep breaths, your senses have attuned themselves to finding the best hiding spots\.$
     matchre KHRI.DONE ^Willing your body to meet the heightened functionality of your mind, you feel your motions steady considerably\.$
     matchre KHRI.DONE ^With deep breaths, you recall your training and focus your mind into the most universal of meditations, improving your overall performance\.$
     matchre KHRI.DONE ^Taking a deep breath, you focus on making your mind and body one, your mental discipline trained on quickly noticing, analyzing, and evading approaching threats\.$
     matchre KHRI.DONE ^Centering your mind, you allow your practiced discipline to spread throughout your body, making thought and motion one\.$
     matchre KHRI.DONE ^You calm your body and mind, recalling your training on how to seek the vital part of any opponent.  Wrapping yourself in this cool composure, your eyes quickly become drawn to exposed weaknesses around you\.$
     matchre KHRI.DONE ^Purging yourself of all distractions and extraneous thoughts, you allow your mind and body to become one, becoming preternaturally aware of threats around you and the best ways to defend yourself\.$
     matchre KHRI.DONE ^Focusing your mind, you attempt to attune your senses to the paths between shadows\.$
     matchre KHRI.DONE ^Placing all of your worries and concerns aside, you mentally wall them off where they no longer bother you\.$
     put khri $1
     matchwait

KHRI.DONE:
  action (standup) on
  return
######################################
###                                ###
###    THIEF AMBUSH SECTION!       ###
###                                ###
######################################
AMBUSH.CHECK:
     var HIDE.FAIL 0
     var ambush.type stun
     if ("%dist" != "melee") then put adv
     if ($concentration < 15) then RETURN
     pause 0.01
AMBUSH.HAND.CHECK:
     if ("$lefthandnoun" = "shield") then gosub UNEQUIP_SHIELD
     if matchre("$lefthandnoun","%QUIVER.ITEMS") then put stow left
     if "%HAND" = "left" and "$righthand" != "Empty" then put stow right
     if "%HAND" != "left" and "$lefthand" != "Empty" then put stow left
  pause 0.001
AMBUSH.DECIDE:
     if matchre("$righthandnoun","(scimitar|sabre|sword|briquet|bola|club|hhr'ata|maul|mace|bola|mattock|hammer|star|cane|staff|nightstick|khuj|akabo|spike|halberd|bludgeon|sword|ball and chain|ngalio)") then var ambush.type stun
     if matchre("$righthandnoun","(knife|katana|blade|dagger|iltesh|pasabas|broadsword|telo|katar|jambiya|javelin|quarterstaff|spear|flamberge)") then var ambush.type slash
     if matchre("$righthandnoun","(sling|staff sling|crossbow|bow|longbow)") then var ambush.type clout
     if ("%BACKSTAB" == "ON") && (%circle >= 39) then var ambush.type stun
     if ((toupper("$GH_AMBUSH") = "ON") && (%circle >= 50) then var ambush.type stun
     if contains("$roomobjs", "tusky") then var ambush.type stun
     if contains("$roomobjs", "%casters") then var ambush.type clout
     if $hidden = 1 then goto AMBUSH.IT
     goto AMBUSH.STALK

AMBUSH.STALK.FAIL:
     math HIDE.FAIL add 1
     if %HIDE.FAIL >= 2 then goto AMBUSH.RETURN
AMBUSH.STALK:
     if %circle < 50 then put hide
     pause 0.1
     pause 0.1
     send stop stalk
     pause 0.1
     pause 0.1
     if ("%dist" != "melee") then put adv
     if (($hidden = 0) && (%circle < 50)) then
     {
          send hide
          pause $roundtime
          pause 0.5
     }
     pause 0.1
     pause 0.001
     matchre AMBUSH.STALK ^\.\.\.wait|^Sorry\,
     matchre CHECK_FOR_MONSTER Stalk what|Face what|^There is nothing else to face|trying to stalk
     matchre AMBUSH.STALK.FAIL reveals|try being out of sight|discovers you|^You think|^You fail|^Stalking is an inherently
     matchre AMBUSH.IT ^You move into position|^You are already stalking|^You quickly slip|^You're already stalking
     send stalk
     matchwait 7
     goto AMBUSH.CLOUT

AMBUSH.IT:
     if (%circle <= 24) then goto AMBUSH.RETURN
     if "%ambush.type" = "clout" then goto AMBUSH.CLOUT
     if "%ambush.type" = "stun" then goto AMBUSH.STUN
     if "%ambush.type" = "slash" then goto AMBUSH.STUN
     var ambush.type clout
AMBUSH.STUN:
     pause 0.1
     pause 0.1
     pause 0.1
     if $hidden = 0 then goto RET.STALK
     matchre AMBUSH.STUN ^\.\.\.wait|^Sorry\,
     matchre AMBUSH.STALK.FAIL You must be hidden or invisible
     matchre AMBUSH.CHECK You need at least one hand
     matchre AMBUSH.CLOUT debilitated|impaired|out cold|deflect your slashing cut|Hamstring a|Coldcock a|sharp enough|^Wouldn't it be better|too heavy
     matchre AMBUSH.RETURN blocked harmlessly|You need a weapon|is stunned|isn't even standing|You're not exactly sure how|^You don't think
     matchre AMBUSH.RETURN Roundtime|it is flying|You aren't close enough to attack|There is nothing else|Stalk|suited for this type of maneuver
     put ambush %ambush.type
     matchwait 10
     goto AMBUSH.RETURN

AMBUSH.CLOUT:
     pause 0.1
     pause 0.1
     var ambush.type clout
     if (%circle <= 49) then goto AMBUSH.RETURN
     if $hidden = 0 then goto RET.STALK
     if matchre("$righthandnoun","(sabre|sword|spear|katar|jambiya|quarterstaff|nightstick|khuj)") then var ambush.type stun
     matchre AMBUSH.CLOUT ^\.\.\.wait|^Sorry\,
     matchre AMBUSH.STALK.FAIL You must be hidden or invisible
     matchre AMBUSH.CHECK You need at least one hand
     matchre AMBUSH.RETURN Roundtime|it is flying|You aren't close enough to attack|There is nothing else|Stalk|Hamstring a|Coldcock a|sharp enough
     matchre AMBUSH.RETURN debilitated|impaired|out cold|deflect your slashing cut|isn't even standing|suited for this type of maneuver|You're not exactly sure how|too heavy
     put ambush %ambush.type
     matchwait 15

AMBUSH.RETURN:
     var cloutLoop 0
     var HIDE.FAIL 0
     pause 0.001
     pause 0.001
     RETURN

RET.STALK:
     pause 0.01
     put ret
     pause 0.01
     pause 0.01
     goto AMBUSH.STALK.FAIL

quickstalk:
     if "$zoneid" = "65" then return
     if $Stealth.LearningRate > 33 then return
     if $monstercount < 3 then return
     if $hidden = 0 then
     {
          put hide
          pause 0.5
          pause 0.5
     }
     if "%dist" = "melee" then
     {
          put ret
          pause 0.2
     }
     pause 0.1
     put face next
     put adv
     pause 0.2
     pause 0.1
     goto quickstalk
####################################
##                                ##
##    STOWING ROUTINE             ##
##                                ##
####################################
STOWING:
     delay 0.001
     var location STOWING
     if "$righthandnoun" = "rope" then put coil my rope
     if "$righthand" = "bundle" || "$lefthand" = "bundle" then put wear bund;drop bun
     #if matchre("$righthandnoun","(crossbow|bow|short bow|sling)") then gosub unload
     if matchre("$righthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(partisan|shield|buckler|lumpy bundle|halberd|staff|longbow|khuj)") then gosub wear my $1
     if matchre("$lefthand","(longbow|khuj)") then gosub stow my $1 in my %SHEATH
     if "$righthand" != "Empty" then GOSUB STOW right
     if "$lefthand" != "Empty" then GOSUB STOW left
     RETURN

#SEARCHES THE GROUND FOR AMMO / WEAPONS / ARMOR
stowAmmo:
     delay 0.001
     #gosub BLEEDERCHECK
     if matchre("$righthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$lefthand" != "Empty") then gosub wear my $1
     if matchre("$lefthand","(partisan|shield|light crossbow|buckler|lumpy bundle|halberd|mistwood longbow|gloomwood khuj|halberd)") && ("$righthand" != "Empty") then gosub wear my $1
     if contains("$roomobjs","(double-stringed crossbow|repeating crossbow|bloodwood dako'gi crossbow|forester's crossbow|bamboo crossbow|forester's bow|battle bow|assassin's crossbow") then gosub stow $1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then gosub STOWARROW
     if matchre("$roomobjs","(river rock|river rocks|small rock|spider-carved rock)") then gosub STOWROCK
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|drake-fang bolt|jagged-horn bolt|leafhead bolt|barbed bolt)") then gosub STOWBOLT
     if contains("$roomobjs","throwing blade") then gosub STOWBLADE
     if contains("$roomobjs","silver-edged star") then gosub STOWSTARS
     if contains("$roomobjs","(ironwood shield|wooden shield)") then gosub stow $1
     if matchre("$roomobjs","(elongated stones|granite stone|panther-carved stone|goblin-carved stones|unicorn-carved stone)") then gosub stow stone
     if matchre("$roomobjs","(pyrite clump|smoky-quartz clump)") then gosub stow clump
     if contains("$roomobjs","sleek quadrello") then gosub stow quadrello
     if contains("$roomobjs","small shield|azure-scale shield") then gosub stow shield
     if contains("$roomobjs","stones") then gosub stow stones
     if contains("$roomobjs","hand claws") then gosub stow hand claw
     if contains("$roomobjs","T'Kashi mirror flamberge") then gosub stow mirror flamberge
     if contains("$roomobjs","T'Kashi mirror flail") then gosub stow mirror flail
     if contains("$roomobjs","mirror blade") then gosub stow mirror blade
     if contains("$roomobjs","mirror knife") then gosub stow mirror knife
     if contains("$roomobjs","Nisha short bow") then gosub stow nisha bow
     if contains("$roomobjs","razor-sharp damascus steel sabre") then gosub stow sabre
     if contains("$roomobjs","glaes and kertig-alloy katana capped with an ornate dragonfire amber pommel") then gosub stow katana
     if !matchre("$roomobjs","(mirror axe|stonebow|briquet|battle bow|akabo|mallet|throwing spike|steel scimitar|thrusting blade|flail|kneecapper|spear|hammer|throwing hammer|bone club|javelin|tago|staff sling|bludgeon|quarrel|short bow|\btelo\b|flamberge|flail|nightstick|khuj|iltesh|ngalio|hirdu bow|halberd|mirror blade|katana|morning star|war club|shadowy-black sling|staff sling|mattock|leathers|balaclava|helmet|helm|gauntlets|mail gloves|sniper's crossbow|light crossbow|targe\b|great helm|throwing axe|throwing club|bastard sword|jambiya|katar|throwing blade|composite bow|bola|short bow)") then RETURN
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
     pause 0.001
     if contains("$roomobjs","silver-edged star") then goto STOWSTARS
     RETURN
STOWBLADE:
     delay 0.001
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","throwing blade") then
          {
               put stow throwing blade
               put stow throwing blade
               waitforre ^You|^I|^What|^Sorry|^Stow|...wait
          }
     pause 0.1
     pause 0.1
     if contains("$roomobjs","throwing blade") then goto stowblade
     RETURN
STOWARROW:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then
          {
               put stow $1
          }
     pause 0.1
     pause 0.001
     if matchre("$roomobjs","(basilisk head arrow\b|cane arrow\b|bone-tipped arrow\b|barbed arrow\b|stone-tipped arrow\b|serrated-bodkin arrow\b|razor-edged arrow|razor-tipped arrow\b)") then goto stowarrow
     RETURN
STOWBOLT:
     delay 0.001
     pause 0.1
     if matchre("$roomobjs","(angiswaerd bolt|basilisk bolt|ice-adder bolt|leafhead bolt|barbed bolt)") then
          {
               put stow $1
          }
     pause 0.1
     pause 0.001
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
     pause 0.001
     if contains("$roomobjs","a small rock") then goto STOWROCK
     RETURN

HANDS:
     delay 0.001
     if "$lefthand" != "Empty" then GOSUB STOW left in my %DEFAULT_CONTAINER
     if "$righthand" != "Empty" then GOSUB STOW right %DEFAULT_CONTAINER
     pause 0.5
     if "$lefthand" != "Empty" then GOSUB STOW left in my %BOX_CONTAINER
     if "$righthand" != "Empty" then GOSUB STOW right %BOX_CONTAINER
     pause 0.5
     if "$lefthand" != "Empty" then GOSUB STOW left in my %GEM_CONTAINER
     if "$righthand" != "Empty" then GOSUB STOW right %GEM_CONTAINER
     pause 0.5
     RETURN

STOW:
     var location stow1
     var todo $0
stow1:
     pause 0.2
     pause 0.1
     if matchre("$righthand","longbow") then goto stow4
     matchre stow2 not designed to carry anything|any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|^But that's closed|I can't find your container
     matchre return ^Wear what\?
     matchre return ^Stow what\?
     matchre return ^You put your
     matchre return ^You stop as you realize
     matchre return ^But that is already in your inventory\.
     matchre return ^That can't be picked up
     matchre return needs to be
     matchre hands ^You need a free hand
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     put stow %todo
     GOTO retry
stow2:
     pause 0.5
     pause 0.1
     pause 0.1
     pause 0.1
     var location stow2
     matchre return ^Wear what\?|^Stow what\?
     matchre return ^You put your
     matchre return ^But that is already in your inventory\.
     matchre stow3 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     put stow %todo in my %GEM_CONTAINER
     GOTO retry
stow3:
     pause 0.5
     pause 0.1
     pause 0.1
     pause 0.1
     var location stow3
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre return ^Wear what\?|^Stow what\?
     matchre return ^You put your
     matchre return ^But that is already in your inventory\.
     matchre stow4 any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide|not designed to carry anything|^But that's closed
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     put stow %todo in my %DEFAULT_CONTAINER
     put stow %todo in my %BOX_CONTAINER
     GOTO retry
stow4:
     pause 0.5
     pause 0.1
     var location stow4
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre open.thing ^But that's closed
     matchre return ^Wear what\?|^Stow what\?
     matchre return ^You put your
     matchre return ^But that is already in your inventory\.
     matchre REM.WEAR any more room|no matter how you arrange|^That's too heavy|too thick|too long|too wide
     matchre location.unload ^You should unload the
     matchre location.unload ^You need to unload the
     put stow %todo in my %SHEATH
     put stow %todo in my %GEM_CONTAINER
     GOTO retry


REM.WEAR:
     put rem bund
     put drop bund
     pause 0.1
     goto wearit
     wearit:
     var location wearit1
     var todo $0
     wearit1:
     if "$lefthandnoun" = "bundle" then put drop bun
     if "$righthandnoun" = "bundle" then put drop bun
     matchre return ^You sling
     matchre return ^You attach
     matchre return ^You put
     matchre return ^You strap
     matchre return ^You work your way into
     matchre return ^You slide your left arm through
     matchre return ^You hang
     matchre return ^You slip
     matchre return ^You drape
     matchre return ^You slide
     matchre return ^You can't
     matchre return ^You are already wearing that\.
     matchre return ^Wear what\?
     matchre return ^The contours of the
     matchre return ^You can't wear any more items like that\.
     matchre location.unload1 ^You should unload the
     matchre location.unload1 ^You need to unload the
     put wear %todo
     goto retry

STOWING_AMMO:
          echo
          echo *** STOWING_AMMO ***
          echo
     pause .001
     pause .001
     if "$lefthand" != "Empty" then GOSUB stow left
     pause .001
          matchre STOWING_AMMO_DONE You get some|You get a|You are already holding|You must unload|You stop as you realize|Stow what
          matchre STOWING_AMMO You put|You pull
          matchre STOWING_AMMO_2 ^That's too heavy|^There isn't any
     if (matchre("$roomobjs", "%AMMO\b")) then
     {
     put stow %AMMO in my %QUIVER
     put stow %AMMO in my %QUIVER
     matchwait 5
     }
     if matchre("$roomobjs","(leafhead bolt|barbed bolt)") then
     {
     put stow bolt
     put stow bolt
     matchwait 5
     }
     if matchre("$roomobjs","(quadrello|a sleek quadrello)") then
     {
     put stow quad
     put stow quad
     matchwait 5
     }
     if matchre("$roomobjs","(elongated stones|granite stone)") then
     {
     put stow stone
     put stow stone
     matchwait 5
     }
     if matchre("$roomobjs","(river rock|rocks)") then
     {
     put stow tumbled rock
     put stow tumbled  rock
     matchwait 5
     }
     goto STOWING_AMMO_DONE
STOWING_AMMO_2:
     pause 0.1
          matchre STOWING_AMMO_DONE You get some|You get a|You are already holding |You must unload|You stop as you realize|Stow what
          matchre STOWING_AMMO You pick up|You pull|You put
     if "$righthand" != "Empty" then put stow right in %GEM_CONTAINER
     if "$lefthand" != "Empty" then put stow left in %GEM_CONTAINER
     matchwait 20


STOWING_AMMO_DONE:
     pause 0.1
     pause 0.1
     pause 0.1
     if (matchre("$roomobjs", "%AMMO\b")) then
     {
     put get %AMMO
     put put %AMMO in my arm quiver
     goto STOWING_AMMO_DONE_2
     }
     if matchre("$roomobjs","(leafhead bolt|barbed bolt)") then
     {
     put stow bolt
     goto STOWING_AMMO_DONE_2
     }
     if matchre("$roomobjs","(quadrello|a sleek quadrello)") then
     {
     put stow quad
     goto STOWING_AMMO_DONE_2
     }
     if matchre("$roomobjs","(river rock|rocks)") then
     {
     put stow tumbled rock
     put stow tumbled rock
     pause 0.1
     pause 0.1
     goto STOWING_AMMO_DONE_2
     }
STOWING_AMMO_DONE_2:
     if "$righthand" != "Empty" then put stow right in %GEM_CONTAINER
     if "$lefthand" != "Empty" then put stow left in %GEM_CONTAINER
     pause 0.1
     return

######################################
###                                ###
### This section is for the 5 move ###
### weapon attack COMBO            ###
###                                ###
######################################
5_COMBO:
500:
     if ("%lastmaneuver" = "none") then
     {
          put stance maneuver
          waitfor Last Combat Maneuver
     }
     var LAST 5_COMBO
     gosub clear
     if !$standing then gosub standup
     counter set 500
     save 500
     math cloutLoop add 1
     gosub stowAmmo
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     if ("$guild" = "Thief) then gosub KHRI
     if (toupper("$GH_TACTICS") = "ON") && (%cloutLoop > 2) then gosub ANALYZE.MOB
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
     if (%cloutLoop > 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO5") || ("%lastmaneuver" = "%_COMBO5 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO5 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO1 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO1") || ("%lastmaneuver" = "%_COMBO1 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO1 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO2") || ("%lastmaneuver" = "%_COMBO2 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO2 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO3 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO3") || ("%lastmaneuver" = "%_COMBO3 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO3 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO4 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO4") || ("%lastmaneuver" = "%_COMBO4 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO4 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO5 %HAND $GH_TARGET
     else gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     else goto 500

######################################
###                                ###
### This section is for the 6 move ###
### weapon attack COMBO            ###
###                                ###
######################################
6_COMBO:
600:
     if ("%lastmaneuver" = "none") then
     {
          put stance maneuver
          waitfor Last Combat Maneuver
     }
     var LAST 6_COMBO
     gosub clear
     if !$standing then gosub standup
     counter set 600
     save 600
     gosub stowAmmo
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     gosub KHRI
     math cloutLoop add 1
     if (toupper("$GH_TACTICS") = "ON") && (%cloutLoop > 2) then gosub ANALYZE.MOB
     if (%cloutLoop > 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO6") || ("%lastmaneuver" = "%_COMBO6 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO6 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO1 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO1") || ("%lastmaneuver" = "%_COMBO1 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO1 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO2") || ("%lastmaneuver" = "%_COMBO2 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO2 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO3 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO3") || ("%lastmaneuver" = "%_COMBO3 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO3 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO4 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO4") || ("%lastmaneuver" = "%_COMBO4 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO4 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO5 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO5") || ("%lastmaneuver" = "%_COMBO5 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO5 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO6 %HAND $GH_TARGET
     else gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     else goto 600

######################################
###                                ###
### This section is for the 7 move ###
### weapon attack COMBO            ###
###                                ###
######################################
7_COMBO:
700:
     if ("%lastmaneuver" = "none") then
     {
          put stance maneuver
          waitfor Last Combat Maneuver
     }
     var LAST 7_COMBO
     gosub clear
     if !$standing then gosub standup
     counter set 700
     save 700
     gosub stowAmmo
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     gosub KHRI
     math cloutLoop add 1
     if (toupper("$GH_TACTICS") = "ON") && (%cloutLoop > 2) then gosub ANALYZE.MOB
     if (%cloutLoop > 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO7") || ("%lastmaneuver" = "%_COMBO7 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO7 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO1 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO1") || ("%lastmaneuver" = "%_COMBO1 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO1 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO2") || ("%lastmaneuver" = "%_COMBO2 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO2 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO3 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO3") || ("%lastmaneuver" = "%_COMBO3 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO3 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO4 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO4") || ("%lastmaneuver" = "%_COMBO4 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO4 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO5 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO5") || ("%lastmaneuver" = "%_COMBO5 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO5 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO6 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO6") || ("%lastmaneuver" = "%_COMBO6 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO6 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO7 %HAND $GH_TARGET
     else gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     else goto 700

######################################
###                                ###
### This section is for the 8 move ###
### weapon attack COMBO            ###
###                                ###
######################################
8_COMBO:
800:
     if ("%lastmaneuver" = "none") then
     {
          put stance maneuver
          waitfor Last Combat Maneuver
     }
     var LAST 8_COMBO
     gosub clear
     if !$standing then gosub standup
     counter set 800
     save 800
     gosub stowAmmo
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     gosub KHRI
     math cloutLoop add 1
     if (%cloutLoop > 2) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO8") || ("%lastmaneuver" = "%_COMBO8 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO8 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO1 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO1") || ("%lastmaneuver" = "%_COMBO1 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO1 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO2 %HAND $GH_TARGET
     if (toupper("$GH_TACTICS") = "ON") then gosub ANALYZE.MOB
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO2") || ("%lastmaneuver" = "%_COMBO2 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO2 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO3 %HAND $GH_TARGET
     if ("%BRAWLING" = "ON") then gosub COMBAT_COMMAND attack %HAND $GH_TARGET
     if ("%BRAWLING" = "ON") then gosub COMBAT_COMMAND attack %HAND $GH_TARGET
     if ("%BRAWLING" = "ON") then send face next
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
     pause 0.1
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     if (toupper("$GH_TACTICS") = "ON") then gosub ANALYZE.MOB
    if (("%lastmaneuver" = "%_COMBO3") || ("%lastmaneuver" = "%_COMBO3 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO3 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO4 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO4") || ("%lastmaneuver" = "%_COMBO4 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO4 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO5 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO5") || ("%lastmaneuver" = "%_COMBO5 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO5 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO6 %HAND $GH_TARGET
     if ($%WEAPON_EXP.Ranks < %LOWRANKS) && (%cloutLoop < 3) then gosub AMBUSH.CHECK
	 if ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if ("%lastmaneuver" = "%_COMBO6") || ("%lastmaneuver" = "%_COMBO6 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO6 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO7 %HAND $GH_TARGET
     if ("%lastmaneuver" = "%_COMBO7") || ("%lastmaneuver" = "%_COMBO7 $GH_TARGET") || ("%lastmaneuver" = "%_COMBO7 %HAND $GH_TARGET") then gosub COMBAT_COMMAND %_COMBO8 %HAND $GH_TARGET
     if (toupper("$GH_TACTICS") = "ON") then gosub ANALYZE.MOB
    if ("%BRAWLING" = "ON") then gosub COMBAT_COMMAND attack %HAND $GH_TARGET
    if ("%BRAWLING" = "ON") then gosub COMBAT_COMMAND attack %HAND $GH_TARGET
     else gosub COMBAT_COMMAND %_COMBO1 %HAND $GH_TARGET
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     else goto 800

######################################
###                                ###
### This section is for the ranged ###
### weapon attack COMBO            ###
###                                ###
######################################
RANGED:
1000:
     var LAST RANGED
     var cloutLoop 0
     save 1000
     var throwLoop 0
     action var FULL_AIM YES when You think you have your best shot possible
     action var FULL_AIM NO when stop concentrating on aiming
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     if ((toupper("$GH_RETREAT") = "ON") && ("%RETREATING" = "OFF") && (("%FIRE_TYPE" != "SNIPE") || ("%FIRE_TYPE" != "POACH"))) then gosub RETREAT_TRIGGERS
     if ("%lastmaneuver" = "none") then gosub COMBAT_COMMAND dodge
RANGED_COMBAT:
1010:
     var LAST RANGED_COMBAT
     gosub clear
     counter set 1010
     save 1010
     gosub stowAmmo
     gosub khri
     if (%cloutLoop > 3) then gosub AMBUSH.CHECK
	 if (%cloutLoop > 2) && ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if (("%lastmaneuver" = "dodge") || ("%lastmaneuver" = "FIRE") || ("%lastmaneuver" = "POACH") || ("%lastmaneuver" = "SNIPE")) then
     {
          gosub LOAD
          gosub AIM
          math cloutLoop add 1
          if (%cloutLoop > 3) then gosub AMBUSH.CHECK
          if (("%FIRE_TYPE" = "POACH") || ("%FIRE_TYPE" = "SNIPE")) then gosub HIDE
          if (toupper("$GH_SNAP") = "OFF")) then gosub AIMING
          elseif ($GH_SNAP_PAUSE > 0) then pause $GH_SNAP_PAUSE
          var FULL_AIM NO
               matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead|pointlessly hack
               matchre RANGE_FIRE2 You can not poach|are not hidden
               match RETURN isn't loaded
               matchre RETURN ^I could not find what you were
          gosub COMBAT_COMMAND %FIRE_TYPE $GH_TARGET
     } else gosub COMBAT_COMMAND dodge
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     goto 1010

LOAD:
     pause 0.01
     if matchre("$roomobjs","(elongated stones|granite stone)") then put stow stone
     if matchre("$roomobjs","(river rock|small rock)") then put stow rock
     if contains("$roomobjs", "%AMMO") then gosub RANGED_CLEAN
     if ("$righthandnoun" = "sling") then put get %SLING_AMMO
     if ("$lefthandnoun" = "arrowhead") then put drop arrow
     pause 0.1
     pause 0.1
          #matchre RANGE_REMOVE_CHECK (\w+) makes the task more difficult|while wearing a (.+)|while wearing an (.+)
          matchre CHECK_AMMO ^You don't have the proper ammunition readily available for your|^As you try to reach into
          matchre RANGE_GET ^You must be|your hand jams|^You can not load
          matchre DROPPED_WEAPON ^What weapon are you
          matchre SWITCH_WEAPON ^You can't load the (.+)
          matchre EMPTY.LEFT ^You can not load the|arrowhead in your left hand
          matchre RETURN Roundtime|is already|(\w+) makes the task more difficult|while wearing a (.+)|while wearing an (.+)
     if matchre("$righthandnoun","(crossbow|bow|sling)") && ("$hidden" != "1") && ("$lefthand" == "Empty") then
     {
     if contains("$roomobjs","(%AMMO)") then put get %AMMO
     if !contains("$roomobjs","(%AMMO)") then put get my %AMMO
     pause 0.1
  pause 0.1
  pause 0.001
     }
  if $guild = Ranger && $HOL = ON && $GH_DUAL_LOAD = ON then
     {
          put load arrows
          matchwait 80
          goto RANGED_ERROR
     }
     else
     if $guild = Barbarian && $EAGLE = ON && $GH_DUAL_LOAD = ON  then
     {
          put load arrows
          matchwait 80
          goto RANGED_ERROR
     }
  else
     put load
     matchwait 30
     goto RANGED_ERROR

EMPTY.LEFT:
put open sack
pause 0.5
put put arrow in sack
pause 0.5
pause 0.5
put close sack
pause 0.5
pause 0.5
goto LOAD

BAD.WEAPON:
if "$righthand" = "belt knife" then put wear knife
if "$lefthand" != "Empty" then put stow left
if "$righthand" != "Empty" then put stow right
pause 0.5
STOW.LEFT:
put stow left
pause .01
pause .01
goto DROPPED_WEAPON

AIM:
     var AIM_TIMEOUT %t
     math AIM_TIMEOUT add 30
     if "$lefthand" != "Empty" then
          {
               put stow left
               pause 0.1
          }
     if ("%dist" != "melee") then
          {
               put adv
               pause 0.1
          }
          matchre AIM At what are you trying|I could not|Strangely, you don't feel like fighting
          matchre DROPPED_WEAPON ^You don't have a ranged weapon
          matchre BAD.WEAPON isn't a ranged weapon
          matchre STOW.LEFT ^You need both hands in order to aim
          matchre RE_LOAD loaded
          matchre RETURN best shot possible now|already targetting|begin to target
          matchre FACE ^There is nothing|^Face what\?|^What are you trying to attack\?
     put aim
     matchwait 20
     goto RANGED_ERROR

RE_LOAD:
     gosub clear
     goto RANGED_COMBAT

AIMING:
     if ("%FULL_AIM" = "YES") then return
     else
     {
          if (%t > %AIM_TIMEOUT) then goto RANGED_COMBAT
          else
          {
               pause 0.5
               goto AIMING
          }
     }

RANGE_FIRE2:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** Can't poach that, just using FIRE ***
          echo
     }
     var LAST RANGE_FIRE2
     gosub clear
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead|pointlessly hack
          matchre RETURN ^I could not find what you were
          match RETURN isn't loaded
     gosub COMBAT_COMMAND FIRE $GH_TARGET
     goto 1010

RANGE_GET:
     var LAST RANGE_GET
     gosub clear
     pause 0.1
     if "$lefthand" != "Empty" then GOSUB stow left
     pause 0.1
     if (matchre("$roomobjs", "%AMMO\b")) then
     {
               match CHECK_AMMO ^What were you
               match DEAD_MONSTER ^You pull
               matchre %c ^Stow what|^You must unload|^You get some
               matchre RANGE_GET ^You pick up|^You put|^You stow|^You get
               matchre RANGE_GET_2 ^That's too heavy
          #if matchre("$roomobjs","cane arrow") then
          #{
          #put get cane arrow
          #put put arrow in my arm quiver
          #matchwait 20
          #}
          put stow %AMMO
          put stow %AMMO
          matchwait 20
          goto RANGED_ERROR
     } else goto %c
RANGE_GET_2:
               match CHECK_AMMO ^What were you
               match DEAD_MONSTER ^You pull
               matchre %c ^Stow what|^You must unload|^You get some
               matchre RANGE_GET ^You pick up|^You put|^You stow|^You get
               if matchre("$roomobjs","cane arrow") then
               {
               put get cane arrow
               put put arrow in my arm quiv
               matchwait 20
               }
          put stow %AMMO
          put stow %AMMO
          matchwait 20
          goto RANGED_ERROR

RANGE_REMOVE_CHECK:
     if matchre ("$0", "shield|buckler|pavise|heater|kwarf|sipar|lid|targe\b") then goto RANGE_REMOVE
     else goto RANGED_ERROR
RANGE_REMOVE:
     var REM_SHIELD $0
     counter set %s
RANGE_REMOVING:
     var LAST RANGE_REMOVING
          matchre RANGE_STOW ^You loosen the straps securing|^You aren't wearing that|^You slide|^You sling
          match RANGED_ERROR ^Remove what\?
     put remove my %REM_SHIELD
     matchwait 20
     goto RANGED_ERROR

RANGE_STOW:
     var LAST RANGE_STOW
          match RANGED_ERROR ^Stow What\?
          match RANGE_ADJUST too
          match RETURN You put
          matchre RANGE_STOW2 There isn't any more|No matter
     put stow my %REM_SHIELD
     matchwait 15
RANGE_STOW2:
     var LAST RANGE_STOW
          match RANGED_ERROR ^Stow What\?
          match RANGE_ADJUST too
          match RETURN You put
          matchre RANGE_STOW2 There isn't any more|No matter
     put stow my %REM_SHIELD in my %BOX_CONTAINER
     matchwait 15
RANGE_ADJUST:
          matchre RANGED_ERROR through the straps|You can't wear any more items like that
          match RETURN You sling|You slide
     put adjust my %REM_SHIELD
     put wear my %REM_SHIELD
     matchwait  30
     goto RANGED_ERROR

CHECK_AMMO:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** No ammo on you, checking the ground ***
          echo
     }
     if contains("$roomobjs", "%AMMO") then
     {
          gosub RANGED_CLEAN
          goto 1000
     }
NO_AMMO:
          echo
          echo *** No more ammo, stopping script ***
          echo
     var LAST NO_AMMO
     if ("%REM_SHIELD" != "NONE") then
     {
          gosub EQUIP_SHIELD %REM_SHIELD
     }
     gosub RANGE_SHEATHE
     put #parse OUT.OF.AMMO
     put #parse OUT.OF.AMMO
     goto SWITCH_WEAPON

######################################
###                                ###
### This section is for the ranged ###
### weapon attack COMBO            ###
###                                ###
######################################
THROWING:
1200:
     save 1200
     var cloutLoop 0
     var LAST THROWING
     if ((toupper("$GH_RETREAT") = "ON") && ("%RETREATING" = "OFF")) then gosub RETREAT_TRIGGERS
     if ("%lastmaneuver" = "none") then gosub COMBAT_COMMAND dodge
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
THROW_WEAPON:
2410:
1210:
     var LAST THROW_WEAPON
     gosub clear
     counter set 1210
     save 1210
     gosub stowammo
     if !$standing then gosub standup
     math cloutLoop add 1
	 if (%cloutLoop > 2) && ("%MAGICLOOP" = "ON") then gosub MAGICLOOP
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if contains("$roomobjs", "throwing blade") then gosub stowammo
     if contains("$roomobjs", "silver-edged star") then gosub stowammo
     if ((("%HAND" = "") && ("$righthand" = "Empty")) || (("%HAND" = "left") && ("$lefthand" = "Empty"))) then gosub GET_THROWN
     if matchre("$righthandnoun|$lefthandnoun", "shield") then send wear shield
     if matchre("$righthand|$lefthand", "thrusting blade") then send stow blade
     pause 0.1
     pause 0.2
     if ((("%HAND" = "") && ("$righthand" = "Empty")) || (("%HAND" = "left") && ("$lefthand" = "Empty"))) then gosub GET_THROWN
     if (("%HAND" = "left") && ("$lefthand" = "Empty"))) then 
          {
          send swap
          pause 0.3
          }
     if (%cloutLoop >= 4) then gosub KHRI
     if (%cloutLoop > 4) then gosub AMBUSH.CHECK
THROW.CONT:
     gosub COMBAT_COMMAND throw %HAND $GH_TARGET
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     gosub GET_THROWN
     if ("$lefthand" = "Empty") then send swap
     pause 0.3
     gosub COMBAT_COMMAND throw left $GH_TARGET
     goto 1210

GET_THROWN:
     if contains("$roomobjs", "throwing blade") then gosub stowammo
     if matchre("$righthandnoun|$lefthandnoun", "diary") then send wear diary
     pause 0.1
     match GET_THROWN As you reach for a large frozen club
     matchre WEAPON_STUCK What were you
     matchre RETURN already|You need a free hand to pick that up|You get|With a flick|You pull|You grab hold|You pick up|You put|suddenly leaps toward you|and flies toward you|You don't have any
     if %BONDED = ON then put invoke
     else
     put get %CURR_WEAPON
     matchwait 15
     goto THROWN_ERROR

WEAPON_STUCK:
1220:
     var LAST WEAPON_STUCK
     if contains("$roomobjs", "throwing blade") then gosub stowammo
     if ("%RETREATING" = "ON") then gosub RETREAT_UNTRIGGERS
          echo
          echo *** Getting weapon back ***
          echo
     gosub clear
     pause 0.1
     put adv
     waitforre to melee range|already at melee
     if (("%lastmaneuver" = "throw") || ("%lastmaneuver" = "attack")) then
     {
          match GET_WEAPON comes free and falls to the ground.
          gosub COMBAT_COMMAND dodge
     }
     if ("%lastmaneuver" = "dodge") then
     {
       match GET_WEAPON comes free and falls to the ground.
          gosub COMBAT_COMMAND gouge
     }
     if ("%lastmaneuver" = "gouge") then
     {
          match GET_WEAPON comes free and falls to the ground.
          gosub COMBAT_COMMAND claw
     }
     if ("%lastmaneuver" = "claw") then
     {
          match GET_WEAPON comes free and falls to the ground.
          gosub COMBAT_COMMAND elbow
     }
     if ("%lastmaneuver" = "elbow") then
     {
          match GET_WEAPON comes free and falls to the ground.
          gosub COMBAT_COMMAND attack
     }
  else gosub COMBAT_COMMAND dodge
  if contains("$roomobjs", "throwing blade") then gosub stowammo
     goto 1220

GET_WEAPON:
     if ((toupper("$GH_RETREAT") = "ON") && ("%RETREATING" = "OFF")) then gosub RETREAT_TRIGGERS
     gosub clear
          matchre GET_WEAPON comes free and falls to the ground|As you reach for a large frozen club
          matchre 1210 already|You get|You pull|You pick|You need a free hand to|What were you
     put get %CURR_WEAPON
     matchwait 30
     goto THROWN_ERROR


########################################
###                                  ###
### This section is for the backstab ###
### weapon attack COMBO              ###
###                                  ###
########################################
STABBITY:
1300:
     var LAST STABBITY
     gosub clear
     counter set 1300
     save 1300
     gosub stowAmmo
     gosub KHRI
     if contains("$monsterlist", "%ubermonster") && ($%WEAPON_EXP.Ranks >= %HIGH.END) then put face %ubermonster
     if contains("$monsterlist", "%noobmonster") && ($%WEAPON_EXP.Ranks < %HIGH.END) then put face %noobmonster
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     if ("%lastmaneuver" != "parry") then gosub COMBAT_COMMAND parry
     if ($hidden != 1) then gosub HIDE
     math cloutLoop add 1
     if (%cloutLoop > 3) then gosub AMBUSH.CHECK
     if ("%lastmaneuver" = "parry") then
     {
               matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead|pointlessly hack
               matchre FACE Face what\?
               matchre BS_ATTACK Backstab what\?|^You can't backstab that\.|political|You'll need something a little lighter|It's called a backSTAB|You can't backstab that
               matchre BAD_WEAPON entirely unsuitable|Backstabbing is much more effective when you use a melee weapon
          gosub COMBAT_COMMAND backstab %HAND
     }
     if ($Backstab.LearningRate > 32) && ($Stealth.LearningRate > 28) then
          {
               ECHO **** Locked Backstab - Switching to Melee attack...
               put #var GH_AMBUSH OFF
               var BACKSTAB OFF
               var ALTEXP OFF
               if ("%NOOB" = "ON") then gosub WEAR.PLATE
               goto 500
          }
     if (toupper("$GH_TIMER") = "ON") then goto TIMER_ON
     if (toupper("$GH_TRAIN") = "ON") then goto EXPCHECK_ON
     else goto 1300
BS_ATTACK:
          echo
          echo *** Can't backstab, ambushing instead ***
          echo
     gosub clear
     put #var GH_AMBUSH ON
     goto 500

BAD_WEAPON:
          echo
          echo *** BAD_WEAPON: ***
          echo This weapon is not suitable for this type of attack, switching to regular combat
          echo
     goto WEAPON_CHECK

######################################
###                                ###
###      Combat Manuever           ###
###                                ###
######################################
COMBAT_COMMAND:
     pause 0.01
     if (("$GH_FEINT" = "ON") && (("$0" != "feint") && ("$0" != "parry") && ("$0" != "dodge"))) then var COMMAND feint $0
  else var COMMAND $0
     else var lastmaneuver $1
     if ("%SEARCHED" = "NO") then
     {
          if matchre ("$roomplayers", "Also here: (\S+)") then goto NOT_CHECKING
          if matchre ("$roomobjs", "((which|that) appears dead|\(dead\))") then goto DEAD_MONSTER
     }
  else var SEARCHED NO
     NOT_CHECKING:
     if ((toupper("$GH_AMBUSH") = "ON") && ($hidden != 1)) then
     {
          if ("%BACKSTAB" = "ON") then gosub HIDE
          else gosub HIDE
     }
     if ((toupper("$GH_HUNT") = "ON") && (%t >= %HUNT_TIME) && ($Perception.LearningRate < 32) && ($hidden != 1)) then
     {
          pause 0.1
          put hunt
          var HUNT_TIME %t
          math HUNT_TIME add 75
          waitforre Roundtime|You find yourself unable
     }
     #if (%t >= %CRYS.TIME) then
     #{
     #    pause 0.2
     #    send exhale ach crystal
     #    var CRYS.TIME %t
     #    math CRYS.TIME add 90
     #    waitforre Roundtime|You find yourself unable|You blow|Smoking
     #}
     #if toupper("$juggernaut.orb") = "YES" then gosub DISARM_ORB
     if ((toupper("$GH_SLOW") = "ON") && (("%lastmaneuver" != "dodge") && ("%lastmaneuver" != "parry")) then pause $GH_SLOW_PAUSE

ATTACK:
var LAST ATTACK
          matchre PAUSE.ATTACK ^Strangely, you don't feel like fighting
          matchre DROPPED_WEAPON ^Wouldn't it be
          matchre FLYING_MONSTER flying far too high to hit with
          matchre FATIGUE You're beat|You're exhausted|You're bone-tired|worn-out
          matchre ADVANCE help if you were closer|aren't close enough|^You must be closer
          matchre DEAD_MONSTER balanced\]|balance\]|already dead|very dead|pointlessly hack
          matchre FACE nothing else|^Face what\?
          matchre BS_ATTACK ^Backstab what\?|^You can't backstab that\.|political|You'll need something a little lighter|It's called a backSTAB
          matchre RETURN ^You turn|^You can not|I could not find|You are already in a position|But you are already dodging|You move into a position to|Roundtime|must be hidden|What were you|What are you|There's nothing you can really|You see nothing here
     put %COMMAND
     matchwait 30
     goto ATTACK_ERROR

PAUSE.ATTACK:
echo *** PAUSING FOR A SECOND DUE TO CALM..
pause 3
goto ATTACK

FLYING_MONSTER:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo ***  Monster is flying, trying attack again ***
          echo
     }
     put #beep
     pause 3
     goto ATTACK
HIDE:
   var hidecounter 0
HIDE1:
     if (("%guild" = "Thief") && (%circle >= 50)) then goto STALK1
          match HIDE fail
          matchre HIDE1_RETREAT You are too close|notices|reveals
          matchre STALK1 You melt|You blend|Eh\?
     put hide
     matchwait 30
     goto STEALTH_ERROR

HIDE1_RETREAT:
  pause 0.1
  ECHO *** SPOTTED!! ***
  if %hideCounter > 7 then RETURN
  math hideCounter add 1
  pause 0.2
     put stop stalk
     pause 0.2
  pause 0.2
     put ret
  pause 0.2
     goto HIDE1

STALK1:
          matchre HIDE1_RETREAT reveals|try being out of sight|discovers you|trying to stalk
          match STALK1 You think|You fail
          matchre CHECK_FOR_MONSTER ^Stalk what|^Face what|^There is nothing else to face|are you trying to stalk
          matchre RETURN You move into position|You are already stalking|You're already stalking
     put stalk
     matchwait 30
     goto STEALTH_ERROR

CIRCLE_CHECK:
     if (("%guild" = "Thief") && (%circle >= 50)) then var circle 1
     goto HIDE


######################################
###                                ###
### RANGED SECTION                 ###
###                                ###
######################################
RANGED_CLEAN:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** RANGED_CLEAN ***
          echo
     }
          pause 0.1
          matchre RANGED_CLEAN_DONE You get some|You get a|You are already holding|You must unload|You stop as you realize|^Stow what\?|^Sorry|STOW HELP|needs to be tended
          matchre RANGED_CLEAN You put|You pull
          matchre RANGED_CLEAN_2 ^That's too heavy
     #if matchre("$roomobjs","cane arrow") then
     #{
     #    put get arrow
     #    put put arrow in my arm quiver
     #matchwait 10
     #}
     if matchre("$roomobjs","leafhead bolt") then
     {
          put stow bolt
     matchwait 10
     }
     put stow %AMMO
     put stow %AMMO
     matchwait 15
     goto CLEANING_ERROR
RANGED_CLEAN_2:
     pause 0.1
          matchre RANGED_CLEAN_DONE You get some|You get a|You are already holding |You must unload|You stop as you realize|Stow what
          matchre RANGED_CLEAN You pick up|You pull|You put
     put stow %AMMO in %BOX_CONTAINER
     matchwait 30


RANGED_CLEAN_DONE:
     if matchre("$roomobjs","cane arrow") then
     #{
     #    put get arrow
     #    pause 0.1
     #    put put arrow in my arm quiver
     #}
     put stow %AMMO
     RANGE.DONE.2:
     if (("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
     if ("$lefthand" = "Empty") then
     gosub EQUIP_SHIELD
     }
     return

THROWN_CLEAN:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** THROWN_CLEAN ***
          echo
     }
     put put my %CURR_WEAPON in my %T_SHEATH
     put retreat
     pause 0.5
          matchre THROWN_CLEAN_DONE You get some|You get a|You are already holding|But that is
          matchre THROWN_CLEAN You pick up|You pull
     put get %CURR_WEAPON
     matchwait 30
     goto CLEANING_ERROR

THROWN_CLEAN_DONE:
     put stow my %CURR_WEAPON
     return

WEBBED:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** You have been webbed ***
          echo
     }
     var WEBBED YES
     action remove eval $webbed = 1
     action var WEBBED NO when move freely again|free yourself from the webbing\.
     put #beep
     if $webbed = 0 then
     {
     var WEBBED NO
     action goto WEBBED when eval $webbed = 1
     goto %LAST
     }
     if ("%WEBBED" = "YES") then
     {
          waitforre move freely again|free yourself from the webbing\.
     }
     action goto WEBBED when eval $webbed = 1
     goto %LAST

STANDUP:
     pause 0.1
     if !$standing then put stand
     if !$standing then put stand
     pause 0.5
     if !$standing then put stand
     pause 0.1
     RETURN
STAND:
     pause 1
     if ("$standing = 0") then
     {
          echo
          echo *** Knocked down, standing back up ***
          echo
     }
     var GO_BACK %LAST
STANDING:
     if ("$standing" = "0") then
     {
     var LAST STANDING
          matchre WAKE ^Use WAKE to wake yourself up|^You can't do that while you are asleep
          matchre STANDING cannot manage to stand|The weight of all your possessions|still stunned
          matchre %GO_BACK ^You stand|^You are already standing
     put stand
     matchwait 30
     goto ERROR
     }

FATIGUE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** FATIGUE: ***
          echo
     }
     if (("%THROWN" = "ON") && matchre("$roomobjs", "%CURR_WEAPON")) then
     {
          pause 1
          put get %CURR_WEAPON
          waitforre You pick up|You get
     }
     var LAST FATIGUE
          matchre FATIGUE \[You're|You stop advancing
          match FATIGUE_CHECK You cannot back away from a chance to continue your slaughter!
          matchre FATIGUE_CHECK You retreat from combat|You sneak back|already as far
     put ret
     put ret
     matchwait 10
     goto FATIGUE_CHECK

FATIGUE_CHECK:
          echo
          echo *** FATIGUE_CHECK: ***
          echo
     if ($stamina < 90) then
     {
          goto FATIGUE_WAIT
     } else
     {
          goto %c
     }

FATIGUE_WAIT:
          echo
          echo *** FATIGUE_WAIT: ***
          echo
          matchre FATIGUE You feel fully rested|melee|pole|\[You're
     matchwait

######################################
###                                ###
###      Dead monster routines     ###
###                                ###
######################################
DEAD_MONSTER:
     gosub clear
     match clear
     var SEARCHED YES
     var APPRAISED NO
     var LAST DEAD_MONSTER
     var dist missle
     var moveone none
     var movetwo none
     var movethree none
     var movefour none
     var movefive none
     if ("%BACKSTAB" = "ON") then
     {
          counter set 1300
          save 1300
     }
     if ("%RETREATING" = "ON") then gosub RETREAT_UNTRIGGERS
     if ("%THROWN" = "ON") then
     {
     if ((("%HAND" = "") && ("$righthand" = "Empty")) || (("%HAND" = "left") && ("$lefthand" = "Empty"))) then gosub GET_THROWN
     }
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** DEAD_MONSTER: ***
          echo
     }
     var LOCAL $GH_KILLS
     math LOCAL add 1
     put #var GH_KILLS %LOCAL
     if matchre ("$roomobjs", "(%skinnablecritters) ((which|that) appears dead|\(dead\))") then goto SKIN_MONSTER_$GH_SKIN
     if matchre ("$roomobjs", "(%nonskinnablecritters) ((which|that) appears dead|\(dead\))") then goto SEAR_MONSTER
     if matchre ("$roomobjs", "(%invasioncritters) ((which|that) appears dead|\(dead\))") then goto SEAR_MONSTER
     goto NO_MONSTER

######################################
###                                ###
###        Skinning routines       ###
###                                ###
######################################
SKIN_MONSTER_ON:
action remove eval $bleeding = 1
     var Monster $1
     if (toupper("$GH_SKIN_RET") = "ON") && ("%RETREATING" = "OFF")) then gosub RETREAT_TRIGGERS
SKIN_MONSTER:
     var LAST SKIN_MONSTER
     pause 1
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SKIN_MONSTER: ***
          echo
  }
    if ("%CURR_STANCE" = "Parry_Ability") then put stance evasion
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
          if ("$lefthand" != "Empty") then
          {
               gosub UNEQUIP_SHIELD
          }
     }
     GET_KNIFE:
          var LAST GET_KNIFE
          if ("%BELT_WORN" = "OFF") then
          {
               if ("%EMPTY_HANDED" != "ON") then
               {
                    if ("%RANGED" = "ON") then gosub RANGE_SHEATHE %CURR_WEAPON
                    else gosub SHEATHE %CURR_WEAPON
               }
               if ("$righthand" != "Empty") then gosub SHEATHE $righthandnoun
               if ("$lefthand" != "Empty") then gosub SHEATHE $lefthandnoun
               gosub WIELD_WEAPON knife
          }
          var LAST SKINNING
     ARRANGE_CHECK:
          if (toupper("$GH_ARRANGE") = "ON") then
          {
               var NUM_ARRANGES 0
               goto ARRANGE_KILL
          }
     SKINNING:
          if ("$lefthand" != "Empty") && ("%EXP2" = "Offhand_Weapon") then gosub SHEATHE $lefthandnoun
               action put #math GH_SKINS add 1 when into your bundle\.$
               matchre SKINNING ^You approach
               matchre DROPPED_SKINNER ^You'll need to have a bladed instrument
               matchre BUNDLE_OFF ^You must have one hand free to skin.
               matchre SKIN_FAIL ^A small slip at the last moment|^Some days it just doesn't pay to wake up|^A heartbreaking slip at the last moment renders your chances|manage to slice it to dripping tatters|You bumble the attempt|but only succeed in reducing|but end up destroying|You fumble and make an improper cut|Maybe helping little old Halfling widows across a busy Crossing street|You claw|twists and slips in your grip|^There isn't another|^Living creatures often object|Skin what\?|^Somehow managing to do EVERYTHING|^You hide|cannot be skinned
               matchre SKIN_KNIFE_SHEATH into your bundle\.$
               matchre SKIN_CHECK Roundtime
          put skin
          matchwait 15
          goto SKIN_ERROR

SKIN_CHECK:
     if (matchre("$lefthand","%CURR_WEAPON") && ("%EXP2" = "Offhand_Weapon")) then
     {
     gosub SHEATHE %CURR_WEAPON
     gosub SWAP_LEFT
     }
     if ("$lefthand" != "Empty") then goto SCRAPE_$GH_SCRAPE
     goto SCRAPE_$GH_SCRAPE
     }
     goto SCRAPE_$GH_SCRAPE
SKIN_FAIL:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SKIN_FAIL ***
          echo Skinning failed
          echo
     }
     goto SKIN_KNIFE_SHEATH
DROPPED_SKINNER:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** Dropped your skinning knife ***
          echo
     }
     pause 1
     put get knife
     goto SKINNING

ARRANGE_KILL:
     var ArrangeFail 0
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** ARRANGE_KILL: ***
          echo
     }
ARRANGING:
     math NUM_ARRANGES add 1
     if (%NUM_ARRANGES > $MAX_ARRANGE) then goto SKINNING
     var LAST ARRANGING
ARRANGEONLY:
     matchre SKIN_FAIL corpse is worthless now|Arrange what|^You might want to kill it first|so you can't arrange it either
     matchre SKINNING has already been arranged as much as you can manage|You complete arranging
     matchre ARRANGEONLY Roundtime
     matchre ARRANGEONLY That creature cannot produce
     if $GH_ARRANGE_ALL = ON then
          {
          put arrange all
          }
     else
          {
          put arrange
          }
     matchwait 4
     goto %LAST
ARRANGEIT:
     matchre SKIN_FAIL corpse is worthless now|Arrange what|^You might want to kill it first|so you can't arrange it either
     matchre SKINNING has already been arranged as much as you can manage|You complete arranging
     matchre ARRANGING Roundtime
          if $GH_ARRANGE_ALL = ON then
          {
          put arrange all for $GH_SKINPART
          }
     else
          {
          put arrange for $GH_SKINPART
          }
     matchwait 4
     goto %LAST

SCRAPE_ON:
     if ($Mechanical_Lore.LearningRate >= 34) then goto SCRAPE_OFF
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SCRAPE_ON: ***
          echo
     }
     var LAST SCRAPE_ON
     put loot $GH_SEARCH
     if matchre ("$lefthand", "skin|pelt|hide") then goto SCRAPING
     goto SCRAPE_OFF
     SCRAPING:
          var SKIN $0
          gosub SHEATHE $righthandnoun
          put loot $GH_SEARCH
     GET_SCRAPER:
          var LAST GET_SCRAPER
               matchre SCRAPE_CONT You get|You are already hold
               match SCRAPE_OFF What were you referring to?
          put get my scraper
          matchwait 30
          goto SKIN_ERROR
     SCRAPE_CONT:
          var LAST SCRAPE_CONT
               matchre SCRAPE_CONT cleaning some dirt and debris from it|you snag the scraper
               matchre SCRAPE_DONE Your %SKIN has been completely cleaned|going to help anything|looks as clean as you can make it.
          put scrape %SKIN with scraper quick
          matchwait 30
          goto SKIN_ERROR
     SCRAPE_DONE:
          put stow scraper
          waitfor You put

SCRAPE_OFF:
     goto BUNDLE_$GH_BUN

BUNDLE_ON:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BUNDLE_ON: ***
          echo
     }
     var LOCAL $GH_SKINS
     math LOCAL add 1
     put #var GH_SKINS %LOCAL
     var LAST BUNDLE_ON
          matchre HAVE_ONE ^You tap a lumpy bundle that you are wearing|^You tap a tight bundle that you are wearing
          matchre HAVE_ONE ^You tap a lumpy bundle|^You tap a tight bundle
          matchre CHECK_ROPE I could not find what you were|tight bundle inside
     put tap lump bundle
     matchwait 30
     goto SKIN_ERROR

CHECK_ROPE:
     var LAST CHECK_ROPE
          matchre GET_ROPE You tap
          matchre NO_MORE_ROPE I could not find|What were you
     put tap bund rope
     matchwait 30
     goto SKIN_ERROR
NO_MORE_ROPE:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** No more rope for bundling ***
          echo
     }
     put #echo >Log Red out of rope!
     put #var GH_BUN OFF
     put #parse GO.SELL.SKINS
     goto BUNDLE_OFF

GET_ROPE:
     var LAST GET_ROPE
     pause 1
     if ("$righthand" != "Empty") then gosub SHEATHE $righthandnoun
     if !matchre("$righthandnoun", "(%skinables)") then gosub stow right
GET_ROPE_CONT:
     ##CHECK HERE
     put get my bundling rope
     waitfor You get
     put bundle
     pause 1
     if toupper("$GH_TIE") = "ON" then gosub TIE_BUNDLE
     if toupper("$GH_WEAR") = "ON" then gosub WEAR_BUNDLE
     else
     {
     put drop bundle
     waitfor You drop
     }
     gosub stowing
     goto SKIN_REEQUIP
TIE_BUNDLE:
matchre TIE_BUNDLE ^Once you've
matchre return ^Using the
put tie my bundle
matchwait
HAVE_ONE:
     if ("$righthandnoun" != "Empty") then gosub SHEATHE $righthandnoun
     if ("$lefthand" = "Empty") then goto SKIN_REEQUIP
     put get bundle
     if toupper("$GH_WEAR") = "OFF" then put remove bundle
     waitforre You pick|You sling|You remove|But that is
     matchre TOO_HEAVY Time to start a new bundle|You try to stuff your
     matchre HAVE_ONE_CONT You stuff|not going to work|You carefully fit
     if toupper("$GH_WEAR") = "ON" then
     {
          put put my $lefthandnoun in my bundle
     }
     else
     {
          put put my $lefthandnoun in bundle
     }
     matchwait 15
     goto SKIN_ERROR
TOO_HEAVY:
     var LAST TOO_HEAVY
          match CHECK_ROPE You drop
          match GET_ROPE But you aren't holding that.
     put drop bundle
     matchwait 15
     goto SKIN_ERROR
HAVE_ONE_CONT:
     if toupper("$GH_WEAR") = "ON" && ("$righthandnoun" = "bundle" || "$lefthandnoun" = "bundle" then gosub WEAR_BUNDLE
     if toupper("$GH_WEAR") = "OFF" then
     {
          put drop bundle
          waitfor You drop
     }
     if ("%EMPTY_HANDED" = "ON") then goto SKIN_REEQUIP_DONE
     else goto SKIN_REEQUIP
WEAR_BUNDLE:
matchre PULL_BUNDLE ^You can't wear
matchre return ^You put|^You attach|^You sling|^You drape|^You are already wearing|Wear what\?
put wear my bundle
matchwait 5
goto SKIN_ERROR

PULL_BUNDLE:
matchre WEAR_BUNDLE_OFF over your shoulder\.$
matchre WEAR_BUNDLE around your waist\.$|on your back\.$|attached to your belt\.$|around your shoulders\.$
put pull my bundle
matchwait 5
goto SKIN_ERROR

WEAR_BUNDLE_OFF:
echo
echo *** CAN'T FIND LOCATION TO WEAR BUNDLE
echo *** WEAR_BUNDLE_OFF ***
echo
put #var GH_WEAR OFF
put #parse GO.SELL.SKINS
put drop my bundle
return

BUNDLE_OFF:
     if ("%GAG_ECHO" != "YES") then
     {

          echo
          echo *** BUNDLE_OFF ***
          echo
     }
     var LOCAL $GH_SKINS
     math LOCAL add 1
     put #var GH_SKINS %LOCAL
     if matchre("$righthandnoun", "(%skinables)") then put empty right
     pause 0.1
     if matchre("$lefthandnoun", "(%skinables)") then put empty left
     pause 0.1
     #if ("$lefthand" != "Empty") then put empty left
     pause 0.1
SKIN_KNIFE_SHEATH:
     var LAST SKIN_KNIFE_SHEATH
     action remove into your bundle\.$
     if ("$righthand" = "belt knife") then put wear knife
     if ("$righthandnoun" = "knife") then gosub SHEATHE knife
     if ("$lefthandnoun" = "knife") then gosub SHEATHE knife
     goto SKIN_REEQUIP

SKIN_REEQUIP:
     var LAST SKIN_REEQUIP
     if ("%EMPTY_HANDED" != "ON") then
     {
          if ("$righthand" = "Empty") then gosub WIELD_WEAPON %CURR_WEAPON
          if (("%HAND" = "left") && ("$righthand" != "Empty")) then gosub SWAP_LEFT $righthandnoun
     }
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
          if ("$lefthand" = "Empty") then
          {
               gosub EQUIP_SHIELD
          }
     }
     if ("%RETREATING" = "ON") then gosub RETREAT_UNTRIGGERS
     goto SKIN_REEQUIP_DONE

######################################
###                                ###
###        Looting routines        ###
###                                ###
######################################
SKIN_MONSTER_OFF:
SEAR_MONSTER:
     var Monster $1
SKIN_REEQUIP_DONE:
     pause 0.5
     gosub clear
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** SEAR_MONSTER: ***
          echo
     }
     var LAST SKIN_REEQUIP_DONE
          matchre TIMER_$GH_TIMER ^I could not find what|not dead
          matchre SEARCH_OTHER_MONSTER ^Sheesh
          matchre LOOT_$GH_LOOT ^You search|^You shove your arm|^Roundtime|picked clean of anything|^You should probably wait until|has already been searched
##CHECK HERE JUST LOOT
     put loot $GH_SEARCH
     matchwait 20
     goto LOOT_ERROR

LOOT_OFF:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** Not looting ***
          echo
     }
     goto LOOT_DONE

LOOT_ON:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** Looting ***
          echo
     }
     var LAST LOOT_ON
     if matchre("$lefthandnoun","%AMMO") then put stow left
     if matchre("$lefthand","%AMMO") then put stow left
     pause 0.1
     if (matchre("$roomobjs", "%AMMO") then gosub RANGED_CLEAN
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
          if ("%HAND" != "left") && ("$lefthand" != "Empty") then
          {
               gosub UNEQUIP_SHIELD
               put stow left
               pause 0.5
          }
          if ("%HAND" = "left") && ("$righthand" != "Empty") then
          {
               gosub UNEQUIP_SHIELD
               put stow right
               pause 0.5
          }
     }
     gosub stowAmmo
     if matchre("$lefthandnoun","%AMMO") then put stow left
     if matchre("$lefthand","%AMMO") then put stow left
     if matchre ("$roomobjs", "(map|treasure map)") then goto GET_MAP
     goto LOOT_BOX_$GH_LOOT_BOX

LOOT_BOX_ON:
     if matchre ("$roomobjs", "(%boxtype) (%boxes)") then goto GET_BOX
LOOT_BOX_OFF:
     goto LOOT_GEM_$GH_LOOT_GEM

LOOT_GEM_ON:
     if (matchre ("$roomobjs", "\b(%gems1|%gems2|%gems3|%gems4|%gweths)\b(,|\.| and)")) then goto GET_GEM
LOOT_GEM_OFF:
     if matchre ("$roomobjs", "\b(%collectibles)\b") then goto GET_COLLECTIBLE
    if matchre ("$roomobjs", "\ba.*\sgwethdesuan\b") then goto GET_COLLECTIBLE
     goto LOOT_COLLECTIBLE_$GH_LOOT_COLL

LOOT_COLLECTIBLE_ON:
     if matchre ("$roomobjs", "\b(%collectibles)\b") then goto GET_COLLECTIBLE
LOOT_COLLECTIBLE_OFF:
     goto LOOT_COIN_$GH_LOOT_COIN

LOOT_COIN_ON:
     if matchre ("$roomobjs", "(coin|coins)") then goto GET_COIN
LOOT_COIN_OFF:
     goto LOOT_JUNK_$GH_LOOT_JUNK

LOOT_JUNK_ON:
     if matchre ("$roomobjs", "(%junkloot)") then goto GET_JUNK
LOOT_JUNK_OFF:
     goto NO_LOOT

GET_MAP:
     put stow map
     put #echo >Log Lime #####################################################
     put #echo >Log Lime #########   YOU GOT A TREASURE MAP!!!!!    ##########
     put #echo >Log Lime #####################################################
     pause 0.5
     goto LOOT_BOX_$GH_LOOT_BOX

GET_BOX:
pause 0.5
     var BOX $0
     var LOOTED YES
STOW_BOX:
pause 0.5
     var LAST STOW_BOX
          matchre NO_MORE_ROOM_BOX any more room in|^You just can't get|too heavy
          matchre LOOT_BOX_ON ^You put your|^Stow what|I could
          matchre OPEN_CONT ^But that's closed
          matchre LOOT_GEM_$GH_LOOT_GEM ^That can't be picked up
     put stow %BOX in my %DEFAULT_CONTAINER
     matchwait 15
     goto LOOT_ERROR

STOW_BOX2:
     var LAST STOW_BOX2
          matchre NO_MORE_ROOM_BOX any more room in|^You just can't get|too heavy
          matchre LOOT_BOX_ON ^You put your|^Stow what|I could
          matchre OPEN_CONT ^But that's closed
          matchre LOOT_GEM_$GH_LOOT_GEM ^That can't be picked up
     put stow %BOX in my %BOX_CONTAINER
     matchwait 15
     goto LOOT_ERROR

NO_MORE_ROOM_BOX:
     if matchre ("$righthandnoun", "(%boxes)") then put stow right in my %GEM_CONTAINER
     if matchre ("$lefthandnoun", "(%boxes)") then put stow left in my %GEM_CONTAINER
     else put stow left in my %DEFAULT_CONTAINER;stow right in my %DEFAULT_CONTAINER
     waitforre ^You drop|^What were you|You put|STOW|You stow|^There isn't|^You just
     if matchre ("$righthandnoun", "(%boxes)") then put empty right
     if matchre ("$lefthandnoun", "(%boxes)") then put empty left
    gosub stowAmmo
     put #var GH_LOOT_BOX OFF
     put #Beep
     put #parse BAGS.FULL
     put #parse GO.PICK.BOXES
     put #parse GO.PICK.BOXES
     goto DONE

OPEN_CONT:
     put open %DEFAULT_CONTAINER
     put open %BOX_CONTAINER
     pause 0.1
     goto STOW_BOX

GET_GEM:
     var GEM $1
     var LOOTED YES
     if contains("%GEM", "stone") then
     {
          goto LOOT_GEM_ALT
     }

STOW_GEM:
     pause 0.1
     pause 0.1
     pause 0.1
     var LAST STOW_GEM
     put get %GEM
     matchre STOW_GEM_EMPTY You'll need to be holding
     matchre LOOT_GEM_ON ^You put your|^You open your|closing it once more|^I could not|^But that is already
     matchre LOOT_GEM_ALT That can't be picked up|Perhaps you should be holding|What were you
     matchre TIE_POUCH You'd better tie it up|^You've already got a wealth of gems|^You just can't get|^There isn't any more room
     matchre FULL_POUCH ^You can't fit anything else|^You think the gem pouch is too full to fit another gem
     matchre NO_ROOM_GEM is too long to fit in the pouch
     matchre NOT_A_GEM ^But that's closed
     put put %GEM in my gem pouch
     matchwait 15
     goto LOOT_ERROR

STOW_GEM_EMPTY:
GOSUB stowing
goto STOW_GEM

LOOT_GEM_ALT:
    GOSUB stow left
     put stow gem
     waitforre ^You pick|^You put|^What were you|^I could not|You open|^What|STOW HELP
     pause 0.1
     goto LOOT_GEM_ON

TIE_POUCH:
     if "$lefthand" = %gweths then put drop left
     if "$lefthand" != empty then put stow left
     pause
     put stow my %GEM
     wait
     pause 0.1
     put get my gem pouch
     put tie my gem pouch
     wait
     pause 0.1
     put stow my pouch
     pause 0.2
     send get second gem pouch
     send tie pouch
     pause 0.2
     send stow my pouch
     goto STOW_GEM

FULL_POUCH:
     pause 0.1
     send drop my %GEM
     pause 0.5
     if "$lefthand" != empty then put stow left
     wait
     pause 0.1
     pause 0.1
     send get my gem pouch
     pause 0.2
     pause 0.1
     send open my %GEMPOUCH_CONTAINER
     pause 0.5
     pause 0.2
     put put my pouch in my %GEMPOUCH_CONTAINER
     put close my %GEMPOUCH_CONTAINER
     pause 0.5
     goto STOW_GEM

NOT_A_GEM:
NO_ROOM_GEM:
     put drop my %GEM
     waitforre You drop|What were you|You'll need to be holding
     put #var GH_LOOT_GEM OFF
     goto LOOT_COIN_$GH_LOOT_COIN

GET_COLLECTIBLE:
     var ITEM $0
     var LOOTED YES
STOW_COLLECTIBLE:
     var LAST STOW_COLLECTIBLE
          match BLEED.CHECK needs to be tended
          matchre NO_MORE_ROOM_COLLECTIBLE any more room in|^Stow what|^You just can't get|^But that's closed|^But that is already
          matchre LOOT_COLLECTIBLE_ON ^You put your
     if matchre("$roomobjs","leafhead bolt") then
     {
     put stow bolt
     matchwait 20
     }
     put stow %ITEM in my %GEM_CONTAINER
     matchwait 20
     goto LOOT_ERROR

NO_MORE_ROOM_COLLECTIBLE:
     if matchre ("$righthandnoun", "(%collectibles)") then put empty right
     else put empty left
     waitforre ^You drop|^What were you|is already empty
     put #var GH_LOOT_COLL OFF
     goto LOOT_COIN_$GH_LOOT_COIN

GET_COIN:
     var LAST GET_COIN
     put get coin
     waitforre ^You pick up|^What were you
     goto LOOT_COIN_ON

GET_JUNK:
     var JUNK $0
     var LOOTED YES
STOW_JUNK:
     var LAST STOW_JUNK
          matchre  NO_MORE_ROOM_JUNK any more room in|^Stow what|^You just can't get|^But that's closed
          matchre LOOT_JUNK_ON ^You put your
     put stow %JUNK in my %JUNK.CONTAINER
     matchwait 30
     goto LOOT_ERROR

NO_MORE_ROOM_JUNK:
     put drop %JUNK
     waitforre ^You drop|^What were you
     put #var GH_LOOT_JUNK OFF
     goto NO_LOOT

TOO_DARK:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** It's too dark to see anything ***
          echo
     }
     goto TIMER_$GH_TIMER

NO_MONSTER:
          echo
          echo ***        No recognizable monsters.         ***
          echo
     put loot
     goto TIMER_$GH_TIMER

NO_LOOT:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** No Loot ***
          echo
     }
     if ("%LOOTED" = "YES") then
     {
          var LOCAL $GH_LOOTS
          math LOCAL add 1
          put #var GH_LOOTS %LOCAL
          var LOOTED NO
     }
LOOT_DONE:
##CHECK HERE DELETE LINE BELOW
action goto BLEEDING when eval $bleeding = 1
     var LAST LOOT_DONE
     if ("%RANGED" = "ON") then
          if matchre("$roomobjs", "%AMMO") then gosub RANGED_CLEAN
     if ("%THROWN" = "ON") then
          if matchre("$roomobjs", "%CURR_WEAPON") then gosub THROWN_CLEAN
     if ("%CURR_STANCE" = "Parry_Ability") then put stance parry
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
          if ("$lefthand" = "Empty") then
          {
               gosub EQUIP_SHIELD
          }
     }
     if ((toupper("$GH_RETREAT") = "ON") && ("%RETREATING" = "OFF")) then gosub RETREAT_TRIGGERS
     gosub BLEEDERCHECK
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     #if ("$righthand" = "Empty") then gosub WIELD_WEAPON %CURR_WEAPON
     goto TIMER_$GH_TIMER

######################################
###                                ###
###   Experience check routines    ###
###                                ###
######################################

TIMER_ON:
     if (%t > (%MAX_TRAIN_TIME)) then goto SWITCH_WEAPON
     if ("%LAST" = "CHECK_FOR_MONSTER") then return
TIMER_OFF:
     goto EXPCHECK_$GH_EXP

EXPCHECK_ON:
     if ("%BLEEDING" = "ON") || ("%HURT" = "ON") then goto BLEEDING
     if ("%ALTEXP" = "ON") then
          {
               if (($%EXP2.LearningRate > 33) && ($%WEAPON_EXP.LearningRate > 33)) then goto SWITCH_WEAPON
          }
     else if ($%WEAPON_EXP.LearningRate > 33) then goto SWITCH_WEAPON
EXPCHECK_OFF:
     var LAST EXPCHECK_OFF
     if (toupper("$GH_STANCE") = "ON")) then gosub SWITCH_STANCE
     put #statusbar 1 GH - Kills:$GH_KILLS  Skins:$GH_SKINS  Loots:$GH_LOOTS
     if ("%SEARCHED" = "YES") then goto FACE
     else goto %c



SWITCH_STANCE:
     if ($%CURR_STANCE.LearningRate < 30) then return
     if ($Shield_Usage.LearningRate >= 30) && ($Evasion.LearningRate >= 30) && ($Parry_Ability.LearningRate >= 30) then return
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo ***     SWITCH_STANCE:    ***
          echo *** Current stance locked ***
          echo
     }
     if ("%CURR_STANCE" = "Evasion") then
     {
          if ("%NOSHIELD" = "OFF") && ($Shield_Usage.LearningRate < 30) then
          {
               send stance shield
               waitfor You are now set to use
               var CURR_STANCE Shield_Usage
          } else
     if ("%NOPARRY" = "OFF") && ($Parry_Ability.LearningRate < 30) then
          {
               send stance parry
               waitfor You are now set to use
               var CURR_STANCE Parry_Ability
          }
     } elseif ("%CURR_STANCE" = "Shield_Usage") then
     {
          if ("%NOPARRY" = "OFF") && ($Parry_Ability.LearningRate < 30) then
          {
               send stance parry
               waitfor You are now set to use
               var CURR_STANCE Parry_Ability
          } else
     if ($Evasion.LearningRate < 33) then
          {
               send stance evasion
               waitfor You are now set to use
               var CURR_STANCE Evasion
          }
     } elseif ("%CURR_STANCE" = "Parry_Ability") then
     {
          if ("%NOEVADE" = "OFF") && ($Evasion.LearningRate < 30) then
          {
               send stance evasion
               waitfor You are now set to use
               var CURR_STANCE Evasion
          } else
     if ($Shield_Usage.LearningRate < 30) then
          {
               send stance shield
               waitfor You are now set to use
               var CURR_STANCE Shield_Usage
          }
     }
     return

SWITCH_WEAPON:
     pause 0.1
     var LAST SWITCH_WEAPON
     put #math Multi_Loop add 1
     if ("%GAG_ECHO" != "YES") then
     {
               echo
               echo *** SWITCH_WEAPON
               echo *** Weapon skill locked ***
               echo
     }
     put stance evasion
     wait
     put #playsystem Open
     pause 0.1
     if matchre("$righthand","(staff sling|sling)") then gosub SWAP.SLING
     if matchre("$lefthand","(staff sling|sling)") then gosub SWAP.SLING
     send stow %CURR_WEAPON
     pause 0.5
     gosub ARMOR.CHECK
     gosub stowAmmo
     if ("%EMPTY_HANDED" != "ON") then
     {
          if ("%RANGED" = "ON") then
          {
               action remove You think you have your best shot possible
               action remove stop concentrating on aiming
               gosub RANGE_SHEATHE
               if (matchre("$roomobjs", "%AMMO\b")) then gosub RANGED_CLEAN
               if ("%REM_SHIELD" != "NO") then
               {
                    pause 1
                    put get %REM_SHIELD
                    waitforre You get a|You remove|But that is|You sling|You slide|What
                    put wear %REM_SHIELD
                    waitforre You slide|You sling|You are already|What|You
               }
          } else
          {
               put ret
               #gosub SHEATHE %CURR_WEAPON
               gosub STOW
          }
     }
     if ("%SHIELD" != "NONE") && ("%REM_SHIELD" != "NO") then
     {
          gosub UNEQUIP_SHIELD
     }
     if ("%SORT" = "ON") then gosub FINISH.WEAPON
     if (toupper("$GH_MULTI") != "OFF") then
     {
          if ($GH_MULTI_CURR_NUM < $GH_MULTI_NUM) then
          {
               var TEMP $GH_MULTI_CURR_NUM
               math TEMP add 1
               put #var GH_MULTI_CURR_NUM %TEMP
          }
          else
          {
               put #var GH_MULTI_CURR_NUM 1
          }
          if (toupper("$GH_MULTI") = "MULTI") then put .hunter multi $GH_MULTI_$GH_MULTI_CURR_NUM
          else goto DMULTI_$GH_MULTI_CURR_NUM
     } else goto DONE


################################
# BLEEDER CHECK/TENDING SYSTEM
################################
BLEEDERCHECK:
BLEEDER.CHECK:
bleedcheck:
if "$righthandnoun" = "arrow" then put drop arrow
if "$lefthandnoun" = "arrow" then put drop arrow
if "$righthand" = "crossbow bolt" then put drop bolt
if "$lefthand" = "crossbow bolt" then put drop bolt
pause 0.01
action goto bleedcheck when The bandages binding your (.+) soak through with blood becoming useless and you begin bleeding again\.
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
action var BLEEDING_HEAD YES when into your head
action var BLEEDING_HEAD YES when in your head
action var BLEEDING_NECK YES when into your neck
action var BLEEDING_NECK YES when in your neck
action var BLEEDING_CHEST YES when into your chest
action var BLEEDING_CHEST YES when in your chest
action var BLEEDING_ABDOMEN YES when into your abdomen
action var BLEEDING_ABDOMEN YES when in your abdomen
action var BLEEDING_BACK YES when into your back
action var BLEEDING_BACK YES when in your back
action var BLEEDING_R_ARM YES when into your right arm
action var BLEEDING_R_ARM YES when in your right arm
action var BLEEDING_L_ARM YES when into your left arm
action var BLEEDING_L_ARM YES when in your left arm
action var BLEEDING_R_LEG YES when into your right leg
action var BLEEDING_R_LEG YES when in your right leg
action var BLEEDING_L_LEG YES when into your left leg
action var BLEEDING_L_LEG YES when in your left leg
action var BLEEDING_R_HAND YES when into your right hand
action var BLEEDING_R_HAND YES when in your right hand
action var BLEEDING_L_HAND YES when into your left hand
action var BLEEDING_L_HAND YES when in your left hand
action var BLEEDING_L_EYE YES when into your left eye
action var BLEEDING_L_EYE YES when in your left eye
action var BLEEDING_R_EYE YES when into your right eye
action var BLEEDING_R_EYE YES when in your right eye
action var POISON YES when ^You.+(poisoned)
action var POISON YES when ^You.+(poisoned)

bleedyes:
if "$righthandnoun" = "arrow" then put drop arrow
if "$lefthandnoun" = "arrow" then put drop arrow
if "$righthand" = "crossbow bolt" then put drop bolt
if "$lefthand" = "crossbow bolt" then put drop bolt
pause 0.01
pause 0.01
echo [Checking for Bleeders]
matchre yesbleeding Bleeding|in your|into your
matchre END.OF.BLEEDER ^You pause a moment|^The THINK verb|Syntax
match bleedyes It's all a blur!
pause 0.1
send health
send think
matchwait 5
echo [No bleeder found - exiting bleeder check]
goto END.OF.BLEEDER

yesbleeding:
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

tend:
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
     pause 0.1
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
return


SWAP.SLING:
pause 0.1
put stow my sling
put get my second sling
pause 0.2
pause 0.1
RETURN

REMOVE.PLATE:
var LAST REMOVE.PLATE
pause 0.1
gosub put rem my gaunt
pause 0.1
gosub put stow gaunt
pause 0.1
gosub put get my glove
pause 0.1
gosub put wear my glove
pause 0.1
gosub put rem my grea
pause 0.1
gosub put stow grea
pause 0.1
gosub put get my reinforced greave
pause 0.1
gosub put wear my greav
pause 0.1
RETURN

WEAR.PLATE:
var LAST WEAR.PLATE
pause 0.1
gosub put rem my glove
pause 0.1
gosub put stow my glove
pause 0.1
gosub put get my gaunt
pause 0.1
gosub put wear my gaunt
pause 0.1
gosub put rem my grea
pause 0.1
gosub put stow my grea
pause 0.1
gosub put get my mail greav
pause 0.1
gosub put wear my grea
pause 0.1
RETURN

ARMOR.CHECK:
if ("%ARMOR.SWAP" != "YES") then RETURN
echo
echo **** CHECKING ARMOR..................
echo
send ret
pause 0.1
if "$current.armor.hands" = "%ARMOR2" then goto CHAIN.EXP
if "$current.armor.hands" = "%ARMOR4" then goto PLATE.EXP
RETURN

CHAIN.EXP:
var next.armor.hands %ARMOR4
var next.armor.head %ARMOR5
if ($Chain_Armor.LearningRate > 20) && ($Brigandine.LearningRate < 30) then goto SWAP.ARMOR
if ($Chain_Armor.LearningRate > 20) && ($Plate_Armor.LearningRate < 30) then goto SWAP.ARMOR
if ($Light_Armor.LearningRate > 20) && ($Brigandine.LearningRate < 30) then goto SWAP.ARMOR
if ($Light_Armor.LearningRate > 20) && ($Plate_Armor.LearningRate < 30) then goto SWAP.ARMOR
if $Multi_Loop > 5 then goto SWAP.ARMOR
echo *** DONE
RETURN

PLATE.EXP:
var next.armor.hands %ARMOR2
var next.armor.head %ARMOR3
if ($Brigandine.LearningRate > 20) && ($Chain_Armor.LearningRate < 30) then goto SWAP.ARMOR
if ($Brigandine.LearningRate > 20) && ($Light_Armor.LearningRate < 30) then goto SWAP.ARMOR
if ($Plate_Armor.LearningRate > 20) && ($Chain_Armor.LearningRate < 30) then goto SWAP.ARMOR
if ($Plate_Armor.LearningRate > 20) && ($Light_Armor.LearningRate < 30) then goto SWAP.ARMOR
if $Multi_Loop > 5 then goto SWAP.ARMOR
echo *** DONE
RETURN

SWAP.ARMOR:
echo
echo *** SWAPPING ARMOR! ***
echo
gosub stowing
pause 0.1
pause 0.1
put ret
pause 0.1
gosub rem my $current.armor.hands
wait
pause 0.1
pause 0.2
gosub stowing
pause 0.1
gosub rem my $current.armor.head
wait
pause 0.1
pause 0.2
gosub stowing
pause 0.1
pause 0.1
put ret
pause 0.5
gosub get my %next.armor.hands
gosub wear my %next.armor.hands
wait
pause 0.2
pause 0.1
gosub get my %next.armor.head
gosub wear my %next.armor.head
wait
pause 0.2
pause 0.1
gosub stowing
pause 0.1
put #var current.armor.hands %next.armor.hands
put #var current.armor.head %next.armor.head
put #var Multi_Loop 0
put #save all
echo *** DONE.
RETURN

BLEEDING:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** BLEEDING: ***
          echo You are bleeding
          echo Retreating to check health
          echo
     action remove eval $bleeding = 1
     action var INFECTED YES when ^You.+(infect|disease)
     pause 0.2
     put stance evasion
     pause 0.1
     var GOING_TO %c
     var INFECTED NO
     goto HEALTH_CHECK

STUNNED:
     if ("%GAG_ECHO" != "YES") then
     {
          echo
          echo *** STUNNED: ***
          echo You have been stunned.
          echo Retreating to check health.
          echo
     }
     action remove eval $stunned = 1
     var GOING_TO %c
HEALTH_CHECK:
     pause 0.1
     gosub clear
          matchre ABORT ^Bleeding
          matchre HEALTH_CHECK pole|^You are still stunned
          matchre CHECKING_HEALTH ^You retreat from combat|^You try to back away|already as far away as you can get|^You try to sneak|^You sneak|^You have no
     put heal
     put retreat
     matchwait 10
CHECKING_HEALTH:
     if ("%INFECTED" = "YES") then goto INFECTED
     if ($health >= 75) then
     {
          echo
          echo Not too beat up, returning to combat
          echo Be careful!
          echo
          action remove ^You.+(infect|disease)
          var HURT OFF
          var BLEEDING OFF
          action goto BLEEDING when eval $bleeding = 1
          action goto STUNNED when eval $stunned = 1
          goto %GOING_TO
     } else
     {
          echo
          echo Too beat up, aborting
          echo
          goto ESCAPE
     }

INFECTED:
     echo
     echo Your wounds are infected, seek medical attention!!!
     echo
     put #beep
     goto ESCAPE

DROPPED_WEAPON:
     pause
     if "$righthand" = "belt knife" then put wear knife
    GOSUB stowing
    put get %CURR_WEAPON
    put rem %CURR_WEAPON
     pause 0.5
     if "%HAND" = "left" and "$lefthand" = "Empty" then put swap
     goto %c

ABORT:
     gosub RETREAT_TRIGGERS
ABORTING:
          echo
          echo *** ABORT: ***
          echo
     echo Injured badly, you need medical assistance
     if ("%DYING" = "ON") then
     {
          goto ESCAPE
     }
     if ($health <= 40) then goto DEAD
     put #beep
     goto ESCAPE

ESCAPE:
GOSUB CLEAR
echo
echo ***      ESCAPE!     ***
echo *** YOU ARE TOO HURT!   ***
echo *** ATTEMPTING TO FLEE!  ***
echo
if $roundtime > 0 then pause
pause 0.5
if $stunned = 1 then goto ESCAPE
send khri stop prowess hasten shadowstep darken steady strike
pause 0.5
pause 0.1
pause 0.1
put khri silence
pause 0.3
pause 0.1
put #parse ESCAPE.PLZ
put #parse 123456
put #parse ESCAPE.PLZ
put retreat
pause 0.1
pause 0.1
exit

DEAD:
          echo
          echo *** DEAD: ***
          echo
          echo You are dead, or about to be
     if ("%DYING" = "ON") then
     {
          put look sword
          pause 0.5
          put look sword
     }
     put #beep
     put #beep
     put #beep
     exit

NO_VALUE:
          echo
          echo *** NO_VALUE: ***
          echo
     echo Basic use of script .hunter <weapon>
     goto ERROR.RECOVERY

FINISH.WEAPON:
     echo
     echo ***  HUNTER DONE:  ***
     echo
     gosub stowing
     gosub stowAmmo
     if ((toupper("$GH_AMBUSH") = "ON") && ("%NOOB" = "ON")) then gosub WEAR.PLATE
     if ("%SNIPE") = "ON") && ("%NOOB" = "ON")) then gosub WEAR.PLATE
     put #parse GH WEAPON FINISHED
     echo *** GH WEAPON FINISHED ***
     pause
     put #parse GH WEAPON FINISHED
     RETURN
DONE:
     if (matchre("$roomobjs", "%AMMO\b")) then gosub RANGED_CLEAN
     echo
     echo ***  HUNTER DONE:  ***
     echo
     gosub stowAmmo
     pause
     put #parse HUNTER DONE
     put HUNTER DONE
     pause 0.5
     put glance
     put look
     pause 0.5
     pause 0.5
     pause 0.5
     goto ERROR.RECOVERY


#### PUT SUB
PUT:
     delay 0.0001
     var command $0
     var LOCATION PUT.1
     PUT.1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre PUT_STOW ^You need a free hand
     matchre WAIT ^\[Enter your command again if you want to\.\]
     matchre RETURN_CLEAR ^But that
     matchre RETURN_CLEAR ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre RETURN_CLEAR ^I could not find what you were referring to\.
     matchre RETURN_CLEAR ^Please rephrase that command\.
     matchre RETURN_CLEAR ^That is already|has already
     matchre RETURN_CLEAR ^What were you referring to\?
     matchre RETURN_CLEAR ^.* what\?
     matchre RETURN_CLEAR ^You (?:hand|slide|get|work|pull|shuffle|attach|push|move|put|remove|wear|sling|whisper|lean|tap|pick|silently|slip|realize|stop|open|close|drop|place|knock|grab|fade|toss|set|add|offer|search|circle|fake|weave|shove|tie|try|must|wave|sit|fail|turn|are|can't|aren't|glance|bend|kneel|carefully|quietly|sense|begin|rub|sprinkle) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^You sense that you are as pure of spirit as you can be\, and you are ready for whatever rituals might face you\.
     matchre RETURN_CLEAR ^Subservient type|^The shadows|^Close examination|^Try though
     matchre RETURN_CLEAR ^USAGE\:
     matchre RETURN_CLEAR ^Allows a Moon Mage
     matchre RETURN_CLEAR ^A slit across the door
     matchre RETURN_CLEAR ^Your (?:actions|dance).*\.
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
     matchre RETURN_CLEAR ^Ylono (?:looks|frowns|smiles) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Malik (?:nods|shakes) .*(?:\.|\!|\?)
     matchre RETURN_CLEAR ^Obvious exits
     matchre RETURN_CLEAR ^Obvious paths
     matchre RETURN_CLEAR ^But the merchant can't see you|are invisible
     matchre STAND ^You should stand up first\.
     # matchre RETURN_CLEAR ^
     matchre RETURN ^\s*Encumbrance\s*\:
     send %command
     matchwait 15
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN PUT! ***
     put #echo >$Log Crimson $datetime Command = %command
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
     matchre RETURN ^You (?:get|grab|pick|carefully|are already) .*(?:\.|\!|\?)?
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
     matchre STOWING ^You aren't wearing
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
     matchre RETURN ^You (?:put|drop|set|carefully) .*\.
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
#################################
##                             ##
##  General Utility functions  ##
##                             ##
#################################
PAUSE:
     pause
     goto %LAST

HUM_STOP:
     pause
     put stop hum
     goto %LAST

DYING:
     var DYING ON
     return

DISARM_ORB:
put #send disarm orb
waitforre ^Roundtime
pause 0.5
return

#### RETURNS
RETURN:
     delay 0.0001
     RETURN
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     RETURN

#### CATCH AND RETRY SUBS
WAIT:
     delay 0.0001
     pause 0.1
     if (!$standing) then gosub standup
     goto %LOCATION
IMMOBILE:
     delay 0.0001
     if contains("$prompt" , "I") then pause 20
     if (!$standing) then gosub standup
     goto %LOCATION
CALMED:
     delay 5
     if ($stunned) then waiteval (!$stunned)
     if (!$standing) then gosub standup
     goto %LOCATION

########################
# GOSUBS
########################

ANALYZE.MOB:
     var LAST ANALYZE.MOB
     echo
     echo *** ANALYZE ***
     echo
     gosub get_monster_name
     if $roundtime > 0 then pause
     pause 0.1
     pause 0.1
     matchre ANALYZEDONE ^Roundtime
     matchre ANALYZE_ASSESS ^You must be closer
     matchre RETURN ^Analyze what|^You fail to find any
     put analyze %monster1
     matchwait 10
     goto ANALYZE.MOB

ANALYZE_ASSESS:
var LAST ANALYZE_ASSESS
pause 0.1
pause 0.2
put assess
pause
pause 0.5
pause 0.5
     matchre ANALYZEDONE ^Roundtime
     matchre ADVANCE ^You must be closer
     matchre FACE ^Analyze what|^You fail to find any
     put analyze %G_AppTarget
     matchwait 10
     goto ANALYZE.MOB

ANALYZEDONE:
pause 0.1
pause 0.1
pause 0.5
if $roundtime > 0 then pause
put #echo *** Moves! %moveone, %movetwo, %movethree, %movefour, %movefive
pause 0.1
if "%moveone" != "none" then gosub COMBAT_COMMAND %moveone $GH_TARGET
if "%movetwo" != "none" then gosub COMBAT_COMMAND %movetwo $GH_TARGET
if "%movethree" != "none" then gosub COMBAT_COMMAND %movethree $GH_TARGET
if "%movefour" != "none" then gosub COMBAT_COMMAND %movefour $GH_TARGET
if "%movefive" != "none" then gosub COMBAT_COMMAND %movefive $GH_TARGET
var moveone none
var movetwo none
var movethree none
var movefour none
var movefive none
var lastmaneuver %_COMBO1
RETURN

empty:
if "$lefthand" != "Empty" then put empty left
if "$righthand" != "Empty" then put empty right
return

stop.humming:
var location stop.humming
stop.humming1:
matchre return ^You stop playing your song\.
matchre return ^In the name of love\?
put stop hum
GOTO retry

retry:
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
matchwait

unload:
var location unload
matchre return ^You unload the
matchre return ^You remain concealed by your surroundings, convinced that your unloading
matchre return ^Roundtime:
matchre return ^But your
matchre return ^You don't have a
matchre return ^You can't unload such a weapon\.
matchre return ^Your
matchre return isn't loaded\!
put unload
GOTO retry

unload.it:
put unload
pause 0.1
pause 0.1
goto STOW

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

location.p:
pause

location:
pause 0.3
goto %location

return.p:
pause 0.1
return


#################################
# MOVEMENT GOSUBS
#################################
automove:
var toroom $1
automovecont:
matchre automove.return YOU HAVE ARRIVED|SHOP CLOSED
match automovecont YOU HAVE FAILED
put #goto %toroom
matchwait

automove.return:
pause 0.1
pause 0.1
pause 0.1
RETURN


move:
var alsohere no
var People.Room empty
var critter no
var todo $0
var move.direction $0
move1:
var location moving1
 moving1:
 matchre stand.then.move ^You must be standing to do that\.|^You can't do that while lying down\.|^Stand up first\.|You can't do that while kneeling\.
 matchre pause.then.move %retry.command.triggers|You are too tired|All this climbing back and forth is getting a bit tiresome|^You work against the current
 matchre retreat.from.melee.then.move ^You are engaged to .+ melee range\!|^You try to move, but you're engaged\.|While in combat
 matchre retreat.from.pole.then.move ^You are engaged to .+ at pole weapon range\!|^While in combat\?|You'll have better luck if you first retreat\.
 matchre Dig.then.move ^You struggle forward
 matchre Dig.then.move ^Like a blind, lame duck, you wallow in the mud
 matchre Dig.then.move ^The mud holds you tightly
 matchre Dig.then.move ^You find yourself stuck in the mud
 matchre stow.then.move ^Free up your hands first
 matchre move.return ^Obvious|It's pitch dark and you can't see a thing
 matchre move.error ^You can't go there\.|^You can't swim in that direction\.
 put %move.direction
GOTO retry
 stand.then.move:
 gosub standup
 goto moving1
 pause.then.move:
 pause 0.2
 goto moving1
 retreat.from.melee.then.move:
 put retreat
 retreat.from.pole.then.move:
 gosub standup
 put retreat
 goto moving1
 move.error:
 echo * Bad move direction, will try next command in 1 second. *
 put .alert
 pause
 return
 move.return:
 pause 0.1
 return
 Dig.then.move:
 pause 0.1
 put dig %move.direction
 pause 0.5
 pause 0.5
 goto moving1
 stow.then.move:
 GOSUB stowing
 goto moving1

ROOM.CHECK:
if "$roomid" = "0" then gosub moveRandomDirection
pause 0.5
RETURN

moveRandomDirection:
 gosub move look
 if $north then
 {
 gosub move north
 put #parse MOVED
 return
 }
 if $northeast then
 {
 gosub move northeast
 put #parse MOVED
 return
 }
 if $east then
 {
 gosub move east
 put #parse MOVED
 return
 }
 if $southeast then
 {
 gosub move southeast
 put #parse MOVED
 return
 }
 if $south then
 {
 gosub move south
 put #parse MOVED
 return
 }
 if $southwest then
 {
 gosub move southwest
 put #parse MOVED
 return
 }
 if $west then
 {
 gosub move west
 put #parse MOVED
 return
 }
 if $northwest then
 {
 gosub move northwest
 put #parse MOVED
 return
 }
 if $out then
 {
 gosub move out
 put #parse MOVED
 return
 }
 #if $up then
 {
 gosub move up
 put #parse MOVED
 return
 }
 #if $down then
 {
 gosub move down
 put #parse MOVED
 return
 }
 echo * NO DIRECTION FOUND! *
 put .alert
 put #parse NO MOVE
 return

### MONSTERLIST CHECK
get_monster_name:
# OLD VERSION - NOT WORKING RIGHT NOW
var monsters $monsterlist
eval monsters replace("%monsters", ", ", "|")
eval monster1 element("%monsters", 0)
### GRABS THE LAST WORD OR THE WORD BEFORE "THAT" --> (\b(\w+)\s+that\b|(\w+)\W*$)
if matchre("%monster1", "(\b(\S+)\s+that\b|(\S+)\W*$)") then var monster1 $1
eval monster1 replacere("%monster1", "that", "")
echo Fighting: %monster1

# NEW TEST VERSION
     #if (!$monstercount) then return
     #var critterList $monsterlist
     #eval critterList replace("%critterList", ", ", "|")
     #eval critterList replace("%critterList", " and ", "|")
     #eval critterList replace("%critterList", " that is lying down", "")
     #eval critterList replace("%critterList", " that appears stunned", "")
     #eval critterList replace("%critterList", " that is sleeping", "")
     #eval critterList replace("%critterList", " that appears rather calm", "")
     #eval critterList replace("%critterList", " which appears dead", "")
     #var critterList |%critterList|
     #eval total count("%critterList", "|")
     #eval monster1 element("%critterList", 1)
     #eval monster1 replacere("%monster1", "\S+\s", "")
return


##############################
##                          ##
##      Error handling      ##
##                          ##
##############################
APPR_ERROR:
     gosub clear
     echo
     echo ***                APPR_ERROR                     ***
     echo *** Something happened while appraising a critter ***
     echo
     put #log GH APPR_ERROR !
     put #echo >Log yellow GH Appr error!
     put GH APPR ERROR!
     goto SWITCH_WEAPON

ATTACK_ERROR:
     gosub clear
     echo
     echo ***             ATTACK_ERROR               ***
     echo *** Something bad happened while attacking ***
     echo
     put #log GH ATTACK_ERROR
     put #echo >Log yellow GH Attack error!
     put GH ATTACK ERROR!
     goto SWITCH_WEAPON

CLEANING_ERROR:
     gosub clear
     echo
     echo ***           CLEANING_ERROR              ***
     echo *** Something bad happened while cleaning ***
     echo
     put #log GH CLEANING_ERROR
     put #echo >Log yellow GH cleaning error!
     put GH CLEANING ERROR!
     goto SWITCH_WEAPON

DEFAULT_ERROR:
     gosub clear
     echo
     echo ***                        DEFAULT_ERROR:                          ***
     echo ***         Cannot use keyword DEFAULT with keyword multi          ***
     echo *** To use Default settings with multi-weapons, use keyword dmulti ***
     echo
     put #log GH DEFAULT_ERROR
     put #echo >Log yellow GH Default error!
     put GH DEFAULT ERROR!
     goto SWITCH_WEAPON

LOOT_ERROR:
     gosub clear
     echo
     echo ***       LOOT_ERROR            ***
     echo *** Error occured while looting ***
     echo
     put #log GH LOOT_ERROR
     put #echo >Log yellow GH Loot error!
     put GH LOOT ERROR!
     goto LOOT_ON

RANGED_ERROR:
     gosub clear
     echo
     echo ***         RANGED_ERROR             ***
     echo *** Error occured while using ranged ***
     echo
     put #log GH RANGED_ERROR
     put #echo >Log yellow GH Ranged error!
     put GH RANGED ERROR!
     goto RANGED

SKIN_ERROR:
     gosub clear
     echo
     echo ***          SKIN_ERROR          ***
     echo *** Error occured while skinning ***
     echo
     put #log GH SKIN_ERROR
     put #echo >Log yellow GH Skin error!
     put GH SKIN ERROR!
     goto SKIN_CHECK

STEALTH_ERROR:
     gosub clear
     echo
     echo ***           STEALTH_ERROR            ***
     echo *** Error occured while being stealthy ***
     echo
     put #log GH STEALTH_ERROR
     put #echo >Log yellow GH Stealth error!
     put GH STEALTH ERROR
     goto SWITCH_WEAPON

SWAP_ERROR:
     gosub clear
     echo
     echo ***              SWAP_ERROR:                    ***
     echo *** Something bad happened while trying to swap ***
     echo
     put #log GH SWAP_ERROR
     put #echo >Log yellow GH SWAP error!
     put GH SWAP ERROR!
     goto SWITCH_WEAPON

THROWN_ERROR:
     gosub clear
     echo
     echo ***        THROWN_ERROR          ***
     echo *** Error occured while throwing ***
     echo
     put #log GH THROWN_ERROR
     put #echo >Log yellow GH Thrown error!
     put GH THROWN ERROR!
     goto THROWN

VARIABLE_ERROR:
     gosub clear
     echo
     echo ***                VARIABLE_ERROR:                 ***
     echo *** An error has occured with one of the variables ***
     echo
     put #log GH VARIABLE_ERROR
     put #echo >Log yellow GH Variable error!
     put GH Variable error!
     goto SWITCH_WEAPON

WEAPON_APPR_ERROR:
     gosub clear
     echo
     echo ***                   WEAPON_APPR_ERROR:                          ***
     echo *** Something happened while trying to discern the type of weapon ***
     echo
     put #log GH WEAPON_APPR_ERROR
     put #echo >Log yellow GH Weapon Appr error!
     put GH WEAPON APPR ERROR!
     goto SWITCH_WEAPON

WEAPON_ERROR:
     gosub clear
     echo
     echo ***                   WEAPON ERROR:                          ***
     echo *** Something happened while trying to discern the type of weapon ***
     echo
     put #log GH WEAPON_ERROR
     put #echo >Log yellow GH Weapon error!
     put GH WEAPON ERROR!
     goto SWITCH_WEAPON

ERROR:
     gosub clear
     echo
     echo *** Some general ERROR occured ***
     echo
    put #log GH ERROR
     put #echo >Log yellow GH General error!
     put GH GENERAL ERROR!
     goto ERROR.RECOVERY

ERROR_DONE:
     pause 1
     echo
     echo *** DONE, BUT WITH ERRORS ***
     echo
     put #beep
     put stow right
     pause 1
     put stow left
     pause 1
     put #playsystem Open
     put glance
     put #parse HUNTER DONE
     put look
     goto ERROR.RECOVERY

ERROR.RECOVERY:
put #echo >Log Red ** Combat done
put #parse RESET HUNTER
put #parse RESET.COMBAT.PLZ
exit
##############################
##                          ##
##    End Error handling    ##
##                          ##
##############################


#################################
##                             ##
##        HELP Section         ##
##                             ##
#################################
HELP:
     gosub clear
     echo
     echo **************************************************************************************
     echo **
     echo ** Ambushing
     echo ** Appraisal
     echo ** Backstabbing
     echo ** Brawling
     echo ** Counting Critters (Dancing)
     echo ** Default Setting
     echo ** Empathic Brawling
     echo ** Experience Checks/Sleeping with a murked mind
     echo ** Global Variables
     echo ** HUNT verb
     echo ** Juggling
     echo ** Looting Options
     echo ** Multi Skill Training
     echo ** Offhand Weapon Fighting
     echo ** Poaching/Sniping
     echo ** Power Perception
     echo ** Roaming a Hunting Ground
     echo ** Retreating Options
     echo ** Shields
     echo ** Skinning Options
     echo ** Snapfiring
     echo ** Stance Options
     echo ** Swappable Weapons (Bastard swords etc.)
     echo ** Syntax Full
     echo ** Targeting Body Parts
     echo ** Timer Training - training for X amount of time
     echo ** Thrown
     echo ** Weapons
     echo **
     echo ** Please type one of the above options for details.
     echo **
     echo **************************************************************************************
     echo
          match HELP_AMBUSH ambush
          match HELP_APP appr
          match HELP_BACK back
          matchre HELP_BRAWL brawl
          matchre HELP_COUNT count|danc
          matchre HELP_DEF defa|sett
          matchre HELP_EMPATH empath
          match HELP_EXP exp
          matchre HELP_GLOBAL glob|var
          match HELP_HUNT hunt
          match HELP_JUGGLE jugg
          match HELP_LOOT loot
          match HELP_MULTI multi
          match HELP_OFFHAND offh
          matchre HELP_POACH poach|snip
          match HELP_POWER pow
          match HELP_ROAM roam
          match HELP_RETREAT ret
          match HELP_SHIELD shield
          match HELP_SKIN skin
          match HELP_SNAP snap
          match HELP_STANCE stance
          match HELP_SWAP swap
          match HELP_SYNTAX synt
          match HELP_TARGET targ
          match HELP_THROWN throw
          match HELP_TIMER time
          match HELP_WEAPON weap
     matchwait

HELP_GENERAL:
     echo
     echo **************************************************************************************
     echo **
     echo ** The Option you chose was a "General Command"
     echo ** General commands must come before any other scripting commands,
     echo ** but can be mixed in any order with other General Commands.
     echo **
     echo ** LIST of General commands: Appraise, Arrange, Block, Bundle, Count, Custom, Dance,
     echo **                           Default, Dodge, Evade, Exp, Lootall, Lootbox, Lootcoin,
     echo **                           Lootgem, Retreat, Junk, Multi, Parry, Roam, Timer,
     echo **                           Target, Train
     echo **
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_AMBUSH:
     echo
     echo **************************************************************************************
     echo ** For anyone looking to get the drop on someone there's always ambushing.
     echo ** This function will hide/stalk an enemy and then attack from hiding.  For paladins
     echo ** it will unhide before advancing and also unhide before attacking to avoid soul hits.
     echo ** Support is in there for ambushing with ANY melee weapon in the game, as well as
     echo ** ambushing while brawling.
     echo **
     echo ** .HUNTER ambush {weapon} (shield)
     echo ** .HUNTER ambush brawl {weapon} (shield)
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_APP:
     echo
     echo **************************************************************************************
     echo ** The Script can be set-up to appraise the monsters you are fighting.
     echo **
     echo ** The script will 'appraise quick' for a 3 second RT.
     echo ** It attempts to app after a kill, and will app when a monster enters an empty room.
     echo ** Do to the limitations of the script it can ONLY app the same type of monster as the
     echo ** last monster you killed.
     echo ** This creates a sort of "hit or miss" system, but it does work most of the time.
     echo **
     echo ** .HUNTER APPR {weapon} (shield)
     echo **
     echo ** Note: The appraisal variable is a global variable so you can turn it on/off as you
     echo ** so desire while the script is running.  The variable is GH_APPR
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_BACK:
     echo
     echo **************************************************************************************
     echo ** For all you sneaky types, backstab is supported.
     echo ** Just don't try this if you aren't a allowed!
     echo ** And if you try it with an inappropriate weapon, you will just attack like a Barbarian
     echo **
     echo ** .HUNTER backstab {weapon} (shield)
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_BRAWL:
     echo
     echo **************************************************************************************
     echo ** The script Brawls, no weapons allowed.  Just Fist of Fury
     echo **
     echo ** .HUNTER BRAWL
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_COUNT:
     echo
     echo **************************************************************************************
     echo ** It is possible to have the script Dance with a certain number of critters without
     echo ** killing them. The Script will do 'Brawling' until MORE THAN the number of critters
     echo ** you designate is in the room. (NOT at melee. NOT on you. IN THE ROOM)
     echo ** Both the Count and Dance keyword works for this function
     echo **
     echo ** .HUNTER COUNT/DANCE <Number of critters to dance with>
     echo **
     echo ** Example:
     echo **  .HUNTER COUNT/DANCE 3 Scimitar
     echo **     You will Dance until there are 4 critters, then attack until there are only
     echo **     3 again.
     echo **
     echo ** Note: The dancing variable is a global variable so you can turn it on/off as you
     echo ** so desire while the script is running.  The variable is GH_DANCING
     echo **************************************************************************************
     echo
     pause 7
     goto HELP

HELP_DEF:
     echo
     echo **************************************************************************************
     echo ** The script can be configured to create 1 default combat setting.
     echo ** This setting will be used when the script is started with no variables.
     echo ** It will skip all variable checks and go immediately into combat using
     echo ** the pre-configured weapon set-up created with this command.
     echo **
     echo ** Basically think of this as your "Oh crap! I need to be fighting NOW" set-up.
     echo **
     echo ** SYNTAX: .HUNTERa DSET {weapon set-up}
     echo ** EXAMPLE: .HUNTERa DSET loot skin scimtar shield
     echo ** USAGE: .HUNTERa
     echo **
     echo ** A note on multi word weapons:
     echo **     If your set-up contains a multi word weapon like short.bow or bastard.sword
     echo ** there is an added step to get this to work properly. Once you create your set-up,
     echo ** since it is inside quotes the . is removed making these one word weapons two words,
     echo ** and thus two variables. To fix this do the following.
     echo **     Go into your config window and click the "Variables" tab. Find the variable
     echo ** with your multi word weapon and re-enter the period. This will make it function
     echo ** properly when default mode is used.  Default variables are all saved as
     echo ** GH_DEF_<variable name> so they are easily findable
     echo **
     echo **************************************************************************************
     echo
     pause 10
     goto HELP_DM

HELP_DM:
     echo
     echo **************************************************************************************
     echo ** To tie Default setting into a Multi-Weapon Setup use the command DMULTI
     echo ** This will make the script use your default setting as the first chain in
     echo ** Multi-weapon set-up. You must have previously set-up default settings to use this.
     echo ** Also, use DMSET to set the weapons to use
     echo **
     echo ** SYNTAX: .HUNTER DMSET weapon1 weapon2
     echo ** EXAMPLE: .HUNTER DMSET scimitar sword mace
     echo **          This sets up to use these 3 weapons with DEFAULT settings
     echo ** EXAMPLE: .HUNTER DMULTI 2 (this will start fighting with weapon 2)
     echo **
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_EMPATH:
     echo
     echo **************************************************************************************
     echo ** If you're an Empath, or just want to dance with a critter. There is brawling that
     echo ** doesn't hurt the critter.  No weapons allowed, just like normal brawling
     echo **
     echo ** SYNTAX: .HUNTER EMPATH
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_EXP:
     echo
     echo **************************************************************************************
     echo ** The script has three methods of Checking Experience.
     echo **   The Main method is using the 'MUlTI' command, where the script will check Exp
     echo ** and switch weapons to your next set-up when needed. (See the Multi-weapon section)
     echo **
     echo **     The second method is using the 'EXP' variable. This causes the script to check the
     echo ** of the current weapon, or alternate experience (depending on the skill).  If the
     echo ** learning state of the experience is greater than 10 (dazed or mind locked) the script
     echo ** stops.
     echo **
     echo **   The third method is using the 'TRAIN' variable.  This causes the script to check
     echo ** the experience after every weapon cycle.  This method also checks after every kill.
     echo **
     echo **   The 'MULTI' command defaults to using both the 'TRAIN' and 'EXP' variable so it
     echo ** will check experience after every weapon cycle and after every kill
     echo **
     echo ** SYNTAX: .HUNTER EXP <weapon> (shield)
     echo ** SYNTAX: .HUNTER TRAIN <weapon> (shield)
     echo **
     echo ** Note: The training variables are a global variable so you can turn it on/off as you
     echo ** so desire while the script is running.  The variables are GH_EXP and GH_TRAIN
     echo ** Note2: You need the EXP plugin to make use of these functions.
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_GLOBAL:
     echo
     echo **************************************************************************************
     echo ** HUNTER makes use of global variable so that you may modify your hunting without
     echo ** having to restart the script all together.  Here is a list of all the global
     echo ** variables and the allowable values
     echo **
     echo ** GH_AMBUSH    - OFF/ON  (ambushing with weapon)
     echo ** GH_APPR      - NO/YES  (appraising creatures)
     echo ** GH_ARRANGE   - OFF/ON  (arranging before skinning)
     echo ** GH_BUN       - OFF/ON  (bundling after skinning)
     echo ** GH_DANCING   - OFF/ON  (dancing with creatures)
     echo ** GH_EXP       - OFF/ON  (experience check after kills)
     echo ** GH_LOOT      - OFF/ON  (general looting, if OFF no looting is done)
     echo ** GH_LOOT_BOX  - OFF/ON  (box looting)
     echo ** GH_LOOT_COIN - OFF/ON  (coin looting)
     echo ** GH_LOOT_GEM  - OFF/ON  (gem looting)
     echo ** GH_LOOT_JUNK - OFF/ON  (junk looting)
     echo ** GH_SPELL     - <spell> (spell to cast)
     echo ** GH_MANA      - <mana>  (mana level to prepare spell at)
     echo ** GH_HARN      - <mana>  (mana level to harness after prep)
     echo ** GH_RETREAT   - OFF/ON  (retreating for ranged/magic)
     echo ** GH_ROAM      - OFF/ON  (roaming when nothing left to kill)
     echo ** GH_SKIN      - OFF/ON  (skinning creatures)
     echo ** GH_SKIN_RET  - OFF/ON  (retreating while skinning)
     echo ** GH_SNAP      - OFF/ON  (snapcasting/snapfiring)
     echo ** GH_STANCE    - OFF/ON  (stance switching)
     echo ** GH_TARGET    - <body part> (body part to target)
     echo ** GH_TIMER     - OFF/ON  (using timing function
     echo ** GH_TRAIN     - OFF/ON  (exp checks after combat cycles)
     echo **
     echo Note: Please note values are case sensitive for all variables with the options ON/OFF/NO/YES.
     echo      For all other variables, their values are case insensitive
     echo **************************************************************************************
     echo
     pause 10
     goto HELP

HELP_HUNT:
     echo
     echo **************************************************************************************
     echo ** The script will use the HUNT verb every 90 seconds to train perception, stalking
     echo ** and scouting (for the Rangers).  It will hunt before your swing your weapon during
     echo ** combat.
     echo **
     echo ** SYNTAX: .HUNTER HUNT {weapon} (shield)
     echo **
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_JUGGLE:
     echo
     echo **************************************************************************************
     echo ** The script can juggle while waiting for new monsters to show up for killing
     echo **
     echo ** SYNTAX: .hunter JUGGLE/YOYO {weapon} (shield)
     echo **
     echo ** You can also use yoyos as a jugglie.  If you use a standard jugglie, the script
     echo ** will also hum while jugglig
     echo **
     echo ** Note:  For this to work you need to have a few global variables:
     echo **                JUGGLIE = your jugglie of choice, be it standard or a yoyo
     echo **                HUM_SONG = song to hum while juggling
     echo **                HUM_DIFFICULTY = song difficulty to hum while juggling
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_LOOT:
     echo
     echo **************************************************************************************
     echo ** The Script can be set-up to loot Kills. (It always searches.)
     echo **
     echo ** SYNTAX: .hunter LOOTALL {weapon} (shield)    <--- Loots everything
     echo **
     echo ** You can also set-up the script to loot specific item types, rather than everything.
     echo ** The variables for these are:
     echo **
     echo ** COLLECTIBLE - will loot collectibles (cards/diras)
     echo ** LOOTBOX - will only loot boxes until the stow container is full
     echo ** LOOTCOIN - will only loot coins
     echo ** LOOTGEM - will only loot gems until the stow container is full
     echo ** JUNK - will loot junk items (runestones/scrolls/lockpicks etc)
     echo **
     echo ** EXAMPLE: .hunter LOOTBOX {weapon} {shield}          <--- Loot boxes but not gems or coins.
     echo ** EXAMPLE: .hunter LOOTGEM LOOTCOIN {weapon} {shield} <--- Loot coins and gems but not boxes.
     echo **
     echo ** Note: The looting variables are a global variable so you can turn it on/off as you
     echo ** so desire while the script is running.  The variables are GH_LOOT,GH_LOOT_BOX,
     echo ** GH_LOOT_COIN, GH_LOOT_GEM, and GH_LOOT_JUNK
     echo **************************************************************************************
     echo
     pause 5
     goto HELP


HELP_MULTI:
     echo
     echo **************************************************************************************
     echo ** To set up multi weapon simply put in SET as the first variable followed by the
     echo ** hunter set-ups you want to cycle through, each set-up must be inside a set of
     echo ** quotes (""). Multi-weapon will change set-ups when you reach Dazed in the
     echo ** current weapon.
     echo ** SYNTAX:  .hunter MSET "Set-up1" "Set-up2" "Set-up3" ... "Set-up10"
     echo **        NOTE: You don't have to use all 10 available set-up spots.
     echo ** EXAMPLE: .hunter MSET "skin loot scimitar shield" "loot app brawl"
     echo **
     echo ** USE:
     echo **     Once set-up, to use the script for multi-weapon simply use the "multi" command.
     echo ** If you want to start on a set-up that isn't your first one entered simply type in
     echo ** the number of the set-up you want to start with.
     echo **
     echo ** SYNTAX: .hunter MULTI <Set-up number you want to start with>
     echo ** EXAMPLE: .hunter MULTI - starts with Set-up1
     echo ** EXAMPLE: .hunter MULTI 3 - starts with Set-up3
     echo ** I know its a bit complex. AIM: IRXSwmr EMAIL: KllrWhle79@hotmail.com
     echo **
     echo ** A note on multi word weapons:
     echo **     If a set-up contains a multi word weapon like short.bow or bastard.sword there
     echo ** is an added step to get this to work properly.
     echo **     Once you create your set-up, since it is inside quotes the . is removed making
     echo ** these one word weapons two words, and thus two variables. To fix this do the
     echo ** following.
     echo **     Go into your config window and click the "Variables" tab. Find the variable
     echo ** with your multi word weapon and re-enter the period. This will make it function
     echo ** properly when "multi" is used.  Default variables are all saved as
     echo ** GH_MULTI_<SETUP NUMBER> so they are easily findable
     echo **
     echo **************************************************************************************
     echo
     pause 10
     goto HELP

HELP_OFFHAND:
     echo
     echo **************************************************************************************
     echo ** The script will fight with your offhand. This function is usable with all melee
     echo ** weapons and thrown weapons. You must still specify if you want to throw the weapon
     echo ** just like the throwing function. It will use the typical combat sequence, just with
     echo ** the left hand. Shields are not usable because they provide no protect when held in
     echo ** the right hand.
     echo **
     echo ** SYNTAX: .hunter OFF {weapon}
     echo ** EXAMPLE: .hunter OFF scimitar
     echo ** EXAMPLE: .hunter OFF throw hammer
     echo **
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_POACH:
     echo
     echo **************************************************************************************
     echo ** For those of you who like your stealth kills at range, Poaching and Sniping is
     echo ** fully operational.
     echo **
     echo ** SYNTAX: .hunter POACH {weapon} (shield(slings and LX only!)
     echo ** SYNTAX: .hunter SNIPE {weapon} (shield(LX only!)
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_POWER:
     echo
     echo **************************************************************************************
     echo ** The script will use the perceive verb to train power perception every 6 minutes
     echo **
     echo ** SYNTAX: .hunter POWERP {weapon} (shield)
     echo **
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_ROAM:
     echo
     echo **************************************************************************************
     echo ** The script will roam a hunting area if you run out of things to kill. It will move
     echo ** throughout the current hunting area and check each room for people and critters.
     echo ** It will makes sure you have your ammo first; and if you are bundling skins, it will
     echo ** pick up one bundle to take with you.
     echo **
     echo **                         !!!!!! CAUTION !!!!!!
     echo ** The script does not check to make sure you don't leave the hunting area and enter
     echo ** other, possibly more dangerous areas. Beforewarned that if there are more difficult
     echo ** creatures in an adjacent, easily accessed area, use extreme caution with this function.
     echo ** Also, there is not 100% coverage for people hunting in hiding. Be courteous of others
     echo ** so you don't get an arrow in the face.
     echo **
     echo ** SYNTAX: .hunter ROAM {weapon} (shield)
     echo **************************************************************************************
     echo
     pause 7
     goto HELP

HELP_RETREAT:
     echo
     echo **************************************************************************************
     echo ** The script defaults to not staying at a distance while using ranged weapons, thrown
     echo ** weapons and magic.  If you want to stay at a distance and retreat from combat while
     echo ** doing these actions, the script can do that with the RETREAT function
     echo **
     echo ** SYNTAX: .hunter RET {weapon} (shield)
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_SHIELD:
HELP_WEAPON:
     echo
     echo **************************************************************************************
     echo ** It works with (just about) any type of weapon in the game. Anytime you can use a
     echo ** shield, the script supports it.  The script won't even try to pull out a shield if
     echo ** you are using a two-handed weapon or bow.
     echo ** !!!WARNING!!! If you are using an arm worn shield DO NOT enter a shield name.
     echo **
     echo ** SYNTAX: .hunter {weapon} (shield)
     echo **
     echo ** Note: If you have an arm worn shield on when trying to use a bow, the script will
     echo ** remove and attempt to stow the offending shield
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_SKIN:
     echo
     echo **************************************************************************************
     echo ** Everyone has there own method of how they skin. This script therefore has several
     echo ** options on how skinning works.
     echo ** Here are the commands for skinning, and what they do:
     echo **
     echo ** SKIN     : Skins, drops the skin if you aren't bundling
     echo ** BUNDLE   : Same as 'SKIN', but bundles the skins.  If no ropes to bundle, drops skins, drops bundles
     echo ** SKINRET  : Will make the script retreat before skinning.
     echo ** SCRAPE   : Will scrape the skins before dropping/bundling them
     echo ** ARRANGE  : Same as 'SKIN' but it arranges first, also can input number of times to arrange (1-5)
     echo ** WEAR     : Wears bundles, instead of dropping them
     echo ** TIE      : Ties bundles off before either dropping or wearing them, reduces item count
     echo **
     echo ** There is no need to use 'SKIN' if you are using one of the other options, it knows
     echo ** you're skinning.  In other words, ".hunt skin bundle" is redundant, just use
     echo ** ".hunt bundle"
     echo **
     echo ** Options can be combined for full effect.
     echo **
     echo ** EXAMPLE: .hunt ARRANGE SKINRET {weapon} - this would make the script retreat,
     echo ** arrange the kill, skin it, and drop the skin.
     echo **
     echo ** Note: If you are a ranger and you do "arrange 5" (max arranges) the script will use
     echo ** "arrange all" to arrange for minimum RT
     echo **************************************************************************************
     echo
     pause 10
     goto HELP

HELP_SNAP:
     echo
     echo **************************************************************************************
     echo ** For those of us who are impatient, ALL Ranged systems can be snapfired.
     echo **   Snapfiring will cause the script to aim and fire instanly after you load until
     echo ** your target is dead.
     echo **
     echo ** SNAP also works with Magic systems. It will fully prepare the spell then Target and
     echo **   Cast at the same time.
     echo **
     echo ** EXAMPLE: .hunter SNAP {weapon} (shield)-(slings and LX only!)
     echo ** EXAMPLE: .hunter SNAP poach {weapon} (shield)-(slings and LX only!)
     echo ** EXAMPLE: .hunter SNAP TM FB 15 scimitar
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_STANCE:
     echo
     echo **************************************************************************************
     echo ** The script is able to alter your stance.
     echo ** Block - Custom - Evasion - Parry
     echo ** These commands will make the script switch to the preset Stance you enter.
     echo **
     echo ** .hunter BLOCK/CUSTOM/EVASION(or DODGE)/PARRY {weapon} (shield)
     echo **
     echo ** The script also has the function to switch stances when one is locked. It will
     echo ** determine your current stance, and then check the experience for that skill. If the
     echo ** is dazed or above, it will switch stances.  The stance switching goes in the following
     echo ** order: evasion -> shield -> parry and back
     echo **
     echo ** SYNTAX: .hunter STANCE {weapon} (shield)
     echo **
     echo ** If you would like to skip one stance, you can indicate which stance you would like to
     echo ** with the NOEVASION, NOPARRY, or NOSHIELD keywords.  This will skip the indicated
     echo ** stance.  You may only skip one stance.
     echo **
     echo ** Note: You must have the EXP plugin for this function to work
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_SWAP:
     echo
     echo **************************************************************************************
     echo ** The script can be set-up to use swappable weapons.
     echo ** "Swap X" must be followed by the weapon.
     echo **
     echo ** SYNTAX: .hunter SWAP {1/2/E/B/PI/HA/SS/QS} {weapon} (shield)
     echo **
     echo ** 1 = 1 handed for weapons that swap between 1 and 2 hands.
     echo ** 2 = 2 handed for weapons that swap between 1 and 2 hands.
     echo ** E = Edged for weapons that swap between edged and blunt.
     echo ** B = Blunt for weapons that swap between edged and blunt.
     echo ** PI = Use this weapon as a Pike.
     echo ** HA = Use this weapon as a Halberd.
     echo ** SS = Use this weapon as a Short Staff.
     echo ** QS = Use this weapon as a Quarter Staff.
     echo **
     echo ** EXAMPLES: .hunter SWAP 1 sword shield - uses a sword in 1-handed mode
     echo **           .hunter SWAP PI spear - uses a spear in pike mode
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_SYNTAX:
     echo
     echo **************************************************************************************
     echo **    This is a brief (for me anyway) description of how the script works
     echo ** and what order commands come in, as well as a list of all the commands
     echo ** the script has.
     echo **
     echo **    There are many options settings and methods of using the script,
     echo ** all of which have been programed in and can be called forth using the
     echo ** correct comamnds. Knowing those commands and how to use them is what
     echo ** this section is for.
     echo **
     echo **    'Command' refers to anything that follows .hunter when starting the script.
     echo ** There are several types of commands:
     echo **
     echo **    'General Commands' have to come before anything else, but can
     echo ** be placed in any order amongst themselves. These are basic systems
     echo ** that toggle on or off specific non-combat features.
     echo **
     echo **    'Combat Methods' come after 'General Commands' but before
     echo ** 'Combat Systems'. Methods alter a System in very specifc but minor
     echo ** ways, and can usually only be used with a specific System.
     echo **
     echo **    'Combat Systems' come After Methods, and Immediately before your
     echo ** Equipment. Systems decide how the script is going to fight. This is usually
     echo ** defined by your Equipment, but occasionlly a System is used that redefines
     echo ** how combat is undergone with Certain Equipment.
     echo **
     echo **    'Equipment' is always the last command. When the script finds your
     echo ** Equipment (usually a weapon) it begins combat after equiping you.
     echo ** Equipment is defined as the in game items you will be using to hunt with.
     echo **
     echo **    'Special' commands are.. special. They are usually systems that have
     echo ** nothing to do with combat itself, but were placed into the script as extras
     echo ** They are also the commands used to set-up some of the more complex features
     echo ** of the script.
     echo **
     echo ** Command List:
     echo ** General Commands: Appraise, Arrange, Block, Bundle, Count, Custom, Dance, Default,
     echo **                   Dodge, Evade, Exp, Lootall, Lootbox, Lootcoin, Lootgem, Retreat,
     echo **                   Junk, Multi, Parry, Roam, Target, Timer, Train
     echo ** Combat Methods: Ambush, Snapfire, Stack
     echo ** Combat Systems: Backstab, Brawl, Empath, Offhand, Snipe, Swap, Throw,
     echo ** Spcl. Commands: MSET and MULTI (multi weapons), DSET (Default Setting), HELP,
     echo **                 DMSET and DMULTI (multi weapons with default settings)
     echo **
     echo ** SYNTAX ORDER: [] = Special Commands () = General Commands || = Combat Methods
     echo **               /\ = Combat Systems {} = Equipment
     echo **
     echo ** Basic: .hunter {weapon} {shield}
     echo ** Advan: .hunter () || /\ {}
     echo ** Spcl.: .hunter []
     echo **
     echo ** For more specifc information please refer to the individual HELP sections.
     echo **
     echo **************************************************************************************
     echo
     pause 20
     goto HELP

HELP_TARGET:
     echo
     echo **************************************************************************************
     echo ** So say, you want to behead all your enemies. Well hunter will help you out.
     echo ** The TARGET variable let's you specify a body part to attack. This will work with all
     echo ** types of weapons and magic.
     echo **
     echo ** SYNTAX: .hunter TARGET <body part> {weapon} (shield)
     echo ** EXAMPLE: .hunter TARGET head scimitar
     echo ** EXAMPLE: .hunter TARGET right.arm scimitar
     echo **
     echo ** Note: If the body part is multi-word (left arm), use a period (.) to separate the
     echo ** two words
     echo **************************************************************************************
     echo
     pause 5
     goto HELP

HELP_THROWN:
     echo
     echo **************************************************************************************
     echo ** Like to throw things? hunter can satisfy your needs!
     echo ** The system is also set up to use and handle stacks of throwing weapons. It is not
     echo ** needed to specify THROW if you are using a STACK, the script knows.
     echo **
     echo ** SYNTAX: .hunter THROW {weapon} (shield)
     echo ** SYNTAX: .hunter STACK {weapon} (shield)
     echo **************************************************************************************
     echo
     pause 3
     goto HELP

HELP_TIMER:
     echo
     echo **************************************************************************************
     echo ** hunter allows for timed hunting rounds.  With the TIMER variable you can set
     echo ** a limit to how long you want to use a weapon. The timer defaults to 10 minutes,
     echo ** or 600 seconds, so you can just use that or input your own amount of time.
     echo **
     echo ** SYNTAX: .hunter TIMER <time in seconds> {weapon} (shield)
     echo ** EXAMPLE: .hunter TIMER 900 scimitar - will kill with the scimitar for 15 minutes
     echo ** EXAMPLE: .hunter TIMER scimitar - will kill with the scimitar for 10 minutes
     echo **************************************************************************************
     echo
     pause 5
     goto HELP