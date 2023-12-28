# version 2.2
goto END.BUFFS.FILE

BUFF_SET:
if ("$guild" = "Barbarian") then goto BARB_BUFF
if ("$guild" = "Thief") then goto THIEF_BUFF
if ("$guild" = "Commoner") then goto ANALOGOUS_BUFF
EMPATH_BUFF:
     action (buffs) put #tvar spellAD 1 when ^\s*Life energy floods through your veins, burning without consuming\.\s+Time seems to slow as it flows into your muscles and nerves, increasing your reaction speed\.
     action (buffs) put #tvar spellAD 1 when ^\s*The molten Life flowing in your blood quickens
     action (buffs) put #tvar spellAD 1 when ^\s*You sense the Aesandry Darlaeth spell (upon|surrounding) you, which will last until you fail to provide .* for it\.
     action (buffs) put #tvar spellAD 0 when ^\s*Aesandry Darlaeth loses cohesion, returning your reaction time to normal\.
     action (buffs) put #tvar spellAGS 1 when ^You reach out with your magically augmented senses, attuning yourself to the rhythms of fear and violence in the world around you.
     action (buffs) put #tvar spellAGS 1 when ^Your body tenses with a burning, stressful ache as you take on a physiological stance better prepared for combat\.
     action (buffs) put #tvar spellAGS 1 when eval ($SpellTimer.AggressiveStance.active = 1)
     action (buffs) put #tvar spellAGS 0 when eval ($SpellTimer.AggressiveStance.active = 0)
     action (buffs) put #tvar spellAGS 0 when ^You sense the Aggressive Stance spell fade away, returning your body to a state more sluggish and serene\.
     action (buffs) put #tvar spellBS 1 when ^\s*A sudden sensation of warmth spreads through your body, (?:before )?settling itself between your shoulders\.
     action (buffs) put #tvar spellBS 1 when ^\s*You sense the Blood Staunching spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellBS 0 when ^\s*You feel the warmth between your shoulders dissipate\.
     action (buffs) put #tvar spellBS 0 when ^\s*The binding force which has been holding your wounds closed wears off, but you are no longer bleeding\.
     # action (buffs) put #tvar spellBS 0 when The binding force which has been holding your wounds closed wears off
     action (buffs) put #tvar spellCD 1 when ^\s*A wave of vertigo washes over you as your spell seeks out disease in your body\.\s+However, you don't seem to be so afflicted\.\s*Instead, you use your knowledge of Adaptive Curing to set a reactive ward\.\s*You feel the pattern sink into your body, a lingering warmth just beneath your skin reminding you of its protective presence\.
     action (buffs) put #tvar spellCD 1 when ^\s*You sense the Cure Disease spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellCD 0 when ^\s*You feel the protective warmth just under your skin fade away\.
     action (buffs) put #tvar spellCD 0 when ^\s*A wave of vertigo washes over you as your spell seeks out disease and attempts to eradicate it\.
     action (buffs) put #tvar spellFP 1 when ^\s*A sudden wave of heat washes over you as your spell attempts to flush poison from your body but finds no toxins\.\s+Since you don't seem to be poisoned, you use your knowledge of Adaptive Curing to set a reactive ward\.\s+You feel the pattern center itself in the small of your back, a lingering warmth reminding you of its protective presence\.
     action (buffs) put #tvar spellFP 1 when ^\s*You sense the Flush Poisons spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellFP 0 when ^\s*You feel the heat at the small of your back fade away\.
     action (buffs) put #tvar spellFP 0 when ^\s*A sudden wave of heat washes over you as your spell flushes all poison from your body\.
     action (buffs) put #tvar spellHEAL 1 when eval ($SpellTimer.Heal.active = 1)
     action (buffs) put #tvar spellHEAL 1 when ^A wave of feverish heat settles into your flesh, the momentary surge of discomfort subsiding slowly into a warm feeling of heightened sensation\.
     action (buffs) put #tvar spellHEAL 1 when ^A nearly painful prickling sensation surges through you as your protective healing matrix focuses on the worst hurts to your body
     action (buffs) put #tvar spellHEAL 1 when ^\s*You sense the Heal spell (upon|surrounding) you
     action (buffs) put #tvar spellHEAL 0 when ^You feel the warmth in your flesh gradually subside\.
     action (buffs) put #tvar spellREGENERATE 1 when ^\s*Rutilant sparks of light encircle you, bathing you in a warm glow as your body begins to tingle with energy\.
     action (buffs) put #tvar spellREGENERATE 1 when ^\s*You feel a surge of life energy as your regeneration pulses, the spell pattern manifesting as a cascade of rutilant sparks that bathe you in a warm glow\.
     action (buffs) put #tvar spellREGENERATE 1 when ^\s*You sense the Regenerate spell (upon|surrounding) you, which will last until you fail to provide .* for it\.
     action (buffs) put #tvar spellREGENERATE 0 when ^\s*The tingling across your body diminishes as you feel the motes of energy fade away\.
     action (buffs) put #tvar spellREFRESH 1 when ^\s*Soft waves of a gentle, warm peach color flicker around you\.
     action (buffs) put #tvar spellREFRESH 1 when ^\s*You sense the Refresh spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellREFRESH 0 when ^\s*You feel the surge of energy within you ebb away\.
     action (buffs) put #tvar spellGOL 1 when ^\s*New life flows into your body, sharpening your Empathic senses and increasing your sense of wellness\.
     action (buffs) put #tvar spellGOL 1 when ^\s*You sense the Gift of Life spell (upon|surrounding) you, which will last for .*\.
     action (buffs) put #tvar spellGOL 0 when ^\s*Your increased sense of wellness gradually ebbs as the Gift of Life spell ends\.
     action (buffs) put #tvar spellTRANQUILITY 1 when ^\s*A newfound fluidity of your mind imparts you with enhanced awareness of every nerve in your body\.
     action (buffs) put #tvar spellTRANQUILITY 1 when ^\s*You sense .* Tranquility upon you, which should last for .*\.
     action (buffs) put #tvar spellTRANQUILITY 0 when ^\s*The fluidity of your mind expires\.
     action (buffs) put #tvar spellFOC 1 when ^\s*.* of bright blue and white energy spring up from under your feet, enwreathing you with a cool, soothing glow\.
     action (buffs) put #tvar spellFOC 0 when ^\s*You feel the pattern activate and surge into your body, but it just as quickly collapses as it fails to find any wounds\.
     action (buffs) put #tvar spellFOC 0 when ^\s*You no longer feel especially strained from invoking the Fountain of Creation\.
     action (buffs) put #tvar spellIC 1 when ^\s*The pattern secretes a liquid, dusky light which cascades down your body like thick honey, numbing your skin as it covers you from head to toe before thinning out\.
     action (buffs) put #tvar spellIC 1 when ^\s*You sense the Iron Constitution spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellIC 1 when eval ($SpellTimer.IronConstitution.active = 1)
     action (buffs) put #tvar spellIC 0 when eval ($SpellTimer.IronConstitution.active = 0)
     action (buffs) put #tvar spellIC 0 when ^\s*Your skin loses its protective numbness\.
     action (buffs) put #tvar spellMEF 1 when ^The world around you seems to slow as the spell grips your mind\.\s*You feel centered and steady, your concentration honed to a keen edge\.
     action (buffs) put #tvar spellMEF 1 when ^You sense the Mental Focus spell (upon|surrounding) you, which will last for .*\.
     action (buffs) put #tvar spellMEF 0 when ^The Mental Focus spell fades away, releasing its grip on your mind\.\s*You feel briefly confused and stupid as your senses return to their normal state\.
     action (buffs) put #tvar spellABSOLUTION 1 when ^Your head swims and you feel considerably more numb, as though your mind was somehow disconnected from your body
     action (buffs) put #tvar spellABSOLUTION 1 when ^You sense the Absolution spell (upon|surrounding) you
     action (buffs) put #tvar spellABSOLUTION 1 when ^Your sensorium remains blunted as the Absolution spell renews its hold on your Empathy\.
     action (buffs) put #tvar spellABSOLUTION 1 when eval ($SpellTimer.Absolution.duration > 2)
     action (buffs) put #tvar spellABSOLUTION 0 when eval ($SpellTimer.Absolution.duration = 1)
     action (buffs) put #tvar spellABSOLUTION 0 when ^A brief spike of raw sensation hits you, taking your breath away\.
     action (buffs) put #tvar spellABSOLUTION 0 when ^As the Absolution spell fails, you feel your connection to the world renew and sharpen once again
     action (buffs) put #tvar spellIZ 1 when eval ($SpellTimer.IcutuZaharenela.active = 1)
     action (buffs) put #tvar spellIZ 1 when ^Monstrous feelings of cold-bloodedness uncoil from within
     action (buffs) put #tvar spellIZ 0 when eval ($SpellTimer.IcutuZaharenela.active = 0)
     action (buffs) put #tvar spellGS 1 when eval ($SpellTimer.GuardianSpirit.active = 1)
     action (buffs) put #tvar spellGS 0 when eval ($SpellTimer.GuardianSpirit.active = 0)
	put #tvar spellGS 0
	put #tvar spellIZ 0
     put #tvar spellAGS 0
     put #tvar spellHEAL 0
     put #tvar spellABSOLUTION 0 
     put #tvar spellREGENERATE 0
     put #tvar spellBS 0
     put #tvar spellCD 0
     put #tvar spellFP 0
     put #tvar spellREFRESH 0
     put #tvar spellGOL 0
     put #tvar spellTRANQUILITY 0
     put #tvar spellFOC 0
     put #tvar spellAD 0
     put #tvar spellIC 0
     put #tvar spellMEF 0
     put #var SpellTimer.MentalFocus.duration 0
     put #var SpellTimer.AesandryDarlaeth.duration 0
     put #var SpellTimer.BloodStaunching.duration 0
     put #var SpellTimer.CureDisease.duration 0
     put #var SpellTimer.FlushPoisons.duration 0
     put #var SpellTimer.Regenerate.duration 0
     put #var SpellTimer.Refresh.duration 0
     put #var SpellTimer.GiftofLife.duration 0
     put #var SpellTimer.AggressiveStance.duration 0
     put #var SpellTimer.Heal.duration 0
     put #var SpellTimer.IronConstitution.duration 0
     put #var SpellTimer.Absolution.duration 0
     put #var SpellTimer.IcutuZaharenela.duration 0
     put #var SpellTimer.GuardianSpirit.duration 0
WARMAGE_BUFF:
     action (buffs) put #var spellAC 1 when ^Everything seems to darken, and you feel slightly colder as a cloak of aether folds itself possessively about you\.
     action (buffs) put #var spellAC 1 when ^You sense the Aether Cloak spell (upon|surrounding) you
     action (buffs) put #var spellAC 1 when eval ($SpellTimer.AetherCloak.active = 1)
     action (buffs) put #var spellAC 0 when eval ($SpellTimer.AetherCloak.active = 0)
     action (buffs) put #var spellGI 1 when eval ($SpellTimer.GamIrnan.active = 1)
     action (buffs) put #var spellGI 1 when ^You sense the Gam Irnan spell (upon|surrounding) you,
     action (buffs) put #var spellGI 1 when ^Helixes and cross-patterns of brittle salt crystals grow rapidly over the length of your body\.
     action (buffs) put #var spellGI 0 when eval ($SpellTimer.GamIrnan.active = 0)
     action (buffs) put #var spellGI 0 when ^The Gam Irnan pattern crumbles away and with it the magical salt crystals encrusting your body shrink and vanish\.
     action (buffs) put #var spellAEG 1 when ^You sense the Aegis of Granite spell (upon|surrounding) you, which
     action (buffs) put #var spellAEG 1 when ^You draw forth a pulse of dusky green Earth energy and channel it into your body\.\s+As the transformation takes hold, so does a sensation of solidity\.
     action (buffs) put #var spellAEG 0 when ^The Earth energy flows from your body, returning to its rightful place in the ground beneath your feet\.$
     action (buffs) put #var spellEE 1 when eval ($SpellTimer.ElectrostaticEddy.active = 1)
     action (buffs) put #var spellEE 0 when eval ($SpellTimer.ElectrostaticEddy.active = 0)
     action (buffs) put #var spellEE 0 when ^You release your connection to the Elemental Plane of Electricity,\s+allowing the static electricity to dissipate\.
     action (buffs) put #var spellES 1 when ^You sense the Ethereal Shield spell (upon|surrounding) you, which
     action (buffs) put #var spellES 1 when ^A shimmering ethereal shield surrounds you\.|^The ethereal shield surrounding you shimmers slightly\.
     action (buffs) put #var spellES 0 when ^The shimmering ethereal shield fades from around you\.
     action (buffs) put #var spellETF 1 when ^A spinning ball of vivid .+ appears within the pattern
     action (buffs) put #var spellETF 1 when ^You also see a .+ fissure
     action (buffs) put #var spellETF 1 when ^You sense an Ethereal Fissure spell matrix
     action (buffs) put #var spellETF 0 when ^The .+ fissure collapses in on itself
     action (buffs) put #var spellETF 0 when ^Suddenly the .+ fissure is torn apart by a blinding explosion\!
	action (buffs) put #var spellFR 1 when eval ($SpellTimer.FireRain.active = 1)
	action (buffs) put #var spellFR 0 when eval ($SpellTimer.FireRain.active = 0)
     action (buffs) put #var spellGF 1 when ^A lattice-like sphere of electricity attuned to
     action (buffs) put #var spellGF 1 when eval ($SpellTimer.GroundingField.active = 1)
     action (buffs) put #var spellGF 0 when eval ($SpellTimer.GroundingField.active = 0)
     action (buffs) put #var spellIGNITE 1 when ^Tendrils of flame dart along your hand toward an
     action (buffs) put #var spellIGNITE 1 when ^Flames dance along the surface of the weapon
     action (buffs) put #var spellIGNITE 1 when eval ($SpellTimer.Ignite.active = 1)
     action (buffs) put #var spellIGNITE 0 when eval ($SpellTimer.Ignite.active = 0)
     action (buffs) put #var spellZEPHYR 1 when ^A faint pleasant breeze begins to stir\.
     action (buffs) put #var spellZEPHYR 1 when ^A faint warm breeze continues to swirl around you\.
     action (buffs) put #var spellZEPHYR 0 when ^With a final, swirling whisper, the breeze fades from the area
     action (buffs) put #var spellMOF 1 when ^You sense the Mantle of Flame spell (upon|surrounding) you
     action (buffs) put #var spellMOF 1 when ^A crackling mantle of blazing orange-yellow flames surrounds you, sinking into and melding with your body as the transformation takes hold\.\s+You feel swifter\.
     action (buffs) put #var spellMOF 0 when ^Your body is no longer imbued with Fire\.
     action (buffs) put #var spellRIM 1 when eval ($SpellTimer.Rimefang.active = 1)
	action (buffs) put #var spellRIM 0 when eval ($SpellTimer.Rimefang.active = 0)
     action (buffs) put #var spellROS 1 when eval ($SpellTimer.RingofSpears.active = 1)
	action (buffs) put #var spellROS 0 when eval ($SpellTimer.RingofSpears.active = 0)
     action (buffs) put #var spellSUBSTRATUM 1 when ^You sense the Substratum spell (upon|surrounding) you
     action (buffs) put #var spellSUBSTRATUM 1 when ^Focusing on the aethereal plane you draw out thin lines forming a grid that surrounds you at arms length\.\s+The lines quickly fade from sight, but you still feel very aware of their position\.
     action (buffs) put #var spellSUBSTRATUM 0 when ^You feel less steady, and realize that your
     action (buffs) put #var spellSUBSTRATUM 1 when eval ($SpellTimer.Substratum.active = 1)
	action (buffs) put #var spellSUBSTRATUM 0 when eval ($SpellTimer.Substratum.active = 0)
     action (buffs) put #var spellSUF 1 when ^You sense the Sure Footing spell (upon|surrounding) you
     action (buffs) put #var spellSUF 1 when ^You feel steadier\.$
     action (buffs) put #var spellSUF 0 when ^You feel the winds surrounding you disperse\.
     action (buffs) put #var spellSUF 1 when eval ($SpellTimer.SureFooting.active = 1)
     action (buffs) put #var spellSUF 0 when eval ($SpellTimer.SureFooting.active = 0)
     action (buffs) put #var spellSW 1 when ^You sense the Swirling Winds spell (upon|surrounding) you, which
     action (buffs) put #var spellSW 1 when ^You harness the currents of air and channel them around yourself
     action (buffs) put #var spellSW 0 when ^You feel the winds surrounding you disperse\.
     action (buffs) put #var spellSW 1 when eval ($SpellTimer.SwirlingWinds.active = 1)
     action (buffs) put #var spellSW 0 when eval ($SpellTimer.SwirlingWinds.active = 0)
     action (buffs) put #var spellTW 1 when ^You sense the Tailwind spell (upon|surrounding) you
     action (buffs) put #var spellTW 1 when ^The wind begins to shift until it blows gently from behind your back\.
     action (buffs) put #var spellTW 1 when ^The wind blowing from behind you falters for a moment, then picks up again.\.
     action (buffs) put #var spellTW 0 when ^The shifting winds blowing from behind you die down\.
     action (buffs) put #var spellTW 1 when eval ($SpellTimer.Tailwind.active = 1)
     action (buffs) put #var spellTW 0 when eval ($SpellTimer.Tailwind.active = 0)
     action (buffs) put #var spellVOI 1 when ^You sense the Veil of Ice spell (upon|surrounding) you
     action (buffs) put #var spellVOI 1 when ^A veil of ice forms around you\.$
     action (buffs) put #var spellVOI 0 when ^The veil of ice suddenly shatters and melts from around you\.
     action (buffs) put #var spellYS 1 when ^You sense the Y'ntrel Sechra spell helping you maneuver
     action (buffs) put #var spellYS 1 when ^A stiff breeze surrounds you, molding itself to your body and cushioning you against the weight of your armor\.
     action (buffs) put #var spellYS 1 when ^You refresh the currents of air buffering your armor\.
     action (buffs) put #var spellYS 0 when ^The cushioning currents of wind about you rapidly disperse\.
     action (buffs) put #var spellYS 1 when eval ($SpellTimer.YntrelSechra.active = 1)
     action (buffs) put #var spellYS 0 when eval ($SpellTimer.YntrelSechra.active = 0)
     action (buffs) put #var spellRM 1 when ^A wispy, grey mist silently rises, droplet by droplet\.
     action (buffs) put #var spellRM 1 when ^You sense the Rising Mists spell (upon|surrounding) you
     action (buffs) put #var spellRM 0 when ^The unnatural fog breaks apart with the passing of an errant breeze\.
     action (buffs) put #var spellRM 1 when eval ($SpellTimer.RisingMists.active = 1)
     action (buffs) put #var spellRM 0 when eval ($SpellTimer.RisingMists.active = 0)
     ## CHARGE TRIGGERS
     action (buffs) put #var charge 12 when ^You have reached the limits of your body's capacity to store a charge
     action (buffs) put #var charge 11 when ^Your body sings and crackles with a barely contained charge
     action (buffs) put #var charge 10 when ^Extraplanar.*leaving you feeling acutely ill
     action (buffs) put #var charge 9 when ^Extraplanar.*leaving you feeling mildly feverish
     action (buffs) put #var charge 8 when ^Elemental essence has infused every inch of your body
     action (buffs) put #var charge 7 when ^Elemental essence floats freely within your body
     action (buffs) put #var charge 6 when ^A charge circulates through your body
     action (buffs) put #var charge 5 when ^A charge dances just below the threshold of discomfort
     action (buffs) put #var charge 4 when ^A charge dances through your body
     action (buffs) put #var charge 3 when ^A small charge lingers within your body
     action (buffs) put #var charge 2 when ^A small charge.*just above the threshold of perception
     action (buffs) put #var charge 1 when ^You sense nothing out of the ordinary
     action (buffs) put #var domain 0 when ^A strange sense passes through you
     action (buffs) put #var domain 1 when ^Discharging a burst of elemental power in the esoteric|^You sense the physics of the local area are being modified by|^Suddenly the area feels somehow more|^The air around you feels somehow thicker|^Strangely.*everything feels a tiny bit heavier|^A barely felt zap of static electricity accompanies your meditation|^You feel a sudden tingle of heat in your palms|^The humidity in the area noticeably increases
     action (buffs) put #var pathway 1 when ^You focus on (?:manipulating|stretching) an aethereal pathway|^You are already manipulating the aether to your benefit
     action (buffs) put #var pathway 0 when ^You gently relax your mind and release your hold on the aethereal pathways|^You aren't focusing on any of the aethereal pathways|^You find it impossible to manipulate the aether while stunned.  The complex web of manipulations collapse, allowing the aether to fall back into its natural contours
     put #var pathway 0
     put #var charge 0
     put #var domain 0
	put #tvar spellROS 0
	put #tvar spellRIM 0
	put #tvar spellFR 0
	put #tvar spellEE 0
     put #tvar spellIGNITE 0
     put #tvar spellZEPHYR 0
     put #tvar spellRM 0
     put #tvar spellETF 0
     put #tvar spellGF 0
     put #tvar spellAC 0
     put #tvar spellAEG 0
     put #tvar spellES 0
     put #tvar spellMOF 0
     put #tvar spellSUBSTRATUM 0
     put #tvar spellSUF 0
     put #tvar spellSW 0
     put #tvar spellTW 0
     put #tvar spellVOI 0
     put #tvar spellYS 0
     put #tvar spellGI 0
     put #var SpellTimer.RisingMists.duration 0
     put #var SpellTimer.YntrelSechra.duration 0
     put #var SpellTimer.Tailwind.duration 0
     put #var SpellTimer.SwirlingWinds.duration 0
     put #var SpellTimer.SureFooting.duration 0
     put #var SpellTimer.Substratum.duration 0
     put #var SpellTimer.RingofSpears.duration 0
     put #var SpellTimer.Rimefang.duration 0
     put #var SpellTimer.Ignite.duration 0
     put #var SpellTimer.GroundingField.duration 0
     put #var SpellTimer.FireRain.duration 0
     put #var SpellTimer.ElectrostaticEddy.duration 0
     put #var SpellTimer.GamIrnan.duration 0
     put #var SpellTimer.AetherCloak.duration 0
# TRADER BUFF TRIGGERS INCLUDE
TRADER_BUFF:
     action (buffs) put #tvar spellBLUR 1 when Coalescent starlight becomes shimmering liquid afterimages|You are confident that the visual interference will make it easier to dodge
     action (buffs) put #tvar spellBLUR 1 when The blurry afterimages surrounding your body dissolve into near-nothingness before reshaping themselves anew\.
     action (buffs) put #tvar spellBLUR 0 when eval ($SpellTimer.Blur.active = 0)
     action (buffs) put #tvar spellBLUR 1 when eval ($SpellTimer.Blur.active = 1)
     action (buffs) put #tvar spellLGV 1 when ^Your skull throbs with a pounding, almost musical ache as you begin to experience an irrational affinity for shields\.
     action (buffs) put #tvar spellLGV 1 when ^Your defensive self-compulsion is rekindled\.
     action (buffs) put #tvar spellLGV 0 when eval ($SpellTimer.LastGiftofVithwok.active = 0)
     action (buffs) put #tvar spellLGV 0 when ^A momentary mistrust of shields comes over you\.
     action (buffs) put #tvar spellMOM 1 when ^Diffuse like smoke, a faint reddish billow of moonlight gathers in front of you and masks your face
     action (buffs) put #tvar spellMOM 1 when eval ($SpellTimer.MaskoftheMoons.active = 1)
     action (buffs) put #tvar spellMOM 0 when ^The faint reddish moonsmoke blows away from your face
     action (buffs) put #tvar spellIR 1 when ^Converging in midair, faceted ripples assemble a slender hexagonal rod whorled with faintly shifting fractals\.
     action (buffs) put #tvar spellIR 1 when eval ($SpellTimer.IridiusRod.active = 1)
     action (buffs) put #tvar spellIR 0 when eval ($SpellTimer.IridiusRod.active = 0)
     action (buffs) put #tvar spellMEG 1 when ^Your enhanced capacity for collecting valuable resources falters briefly as the spell pattern woven through your thought processes is refreshed\.
     action (buffs) put #tvar spellMEG 1 when ^A jarring impulse of primal avarice discharges into the back of your mind before quickly resolving into subtler, more sophisticated cogitations as the spell pattern takes root\.
     action (buffs) put #tvar spellMEG 1 when eval ($SpellTimer.MembrachsGreed.active = 1)
     action (buffs) put #tvar spellMEG 0 when ^Your enhanced capacity for collecting valuable resources slowly seeps away\.
     action (buffs) put #tvar spellTRC 1 when ^Clear blue light falls about you in the contours of an upended cup
     action (buffs) put #tvar spellTRC 1 when eval ($SpellTimer.TrabeChalice.active = 1)
     action (buffs) put #tvar spellTRC 0 when eval ($SpellTimer.TrabeChalice.active = 0)
     action (buffs) put #tvar spellTURI 1 when ^You feel more clear-headed and alert
     action (buffs) put #tvar spellTURI 0 when eval ($SpellTimer.TurmarIllumination.active = 0)
     action (buffs) put #tvar spellNON 1 when ^A comforting sense of nepenthean detachment bubbles to the forefront of your mind
     action (buffs) put #tvar spellNON 1 when eval ($SpellTimer.Nonchalance.active = 1)
     action (buffs) put #tvar spellNON 0 when eval ($SpellTimer.Nonchalance.active = 0)
     action (buffs) put #tvar spellFINESSE 1 when ^Sharpened beneath the spell pattern\'s lens, your proprioception and social instincts burgeon in phrenic harmony
     action (buffs) put #tvar spellFINESSE 1 when ^Your enhanced situational awareness wavers for a moment, then feels refreshed
     action (buffs) put #tvar spellFINESSE 0 when ^You feel bereft of grace and charm as your enhanced situational awareness dissipates\.
     action (buffs) put #tvar spellFINESSE 0 when eval ($SpellTimer.Finesse.active = 0)
     action (buffs) put #tvar spellFINESSE 1 when eval ($SpellTimer.Finesse.active = 1)
     action (buffs) put #tvar spellENRICHMENT 1 when eval ($SpellTimer.Enrichment.active = 1)
     action (buffs) put #tvar spellENRICHMENT 0 when eval ($SpellTimer.Enrichment.active = 0)
     action (buffs) put #tvar spellNOUMENA 1 when ^The spell imbues you with an artifical sense of revelation\.
     action (buffs) put #tvar spellNOUMENA 1 when ^The spell reaffirms its hold on your psyche\.
     action (buffs) put #tvar spellNOUMENA 1 when eval ($SpellTimer.Noumena.active = 1)
     action (buffs) put #tvar spellNOUMENA 0 when ^The Noumena spell wanes and the perceptual world reasserts itself before your psyche\.
     action (buffs) put #tvar spellNOUMENA 0 when eval ($SpellTimer.Noumena.active = 0)
     action (buffs) put #tvar spellSOV 1 when eval ($SpellTimer.StepsofVuan.active = 1)
     action (buffs) put #tvar spellSOV 0 when eval ($SpellTimer.StepsofVuan.active = 0)
	put #tvar spellSOV 0
     put #tvar spellNOUMENA 0
     put #tvar spellENRICHMENT 0
     put #tvar spellBLUR 0
     put #tvar spellLGV 0
     put #tvar spellMOM 0
     put #tvar spellMEG 0
     put #tvar spellTRC 0
     put #tvar spellTURI 0
     put #tvar spellNON 0
     put #tvar spellFINESSE 0
     put #var SpellTimer.Blur.duration 0
     put #var SpellTimer.Finesse.duration 0
     put #var SpellTimer.Enrichment.duration 0
     put #var SpellTimer.StepsofVuan.duration 0
     put #var SpellTimer.Noumena.duration 0
     put #var SpellTimer.Nonchalance.duration 0
     put #var SpellTimer.TurmarIllumination.duration 0
     put #var SpellTimer.TrabeChalice.duration 0
     put #var SpellTimer.MembrachsGreed.duration 0
     put #var SpellTimer.MaskoftheMoons.duration 0
     put #var SpellTimer.LastGiftofVithwok.duration 0
# BARD BUFF TRIGGERS INCLUDE
BARD_BUFF:
     action (buffs) put #tvar spellFAE 0 when ^Your studious inspiration fades without the rhythmically infectious cadence to guide you\.
     action (buffs) put #tvar spellFAE 0 when ^You let your voice fade even as the pace of Faenella's Grace slows, winding down to a quiet conclusion\.
     action (buffs) put #tvar spellFAE 1 when ^You feel enlightened by the infectious chant, its easy-to-follow rhythms heightening your capacity to study\.
     action (buffs) put #tvar spellFAE 1 when ^You give sudden voice to the chanting that dances in your thoughts, as you release an accompaniment of elemental air into the rhythm
     action (buffs) put #tvar spellFAE 1 when ^You sense the Faenella's Grace spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellMISD 0 when stop performing the Misdirection|The delusive tones surrounding you fade away
     action (buffs) put #tvar spellMISD 1 when ^You hum the low, first tones of \"Misdirection\" quietly, and find
     action (buffs) put #tvar spellMISD 1 when ^A soft, rapid melody builds inside your mind as you create a call and response form around it\.  You orchestrate the winds to mimic the unnatural sounds of guiled approach, and the earth to make subtle movements \-\- leaving your own actions far less noticeable\.
     action (buffs) put #tvar spellMISD 1 when ^You sense the Misdirection spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellNAME 1 when ^As the pattern grips you, you are filled with resolve to stand fast and strong against all that assails you
     action (buffs) put #tvar spellNAME 0 when eval ($SpellTimer.NamingofTears.active = 0)
     action (buffs) put #tvar spellHODI 0 when eval ($SpellTimer.HodiernasLilt.active = 0)
     action (buffs) put #tvar spellHODI 0 when ^As your rendition of Hodierna\'s Lilt winds down to a close
     action (buffs) put #tvar spellHODI 1 when ^You give sudden voice to the gentle song that dances in your thoughts, as you release an accompaniment of elemental air into the piece
     action (buffs) put #tvar spellHODI 1 when ^Your voice soars to the high reaches of your range, each note ringing pure and true as you perform this verse of Hodierna\'s Lilt with quiet confidence\.
     action (buffs) put #tvar spellREPR 0 when eval ($SpellTimer.RedeemersPride.active = 0)
     action (buffs) put #tvar spellREPR 0 when ^You feel the fearlessness endowed by Redeemer\'s Pride ebb away\.
     action (buffs) put #tvar spellREPR 1 when ^You feel indomitable as Redeemer\'s Pride takes hold of you, bolstering you with unshakeable confidence\.
     action (buffs) put #tvar spellPYRE 0 when eval ($SpellTimer.PhoenixsPyre.active = 0)
     action (buffs) put #tvar spellPYRE 1 when ^You give sudden voice to the frigid chanting in your thoughts
     action (buffs) put #tvar spellRESONANCE 1 when ^Taking a deep breath, you begin the quiet, lilting opening of
     action (buffs) put #tvar spellRESONANCE 1 when ^You close your eyes briefly, focusing on the dull thumping of your own heart
     action (buffs) put #tvar spellRESONANCE 0 when stop performing the Resonance
     action (buffs) put #tvar spellRESONANCE 0 when eval ($SpellTimer.Resonance.active = 0)
     action (buffs) put #tvar spellDALU 0 when eval ($SpellTimer.DamarisLullaby.active = 0)
     action (buffs) put #tvar spellDALU 1 when eval ($SpellTimer.DamarisLullaby.active = 1)
     action (buffs) put #tvar spellDALU 1 when You sense the Damaris\' Lullaby spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellDEMA 0 when stop performing the Desert\'s
     action (buffs) put #tvar spellDEMA 1 when ^With a harsh rasp to your voice, you begin the opening passages
     action (buffs) put #tvar spellHARM 1 when ^With a power that seems to come from deep within yourself, staccato notes rip fiercely through the air
     action (buffs) put #tvar spellHARM 1 when eval ($SpellTimer.Harmony.active = 1)
     action (buffs) put #tvar spellHARM 0 when stop performing the Harmony
     action (buffs) put #tvar spellHARM 0 when ^The power welling up from deep within your soul burns out, your focus vanishing along with your improved combat prowess\.
     action (buffs) put #tvar spellHARM 0 when eval ($SpellTimer.Harmony.active = 0)
     action (buffs) put #tvar spellTEAR 0 when stop performing the Naming
     action (buffs) put #tvar spellTEAR 0 when eval ($SpellTimer.NamingofTears.active = 0)
     action (buffs) put #tvar spellTEAR 1 when ^With powerful, vibrant tones, you launch yourself into the
     action (buffs) put #tvar spellAEWO 0 when stop performing the Aether
     action (buffs) put #tvar spellAEWO 1 when ^Slow, rich tones form a somber introduction as you begin to sing
     action (buffs) put #tvar spellAEWO 1 when ^You release an accompaniment of elemental aether into your singing
     action (buffs) put #tvar spellDRUM 1 when ^You feel yourself swaying to an internal beat that hums with the natural rhythm of nature
     action (buffs) put #tvar spellDRUM 0 when ^The rhythmic thrum flowing through your body lingers with a fading warmth
     action (buffs) put #tvar spellDRUM 0 when eval ($SpellTimer.DrumsoftheSnake.active = 0)
     # action (buffs) put #tvar spellAEWO 1 when ^You release an accompaniment of elemental aether into your singing, intensifying the richly somber introduction\.  Upwardly cascading notes quickly pull away from the opening theme, forming the start of a haunting melody\.
     action (buffs) put #tvar spellAEWO 0 when ^The final tones of your enchante end with an abrupt flourish that leaves stark silence in its wake\.
     action (buffs) put #tvar spellRAGE 0 when stop performing the Rage
     action (buffs) put #tvar spellRAGE 1 when ^You feel your blood begin to pound at the sound of the rousing
     action (buffs) put #tvar spellSIRE 0 when stop performing the Call
     action (buffs) put #tvar spellSIRE 1 when ^You center yourself, a soft hum resonating within your chest as
     action (buffs) put #tvar spellECHO 0 when eval ($SpellTimer.EchoesofAether.active = 0)
     action (buffs) put #tvar spellECHO 1 when ^Having located a suitably strong source of Aether
	action (buffs) put #tvar spellABAN 1 when ^Though softly humming at first, you soon allow your voice to dance along the darkly melodic introduction to Abandoned Heart.
	action (buffs) put #tvar spellABAN 1 when eval ($SpellTimer.AbandonedHeart.active = 1)
	action (buffs) put #tvar spellABAN 0 when eval ($SpellTimer.AbandonedHeart.active = 0)	 
	action (buffs) put #tvar spellALB 1 when eval ($SpellTimer.AlbredasBalm.active = 1)
	action (buffs) put #tvar spellALB 0 when eval ($SpellTimer.AlbredasBalm.active = 0)
	action (buffs) put #tvar spellBOTF 1 when eval ($SpellTimer.BlessingoftheFae.active = 1)
	action (buffs) put #tvar spellBOTF 0 when eval ($SpellTimer.BlessingoftheFae.active = 0)
	action (buffs) put #tvar spellCARE 1 when eval ($SpellTimer.CaressoftheSun.active = 1)
	action (buffs) put #tvar spellCARE 0 when eval ($SpellTimer.CaressoftheSun.active = 0)
	action (buffs) put #tvar spellEYE 1 when eval ($SpellTimer.EyeofKertigen.active = 1)
	action (buffs) put #tvar spellEYE 0 when eval ($SpellTimer.EyeofKertigen.active = 0)
	action (buffs) put #tvar spellGJ 1 when eval ($SpellTimer.GlythtidesJoy.active = 1)
	action (buffs) put #tvar spellGJ 0 when eval ($SpellTimer.GlythtidesJoy.active = 0)
	action (buffs) put #tvar spellSANCTUARY 1 when eval ($SpellTimer.Sanctuary.active = 1)
	action (buffs) put #tvar spellSANCTUARY 0 when eval ($SpellTimer.Sanctuary.active = 0)
     action (buffs) put #tvar spellFOTF 1 when eval ($SpellTimer.FailureoftheForge.active = 1)
	action (buffs) put #tvar spellFOTF 0 when eval ($SpellTimer.FailureoftheForge.active = 0)
	put #tvar spellHODI 0
	put #tvar spellGJ 0
	put #tvar spellEYE 0
	put #tvar spellCARE 0
	put #tvar spellBOTF 0
	put #tvar spellALB 0
	put #tvar spellABAN 0
     put #tvar spellNAME 0
     put #tvar spellDRUM 0
     put #tvar spellFAE 0
     put #tvar spellMISD 0
     put #tvar spellLILT 0
     put #tvar spellREPR 0
     put #tvar spellPYRE 0
     put #tvar spellRESONANCE 0
     put #tvar spellDALU 0
     put #tvar spellDEMA 0
     put #tvar spellHARM 0
     put #tvar spellTEAR 0
     put #tvar spellAEWO 0
     put #tvar spellRAGE 0
     put #tvar spellSIRE 0
     put #tvar spellFOTF 0
     put #tvar spellECHO 0
     put #var SpellTimer.EyeofKertigen.duration 0
     put #var SpellTimer.Resonance.duration 0
     put #var SpellTimer.NamingofTears.duration 0
     put #var SpellTimer.DamarisLullaby.duration 0
     put #var SpellTimer.DrumsoftheSnake.duration 0
     put #var SpellTimer.Harmony.duration 0
     put #var SpellTimer.PhoenixsPyre.duration 0
     put #var SpellTimer.HodiernasLilt.duration 0
     put #var SpellTimer.Misdirection.duration 0
     put #var SpellTimer.FaenellasGrace.duration 0
     put #var SpellTimer.RedeemersPride.duration 0
     put #var SpellTimer.AbandonedHeart.duration 0
     put #var SpellTimer.AlbredasBalm.duration 0
     put #var SpellTimer.BlessingoftheFae.duration 0
     put #var SpellTimer.CaressoftheSun.duration 0
     put #var SpellTimer.GlythtidesJoy.duration 0
     put #var SpellTimer.Sanctuary.duration 0
     put #var SpellTimer.FailureoftheForge.duration 0
     put #var SpellTimer.RageoftheClans.duration 0
     put #var SpellTimer.AetherWolves.duration 0
     put #var SpellTimer.EchoesofAether.duration 0
CLERIC_BUFF:
     action (buffs) put #tvar activeOM 1 when ^You sense your Osrel Meraud spell linking you to .*, which should last until you release it\.
     action (buffs) put #tvar spellPFE 1 when ^You sense the Protection from Evil spell (upon|surrounding) you, which will last for about .*\.
     action (buffs) put #tvar spellPFE 1 when ^You sense the Protection from Evil spell (upon|surrounding) you, which is linked to your Osrel Meraud orb\.
     action (buffs) put #tvar spellPFE 1 when ^You are bathed in a soft white glow for a moment\.
     action (buffs) put #tvar spellPFE 0 when ^The soft white glow fades from around you\.
     action (buffs) put #tvar spellMPP 1 when ^You sense the Minor Physical Protection spell (upon|surrounding) you, which will last for about .*\.
     action (buffs) put #tvar spellMPP 1 when ^You sense the Minor Physical Protection spell (upon|surrounding) you, which is linked to your Osrel Meraud orb\.
     action (buffs) put #tvar spellMPP 1 when ^You are bathed in a soft silver glow for a moment\.
     action (buffs) put #tvar spellMPP 0 when ^The soft silver glow fades from around you\.
     action (buffs) put #tvar spellMAPP 1 when ^You sense the Major Physical Protection spell (upon|surrounding) you, which will last for about .*\.
     action (buffs) put #tvar spellMAPP 1 when ^You sense the Major Physical Protection spell (upon|surrounding) you, which is linked to your Osrel Meraud orb\.
     action (buffs) put #tvar spellMAPP 1 when ^A sense of calm focus takes hold as the luminous pattern washes over you\.
     action (buffs) put #tvar spellMAPP 0 when ^The field of silver-blue light dissipates from around you\.
     action (buffs) put #tvar spellCENTERING 1 when ^You sense the Centering spell (upon|surrounding) you, which will last for about .*\.
     action (buffs) put #tvar spellCENTERING 1 when ^You sense the Centering spell (upon|surrounding) you, which is linked to your Osrel Meraud orb\.
     action (buffs) put #tvar spellCENTERING 1 when ^The ceaseless ebb and flow of your spirit palpably quiets, granting you an enhanced grounding in your body\.
     action (buffs) put #tvar spellCENTERING 0 when ^The sense of spiritual centering leaves you\.
     action (buffs) put #tvar spellBENEDICTION 1 when ^You sense the Benediction spell (upon|surrounding) you, which will last for about .*\.
     action (buffs) put #tvar spellBENEDICTION 1 when ^You sense the Benediction spell (upon|surrounding) you, which is linked to your Osrel Meraud orb\.
     action (buffs) put #tvar spellBENEDICTION 1 when ^You make a holy gesture and intone reverently, \".+, hear my plea\!\"
     action (buffs) put #tvar spellBENEDICTION 1 when ^A surge of strong energy tingles through every nerve in your body, leaving you feeling more dexterous\.
     action (buffs) put #tvar spellBENEDICTION 1 when ^You suddenly feel more limber, your reflexes charged with a strong energy
     action (buffs) put #tvar spellBENEDICTION 0 when ^You feel the divinity seep from your bones as the previous blessing of .+ wanes\.
     action (buffs) put #tvar spellAUSPICE 1 when ^A shaft of brilliant white light descends from the heavens, bathing you in its radiance\.
     action (buffs) put #tvar spellAUSPICE 1 when ^You sense the Auspice spell (upon|surrounding) you
     action (buffs) put #tvar spellAUSPICE 1 when eval ($SpellTimer.Auspice.active = 1)
     action (buffs) put #tvar spellAUSPICE 0 when eval ($SpellTimer.Auspice.active = 0)
     action (buffs) put #tvar spellDR 1 when ^A glowing aura surrounds you
     action (buffs) put #tvar spellDR 1 when ^You sense the Divine Radiance spell (upon|surrounding) you
     action (buffs) put #tvar spellDR 0 when eval ($SpellTimer.DivineRadiance.active = 0)
     action (buffs) put #tvar spellGHS 1 when ^A swirling grey fog surrounds you\.
     action (buffs) put #tvar spellGHS 1 when eval ($SpellTimer.GhostShroud.active = 1)
     action (buffs) put #tvar spellGHS 0 when eval ($SpellTimer.GhostShroud.active = 0)
     action (buffs) put #tvar spellSAP 1 when ^A brilliant silver halo appears briefly around your head
     action (buffs) put #tvar spellSAP 1 when eval ($SpellTimer.SanctifyPattern.active = 1)
     action (buffs) put #tvar spellSAP 0 when ^Your nerves buzz unpleasantly as the pattern guiding your spellcasting loses cohesion\.
     action (buffs) put #tvar spellSAP 0 when eval ($SpellTimer.SanctifyPattern.active = 0)
     action (buffs) put #tvar spellMF 1 when ^A warm sensation of security floods your bones as the faint outline of a spectral bird roars into visibility
     action (buffs) put #tvar spellMF 1 when eval ($SpellTimer.MurrulasFlames.active = 1)
     action (buffs) put #tvar spellMF 0 when eval ($SpellTimer.MurrulasFlames.active = 0)
     action (buffs) put #tvar spellPOM 1 when ^You sense the Persistence of Mana spell (upon|surrounding) you
     action (buffs) put #tvar spellPOM 1 when You feel the energy of your spell revitalize the Persistence of Mana pattern within you\.
     action (buffs) put #tvar spellPOM 1 when ^Your spell finally takes full shape, and a vast aural emptiness blots out the pain as quickly as it had come
     action (buffs) put #tvar spellPOM 1 when eval ($SpellTimer.PersistenceofMana.active = 1)
     action (buffs) put #tvar spellPOM 0 when eval ($SpellTimer.PersistenceofMana.active = 0)
     action (buffs) put #tvar spellSOL 1 when ^In a fiery blaze, a shimmering .* shield
     action (buffs) put #tvar spellSOL 1 when eval ($SpellTimer.ShieldofLight.active = 1)
     action (buffs) put #tvar spellSOL 0 when ^Your .* shield fades away into nothingness
     action (buffs) put #tvar spellSOL 0 when eval ($SpellTimer.ShieldofLight.active = 0)
	action (buffs) put #tvar spellSOL 1 when You sense the Shield of Light spell (upon|surrounding) you
     action (buffs) put #tvar spellSL 1 when ^A sheet of lustrous silver liquid snaps into being vertically in front of you
     action (buffs) put #tvar spellSL 1 when eval ($SpellTimer.SanyuLyba.active = 1)
     action (buffs) put #tvar spellSL 0 when eval ($SpellTimer.SanyuLyba.active = 0)
     action (buffs) put #tvar spellHYH 0 when eval ($SpellTimer.HydraHex.active = 0)
	action (buffs) put #tvar spellHYH 0 when ^The deadening murk around you subsides
	action (buffs) put #tvar spellHYH 1 when ^Swirls of malefic darkness gather in a wide matrix near your body
	action (buffs) put #tvar spellHYH 1 when ^You sense the Hydra Hex spell (upon|surrounding) you, which will last until 
	action (buffs) put #tvar spellHYH 1 when eval ($SpellTimer.HydraHex.active = 1)
     action (buffs) put #tvar spellSA 1 when eval ($SpellTimer.SoulAttrition.active = 1)
     action (buffs) put #tvar spellSA 0 when eval ($SpellTimer.SoulAttrition.active = 0)
     action (buffs) put #tvar spellREV 1 when eval ($SpellTimer.Revelation.active = 1)
     action (buffs) put #tvar spellREV 0 when eval ($SpellTimer.Revelation.active = 0)
     action var devotion 16 when ^After a moment, you feel a clear presence like a warm blanket
     action var devotion 15 when ^After a moment, you see a crystal-clear vision of your god
     action var devotion 14 when ^After a moment, you see a vision of your god who calls to you by name, \"My child, though you may not always see my face, I am pleased with thee and thy efforts\.\"
     action var devotion 13 when ^After a moment, you see a vision of your god who calls to you by name, \"Come here, my child, and I will show you things of wonder\.\"
     action var devotion 12 when ^After a moment, you see a silent vision of your god, radiating forth with a powerful divine brilliance\.
     action var devotion 11 when ^After a moment, you sense a slight pressure on your shoulder, leaving the feeling that your efforts have been acknowledged\.
     action var devotion 10 when ^After a moment, you see a vision of your god, though the visage is cloudy and impossible to make out clearly\.
     action var devotion 9 when ^After a moment, you sense that your god is pleased with your devotion
     action var devotion 8 when ^After a moment, you sense that your god knows your name\.
     action var devotion 7 when ^After a moment, you sense that your god is aware of your devotion\.
     action var devotion 6 when ^After a moment, you sense a distinct link between you and your god\.
     action var devotion 5 when ^After a moment, you sense that your efforts have not gone unnoticed\.
     action var devotion 4 when ^After a moment, you sense that your god is barely aware of you\.
     action var devotion 3 when ^You call out to your god, but there is no answer\.
     action var devotion 2 when ^You close your eyes and start to concentrate\.
     action var devotion 1 when ^You feel unclean and unworthy\.
     action var EF.Ready 1 when ^You feel the last pang of desire for Eylhaar's Feast fade away\.
     action var EF.Ready 0 when ^A hedonist\'s banquet of tastes and smells fills your senses\.
     var EF.Ready 1
	put #tvar spellREV 0
	put #tvar spellHYH 0
	put #tvar spellSA 0
     put #tvar spellSL 0
     put #tvar spellSOL 0
     put #tvar spellMF 0
     put #tvar spellPOM 0
     put #tvar spellAUSPICE 0
     put #tvar spellDR 0
     put #tvar spellGHS 0
     put #tvar spellSAP 0
     put #tvar activeOM 0
     put #tvar spellPFE 0
     put #tvar spellMPP 0
     put #tvar spellMAPP 0
     put #tvar spellCENTERING 0
     put #tvar spellBENEDICTION 0
     put #var SpellTimer.OsrelMeraud.active 0
     put #var SpellTimer.OsrelMeraud.duration 0
     put #var SpellTimer.Revelation.duration 0
     put #var SpellTimer.SoulAttrition.duration 0
     put #var SpellTimer.HydraHex.duration 0
     put #var SpellTimer.SanyuLyba.duration 0
     put #var SpellTimer.ShieldofLight.duration 0
     put #var SpellTimer.PersistenceofMana.duration 0
     put #var SpellTimer.MurrulasFlames.duration 0
     put #var SpellTimer.SanctifyPattern.duration 0
     put #var SpellTimer.GhostShroud.duration 0
     put #var SpellTimer.DivineRadiance.duration 0
     put #var SpellTimer.Auspice.duration 0
     put #var SpellTimer.Centering.duration 0
     put #var SpellTimer.Benediction.duration 0
     put #var SpellTimer.MajorPhysicalProtection.duration 0
     put #var SpellTimer.MinorPhysicalProtection.duration 0
     put #var SpellTimer.ProtectionfromEvil.duration 0
MOONIE_BUFF:
     action (buffs) put #tvar spellCV 1 when eval ($SpellTimer.ClearVision.active = 1)
     action (buffs) put #tvar spellCV 0 when eval ($SpellTimer.ClearVision.active = 0)
     action (buffs) put #tvar spellCV 1 when ^You briefly feel less aware of your environment, then (suddenly )?feel more aware again\.
     action (buffs) put #tvar spellCV 1 when ^You sense the Clear Vision spell (upon|surrounding) you, .*\.
     action (buffs) put #tvar spellCV 1 when ^You feel more aware of your environment\.
     action (buffs) put #tvar spellCV 0 when ^You feel less aware of your environment\.
     action (buffs) put #tvar spellPG 1 when eval ($SpellTimer.PiercingGaze.active = 1)
     action (buffs) put #tvar spellPG 0 when eval ($SpellTimer.PiercingGaze.active = 0)
     action (buffs) put #tvar spellPG 1 when ^The center of your vision loses its color\.\s*Adjusting your sight, you notice that objects you focus on become grey and gain a murky transparency\.
     action (buffs) put #tvar spellPG 1 when ^The world around you wavers briefly, then brightens considerably\.
     action (buffs) put #tvar spellPG 1 when ^The world around you wavers briefly, then regains its murky transparency\.
     action (buffs) put #tvar spellPG 1 when ^You sense the Piercing Gaze spell (upon|surrounding) you, .*\.
     action (buffs) put #tvar spellPG 1 when ^The world around you brightens considerably\.
     action (buffs) put #tvar spellPG 0 when ^The world around you returns to its mundane appearance\.
     action (buffs) put #tvar spellSOD 1 when eval ($SpellTimer.SovereignDestiny.active = 1)
     action (buffs) put #tvar spellSOD 0 when eval ($SpellTimer.SovereignDestiny.active = 0)
     action (buffs) put #tvar spellSOD 0 when ^The glistening azure lines fade away\.
     action (buffs) put #tvar spellSEER 1 when eval ($SpellTimer.SeersSense.active = 1)
     action (buffs) put #tvar spellSEER 0 when eval ($SpellTimer.SeersSense.active = 0)
     action (buffs) put #tvar spellSEER 1 when ^You sense the Seer's Sense spell (upon|surrounding) you, which|^You feel oddly in tune with the web of fate\.|^You renew your attunement to the web of fate
     action (buffs) put #tvar spellSEER 0 when ^You no longer feel as strong a connection to the web of fate\.
     action (buffs) put #tvar spellSHADOWS 1 when eval ($SpellTimer.Shadows.active = 1)
     action (buffs) put #tvar spellSHADOWS 0 when eval ($SpellTimer.Shadows.active = 0)
     action (buffs) put #tvar spellSHADOWS 1 when ^You sense the Shadows spell (upon|surrounding) you, which
     action (buffs) put #tvar spellSHADOWS 1 when ^(There is a subtle change in the lighting around you\.\s+You should find it easier to skulk in the shadows now\.|You notice the shadows about you briefly lightening, then they quickly darken once more\.)
     action (buffs) put #tvar spellSHADOWS 0 when ^You notice the shadows about you lightening, making it harder to conceal yourself\.
     action (buffs) put #tvar spellTS 1 when eval ($SpellTimer.TenebrousSense.active = 1)
     action (buffs) put #tvar spellTS 0 when eval ($SpellTimer.TenebrousSense.active = 0)
     action (buffs) put #tvar spellTS 1 when ^You sense the Tenebrous Sense spell (upon|surrounding) you, which
     action (buffs) put #tvar spellTS 1 when ^Your tactile sense stretches out and intertwines with the shadows around you\.\s+You feel mass and movement brush against the shadows like a tingling against your skin\.
     action (buffs) put #tvar spellTS 0 when ^Your tactile sense returns to normal\.
     action (buffs) put #tvar spellAUS 1 when eval ($SpellTimer.AuraSight.active = 1)
     action (buffs) put #tvar spellAUS 0 when eval ($SpellTimer.AuraSight.active = 0)
     action (buffs) put #tvar spellAUS 1 when ^You sense the Aura Sight spell (upon|surrounding) you, which|^The auras in your vision blur and dance
     action (buffs) put #tvar spellAUS 1 when ^Your color vision blossoms with new depth\.\s+The vibrant hues resolve into unintelligible auras that dance around everything you see\.
     action (buffs) put #tvar spellAUS 0 when ^Your color vision returns to normal, causing the auras you see to dim and vanish\.
     action (buffs) put #tvar spellCOL 1 when eval ($SpellTimer.CageofLight.active = 1)
     action (buffs) put #tvar spellCOL 0 when eval ($SpellTimer.CageofLight.active = 0)
     action (buffs) put #tvar spellCOL 1 when ^Tendrils of blue-white light silently shimmer into view and wrap around you, covering you in a barrier forming a lattice of geometric shapes\. 
     action (buffs) put #tvar spellCOL 1 when ^With a dull roar, flares of blazing crimson light explode into being and swirl around you, covering you in a barrier of pulsing light\.
     action (buffs) put #tvar spellCOL 1 when ^With a barely perceptible screech, nearby shadows thicken and ooze toward you, covering you in a barrier made of thin, crazed lines\. 
     action (buffs) put #tvar spellCOL 0 when ^(Your cage of shadows shatters, the fragments dissipating as they fall away\.|Your cage of light loses cohesion and drifts away as motes of blue-white light\.|Your cage of celestial fire erupts in a flare of crimson light and vanishes\.)
     action (buffs) put #tvar spellRTR 1 when ^At the ritual\'s peak, your prophetic connection blooms a thousand-fold\.\s+You are alone\.\s+An infinitesimal speck in space and time adrift in an infinite sea of possibility\.\s+The course of your past, present and future are dictated by ceaseless currents beyond any mortal control\.
     action (buffs) put #var spellRTR 0 when ^As your ritual ebbs away, you find yourself returned to a world of immutable, indisputable facts\. 
     action (buffs) put #tvar spellRTR 1 when eval ($SpellTimer.ReadtheRipples.active = 1)
     action (buffs) put #tvar spellRTR 0 when eval ($SpellTimer.ReadtheRipples.active = 0)
     action (buffs) put #tvar spellPSY 1 when ^You sense forces gathering about you to protect you from harm
     action (buffs) put #tvar spellPSY 0 when ^Your Psychic Shield wears off\.
     action (buffs) put #tvar spellSLS 1 when eval ($SpellTimer.StarlightSphere.active = 1)
     action (buffs) put #tvar spellSLS 0 when eval ($SpellTimer.StarlightSphere.active = 0)
     action (buffs) put #tvar spellSHW 1 when eval ($SpellTimer.ShadowWeb.active = 1)
     action (buffs) put #tvar spellSHW 0 when eval ($SpellTimer.ShadowWeb.active = 0)
     action (buffs) put #tvar spellTKSH 1 when eval ($SpellTimer.TelekineticShield.active = 1)
     action (buffs) put #tvar spellTKSH 1 when ^You build up a potent field of telekinetic energy around you, capturing small motes of dust and debris in the air around you\.
     action (buffs) put #tvar spellTKSH 1 when ^You sense the Telekinetic Shield spell (upon|surrounding) you
     action (buffs) put #tvar spellTKSH 0 when eval ($SpellTimer.TelekineticShield.active = 0)
     action (buffs) put #tvar spellTKSH 0 when ^You sense your Telekinetic Barrier wind down, causing small motes of suspended dust and dirt to drop to the ground\.
	put #tvar spellSLS 0
     put #tvar spellCV 0
     put #tvar spellPG 0
     put #tvar spellSHADOWS 0
     put #tvar spellPSY 0
     put #tvar spellSOD 0
     put #tvar spellSEER 0
     put #tvar spellTS 0
     put #tvar spellAUS 0
     put #tvar spellCOL 0
     put #tvar spellRTR 0
     put #tvar spellSHW 0
     put #tvar spellTKSH 0
     put #var SpellTimer.ClearVision.active 0
     put #var SpellTimer.PiercingGaze.duration 0
     put #var SpellTimer.SeersSense.duration 0
     put #var SpellTimer.Shadows.duration 0
     put #var SpellTimer.TenebrousSense.duration 0
     put #var SpellTimer.AuraSight.duration 0
     put #var SpellTimer.CageofLight.duration 0
     put #var SpellTimer.SovereignDestiny.duration 0
     put #var SpellTimer.PsychicShield.duration 0
     put #var SpellTimer.TezirahsVeil.duration 0
NECRO_BUFF:
     action (buffs) put #var spellOBFUSCATION 0 when ^You sense the obfuscating field around you vanish\.
     action (buffs) put #var spellOBFUSCATION 1 when ^The spell cannot mesh with the one already surrounding you, and fails\.
     action (buffs) put #var spellOBFUSCATION 1 when ^You project around yourself a field that suggests total normalcy to any who view you, drawing some measure of attention away from you and making it easier to conceal yourself\.
     action (buffs) put #var spellOBFUSCATION 1 when ^You sense the Obfuscation spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellPHP 0 when ^An unpleasant sensation jolts through your body as your mutation fades, leaving you feeling briefly weakened as well as slower\.
     action (buffs) put #var spellPHP 1 when ^Whorls of reddish-black energy leap forth from your hands to further infuse your body with mutative energy,
     action (buffs) put #var spellPHP 1 when ^Swirls of reddish-black energy erupt forth from all over your body, settling into your nervous system.  There is the briefest flash of intense pain before the spell improves your mortal reflexes into something beyond that of a normal .*\.
     action (buffs) put #var spellPHP 1 when ^You clench your hands into fists and grit your teeth, trying to channel mutation through your body!
     action (buffs) put #var spellPHP 1 when ^You sense the Philosopher's Preservation spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellEOTB 0 when ^Your corruptive mutation fades, revealing you to the world once more\.
     action (buffs) put #var spellEOTB 0 when ^Your corruption fades, revealing you to the world once more\.
     action (buffs) put #var spellEOTB 0 when eval ($SpellTimer.EyesoftheBlind.active = 0)
     action (buffs) put #var spellEOTB 1 when eval ($SpellTimer.EyesoftheBlind.active = 1)
     action (buffs) put #var spellEOTB 1 when ^You feel a rippling sensation throughout your body as your corruptive mutation alters you and your equipment into blind spots invisible to the world\.
     action (buffs) put #var spellEOTB 1 when ^Your spell subtly alters the corruptive mutation upon you,
     action (buffs) put #var spellEOTB 1 when ^You sense the Eyes of the Blind spell (upon|surrounding) you,
     action (buffs) put #var spellEOTB 1 when ^You feel an unsteady, rippling sensation as corruption spreads through and past your body, altering the blind spots of any would-be witness\.
     action (buffs) put #var spellROC 0 when ^The Rite of Contrition matrix loses cohesion, leaving your aura naked\.
     action (buffs) put #var spellROC 0 when eval ($SpellTimer.RiteofContrition.active = 0)
     action (buffs) put #var spellROC 1 when eval ($SpellTimer.RiteofContrition.active = 1)
     action (buffs) put #var spellROC 1 when ^You weave a field of sublime corruption, concealing the scars in your aura under a layer of magical pretense\.
     action (buffs) put #var spellROC 1 when ^You sense the Rite of Contrition spell (upon|surrounding) you, which will last .*\.
	action (buffs) put #var spellROG 1 when ^You project your self-image outward on a gust of psychic miasma
	action (buffs) put #var spellROG 1 when eval ($SpellTimer.RiteofGrace.active = 1)
	action (buffs) put #var spellROG 0 when eval ($SpellTimer.RiteofGrace.active = 0)
     action (buffs) put #var spellQE 0 when ^You sense your Quicken the Earth spell fade.
     action (buffs) put #var spellREI 0 when ^Your mind reels from the loss of something taken from it, something innately precious\.\.\. that you can no longer fully understand\.
     action (buffs) put #var spellREI 1 when ^A smoky film of grey mist exudes from your palms as you draw them close to your face\.  Breathing in deeply, you immediately feel a thrill of euphoria\.  Your mind is opened up, new thoughts and insights forming that were previously beyond your grasp\.
     action (buffs) put #var spellREI 1 when ^You sense the Researcher's Insight spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellVS 0 when ^The .* twitches as if trying to shake off its afflictions\.|^.* no longer seems petrified\.
     action (buffs) put #var spellVS 1 when ^You make a sweeping gesture with your arm, bringing it up from the sky down towards the ground\.
     action (buffs) put #var spellPV 0 when ^.* no longer seems petrified\.
     action (buffs) put #var spellPV 0 when ^.* able to quickly shake off your attempt to toy with .* mind\.
     action (buffs) put #var spellPV 1 when ^Your malefic assault overtakes .*, petrifying it to the spot\!
     action (buffs) put #var spellUSOL 0 when ^The greenish hues about you vanish as the Universal Solvent matrix loses its cohesion\.
     action (buffs) put #var spellUSOL 1 when ^You draw your spell matrix into a tight sphere around yourself, and the air about you shimmers with bilious, deep green hues
     action (buffs) put #var spellUSOL 1 when ^You sense the Universal Solvent spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellUSOL 1 when ^A torrent of sizzling, bile-green acid sprays outward from you\!
     action (buffs) put #var spellUSOL 1 when ^The greenish radiation around you burbles warningly before a sphere of hissing acid spews forth in all directions\!
     action (buffs) put #var spellUSOL 1 when ^Sibilant jets of universal solvent spout from around you, dyeing the vicinity a fascinating shade of green\!
     action (buffs) put #var spellUSOL 1 when ^The hiss of bile-green droplets drowns out nearly all other sound as acidic showers erupting from around you soak everything in sizzling wetness\!
     action (buffs) put #var spellUSOL 1 when ^A torrent of sizzling, bile-green acid sprays outward from you\!
     action (buffs) put #var spellIVM 0 when ^A brief urge to sick up fills your stomach as your face abruptly resumes its normal shape, color returning to the skin as the mutation fails\.
     action (buffs) put #var spellIVM 1 when ^You sense the Ivory Mask spell (upon|surrounding) you, which will last.*\.
     action (buffs) put #var spellIVM 1 when ^Color leeches from the skin on your face as you feel the bone structure underneath shift to accomodate changes on the inside of your skull\.
     action (buffs) put #var spellCH 1 when ^You shudder involuntarily as streams of black energy slide back up across your arms from your fingertips
     action (buffs) put #var spellCH 1 when eval ($SpellTimer.CalcifiedHide.active = 1)
     action (buffs) put #var spellCH 0 when eval ($SpellTimer.CalcifiedHide.active = 0)
     action (buffs) put #var spellOBF 1 when ^You project around yourself a field that suggests total normalcy to any who view you
     action (buffs) put #var spellOBF 1 when eval ($SpellTimer.Obfuscation.active = 1)
     action (buffs) put #var spellOBF 0 when eval ($SpellTimer.Obfuscation.active = 0)
     action (buffs) put #var spellRPU 1 when ^From your extended hand, your spell travels through the thanatological link connecting you
     action (buffs) put #var spellRPU 1 when eval ($SpellTimer.ReversePutrefaction.active = 1)
     action (buffs) put #var spellRPU 0 when eval ($SpellTimer.ReversePutrefaction.active = 0)
     action (buffs) put #var spellGHOULFLESH 1 when eval ($SpellTimer.Ghoulflesh.active = 1)
     action (buffs) put #var spellGHOULFLESH 0 when eval ($SpellTimer.Ghoulflesh.active = 0)
	put #tvar spellROG 0
     put #tvar spellCH 0
     put #tvar spellOBF 0
     put #tvar spellRPU 0
     put #tvar spellCH 0
     put #tvar spellOBFUSCATION 0
     put #tvar spellPHP 0
     put #tvar spellEOTB 0
     put #tvar spellREI 0
     put #tvar spellROC 0
     put #tvar spellVS 0
     put #tvar spellPV 0
     put #tvar spellIVM 0
     put #tvar spellUSOL 0
     put #tvar spellGHOULFLESH 0
     put #var SpellTimer.RiteofContrition.active 0
     put #var SpellTimer.RiteofContrition.duration 0
     put #var SpellTimer.RiteofGrace.duration 0
     put #var SpellTimer.EyesoftheBlind.duration 0
     put #var SpellTimer.UniversalSolvent.duration 0
     put #var SpellTimer.QuickentheEarth.duration 0
     put #var SpellTimer.ResearchersInsight.duration 0
     put #var SpellTimer.PhilosophersPreservation.duration 0
     put #var SpellTimer.Obfuscation.duration 0
     put #var SpellTimer.ReversePutrefaction.duration 0
     put #var SpellTimer.Ghoulflesh.duration 0
PALADIN_BUFF:
     action (buffs) put #tvar spellAA 0 when ^You sense the invisible magic guarding you fade\.
     action (buffs) put #tvar spellAA 1 when ^You sense the Aspirant's Aegis spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellAA 1 when ^A comforting opalescent glow momentarily illuminates you before sinking into your \w+\.
     action (buffs) put #tvar spellAS 0 when ^The dull orange glow fades from you\.
     action (buffs) put #tvar spellAS 1 when ^You sense the Anti-Stun spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellAS 1 when ^A dull orange glow settles around you\.
     action (buffs) put #tvar spellBA 0 when ^Your previous bond with an? .+ breaks\.
     action (buffs) put #tvar spellBA 1 when ^You sense that there is a bond between you and an? .+, which should last for
     action (buffs) put #tvar spellBA 1 when ^You sense a new bond forged between you and your
     action (buffs) put #tvar spellBA 1 when ^Tendrils of translucent white writhe around your .+\.
     action (buffs) put #tvar spellBA 1 when ^The spell pattern refuses to meld with the bonding magic
     action (buffs) put #tvar spellBOT 0 when ^The ghostly banner fades out of sight\.
     action (buffs) put #tvar spellBOT 1 when ^You sense the Banner of Truce spell matrix in the area\.
     action (buffs) put #tvar spellBOT 1 when ^A ghostly white banner fades into view overhead\.
     action (buffs) put #tvar spellCOURAGE 0 when ^You falter for a moment as your extra courage slips away\.
     action (buffs) put #tvar spellCOURAGE 1 when ^You sense the Courage spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellCOURAGE 1 when ^You feel your courage bolstered by your faith and determination\.
     action (buffs) put #tvar spellDA 0 when ^Your .+ returns? to (its|their) normal condition\.
     action (buffs) put #tvar spellDA 1 when ^You sense the Divine Armor spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellDA 1 when ^Your .+ feels?.+ more substantial\.
     action (buffs) put #tvar spellDIG 0 when ^Your profound inspiration wanes and expires as thin, wispy lines of light alternately appear and disappear near your head\.
     action (buffs) put #tvar spellDIG 1 when ^You sense the Divine Guidance spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellDIG 1 when ^Brilliant, hair-like threads of light form a wispy crown around your head, bringing with them an epiphany of thought and knowledge\.
     action (buffs) put #tvar spellHES 0 when ^Your extra strength deserts you as the glistening net unravels from your body\.
     action (buffs) put #tvar spellHES 1 when ^You sense the Heroic Strength spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellHES 1 when ^A glistening net of coiling tendrils interlaces itself across your muscles, outlining each vein and contour with sparkles of white light\.
     action (buffs) put #tvar spellHOJ 0 when ^Your zeal for justice wanes as you realize the divine guidance of Chadatru has faded\.
     action (buffs) put #tvar spellHOJ 1 when ^You sense the Hands of Justice spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellHOJ 1 when ^Your hands glow briefly with a pristine white light as you feel your dedication to the pursuit of justice strengthened\!
     action (buffs) put #tvar spellHOW 0 when ^The holy golden radiance of your soul subsides, retreating into your body\.
     action (buffs) put #tvar spellHOW 1 when ^You sense the Holy Warrior spell (upon|surrounding) you, which will last until
     action (buffs) put #tvar spellHOW 1 when ^You clap your hands once in an august gesture of piety\.$} {#var HOW ON} {buff}
     action (buffs) put #tvar spellMO 0 when ^You falter for a moment as your inner faculties return to normal\.
     action (buffs) put #tvar spellMO 1 when ^You sense the Marshal Order spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellMO 1 when ^You sense a righteous awakening, leaving you .+ more in tune with your body, mind and spirit\.
     action (buffs) put #tvar spellRUE 0 when ^You sense the Rutilor's Edge spell fade from your .+\.
     action (buffs) put #tvar spellRUE 0 when ^You sense the Rutilor's Edge spell fade away\.
     action (buffs) put #tvar spellRUE 0 when ^A soft silver glow fades from your .+\.
     action (buffs) put #tvar spellRUE 1 when ^You sense the Rutilor's Edge spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellRUE 1 when ^A soft silver glow envelops your .* and is slowly absorbed into it\.
     action (buffs) put #tvar spellRW 0 when ^You feel your righteous rage dissipate\.
     action (buffs) put #tvar spellRW 1 when ^You sense the Righteous Wrath spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellRW 1 when ^Your blood begins to boil and with a mighty shout you allow the rage within to flow outward for all to see\.
     action (buffs) put #tvar spellSP 0 when ^The power of the Soldier's Prayer slips away from you, fused elements of its pattern falling away like brittle metal\.
     action (buffs) put #tvar spellSP 1 when ^You sense the Soldier's Prayer spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellSP 1 when ^You weave a simple barrier out of invisible strands of Holy energy and then focus inward\.  Spiritual heat surges from your refined soul, tempering the pattern\.
     action (buffs) put #tvar spellSR 0 when ^Your sense of protection leaves you\.
     action (buffs) put #tvar spellSR 1 when ^You sense the Sentinel's Resolve spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellSR 1 when ^You sense a potent wave of righteousness lend its protection to you\.
     action (buffs) put #tvar spellSR 1 when ^You sense a familiar wave of righteousness lend its protection to you once more\.
     action (buffs) put #tvar spellTR 0 when ^Truffenyi's Rally ends, leaving behind a momentary sensation of something stuck in your throat\.
     action (buffs) put #tvar spellTR 1 when ^You sense the Truffenyi's Rally spell (upon|surrounding) you, which will last until
     action (buffs) put #tvar spellTR 1 when ^You speak a few words of righteousness in Truffenyi's name\.
     action (buffs) put #tvar spellCLARITY 1 when ^You feel your holy inclinations strengthen your senses, allowing a clearer perspective on the world\.
     action (buffs) put #tvar spellCLARITY 1 when ^You sense the Clarity spell (upon|surrounding) you, which will last for
     action (buffs) put #tvar spellCLARITY 0 when ^You seem to lose the clarity of your mind\.
     action (buffs) put #var spellTK 1 when eval ($SpellTimer.TamsinesKiss.active = 1)
     action (buffs) put #var spellTK 1 when ^You twist the mana streams of your Tamsine's Kiss spell in a chaotic motion, inciting them into unpredictable patterns\.
     action (buffs) put #var spellTK 1 when ^A cool sensation washes over you, yet instead of soothing your body it leaves you hungry and your flesh burning with a mild fever\.
     action (buffs) put #var spellTK 0 when eval ($SpellTimer.TamsinesKiss.active = 0)
     action (buffs) put #var spellTK 0 when ^The Tamsine's Kiss pattern falters and dissipates, its distracting healing sensation departing with it\.
     put #tvar spellAA 0
     put #tvar spellAS 0
     put #tvar spellBA 0
     put #tvar spellBOT 0
     put #tvar spellCOURAGE 0
     put #tvar spellDA 0
     put #tvar spellDIG 0
     put #tvar spellHES 0
     put #tvar spellHOJ 0
     put #tvar spellHOW 0
     put #tvar spellMO 0
     put #tvar spellRUE 0
     put #tvar spellRW 0
     put #tvar spellSP 0
     put #tvar spellSR 0
     put #tvar spellTR 0
     put #tvar spellTK 0
     put #var SpellTimer.AspirantsAegis.active 0
     put #var SpellTimer.AspirantsAegis.duration 0
     put #var SpellTimer.AntiStun.duration 0
     put #var SpellTimer.BannerofTruce.duration 0
     put #var SpellTimer.Courage.duration 0
     put #var SpellTimer.DivineArmor.duration 0
     put #var SpellTimer.DivineGuidance.duration 0
     put #var SpellTimer.HeroicStrength.duration 0
     put #var SpellTimer.HandsofJustice.duration 0
     put #var SpellTimer.HolyWarrior.duration 0
     put #var SpellTimer.RutilorsEdge.duration 0
     put #var SpellTimer.SoldiersPrayer.duration 0
     put #var SpellTimer.SentinelsResolve.duration 0
     put #var SpellTimer.Clarity.duration 0
     put #var SpellTimer.TruffenyisRally.duration 0
     put #var SpellTimer.TamsinesKiss.duration 0
RANGER_BUFF:
     action (buffs) put #var spellSK 1 when ^The left side of the world becomes hazed in gauzy green shadows briefly, and you find yourself drifting to the verge of reveries paradisiac and exhilarating\.
     action (buffs) put #var spellSK 0 when ^Your green-shadowed reveries grow distant\.
     action (buffs) put #var spellHOL 1 when ^A sound like a soft murmuring fills your ears and a warm feeling spreads through your hands\.\s*You suddenly feel more confident about your skinning abilities\.
     action (buffs) put #var spellHOL 1 when ^You sense the Hands of Lirisa spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellHOL 0 when ^You suddenly feel less confident about your skinning abilities.
     action (buffs) put #var spellHOL 0 when ^You suddenly feel less confident about your skinning and locksmithing abilities
     action (buffs) put #var spellWOTP 1 when ^The overwhelming sense of unity with your hidden brothers and sisters sharpens your intuition, kin and prey alike.  Your new found intuition of the ways of the wolf also gives you insight into hidden dangers.
     action (buffs) put #var spellWOTP 1 when ^You sense the Wisdom of the Pack spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellWOTP 0 when ^With a slight jolt, you suddenly feel disconnected from the pack.
     action (buffs) put #var spellATH 1 when ^Your body suddenly shakes with an infusion of energy as the spell grips you.  An unignorable desire for adventure forcibly comes to the forefront of your mind.
     action (buffs) put #var spellATH 1 when ^You sense the Athleticism spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellATH 1 when ^Energy rushes into you and you feel as if you could outswim a caiman\.
     action (buffs) put #var spellATH 0 when ^You feel a sudden drain of energy, for a moment barely able to keep yourself upright.
     action (buffs) put #var spellSTW 1 when eval ($SpellTimer.SeetheWind.active = 1)
     action (buffs) put #var spellSTW 1 when ^As a growing .* sense washes over you, pale glowing lines appear before your eyes, delineating the ever-shifting currents of the wind\.
     action (buffs) put #var spellSTW 1 when ^You sense the See the Wind spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellSTW 0 when ^The glowing lines fade away along with the See the Wind spell
     action (buffs) put #var spellSTW 0 when eval ($SpellTimer.SeetheWind.active = 0)
     action (buffs) put #var spellINST 1 when eval ($SpellTimer.Instinct.active = 1)
     action (buffs) put #var spellINST 1 when ^Your muscles twitch with nervous energy as the spell takes hold.
     action (buffs) put #var spellINST 1 when ^You feel momentarily befuddled as one set of prey instincts are abruptly replaced with another\.
     action (buffs) put #var spellINST 1 when ^You sense the Instinct spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellINST 0 when ^You feel safer and more calm as the Instinct spell fades away\.
     action (buffs) put #var spellSOTT 1 when ^Dark stripes form upon your skin, rippling with feral power
     action (buffs) put #var spellSOTT 1 when ^The feral power surges within you, barely constrained by your magic
     action (buffs) put #var spellSOTT 1 when ^Your senses sharpen considerably, making previously unknown details of the visible world painfully obvious\.
     action (buffs) put #var spellSOTT 1 when ^You sense the Sense of the Tiger spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellSOTT 0 when ^Your sharpened senses subside\.
     action (buffs) put #var spellCOTC 1 when ^You sense the Claws of the Cougar spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #var spellCOTC 1 when ^Your fingernails extend into razor-like claws as a flood of feline vigor fills your limbs
     action (buffs) put #var spellCOTC 0 when ^Your claws slowly retract, reforming into mundane fingernails
     action (buffs) put #var spellOATH 1 when ^You swear, "(I|Ever) .*\."
     action (buffs) put #var spellOATH 1 when ^A renewed sense of purpose fills you\.
     action (buffs) put #var spellOATH 1 when eval ($SpellTimer.OathoftheFirstborn.active = 1)
     action (buffs) put #var spellOATH 0 when eval ($SpellTimer.OathoftheFirstborn.active = 0)
     action (buffs) put #var spellEY 1 when ^You feel the strength and structure of the Essence of Yew spell build inside you
     action (buffs) put #var spellEY 1 when eval ($SpellTimer.EssenceofYew.active = 1)
     action (buffs) put #var spellEY 0 when eval ($SpellTimer.EssenceofYew.active = 0)
     action (buffs) put #var spellSKS 1 when ^The shadows subtly deepen about you as your movements grow still\.
     action (buffs) put #var spellSKS 1 when ^You renew the shadows and stillness cloaking your movements\.
     action (buffs) put #var spellSKS 1 when eval ($SpellTimer.SkeinofShadows.active = 1)
     action (buffs) put #var spellSKS 0 when eval ^As your Skein of Shadows disperses you notice that even your simple movements seem needlessly tumultuous\.
     action (buffs) put #var spellSKS 0 when eval ($SpellTimer.SkeinofShadows.active = 0)
	action (buffs) put #var spellEM 1 when ^You sense the Earth Meld spell (upon|surrounding) you, which will last
	action (buffs) put #var spellEM 1 when ^You reach with both your hands and your senses for the wisdom of the earth\.
	action (buffs) put #var spellEM 1 when ^Your mind races as your surroundings snap into sharp focus, places of concealment you never would have noticed suddenly revealed for your use\. 
     action (buffs) put #var spellETC 1 when ^You draw upon the essence of the natural cycle, embedding a sliver of its power into your frail body
     action (buffs) put #var spellETC 1 when eval ($SpellTimer.EmbedtheCycle.active = 1)
	action (buffs) put #var spellETC 0 when eval($SpellTimer.EmbedtheCycle.active = 0)
	action (buffs) put #var spellEM 1 when ^Your mind races as it seeks places of possible concealment\.
     action (buffs) put #var spellEM 1 when eval ($SpellTimer.EarthMeld.active = 1)
	action (buffs) put #var spellEM 0 when eval($SpellTimer.EarthMeld.active = 0)
	action (buffs) put #var spellEM 0 when ^You feel the Earth Meld spell dissipate completely\.
     action (buffs) put #var spellCS 1 when eval ($SpellTimer.CheetahSwiftness.active = 1)
     action (buffs) put #var spellCS 0 when eval ($SpellTimer.CheetahSwiftness.active = 0)
     action (buffs) put #var spellBES 1 when eval ($SpellTimer.BearStrength.active = 1)
     action (buffs) put #var spellBES 0 when eval ($SpellTimer.BearStrength.active = 0)
     action (buffs) put #var spellAF 1 when eval ($SpellTimer.AwakenForest.active = 1)
     action (buffs) put #var spellAF 0 when eval ($SpellTimer.AwakenForest.active = 0)
     action (buffs) put #var spellRITS 1 when eval ($SpellTimer.RiverintheSky.active = 1)
     action (buffs) put #var spellRITS 0 when eval ($SpellTimer.RiverintheSky.active = 0)
     action (buffs) put #var spellBLOODTHORNS 1 when eval ($SpellTimer.Bloodthorns.active = 1)
     action (buffs) put #var spellBLOODTHORNS 0 when eval ($SpellTimer.Bloodthorns.active = 0)
	put #tvar spellAF 0
	put #tvar spellBES 0
	put #tvar spellCS 0
	put #tvar spellEM 0
     put #tvar spellETC 0
     put #tvar spellSK 0
	put #tvar spellSKS 0
     put #tvar spellEY 0
     put #tvar spellOATH 0 
     put #tvar spellHOL 0
     put #tvar spellWOTP 0
     put #tvar spellATH 0
     put #tvar spellSTW 0
     put #tvar spellINST 0
     put #tvar spellSOTT 0
     put #tvar spellCOTC 0
     put #tvar spellRITS 0
     put #tvar spellBLOODTHORNS 0
     put #var SpellTimer.SyamelyoKuniyo.duration 0
     put #var SpellTimer.HandsofLirisa.duration 0
     put #var SpellTimer.WisdomofthePack.duration 0
     put #var SpellTimer.Athleticism.duration 0
     put #var SpellTimer.SeetheWind.duration 0
     put #var SpellTimer.Instinct.duration 0
     put #var SpellTimer.ClawsoftheCougar.duration 0
     put #var SpellTimer.SenseoftheTiger.duration 0
     put #var SpellTimer.OathoftheFirstborn.duration 0
     put #var SpellTimer.EssenceofYew.duration 0
     put #var SpellTimer.SkeinofShadows.duration 0
     put #var SpellTimer.EmbedtheCycle.duration 0
     put #var SpellTimer.EarthMeld.duration 0
     put #var SpellTimer.CheetahSwiftness.duration 0
     put #var SpellTimer.BearStrength.duration 0
     put #var SpellTimer.AwakenForest.duration 0
     put #var SpellTimer.RiverintheSky.duration 0
     put #var SpellTimer.Bloodthorns.duration 0

ANALOGOUS_BUFF:
	action (buffs) put #tvar preparedSymbiosis 1 when ^You recall the exact details of the (\w+) symbiosis
	action (buffs) put #tvar preparedSymbiosis 0 when ^You pause for a moment as the details of the (\w+) symbiosis fade from your mind\.
     action (buffs) put #tvar spellBURD 0 when ^\s*.* appears less distracted\.
     action (buffs) put #tvar spellBURD 1 when ^\s*.* visibly stiffens as it fights against your spell\.
     action (buffs) put #tvar spellBURD 1 when ^\s*.* is already burdened by this spell, rendering your attempt ineffectual\.
     action (buffs) put #tvar spellLW 0 when ^\s*You sense your invisible ward give away, leaving you more vulnerable\.
     action (buffs) put #tvar spellLW 1 when ^\s*A.* briefly appears around your arms and spreads imperceptibly around you to form your ward\.
     action (buffs) put #tvar spellLW 1 when ^\s*You sense the Lay Ward spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellEASE 0 when ^\s*You feel a weight settle over you, and realize the magic that has been easing your burden has faded\.
     action (buffs) put #tvar spellEASE 1 when ^\s*Pale yellow sparks flicker around your torso\.  Your possessions suddenly feel lighter and easier to carry\.
     action (buffs) put #tvar spellEASE 1 when ^\s*You sense the Ease Burden spell (upon|surrounding) you, which will last .*\.
     action (buffs) put #tvar spellMAF 0 when ^\s*The force previously protecting you shudders as it is displaced\.
     action (buffs) put #tvar spellMAF 0 when ^\s*The air around you shimmers with a.*yellow light that quickly disperses\.
     action (buffs) put #tvar spellMAF 0 when ^\s*The air around you solidifies into a.*yellow flicker, collapsing under the force of the attack in a silent cascade of glassy fragments that vanish before reaching the ground\.
     action (buffs) put #tvar spellMAF 1 when ^\s*The air around you shimmers with a.*yellow .*\.\s*The scintillating light writhes and twists, abruptly coalescing into a translucent field before blinking out of sight\.
     action (buffs) put #tvar spellMAF 1 when ^\s*You sense the Manifest Force spell surrounding you, which will last .*\.
     action (buffs) put #tvar spellSEC 1 when ^\s*A drop of glowing blood appears on your .* and darts across its surface, leaving a vivid trail\.\s*Within moments the whole .* is encased in a sphere, which then fades from sight\.
     action (buffs) put #tvar spellSEC 1 when ^\s*A magical field surrounds the .*, which should last .*\.
     put #tvar spellBURD 0
     put #tvar spellLW 0
     put #tvar spellEASE 0
     put #tvar spellMAF 0
     put #tvar spellSEC 0
     put #var SpellTimer.Burden.duration 0
     put #var SpellTimer.LayWard.duration 0
     put #var SpellTimer.EaseBurden.duration 0
     put #var SpellTimer.ManifestForce.duration 0
     echo *** LOADED BUFF TRIGGERS
     return
### END OF MAGIC USERS
BARB_BUFF:
     ## BARB FORMS
     ## action (buffs) put #var barb$1 0 when ^You feel your inner fire cool as you finish practicing the Form of the (\w+)
     action (buffs) put #var barbBadger 1 when ^You are currently practicing the Badger Form
     action (buffs) put #var barbBadger 1 when ^You lower your head slightly and snarl unconsciously as the fierce tenacity of the Badger takes hold
     action (buffs) put #var barbBadger 0 when ^You feel your inner fire cool as you finish practicing the Form of the Badger\.
     action (buffs) put #var barbBadger 1 when eval ($SpellTimer.Badger.active = 1)
     action (buffs) put #var barbBadger 0 when eval ($SpellTimer.Badger.active = 0)
     action (buffs) put #var barbBear 1 when ^You are currently practicing the Bear Form
     action (buffs) put #var barbBear 1 when ^A lumbering strength fills your body as you assume the movements of a hungry bear
     action (buffs) put #var barbBear 0 when ^You feel your inner fire cool as you finish practicing the Form of the Bear\.
     action (buffs) put #var barbBuffalo 1 when eval ($SpellTimer.Bear.active = 1)
     action (buffs) put #var barbBuffalo 0 when eval ($SpellTimer.Bear.active = 0)
     action (buffs) put #var barbBuffalo 1 when ^You are currently practicing the Buffalo Form
     action (buffs) put #var barbBuffalo 1 when ^Lurching forward, you reposition your burden and mimic the steady movements of the Buffalo\.
     action (buffs) put #var barbBuffalo 0 when ^The powerful gait of the Buffalo form leaves your mind and burden hampers your movements once again\.
     action (buffs) put #var barbBuffalo 1 when eval ($SpellTimer.Buffalo.active = 1)
     action (buffs) put #var barbBuffalo 0 when eval ($SpellTimer.Buffalo.active = 0)
     action (buffs) put #var barbDragon 1 when ^You are currently practicing the Dragon Form
     action (buffs) put #var barbDragon 1 when ^You slowly center yourself, your mind growing quiet as a quickly building rage surges through your body
     action (buffs) put #var barbDragon 0 when ^You feel your inner fire cool as you finish practicing the Form of the Dragon\.
     action (buffs) put #var barbDragon 1 when eval ($SpellTimer.Dragon.active = 1)
     action (buffs) put #var barbDragon 0 when eval ($SpellTimer.Dragon.active = 0)
     action (buffs) put #var barbEagle 1 when ^You are currently practicing the Eagle Form
     action (buffs) put #var barbEagle 1 when ^Scanning the distance, you acutely focus on distant targets waiting the full wrath you intend to deliver\.  With a shriek you begin to flex your hands in preparation of unleashing a distant mortal blow upon your enemies\!
     action (buffs) put #var barbEagle 0 when ^You feel your inner fire cool as you finish practicing the Form of the Eagle\.
     action (buffs) put #var barbEagle 1 when eval ($SpellTimer.Eagle.active = 1)
     action (buffs) put #var barbEagle 0 when eval ($SpellTimer.Eagle.active = 0)
     action (buffs) put #var barbPiranha 1 when ^You are currently practicing the Piranha Form
     action (buffs) put #var barbPiranha 1 when ^Your movements begin to mimic the rapid rythm of the piranha\.
     action (buffs) put #var barbPiranha 1 when ^You feel your inner fire cool as you finish practicing the Form of the Piranha\.
     action (buffs) put #var barbPiranha 1 when eval ($SpellTimer.Piranha.active = 1)
     action (buffs) put #var barbPiranha 0 when eval ($SpellTimer.Piranha.active = 0)
     action (buffs) put #var barbMonkey 1 when ^An interesting fluidity fills your muscles as you assume the movements of an agile monkey
     action (buffs) put #var barbMonkey 1 when ^You are currently practicing the Monkey Form
     action (buffs) put #var barbMonkey 0 when ^You feel your inner fire cool as you finish practicing the Form of the Monkey\.
     action (buffs) put #var barbMonkey 1 when eval ($SpellTimer.Monkey.active = 1)
     action (buffs) put #var barbMonkey 0 when eval ($SpellTimer.Monkey.active = 0)
     action (buffs) put #var barbOwl 1 when ^As you draw upon the behavior of an alert owl your eyes begin to transfix upon the surrounding shadows where danger may lurk
     action (buffs) put #var barbOwl 1 when ^You are currently practicing the Owl Form
     action (buffs) put #var barbOwl 0 when ^You feel your inner fire cool as you finish practicing the Form of the Owl\.
     action (buffs) put #var barbOwl 1 when eval ($SpellTimer.Owl.active = 1)
     action (buffs) put #var barbOwl 0 when eval ($SpellTimer.Owl.active = 0)
     action (buffs) put #var barbPanther 1 when ^A lumbering strength fills your body as you assume the movements of an alert Panther
     action (buffs) put #var barbPanther 1 when ^You are currently practicing the Panther Form
     action (buffs) put #var barbPanther 0 when ^You feel your inner fire cool as you finish practicing the Form of the Panther\.
     action (buffs) put #var barbPanther 1 when eval ($SpellTimer.Panther.active = 1)
     action (buffs) put #var barbPanther 0 when eval ($SpellTimer.Panther.active = 0)
     action (buffs) put #var barbPython 1 when ^Your movements dance back and forth imitating the cunning ways of the python\.|^You slowly center yourself, your mind growing quiet as a quickly building rage surges through your body, your limbs quaking with its boundless strength\.  A terrible roar of fury and bloodlust rips from your throat as the Form of the Python consumes you, only a thread of control fighting back the descent into a berserker\'s madness\.
     action (buffs) put #var barbPython 1 when ^You are currently practicing the Python Form
     action (buffs) put #var barbPython 0 when ^You feel your inner fire cool as you finish practicing the Form of the Python\.
     action (buffs) put #var barbPython 1 when eval ($SpellTimer.Python.active = 1)
     action (buffs) put #var barbPython 0 when eval ($SpellTimer.Python.active = 0)
     action (buffs) put #var barbSwan 1 when ^With the nimble grace of a swan, you maneuver against the very integrity of mana\.
     action (buffs) put #var barbSwan 1 when ^You are currently practicing the Swan Form
     action (buffs) put #var barbSwan 0 when ^You feel your inner fire cool as you finish practicing the Form of the Swan\.
     action (buffs) put #var barbSwan 1 when eval ($SpellTimer.Swan.active = 1)
     action (buffs) put #var barbSwan 0 when eval ($SpellTimer.Swan.active = 0)
     action (buffs) put #var barbToad 1 when ^All sense of heat and cold is lost as your body slips into the resilient Form of the Toad
     action (buffs) put #var barbToad 1 when ^You are currently practicing the Toad Form
     action (buffs) put #var barbToad 0 when ^You feel your inner fire cool as you finish practicing the Form of the Toad\.
     action (buffs) put #var barbToad 1 when eval ($SpellTimer.Toad.active = 1)
     action (buffs) put #var barbToad 0 when eval ($SpellTimer.Toad.active = 0)
     action (buffs) put #var barbTurtle 1 when ^With the determined movements of the turtle, you prepare to deflect incomining magical attacks
     action (buffs) put #var barbTurtle 1 when ^You are currently practicing the Turtle Form
     action (buffs) put #var barbTurtle 1 when ^You feel your inner fire cool as you finish practicing the Form of the Turtle\.
     action (buffs) put #var barbTurtle 1 when eval ($SpellTimer.Turtle.active = 1)
     action (buffs) put #var barbTurtle 0 when eval ($SpellTimer.Turtle.active = 0)
     action (buffs) put #var barbWolverine 1 when ^The unmatched speed and power of the Wolverine swells inside you, your body a blur of wild motion as you wind it like a steel spring
     action (buffs) put #var barbWolverine 1 when ^You are currently practicing the Wolverine Form
     action (buffs) put #var barbWolverine 0 when ^You feel your inner fire cool as you finish practicing the Form of the Wolverine\.
     action (buffs) put #var barbWolverine 1 when eval ($SpellTimer.Wolverine.active = 1)
     action (buffs) put #var barbWolverine 0 when eval ($SpellTimer.Wolverine.active = 0)
     # MEDITATIONS
     action (buffs) put #var medContemplation 1 when ^The flames? dance about you and fuel an enhanced defensive capability\!
     action (buffs) put #var medContemplation 1 when ^The Contemplation meditation will
     action (buffs) put #var medContemplation 0 when ^The ability to contemplate enhanced defensive strategies drifts out of your mind as your meditation ends\.
     action (buffs) put #var medSerenity 1 when ^You feel a wash of heat as a spell shatters against your serene mental-barrier of inner fire
     action (buffs) put #var medSerenity 1 when ^The Serenity meditation will
     action (buffs) put #var medSerenity 0 when ^Chaotic thoughts suddenly wash away your serenity, leaving you vulnerable to magic once more\.
     action (buffs) put #var medTenacity 1 when ^The flames? infuses your flesh, reinforcing it against physical damage\!
     action (buffs) put #var medTenacity 1 when ^The Tenacity meditation will
     action (buffs) put #var medTenacity 0 when ^Your concentration slowly dissolves, leaving you vulnerable to physical harm\.
     action (buffs) put #var innerFire 13 when a brilliant aura of pristine quality burning outward at twice your height
     action (buffs) put #var innerFire 12 when a brilliant aura of beautiful flames extending nearly twice your height above your body
     action (buffs) put #var innerFire 11 when a brilliant aura of beautiful flames extending a little more than one and half times your height above your body
     action (buffs) put #var innerFire 10 when a brilliant aura of flames that extends over your height again above you
     action (buffs) put #var innerFire 9 when a brilliant aura of flames that extends nearly your full height again above you
     action (buffs) put #var innerFire 8 when a brilliant aura of beautiful flames extending a little over half your height again above you
     action (buffs) put #var innerFire 7 when a brilliant aura of beautiful flames extending out around you about half again your height
     action (buffs) put #var innerFire 6 when a bright aura of beautiful flames extending out around you just beyond the reach of your arms
     action (buffs) put #var innerFire 5 when a bright aura of beautiful flames extending a quarter of your height above you
     action (buffs) put #var innerFire 4 when a bright aura of beautiful flames|a large aura of beautiful flames
     action (buffs) put #var innerFire 3 when a small aura of beautiful flames
     action (buffs) put #var innerFire 2 when a tiny aura of beautiful flames
     action (buffs) put #var innerFire 1 when a dim glow as if a flame lurked just out of sight|a flickering aura of beautiful flame
     # BERSERKS
     action (buffs) put #var zerkHurricane 1 when eval ($SpellTimer.Hurricane.active = 1)
     action (buffs) put #var zerkHurricane 0 when eval ($SpellTimer.Hurricane.active = 0)
     action (buffs) put #var zerkBlizzard 1 when eval ($SpellTimer.Blizzard.active = 1)
     action (buffs) put #var zerkBlizzard 0 when eval ($SpellTimer.Blizzard.active = 0)
     action (buffs) put #var zerkFamine 1 when The Famine Berserk will rage within you
     action (buffs) put #var zerkFamine 1 when ^A ravenous energy fills your limbs and you feel yourself growing healthier\!|^The fury healing your wounds ceases to be quenched\.
     action (buffs) put #var zerkFamine 0 when ^The ravenous hunger of your rage has slaked its thirst on your inner fire\!
     action (buffs) put #var zerkFamine 1 when eval ($SpellTimer.Famine.active = 1)
     action (buffs) put #var zerkFamine 0 when eval ($SpellTimer.Famine.active = 0)
     action (buffs) put #var zerkAvalanche 1 when ^The Avalanche Berserk will rage within you
     action (buffs) put #var zerkAvalanche 1 when ^The momentus rage of the avalanche replensishes your energy\!
     action (buffs) put #var zerkAvalanche 0 when ^The ever-building avalanche of rage within you crashes to a sudden halt\!
     action (buffs) put #var zerkAvalanche 1 when eval ($SpellTimer.Avalanche.active = 1)
     action (buffs) put #var zerkAvalanche 0 when eval ($SpellTimer.Avalanche.active = 0)
     action (buffs) put #var zerkWildfire 1 when ^The Wildfire Berserk will rage within you
     action (buffs) put #var zerkWildfire 1 when ^You sense the rage within you well up and explode in a wild rage of dangerous power\.
     action (buffs) put #var zerkWildfire 0 when ^The wild fire powering your limbs flickers, and then goes out entirely\.
     action (buffs) put #var zerkWildfire 1 when eval ($SpellTimer.Wildfire.active = 1)
     action (buffs) put #var zerkWildfire 0 when eval ($SpellTimer.Wildfire.active = 0)
     action (buffs) put #var zerkTsunami 1 when ^The Tsunami Berserk will rage within you
     action (buffs) put #var zerkTsunami 1 when ^Your hands shake in anticpiation of releasing the fury of the tsunami down upon your foes\!
     action (buffs) put #var zerkTsunami 0 when ^The massive wall of rage within you crashes to a sudden halt\!
     action (buffs) put #var zerkTsunami 1 when eval ($SpellTimer.Tsunami.active = 1)
     action (buffs) put #var zerkTsunami 0 when eval ($SpellTimer.Tsunami.active = 0)
     action (buffs) put #var zerkLandslide 1 when ^The Landslide Berserk will rage within you
     action (buffs) put #var zerkLandslide 1 when ^A supernatural timing pulses through your veins, steadying your reaction against reflex based contests\!
     action (buffs) put #var zerkLandslide 0 when ^At last the timing fleets your grasp, and your limbs suddenly feel strangely awkward\.
     action (buffs) put #var zerkLandslide 1 when eval ($SpellTimer.Landslide.active = 1)
     action (buffs) put #var zerkLandslide 0 when eval ($SpellTimer.Landslide.active = 0)
     action (buffs) put #var zerkEarthquake 1 when ^The Earthquake Berserk will rage within you
     action (buffs) put #var zerkEarthquake 1 when ^You form the epicenter of a violent rage bent on crumbling your enemies\!
     action (buffs) put #var zerkEarthquake 0 when ^An aftershock of rage shudders through you one last time, before your fury crashes to a sudden halt\!
     action (buffs) put #var zerkEarthquake 1 when eval ($SpellTimer.Earthquake.active = 1)
     action (buffs) put #var zerkEarthquake 0 when eval ($SpellTimer.Earthquake.active = 0)
     action (buffs) put #var zerkTornado 1 when ^The Tornado Berserk will rage within you
     action (buffs) put #var zerkTornado 1 when ^A vortex of malice springs into being, expanding your focus and steadying your shield arm\!
     action (buffs) put #var zerkTornado 0 when ^You lose control, and the furious maelstrom empowering your limbs dissipates\!
     action (buffs) put #var zerkTornado 1 when eval ($SpellTimer.Tornado.active = 1)
     action (buffs) put #var zerkTornado 0 when eval ($SpellTimer.Tornado.active = 0)
     action (buffs) put #var zerkCyclone 1 when ^The Cyclone Berserk will rage within you
     action (buffs) put #var zerkCyclone 1 when ^Fury storming forth, your pulse whips itself up to a furious tempo\!
     action (buffs) put #var zerkCyclone 0 when ^You lose control, and the cyclone of fury drifts away\!
     action (buffs) put #var zerkCyclone 1 when eval ($SpellTimer.Cyclone.active = 1)
     action (buffs) put #var zerkCyclone 0 when eval ($SpellTimer.Cyclone.active = 0)
     action (buffs) put #var zerkFlashflood 1 when ^The Flashflood Berserk will rage within you
     action (buffs) put #var zerkFlashflood 1 when ^In a flash your body fills with a flood of resilient rage\!
     action (buffs) put #var zerkFlashflood 0 when ^The waters of fury recede as your rage crashes to a sudden halt\!
     action (buffs) put #var zerkFlashflood 1 when eval ($SpellTimer.Flashflood.active = 1)
     action (buffs) put #var zerkFlashflood 0 when eval ($SpellTimer.Flashflood.active = 0)
     action (buffs) put #var zerkDrought 1 when ^The Drought Berserk will rage within you
     action (buffs) put #var zerkDrought 1 when eval ($SpellTimer.Drought.active = 1)
     action (buffs) put #var zerkDrought 0 when eval ($SpellTimer.Drought.active = 0)
     ### VOICE LEVEL TRIGGERS
     action (buffs) put #var voiceLevel 5 when ^You feel ready to defeat an army
     action (buffs) put #var voiceLevel 4 when ^You feel ready to defeat all challengers
     action (buffs) put #var voiceLevel 3 when ^You feel worn but still ready to meet a challenge
     action (buffs) put #var voiceLevel 2 when ^You feel depleted and less than inspired
     action (buffs) put #var voiceLevel 1 when ^You feel completely empty and unable to grasp inspiration
     action (buffs) put #var barbToad 0;put #tvar barbOwl 0;put #tvar barbTurtle 0;put #tvar barbPanther 0;put #tvar barbBear 0;put #tvar barbWolverine 0;put #tvar barbMonkey 0;put #tvar barbBadger 0;put #tvar barbBuffalo 0;#tvar barbPython 0;#tvar barbPiranha 0;#tvar barbSwan 0;#tvar medContemplation 0;put #tvar medTenacity 0;put #tvar medSerenity 0;#tvar barbDragon 0;#tvar barbEagle 0 when ^The burning symbols indicate no abilities are currently affecting you\.
     put #tvar voiceLevel 1
     put #tvar innerFire 0
     put #tvar zerkBlizzard 0
     put #tvar zerkHurricane 0
     put #tvar zerkFamine 0
     put #tvar zerkAvalanche 0
     put #tvar zerkWildfire 0
     put #tvar zerkTornado 0
     put #tvar zerkTsunami 0
     put #tvar zerkEarthquake 0
     put #tvar zerkFlashflood 0
     put #tvar zerkLandslide 0
     put #tvar zerkCyclone 0
     put #tvar zerkDrought 0
     put #tvar barbOwl 0
     put #tvar barbToad 0
     put #tvar barbTurtle 0
     put #tvar barbPanther 0
     put #tvar barbWolverine 0
     put #tvar barbBear 0
     put #tvar barbBadger 0
     put #tvar barbPython 0
     put #tvar barbBuffalo 0
     put #tvar barbPiranha 0
     put #tvar barbSwan 0
     put #tvar barbContemplation 0
     put #tvar barbDragon 0
     put #tvar barbEagle 0
     put #tvar barbMonkey 0
     put #tvar medTenacity 0
     put #tvar medSerenity 0
     put #tvar medContemplation 0
     echo *** LOADED BUFF TRIGGERS
     return
THIEF_BUFF:
     action (buffs) put #var khriAVOIDANCE 1 when eval ($SpellTimer.KhriAvoidance.active = 1)
     action (buffs) put #var khriCREDENCE 1 when eval ($SpellTimer.KhriCredence.active = 1)
     action (buffs) put #var khriCUNNING 1 when eval ($SpellTimer.KhriCunning.active = 1)
     action (buffs) put #var khriDAMPEN 1 when eval ($SpellTimer.KhriDampen.active = 1)
     action (buffs) put #var khriDARKEN 1 when eval ($SpellTimer.KhriDarken.active = 1)
     action (buffs) put #var khriELUSION 1 when eval ($SpellTimer.KhriElusion.active = 1)
     action (buffs) put #var khriELIMINATE 1 when eval ($SpellTimer.KhriEliminate.active = 1)
     action (buffs) put #var khriENDURE 1 when eval ($SpellTimer.KhriEndure.active = 1)
     action (buffs) put #var khriEVANESCENCE 1 when eval ($SpellTimer.KhriEvanescence.active = 1)
     action (buffs) put #var khriFLIGHT 1 when eval ($SpellTimer.KhriFlight.active = 1)
     action (buffs) put #var khriFOCUS 1 when eval ($SpellTimer.KhriFocus.active = 1)
     action (buffs) put #var khriFRIGHT 1 when eval ($SpellTimer.KhriFright.active = 1)
     action (buffs) put #var khriGUILE 1 when eval ($SpellTimer.KhriGuile.active = 1)
     action (buffs) put #var khriHARRIER 1 when eval ($SpellTimer.KhriHarrier.active = 1)
     action (buffs) put #var khriHASTEN 1 when eval ($SpellTimer.KhriHasten.active = 1)
     action (buffs) put #var khriINTIMIDATE 1 when eval ($SpellTimer.KhriIntimidate.active = 1)
     action (buffs) put #var khriPLUNDER 1 when eval ($SpellTimer.KhriPlunder.active = 1)
     action (buffs) put #var khriPROWESS 1 when eval ($SpellTimer.KhriProwess.active = 1)
     action (buffs) put #var khriSAFE 1 when eval ($SpellTimer.KhriSafe.active = 1)
     action (buffs) put #var khriSAGACITY 1 when eval ($SpellTimer.KhriSagacity.active = 1)
     action (buffs) put #var khriSENSING 1 when eval ($SpellTimer.KhriSensing.active = 1)
     action (buffs) put #var khriSERENITY 1 when eval ($SpellTimer.KhriSerenity.active = 1)
     action (buffs) put #var khriSHADOWSTEP 1 when eval ($SpellTimer.KhriShadowstep.active = 1)
     action (buffs) put #var khriSIGHT 1 when eval ($SpellTimer.KhriSight.active = 1)
     action (buffs) put #var khriSILENCE 1 when eval ($SpellTimer.KhriSilence.active = 1)
     action (buffs) put #var khriSLIGHT 1 when eval ($SpellTimer.KhriSlight.active = 1)
     action (buffs) put #var khriSTEADY 1 when eval ($SpellTimer.KhriSteady.active = 1)
     action (buffs) put #var khriSTRIKE 1 when eval ($SpellTimer.KhriStrike.active = 1)
     action (buffs) put #var khriTERRIFY 1 when eval ($SpellTimer.KhriTerrify.active = 1)
     action (buffs) put #var khriAVOIDANCE 0 when eval ($SpellTimer.KhriAvoidance.active = 0)
     action (buffs) put #var khriCREDENCE 0 when eval ($SpellTimer.KhriCredence.active = 0)
     action (buffs) put #var khriCUNNING 0 when eval ($SpellTimer.KhriCunning.active = 0)
     action (buffs) put #var khriDAMPEN 0 when eval ($SpellTimer.KhriDampen.active = 0)
     action (buffs) put #var khriDARKEN 0 when eval ($SpellTimer.KhriDarken.active = 0)
     action (buffs) put #var khriELUSION 0 when eval ($SpellTimer.KhriElusion.active = 0)
     action (buffs) put #var khriELIMINATE 0 when eval ($SpellTimer.KhriEliminate.active = 0)
     action (buffs) put #var khriENDURE 0 when eval ($SpellTimer.KhriEndure.active = 0)
     action (buffs) put #var khriEVANESCENCE 0 when eval ($SpellTimer.KhriEvanescence.active = 0)
     action (buffs) put #var khriFLIGHT 0 when eval ($SpellTimer.KhriFlight.active = 0)
     action (buffs) put #var khriFOCUS 0 when eval ($SpellTimer.KhriFocus.active = 0)
     action (buffs) put #var khriFRIGHT 0 when eval ($SpellTimer.KhriFright.active = 0)
     action (buffs) put #var khriGUILE 0 when eval ($SpellTimer.KhriGuile.active = 0)
     action (buffs) put #var khriHARRIER 0 when eval ($SpellTimer.KhriHarrier.active = 0)
     action (buffs) put #var khriHASTEN 0 when eval ($SpellTimer.KhriHasten.active = 0)
     action (buffs) put #var khriINTIMIDATE 0 when eval ($SpellTimer.KhriIntimidate.active = 0)
     action (buffs) put #var khriPLUNDER 0 when eval ($SpellTimer.KhriPlunder.active = 0)
     action (buffs) put #var khriPROWESS 0 when eval ($SpellTimer.KhriProwess.active = 0)
     action (buffs) put #var khriSAFE 0 when eval ($SpellTimer.KhriSafe.active = 0)
     action (buffs) put #var khriSAGACITY 0 when eval ($SpellTimer.KhriSagacity.active = 0)
     action (buffs) put #var khriSENSING 0 when eval ($SpellTimer.KhriSensing.active = 0)
     action (buffs) put #var khriSERENITY 0 when eval ($SpellTimer.KhriSerenity.active = 0)
     action (buffs) put #var khriSHADOWSTEP 0 when eval ($SpellTimer.KhriShadowstep.active = 0)
     action (buffs) put #var khriSIGHT 0 when eval ($SpellTimer.KhriSight.active = 0)
     action (buffs) put #var khriSILENCE 0 when eval ($SpellTimer.KhriSilence.active = 0)
     action (buffs) put #var khriSLIGHT 0 when eval ($SpellTimer.KhriSlight.active = 0)
     action (buffs) put #var khriSTEADY 0 when eval ($SpellTimer.KhriSteady.active = 0)
     action (buffs) put #var khriSTRIKE 0 when eval ($SpellTimer.KhriStrike.active = 0)
     action (buffs) put #var khriTERRIFY 0 when eval ($SpellTimer.KhriTerrify.active = 0)

	action (buffs) put #tvar khriPLUNDER 1 when ^Your hand twitches slightly in anticipation as you focus your mind towards relieving others of their hard earned possessions\.
	action (buffs) put #tvar khriPLUNDER 1 when ^You are under the influence of the Plunder meditation
	action (buffs) put #tvar khriPLUNDER 0 when ^Your hands feel more clumsy as your intuition on how and when to relieve others of their possessions wanes\.
	action (buffs) put #tvar khriPLUNDER 0 when ^Your recent use of the Plunder meditation is preoccupying|^You have not recovered from your previous use of the Plunder meditation\.
     action (buffs) put #tvar khriHASTEN 1 when ^You are under the influence of the Hasten meditation|^Centering your mind, you allow your practiced discipline to spread throughout your body, making thought and motion one\.
     action (buffs) put #tvar khriHASTEN 0 when ^Your concentration fails, and you feel your body perceptibly slow\.
     action (buffs) put #tvar khriHASTEN 0 when ^Your recent use of the Hasten meditation is preoccupying|^You have not recovered from your previous use of the Hasten meditation\.
     action (buffs) put #tvar khriFOCUS 1 when ^With deep breaths, you recall your training and focus your mind into the most universal of meditations, improving your overall performance\.
     action (buffs) put #tvar khriFOCUS 1 when ^You are under the influence of the Focus meditation|^With deep breaths, you recall your training and focus your mind to hone in on improving your physical dexterity\.
     action (buffs) put #tvar khriFOCUS 1 when ^You're already using the Focus meditation\.
     action (buffs) put #tvar khriFOCUS 0 when ^Your focused mind falters, and you feel downright clumsy by comparison\.
     action (buffs) put #tvar khriFOCUS 0 when ^Your recent use of the Focus meditation is preoccupying|^You have not recovered from your previous use of the Focus meditation\.
     action (buffs) put #tvar khriPROWESS 1 when The sensation of believing that your enemies will tremble at the mere thought of you translates from your every movement\.
     action (buffs) put #tvar khriPROWESS 1 when ^You're already using the Prowess meditation\.
     action (buffs) put #tvar khriPROWESS 0 when ^You feel your muscles relax as you settle into a less threatening demeanor\.
     action (buffs) put #tvar khriPROWESS 0 when ^Your recent use of the Prowess meditation is preoccupying|^You have not recovered from your previous use of the Prowess meditation\.
     action (buffs) put #tvar khriSAFE 1 when ^You are under the influence of the Safe meditation|^With but a quick thought, your hands steady and your mind gears itself to the purpose of getting into what others want you out of\.
     action (buffs) put #tvar khriSAFE 0 when ^Your hands no longer feel quite as steady as your grasp on the meditation fails\.
     action (buffs) put #tvar khriSAFE 0 when ^Your recent use of the Safe meditation|^You have not recovered from your previous use of the Safe meditation\.
     action (buffs) put #tvar khriDARKEN 1 when ^You are under the influence of the Darken meditation|^Focusing your mind, you look around yourself to find the subtle differences lurking in the shadows nearby
     action (buffs) put #tvar khriDARKEN 0 when ^You are unable to maintain your focus on the shadows around you, and your knowledge of better hiding places subsides\.
     action (buffs) put #tvar khriDARKEN 0 when ^Your recent use of the Darken meditation|^You have not recovered from your previous use of the Darken meditation\.
     action (buffs) put #tvar khriDAMPEN 1 when ^Focusing your mind, you attempt to attune your senses to the paths between shadows\. You quickly feel more comfortable with your ability to navigate terrain unseen\.
     action (buffs) put #tvar khriDAMPEN 1 when ^You are under the influence of the Dampen meditation|^Focusing your mind, you attempt to attune your senses to even your most minor movements\.  You quickly feel more comfortable with your ability to control your motions to prevent detection\.
     action (buffs) put #tvar khriDAMPEN 0 when ^You are unable to maintain your focus on every movement, and your knowledge of better ways to stay unnoticed in armor subsides\.
     action (buffs) put #tvar khriDAMPEN 0 when ^Your recent use of the Dampen meditation is preoccupying|^You have not recovered from your previous use of the Dampen meditation\.
     action (buffs) put #tvar khriSIGHT 1 when ^Darkness is no bar to a trained Thief\. With careful focus, you adjust your eyes to see in shadow as they do in light\.
     action (buffs) put #tvar khriSIGHT 1 when ^You're already using the Sight meditation\.
     action (buffs) put #tvar khriSIGHT 0 when ^Light and shadow are once again thrown into stark contrast as your heightened vision fades\.
     action (buffs) put #tvar khriSIGHT 0 when ^You have not recovered from your previous use of the Sight meditation\.
     action (buffs) put #tvar khriCALM 1 when ^Placing all of your worries and concerns aside, you mentally wall them off where they no longer bother you\. Soon, your inward calm seems unshakeable\.
     action (buffs) put #tvar khriCALM 1 when ^You're already using the Calm meditation\.
     action (buffs) put #tvar khriCALM 0 when ^You attempt to relax your mind from all of its meditative states\.
     action (buffs) put #tvar khriCALM 0 when ^Your recent use of the Calm meditation|^You have not recovered from your previous use of the Calm meditation\.
     action (buffs) put #tvar khriSTEADY 1 when ^Willing your body to meet the heightened functionality of your mind, you feel your motions steady considerably\.
     action (buffs) put #tvar khriSTEADY 1 when ^With but a moment's focus, every worry or care becomes trivial, and you surround yourself with unshakable serenity\.
     action (buffs) put #tvar khriSTEADY 1 when ^You're already using the Steady meditation\.
     action (buffs) put #tvar khriSTEADY 0 when ^The steadying influence your mind was exerting on your self fades away as you lose concentration upon it\.
     action (buffs) put #tvar khriSTEADY 0 when ^Your recent use of the Steady meditation|^You have not recovered from your previous use of the Steady meditation\.
     action (buffs) put #tvar khriSERENITY 1 when ^With but a moment's focus, every worry or care becomes trivial, and you surround yourself with unshakable serenity\.
     action (buffs) put #tvar khriSERENITY 1 when ^You're already using the Serenity meditation\.|^You are under the influence of the Serenity meditation\.
     action (buffs) put #tvar khriSERENITY 0 when ^Your unshakable calm dissipates, leaving the world around you suddenly seeming more chaotic\.
     action (buffs) put #tvar khriSERENITY 0 when ^Your recent use of the Serenity meditation|^You have not recovered from your previous use of the Serenity meditation\.
     action (buffs) put #tvar khriFLIGHT 1 when ^Knowing that a dose of paranoia is healthy
     action (buffs) put #tvar khriFLIGHT 1 when ^You're already using the Flight meditation\.|^You are under the influence of the Flight meditation\.
     action (buffs) put #tvar khriFLIGHT 0 when ^You feel mentally fatigued as your heightened paranoia ceases to enhance your knowledge of nearby escape routes\.
     action (buffs) put #tvar khriFLIGHT 0 when ^Your recent use of the Flight meditation|^You have not recovered from your previous use of the Flight meditation\.
     action (buffs) put #tvar khriSAGACITY 1 when ^You carefully relax your mind through your expert training
     action (buffs) put #tvar khriSAGACITY 1 when ^You're already using the Sagacity meditation|^You are under the influence of the Sagacity meditation\.
     action (buffs) put #tvar khriSAGACITY 0 when ^Your strong sense of survival fades
     action (buffs) put #tvar khriSAGACITY 0 when ^Your recent use of the Sagacity meditation|^You have not recovered from your previous use of the Sagacity meditation\.
     action (buffs) put #tvar khriGUILE 1 when The sensation of such fluid movement even startles you for a few moments, as you get accustomed to the mezmerizing rhythm\.
     action (buffs) put #tvar khriGUILE 1 when ^You're already using the Guile meditation\.|^You are under the influence of the Guile meditation\.
     action (buffs) put #tvar khriGUILE 0 when ^Your strong sense of survival fades
     action (buffs) put #tvar khriGUILE 0 when ^Your recent use of the Guile meditation|^You have not recovered from your previous use of the Guile meditation\.
     action (buffs) put #tvar khriELIMINATE 1 when ^Honing your mind and body to a single purpose, you prepare to execute the perfect strike\.
     action (buffs) put #tvar khriELIMINATE 1 when ^You're already using the Eliminate meditation\.|^You are under influence of the Elimination meditation\.
     action (buffs) put #tvar khriELIMINATE 0 when ^You feel your inner fire cool as you finish practicing the Form of the Eagle\.
     action (buffs) put #tvar khriELIMINATE 0 when ^Your recent use of the ELIMINATE meditation|^You have not recovered from your previous use of the ELIMINATE meditation\.
     action (buffs) put #tvar khriSTRIKE 1 when ^You calm your body and mind, recalling your training on how to seek the vital part of any opponent\. Wrapping yourself in this cool composure, your eyes quickly become drawn to exposed weaknesses around you\.
     action (buffs) put #tvar khriSTRIKE 1 when ^You're already using the Strike meditation\.|^You are under the influence of the Strike meditation\.
     action (buffs) put #tvar khriSTRIKE 0 when ^Your cool composure fades, and with it your heightened
     action (buffs) put #tvar khriSTRIKE 0 when ^Your recent use of the Strike meditation|^You have not recovered from your previous use of the Strike meditation\.
     action (buffs) put #tvar khriVANISH 1 when ^Tapping into the well of mental power within, you focus on a world without your presence in it\. Through determined concentration, you achieve a limited subversion of reality, becoming unseen and removed from danger\.
     action (buffs) put #tvar khriVANISH 1 when ^Tapping into the well of mental power within, you focus on a world without your presence in it\. Through determined concentration, you achieve a limited subversion of reality, becoming unseen and removed from danger\.
     action (buffs) put #tvar khriVANISH 1 when ^Tapping into the well of mental power within, you focus on a world without your presence in it\. Through determined concentration, you achieve a limited subversion of reality, becoming unseen and removed from danger\.
     action (buffs) put #tvar khriAVOIDANCE 1 when ^Taking a deep breath, you focus on making your mind and body one, your mental discipline trained on quickly noticing, analyzing, and evading approaching threats\.
     action (buffs) put #tvar khriAVOIDANCE 1 when ^You're already using the Avoidance meditation|^You are under the influence of the Avoidance meditation\.
     action (buffs) put #tvar khriAVOIDANCE 0 when ^Your concentration runs out, and your rapid analysis|^Your recent use of the Avoidance meditation|^You have not recovered from your previous use of the Avoidance meditation\.
     action (buffs) put #tvar khriELUSION 1 when ^Purging yourself of all distractions and extraneous thoughts, you allow your mind and body to become one, becoming preternaturally aware of threats around you and the best ways to defend yourself\.
     action (buffs) put #tvar khriELUSION 1 when ^You're already using the Elusion meditation\.$|^You are under the influence of the Elusion meditation\.
     action (buffs) put #tvar khriELUSION 0 when ^You are no longer able to keep your thoughts free from distraction|^Your recent use of the Elusion meditation|^You have not recovered from your previous use of the Elusion meditation\.
     action (buffs) put #tvar khriINTIMIDATE 1 when ^Briefly shutting your eyes, when you reopen them, you feel much more intimidating
     action (buffs) put #tvar khriINTIMIDATE 1 when ^You're already using the Intimidate meditation\.|^You are under the influence of the Intimidate meditation\.
     action (buffs) put #tvar khriINTIMIDATE 0 when ^Something distracts your inner focus and you are no longer as dominant as you were|^Your recent use of the Intimidate meditation|^You have not recovered from your previous use of the Intimidate meditation\.
     action (buffs) put #tvar khriCREDENCE 1 when ^Deep within yourself you call forth a calming presence that radiates out from you to your surroundings
     action (buffs) put #tvar khriCREDENCE 1 when ^You're already using the Credence meditation\.|^You are under the influence of the Credence meditation\.
     action (buffs) put #tvar khriCREDENCE 0 when ^Something disturbs your inner peace and you stop radiating calm|^Your recent use of the Credence meditation|^You have not recovered from your previous use of the Credence meditation\.
     action (buffs) put #tvar khriFRIGHT 1 when ^After a deep breath, your meditation bears fruit and you feel much more frightening
     action (buffs) put #tvar khriFRIGHT 1 when ^You are under the influence of the Fright meditation\.|^You're already using the Fright meditation\.
     action (buffs) put #tvar khriFRIGHT 0 when ^Something shakes your concentration and you lose your enhanced frightfulness|^Your recent use of the Fright meditation|^You have not recovered from your previous use of the Fright meditation\.
     action (buffs) put #tvar khriENDURE 1 when ^Drawing upon your inner strength, you set yourself to endure and slow your heartbeat
     action (buffs) put #tvar khriENDURE 1 when ^You're already using the Endure meditation\.|^You are under the influence of the Endure meditation\.
     action (buffs) put #tvar khriENDURE 0 when ^Your additional endurance fades away as your inner focus slips|^Your recent use of the Endure meditation|^You have not recovered from your previous use of the Endure meditation\.
     action (buffs) put #tvar khriTERRIFY 1 when ^Preparing your voice, you concentrate on projecting horrifying whispers at a foe
     action (buffs) put #tvar khriTERRIFY 1 when ^You're already using the Terrify|^You are under the influence of the Terrify meditation
     action (buffs) put #tvar khriTERRIFY 0 when ^Your focus slips and you feel less horrifying|^Your recent use of the Terrify meditation|^You have not recovered from your previous use of the Terrify meditation\.
     action (buffs) put #tvar khriHARRIER 1 when ^With mental effort, you center your mind on improving your physical prowess
     action (buffs) put #tvar khriHARRIER 1 when ^You're already using the Harrier meditation|^You are under influence of the Harrier meditation\.
     action (buffs) put #tvar khriHARRIER 0 when ^Your focus fails, and you immediately feel less strong|^Your recent use of the Harrier meditation|^You have not recovered from your previous use of the Harrier meditation\.
     action (buffs) put #tvar khriLIBERATION 1 when ^Your dedicated training lends you grace in both mind and body, allowing you to easily escape binding situations\.|^You're already using the Liberation meditation\.|^You have not recovered from your previous use of the Liberation meditation\.
     action (buffs) put #tvar khriLIBERATION 0 when ^Your preternatural ability to escape binding situations ceases|^Your recent use of the Liberation meditation|^You have not recovered from your previous use of the Liberation meditation\.
     action (buffs) put #tvar khriEVANESCENCE 1 when ^Several rapid blinks help to establish your concentration on the ability to become ephemeral and invisible when struck|^You're already using the Evanescence meditation\.|^You are under the influence of the Evanescence meditation\.
     action (buffs) put #tvar khriEVANESCENCE 0 when ^Your focus fails and you suddenly feel a bit more solid|^Your recent use of the Evanescence meditation|^You have not recovered from your previous use of the Evanescence meditation\.
     action (buffs) put #tvar khriSHADOWSTEP 1 when ^Letting your thoughts fall into the depths
     action (buffs) put #tvar khriSHADOWSTEP 1 when ^You're already using the Shadowstep meditation|^You are under the influence of the Shadowstep meditation
     action (buffs) put #tvar khriSHADOWSTEP 0 when ^You can no longer move so quickly through shadows|^Your recent use of the Shadowstep meditation|^You have not recovered from your previous use of the Shadowstep meditation\.
     action (buffs) put #tvar khriCUNNING 1 when ^Your dedicated training lends you grace in both mind and body, allowing you to easily escape binding situations\.
     action (buffs) put #tvar khriCUNNING 1 when ^You are under the influence of the Cunning meditation
     action (buffs) put #tvar khriCUNNING 0 when ^Your preternatural ability to escape binding situations ceases\.
     #
     action (buffs) put #tvar khriINTIMIDATE 0;put #tvar khriCREDENCE 0;put #tvar khriEVANESCENCE 0;put #tvar khriFRIGHT 0;put #tvar khriENDURE 0;put #tvar khriHARRIER 0;put #tvar khriTERRIFY 0;put #tvar khriLIBERATION 0;put #tvar khriSHADOWSTEP 0;put #tvar khriHASTEN 0;put #tvar khriFOCUS 0;put #tvar khriPROWESS 0;put #tvar khriSAFE 0;put #tvar khriDARKEN 0;put #tvar khriDAMPEN 0;put #tvar khriSIGHT 0;put #tvar khriCALM 0;put #tvar khriSTEADY 0;put #tvar khriSERENITY 0;put #tvar khriELIMINATE 0;put #tvar khriSTRIKE 0;put #tvar khriVANISH 0;put #tvar khriAVOIDANCE 0;put #tvar khriFLIGHT 0;put #tvar khriGUILE 0;put #tvar khriSAGACITY 0;put #tvar khriELUSION 0;put #tvar khriSKULK 0 when ^You attempt to relax your mind from all of its meditative states\.|^You are not currently under the influence of any meditations\.
     put #tvar khriSHADOWSTEP 0
     put #tvar khriCUNNING 0
     put #tvar khriHASTEN 0
     put #tvar khriFOCUS 0
     put #tvar khriPROWESS 0
     put #tvar khriSAFE 0
     put #tvar khriDARKEN 0
     put #tvar khriDAMPEN 0
     put #tvar khriSIGHT 0
     put #tvar khriCALM 0
     put #tvar khriFLIGHT 0
     put #tvar khriSAGACITY 0
     put #tvar khriGUILE 0
     put #tvar khriSTEADY 0
     put #tvar khriSERENITY 0
     put #tvar khriELIMINATE 0
     put #tvar khriSTRIKE 0
     put #tvar khriVANISH 0
     put #tvar khriAVOIDANCE 0
     put #tvar khriELUSION 0
     put #tvar khriSPEED 0
     put #tvar khriSPAR 0
     put #tvar khriSKULK 0
     put #tvar khriLIBERATION 0
     put #tvar khriHARRIER 0
     put #tvar khriFRIGHT 0
     put #tvar khriENDURE 0
     put #tvar khriTERRIFY 0 
     put #tvar khriEVANESCENCE 0 
     put #tvar khriCREDENCE 0
     put #tvar khriINTIMIDATE 0
     echo *** LOADED BUFF TRIGGERS
     return
END.BUFFS.FILE: