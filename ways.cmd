###############################
# WAYS SCRIPT FOR MMs
# Originally made by Copernicus?
# Updated by Shroom 
#
# USAGE - .ways cross / .ways (city name) 
# WILL END AT THE SHARD CLOSEST TO THE CITY YOU CHOOSE 
#
# WARNING!! SCRIPT ASSUMES YOU ARE 100+ CIRCLE W/ THE QUEST AND CAN TAKE WAYS FROM ANYWHERE
# DOES NOT TRY TO TRAVEL TO THE SHARD FIRST! 
# IF YOU ARE UNDER CIRCLE 100 YOU SHOULD BE ABLE TO START IT IN THE SHARD ROOM 
# 
###############################


Script.begin:
var destination %1

action clear

echo ########################################
echo #############   SHARD LISTING   ###############
echo ########################################
echo ####       Shard         ~~        City       ~~         Pillar     ###
echo #### _____________________________________________________________  ###
echo ####                                                                ###
echo ####  Rolagi                   Crossings               Nightmares   ###
echo #### -------------------------------------------------------------  ###
echo ####  Tabelrm                  Muspar'i                Nightmares   ###
echo #### -------------------------------------------------------------  ###
echo ####  Auilusi                  Aesry                   Tradition    ###
echo #### -------------------------------------------------------------  ###
echo ####  Dor'na'torna             Arid Steppe             Tradition    ###
echo #### -------------------------------------------------------------  ###
echo ####  Marendin                 Shard                   Secret       ###
echo #### -------------------------------------------------------------  ###
echo ####  Besoge                   Mer'kresh               Secret       ###
echo #### -------------------------------------------------------------  ###
echo ####  Vellano                  Fang Cove               Unity        ###
echo #### -------------------------------------------------------------  ###
echo ####  Emalerje                 Volcano (Tiv)           Shrew        ###
echo #### -------------------------------------------------------------  ###
echo ####  Asharshpar'i             Leth Deriel             Heavens      ###
echo #### -------------------------------------------------------------  ###
echo ####  Tamigen                  Raven's Point           Heavens      ###
echo #### -------------------------------------------------------------  ###
echo ####  Dinegavren               Therenborough           Introspection###
echo #### -------------------------------------------------------------  ###
echo ####  Taniendar                Riverhaven              Introspection###
echo #### -------------------------------------------------------------  ###
echo ####  Mintais                  Throne City             Fortune      ###
echo #### -------------------------------------------------------------  ###
echo ####  Erekinzil                Taisgath                Fortune      ###
echo #### -------------------------------------------------------------  ###
echo #######################################
echo #######################################
echo
echo (Crossing|Muspar'i|Aesry|Arid Steppe|Shard|Mer'kresh|Fang|Tiv|Greater Fist|Leth|Raven|Theren|Haven|Throne|Tais)

var dest.shard null
eval destination tolower(%destination)

if matchre("%destination", "crossing") then var dest.shard Rolagi
if matchre("%destination", "cross") then var dest.shard Rolagi
if matchre("%destination", "cro") then var dest.shard Rolagi
if matchre("%destination", "xing") then var dest.shard Rolagi

if matchre("%destination", "mus") then var dest.shard Tabelrem
if matchre("%destination", "muspar") then var dest.shard Tabelrem
if matchre("%destination", "musp") then var dest.shard Tabelrem

if matchre("%destination", "\baes") then var dest.shard Auilusi
if matchre("%destination", "aesr") then var dest.shard Auilusi
if matchre("%destination", "aesry") then var dest.shard Auilusi

if matchre("%destination", "arid steppe") then var dest.shard Dor'na'torna
if matchre("%destination", "arid") then var dest.shard Dor'na'torna
if matchre("%destination", "hib") then var dest.shard Dor'na'torna
if matchre("%destination", "p5") then var dest.shard Dor'na'torna

if matchre("%destination", "shard") then var dest.shard Marendin
if matchre("%destination", "shar") then var dest.shard Marendin

if matchre("%destination", "kresh") then var dest.shard Besoge
if matchre("%destination", "merkresh") then var dest.shard Besoge
if matchre("%destination", "merk") then var dest.shard Besoge
if matchre("%destination", "mriss") then var dest.shard Besoge
if matchre("%destination", "riss") then var dest.shard Besoge

if matchre("%destination", "fang") then var dest.shard Vellano
if matchre("%destination", "cove") then var dest.shard Vellano
if matchre("%destination", "fc") then var dest.shard Vellano

if matchre("%destination", "tiv") then var dest.shard Emalerje
if matchre("%destination", "volcano") then var dest.shard Emalerje
if matchre("%destination", "greater Fist") then var dest.shard Emalerje
if matchre("%destination", "greater") then var dest.shard Emalerje

if matchre("%destination", "leth") then var dest.shard Asharshpar'i
if matchre("%destination", "oshu") then var dest.shard Asharshpar'i

if matchre("%destination", "raven") then var dest.shard Tamigen

if matchre("%destination", "theren") then var dest.shard Dinegavren

if matchre("%destination", "haven") then var dest.shard Taniendar
if matchre("%destination", "riverhaven") then var dest.shard Taniendar

if matchre("%destination", "throne") then var dest.shard Mintais
if matchre("%destination", "tc") then var dest.shard Mintais

if matchre("%destination", "taisgath") then var dest.shard Erekinzil
if matchre("%destination", "taigs") then var dest.shard Erekinzil
if matchre("%destination", "taisg") then var dest.shard Erekinzil
if matchre("%destination", "tais") then var dest.shard Erekinzil

if ("%dest.shard" = "null") then goto not.valid

put #echo >Log #FF0275 * ASTRAL TRAVEL START - Zone: $zonename
pause 0.1
if matchre("$roomname", "Astral Plane") then goto Find.microcosm

Open.conduit:
GOSUB PREPARE mg
GOSUB HARNESS 50
pause 3
GOSUB CAST grazhir

Find.microcosm:
 action var direction north when You believe the center of the microcosm is to the north\.
 action var direction south when You believe the center of the microcosm is to the south\.
 action var direction east when You believe the center of the microcosm is to the east\.
 action var direction west when You believe the center of the microcosm is to the west\.
 action var direction northeast when You believe the center of the microcosm is to the northeast\.
 action var direction northwest when You believe the center of the microcosm is to the northwest\.
 action var direction southwest when You believe the center of the microcosm is to the southwest\.
 action var direction southeast when You believe the center of the microcosm is to the southeast\.
 action var at.microcosm YES when Astral Plane, Pillar
 action var at.microcosm YES when Obvious exits: east, west, up, down

Find.microcosm1:
GOSUB power
GOSUB move %direction
pause .5
if %at.microcosm != YES then goto Find.microcosm1
 else goto At.pillars

At.pillars:
 action clear
 action var in.conduit YES when You move into the chaotic tides of energy
 action var in.conduit YES when You reach out into the seemingly infinite strands of Lunar mana and find a conduit
 #if %dest.shard == Taniendar then GOSUB move down
 #if %dest.shard == Tamigen then GOSUB move up
GOSUB focus %dest.shard
 if %in.conduit == YES then goto Find.exit
GOSUB move east
 goto At.pillars



Find.exit:
 action clear
 action var direction north when You believe the end of the conduit lies north\.
 action var direction northeast when You believe the end of the conduit lies northeast\.
 action var direction northwest when You believe the end of the conduit lies northwest\.
 action var direction east when You believe the end of the conduit lies east\.
 action var direction west when You believe the end of the conduit lies west\.
 action var direction south when You believe the end of the conduit lies south\.
 action var direction southwest when You believe the end of the conduit lies southwest\.
 action var direction southeast when You believe the end of the conduit lies southeast\.
 action var at.exit YES when You also see the silvery-white shard

if matchre("$roomobjs", "the silvery shard") then goto At.exit
GOSUB power
if matchre("$roomobjs", "the silvery shard") then goto At.exit
GOSUB move %direction
pause .5

if (%at.exit != YES) then goto Find.exit
else goto At.exit

At.exit:
GOSUB PREPARE mg
GOSUB FOCUS %dest.shard
GOSUB CAST %dest.shard
goto exit1


not.valid:
 echo
 echo NOT A VALID DESTINATION
 echo
exit

exit1:
GOSUB release
eval destination toupper(%destination)
put #echo >Log #FF0275 * ASTRAL TRAVEL ARRIVED: %destination
echo *** Arrived at %1 ***
put #mapper reset
exit




#### SPELL CASTING
CAST:
     var spellPrepped 0
     var location CAST_1
     var todo $0
     CAST_1:
     pause 0.00001
     matchre CAST_1 ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre STUNNED ^You are still stunned
     matchre WEBBED ^You can't do that while entangled in a web
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre RETURN ^Maintaining two cyclic spells at once is beyond your mental comprehension
     matchre RETURN ^You can't cast .* yourself
     matchre RETURN ^Your target pattern dissipates because .+ is dead, but the main spell remains intact\.
     matchre RETURN ^You strain, but are too mentally fatigued to finish the pattern, and it slips away\.
     matchre RETURN ^Something in the area prevents your spell from working\.|^The mental strain of initiating a cyclic spell so recently prevents you from formulating the spell pattern\.
     matchre RETURN ^Your spell barely backfires\.|^Your spell backfires somewhat\.|^Your spell backfires\.|^Your spell hopelessly backfires\.|^Your spell.*backfires?|^Currently lacking the skill to complete the pattern, your spell fails completely\.|^You can't cast that at yourself\!|^You don't have a spell prepared\!|^You can't cast .+ on .+\!|^The spell pattern resists the influx of unfocused mana\.  You are able to contain the backlash but doing so results in a splitting headache\.|^The spell pattern resists the influx of unfocused mana though you are able to channel the worst of the backlash into your nervous system\.|^The spell pattern resists the influx of unfocused mana though the backlash leaves you stunned\!|^The spell pattern resists the influx of unfocused mana, and a strange burning sensation backwashes from the spell pattern into your body\.
     matchre RETURN ^The spell pattern collapses at the last moment due to the undead state
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^Your concentration slips for a moment\, and your spell is lost\.
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre RETURN ^You wave your hand\.
     matchre RETURN ^You gesture\.
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^Your .+ emits a loud \*snap\* as it discharges
     matchre RETURN ^You roll your hands in an elliptical pattern in front of you
     matchre RETURN ^Please rephrase|^Sheathing|^What were
     matchre RETURN ^You draw your hand|^You step inside
     matchre RETURN ^You are still stunned
     matchre RETURN ^You can't do that while entangled in a web
     matchre RETURN ^You don't seem to be able to move to do that
     matchre RETURN ^Strangely\, you don\'t feel like fighting right now\.
     matchre RETURN ^You can't cast that at yourself\!
     matchre RETURN ^Maintaining two cyclic spells at once is beyond your mental comprehension
     matchre RETURN ^You don't have a spell prepared\!
     matchre RETURN ^.* is already dead, so that's a bit pointless\.
     matchre RETURN ^Your secondary spell pattern dissipates because your target is dead, but the main spell remains intact\.
     matchre RETURN ^Your target pattern dissipates because the .* is dead\, but the main spell remains intact\.
     matchre RETURN ^You gesture
     matchre RETURN ^Focus the power of justice on whom\?
     matchre RETURN ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
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
     matchwait 10
     put #echo >$Log Crimson $datetime *** MISSING MATCH IN CAST! - %todo (base.inc) ***
     put #log $datetime MISSING MATCH IN CAST : %todo (base.inc)
     return

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
     matchwait 2
     return

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
     matchwait 10
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
#### AUTOMOVE
AUTOMOVE:
     # action var exit $1;var webtype $2;goto websarestupid when ^As you approach (?:an?|the)\b.*? ((?:[\w'-]+) [\w'-]+|[\w'-]+), you become tangled up in the.*? \b(metallic|spidersilk|phantasmal|dew-covered|shadowy nightweaver silk)\b webbing
     # action goto ABYSS_ESCAPE when ^With lightning speed, something large and arachnid bursts from below, dragging you into a web-filled, subterranean gloom!
     delay 0.00001
     action (moving) on
     var Moving 0
     var randomloop 0
     var Destination $0
     var automovefailCounter 0
     if ($hidden = 1) then gosub UNHIDE
     if ($standing = 0) then gosub AUTOMOVE_STAND
     if ($roomid = 0) then gosub RANDOMMOVE
     if ("$roomid" = "%Destination") then return
AUTOMOVE_GO:
     pause 0.00001
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchre AUTOMOVE_FAILED ^You don\'t seem
     put #goto %Destination
     matchwait 4
     if (%Moving = 0) then goto AUTOMOVE_FAILED
     matchre AUTOMOVE_FAILED ^(?:AUTOMAPPER )?MOVE(?:MENT)? FAILED
     matchre AUTOMOVE_RETURN ^YOU HAVE ARRIVED(?:\!)?
     matchre AUTOMOVE_RETURN ^SHOP CLOSED(?:\!)?
     matchre AUTOMOVE_FAIL_BAIL ^DESTINATION NOT FOUND
     matchwait 160
     goto AUTOMOVE_FAILED
AUTOMOVE_STAND:
     pause 0.00001
     if ($standing = 1) then goto AUTOMOVE_RETURN
     matchre AUTOMOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre AUTOMOVE_STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?|^\[Roundtime|^Roundtime
     matchre AUTOMOVE_STAND ^The weight of all your possessions prevents you from standing\.
     matchre AUTOMOVE_STAND ^You are still stunned\.
     matchre AUTOMOVE_RETURN ^You stand(?:\s*back)? up\.
     matchre AUTOMOVE_RETURN ^You are already standing
     send stand
     matchwait 20
     goto AUTOMOVE_STAND
AUTOMOVE_FAILED:
     pause 0.00001
     # put #script abort automapper
     pause 0.00001
     math automovefailCounter add 1
     if (%automovefailCounter > 3) then goto AUTOMOVE_FAIL_BAIL
     if (%automovefailCounter > 1) then send #mapper reset
     pause 0.1
     if ($roomid = 0) || (%automovefailCounter > 2) then gosub RANDOMMOVE
     goto AUTOMOVE_GO
AUTOMOVE_FAIL_BAIL:
     action (moving) off
     put #echo
     put #echo >Log Crimson *** AUTOMOVE FAILED. ***
     put #echo >Log Destination: %Destination
     put #echo Crimson *** AUTOMOVE FAILED.  ***
     put #echo Crimson Destination: %Destination
     put #echo
AUTOMOVE_RETURN:
     action (moving) off
     var automovefailCounter 0
     var randomloop 0
     pause 0.00001
     return
     
################################
# MOVE SINGLE
################################
MOVE:
     delay 0.0001
     var Direction $0
     var movefailCounter 0
     var randomloop 0
     var lastmoved %Direction
MOVE_RESUME:
     matchre MOVE_RETRY ^\.\.\.wait|^Sorry\, you may only type|^Please wait\.|You are still stunned\.
     matchre MOVE_RETURN_CHECK ^You can't (swim|move|climb) in that direction\.
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
     matchre MOVE_STAND ^You don\'t seem
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_STAND ^Stand up first.
     matchre MOVE_DIG ^You make no progress in the mud \-\- mostly just shifting of your weight from one side to the other\.
     matchre MOVE_DIG ^You find yourself stuck in the mud\, unable to move much at all after your pathetic attempts\.
     matchre MOVE_DIG ^You struggle forward\, managing a few steps before ultimately falling short of your goal\.
     matchre MOVE_DIG ^Like a blind\, lame duck\, you wallow in the mud in a feeble attempt at forward motion\.
     matchre MOVE_DIG ^The mud holds you tightly\, preventing you from making much headway\.
     matchre MOVE_DIG ^You fall into the mud with a loud \*SPLUT\*\.
     matchre MOVE_FAIL_BAIL ^You can't go there
     matchre MOVE_FAILED ^Noticing your attempt
     matchre MOVE_FAILED ^I could not find what you were referring to\.
     matchre MOVE_FAILED ^What were you referring to\?
     matchre MOVE_RETURN ^It's pitch dark
     matchre MOVE_RETURN ^Obvious
     send %Direction
     matchwait 8
     goto MOVE_RETURN
MOVE_RETRY:
     pause
     goto MOVE_RESUME
MOVE_STAND:
     pause 0.00001
     matchre MOVE_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_STAND ^The weight
     matchre MOVE_STAND ^You try
     matchre MOVE_STAND ^You don\'t
     matchre MOVE_RETREAT ^You are already standing\.
     matchre MOVE_RETREAT ^You stand(?:\s*back)? up\.
     matchre MOVE_RETREAT ^You stand up\.
     send stand
     matchwait 8
     goto MOVE_STAND
MOVE_RETREAT:
     pause 0.00001
     if ($invisible = 1) then gosub STOP_INVIS
     matchre MOVE_RETREAT ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_RETREAT ^You retreat back to pole range\.
     matchre MOVE_RETREAT ^You stop advancing
     matchre MOVE_RETREAT ^You try to back away
     matchre MOVE_STAND ^You must stand first\.
     matchre MOVE_RESUME ^You retreat from combat\.
     matchre MOVE_RESUME ^You are already as far away as you can get\!
     send retreat
     matchwait 10
     goto MOVE_RETREAT
MOVE_DIG:
     pause 0.00001
     matchre MOVE_DIG ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG ^You struggle to dig off the thick mud caked around your legs\.
     matchre MOVE_STAND ^You manage to dig enough mud away from your legs to assist your movements\.
     matchre MOVE_DIG_STAND ^Maybe you can reach better that way\, but you'll need to stand up for that to really do you any good\.
     matchre MOVE_RESUME ^You will have to kneel
     send dig
     matchwait 10
     goto MOVE_DIG
MOVE_DIG_STAND:
     pause 0.00001
     matchre MOVE_DIG_STAND ^\.\.\.wait|^Sorry\,|^You are still stunned\.
     matchre MOVE_DIG_STAND ^The weight
     matchre MOVE_DIG_STAND ^You try
     matchre MOVE_DIG_STAND ^You are overburdened and cannot manage to stand\.
     matchre MOVE_DIG ^You stand(?:\s*back)? up\.
     matchre MOVE_DIG ^You are already standing\.
     send stand
     matchwait 10
     goto MOVE_DIG_STAND
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
     # put #echo >$Log Crimson *** MOVE FAILED. ***
     put #echo Crimson *** MOVE FAILED.  ***
     put #echo
     return
MOVE_RETURN_CHECK:
     put look
     pause 0.1
MOVE_RETURN:
     var moved 1
     pause 0.00001
     unvar moveloop
     unvar randomloop
     unvar movefailCounter
     return
FIND_MYSELF:
MOVERANDOM:
moveRandomDirection:
     var moveloop 0
     moveRandomDirection_2:
     math moveloop add 1
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
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
     if $east then
          {
               gosub MOVE east
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
     if matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") then
          {
               gosub MOVE climb stair
               return
          }
     if matchre("$roomobjs $roomdesc","\bsteps\b") then
          {
               gosub MOVE climb step
               return
          }
     if matchre("$roomobjs $roomdesc","\b(exit|curtain|arch|door|gate|hole|hatch|trapdoor|path|animal trail|tunnel|portal)\b") then
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
     if (%moveloop > 6) then
          {
               echo *** Cannot find a room exit!! Stupid fog!
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               return
          }
     goto moveRandomDirection_2
###################################################################################
### RANDOM MOVEMENT ENGINE BY SHROOM
### GO IN RANDOM DIRECTIONS AND DON'T BACKTRACK FROM LAST MOVED DIRECTION IF POSSIBLE
### IF IT CANNOT FIND A DIRECTION, WILL TAKE ANY POSSIBLE EXIT IT CAN SEE
### WILL MOVE IN RANDOM DIRECTIONS IF IT CANNOT SEE ANY ROOM EXITS (PITCH BLACK)
###################################################################################
RANDOMMOVE:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if !($standing) then gosub STAND
     if matchre("%randomloop", "\b(12|30|50)\b") then
          {
               echo **** CANNOT FIND A ROOM EXIT????!
               put look
               pause 0.4
          }
     if (%randomloop > 25) then
          {
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               var lastmoved null
               gosub TRUE_RANDOM_2
          }
     if (%randomloop > 80) then
          {
               echo ################################
               echo *** Cannot find a room exit??? Stupid fog???
               echo *** ZONE: $zoneid | ROOM: $roomid
               echo *** SEND THE ROOM DESCRIPTION/EXITS WHEN YOU TYPE LOOK
               echo *** ATTEMPTING RANDOM DIRECTIONS...
               echo *** SHOULD AUTO-RECOVER IF YOU CAN FIND AN EXIT
               echo ###############################
               pause 0.5
               put look
               pause 0.5
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               var lastmoved null
               var randomloop 0
               return
          }
     if matchre("$roomname", "\[Skeletal Claw\]") then
          {
               echo ##################################
               echo # IN THE SKELETAL CLAW! OH NO!!!
               echo # WE MIGHT DIE IF SOMEONE DOESN'T CAST UNCURSE ON IT!
               echo # ATTEMPTING TO ESCAPE.............
               echo ##################################
               gosub MOVE out
               return
          }
     if (matchre("$roomname", "Deadman's Confide, Beach") || matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname","Smavold's Toggery") then
          {
               gosub MOVE go door
               return
          }
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then
          {
               gosub MOVE climb pine branches
               return
          }
     if matchre("$roomname","Darkling Wood, Pine Tree") then
          {
               gosub MOVE climb white pine
               return
          }
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     if (%randomloop > 10) then
          {
          if matchre("$roomobjs","stone wall") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","narrow ledge") then
               {
                    gosub MOVE climb ledge
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","craggy niche") then
               {
                    gosub MOVE climb niche
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","double door") then
               {
                    gosub MOVE go door
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","staircase") then
               {
                    gosub MOVE climb stair
               }
          if (%moved = 1) then return
          if matchre("$roomobjs","the exit") then
               {
                    gosub MOVE go exit
               }
          if matchre("$roomobjs","\bdoor\b") then
               {
                    gosub MOVE go door
               }
          }
     if (%moved = 1) then return
     random 1 11
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if (%moved = 1) then return
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if (%moved = 1) then return
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%moved = 1) then return
     ### IF DONE 13 LOOPS WITH NO MATCH THEN CHECK FOR ANY OBVIOUS ROOM EXIT
     if (%randomloop > 13) then
          {
               if ($out) then gosub MOVE out
               if (%moved = 1) then return
               if (($north) && ("%lastmoved" != "south")) then gosub MOVE north
               if (($south) && ("%lastmoved" != "north")) then gosub MOVE south
               if (%moved = 1) then return
               if (($east) && ("%lastmoved" != "west")) then gosub MOVE east
               if (($west) && ("%lastmoved" != "east")) then gosub MOVE west
               if (%moved = 1) then return
               if (($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
               if (($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
               if (%moved = 1) then return
               if (($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
               if (($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","narrow hole") && ("%lastmoved" != "go hole")) then gosub MOVE go hole
               if (matchre("$roomobjs $roomdesc","\bcrevice") && ("%lastmoved" != "go crevice")) then gosub MOVE go crevice
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bgate") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (matchre("$roomobjs $roomdesc","\barch") && ("%lastmoved" != "go arch")) then gosub MOVE go arch
               if (%moved = 1) then return
               if (matchre("$roomexits","\bforward") && ("%lastmoved" != "forward")) then gosub MOVE forward
               if (matchre("$roomexits","\baft\b") && ("%lastmoved" != "aft")) then gosub MOVE aft
               if (%moved = 1) then return
               if (matchre("$roomexits","\bstarboard") && ("%lastmoved" != "starboard")) then gosub MOVE starboard
               if (matchre("$roomexits","\bport\b") && ("%lastmoved" != "port")) then gosub MOVE port
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit")) then gosub MOVE go exit
               if (matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path")) then gosub MOVE go path
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\btrapdoor\b") && ("%lastmoved" != "go trapdoor")) then gosub MOVE go trapdoor
               if (matchre("$roomobjs $roomdesc","\bcurtain\b") && ("%lastmoved" != "go curtain")) then gosub MOVE go curtain
               if (matchre("$roomobjs $roomdesc","\bdoor") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (matchre("$roomobjs $roomdesc","double door") && ("%lastmoved" != "go door")) then gosub MOVE go door
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bportal\b") && ("%lastmoved" != "go portal")) then gosub MOVE go portal
               if (matchre("$roomobjs $roomdesc","\btunnel\b") && ("%lastmoved" != "go tunnel")) then gosub MOVE go tunnel
               if (matchre("$roomobjs $roomdesc","\bjagged crack\b") && ("%lastmoved" != "go crack")) then gosub MOVE go crack
               if (matchre("$roomobjs $roomdesc","\bthe street\b") && ("%lastmoved" != "go street")) then gosub MOVE go street
               if (matchre("$roomobjs $roomdesc","(?i)\ba gate\b") && ("%lastmoved" != "go gate")) then gosub MOVE go gate
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair")) then gosub MOVE climb stair
               if (matchre("$roomobjs $roomdesc","\bsteps\b") && ("%lastmoved" != "climb step")) then gosub MOVE climb step
               if (matchre("$roomobjs $roomdesc","\btrail\b") && ("%lastmoved" != "go trail")) then gosub MOVE go trail
               if (%moved = 1) then return
               if (matchre("$roomobjs $roomdesc","\bpanel\b") && ("%lastmoved" != "go panel")) then gosub MOVE go panel
               if (matchre("$roomobjs $roomdesc","\btent flap\b") && ("%lastmoved" != "go flap")) then gosub MOVE go flap
               if (matchre("$roomobjs $roomdesc","\bnarrow track\b") && ("%lastmoved" != "go track")) then gosub MOVE go track
               if (matchre("$roomobjs $roomdesc","\blava field\b") && ("%lastmoved" != "go lava field")) then gosub MOVE go lava field
          }
     if (%moved = 0) then goto RANDOMMOVE
     # if ($roomid = 0) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### RANDOM CARDINAL DIRECTIONS ONLY
RANDOMMOVE_CARDINAL:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 50) then
          {
               var lastmoved null
               var randomloop 0
               echo *** Cannot find a room exit??
               echo *** Attempting to Revert back..
               echo *** Trying Alternate Methods..
               if matchre("$roomobjs $roomdesc","pitch black") then gosub LIGHT_SOURCE
               pause 0.2
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname", "Deadman's Confide, Beach") || (matchre("$roomobjs","thick fog") || matchre("$roomexits","thick fog")) then
          {
               gosub TRUE_RANDOM_2
               return
          }
     if matchre("$roomname","Temple Hill Manor, Grounds") then
          {
               gosub MOVE go gate
               return
          }
     if matchre("$roomname","Darkling Wood, Ironwood Tree") then
          {
               gosub MOVE climb pine branches
               return
          }
     if matchre("$roomname","Darkling Wood, Pine Tree") then
          {
               gosub MOVE climb white pine
               return
          }
     if matchre("$roomobjs","strong creeper") then
          {
               gosub MOVE climb ladder
               return
          }
     random 1 11
     if (%moved = 1) then return
     if ((%r = 1) && ($north) && ("%lastmoved" != "south")) then gosub MOVE north
     if ((%r = 2) && ($northeast) && ("%lastmoved" != "southwest")) then gosub MOVE northeast
     if ((%r = 3) && ($east) && ("%lastmoved" != "west")) then gosub MOVE east
     if (%moved = 1) then return
     if ((%r = 4) && ($northwest) && ("%lastmoved" != "southeast")) then gosub MOVE northwest
     if ((%r = 5) && ($southeast) && ("%lastmoved" != "northwest")) then gosub MOVE southeast
     if ((%r = 6) && ($south) && ("%lastmoved" != "north")) then gosub MOVE south
     if ((%r = 7) && ($southwest) && ("%lastmoved" != "northeast")) then gosub MOVE southwest
     if (%moved = 1) then return
     if ((%r = 8) && ($west) && ("%lastmoved" != "east")) then gosub MOVE west
     if (%r = 9) && ($out) then gosub MOVE out
     if ((%r = 10) && ($up) && ("%lastmoved" != "up")) then gosub MOVE up
     if ((%r = 11) && ($down) && ("%lastmoved" != "down")) then gosub MOVE down
     if (%moved = 1) then return
     if (%moved = 0) then goto RANDOMMOVE_CARDINAL
     # if ($roomid = 0) then goto RANDOMMOVE
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### GO IN RANDOM DIRECTIONS, PREFER A SOUTHERN / WESTERN DIRECTION IF AVAILABLE
RANDOMMOVE_SOUTH:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 5) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
               return
          }
     if $south then
          {
               gosub MOVE south
               return
          }
     if $southwest then
          {
               gosub MOVE southwest
               return
          }
     if $southeast then
          {
               gosub MOVE southeast
               return
          }
     if $northwest then
          {
               gosub MOVE northwest
               return
          }
     if $west then
          {
               gosub MOVE west
               return
          }
     if $north then
          {
               gosub MOVE north
               return
          }
     if $northeast then
          {
               gosub MOVE northeast
               return
          }
     if $east then
          {
               gosub MOVE east
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
     pause 0.01
     if (%moved = 0) then goto RANDOMMOVE_SOUTH
     # if $roomid == 0 then goto moveRandomDirection_2
     return
### TRUE RANDOM USED FOR MOVING IN PURE RANDOM DIRECTIONS REGARDLESS OF WHATS IN ROOM (FOG FILLED OR DARK ROOMS)
TRUE_RANDOM_2:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 9) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
               return
          }
     random 1 8
     if (%r = 1) then gosub MOVE n
     if (%r = 2) then gosub MOVE ne
     if (%r = 3) then gosub MOVE e
     if (%r = 4) then gosub MOVE nw
     if (%r = 5) then gosub MOVE se
     if (%r = 6) then gosub MOVE s
     if (%r = 7) then gosub MOVE sw
     if (%r = 8) then gosub MOVE w
     if ($out) then gosub MOVE out
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bexit\b") && ("%lastmoved" != "go exit") then gosub MOVE go exit
     if matchre("$roomobjs $roomdesc","\bpath\b") && ("%lastmoved" != "go path") then gosub MOVE go path
     if matchre("$roomobjs $roomdesc","\btrapdoor\b") && ("%lastmoved" != "go trapdoor") then gosub MOVE go trapdoor
     if matchre("$roomobjs $roomdesc","\bcurtain\b") && ("%lastmoved" != "go path") then gosub MOVE go curtain
     if matchre("$roomobjs $roomdesc","\bdoor") && ("%lastmoved" != "go door") then gosub MOVE go door
     if matchre("$roomobjs $roomdesc","\bgate") && ("%lastmoved" != "go gate") then gosub MOVE go gate
     if matchre("$roomobjs $roomdesc","\barch") && ("%lastmoved" != "go arch") then gosub MOVE go arch
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bportal\b") && ("%lastmoved" != "go portal") then gosub MOVE go portal
     if matchre("$roomobjs $roomdesc","\btunnel\b") && ("%lastmoved" != "go tunnel") then gosub MOVE go tunnel
     if matchre("$roomobjs $roomdesc","\b(stairs|staircase|stairway)\b") && ("%lastmoved" != "climb stair") then gosub MOVE climb stair
     if matchre("$roomobjs $roomdesc","\bsteps\b") && ("%lastmoved" != "climb step") then gosub MOVE climb step
     if (%moved = 1) then return
     if matchre("$roomobjs $roomdesc","\bpanel\b") && ("%lastmoved" != "go panel") then gosub MOVE go panel
     if matchre("$roomobjs $roomdesc","\bnarrow track\b") && ("%lastmoved" != "go track") then gosub MOVE go track
     if (%moved = 0) then goto TRUE_RANDOM_2
     return
TRUE_RANDOM:
     pause 0.0001
     var moved 0
     math randomloop add 1
     if (%randomloop > 9) then
          {
               put look
               pause 0.2
               var lastmoved null
               var randomloop 0
          }
     random 1 16
     if (%r = 1) then gosub MOVE n
     if (%r = 2) then gosub MOVE ne
     if (%r = 3) then gosub MOVE e
     if (%r = 4) then gosub MOVE nw
     if (%r = 5) then gosub MOVE se
     if (%r = 6) then gosub MOVE s
     if (%r = 7) then gosub MOVE sw
     if (%r = 8) then gosub MOVE w
     if (%r = 9) then gosub MOVE out
     if (%r = 10) then gosub MOVE up
     if (%r = 11) then gosub MOVE go door
     if (%r = 12) then gosub MOVE go path
     if (%r = 13) then gosub MOVE climb stair
     if (%r = 14) then gosub MOVE climb step
     if (%r = 15) then gosub MOVE go panel
     if (%r = 16) then gosub MOVE go arch
     if (%moved = 0) then goto TRUE_RANDOM
     return
RANDOMWEIGHT:
     var weight $1
     var randomweight
     if $%weight then var randomweight %randomweight|%weight
     if $north%weight then var randomweight %randomweight|north%weight
     if $south%weight then var randomweight %randomweight|south%weight
     eval randomweightcount count("%randomweight", "|")
RANDOMWEIGHT_2:
     if ("%randomweight" = "") then return
     random 1 %randomweightcount
     gosub MOVE %randomweight(%r)
     return
RANDOMNORTH:
     if (($north) && ("%lastmoved" != "south")) then
          {
               gosub MOVE north
               goto RANDOMSOUTH_RETURN
          }
     if (($northeast) && ("%lastmoved" != "southwest")) then
          {
               gosub MOVE northeast
               goto RANDOMSOUTH_RETURN
          }
     if (($northwest) && ("%lastmoved" != "southeast")) then
          {
               gosub MOVE northwest
               return
          }
     if (($west) && ("%lastmoved" != "east")) then
          {
               gosub MOVE west
               goto RANDOMSOUTH_RETURN
          }
     if (($east) && ("%lastmoved" != "west")) then
          {
               gosub MOVE east
               goto RANDOMSOUTH_RETURN
          }
     var lastmoved null
     return
RANDOMSOUTH:
     if (($south) && ("%lastmoved" != "north")) then
          {
               gosub MOVE south
               goto RANDOMSOUTH_RETURN
          }
     if (($southeast) && ("%lastmoved" != "northwest")) then
          {
               gosub MOVE southeast
               goto RANDOMSOUTH_RETURN
          }
     if (($southwest) && ("%lastmoved" != "northeast")) then
          {
               gosub MOVE southwest
               goto RANDOMSOUTH_RETURN
          }
     if (($east) && ("%lastmoved" != "west")) then
          {
               gosub MOVE east
               goto RANDOMSOUTH_RETURN
          }
     if (($west) && ("%lastmoved" != "east")) then
          {
               gosub MOVE west
               goto RANDOMSOUTH_RETURN
          }
     var lastmoved null
RANDOMSOUTH_RETURN:
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
#### RETURNS
RETURN:
     delay 0.0001
     RETURN
RETURN_CLEAR:
     delay 0.0001
     put #queue clear
     pause 0.0001
     RETURN