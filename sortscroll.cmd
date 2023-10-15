     ### SCRIPT TO SORT SCROLLS
     ### Written by Funk
     ###
     ### USAGE = .sortscroll {sort from container}
     ###
     ### MUST BE RUN IN WEST SHELF ROOM OF FC.
     ### UNMATCHED SPELLS WILL WRITE TO YOUR LOG WINDOW
     ###
     ### Updated 06/17/2013 - Funk - Added Harm Evil, Anti-Stun, Soldier's Prayer to Holy, Obfuscation to Arcane, Manifest Force to Analogous, and Branch Break to Life
     ### Updated 07/16/2013 - PELIC - Added every spell listed on ePedia.
     ### Updated 10/13/2014 - PELIC - Added every spell listed on ePedia. (again)
     # debuglevel 10

     var HolySpells Aesrela Everild|Auspice|Benediction|Bitter Feast|Bless|Centering|Chill Spirit|Curse of Zachriedek|Divine Radiance|Eylhaar's Feast|Fire of Ushnish|Fists of Faenella|Ghost Shroud|Glythtide's Gift|Halo|Hand of Tenemlor|Harm Evil|Harm Horde|Heavenly Fires|Horn of the Black Unicorn|Huldah's Pall|Hydra Hex|Idon's Theft|Major Physical Protection|Malediction|Meraud's Cry|Minor Physical Protection|Murrula's Flames|Osrel Meraud|Persistence of Mana|Phelim's Sanction|Protection from Evil|Rejuvenation|Resurrection|Revelation|Ring of Blessings|Sanctify Pattern|Sanyu Lyba|Shield of Light|Soul Attrition|Soul Bonding|Soul Shield|Soul Sickness|Spite of Dergati|Uncurse|Vigil|Alamhif's Gift|Anti-Stun|Aspirant's Aegis|Banner of Truce|Bond Armaments|Clarity|Courage|Crusader's Challenge|Divine Armor|Divine Guidance|Footman's Strike|Halt|Hands of Justice|Heroic Strength|Holy Warrior|Marshal Order|Rebuke|Righteous Wrath|Rutilor's Edge|Sentinel's Resolve|Shatter|Smite Horde|Soldier's Prayer|Stun Foe|Truffenyi's Rally|Vessel of Salvation|Veteran Insight
     var LifeSpells Adaptive Curing|Aesandry Darlaeth|Aggressive Stance|Awaken|Blood Staunching|Circle of Sympathy|Compel|Cure Disease|Flush Poisons|Fountain of Creation|Gift of Life|Guardian Spirit|Heal|Heal Scars|Heal Wounds|Heart Link|Innocence|Iron Constitution|Lethargy|Mental Focus|Nissa's Binding|Paralysis|Perseverance of Peri'el|Raise Power|Refresh|Regenerate|Tranquility|Vigor|Vitality Healing|Athleticism|Awaken Forest|Bear Strength|Blend|Branch Break|Carrion Call|Cheetah Swiftness|Claws of the Cougar|Compost|Curse of the Wilds|Devitalize|Devolve|Eagle's Cry|Earth Meld|Essence of Yew|Forestwalker's Boon|Grizzly Claws|Hands of Lirisa|Harawep's Bonds|Instinct|Memory of Nature|See the Wind|Senses of the Tiger|Skein of Shadows|Stampede|Swarm|Wisdom of the Pack|Wolf Scent
     var ElementalSpells Aegis of Granite|Aether Cloak|Air Bubble|Air Lash|Anther's Call|Arc Light|Blufmor Garaen|Chain Lightning|Dragon's Breath|Elementalism|Ethereal Fissure|Ethereal Shield|Fire Ball|Fire Rain|Fire Shards|Flame Shockwave|Fortress of Ice|Frostbite|Gar Zeng|Geyser|Grounding Field|Ice Patch|Ignite|Lightning Bolt|Magnetic Ballista|Mantle of Flame|Mark of Arhat|Paeldryth's Wrath|Rimefang|Ring of Spears|Rising Mists|Shockwave|Stone Strike|Substratum|Sure Footing|Swirling Winds|Tailwind|Thunderclap|Tingle|Tremor|Veil of Ice|Vertigo|Ward Break|Y'ntrel Sechra|Zephyr|Abandoned Heart|Aether Wolves|Albreda's Balm|Aura of Tongues|Blessing of the Fae|Breath of Storms|Caress of the Sun|Damaris' Lullaby|Demrris' Resolve|Desert's Maelstrom|Drums of the Snake|Echoes of Aether|Eillie's Cry|Eye of Kertigen|Faenella's Grace|Glythtide's Joy|Harmony|Hodierna's Lilt|Misdirection|Naming of Tears|Nexus|Phoenix's Pyre|Rage of the Clans|Redeemer's Pride|Resonance|Sanctuary|Soul Ablaze|Whispers of the Muse|Will of Winter|Words of the Wind
     var LunarSpells Aura Sight|Burn|Cage of Light|Calm|Clear Vision|Contingency|Dazzle|Dinazen Olkar|Distant Gaze|Empower Moonblade|Focus Moonbeam|Hypnotize|Invocation of the Spheres|Locate|Mental Blast|Mind Shout|Moonblade|Moongate|Partial Displacement|Piercing Gaze|Psychic Shield|Refractive Field|Rend|Riftal Summons|Seer's Sense|Sever Thread|Shadewatch Mirror|Shadow Servant|Shadowling|Shadows|Shape Moonblade|Shear|Shift Moonbeam|Sleep|Sovereign Destiny|Starlight Sphere|Steps of Vuan|Tangled Fate|Telekinetic Storm|Telekinetic Throw|Teleport|Tenebrous Sense|Tezirah's Veil|Thoughtcast|Unleash|Whole Displacement
     var ArcaneSpells Acid Splash|Blood Burst|Butcher's Eye|Calcified Hide|Call from Beyond|Chirurgia|Consume Flesh|Devour|Eyes of the Blind|Heighten Pain|Ivory Mask|Kura-Silma|Necrotic Reconstruction|Obfuscation|Petrifying Visions|Philosopher's Preservation|Quicken the Earth|Researcher's Insight|Reverse Putrefaction|Rite of Contrition|Siphon Vitality|Spiteful Rebirth|Universal Solvent|Viscous Solution|Visions of Darkness|Vivisection|Worm's Mist
     var AnalogousSpells Burden|Dispel|Ease Burden|Gauge Flow|Imbue|Lay Ward|Manifest Force|Seal Cambrinth|Strange Arrow

     var Elemental.Container shelf
     var Life.Container shelf
     var Holy.Container shelf
     var Lunar.Container shelf
     var Arcane.Container shelf
     var Analogous.Container shelf

     var Scroll.Types hhr'lav'geluhh bark|scroll|parchment|tablet|ostracon|seishaka leaf|vellum|papyrus roll
     var Scroll.Index 0

     action goto NextType when ^What were you refer
     action goto TOP when ^As you read the [\S|\s|-|'| ]*, it crumbles away into a fine powder
     action goto TOP when ^The [\S|\s|-|'| ]* crumbles away in your hands
     action var Scroll.Spell $1 when ^The [\S|\s|-|'| ]* contains a complete description of the (.*) spell
     action var Scroll.Spell $1 when ^The [\S|\s|-|'| ]* says something about the (.*) spell\, but you can't decipher it\.

     var SortFrom %1

TOP:
     if %Scroll.Index > 7 then exit
     var Scroll.Mana NONE
     send get %Scroll.Types(%Scroll.Index) from %SortFrom
     wait
     send read my $righthandnoun
     wait
     pause 0.5
     if matchre("%HolySpells" , "%Scroll.Spell") then var Scroll.Mana Holy
     if matchre("%LifeSpells" , "%Scroll.Spell") then var Scroll.Mana Life
     if matchre("%ElementalSpells" , "%Scroll.Spell") then var Scroll.Mana Elemental
     if matchre("%LunarSpells" , "%Scroll.Spell") then var Scroll.Mana Lunar
     if matchre("%ArcaneSpells" , "%Scroll.Spell") then var Scroll.Mana Arcane
     if matchre("%AnalogousSpells" , "%Scroll.Spell") then var Scroll.Mana Analogous
     if "%Scroll.Mana" = "NONE" then goto UNDEFINED
     if "%%Scroll.Mana.Container" = "shelf" then send put my $righthandnoun on shelf
     else send put my $righthandnoun in %%Scroll.Mana.Container
     wait
     goto TOP

UNDEFINED:
     put #echo >$Log UNDEFINED SCROLL %Scroll.Spell
     send put my $righthandnoun on shelf
     wait
     goto TOP

NEXTTYPE:
     math Scroll.Index add 1
     goto TOP
