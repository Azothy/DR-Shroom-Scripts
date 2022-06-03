#######################################################################
# HIT COUNTER SCRIPT BY SHROOM/AZOTHY - FOR GENIE 3
# THIS KEEPS TRACK OF YOUR HIT PERCENTAGE IN COMBAT PER WEAPON
# THIS SCRIPT REQUIRES THE EXP ECHO PLUGIN TO WORK PROPERLY!
# Email: skultamaphon@gmail.com - AIM: shroomismschism
###################################################################3333
#debug 5
#USER DEFINED VARIABLES
## Verbose mode ON will spam current stats to the game window as well
var VERBOSE ON
## END USER VARIABLES
## BEGIN SCRIPT 
## DO NOT TOUCH BELOW!! FUCK OFF I SAID!!
## Default Variables
var CurrentWeapon null
var Weapon null
var CurrentSkill null
var Training null
var swings 0
var miss 0
var hits 0
var hits2 0
var hit1 0
var hit2 0
var hit3 0
var hit4 0
var hit5 0
var hit6 0
var hit7 0
var hit8 0
var hit9 0
var hit10 0
var hit11 0
var hit12 0
var hit13 0
var hit14 0
var hit15 0
var hit16 0
var hit17 0
var hit18 0
var hit19 0
var hit20 0
var hit21 0
var hit22 0
var hit23 0
var HitTotal 0
var percentile 0
var missCounter 0
var hit1Counter 0
var hit2Counter 0
var hit3Counter 0
var hit4Counter 0
var hit5Counter 0
var hit6Counter 0
var hit7Counter 0
var hit8Counter 0
var hit9Counter 0
var hit10Counter 0
var hit11Counter 0
var hit12Counter 0
var hit13Counter 0
var hit14Counter 0
var hit15Counter 0
var hit16Counter 0
var hit17Counter 0
var hit18Counter 0
var hit19Counter 0
var hit20Counter 0
var hit21Counter 0
var hit22Counter 0
var hit23Counter 0
var thrownCheck 0
var checkCount 0
var echoCount 0
var suggested 3
var trackLoop 0
var weaponLoop 0
var melee 0
var trigger 0
var LT 0
var HT 0
var 2HE 0
var LE 0
var SE 0
var 2HB 0
var LB 0
var SB 0
var Bow 0
var Xbow 0
var Slings 0
var Staves 0
var Polearms 0
var Brawling 0
### MULTI WEAPONS
var SE_LT_WEAPON dagger|throwing blades|throwing blade|throwing knife|throwing dagger|throwing axe|throwing spike|dart|turpeer|shark's tooth|shavi|steelstar|blade spider|lata|exoskeletal axe|glaes spider|gold-plated croissant|icesteel throwing spork|finely balanced kastneth|charovra|Phelim's dark star|uenlata|serving platter|hairpin tipped with a gleaming starfire|vintner's corkscrew|onyx-hilted lata|elven star blade|enameled lata|bronze lata|razor-sharp saucers|rusty fork|marble rolling pin|dull butcher's knife|ivory-handled knife|goshawk-headed mallet|silver-edged stars
var POLE_HT_WEAPON javelin|spear|pitchfork|trident|allarh|pilum|skefne|stone pike|dessleg|lance|harpoon|ngalio|kertig military fork|celya|bone-tipped spade|pike with a hook-backed blade|hunthsleg|war lance|slender lance|fluke lance|jousting lance
var SB_LT_WEAPON horseshoe|throwing club|bola|yoyo|boomerang|boko|brass wrench|bulhawf|collar|cuska|shavi|grah'uaro|vivid blue coral katavdar|katavdar bound in twine|cured leather katavdar|dark steel katavdar|ebony katavdar|engraved golden katavdar|rippled steel katavdar|blue coral katavdar|crystal paperweight|fossilized turnip|fist-sized rock|heavy ceramic plate|large club wrapped|oaken impalement spike|old bone|tied sock|clerical collar|metal cupcakes|black baton
var LE_HT_WEAPON hurling axe|thick copper katavdar|brushed bronze katavdar|elm-handled woodcutter's hatchet|polished brass katavdar|hunga-munga|gleaming double-bladed war axe
var LB_HT_WEAPON throwing hammer|throwing mallet|steel mallet|sledgehammer|hhr'ata|svidaw sis|gloomwood katavdar|katavdar painted in a camouflage|tied canvas sack|war hammer with a rough stone head|large boulder|large stone fist|Estate Holder's plate|somber haralun katavdar
var 2HE_HT_WEAPON mikhildis shalsnipis
var 2HB_HT_WEAPON darghamar
var LB_LT_WEAPON ivory hammer
var SE_LE_WEAPON icy-blue blade set with a glacier

var SB_LE_LT_WEAPON metal cheesecake

var LB_LE_WEAPON war mallet
var SB_SE_WEAPON thick-bladed fan|golden bladed fan|steel-bladed silk fan|faldenblade|dagger inlaid with moonsilver|heavy steel dagger hilted with moonsilver|petite bodice dagger|slender steel dagger adorned with moonsilver
var SB_STAVE_WEAPON staecklumba
var 2HB_2HE_WEAPON splitting maul|war icon|giant war mallet
var 2HB_LB_WEAPON bar mace
var 2HE_LE_WEAPON katana|bastard sword|war sword|leather-wrapped war axe|ebony-handled broadaxe|pahapo|handled axe|double-headed battle axe|razor-sharp steel axe|double-edged battle axe

### SINGLE WEAPONS
var SE_WEAPON sabre|katar|dagger|scimitar|short sword|thrusting blade|cutlass|rapier|pugio|kris|poniard|iltesh|briquet|misericorde|adze|dao|machete|hoof pick|tei'oloh'ata|kanabu|gladius|guardarme|baselard|bronze warsword|foil|falcata|dirk|scalpel|telo|battle axe bound|dwarven mace|mambeli|black-handled battle axe|poignard|stiletto|blackened steel sword|tulwar|keyiru|parang|glass bottle with a cloth-wrapped neck|koummya|poker|shaska|shiv|hatchet|curlade|scythe-blade|kythe|nehlata|shotel|hanger|lata'oloh|saar|oben|hand axe|handaxe|sverdh|cleaver|sapara|sashqa|khopesh|shashqa|slim sword|black horn|saw|shamshir|mirror blade|mirror shiv|mirror knife|pasabas|guskar|zobens|sickle|pickaxe|dayblade|dawnblade|yataghan|vine-bound stone axe|plowshare|inlaid sword|half-handled riste|ice axe|curve-bladed sword|etched steel sword|flange-hilted sword|small sword|flat-black sword|gold-inlaid sword|onyx-hilted sword|polished dueling sword|polished gladiator's sword|skinning knife|carving knife|platinum-etched knife|shucking knife|pruning knife|diver's knife|harki knife|eating knife|bailing knife|belt knife|ritual knife|bowyer's knife|hunting knife|scrimshaw knife|outdoors knife|ritualist's knife|black-bladed knife|sacrificial knife|ceremonial knife|coral knife|basalt knife|long knife|curved knife|boat knife|silver butcher knife|harci knife|throwing blades|throwing knife|throwing axe|throwing spike|dart|turpeer|shark's tooth|shavi|steelstar|blade spider|lata|exoskeletal axe|glaes spider|gold-plated croissant|icesteel throwing spork|finely balanced kastneth|charovra|Phelim's dark star|serving platter|hairpin tipped with a gleaming starfire|vintner's corkscrew|onyx-hilted lata|elven star blade|enameled lata|bronze lata|razor-sharp saucers|rusty fork|marble rolling pin|dull butcher's knife|ivory-handled knife|stylus with a sharpened point|sunblade|takouba|telek|twine-bound battle axe|twisted night-black horn|steelstars|boarding axe with a silverwood handle|median-winged axe|oversized hand axe|tel'athi-inlaid felling axe|thrusting axe|narrow ice axe|goshawk-headed mallet|icy-blue blade set with a glacier|thick-bladed fan|golden bladed fan|steel-bladed silk fan|faldenblade|dagger inlaid with moonsilver|heavy steel dagger hilted with moonsilver|petite bodice dagger|slender steel dagger adorned with moonsilver|thin-bladed fan
var 2HE_WEAPON flamberge|broadaxe|claymore|greatsword|marauder blade|marauder's blade|greataxe|masamune|two-handed sword|slaughtersword|igorat axe|war axe|bone-hilted axe|twin-point axe|logging axe|double axe|dwarven battle axe|double-bladed steel axe|bearded war axe|executioner's broad-axe|curved axe|vargs zovens|kaskara|karambit|cracked bone-hilted sword|shh'oi'ata|shh'oi'lata|ice-edged sword|bone-hilted sword|imposing battle sword|periperiu sword|gargoyle-pommel sword|blackened-steel chain blade|splitting maul|straight-edged spata|bone-hilted axe|finely-polished double-headed axe|warring axe|beheading axe|woodsman's axe|elegantly curved axe with carved gold|massive double-bladed broadaxe|steel-bladed double axe|katana|bastard sword|war sword|leather-wrapped war axe|ebony-handled broadaxe|pahapo|handled axe|double-headed battle axe|razor-sharp steel axe|double-edged battle axe|mikhildis shalsnipis|splitting maul|war icon|giant war mallet
var LE_WEAPON longsword|broadsword|back-sword|falchion|dark crimson sword|nimsha|abassi|arzfilt|battle axe engraved with lightning|back-sword|huntsman's axe|sea-worn battle axe|black iron axe|schiavona|condottiere|khragen|cinquedea|cirvi|laske|dagasse|katana|steel axe|boarding axe|double-edged spata|tunneler's axe|dwarven warsword|round axe|jeo'telo|horseman's pick|kudalata|namkomba|recade|nehdalata|palta|mahai|namboka|sap-stained axe|sterak axe|mirror axe|stone-bladed axe|ice axe|black steel sword|blued steel sword|knight's sword|hunting sword|narrow-bladed steel war sword|blackened sword etched|polished warrior's sword|single-edged sword|wickedly curved sword|wooden sparring sword|chipped battle axe|grey Raven warden's axe|hooked battle axe|fearsome battle axe|spiked iron axe|gleaming battle axe|grim black-handled axe|heavy double-headed axe|heavy-headed battle axe|hefty iron battle axe|oak-hafted boarding axe|steel-bladed battle axe|deep crimson axe|deobar-hilted boarding axe|double-bladed war axe with a carved ironwood haft|mirror-polished double-headed battle axe|salt-etched boarding axe|steel battle axe painted|stone-bladed axe|wide ice axe|windsteel battle axe|katana|bastard sword|war sword|leather-wrapped war axe|ebony-handled broadaxe|pahapo|handled axe|double-headed battle axe|razor-sharp steel axe|double-edged battle axe|hurling axe|thick copper katavdar|brushed bronze katavdar|elm-handled woodcutter's hatchet|polished brass katavdar|hunga-munga|gleaming double-bladed war axe|icy-blue blade set with a glacier|metal cheesecake|war mallet
var LT_WEAPON blowgun dart|rock|dagger|throwing blades|throwing blade|throwing knife|throwing dagger|throwing axe|throwing spike|dart|turpeer|shark's tooth|shavi|steelstar|blade spider|lata|exoskeletal axe|glaes spider|gold-plated croissant|icesteel throwing spork|finely balanced kastneth|charovra|Phelim's dark star|uenlata|serving platter|hairpin tipped with a gleaming starfire|vintner's corkscrew|onyx-hilted lata|elven star blade|enameled lata|bronze lata|razor-sharp saucers|rusty fork|marble rolling pin|dull butcher's knife|ivory-handled knife|goshawk-headed mallet|ivory hammer|horseshoe|throwing club|bola|yoyo|boomerang|boko|brass wrench|bulhawf|collar|cuska|shavi|grah'uaro|vivid blue coral katavdar|katavdar bound in twine|cured leather katavdar|dark steel katavdar|ebony katavdar|engraved golden katavdar|rippled steel katavdar|blue coral katavdar|crystal paperweight|fossilized turnip|fist-sized rock|heavy ceramic plate|large club wrapped|oaken impalement spike|old bone|tied sock|clerical collar|metal cupcakes|black baton|metal cheesecake
var HT_WEAPON mistwood atlatl|javelin|spear|pitchfork|trident|allarh|pilum|skefne|stone pike|dessleg|lance|harpoon|ngalio|kertig military fork|celya|bone-tipped spade|pike with a hook-backed blade|hunthsleg|war lance|slender lance|fluke lance|jousting lance|hurling axe|thick copper katavdar|brushed bronze katavdar|elm-handled woodcutter's hatchet|polished brass katavdar|hunga-munga|gleaming double-bladed war axe|throwing hammer|throwing mallet|steel mallet|sledgehammer|hhr'ata|svidaw sis|gloomwood katavdar|katavdar painted in a camouflage|tied canvas sack|war hammer with a rough stone head|large boulder|large stone fist|Estate Holder's plate|somber haralun katavdar|mikhildis shalsnipis|darghamar|predator's spear
var 2HB_WEAPON akabo|flail|copper-inlaid steel maul|copperwood maul|war mattock|dire mace|giant mallet|sturdy cudgel with a rotting wolf|darghamar|splitting maul|war icon|giant war mallet|bar mace|threefold staff
var SB_WEAPON bludgeon|spiked mace|flanged mace|goat-head mace|iron mace|crude mace|granite mace|hand mace|short hammer|twisted club|hand mallet|garz|barrel slat|wyvern-headed mace|belaying pin|gnarled root|ironwood-hafted mace|hhr'tami|Urrem'tier mace|horseman's mace|war hammer|dented cudgel|wooden cudgel|steel-inlaid cudgel|mammoth-bone cudgel|sturdy cudgel|bone-handled cudgel|oak-hafted cudgel|boat oar|broken glass bottle with jagged edges|table-leg|bronze club|bronze statue|diploma|bronzed gauntlet|frying pan|cosh|dako uaro|komno|scepter|war club|marlingspike|gavel|gardener's shovel|iron-studded hara|gargoyle fist|cudgel|prod|ridged gauntlet|rolling pin|sap|skillet|chef's ladle|spiked gauntlet|Dwarven gauntlet|a club|spiked club|heavy oak club|butcher's knife|broken broom handle|baker's spoon|large baking pan|small iron hammer|tattered broom|tawvgali sis|twisted brass club|zubke|large wooden spoon|a gauntlet|horseshoe|throwing club|bola|yoyo|boomerang|boko|brass wrench|bulhawf|collar|cuska|shavi|grah'uaro|vivid blue coral katavdar|katavdar bound in twine|cured leather katavdar|dark steel katavdar|ebony katavdar|engraved golden katavdar|rippled steel katavdar|blue coral katavdar|crystal paperweight|fossilized turnip|fist-sized rock|heavy ceramic plate|large club wrapped|oaken impalement spike|old bone|tied sock|clerical collar|metal cupcakes|black baton|metal cheesecake|thick-bladed fan|golden bladed fan|steel-bladed silk fan|faldenblade|dagger inlaid with moonsilver|heavy steel dagger hilted with moonsilver|petite bodice dagger|slender steel dagger adorned with moonsilver|segmented club
var LB_WEAPON ball and chain|morning star|skull-crushing mace|togball smasher|bow yoke|heavy mallet|darkened sledgehammer|skullcrusher|prisoner's club|throwing hammer|throwing mallet|steel mallet|sledgehammer|hhr'ata|svidaw sis|gloomwood katavdar|katavdar painted in a camouflage|tied canvas sack|war hammer with a rough stone head|large boulder|large stone fist|Estate Holder's plate|somber haralun katavdar|ivory hammer|war mallet|staecklumba|bar mace|anchor chain
var STAVE_WEAPON cane|nightstick|quarterstaff|ironwood club|staff|hobbyhorse|atapwi|bo stick|bamboo staff|femur|bone-inlaid cane|broken-bladed hoe|capstan bar|stick|crook|brass-capped rod|staecklumba|wooden truncheon|spear with an oaken haft|bo stick|loaf of metal bread|long wrench|lunat pike staff|mangy wooden mop|croupier's stick|pale oak rod|pewter-inlaid cane|gnawed net handle|prison bar|satinwood cane|segmented staff|walking stick|bone spear|short iron spear|short steel spear|snapped pole|steel-tipped staff|tapered stave|glaive|predator's spear|prybar|gaff hook|shillelagh|shillelagh|partisan|uguns nuja|fence post|gravedigger's shovel|thin-bladed fan|broomstick|uprooted tree|slap stick|yeehar jawbone|battle-staff|wheaten-hued staff
var POLEARM_WEAPON halberd|partisan|pike|pitchfork|trident|awgravet ava|bardiche|corsesca|steel scythe|voulge|table leg|pole-axe|javelin|spear|allarh|pilum|skefne|stone pike|dessleg|lance|harpoon|ngalio|kertig military fork|celya|bone-tipped spade|hunthsleg|javelin|spear|pitchfork|trident|allarh|pilum|skefne|stone pike|dessleg|lance|harpoon|ngalio|kertig military fork|celya|bone-tipped spade|pike with a hook-backed blade|hunthsleg|war lance|slender lance|fluke lance|jousting lance|spear with an oaken haft|bone spear|short iron spear|short steel spear|steel-tipped staff|glaive|predator's spear
var SLING_WEAPON akren dzelt|staff sling|sling
var BOW_WEAPON shortbow|short bow|composite bow|longbow|forester's bow|war bow|Pirate's bow|flat bow|horse bow|yew bow|siege bow|flight bow|reflex bow|battle bow|hirdu bow|steppe bow|horseman's bow|assassin's bow|bow designed for shipboard|S'rnhhl bow|savannah bow|recurve bow|plains bow|saddle bow|takedown bow|pine guti|jranoki|jiranoci|chunenguti|taisgwelduan|Khor'vela mahil
var CROSSBOW_WEAPON crossbow|heavy crossbow|mariner's crossbow|mahogany crossbow|skirmisher's crossbow|battle stonebow|pitch-black crossbow|ash crossbow|ebony crossbow|flamewood crossbow|reinforced crossbow|steel-gipped crossbow|wood crossbow|blue-black crossbow|bone-handled crossow|rusty crossbow|sniper's crossbow|ironwood crossbow|walnut crossbow|silverwillow crossbow|dako'gi crossbow|gut-stringed crossbow|inkhorn crossbow|riot crossbow|chestnut crossbow|crossbow crafted|drop-trigger crossbow|double-stringed crossbow|repeating crossbow|ebonwood crossbow|arbalest|stonebow|slurbow|uku'uanstaho
var BRAWL_WEAPON blowgun

var WeaponList %SE_LT_WEAPON|%POLE_HT_WEAPON|%SB_LT_WEAPON|%LE_HT_WEAPON|%LB_HT_WEAPON|%2SE_HT_WEAPON|%LB_LT_WEAPON|%LB_HE_WEAPON|%SB_SE_WEAPON|%SB_STAVE_WEAPON|%2HB_2HE_WEAPON|%2HB_LB_WEAPON|%2HE_HE_WEAPON|%SE_WEAPON|%LE_WEAPON|%2HE_WEAPON|%SB_WEAPON|%LB_WEAPON|%2HB_WEAPON|%SLING_WEAPON|%BOW_WEAPON|%CROSSBOW_WEAPON|%STAVE_WEAPON|%POLEARM_WEAPON|%LT_WEAPON|%HT_WEAPON|%BRAWL_WEAPON

ACTION.INIT:
     action (track) math hit1Counter add 1;goto HIT_COUNTER when clout its temple with a single precise stroke
     action (track) math hit3Counter add 1;goto HIT_COUNTER when reveal yourself as you deftly land a solid blow 
     action (track) math hit3Counter add 1;goto HIT_COUNTER when With a quick flick of your wrist, you fling some gore off your blade
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a brushing\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands an ineffective\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a harmless\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a gentle\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a grazing\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a skimming\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a benign\b)
     action (track) math hit1Counter add 1;goto HIT_COUNTER when ^(The .* lands a glancing\b)
     action (track) math hit2Counter add 1;goto HIT_COUNTER when ^(The .* lands a light hit\b)
     action (track) math hit3Counter add 1;goto HIT_COUNTER when ^(The .* lands a good hit\b)
     action (track) math hit4Counter add 1;goto HIT_COUNTER when ^(The .* lands a good strike\b)
     action (track) math hit5Counter add 1;goto HIT_COUNTER when ^(The .* lands a solid hit\b)
     action (track) math hit6Counter add 1;goto HIT_COUNTER when ^(The .* lands a hard hit\b)
     action (track) math hit7Counter add 1;goto HIT_COUNTER when ^(The .* lands a strong hit\b)
     action (track) math hit8Counter add 1;goto HIT_COUNTER when ^(The .* lands a heavy strike\b)
     action (track) math hit9Counter add 1;goto HIT_COUNTER when ^(The .* lands a very heavy hit\b)
     action (track) math hit10Counter add 1;goto HIT_COUNTER when ^(The .* lands an extremely heavy hit\b)
     action (track) math hit11Counter add 1;goto HIT_COUNTER when ^(The .* lands a powerful strike\b)
     action (track) math hit12Counter add 1;goto HIT_COUNTER when ^(The .* lands a massive strike\b)
     action (track) math hit13Counter add 1;goto HIT_COUNTER when ^(The .* lands an awesome strike\b)
     action (track) math hit14Counter add 1;goto HIT_COUNTER when ^(The .* lands a vicious strike\b)
     action (track) math hit15Counter add 1;goto HIT_COUNTER when ^(The .* lands an earth-shaking strike\b)
     action (track) math hit16Counter add 1;goto HIT_COUNTER when ^(The .* lands a demolishing hit\b)
     action (track) math hit17Counter add 1;goto HIT_COUNTER when ^(The .* lands a spine-rattling strike\b)
     action (track) math hit18Counter add 1;goto HIT_COUNTER when ^(The .* lands a devastating hit\b)
     action (track) math hit19Counter add 1;goto HIT_COUNTER when ^(The .* lands an overwhelming strike\b)
     action (track) math hit20Counter add 1;goto HIT_COUNTER when ^(The .* lands an obliterating hit\b)
     action (track) math hit21Counter add 1;goto HIT_COUNTER when ^(The .* lands an annihilating strike\b)
     action (track) math hit22Counter add 1;goto HIT_COUNTER when ^(The .* lands a cataclysmic strike\b)
     action (track) math hit23Counter add 1;goto HIT_COUNTER when ^(The .* lands an apocalyptic strike\b)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* dodges\,)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* evades\,)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* blocks\,)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* parry\,)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* parries\,)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* fends)
     action (track) math miss add 1;goto MISS_COUNTER when ((A|The) .* beats)
     action (track) off
     action instant var LT 1; var Brawling 0; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Light Thrown")
     action instant var HT 1; var LT 0; var Brawling 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Heavy Thrown")
     action instant var 2HE 1; var HT 0; var LT 0; var Brawling 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Twohanded Edged")
     action instant var LE 1; var HT 0; var 2HE 0; var LT 0; var Brawling 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Large Edged")
     action instant var SE 1; var HT 0; var 2HE 0; var LE 0; var LT 0; var Brawling 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Small Edged")
     action instant var 2HB 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var LT 0; var Brawling 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Twohanded Blunt")
     action instant var LB 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LT 0; var Brawling 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Large Blunt")
     action instant var SB 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var LT 0; var Brawling 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Small Blunt")
     action instant var Bow 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var LT 0; var Brawling 0; var Xbow 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Bow")
     action instant var Xbow 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var LT 0; var Brawling 0; var Slings 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Crossbow")
     action instant var Slings 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var LT 0; var Brawling 0; var Polearms 0; var Staves 0 when eval matchre("$lastLearned", "Slings")
     action instant var Polearms 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var LT 0; var Brawling 0; var Staves 0 when eval matchre("$lastLearned", "Polearms")
     action instant var Staves 1; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var LT 0; var Brawling 0 when eval matchre("$lastLearned", "Staves")
     #action instant var Brawling 1; Staves 0; var HT 0; var 2HE 0; var LE 0; var SE 0; var 2HB 0; var LB 0; var SB 0; var Bow 0; var Xbow 0; var Slings 0; var Polearms 0; var LT 0 when eval matchre("$lastLearned", "Brawling")
     #action instant goto WEAPON_SWAP when ^You draw out your (\S+)
     #action instant goto WEAPON_SWAP when ^You pick up a %WeaponList
     
INIT:
     put #window add HitTracker
     put #window add HitTrackerLog
     put #window show HitTracker
     put #window show HitTrackerLog
     put #clear HitTracker
     put #window show HitTrackerLog
     put #layout save
     put #var save
     pause 0.1
     send /expecho on
     send /expecho pulse off
     pause 0.5
     pause 0.1
     put #clear HitTracker
     put #echo >HitTracker 
     put #echo >HitTracker *** HIT TRACKER 9000 ***
     put #echo >HitTracker * HitTracker Script!
     put #echo >HitTracker * Tracks hits in combat
     put #echo >HitTracker * Tracks hit % for each weapon
     put #echo >HitTracker * Tracks overall effectiveness
     put #echo >HitTracker * Completely passive 
     put #echo >HitTracker * Detects when you switch weapons
     put #echo >HitTracker * Works overtop any script 
     put #echo >HitTracker *************************
     put #echo >HitTracker 
     put #echo >HitTracker 
     echo
     echo *** HIT TRACKER INITIALIZED! 
     echo *** TRACKING YOUR WEAPON HIT STATS!
     echo

STAT_CHECK:
     delay 0.1
     var weaponLoop 0
     action var strength $1;put #var strength $1 when Strength : (\S+)
     action var agility $1;put #var agility $1 when Agility : (\d+)
     send info;encum
     waitforre ^\s*Encumbrance\s*\:
     action remove Strength : (\S+)
     action remove Agility : (\d+)
     delay 0.2
     ECHO
     ECHO **** Guild: $guild  *****
     ECHO **** Circle: $circle *****
     ECHO **** Agility: $agility
     ECHO
     
TOP:
WEAPON_SCAN:
     delay 0.001
     math weaponLoop add 1
     echo Scanning...
     if matchre("$lefthand|$righthand" , "%WeaponList") then 
          {
          var Weapon $0
          var CurrentWeapon %Weapon
          if ("$righthand" != "Empty") then var Weapon $righthand
          if ("$lefthand" != "Empty") then var Weapon $lefthand
          echo
          echo *** Weapon Detected - %Weapon
          echo
          pause 0.1
          goto SETUP
          }
     if matchre("$lefthand" = "Empty") || ("$righthand" = "Empty") then 
          {
               if (%LT = 1) then goto LT_SET
               if (%HT = 1) then goto HT_SET
               if (%Brawling = 1) then goto Brawling_SET
          }
     if %weaponLoop > 4 then
          {
               echo
               echo *** No weapon detected. Checking for brawling.
               echo
               matchre Brawling_SET you punch|you gouge|you slap|you kick|you claw|you elbow|you knee
               matchwait 7
               if matchre("$lastLearned" , "Brawling") || (%Brawling = 1) then goto Brawling_SET
               goto WEAPON_SCAN
          }
     if %weaponLoop > 10 then
          {
               var weaponLoop 0
               goto STEUP
          }
     delay 0.5
     delay 0.5
     goto WEAPON_SCAN
SETUP:
#MULTI WEAPONS HERE
     math trackLoop add 1
     echo Checking for Skill type...
          if (%LT = 1) then goto LT_SET
          if (%LT = 1) then goto LT_SET
          if (%HT = 1) then goto HT_SET
          if (%2HE = 1) then goto 2HE_SET
          if (%LE = 1) then goto LE_SET
          if (%SE = 1) then goto SE_SET
          if (%2HE = 1) then goto 2HB_SET
          if (%LB = 1) then goto LB_SET
          if (%SB = 1) then goto SB_SET
          if (%Bow = 1) then goto Bow_SET
          if (%Xbow = 1) then goto Crossbow_SET
          if (%Slings = 1) then goto Slings_SET
          if (%Staves = 1) then goto Staves_SET
          if (%Polearms = 1) then goto Polearms_SET
          if matchre("$lefthand" = "Empty") || ("$righthand" = "Empty") then 
               {
                    if (%Brawling = 1) then goto Brawling_SET
               }
     if %trackLoop > 5 then
          {
               echo
               echo *** Checking for brawling...
               echo
               if (%LT = 1) then goto LT_SET
               if (%HT = 1) then goto HT_SET
               if (%Brawling = 1) then goto Brawling_SET
               matchre THROWN_SET you throw
               matchre Brawling_SET you punch|you gouge|you slap|you kick|you claw|you elbow
               matchwait 8
               var trackLoop 0
          }
     delay 0.5
     if %trackLoop > 3 then goto SETUP2
     delay 0.3
     goto SETUP
SETUP2:
     if matchre("$lefthand|$righthand" , "%SE_LT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%SB_LT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%LB_LT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%POLE_HT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%LE_HT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%2HE_HT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%2HB_HT_WEAPON") then goto DECIDE
     if matchre("$lefthand|$righthand" , "%LB_HT_WEAPON") then goto DECIDE
### MULTI MELEE WEAPONS
2HE_HE_LOOP:
     if matchre("$lefthand|$righthand" , "%2HE_HE_WEAPON") then 
          {
          if matchre("$lastLearned" , "Twohanded Edged") || (%2HE = 1) then goto 2HE_SET
          if matchre("$lastLearned" , "Large Edged") || (%LE = 1) then goto LE_SET
          goto 2HE_HE_LOOP
          }
SB_SE_LOOP:
     if matchre("$lefthand|$righthand" , "%SB_SE_WEAPON") then 
          {
          if matchre("$lastLearned" , "Small Blunt") || (%SB = 1) then goto SB_SET
          if matchre("$lastLearned" , "Small Edged") || (%SE = 1) then goto SE_SET
          goto SB_SE_LOOP
          }
SB_STAVE_LOOP:
     if matchre("$lefthand|$righthand" , "%SB_STAVE_WEAPON") then 
          {
          if matchre("$lastLearned" , "Small Blunt") || (%SB = 1) then goto SB_SET
          if matchre("$lastLearned" , "Staves") || (%Staves = 1) then goto Staves_SET
          goto SB_STAVE_LOOP
          }
2HB_2HE_LOOP:
     if matchre("$lefthand|$righthand" , "%2HB_2HE_WEAPON") then 
          {
          if matchre("$lastLearned" , "Twohanded Blunt") || (%2HB = 1) then goto 2HB_SET
          if matchre("$lastLearned" , "Twohanded Edged") || (%2HE = 1) then goto 2HE_SET
          goto 2HB_2HE_LOOP
          }
2HB_LB_LOOP:
     if matchre("$lefthand|$righthand" , "%2HB_LB_WEAPON") then 
          {
          if matchre("$lastLearned" , "Twohanded Blunt") || (%2HB = 1) then goto 2HB_SET
          if matchre("$lastLearned" , "Large Blunt") || (%LB = 1) then goto LB_SET
          goto 2HB_LB_LOOP
          }
SB_LE_LT_LOOP:
     if matchre("$lefthand|$righthand" , "%SB_LE_LT_WEAPON") then 
          {
          if matchre("$lastLearned" , "Small Blunt") || (%SB = 1) then goto SB_SET
          if matchre("$lastLearned" , "Large Edged") || (%LE = 1) then goto LE_SET
          if matchre("$lastLearned" , "Light Thrown") || (%LT = 1) then goto LT_SET
          goto SB_LE_LT_LOOP
          }   
### END OF MULTI WEAPONS
### BEGIN SINGLE WEAPON SET 
SE_SET:     
     if matchre("$lefthand|$righthand" , "%SE_WEAPON") then 
          {
               var Skill Small_Edged
               var Type SE
               var melee 1
               gosub TRACKING
               goto LOOP
          }
LE_SET:
     if matchre("$lefthand|$righthand" , "%LE_WEAPON") then 
          {
               var Skill Large_Edged
               var Type LE
               var melee 1
               gosub TRACKING
               goto LOOP
          }
2HE_SET:
     if matchre("$lefthand|$righthand" , "%2HE_WEAPON") then 
          {
               var Skill Twohanded_Edged
               var Type 2HE
               var melee 1
               gosub TRACKING
               goto LOOP
          }
SB_SET:
     if matchre("$lefthand|$righthand" , "%SB_WEAPON") then 
          {
               var Skill Small_Blunt
               var Type SB
               var melee 1
               gosub TRACKING
               goto LOOP
          }
LB_SET:
     if matchre("$lefthand|$righthand" , "%LB_WEAPON") then 
          {
               var Skill Large_Blunt
               var Type LB
               var melee 1
               gosub TRACKING
               goto LOOP
          }
2HB_SET:
     if matchre("$lefthand|$righthand" , "%2HB_WEAPON") then 
          {
               var Skill Twohanded_Blunt
               var Type 2HB
               var melee 1
               gosub TRACKING
               goto LOOP
          }
Crossbow_SET:
     if matchre("$lefthand|$righthand" , "%CROSSBOW_WEAPON") then 
          {
               var Skill Crossbow
               var Type Crossbow
               var melee 0
               gosub TRACKING
               goto LOOP
          }
Slings_SET:
     if matchre("$lefthand|$righthand" , "%SLING_WEAPON") then 
          {
               var Skill Slings
               var Type Slings
               var melee 0
               gosub TRACKING
               goto LOOP
          }
Bow_SET:
     if matchre("$lefthand|$righthand" , "%BOW_WEAPON") then 
          {
               var Skill Bow
               var Type Bow
               var melee 0
               gosub TRACKING
               goto LOOP
          }
Staves_SET:
     if matchre("$lefthand|$righthand" , "%STAVE_WEAPON") then 
          {
               var Skill Staves
               var Type Staves
               var melee 1
               gosub TRACKING
               goto LOOP
          }
Polearms_SET:
     if matchre("$lefthand|$righthand" , "%POLEARM_WEAPON") then 
          {
               var Skill Polearms
               var Type Pole
               var melee 1
               gosub TRACKING
               goto LOOP
          }
ECHO
ECHO *** Scanning for weapon...
ECHO
pause 0.1
pause 0.6
goto SETUP
############################################################################
### MULTI WEAPON DECISION 
DECIDE:
     var trigger 0
     echo
     echo *** Multi-weapon detected! Checking weapon type...
     echo
     pause 0.4
     if (%LT = 1) then goto LT_SET
     if (%HT = 1) then goto HT_SET
     if (%2HE = 1) then goto 2HE_SET
     if (%LE = 1) then goto LE_SET
     if (%SE = 1) then goto SE_SET
     if (%2HB = 1) then goto 2HB_SET
     if (%LB = 1) then goto LB_SET
     if (%SB = 1) then goto SB_SET
     if (%Xbow = 1) then goto Crossbow_SET
     if (%Bow = 1) then goto Bow_SET
     if (%Slings = 1) then goto Slings_SET
     if (%Staves = 1) then goto Staves_SET
     if (%Polearms = 1) then goto Polearms_SET
     matchre MELEE you charge|you swing a|you chop a|you slam|you jab a|you bash a|you draw a|you feint a|you punch|you kick|you elbow|you gouge|you thrust|you slice|you lunge
     matchre THROWN_CHECK you throw|you fire|you lob|you toss|you snipe
     matchwait
MELEE:
     if matchre("$lefthand|$righthand" , "%SE_LT_WEAPON") then 
          {
               var Skill Small_Edged
               var Type SE
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%SB_LT_WEAPON") then 
          {
               var Skill Small_Blunt
               var Type SB
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%POLE_HT_WEAPON") then 
          {
               var Skill Polearms
               var Type Pole
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%LE_HT_WEAPON") then 
          {
               var Skill Large_Edged
               var Type LE
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%LB_HT_WEAPON") || matchre("$lefthand|$righthand" , "%LB_LT_WEAPON") then 
          {
               var Skill Large_Blunt
               var Type LB
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%2HE_HT_WEAPON") then 
          {
               var Skill Twohanded_Edged
               var Type 2HE
               goto MELEE.SET
          }
     if matchre("$lefthand|$righthand" , "%2HB_HT_WEAPON") then 
          {
               var Skill Twohanded_Blunt
               var Type 2HB
               goto MELEE.SET
          }
MELEE.SET:
     var melee 1
     gosub TRACKING
     goto LOOP
THROWN:
     var trigger 0
     var melee 0
     if (%LT = 1) then goto LT_SET
     if (%HT = 1) then goto HT_SET
     matchre THROWN_CHECK ^You get|^You pick
     matchwait 5
     goto THROWN
THROWN_CHECK:
     if matchre("%CurrentWeapon" , "%SE_LT_WEAPON") || matchre("%CurrentWeapon" , "%LB_LT_WEAPON") || matchre("%CurrentWeapon" , "%SB_LT_WEAPON") || matchre("%CurrentWeapon" , "%SE_WEAPON") then
          {
               goto LT_SET
          }
     if matchre("%CurrentWeapon" , "%POLE_HT_WEAPON") || matchre("%CurrentWeapon" , "%LE_HT_WEAPON") || matchre("%CurrentWeapon" , "%2HB_HT_WEAPON") || matchre("%CurrentWeapon" , "%2HE_HT_WEAPON") || matchre("%CurrentWeapon" , "%LB_HT_WEAPON") || matchre("%CurrentWeapon" , "%LB_HT_WEAPON") || matchre("%CurrentWeapon" , "%LE_WEAPON") || matchre("%CurrentWeapon" , "%2HE_WEAPON") then 
          {
               goto HT_SET
          }
     if (%LT = 1) then goto LT_SET
     if (%HT = 1) then goto HT_SET
     delay 0.1
     delay 0.1
     goto THROWN_CHECK
#### END OF MULTIWEAPON
THROWN_SET:
     math thrownCheck add 1
     if (%LT = 1) then goto LT_SET
     if (%HT = 1) then goto HT_SET
     pause 0.1
     pause 0.1
     if %thrownCheck > 30 then goto SETUP
     goto THROWN_SET
LT_SET:
     #if matchre("$lefthand|$righthand" , "%LT_WEAPON") then 
     #     {
               var Skill Light_Thrown
               var Type LT
               var melee 0
               gosub TRACKING
               goto LOOP
HT_SET:
     #if matchre("$lefthand|$righthand" , "%HT_WEAPON") || matchre("$lefthand|$righthand" , "%HT_WEAPON") then 
     #     {
               var Skill Heavy_Thrown
               var Type HT
               var melee 0
               gosub TRACKING
               goto LOOP
     #     }
Brawling_SET:
     if matchre("$lefthand" = "Empty") then
          {
               if matchre("$righthand" = "Empty") then 
                    {
                    var Weapon Hands
                    var Skill Brawling
                    var Type Brawl
                    var melee 1
                    gosub TRACKING
                    goto LOOP
                    }
          }
     if ("$lefthand" != "Empty") then var Weapon $lefthand
     if ("$righthand" != "Empty") then var Weapon $righthand
     var Skill Brawling
     var Type Brawl
     var melee 1
     gosub TRACKING
     goto LOOP  
     goto SETUP
### END WEAPON SCAN / SKILL SET
##################################################################################################################
#### BEGIN TRACKING LOOP
TRACKING:
     timer start
     var weaponLoop 0
     var trackLoop 0
     var CurrentWeapon %Weapon
     echo
     echo **** HIT TRACKER 9000
     echo **** Detected: %CurrentWeapon
     echo **** Tracking: %Skill stats
     echo
     #put #clear HitTracker
     #put #echo >HitTracker 
     #put #echo >HitTracker ****** HIT TRACKER 9000 *******
     #put #echo >HitTracker *** Tracking %Skill Skill
     #put #echo >HitTracker *** Attacking w/: %CurrentWeapon
     #put #echo >HitTracker *** Total attacks: %swings
     #put #echo >HitTracker *** Hits: %hits
     #put #echo >HitTracker *** Misses: %miss
     #put #echo >HitTracker *** %percentile% effective 
     #put #echo >HitTracker ******************************
     #put #echo >HitTracker 
     #put #echo >HitTracker 
     RETURN

##############################################################################################################
## CHECK SECTION
CHECK:
     action (track) on
     pause 0.1
     if ("%Skill" = "Brawling") then 
          {
               if matchre("$lefthand|$righthand" , "%WeaponList") then goto CHECK2
          }
     if ("%Skill" != "Brawling") then 
          {
               if !matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto CHECK2
          }
LOOP:
     action (track) on
     var checkCount 0
     var CurrentSkill %Skill
     if matchre("$lefthand", "%WeaponList") then var CurrentWeapon $lefthand
     if matchre("$righthand", "%WeaponList") then var CurrentWeapon $righthand
     if (%melee = 1) && ("%trigger" = 0) then gosub THROW.TRIGGER
     if (%LT = 1) then var Skill Light_Thrown
     if (%HT = 1) then var Skill Heavy_Thrown
     if (%2HE = 1) then var Skill Twohanded_Edged
     if (%LE = 1) then var Skill Large_Edged
     if (%SE = 1) then var Skill Small_Edged
     if (%2HB = 1) then var Skill Twohanded_Blunt
     if (%LB = 1) then var Skill Large_Blunt
     if (%SB = 1) then var Skill Small_Blunt
     if (%Xbow = 1) then var Skill Crossbow
     if (%Bow = 1) then var Skill Bow
     if (%Slings = 1) then var Skill Slings
     if (%Staves = 1) then var Skill Staves
     if (%Brawling = 1) then var Skill Brawling
     if (%Polearms = 1) then var Skill Polearms
     if ("%CurrentSkill" != "%Skill") then goto CHECK2
     delay 0.5
     goto checkpause
HIT_COUNTER:
     math hits add 1
     delay 0.001
MISS_COUNTER:
     math swings add 1
     delay 0.1
     if %t < 8 then goto CHECK
CALCULATE:
     timer reset
     var CurrentWeapon %Weapon
     var hits2 %hits
     math hits divide %swings
     math hits multiply 100
     var percentile %hits
     evalmath percentile round(%percentile,2)
     var hits %hits2
     delay 0.001
     math echoCount add 1
UPDATE:
     if matchre("$lefthand|$righthand" , "%WeaponList") then 
          {
          var Weapon $0
          var CurrentWeapon %Weapon
          if ("$righthand" != "Empty") then var Weapon $righthand
          if ("$lefthand" != "Empty") then var Weapon $lefthand
          }
     if ("%VERBOSE" = "ON") && (%echoCount > 5) then
          {
          echo
          echo **** Tracking %Skill Stats
          echo **** Attacking w/ %CurrentWeapon
          echo **** %swings Attacks - %hits hits - %percentile% effective
          echo
          var echoCount 0
          }
     put #clear HitTracker
     put #echo >HitTracker
     put #echo >HitTracker ** HIT TRACKER 9000 **
     put #echo >HitTracker ** Tracking %Skill Skill
     put #echo >HitTracker ** Weapon: %CurrentWeapon
     #if ("$lefthand" != "Empty") then put #echo >HitTracker *** Weapon: $lefthand
     #if ("$righthand" != "Empty") then put #echo >HitTracker *** Weapon: $righthand
     put #echo >HitTracker ** Total attacks: %swings
     put #echo >HitTracker ** Hits: %hits
     put #echo >HitTracker ** Misses: %miss
     put #echo >HitTracker ** %percentile% hit rate 
     put #echo >HitTracker ********************
     put #echo >HitTracker 
     put #echo >HitTracker
     timer start
     goto CHECK
checkpause:
pause 8
goto CHECK
CHECK2:
     delay 0.001
     action (track) off
     math checkCount add 1
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     if ("%Skill" = "Brawling") then 
          {
               if matchre("$lefthand|$righthand" , "%WeaponList") then goto WEAPON_SWAP
          }
     if matchre("$lefthand|$righthand" , "%WeaponList") then 
          {
               if !matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto WEAPON_SWAP
          }
     if matchre("$lefthand" = "Empty") && ("$righthand" = "Empty") then
          {
               if (%LT = 1) then goto LOOP
               if (%HT = 1) then goto LOOP
               if ("%Skill" = "Light_Thrown") then goto THROWCHECK
               if ("%Skill" = "Heavy_Thrown") then goto THROWCHECK
          }
CHECK.CONT:
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     if (%checkCount > 9) then goto WEAPON_SWAP
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     if matchre("$lefthand" = "Empty") || ("$righthand" = "Empty") then 
          {
               if matchre("$lastLearned" , "Brawling") || (%Brawling = 1) then 
                    {
                    matchre LOOP %CurrentWeapon
                    matchre WEAPON_SWAP you punch|you gouge|you slap|you kick|you claw|you elbow
                    matchwait 5
                    }
          }
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     matchre LOOP %CurrentWeapon
     matchwait 3
     goto CHECK2
     
     
THROWCHECK:
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     matchre LOOP you throw|you fire|you lob|you toss|you snipe|you launch
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     pause
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     if matchre("$lefthand|$righthand" , "%WeaponList") then goto WEAPON_SWAP
     if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto LOOP
     matchwait 6
     goto CHECK.CONT

THROW.TRIGGER:
var trigger 1
action (thrown) goto THROW_SWAP when you toss|you lob|you throw
RETURN

#### WEAPON SWAP LOGIC
WEAPON_SWAP:
if matchre("$lefthand|$righthand" , "%CurrentWeapon") then goto CHECK
THROW_SWAP:
action (track) off
action (thrown) off
action remove you toss|you lob|you throw
var checkCount 0
     echo
     echo **************************
     echo *** Weapon swap detected
     echo **************************
     echo
     put #clear HitTracker
     put #echo >HitTracker
     put #echo >HitTracker ****** HIT TRACKER 9000 ******
     put #echo >HitTracker ** Weapon Swap Detected!
     put #echo >HitTracker ** Saving all your stats..
     put #echo >HitTracker ** Weapon: %CurrentWeapon
     put #echo >HitTracker ** Skill: %Skill
     put #echo >HitTracker ** Hits: %hits - Misses: %miss
     put #echo >HitTracker ** Effective rate: %percentile
     put #echo >HitTracker ******************************
     put #echo >HitTracker
     put #echo >HitTracker
if ("%Type" = "SE") then put #var EffectiveRate.SmallEdged %percentile
if ("%Type" = "LE") then put #var EffectiveRate.LargeEdged %percentile
if ("%Type" = "2HE") then put #var EffectiveRate.TwohandedEdged %percentile
if ("%Type" = "SB") then put #var EffectiveRate.SmallBlunt %percentile
if ("%Type" = "LB") then put #var EffectiveRate.LargeBlunt %percentile
if ("%Type" = "2HB") then put #var EffectiveRate.TwohandedBlunt %percentile
if ("%Type" = "LT") then put #var EffectiveRate.LightThrown %percentile
if ("%Type" = "HT") then put #var EffectiveRate.HeavyThrown %percentile
if ("%Type" = "Crossbow") then put #var EffectiveRate.Crossbow %percentile
if ("%Type" = "Bow") then put #var EffectiveRate.Bow %percentile
if ("%Type" = "Staves") then put #var EffectiveRate.Staves %percentile
if ("%Type" = "Pole") then put #var EffectiveRate.Pole %percentile
if ("%Type" = "Slings") then put #var EffectiveRate.Slings %percentile
if ("%Type" = "Brawl") then put #var EffectiveRate.Brawl %percentile
put #window show HitTrackerLog
put #echo >HitTrackerLog *%Skill Skill
put #echo >HitTrackerLog *%percentile% hit rate
put #echo >HitTrackerLog *%swings attacks
put #echo >HitTrackerLog ******************
var miss 0 
var hits 0
var swings 0
var hits2 0
var checkCount 0
var percentile 0
var trigger 0
var CurrentWeapon NULL
var Weapon NULL
var Skill NULL
var LT 0
var HT 0
var 2HE 0
var LE 0
var SE 0
var 2HB 0
var LB 0
var SB 0
var Bow 0
var Xbow 0
var Slings 0
var Polearms 0
var Staves 0
var Brawling 0
if %trigger = 1 then goto THROWN
goto TOP

#### END WEAPON SWAP 
###############################################################################################

