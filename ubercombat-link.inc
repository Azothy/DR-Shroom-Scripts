# version 1.2

#debug 5
     put #tvar Province NO
	put #window ADD Hunting
	put #window show Hunting
     var hunting main
     Province:
     put #clear Hunting
     put #echo >Hunting ****WARNING: The skill ranges are based upon Elanthipedia and may not be accurate
     put #echo >Hunting ****Some creatures are mixed in with higher level creatures. Might want to consult Epedia before choosing
     put #echo >Hunting 
     put #echo >Hunting "****************"
     put #echo >Hunting "**  PROVINCE  **"
     put #echo >Hunting "****************"
     delay 0.5
	put #echo >Hunting
     put #link >Hunting {**   Zoluren  **} "#tvar Province P1;#parse CHOICE MADE!"
     put #link >Hunting {**  Therengia **} "#tvar Province P2;#parse CHOICE MADE!"
     put #link >Hunting {**   Ilithi   **} "#tvar Province P3;#parse CHOICE MADE!"
     put #link >Hunting {**     Qi     **} "#tvar Province P4;#parse CHOICE MADE!"
     put #link >Hunting {** Forfedhdar **} "#tvar Province P5;#parse CHOICE MADE!"
     put #echo >Hunting "****************" 
	put #echo >Hunting 
     put #echo >Hunting "Please select the Province in which you want to hunt."
     put #echo >Hunting 
     waitforre ^CHOICE MADE\!
     HPREF:
     put #clear Hunting
	put #echo >Hunting
	put #echo >Hunting "*************************"
	put #echo >Hunting "** Hunting Preferences **"
	put #echo >Hunting "*************************"
     delay 0.5
	put #echo >Hunting
	put #link >Hunting "**        None         **" "#tvar HPREF None;#parse CHOICE MADE!"
	put #link >Hunting "**       Undead        **" "#tvar HPREF Undead;#parse CHOICE MADE!"
	put #link >Hunting "**     Constructs      **" "#tvar HPREF Constructs;#parse CHOICE MADE!"
	put #link >Hunting "**       Living        **" "#tvar HPREF Living;#parse CHOICE MADE!"
	put #link >Hunting "**       Skins         **" "#tvar HPREF Skins;#parse CHOICE MADE!"
	put #link >Hunting "**       Boxes	        **" "#tvar HPREF Boxes;#parse CHOICE MADE!"
	put #link >Hunting "**   Skins and Boxes   **" "#tvar HPREF SANDB;#parse CHOICE MADE!"
     delay 0.5
	put #echo >Hunting "*************************"
	put #echo >Hunting
	put #echo >Hunting "Please choose your hunting preference."
	put #echo >Hunting
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar HPREF RETURN;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
     put #clear Hunting
     if "$HPREF" = "RETURN" then goto Province
     HRange:
	put #echo >Hunting
	put #echo >Hunting "*************************"
	put #echo >Hunting "**    Hunting Range    **"
	put #echo >Hunting "*************************"
     delay 0.5
	put #echo >Hunting
	put #link >Hunting "**        0-49         **" "#tvar HSKILL 50;#parse CHOICE MADE!"
	put #link >Hunting "**       50-99        **" "#tvar HSKILL 100;#parse CHOICE MADE!"
	put #link >Hunting "**       100-199       **" "#tvar HSKILL 200;#parse CHOICE MADE!"
	put #link >Hunting "**       200-299       **" "#tvar HSKILL 300;#parse CHOICE MADE!"
	put #link >Hunting "**       300-399       **" "#tvar HSKILL 400;#parse CHOICE MADE!"
	put #link >Hunting "**       400-499       **" "#tvar HSKILL 500;#parse CHOICE MADE!"
	put #link >Hunting "**       500-799       **" "#tvar HSKILL 800;#parse CHOICE MADE!"
	put #link >Hunting "**      800-1750       **" "#tvar HSKILL 1750;#parse CHOICE MADE!"
     delay 0.5
	put #echo >Hunting "*************************"
	put #echo >Hunting
	put #echo >Hunting "Please choose your bottom hunting skill range."
	put #echo >Hunting
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar HPREF RETURN;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
     put #clear Hunting
     if "$HPREF" = "RETURN" then goto HPREF
	goto $Province$HPREF
	
P1None:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**        All Zoluren Critters       **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**                  Rat     (0-30)   **" "#var %huntingCritter Rat 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Lout     (0-35)   **" "#var %huntingCritter Lout1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Silverfish    (10-32)   **" "#var %huntingCritter Silverfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**Pale Gray Death Squirrel (10-35)   **" "#var %huntingCritter Squirrel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Musk Hog    (10-35)   **" "#var %huntingCritter musk hog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Fell Hog    (10-40)   **" "#var %huntingCritter fell hog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Lesser Skeleton    (12-28)   **" "#var %huntingCritter skeleton;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Forager Goblin    (12-34)   **" "#var %huntingCritter forager goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Ring Necked Gidi    (15-44)   **" "#var %huntingCritter Gidi;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Zombie Goblin    (15-45)   **" "#var %huntingCritter goblin zombie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Crazed madman    (15-45)   **" "#var %huntingCritter madman;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Field goblin    (17-42)   **" "#var %huntingCritter Field goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scavenger goblin    (18-36)   **" "#var %huntingCritter Scavenger goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar    (18-42)   **" "#var %huntingCritter Wild boar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Skunk    (18-42)   **" "#var %huntingCritter Skunk;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Brown burrower    (18-42)   **" "#var %huntingCritter burrower;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Striped badger    (19-42)   **" "#var %huntingCritter badger;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Inkhorne    (20-45)   **" "#var %huntingCritter Inkhorne;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman    (20-50)   **" "#var %huntingCritter Goblin shaman;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Origami creature    (20-55)   **" "#var %huntingCritter Origami;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Croff pothanit    (22-39)   **" "#var %huntingCritter Croff pothanit;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Blood nyad    (25-40)   **" "#var %huntingCritter Blood nyad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Blood dryad    (25-40)   **" "#var %huntingCritter Blood dryad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Corpse grub    (25-45)   **" "#var %huntingCritter Corpse grub;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Deer    (25-45)   **" "#var %huntingCritter Deer;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel    (25-50)   **" "#var %huntingCritter Grass eel 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Ghoul    (26-44)   **" "#var %huntingCritter GHOUL 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Water sprite    (28-45)   **" "#var %huntingCritter Water sprite;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar    (30-49)   **" "#var %huntingCritter Cougar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**    Glutinous lipopod    (32-50)   **" "#var %huntingCritter lipopod;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Trollkin    (33-40)   **" "#var %huntingCritter Trollkin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Giant wasp    (35-50)   **" "#var %huntingCritter Giant wasp;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Small grendel    (35-50)   **" "#var %huntingCritter grendel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Faenrae reaver    (35-52)   **" "#var %huntingCritter reaver;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wind hound    (35-73)   **" "#var %huntingCritter Wind hound;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          S'lai scout    (36-49)   **" "#var %huntingCritter Slai scout;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Jackal    (36-50)   **" "#var %huntingCritter Jackal;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Large brown spider    (36-51)   **" "#var %huntingCritter Large brown spider;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll    (36-53)   **" "#var %huntingCritter Wood Troll;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Revenant conscript    (40-50)   **" "#var %huntingCritter Revenant conscript;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie    (45-59)   **" "#var %huntingCritter Revenant zombie;#parse CHOICE MADE!"
	#if $HSKILL = 50 then put #link >Hunting "**Brown bear  (45-59)   **" "#var %huntingCritter Brown bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Bobcat    (45-65)   **" "#var %huntingCritter Bobcat1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Cave bear    (45-65)   **" "#var %huntingCritter Cave bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram    (45-70)   **" "#var %huntingCritter Wood Troll;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Beisswurm    (50-65)   **" "#var %huntingCritter Beisswurm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Malodorous bucca    (50-65)   **" "#var %huntingCritter bucca;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Copperhead viper    (55-70)   **" "#var %huntingCritter Copperhead viper;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf    (55-73)   **" "#var %huntingCritter Bone wolf;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (60-75)   **" "#var %huntingCritter Blood wolf;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Fire sprite    (60-75)   **" "#var %huntingCritter Fire sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Endrus serpent    (70-90)   **" "#var %huntingCritter Endrus serpent;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Snowbeast   (75-105)   **" "#var %huntingCritter Snowbeast;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Fire maiden  (80-100)   **" "#var %huntingCritter Fire maiden;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Silver-backed bear   (85-105)   **" "#var %huntingCritter Silver-backed bear;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Immature firecat   (90-125)   **" "#var %huntingCritter Immature firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Grave worm   (90-130)   **" "#var %huntingCritter Grave worm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Moss mey   (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Young firecat   (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Granite gargoyle   (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Crypt fiend  (100-145)   **" "#var %huntingCritter Crypt fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Footpad  (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Ruffian  (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!" 
	if $HSKILL = 200 then put #link >Hunting "**            Cutthroat  (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                 Thug  (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!" (110-150)
	if $HSKILL = 200 then put #link >Hunting "**Golden scaled atik'et  (120-170)   **" "#var %huntingCritter ATIKET T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Grey and Tan westanuryn(120-170)   **" "#var %huntingCritter WESTANURYN T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Dire bear   (120-170)   **" "#var %huntingCritter Dire bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter thicket viper;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         River sprite  (140-175)   **" "#var %huntingCritter River sprite;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Giant black leucro  (160-215)   **" "#var %huntingCritter black leucro;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Scavenger troll  (170-220)   **" "#var %huntingCritter Scavenger troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Dryad priestess  (175-220)   **" "#var %huntingCritter Dryad priestess;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Twisted dryad  (175-220)   **" "#var %huntingCritter Twisted dryad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Seordhevor kartais  (180-230)   **" "#var %huntingCritter kartais;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Rock guardian  (180-260)   **" "#var %huntingCritter Rock guardian;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Mottled westanuryn  (180-290)   **" "#var %huntingCritter Mottled westanuryn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et(230-280)   **" "#var %huntingCritter ATIKET T2;#parse CHOICE MADE!" 
	if $HSKILL = 300 then put #link >Hunting "**           Cave troll  (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Forest geni  (250-350)   **" "#var %huntingCritter Forest geni;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Muscular firecat  (280-350)   **" "#var %huntingCritter Muscular firecat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et T2(280-350)   **" "#var %huntingCritter ATIKET T3;#parse CHOICE MADE!" 
     if $HSKILL = 400 then put #link >Hunting "**           Giant Bear  (250-400)   **" "#var %huntingCritter GIANT BEAR;#parse CHOICE MADE!" 
	if $HSKILL = 400 then put #link >Hunting "**      Treehopper toad  (300-370)   **" "#var %huntingCritter toad;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Wir dinego  (300-400)   **" "#var %huntingCritter Wir dinego;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**        Onyx Gargoyle  (320-400)   **" "#var %huntingCritter Onyx Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**       Supple firecat  (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Misshapen germish'din  (330-520)   **" "#var %huntingCritter MISSHAPEN GERMISHDIN;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**          Snaer hafwa  (350-500)   **" "#var %huntingCritter Snaer hafwa;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Warklin mauler  (400-500)   **" "#var %huntingCritter WARKLIN MAULER;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Armored warklin  (400-600)   **" "#var %huntingCritter ARMORED WARKLIN;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**           Storm bull  (550-750)   **" "#var %huntingCritter Storm bull;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Misenseor resuscitant  (550-800)   **" "#var %huntingCritter Misenseor resuscitant;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**    Xala'shar magus  (750-1,000)   **" "#var %huntingCritter Xalashar magus;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**   Xala'shar thrall  (750-1,000)   **" "#var %huntingCritter Xalashar thrall;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar conjurer  (800-1,100)   **" "#var %huntingCritter Xalashar conjurer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Xala'shar vanquisher (800-1,100)   **" "#var %huntingCritter Xalashar vanquisher;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**         Lava drake  (900-1,300)   **" "#var %huntingCritter Lava drake;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**   Xala'shar slayer  (900-1,300)   **" "#var %huntingCritter Xalashar slayer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**   Xala'shar archer  (900-1,300)   **" "#var %huntingCritter Xalashar archer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Xala'shar vindicator (900-1,350)   **" "#var %huntingCritter Xalashar vindicator;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Xala'shar archimage  (900-1,350)   **" "#var %huntingCritter Xalashar archimage;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar overseer  (950-1,400)   **" "#var %huntingCritter Xalashar overseer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar shredder  (950-1,400)   **" "#var %huntingCritter Xalashar shredder;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**        Umbral moth  (950-1,400)   **" "#var %huntingCritter Umbral moth 1;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**    Arthelun Cabalist(1100-1600)   **" "#var %huntingCritter cabalist;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**  Fuligin Umbral moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH DIRGE;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Void-Black umbral moth(1450-1750)  **" "#var %huntingCritter VOID MOTH DIRGE;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**      Scavenger Giant(1450-1750)  **" "#var %huntingCritter SCAVENGER GIANT;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1Undead:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**        All Zoluren Undead         **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**Pale Gray Death Squirrel (10-35)   **" "#var %huntingCritter Squirrel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Fell Hog    (10-40)   **" "#var %huntingCritter fell hog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Lesser Skeleton    (12-28)   **" "#var %huntingCritter skeleton;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Zombie Goblin    (15-45)   **" "#var %huntingCritter goblin zombie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Ghoul    (26-44)   **" "#var %huntingCritter GHOUL 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Small grendel    (35-50)   **" "#var %huntingCritter grendel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Faenrae reaver    (35-52)   **" "#var %huntingCritter reaver;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Revenant conscript    (40-50)   **" "#var %huntingCritter Revenant conscript;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie    (45-59)   **" "#var %huntingCritter Revenant zombie;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Crypt fiend  (100-145)   **" "#var %huntingCritter Crypt fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Seordhevor kartais  (180-230)   **" "#var %huntingCritter kartais;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Wir dinego  (300-400)   **" "#var %huntingCritter Wir dinego;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Misshapen germish'din  (330-520)   **" "#var %huntingCritter MISSHAPEN GERMISHDIN;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**          Snaer hafwa  (350-500)   **" "#var %huntingCritter Snaer hafwa;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Misenseor resuscitant  (550-800)   **" "#var %huntingCritter Misenseor resuscitant;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**    Xala'shar slayer  (900-1300)   **" "#var %huntingCritter Xalashar slayer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar vindicator (900-1350)   **" "#var %huntingCritter Xalashar vindicator;#parse CHOICE MADE!"	
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1Constructs:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**      All Zoluren Constructs       **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**     Origami creature    (20-55)   **" "#var %huntingCritter Origami ;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Endrus serpent    (70-90)   **" "#var %huntingCritter Endrus serpent;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Granite gargoyle   (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Rock guardian  (180-260)   **" "#var %huntingCritter Rock guardian;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**        Onyx Gargoyle  (320-400)   **" "#var %huntingCritter Onyx Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**          Lava drake  (900-1300)   **" "#var %huntingCritter Lava drake;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1Living:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**     All Zoluren Living Critters   **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**                  Rat     (0-30)   **" "#var %huntingCritter Rat 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Lout     (0-35)   **" "#var %huntingCritter Lout1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Silverfish    (10-32)   **" "#var %huntingCritter Silverfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Musk Hog    (10-35)   **" "#var %huntingCritter musk hog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Forager Goblin    (12-34)   **" "#var %huntingCritter forager goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Ring Necked Gidi    (15-44)   **" "#var %huntingCritter Gidi;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Crazed madman    (15-45)   **" "#var %huntingCritter madman;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Field goblin    (17-42)   **" "#var %huntingCritter Field goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scavenger goblin    (18-36)   **" "#var %huntingCritter Scavenger goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar    (18-42)   **" "#var %huntingCritter Wild boar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Skunk    (18-42)   **" "#var %huntingCritter Skunk;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Brown burrower    (18-42)   **" "#var %huntingCritter burrower;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Striped badger    (19-42)   **" "#var %huntingCritter badger;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Inkhorne    (20-45)   **" "#var %huntingCritter Inkhorne;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman    (20-50)   **" "#var %huntingCritter Goblin shaman;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Croff pothanit    (22-39)   **" "#var %huntingCritter Croff pothanit;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Blood nyad    (25-40)   **" "#var %huntingCritter Blood nyad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Blood dryad    (25-40)   **" "#var %huntingCritter Blood dryad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Corpse grub    (25-45)   **" "#var %huntingCritter Corpse grub;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Deer    (25-45)   **" "#var %huntingCritter Deer;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel    (25-50)   **" "#var %huntingCritter Grass eel 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Water sprite    (28-45)   **" "#var %huntingCritter Water sprite;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar    (30-49)   **" "#var %huntingCritter Cougar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**    Glutinous lipopod    (32-50)   **" "#var %huntingCritter lipopod;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Trollkin    (33-40)   **" "#var %huntingCritter Trollkin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Giant wasp    (35-50)   **" "#var %huntingCritter Giant wasp;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wind hound    (35-73)   **" "#var %huntingCritter Wind hound;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          S'lai scout    (36-49)   **" "#var %huntingCritter Slai scout;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Jackal    (36-50)   **" "#var %huntingCritter Jackal;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Large brown spider    (36-51)   **" "#var %huntingCritter Large brown spider;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll    (36-53)   **" "#var %huntingCritter Wood Troll;#parse CHOICE MADE!"
	#if $HSKILL = 50 then put #link >Hunting "**Brown bear  (45-59)   **" "#var %huntingCritter Brown bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Bobcat    (45-65)   **" "#var %huntingCritter Bobcat1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Cave bear    (45-65)   **" "#var %huntingCritter Cave bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram    (45-70)   **" "#var %huntingCritter Wood Trollm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Beisswurm    (50-65)   **" "#var %huntingCritter Beisswurm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Malodorous bucca    (50-65)   **" "#var %huntingCritter bucca;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Copperhead viper    (55-70)   **" "#var %huntingCritter Copperhead viper;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf    (55-73)   **" "#var %huntingCritter Bone wolf;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (60-75)   **" "#var %huntingCritter Blood wolf 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Fire sprite    (60-75)   **" "#var %huntingCritter Fire sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Snowbeast   (75-105)   **" "#var %huntingCritter Snowbeast;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Fire maiden  (80-100)   **" "#var %huntingCritter Fire maiden;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Silver-backed bear   (85-105)   **" "#var %huntingCritter Silver-backed bear;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Immature firecat   (90-125)   **" "#var %huntingCritter Immature firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Grave worm   (90-130)   **" "#var %huntingCritter Grave worm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Moss mey   (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Young firecat   (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Footpad  (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Ruffian  (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!" 
	if $HSKILL = 200 then put #link >Hunting "**            Cutthroat  (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                 Thug  (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Golden scaled atik'et  (120-170)   **" "#var %huntingCritter ATIKET T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Grey and Tan westanuryn(120-170)   **" "#var %huntingCritter WESTANURYN T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Dire bear   (120-170)   **" "#var %huntingCritter Dire bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter thicket viper;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         River sprite  (140-175)   **" "#var %huntingCritter River sprite;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Giant black leucro  (160-215)   **" "#var %huntingCritter black leucro;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Scavenger troll  (170-220)   **" "#var %huntingCritter Scavenger troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Dryad priestess  (175-220)   **" "#var %huntingCritter Dryad priestess;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Twisted dryad  (175-220)   **" "#var %huntingCritter Twisted dryad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Mottled westanuryn  (180-290)   **" "#var %huntingCritter Mottled westanuryn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et(230-280)   **" "#var %huntingCritter ATIKET T2;#parse CHOICE MADE!" 
	if $HSKILL = 300 then put #link >Hunting "**           Cave troll  (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Forest geni  (250-350)   **" "#var %huntingCritter Forest geni;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Muscular firecat  (280-350)   **" "#var %huntingCritter Muscular firecat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et T2(280-350)   **" "#var %huntingCritter ATIKET T3;#parse CHOICE MADE!" 
     if $HSKILL = 400 then put #link >Hunting "**           Giant Bear  (250-400)   **" "#var %huntingCritter GIANT BEAR;#parse CHOICE MADE!" 
	if $HSKILL = 400 then put #link >Hunting "**      Treehopper toad  (300-370)   **" "#var %huntingCritter toad;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**       Supple firecat  (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Warklin mauler  (400-500)   **" "#var %huntingCritter WARKLIN MAULER;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Armored warklin  (400-600)   **" "#var %huntingCritter ARMORED WARKLIN;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**           Storm bull  (550-750)   **" "#var %huntingCritter Storm bull;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**    Xala'shar magus  (750-1,000)   **" "#var %huntingCritter Xalashar magus;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**   Xala'shar thrall  (750-1,000)   **" "#var %huntingCritter Xalashar thrall;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar conjurer  (800-1,100)   **" "#var %huntingCritter Xalashar conjurer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Xala'shar vanquisher (800-1,100)   **" "#var %huntingCritter Xalashar vanquisher;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**   Xala'shar archer  (900-1,300)   **" "#var %huntingCritter Xalashar archer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Xala'shar archimage  (900-1,350)   **" "#var %huntingCritter Xalashar archimage;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar overseer  (950-1,400)   **" "#var %huntingCritter Xalashar overseer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar shredder  (950-1,400)   **" "#var %huntingCritter Xalashar shredder;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**        Umbral moth  (950-1,400)   **" "#var %huntingCritter Umbral moth 1;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "** Fuligin Umbral moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH DIRGE;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**    Arthelun Cabalist(1100-1600)   **" "#var %huntingCritter cabalist;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**VoidBlack umbral moth(1450-1750)  **" "#var %huntingCritter VOID MOTH DIRGE;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**      Scavenger Giant(1450-1750)  **" "#var %huntingCritter SCAVENGER GIANT;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1Boxes:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**      All Zoluren Box Droppers     **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**                 Lout     (0-35)   **" "#var %huntingCritter Lout1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Lesser Skeleton    (12-28)   **" "#var %huntingCritter skeleton;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Zombie Goblin    (15-45)   **" "#var %huntingCritter goblin zombie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Forager Goblin    (12-34)   **" "#var %huntingCritter forager goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Crazed madman    (15-45)   **" "#var %huntingCritter madman;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Field goblin    (17-42)   **" "#var %huntingCritter Field goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scavenger goblin    (18-36)   **" "#var %huntingCritter Scavenger goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman    (20-50)   **" "#var %huntingCritter Goblin shaman;#parse CHOICE MADE!""
	if $HSKILL = 50 then put #link >Hunting "**           Blood nyad    (25-40)   **" "#var %huntingCritter Blood nyad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Blood dryad    (25-40)   **" "#var %huntingCritter Blood dryad;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Ghoul    (26-44)   **" "#var %huntingCritter GHOUL 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Trollkin    (33-40)   **" "#var %huntingCritter Trollkin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Small grendel    (35-50)   **" "#var %huntingCritter grendel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Faenrae reaver    (35-52)   **" "#var %huntingCritter reaver;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          S'lai scout    (36-49)   **" "#var %huntingCritter Slai scout;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll    (36-53)   **" "#var %huntingCritter Wood Troll;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Revenant conscript    (40-50)   **" "#var %huntingCritter Revenant conscript;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie    (45-59)   **" "#var %huntingCritter Revenant zombie;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Malodorous bucca    (50-65)   **" "#var %huntingCritter bucca;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Fire sprite    (60-75)   **" "#var %huntingCritter Fire sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Fire maiden  (80-100)   **" "#var %huntingCritter Fire maiden;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Moss mey   (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Granite gargoyle   (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Crypt fiend  (100-145)   **" "#var %huntingCritter Crypt fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Footpad  (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Ruffian  (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!" 
	if $HSKILL = 200 then put #link >Hunting "**            Cutthroat  (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                 Thug  (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Golden scaled atik'et  (120-170)   **" "#var %huntingCritter ATIKET T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         River sprite  (140-175)   **" "#var %huntingCritter River sprite;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Scavenger troll  (170-220)   **" "#var %huntingCritter Scavenger troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Dryad priestess  (175-220)   **" "#var %huntingCritter Dryad priestess;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Twisted dryad  (175-220)   **" "#var %huntingCritter Twisted dryad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et(230-280)   **" "#var %huntingCritter ATIKET T2;#parse CHOICE MADE!" 
	if $HSKILL = 300 then put #link >Hunting "**           Cave troll  (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Forest geni  (250-350)   **" "#var %huntingCritter Forest geni;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Red-Gold scaled atik'et T2(280-350)   **" "#var %huntingCritter ATIKET T3;#parse CHOICE MADE!" 
	if $HSKILL = 400 then put #link >Hunting "**           Wir dinego  (300-400)   **" "#var %huntingCritter Wir dinego;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**        Onyx Gargoyle  (320-400)   **" "#var %huntingCritter Onyx Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Misshapen germish'din  (330-520)   **" "#var %huntingCritter MISSHAPEN GERMISHDIN;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Misenseor resuscitant  (550-800)   **" "#var %huntingCritter Misenseor resuscitant;#parse CHOICE MADE!"	
     if $HSKILL = 800 then put #link >Hunting "**    Xala'shar magus  (750-1,000)   **" "#var %huntingCritter Xalashar magus;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**     Xala'shar magus  (750-1000)   **" "#var %huntingCritter Xalashar magus;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**    Xala'shar thrall  (750-1000)   **" "#var %huntingCritter Xalashar thrall;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**  Xala'shar conjurer  (800-1100)   **" "#var %huntingCritter Xalashar conjurer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar vanquisher (800-1100)   **" "#var %huntingCritter Xalashar vanquisher;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**    Xala'shar slayer  (900-1300)   **" "#var %huntingCritter Xalashar slayer;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar vindicator (900-1350)   **" "#var %huntingCritter Xalashar vindicator;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Xala'shar archimage  (900-1350)   **" "#var %huntingCritter Xalashar archimage;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Arthelun Cabalist(1100-1600)   **" "#var %huntingCritter cabalist;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**      Scavenger Giant(1450-1750)  **" "#var %huntingCritter SCAVENGER GIANT;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1Skins:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Zoluren Skinnables      **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**                  Rat     (0-30)   **" "#var %huntingCritter Rat 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Silverfish    (10-32)   **" "#var %huntingCritter Silverfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**Pale Gray Death Squirrel (10-35)   **" "#var %huntingCritter Squirrel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Musk Hog    (10-35)   **" "#var %huntingCritter musk hog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Forager Goblin    (12-34)   **" "#var %huntingCritter forager goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Field goblin    (17-42)   **" "#var %huntingCritter Field goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scavenger goblin    (18-36)   **" "#var %huntingCritter Scavenger goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar    (18-42)   **" "#var %huntingCritter Wild boar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Skunk    (18-42)   **" "#var %huntingCritter Skunk;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Brown burrower    (18-42)   **" "#var %huntingCritter burrower;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Striped badger    (19-42)   **" "#var %huntingCritter badger;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Croff pothanit    (22-39)   **" "#var %huntingCritter Croff pothanit;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          Corpse grub    (25-45)   **" "#var %huntingCritter Corpse grub;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Deer    (25-45)   **" "#var %huntingCritter Deer;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel    (25-50)   **" "#var %huntingCritter Grass eel 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Ghoul    (26-44)   **" "#var %huntingCritter GHOUL 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar    (30-49)   **" "#var %huntingCritter Cougar;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Trollkin    (33-40)   **" "#var %huntingCritter Trollkin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Giant wasp    (35-50)   **" "#var %huntingCritter Giant wasp;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Small grendel    (35-50)   **" "#var %huntingCritter grendel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Faenrae reaver    (35-52)   **" "#var %huntingCritter reaver;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          S'lai scout    (36-49)   **" "#var %huntingCritter Slai scout;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"!"
	if $HSKILL = 50 then put #link >Hunting "**               Jackal    (36-50)   **" "#var %huntingCritter Jackal;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**   Large brown spider    (36-51)   **" "#var %huntingCritter Large brown spider;#parse CHOICE MADE!"
	#if $HSKILL = 50 then put #link >Hunting "**Brown bear  (45-59)   **" "#var %huntingCritter Brown bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Bobcat    (45-65)   **" "#var %huntingCritter Bobcat1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Cave bear    (45-65)   **" "#var %huntingCritter Cave bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram    (45-70)   **" "#var %huntingCritter Wood Troll;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Beisswurm    (50-65)   **" "#var %huntingCritter Beisswurm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Copperhead viper    (55-70)   **" "#var %huntingCritter Copperhead viper;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf    (55-73)   **" "#var %huntingCritter Bone wolf;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (60-75)   **" "#var %huntingCritter Blood wolf 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Endrus serpent    (70-90)   **" "#var %huntingCritter Endrus serpent;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Snowbeast   (75-105)   **" "#var %huntingCritter Snowbeast;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Silver-backed bear   (85-105)   **" "#var %huntingCritter Silver-backed bear;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Immature firecat   (90-125)   **" "#var %huntingCritter Immature firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Grave worm   (90-130)   **" "#var %huntingCritter Grave worm;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Moss mey   (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Young firecat   (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Granite gargoyle   (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Grey and Tan westanuryn(120-170)   **" "#var %huntingCritter WESTANURYN T1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Dire bear   (120-170)   **" "#var %huntingCritter Dire bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter thicket viper;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Giant black leucro  (160-215)   **" "#var %huntingCritter black leucro;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Scavenger troll  (170-220)   **" "#var %huntingCritter Scavenger troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Seordhevor kartais  (180-230)   **" "#var %huntingCritter kartais;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Mottled westanuryn  (180-290)   **" "#var %huntingCritter Mottled westanuryn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Cave troll  (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Muscular firecat  (280-350)   **" "#var %huntingCritter Muscular firecat;#parse CHOICE MADE!" 
     if $HSKILL = 400 then put #link >Hunting "**           Giant Bear  (250-400)   **" "#var %huntingCritter GIANT BEAR;#parse CHOICE MADE!" 
	if $HSKILL = 400 then put #link >Hunting "**      Treehopper toad  (300-370)   **" "#var %huntingCritter toad;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**        Onyx Gargoyle  (320-400)   **" "#var %huntingCritter Onyx Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**       Supple firecat  (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Misshapen germish'din  (330-520)   **" "#var %huntingCritter MISSHAPEN GERMISHDIN;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Warklin mauler  (400-500)   **" "#var %huntingCritter WARKLIN MAULER;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Armored warklin  (400-600)   **" "#var %huntingCritter ARMORED WARKLIN;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**           Storm bull  (550-750)   **" "#var %huntingCritter Storm bull;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**  Xala'shar conjurer  (800-1100)   **" "#var %huntingCritter Xalashar conjurer;#parse CHOICE MADE!"	
	if $HSKILL = 1750 then put #link >Hunting "**          Lava drake  (900-1300)   **" "#var %huntingCritter Lava drake;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**         Umbral moth  (950-1400)   **" "#var %huntingCritter Umbral moth 1;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**  Fuligin Umbral moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH DIRGE;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Void-Black umbral moth(1450-1750)  **" "#var %huntingCritter VOID MOTH DIRGE;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P1SANDB:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**  All Zoluren Skinnables and Boxes **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**       Forager Goblin    (12-34)   **" "#var %huntingCritter forager goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**         Field goblin    (17-42)   **" "#var %huntingCritter Field goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scavenger goblin    (18-36)   **" "#var %huntingCritter Scavenger goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                Ghoul    (26-44)   **" "#var %huntingCritter GHOUL 1;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**             Trollkin    (33-40)   **" "#var %huntingCritter Trollkin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Small grendel    (35-50)   **" "#var %huntingCritter grendel;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**       Faenrae reaver    (35-52)   **" "#var %huntingCritter reaver;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**          S'lai scout    (36-49)   **" "#var %huntingCritter Slai scout;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Rock troll    (60-73)   **" "#var %huntingCritter Rock troll 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Moss mey   (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**     Granite gargoyle   (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Scavenger troll  (170-220)   **" "#var %huntingCritter Scavenger troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Cave troll  (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**        Onyx Gargoyle  (320-400)   **" "#var %huntingCritter Onyx Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Misshapen germish'din  (330-520)   **" "#var %huntingCritter MISSHAPEN GERMISHDIN;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**  Xala'shar conjurer  (800-1100)   **" "#var %huntingCritter Xalashar conjurer;#parse CHOICE MADE!"	
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2None:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Therengia Critters      **"
	put #echo >Hunting "***************************************"
     delay 0.5
	put #echo >Hunting
	if $HSKILL = 50 then put #link >Hunting "**      Heggarangi frog    (0-26)    **" "#var %huntingCritter frog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                  Rat    (0-30)    **" "#var %huntingCritter Salt Crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Zombie goblin    (0-35)    **" "#var %huntingCritter Zombie goblin2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scarlet crayfish   (15-38)    **" "#var %huntingCritter crayfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Tortured soul   (16-45)    **" "#var %huntingCritter Tortured soul;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Wildland goblin   (17-42)    **" "#var %huntingCritter Wildland goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar   (18-42)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman   (20-50)    **" "#var %huntingCritter Goblin shaman2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Salt crab   (25-42)    **" "#var %huntingCritter Salt crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel   (25-50)    **" "#var %huntingCritter Grass eel2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar   (30-49)    **" "#var %huntingCritter Kelpie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Kelpie   (35-50)    **" "#var %huntingCritter Kelpie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll   (36-53)    **" "#var %huntingCritter Wood TrollLang;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Black bear   (45-59)    **" "#var %huntingCritter Black bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie   (45-59)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram   (45-70)    **" "#var %huntingCritter Meadow ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Boobrie   (50-75)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Arbelog   (50-85)    **" "#var %huntingCritter Arbelog;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf   (55-73)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Dusk Ogre   (60-75)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**         River caiman   (60-90)    **" "#var %huntingCritter River caiman;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Dark fiend   (70-90)    **" "#var %huntingCritter Dark fiend;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Giant wolf spider   (70-98)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Thunder ram   (70-100)    **" "#var %huntingCritter Thunder ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sun vulture   (70-100)   **" "#var %huntingCritter Sun vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Lesser sluagh   (70-110)   **" "#var %huntingCritter Lesser sluagh;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Morah vine   (70-120)   **" "#var %huntingCritter Morah vine;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Morah creeper   (70-140)   **" "#var %huntingCritter Morah creeper;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (75-90)   **" "#var %huntingCritter Blood wolf2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sand spider   (80-100)   **" "#var %huntingCritter Sand spider;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Young brocket deer   (90-110)   **" "#var %huntingCritter Young brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Gypsy marauder  (100-125)   **" "#var %huntingCritter Gypsy marauder;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Wood Troll  (100-145)   **" "#var %huntingCritter Wood Troll2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Troublesome tightwad  (100-150)   **" "#var %huntingCritter tightwad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Piruati serpent  (100-150)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Miserly Moneygrubber  (100-150)   **" "#var %huntingCritter Moneygrubber;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shifty-eyed skinflint  (100-150)   **" "#var %huntingCritter skinflint;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (100-160)   **" "#var %huntingCritter Lesser sluagh2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Pugnacious pinchfist  (100-160)   **" "#var %huntingCritter pinchfist;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightweaver unyn  (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Scout ogre  (120-160)   **" "#var %huntingCritter Scout ogre2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (120-160)   **" "#var %huntingCritter SWAMP TROLL 1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shaggy black barghest  (120-180)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Red brocket deer  (135-180)   **" "#var %huntingCritter Red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Pirate  (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Spiny dyrachis  (140-200)   **" "#var %huntingCritter dyrachis;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Alley thug  (140-230)   **" "#var %huntingCritter Alley thug;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (140-235)   **" "#var %huntingCritter SWAMP TROLL 2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (150-200)   **" "#var %huntingCritter Lesser sluagh3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Heggarangi boar  (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightreaver unyn  (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Grey clay soldier  (150-240)   **" "#var %huntingCritter clay soldier;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Cadaverous yeehar  (150-300)   **" "#var %huntingCritter Cadaverous yeehar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Lesser shadow hound  (160-210)   **" "#var %huntingCritter Lesser shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Vicious warcat  (160-230)   **" "#var %huntingCritter Vicious warcat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            clay mage  (175-250)   **" "#var %huntingCritter Grey clay mage;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Small peccary  (175-250)   **" "#var %huntingCritter small peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Orc scout  (180-230)   **" "#var %huntingCritter Orc scout;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Grey clay archer  (180-240)   **" "#var %huntingCritter clay archer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Angiswaerd hatchling  (180-250)   **" "#var %huntingCritter Angiswaerd hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Orc bandit  (180-317)   **" "#var %huntingCritter Orc bandit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (190-260)   **" "#var %huntingCritter SWAMP TROLL 3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Rhoat moda  (190-280)   **" "#var %huntingCritter Rhoat moda;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Fendryad  (190-280)   **" "#var %huntingCritter Fendryad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Elder  brocket deer  (200-260)   **" "#var %huntingCritter Elder red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Hulking black barghest (210-290)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Long-fanged warcat  (220-300)   **" "#var %huntingCritter Long-fanged warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Velakan slaver  (225-360)   **" "#var %huntingCritter Velakan slaver;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Zombie nomad  (260-410)   **" "#var %huntingCritter Zombie nomad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Greater shadow hound  (270-380)   **" "#var %huntingCritter Greater shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            River boa  (275-350)   **" "#var %huntingCritter River boa2;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Greater sluagh  (280-350)   **" "#var %huntingCritter Greater sluagh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Orc reiver  (280-350)   **" "#var %huntingCritter Orc reiver;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Sabre-toothed warcat  (280-350)   **" "#var %huntingCritter Sabre-toothed warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter Bristle-backed peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Nightstalker unyn  (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Sinuous elsralael  (300-350)   **" "#var %huntingCritter elsralael2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Marbled angiswaerd  (300-400)   **" "#var %huntingCritter angiswaerd;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Young forest gryphon  (300-420)   **" "#var %huntingCritter Young forest gryphon;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**            Gam chaga  (300-450)   **" "#var %huntingCritter Gam chaga;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lesser basilisk  (300-520)   **" "#var %huntingCritter Lesser dusky-scaled basilisk;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** adult forest gryphon  (300-550)   **" "#var %huntingCritter adult forest gryphon;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**mature forest gryphon  (315-380)   **" "#var %huntingCritter MATURE FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         shadow beast  (320-650)   **" "#var %huntingCritter Maelshyvean shadow beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         cinder beast  (350-570)   **" "#var %huntingCritter Maelshyvean cinder beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Isundjen conjurer  (360-500)   **" "#var %huntingCritter Isundjen conjurer;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Orc raider  (380-450)   **" "#var %huntingCritter Orc raider;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** elder forest gryphon  (380-600)   **" "#var %huntingCritter ELDER FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Orc clan-chief  (400-500)   **" "#var %huntingCritter Orc clan-chief;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Scaly seordmaor  (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          Ashu hhinvi  (500-700)   **" "#var %huntingCritter Ashu hhinvi;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Maelshyvean hierophant (575-700)   **" "#var %huntingCritter Sinister Maelshyvean hierophant;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**            Sky giant  (600-750)   **" "#var %huntingCritter Sky giant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2Undead:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Therengia Undead        **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**        Zombie goblin    (0-35)    **" "#var %huntingCritter Zombie goblin2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Tortured soul   (16-45)    **" "#var %huntingCritter Tortured soul;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie   (45-59)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Dark fiend   (70-90)    **" "#var %huntingCritter Dark fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Cadaverous yeehar  (150-300)   **" "#var %huntingCritter Cadaverous yeehar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Greater shadow hound  (270-380)   **" "#var %huntingCritter Greater shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Zombie nomad  (260-410)   **" "#var %huntingCritter Zombie nomad;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         shadow beast  (320-650)   **" "#var %huntingCritter Maelshyvean shadow beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         cinder beast  (350-570)   **" "#var %huntingCritter Maelshyvean cinder beast;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Maelshyvean hierophant (575-700)   **" "#var %huntingCritter Sinister Maelshyvean hierophant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel

P2Constructs:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**     All Therengia Constructs      **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 200 then put #link >Hunting "**    Grey clay soldier  (150-240)   **" "#var %huntingCritter clay soldier;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Grey clay mage  (175-250)   **" "#var %huntingCritter clay mage;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Grey clay archer  (180-240)   **" "#var %huntingCritter clay archer;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**            Gam chaga  (300-450)   **" "#var %huntingCritter Gam chaga;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          Ashu hhinvi  (500-700)   **" "#var %huntingCritter Ashu hhinvi;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2Living:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**    All Therengia Living Critters  **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**      Heggarangi frog    (0-26)    **" "#var %huntingCritter frog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                  Rat    (0-30)    **" "#var %huntingCritter Salt Crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scarlet crayfish   (15-38)    **" "#var %huntingCritter crayfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Wildland goblin   (17-42)    **" "#var %huntingCritter Wildland goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar   (18-42)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman   (20-50)    **" "#var %huntingCritter Goblin shaman2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Salt crab   (25-42)    **" "#var %huntingCritter Salt crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel   (25-50)    **" "#var %huntingCritter Grass eel2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar   (30-49)    **" "#var %huntingCritter Kelpie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Kelpie   (35-50)    **" "#var %huntingCritter Kelpie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll   (36-53)    **" "#var %huntingCritter Wood TrollLang;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Black bear   (45-59)    **" "#var %huntingCritter Black bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram   (45-70)    **" "#var %huntingCritter Meadow ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Thunder ram   (70-10)    **" "#var %huntingCritter Thunder ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Boobrie   (50-75)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Arbelog   (50-85)    **" "#var %huntingCritter Arbelog;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf   (55-73)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Dusk Ogre   (60-75)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**         River caiman   (60-90)    **" "#var %huntingCritter River caiman;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Giant wolf spider   (70-98)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sun vulture   (70-100)   **" "#var %huntingCritter Sun vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Lesser sluagh   (70-110)   **" "#var %huntingCritter Lesser sluagh;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Morah vine   (70-120)   **" "#var %huntingCritter Morah vine;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Morah creeper   (70-140)   **" "#var %huntingCritter Morah creeper;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (75-90)   **" "#var %huntingCritter Blood wolf2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sand spider   (80-100)   **" "#var %huntingCritter Sand spider;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Young brocket deer   (90-110)   **" "#var %huntingCritter Young brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Gypsy marauder  (100-125)   **" "#var %huntingCritter Gypsy marauder;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Wood Troll  (100-145)   **" "#var %huntingCritter Wood Troll2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Troublesome tightwad  (100-150)   **" "#var %huntingCritter tightwad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Piruati serpent  (100-150)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Miserly Moneygrubber  (100-150)   **" "#var %huntingCritter Moneygrubber;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shifty-eyed skinflint  (100-150)   **" "#var %huntingCritter skinflint;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Pugnacious pinchfist  (100-160)   **" "#var %huntingCritter pinchfist;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (100-160)   **" "#var %huntingCritter Lesser sluagh2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightweaver unyn  (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Scout ogre  (120-160)   **" "#var %huntingCritter Scout ogre2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (120-160)   **" "#var %huntingCritter SWAMP TROLL 1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shaggy black barghest  (120-180)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Red brocket deer  (135-180)   **" "#var %huntingCritter Red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Pirate  (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Spiny dyrachis  (140-200)   **" "#var %huntingCritter dyrachis;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Alley thug  (140-230)   **" "#var %huntingCritter Alley thug;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (140-235)   **" "#var %huntingCritter SWAMP TROLL 2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (150-200)   **" "#var %huntingCritter Lesser sluagh3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Heggarangi boar  (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightreaver unyn  (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Lesser shadow hound  (160-210)   **" "#var %huntingCritter Lesser shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Vicious warcat  (160-230)   **" "#var %huntingCritter Vicious warcat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Small peccary  (175-250)   **" "#var %huntingCritter small peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Orc scout  (180-230)   **" "#var %huntingCritter Orc scout;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Angiswaerd hatchling  (180-250)   **" "#var %huntingCritter Angiswaerd hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Orc bandit  (180-317)   **" "#var %huntingCritter Orc bandit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (190-260)   **" "#var %huntingCritter SWAMP TROLL 3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Rhoat moda  (190-280)   **" "#var %huntingCritter Rhoat moda;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Fendryad  (190-280)   **" "#var %huntingCritter Fendryad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Elder  brocket deer  (200-260)   **" "#var %huntingCritter Elder red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Hulking black barghest (210-290)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Long-fanged warcat  (220-300)   **" "#var %huntingCritter Long-fanged warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Velakan slaver  (225-360)   **" "#var %huntingCritter Velakan slaver;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            River boa  (275-350)   **" "#var %huntingCritter River boa2;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Greater sluagh  (280-320)   **" "#var %huntingCritter Greater sluagh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Orc reiver  (280-350)   **" "#var %huntingCritter Orc reiver;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Sabre-toothed warcat  (280-350)   **" "#var %huntingCritter Sabre-toothed warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter Bristle-backed peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Nightstalker unyn  (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Sinuous elsralael  (300-350)   **" "#var %huntingCritter elsralael2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Marbled angiswaerd  (300-400)   **" "#var %huntingCritter angiswaerd;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Young forest gryphon  (300-420)   **" "#var %huntingCritter Young forest gryphon;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lesser basilisk  (300-520)   **" "#var %huntingCritter Lesser dusky-scaled basilisk;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** adult forest gryphon  (300-550)   **" "#var %huntingCritter adult forest gryphon;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**mature forest gryphon  (315-400)   **" "#var %huntingCritter MATURE FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Isundjen conjurer  (360-500)   **" "#var %huntingCritter Isundjen conjurer;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Orc raider  (380-450)   **" "#var %huntingCritter Orc raider;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** elder forest gryphon  (380-600)   **" "#var %huntingCritter ELDER FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Orc clan-chief  (400-500)   **" "#var %huntingCritter Orc clan-chief;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Scaly seordmaor  (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**            Sky giant  (600-750)   **" "#var %huntingCritter Sky giant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2Boxes:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**     All Therengia Box Droppers    **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**        Zombie goblin    (0-35)    **" "#var %huntingCritter Zombie goblin2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Wildland goblin   (17-42)    **" "#var %huntingCritter Wildland goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Goblin shaman   (20-50)    **" "#var %huntingCritter Goblin shaman2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Wood Troll   (36-53)    **" "#var %huntingCritter Wood TrollLang;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Revenant zombie   (45-59)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Arbelog   (50-85)    **" "#var %huntingCritter Arbelog;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Dusk Ogre   (60-75)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Lesser sluagh   (70-110)   **" "#var %huntingCritter Lesser sluagh;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Young ogre   (80-120)   **" "#var %huntingCritter Young ogre2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Gypsy marauder  (100-125)   **" "#var %huntingCritter Gypsy marauder;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (100-160)   **" "#var %huntingCritter Lesser sluagh2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Troublesome tightwad  (100-150)   **" "#var %huntingCritter tightwad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Miserly Moneygrubber  (100-150)   **" "#var %huntingCritter Moneygrubber;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shifty-eyed skinflint  (100-150)   **" "#var %huntingCritter skinflint;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Pugnacious pinchfist  (100-160)   **" "#var %huntingCritter pinchfist;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Scout ogre  (120-160)   **" "#var %huntingCritter Scout ogre2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (120-160)   **" "#var %huntingCritter SWAMP TROLL 1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Dark spirit  (130-170)   **" "#var %huntingCritter Dark spirit2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Pirate  (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Alley thug  (140-230)   **" "#var %huntingCritter Alley thug;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (140-235)   **" "#var %huntingCritter Swamp troll 2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (150-200)   **" "#var %huntingCritter Lesser sluagh3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Grey clay soldier  (150-240)   **" "#var %huntingCritter clay soldier;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Cadaverous yeehar  (150-300)   **" "#var %huntingCritter Cadaverous yeehar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Grey clay mage  (175-250)   **" "#var %huntingCritter clay mage;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Orc scout  (180-230)   **" "#var %huntingCritter Orc scout;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Grey clay archer  (180-240)   **" "#var %huntingCritter clay archer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Orc bandit  (180-317)   **" "#var %huntingCritter Orc bandit;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Swamp troll  (190-260)   **" "#var %huntingCritter SWAMP TROLL 3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Fendryad  (190-280)   **" "#var %huntingCritter Fendryad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Pale grey death spirit;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Velakan slaver  (225-360)   **" "#var %huntingCritter Velakan slaver;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Zombie nomad  (260-410)   **" "#var %huntingCritter Zombie nomad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Greater sluagh  (280-340)   **" "#var %huntingCritter Greater sluagh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Orc reiver  (280-350)   **" "#var %huntingCritter Orc reiver;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         shadow beast  (320-650)   **" "#var %huntingCritter Maelshyvean shadow beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         cinder beast  (350-570)   **" "#var %huntingCritter Maelshyvean cinder beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Isundjen conjurer  (360-500)   **" "#var %huntingCritter Isundjen conjurer;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Orc raider  (380-450)   **" "#var %huntingCritter Orc raider;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**       Orc clan-chief  (400-500)   **" "#var %huntingCritter Orc clan-chief;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Maelshyvean hierophant (575-700)   **" "#var %huntingCritter Sinister Maelshyvean hierophant;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**            Sky giant  (600-750)   **" "#var %huntingCritter Sky giant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2Skins:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**      All Therengia Skinnables     **"
	put #echo >Hunting "***************************************"
     delay 0.5		
	if $HSKILL = 50 then put #link >Hunting "**      Heggarangi frog    (0-26)    **" "#var %huntingCritter frog;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                  Rat    (0-30)    **" "#var %huntingCritter Salt Crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**        Zombie goblin    (0-35)    **" "#var %huntingCritter Zombie goblin2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**     Scarlet crayfish   (15-38)    **" "#var %huntingCritter crayfish;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Wildland goblin   (17-42)    **" "#var %huntingCritter Wildland goblin;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Wild boar   (18-42)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Salt crab   (25-42)    **" "#var %huntingCritter Salt crab;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Grass eel   (25-50)    **" "#var %huntingCritter Grass eel2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Cougar   (30-49)    **" "#var %huntingCritter Kelpie;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Black bear   (45-59)    **" "#var %huntingCritter Black bear;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Meadow ram   (45-70)    **" "#var %huntingCritter Meadow ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Boobrie   (50-75)    **" "#var %huntingCritter Boobrie;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Arbelog   (50-85)    **" "#var %huntingCritter Arbelog;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            Bone wolf   (55-73)    **" "#var %huntingCritter Sun Vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**         River caiman   (60-90)    **" "#var %huntingCritter River caiman;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Thunder ram   (70-10)    **" "#var %huntingCritter Thunder ram;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Giant wolf spider   (70-98)    **" "#var %huntingCritter Dusk Ogre;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sun vulture   (70-100)   **" "#var %huntingCritter Sun vulture;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Lesser sluagh   (70-110)   **" "#var %huntingCritter Lesser sluagh;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**           Blood wolf    (75-90)   **" "#var %huntingCritter Blood wolf2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Sand spider   (80-100)   **" "#var %huntingCritter Sand spider;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Young brocket deer   (90-110)   **" "#var %huntingCritter Young brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Blue-belly crocodile  (100-140)   **" "#var %huntingCritter crocodile2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Piruati serpent  (100-150)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (100-160)   **" "#var %huntingCritter Lesser sluagh2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightweaver unyn  (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Shaggy black barghest  (120-180)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Giant thicket viper  (125-165)   **" "#var %huntingCritter Piruati serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Red brocket deer  (135-180)   **" "#var %huntingCritter Red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (150-200)   **" "#var %huntingCritter Lesser sluagh3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Heggarangi boar  (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Nightreaver unyn  (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Lesser shadow hound  (160-210)   **" "#var %huntingCritter Lesser shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Vicious warcat  (160-230)   **" "#var %huntingCritter Vicious warcat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Small peccary  (175-250)   **" "#var %huntingCritter small Peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Angiswaerd hatchling  (180-250)   **" "#var %huntingCritter Angiswaerd hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Rhoat moda  (190-280)   **" "#var %huntingCritter Rhoat moda;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Elder  brocket deer  (200-260)   **" "#var %huntingCritter Elder red brocket deer;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Hulking black barghest (210-290)   **" "#var %huntingCritter barghest;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Long-fanged warcat  (220-300)   **" "#var %huntingCritter Long-fanged warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Greater sluagh  (280-340)   **" "#var %huntingCritter Greater sluagh;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "** Greater shadow hound  (270-380)   **" "#var %huntingCritter Greater shadow hound;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            River boa  (275-350)   **" "#var %huntingCritter River boa2;#parse CHOICE MADE!"	
	if $HSKILL = 300 then put #link >Hunting "** Sabre-toothed warcat  (280-350)   **" "#var %huntingCritter Sabre-toothed warcat;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter Bristle-backed peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Nightstalker unyn  (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Sinuous elsralael  (300-350)   **" "#var %huntingCritter elsralael2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Marbled angiswaerd  (300-400)   **" "#var %huntingCritter angiswaerd;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Young forest gryphon  (300-420)   **" "#var %huntingCritter YOUNG FOREST GRYPHON 1;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lesser basilisk  (300-520)   **" "#var %huntingCritter Lesser dusky-scaled basilisk;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** adult forest gryphon  (300-550)   **" "#var %huntingCritter adult forest gryphon;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**mature forest gryphon  (315-400)   **" "#var %huntingCritter MATURE FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         shadow beast  (320-650)   **" "#var %huntingCritter Maelshyvean shadow beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         cinder beast  (350-570)   **" "#var %huntingCritter Maelshyvean cinder beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Isundjen conjurer  (360-500)   **" "#var %huntingCritter Isundjen conjurer;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** elder forest gryphon  (380-600)   **" "#var %huntingCritter ELDER FOREST GRYPHON;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**      Scaly seordmaor  (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Maelshyvean hierophant (575-700)   **" "#var %huntingCritter Sinister Maelshyvean hierophant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
	
P2SANDB:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "** All Therengia Skinnables and Boxes**"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**        Zombie goblin    (0-35)    **" "#var %huntingCritter Zombie goblin2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**      Wildland goblin   (17-42)    **" "#var %huntingCritter Wildland goblin;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Arbelog   (50-85)    **" "#var %huntingCritter Arbelog;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Lesser sluagh   (70-110)   **" "#var %huntingCritter Lesser sluagh;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (100-160)   **" "#var %huntingCritter Lesser sluagh2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Lesser sluagh  (150-200)   **" "#var %huntingCritter Lesser sluagh3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Greater sluagh  (280-340)   **" "#var %huntingCritter Greater sluagh;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         shadow beast  (320-650)   **" "#var %huntingCritter Maelshyvean shadow beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         cinder beast  (350-570)   **" "#var %huntingCritter Maelshyvean cinder beast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Isundjen conjurer  (360-500)   **" "#var %huntingCritter Isundjen conjurer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Maelshyvean hierophant (575-700)   **" "#var %huntingCritter Sinister Maelshyvean hierophant;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
P3None:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**        All Ilithi Critters        **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**                     Rat  (0-30)   **" "#var %huntingCritter Rat2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 FC  Rat  (0-30)   **" "#var %huntingCritter Rat FC;#parse CHOICE MADE!"
	if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**             Sleazy lout  (0-35)   **" "#var %huntingCritter lout2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Fied goblin  (17-42)   **" "#var %huntingCritter boggle;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Antelope  (20-43)   **" "#var %huntingCritter Antelope;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**              Grass eel  (25-50)   **" "#var %huntingCritter Grass eel3;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Kobold  (36-49)   **" "#var %huntingCritter Kobold;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Small boggle  (39-49)   **" "#var %huntingCritter Small boggle;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Vykathi excavator (50-100)   **" "#var %huntingCritter Vykathi excavator;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Vykathi builder (50-100)   **" "#var %huntingCritter Vykathi builder;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**  Dragon Priest fanatic  (55-90)   **" "#var %huntingCritter Dragon Priest fanatic;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Rock troll (60-73)   **" "#var %huntingCritter Rock troll SHARD;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       FC Spotted bobcat (65-80)   **" "#var %huntingCritter BOBCAT 2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            FC Suw bizar (70-90)   **" "#var %huntingCritter Suw bizar;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Snowbeast (75-105)   **" "#var %huntingCritter Granite Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**                  Bison (80-110)   **" "#var %huntingCritter Bison;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Rock troll (80-110)   **" "#var %huntingCritter Rock troll2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       scythewing larva (85-100)   **" "#var %huntingCritter larva;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Zombie kobold savage (85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Skeletal kobold headhunter(85-110) **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Zombie kobold headhunter(85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "** Skeletal kobold savage (85-110)   **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       FC Spotted shark (90-115)   **" "#var %huntingCritter Spotted shark;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**         FC Drowned one (90-150)   **" "#var %huntingCritter Drowned one;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Granite gargoyle (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Eidolon steed (100-125)   **" "#var %huntingCritter Eidolon steed;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-belly crocodile (100-140)   **" "#var %huntingCritter ELSRALAEL;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC kashika serpent (100-160)   **" "#var %huntingCritter kashika serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Footpad (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Ruffian (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Cutthroat (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Thug (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Young prereni (120-180)   **" "#var %huntingCritter prereni1;#parse CHOICE MADE!"
	#if $HSKILL = 200 then put #link >Hunting "**         Wormwood vine (120-190)   **" "#var %huntingCritter Wormwood vine;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC Quartz gargoyle (135-190)   **" "#var %huntingCritter Quartz gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Dusky scythewing moth (150-190)   **" "#var %huntingCritter scythewing moth;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Shadoweaver (150-255)   **" "#var %huntingCritter Shadoweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Crag (160-185)   **" "#var %huntingCritter Crag;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter YVHH latami;#parse CHOICE MADE!"
	#if $HSKILL = 200 then put #link >Hunting "**     Vykathi harvester (160-220)   **" "#var %huntingCritter Vykathi harvester;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Small peccary (175-250)   **" "#var %huntingCritter Small peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Golden pard (180-240)   **" "#var %huntingCritter Golden pard;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-dappled prereni (180-250)   **" "#var %huntingCritter prereni2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Lanky grey lach (190-280)   **" "#var %huntingCritter Lanky grey lach;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Grizzled red leucro (200-225)   **" "#var %huntingCritter red leucro;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**       Vykathi soldier (200-270)   **" "#var %huntingCritter Vykathi soldier;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Peccary (225-300)   **" "#var %huntingCritter shard Peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Faenrae stalker (225-300)   **" "#var %huntingCritter Faenrae stalker;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Clouded arzumos;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Transparent shylvic (240-325)   **" "#var %huntingCritter Transparent shylvic;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Feral bone mastiff (245-310)   **" "#var %huntingCritter Feral bone mastiff;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elder prereni (250-300)   **" "#var %huntingCritter prereni 3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**                Nimbus (250-320)   **" "#var %huntingCritter Nimbus;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Adan'f blood warrior (250-325)   **" "#var %huntingCritter blood warrior;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**        Vykathi reaper (250-340)   **" "#var %huntingCritter Vykathi reaper;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Red-bristled gremlin (250-360)   **" "#var %huntingCritter Red-bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Adan'f shadow mage (250-370)   **" "#var %huntingCritter shadow mage;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     FC Yellow gremlin (280-410)   **" "#var %huntingCritter Yellow bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**     Sinuous elsralael (300-350)   **" "#var %huntingCritter elsralael;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Giant blade spider (300-400)   **" "#var %huntingCritter blade spider;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Vaporous blood wraith (320-440)   **" "#var %huntingCritter Vaporous blood wraith;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (320-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Gargantuan bone golem (325-380)   **" "#var %huntingCritter Gargantuan bone golem;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Robed Dragon Priest (350-500)   **" "#var %huntingCritter Robed Dragon Priest(ess);#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Faenrae assassin (375-500)   **" "#var %huntingCritter Faenrae assassin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Adan'f spirit dancer (380-600)   **" "#var %huntingCritter spirit dancer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          Young wyvern (600-900)   **" "#var %huntingCritter Young wyvern;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**      Juvenile wyvern (700-1100)   **" "#var %huntingCritter Juvenile wyvern;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**           Telga orek (900-1300)   **" "#var %huntingCritter Telga orek;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**        Adult wyvern (1000-1300)   **" "#var %huntingCritter Adult wyvern;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**          Ice archon (1200-1650)   **" "#var %huntingCritter Ice archon;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Adan'f Sorcerer (1400-1750)   **" "#var %huntingCritter adan'f sorcerer;#parse CHOICE MADE!"	
     if $HSKILL = 1750 then put #link >Hunting "**  Adan'f Blademaster 1400-1750)   **" "#var %huntingCritter adan'f blademaster;#parse CHOICE MADE!"	
	if $HSKILL = 1750 then put #link >Hunting "**         Bone wyvern (1300-1750)   **" "#var %huntingCritter Bone wyvern;#parse CHOICE MADE"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P3Undead:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**         All Ilithi Undead         **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 100 then put #link >Hunting "**   Zombie kobold savage (85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Skeletal kobold headhunter(85-110) **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Zombie kobold headhunter(85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "** Skeletal kobold savage (85-110)   **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**         FC Drowned one (90-150)   **" "#var %huntingCritter Drowned one;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Eidolon steed (100-125)   **" "#var %huntingCritter Eidolon steed;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Lanky grey lach (190-280)   **" "#var %huntingCritter Lanky grey lach;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Transparent shylvic (240-325)   **" "#var %huntingCritter Transparent shylvic;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Vaporous blood wraith (320-440)   **" "#var %huntingCritter Vaporous blood wraith;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Faenrae assassin (375-500)   **" "#var %huntingCritter Faenrae assassin;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**           Telga orek (900-1300)   **" "#var %huntingCritter Telga orek;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**         Bone wyvern (1300-1750)   **" "#var %huntingCritter Bone wyvern;#parse CHOICE MADE!"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel

     
P3Constructs:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Ilithi Constructs       **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**           Small boggle  (39-49)   **" "#var %huntingCritter Small boggle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC Quartz gargoyle (135-190)   **" "#var %huntingCritter Quartz gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Snowbeast (75-105)   **" "#var %huntingCritter Granite Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**          Ice archon (1200-1650)   **" "#var %huntingCritter Ice archon;#parse CHOICE MADE!"
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P3Living:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**    All Ilithi Living Creatures    **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**                     Rat  (0-30)   **" "#var %huntingCritter Rat2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 FC  Rat  (0-30)   **" "#var %huntingCritter Rat FC;#parse CHOICE MADE!"
	if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**             Sleazy lout  (0-35)   **" "#var %huntingCritter lout2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Fied goblin  (17-42)   **" "#var %huntingCritter boggle;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Antelope  (20-43)   **" "#var %huntingCritter Antelope;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**              Grass eel  (25-50)   **" "#var %huntingCritter Grass eel3;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Kobold  (36-49)   **" "#var %huntingCritter Kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Vykathi excavator (50-100)   **" "#var %huntingCritter Vykathi excavator;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**        Vykathi builder (50-100)   **" "#var %huntingCritter Vykathi builder;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**  Dragon Priest fanatic  (55-90)   **" "#var %huntingCritter Dragon Priest fanatic;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Rock troll (60-73)   **" "#var %huntingCritter Rock troll SHARD;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       FC Spotted bobcat (65-80)   **" "#var %huntingCritter BOBCAT 2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            FC Suw bizar (70-90)   **" "#var %huntingCritter Suw bizar;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**                  Bison (80-110)   **" "#var %huntingCritter Bison;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Rock troll (80-110)   **" "#var %huntingCritter Rock troll2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       scythewing larva (85-100)   **" "#var %huntingCritter larva;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       FC Spotted shark (90-115)   **" "#var %huntingCritter Spotted shark;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Granite gargoyle (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-belly crocodile (100-140)   **" "#var %huntingCritter ELSRALAEL;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC kashika serpent (100-160)   **" "#var %huntingCritter kashika serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Footpad (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Ruffian (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Cutthroat (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Thug (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Young prereni (120-180)   **" "#var %huntingCritter prereni1;#parse CHOICE MADE!"
	#if $HSKILL = 200 then put #link >Hunting "**         Wormwood vine (120-190)   **" "#var %huntingCritter Wormwood vine;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Dusky scythewing moth (150-190)   **" "#var %huntingCritter scythewing moth;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Shadoweaver (150-255)   **" "#var %huntingCritter Shadoweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Crag (160-185)   **" "#var %huntingCritter Crag;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter YVHH latami;#parse CHOICE MADE!"
	#if $HSKILL = 200 then put #link >Hunting "**     Vykathi harvester (160-220)   **" "#var %huntingCritter Vykathi harvester;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Small peccary (175-250)   **" "#var %huntingCritter Small peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Golden pard (180-240)   **" "#var %huntingCritter Golden pard;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-dappled prereni (180-250)   **" "#var %huntingCritter prereni2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Grizzled red leucro (200-225)   **" "#var %huntingCritter red leucro;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**       Vykathi soldier (200-270)   **" "#var %huntingCritter Vykathi soldier;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Peccary (225-300)   **" "#var %huntingCritter shard Peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Faenrae stalker (225-300)   **" "#var %huntingCritter Faenrae stalker;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Clouded arzumos;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Feral bone mastiff (245-310)   **" "#var %huntingCritter Feral bone mastiff;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elder prereni (250-300)   **" "#var %huntingCritter prereni 3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**                Nimbus (250-320)   **" "#var %huntingCritter Nimbus;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Adan'f blood warrior (250-325)   **" "#var %huntingCritter blood warrior;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**        Vykathi reaper (250-340)   **" "#var %huntingCritter Vykathi reaper;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Red-bristled gremlin (250-360)   **" "#var %huntingCritter Red-bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Adan'f shadow mage (250-370)   **" "#var %huntingCritter shadow mage;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     FC Yellow gremlin (280-410)   **" "#var %huntingCritter Yellow bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**     Sinuous elsralael (300-350)   **" "#var %huntingCritter elsralael;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Giant blade spider (300-400)   **" "#var %huntingCritter blade spider;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Gargantuan bone golem (325-380)   **" "#var %huntingCritter Gargantuan bone golem;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (320-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Robed Dragon Priest (350-500)   **" "#var %huntingCritter Robed Dragon Priest(ess);#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Adan'f spirit dancer (380-600)   **" "#var %huntingCritter spirit dancer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          Young wyvern (600-900)   **" "#var %huntingCritter Young wyvern;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**      Juvenile wyvern (700-1100)   **" "#var %huntingCritter Juvenile wyvern;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**        Adult wyvern (1000-1300)   **" "#var %huntingCritter Adult wyvern;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Adan'f Sorcerer (1400-1750)   **" "#var %huntingCritter adan'f sorcerer;#parse CHOICE MADE!"	
     if $HSKILL = 1750 then put #link >Hunting "**  Adan'f Blademaster 1400-1750)   **" "#var %huntingCritter adan'f blademaster;#parse CHOICE MADE!"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P3Boxes:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Ilithi Box Droppers     **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**             Sleazy lout  (0-35)   **" "#var %huntingCritter lout2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Fied goblin  (17-42)   **" "#var %huntingCritter boggle;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Kobold  (36-49)   **" "#var %huntingCritter Kobold;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**           Small boggle  (39-49)   **" "#var %huntingCritter Small boggle;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**  Dragon Priest fanatic  (55-90)   **" "#var %huntingCritter Dragon Priest fanatic;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Rock troll (60-73)   **" "#var %huntingCritter Rock troll SHARD;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Rock troll (80-110)   **" "#var %huntingCritter Rock troll2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Zombie kobold savage (85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Skeletal kobold headhunter(85-110) **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Zombie kobold headhunter(85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "** Skeletal kobold savage (85-110)   **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**         FC Drowned one (90-150)   **" "#var %huntingCritter Drowned one;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Granite gargoyle (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Footpad (110-150)   **" "#var %huntingCritter Footpad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Ruffian (110-150)   **" "#var %huntingCritter Ruffian;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**             Cutthroat (110-150)   **" "#var %huntingCritter Cutthroat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Thug (110-150)   **" "#var %huntingCritter Thugs;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC Quartz gargoyle (135-190)   **" "#var %huntingCritter Quartz gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Shadoweaver (150-255)   **" "#var %huntingCritter Shadoweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                  Crag (160-185)   **" "#var %huntingCritter Crag;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Lanky grey lach (190-280)   **" "#var %huntingCritter Lanky grey lach;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Faenrae stalker (225-300)   **" "#var %huntingCritter Faenrae stalker;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Transparent shylvic (240-325)   **" "#var %huntingCritter Transparent shylvic;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Adan'f blood warrior (250-325)   **" "#var %huntingCritter blood warrior;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Red-bristled gremlin (250-360)   **" "#var %huntingCritter Red-bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Adan'f shadow mage (250-370)   **" "#var %huntingCritter shadow mage;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     FC Yellow gremlin (280-410)   **" "#var %huntingCritter Yellow bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Vaporous blood wraith (320-400)   **" "#var %huntingCritter Vaporous blood wraith;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Gargantuan bone golem (325-380)   **" "#var %huntingCritter Gargantuan bone golem;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (320-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Robed Dragon Priest (350-500)   **" "#var %huntingCritter Robed Dragon Priest(ess);#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Faenrae assassin (375-500)   **" "#var %huntingCritter Faenrae assassin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Adan'f spirit dancer (380-600)   **" "#var %huntingCritter spirit dancer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**          Ice archon (1200-1650)   **" "#var %huntingCritter Ice archon;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Adan'f Sorcerer (1400-1750)   **" "#var %huntingCritter adan'f sorcerer;#parse CHOICE MADE!"	
     if $HSKILL = 1750 then put #link >Hunting "**  Adan'f Blademaster 1400-1750)   **" "#var %huntingCritter adan'f blademaster;#parse CHOICE MADE!"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P3Skins:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**        All Ilithi Skinnables      **"
	put #echo >Hunting "***************************************"
     delay 0.5	
     if ("$guild" = "Thief") then if $HSKILL = 50 then put #link >Hunting "**                     Rat  (0-30)   **" "#var %huntingCritter Rat2;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 FC  Rat  (0-30)   **" "#var %huntingCritter Rat FC;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**            Fied goblin  (17-42)   **" "#var %huntingCritter boggle;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**               Antelope  (20-43)   **" "#var %huntingCritter Antelope;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**              Grass eel  (25-50)   **" "#var %huntingCritter Grass eel3;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Kobold  (36-49)   **" "#var %huntingCritter Kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Rock troll (60-73)   **" "#var %huntingCritter Rock troll SHARD;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       FC Spotted bobcat (65-80)   **" "#var %huntingCritter BOBCAT 2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**            FC Suw bizar (70-90)   **" "#var %huntingCritter Suw bizar;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Snowbeast (75-105)   **" "#var %huntingCritter Granite Gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**                  Bison (80-110)   **" "#var %huntingCritter Bison;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Rock troll (80-110)   **" "#var %huntingCritter Rock troll2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       scythewing larva (85-100)   **" "#var %huntingCritter larva;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Zombie kobold savage (85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Skeletal kobold headhunter(85-110) **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Zombie kobold headhunter(85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "** Skeletal kobold savage (85-110)   **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       FC Spotted shark (90-115)   **" "#var %huntingCritter Spotted shark;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Granite gargoyle (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Eidolon steed (100-125)   **" "#var %huntingCritter Eidolon steed;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-belly crocodile (100-140)   **" "#var %huntingCritter ELSRALAEL;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC kashika serpent (100-160)   **" "#var %huntingCritter kashika serpent;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Young prereni (120-180)   **" "#var %huntingCritter prereni1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC Quartz gargoyle (135-190)   **" "#var %huntingCritter Quartz gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "** Dusky scythewing moth (150-190)   **" "#var %huntingCritter scythewing moth;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter YVHH latami;#parse CHOICE MADE!"
	#if $HSKILL = 200 then put #link >Hunting "**     Vykathi harvester (160-220)   **" "#var %huntingCritter Vykathi harvester;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Small peccary (175-250)   **" "#var %huntingCritter Small peccary;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Golden pard (180-240)   **" "#var %huntingCritter Golden pard;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Blue-dappled prereni (180-250)   **" "#var %huntingCritter prereni2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Lanky grey lach (190-280)   **" "#var %huntingCritter Lanky grey lach;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Grizzled red leucro (200-225)   **" "#var %huntingCritter red leucro;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**       Vykathi soldier (200-270)   **" "#var %huntingCritter Vykathi soldier;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Peccary (225-300)   **" "#var %huntingCritter shard Peccary;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Faenrae stalker (225-300)   **" "#var %huntingCritter Faenrae stalker;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Clouded arzumos;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Feral bone mastiff (245-310)   **" "#var %huntingCritter Feral bone mastiff;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elder prereni (250-300)   **" "#var %huntingCritter prereni 3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Adan'f blood warrior (250-325)   **" "#var %huntingCritter blood warrior;#parse CHOICE MADE!"
	#if $HSKILL = 300 then put #link >Hunting "**        Vykathi reaper (250-340)   **" "#var %huntingCritter Vykathi reaper;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Red-bristled gremlin (250-360)   **" "#var %huntingCritter Red-bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Adan'f shadow mage (250-370)   **" "#var %huntingCritter shadow mage;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     FC Yellow gremlin (280-410)   **" "#var %huntingCritter Yellow bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**     Sinuous elsralael (300-350)   **" "#var %huntingCritter elsralael;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Giant blade spider (300-400)   **" "#var %huntingCritter blade spider;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Adan'f spirit dancer (380-600)   **" "#var %huntingCritter spirit dancer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          Young wyvern (600-900)   **" "#var %huntingCritter Young wyvern;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**      Juvenile wyvern (700-1100)   **" "#var %huntingCritter Juvenile wyvern;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**        Adult wyvern (1000-1300)   **" "#var %huntingCritter Adult wyvern;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**         Bone wyvern (1300-1750)   **" "#var %huntingCritter Bone wyvern;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Adan'f Sorcerer (1400-1750)   **" "#var %huntingCritter adan'f sorcerer;#parse CHOICE MADE!"	
     if $HSKILL = 1750 then put #link >Hunting "**  Adan'f Blademaster 1400-1750)   **" "#var %huntingCritter adan'f blademaster;#parse CHOICE MADE!"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P3SANDB:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**   All Ilithi Skinnables and Boxes **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**            Fied goblin  (17-42)   **" "#var %huntingCritter boggle;#parse CHOICE MADE!"
	if $HSKILL = 50 then put #link >Hunting "**                 Kobold  (36-49)   **" "#var %huntingCritter Kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Rock troll (60-73)   **" "#var %huntingCritter Rock troll SHARD;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Rock troll (80-110)   **" "#var %huntingCritter Rock troll2;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**   Zombie kobold savage (85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Skeletal kobold headhunter(85-110) **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Zombie kobold headhunter(85-110)   **" "#var %huntingCritter Zombie kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "** Skeletal kobold savage (85-110)   **" "#var %huntingCritter Skeletal kobold;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Granite gargoyle (95-125)   **" "#var %huntingCritter Granite gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    FC Quartz gargoyle (135-190)   **" "#var %huntingCritter Quartz gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Lanky grey lach (190-280)   **" "#var %huntingCritter Lanky grey lach;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Faenrae stalker (225-300)   **" "#var %huntingCritter Faenrae stalker;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Adan'f blood warrior (250-325)   **" "#var %huntingCritter blood warrior;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Red-bristled gremlin (250-360)   **" "#var %huntingCritter Red-bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**    Adan'f shadow mage (250-370)   **" "#var %huntingCritter shadow mage;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     FC Yellow gremlin (280-410)   **" "#var %huntingCritter Yellow bristled gremlin;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Adan'f spirit dancer (380-600)   **" "#var %huntingCritter spirit dancer;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**       S'sugi malchata (500-700)   **" "#var %huntingCritter malchata;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Adan'f Sorcerer (1400-1750)   **" "#var %huntingCritter adanf sorcerer;#parse CHOICE MADE!"	
     if $HSKILL = 1750 then put #link >Hunting "**  Adan'f Blademaster 1400-1750)   **" "#var %huntingCritter adanf blademaster;#parse CHOICE MADE!"	
     put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P4None:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**            All Qi Critters        **"
	put #echo >Hunting "***************************************"
     delay 0.5	
     ###UNYUNS NEED BETTER ROOM NUMBERS
	if $HSKILL = 50 then put #link >Hunting "**                  Bobcat (45-65)   **" "#var %huntingCritter Bobcat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Sand sprite (50-73)   **" "#var %huntingCritter Sand sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Blueclaw sand crab (55-80)   **" "#var %huntingCritter sand crab;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Blood wolf (75-90)   **" "#var %huntingCritter Blood wolf 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Adult razortusk sow (80-105)   **" "#var %huntingCritter Adult razortusk sow;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Silver leucro (85-101)   **" "#var %huntingCritter Silver leucro;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**               Moss mey (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Adult razortusk boar (100-130)   **" "#var %huntingCritter Adult razortusk boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightweaver unyn (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (110-140)   **" "#var %huntingCritter Snow goblin1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Bawdy swain (120-150)   **" "#var %huntingCritter Bawdy swain;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Merrows (120-150)   **" "#var %huntingCritter Merrows;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (130-154)   **" "#var %huntingCritter Snow goblin2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Dark spirit (130-170)   **" "#var %huntingCritter Dark spirit3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Ghoul crow (130-175)   **" "#var %huntingCritter Ghoul crow;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Kra'hei hatchling (130-210)   **" "#var %huntingCritter Krahei hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (140-175)   **" "#var %huntingCritter Snow goblin3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                Pirate (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Heggarangi boar (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightreaver unyn (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Nipoh oshu (150-240)   **" "#var %huntingCritter Nipoh oshu;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Lachmate (150-250)   **" "#var %huntingCritter Lachmate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter Yvhh latami2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Blacktip shark (170-280)   **" "#var %huntingCritter Blacktip shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Nipoh oshu (170-290)   **" "#var %huntingCritter Nipoh oshu 2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Ur hhrki'izh (180-230)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Ochre la'heke (180-240)   **" "#var %huntingCritter Ochre laheke;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Bull shark (180-350)   **" "#var %huntingCritter Bull shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Tiger shark (190-290)   **" "#var %huntingCritter Tiger shark;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Skeletal Sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Shadefield eviscerator (200-290)   **" "#var %huntingCritter Shadefield eviscerator;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Skeletal sailor (210-300)   **" "#var %huntingCritter Skeletal sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Gaunt shadow master   (220-0)   **" "#var %huntingCritter Gaunt shadow master;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Frail darkened silhouette(220-0)   **" "#var %huntingCritter Frail darkened silhouette;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Ur hhrki'izh (225-275)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Caracal (225-345)   **" "#var %huntingCritter Caracal;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Nipoh oshu (240-350)   **" "#var %huntingCritter Nipoh oshu 3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Spectral pirate (250-325)   **" "#var %huntingCritter Spectral pirate;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Emaciated umbramagus (250-340)   **" "#var %huntingCritter umbramagus;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Sleek hele'la (250-360)   **" "#var %huntingCritter Sleek helela;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elba Darvager (260-325)   **" "#var %huntingCritter Elba Darvager;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Ghoul raven (260-360)   **" "#var %huntingCritter Ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Retan dolomar (260-410)   **" "#var %huntingCritter Retan dolomar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Graverobber (270-380)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**             River boa (275-350)   **" "#var %huntingCritter River boa;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Piranha (275-420)   **" "#var %huntingCritter Piranha;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Nightstalker unyn (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter caracal;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**            Wir dinego (300-400)   **" "#var %huntingCritter Greater ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**               Kra'hei (300-400)   **" "#var %huntingCritter Krahei;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Spider crab (300-450)   **" "#var %huntingCritter Spider crab;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Dobek moruryn (300-450)   **" "#var %huntingCritter Dobek moruryn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Sailfin lizard (300-500)   **" "#var %huntingCritter Sailfin lizard;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lun'Shele hunter (310-430)   **" "#var %huntingCritter LunShele hunter;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Greater ghoul raven (350-450)   **" "#var %huntingCritter Greater ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Snaer hafwa (350-500)   **" "#var %huntingCritter Snaer hafwa2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Spiny bloodfish (360-0)   **" "#var %huntingCritter Spiny bloodfish;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**          Telga moradu (360-400)   **" "#var %huntingCritter Telga moradu;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Lun'Shele trekhalo (370-530)   **" "#var %huntingCritter LunShele trekhalo;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**        Warklin mauler (400-500)   **" "#var %huntingCritter Warklin mauler;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Scaly seordmaor (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Armored warklin (400-600)   **" "#var %huntingCritter Armored warklin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (400-620)   **" "#var %huntingCritter celpeze1;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (450-620)   **" "#var %huntingCritter celpeze2;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (500-620)   **" "#var %huntingCritter celpeze3;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**             Poloh'izh (500-700)   **" "#var %huntingCritter Polohizh;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 800 then put #link >Hunting "**S'sugi malchata (500-700)   **" "#var %huntingCritter S'sugi malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (550-800)   **" "#var %huntingCritter celpeze4;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "** Juvi desert armadillo (600-740)   **" "#var %huntingCritter Juvenile desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Elder desert armadillo (700-1100)  **" "#var %huntingCritter Elder desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Adult desert armadillo (725-1000)  **" "#var %huntingCritter Adult desert armadillo;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel

P4Undead:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**            All Qi Undead          **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 200 then put #link >Hunting "**           Dark spirit (130-170)   **" "#var %huntingCritter Dark spirit3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Skeletal Sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Skeletal sailor (210-300)   **" "#var %huntingCritter Skeletal sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Spectral pirate (250-325)   **" "#var %huntingCritter Spectral pirate;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**            Wir dinego (300-400)   **" "#var %huntingCritter Greater ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Greater ghoul raven (350-450)   **" "#var %huntingCritter Greater ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Snaer hafwa (350-500)   **" "#var %huntingCritter Snaer hafwa2;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel
     
     
P4Constructs:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**         All Qi Constructs         **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 200 then put #link >Hunting "**              Lachmate (150-250)   **" "#var %huntingCritter Lachmate;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel
     
     
     
P4Living:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Qi Living Critters      **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 50 then put #link >Hunting "**                  Bobcat (45-65)   **" "#var %huntingCritter Bobcat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**             Sand sprite (50-73)   **" "#var %huntingCritter Sand sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Blueclaw sand crab (55-80)   **" "#var %huntingCritter sand crab;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Blood wolf (75-90)   **" "#var %huntingCritter Blood wolf 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Adult razortusk sow (80-105)   **" "#var %huntingCritter Adult razortusk sow;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Silver leucro (85-101)   **" "#var %huntingCritter Silver leucro;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**               Moss mey (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**  Adult razortusk boar (100-130)   **" "#var %huntingCritter Adult razortusk boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightweaver unyn (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (110-140)   **" "#var %huntingCritter Snow goblin1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Bawdy swain (120-150)   **" "#var %huntingCritter Bawdy swain;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Merrows (120-150)   **" "#var %huntingCritter Merrows;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (130-154)   **" "#var %huntingCritter Snow goblin2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Ghoul crow (130-175)   **" "#var %huntingCritter Ghoul crow;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Kra'hei hatchling (130-210)   **" "#var %huntingCritter Krahei hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (140-175)   **" "#var %huntingCritter Snow goblin3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                Pirate (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Heggarangi boar (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightreaver unyn (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Nipoh oshu (150-240)   **" "#var %huntingCritter Nipoh oshu;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter Yvhh latami2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Blacktip shark (170-280)   **" "#var %huntingCritter Blacktip shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Nipoh oshu (170-290)   **" "#var %huntingCritter Nipoh oshu 2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**          Ur hhrki'izh (180-230)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Ochre la'heke (180-240)   **" "#var %huntingCritter Ochre laheke;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Bull shark (180-350)   **" "#var %huntingCritter Bull shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Tiger shark (190-290)   **" "#var %huntingCritter Tiger shark;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Shadefield eviscerator (200-290)   **" "#var %huntingCritter Shadefield eviscerator;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Gaunt shadow master   (220-0)   **" "#var %huntingCritter Gaunt shadow master;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Frail darkened silhouette(220-0)   **" "#var %huntingCritter Frail darkened silhouette;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Ur hhrki'izh (225-275)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Caracal (225-345)   **" "#var %huntingCritter Caracal;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Nipoh oshu (240-350)   **" "#var %huntingCritter Nipoh oshu 3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**  Emaciated umbramagus (250-340)   **" "#var %huntingCritter umbramagus;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Sleek hele'la (250-360)   **" "#var %huntingCritter Sleek helela;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elba Darvager (260-325)   **" "#var %huntingCritter Elba Darvager;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Ghoul raven (260-360)   **" "#var %huntingCritter Ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Retan dolomar (260-410)   **" "#var %huntingCritter Retan dolomar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Graverobber (270-380)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**             River boa (275-350)   **" "#var %huntingCritter River boa;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Piranha (275-420)   **" "#var %huntingCritter Piranha;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Nightstalker unyn (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter caracal;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**               Kra'hei (300-400)   **" "#var %huntingCritter Krahei;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Spider crab (300-450)   **" "#var %huntingCritter Spider crab;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Dobek moruryn (300-450)   **" "#var %huntingCritter Dobek moruryn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Sailfin lizard (300-500)   **" "#var %huntingCritter Sailfin lizard;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lun'Shele hunter (310-430)   **" "#var %huntingCritter LunShele hunter;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Spiny bloodfish (360-0)   **" "#var %huntingCritter Spiny bloodfish;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**          Telga moradu (360-400)   **" "#var %huntingCritter Telga moradu;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Lun'Shele trekhalo (370-530)   **" "#var %huntingCritter LunShele trekhalo;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**        Warklin mauler (400-500)   **" "#var %huntingCritter Warklin mauler;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Scaly seordmaor (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Armored warklin (400-600)   **" "#var %huntingCritter Armored warklin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (400-620)   **" "#var %huntingCritter celpeze1;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (450-620)   **" "#var %huntingCritter celpeze2;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (500-620)   **" "#var %huntingCritter celpeze3;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**             Poloh'izh (500-700)   **" "#var %huntingCritter Polohizh;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 800 then put #link >Hunting "**S'sugi malchata (500-700)   **" "#var %huntingCritter S'sugi malchata;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (550-800)   **" "#var %huntingCritter celpeze4;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "** Juvi desert armadillo (600-740)   **" "#var %huntingCritter Juvenile desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Elder desert armadillo (700-1100)  **" "#var %huntingCritter Elder desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Adult desert armadillo (725-1000)  **" "#var %huntingCritter Adult desert armadillo;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel
     
P4Boxes:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**        All Qi Box Droppers        **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 100 then put #link >Hunting "**             Sand sprite (50-73)   **" "#var %huntingCritter Sand sprite;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**               Moss mey (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (110-140)   **" "#var %huntingCritter Snow goblin1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Bawdy swain (120-150)   **" "#var %huntingCritter Bawdy swain;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Merrows (120-150)   **" "#var %huntingCritter Merrows;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (130-154)   **" "#var %huntingCritter Snow goblin2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Dark spirit (130-170)   **" "#var %huntingCritter Dark spirit3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Kra'hei hatchling (130-210)   **" "#var %huntingCritter Krahei hatchling;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (140-175)   **" "#var %huntingCritter Snow goblin3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**                Pirate (140-200)   **" "#var %huntingCritter Pirate;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**              Lachmate (150-250)   **" "#var %huntingCritter Lachmate;#parse CHOICE MADE!""
	if $HSKILL = 200 then put #link >Hunting "**          Ur hhrki'izh (180-230)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Frostweaver (180-260)   **" "#var %huntingCritter Frostweaver;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Pale grey death spirit (200-250)   **" "#var %huntingCritter Skeletal Sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Shadefield eviscerator (200-290)   **" "#var %huntingCritter Shadefield eviscerator;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Skeletal sailor (210-300)   **" "#var %huntingCritter Skeletal sailor;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Gaunt shadow master   (220-0)   **" "#var %huntingCritter Gaunt shadow master;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Frail darkened silhouette(220-0)   **" "#var %huntingCritter Frail darkened silhouette;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**          Ur hhrki'izh (225-275)   **" "#var %huntingCritter Ur hhrkiizh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Spectral pirate (250-325)   **" "#var %huntingCritter Spectral pirate;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elba Darvager (260-325)   **" "#var %huntingCritter Elba Darvager;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**           Graverobber (270-380)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**            Wir dinego (300-400)   **" "#var %huntingCritter Greater ghoul raven;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**               Kra'hei (300-400)   **" "#var %huntingCritter Krahei;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Lun'Shele hunter (310-430)   **" "#var %huntingCritter LunShele hunter;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**          Telga moradu (360-400)   **" "#var %huntingCritter Telga moradu;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**    Lun'Shele trekhalo (370-530)   **" "#var %huntingCritter LunShele trekhalo;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 800 then put #link >Hunting "**S'sugi malchata (500-700)   **" "#var %huntingCritter S'sugi malchata;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel
     
P4Skins:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**          All Qi Skinnables        **"
	put #echo >Hunting "***************************************"
     delay 0.5	
	if $HSKILL = 50 then put #link >Hunting "**                  Bobcat (45-65)   **" "#var %huntingCritter Bobcat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Blueclaw sand crab (55-80)   **" "#var %huntingCritter sand crab;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**              Blood wolf (75-90)   **" "#var %huntingCritter Blood wolf 1;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**    Adult razortusk sow (80-105)   **" "#var %huntingCritter Adult razortusk sow;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**          Silver leucro (85-101)   **" "#var %huntingCritter Silver leucro;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**               Moss mey (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
     if $HSKILL = 200 then put #link >Hunting "**  Adult razortusk boar (100-130)   **" "#var %huntingCritter Adult razortusk boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightweaver unyn (100-188)   **" "#var %huntingCritter Nightweaver unyn;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (110-140)   **" "#var %huntingCritter Snow goblin1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Merrows (120-150)   **" "#var %huntingCritter Merrows;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (130-154)   **" "#var %huntingCritter Snow goblin2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Ghoul crow (130-175)   **" "#var %huntingCritter Ghoul crow;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (140-175)   **" "#var %huntingCritter Snow goblin3;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**       Heggarangi boar (150-200)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**      Nightreaver unyn (150-225)   **" "#var %huntingCritter Nightreaver unyn;#parse CHOICE MADE!"
     if $HSKILL = 200 then put #link >Hunting "**          Yvhh la'tami (160-200)   **" "#var %huntingCritter Yvhh latami2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Blacktip shark (170-280)   **" "#var %huntingCritter Blacktip shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**         Ochre la'heke (180-240)   **" "#var %huntingCritter Ochre laheke;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**            Bull shark (180-350)   **" "#var %huntingCritter Bull shark;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Tiger shark (190-290)   **" "#var %huntingCritter Tiger shark;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Caracal (225-345)   **" "#var %huntingCritter Caracal;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**       Clouded arzumos (230-340)   **" "#var %huntingCritter Heggarangi boar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Sleek hele'la (250-360)   **" "#var %huntingCritter Sleek helela;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elba Darvager (260-325)   **" "#var %huntingCritter Elba Darvager;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Retan dolomar (260-410)   **" "#var %huntingCritter Retan dolomar;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**             River boa (275-350)   **" "#var %huntingCritter River boa;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**               Piranha (275-420)   **" "#var %huntingCritter Piranha;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Nightstalker unyn (280-400)   **" "#var %huntingCritter Nightstalker unyn;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**Bristle-backed peccary (280-400)   **" "#var %huntingCritter caracal;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**           Spider crab (300-450)   **" "#var %huntingCritter Spider crab;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Dobek moruryn (300-450)   **" "#var %huntingCritter Dobek moruryn;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Sailfin lizard (300-500)   **" "#var %huntingCritter Sailfin lizard;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**         Spiny bloodfish (360-0)   **" "#var %huntingCritter Spiny bloodfish;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**        Warklin mauler (400-500)   **" "#var %huntingCritter Warklin mauler;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Scaly seordmaor (400-530)   **" "#var %huntingCritter seordmaor;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 500 then put #link >Hunting "**       Armored warklin (400-600)   **" "#var %huntingCritter Armored warklin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (400-620)   **" "#var %huntingCritter celpeze1;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Asaren celpeze (450-620)   **" "#var %huntingCritter celpeze2;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (500-620)   **" "#var %huntingCritter celpeze3;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**             Poloh'izh (500-700)   **" "#var %huntingCritter Polohizh;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 800 then put #link >Hunting "**S'sugi malchata (500-700)   **" "#var %huntingCritter S'sugi malchata;#parse CHOICE MADE!"	
	if $HSKILL = 800 then put #link >Hunting "**        Asaren celpeze (550-800)   **" "#var %huntingCritter celpeze4;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "** Juvi desert armadillo (600-740)   **" "#var %huntingCritter Juvenile desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Elder desert armadillo (700-1100)  **" "#var %huntingCritter Elder desert armadillo;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**Adult desert armadillo (725-1000)  **" "#var %huntingCritter Adult desert armadillo;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel



     
P4SANDB:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**    All Qi Skinnables and Boxes    **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 100 then put #link >Hunting "**               Moss mey (90-135)   **" "#var %huntingCritter Moss mey;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (110-140)   **" "#var %huntingCritter Snow goblin1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**               Merrows (120-150)   **" "#var %huntingCritter Merrows;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (130-154)   **" "#var %huntingCritter Snow goblin2;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Snow goblin (140-175)   **" "#var %huntingCritter Snow goblin3;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**         Elba Darvager (260-325)   **" "#var %huntingCritter Elba Darvager;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 800 then put #link >Hunting "**S'sugi malchata (500-700)   **" "#var %huntingCritter S'sugi malchata;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE
     goto $tlabel
P5None:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**      All Forfedhdar Critters      **"
	put #echo >Hunting "***************************************"
     delay 0.5
     if $HSKILL = 100 then put #link >Hunting "**        Malodorous bucca (50-65)   **" "#var %huntingCritter Stone-throwing imp;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Albino cave fish (50-100)   **" "#var %huntingCritter Albino cave fish;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Stone-throwing imp (55-70)   **" "#var %huntingCritter Stone-throwing imp;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Writhing maiden's tress (80-215)   **" "#var %huntingCritter maiden tress;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       Young cave troll (85-170)   **" "#var %huntingCritter Young cave troll;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 100 then put #link >Hunting "**          Young firecat (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Giant blight bat (90-170)   **" "#var %huntingCritter blight bat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Graverobber (100-125)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Vela'tohr bloodvine (120-195)   **" "#var %huntingCritter bloodvine;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Retch fiend (125-175)   **" "#var %huntingCritter Retch fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Mutant togball (130-165)   **" "#var %huntingCritter Mutant togball;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Lithe blight ogre (140-170)   **" "#var %huntingCritter Lithe blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Stumpy blight ogre (150-230)   **" "#var %huntingCritter Stumpy blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Rotting deadwood dryad (150-250)   **" "#var %huntingCritter Rotting deadwood dryad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Sickly blightwater nyad(160-250)   **" "#var %huntingCritter blightwater nyad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Frostweyr bear (175-225)   **" "#var %huntingCritter Frostweyr bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Giant blight ogre (180-250)   **" "#var %huntingCritter blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Sinuous ice adder (200-300)   **" "#var %huntingCritter ice adder;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**      Blue-green pivuh (220-360)   **" "#var %huntingCritter Blue-green pivuh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Cave troll (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 2;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**      Frost angiswaerd (260-340)   **" "#var %huntingCritter Frost angiswaerd;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**        Icy blue ghast (280-430)   **" "#var %huntingCritter Icy blue ghast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Armored shalswar (300-400)   **" "#var %huntingCritter shalswar;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Young forest gryphon (300-420)   **" "#var %huntingCritter YOUNG FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Dragon Priest crone (300-425)   **" "#var %huntingCritter Dragon Priest crone;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 400 then put #link >Hunting "**     Supple firecat (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (320-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Black marble gargoyle (300-540)   **" "#var %huntingCritter Black marble gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Dragon Priest purifier (350-490)   **" "#var %huntingCritter Dragon Priest purifier;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Mountain giant (375-530)   **" "#var %huntingCritter Mountain giant;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**         DP juggernaut (400-500)   **" "#var %huntingCritter Dragon Priest juggernaut;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**  Dragon Priest zealot (400-520)   **" "#var %huntingCritter Dragon Priest zealot;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**    Vile plague wraith (450-630)   **" "#var %huntingCritter Vile plague wraith;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Zombie stomper (460-625)   **" "#var %huntingCritter Zombie stomper;#parse CHOICE MADE!"
	#if $HSKILL = 500 then put #link >Hunting "**       Giant snow hawk (460-670)   **" "#var %huntingCritter Giant snow hawk;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**          Black goblin (460-720)   **" "#var %huntingCritter Black goblin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**             Black ape (490-750)   **" "#var %huntingCritter Black ape;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**         Zombie mauler (500-670)   **" "#var %huntingCritter Zombie mauler;#parse CHOICE MADE!"
	#if $HSKILL = 800 then put #link >Hunting "**         Enraged tusky (500-750)   **" "#var %huntingCritter Enraged tusky;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**  Zombie head-splitter (600-733)   **" "#var %huntingCritter Zombie head-splitter;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**           DP assassin (750-1100)   **" "#var %huntingCritter Dragon Priest assassin;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Lesser NorthWind banshee (900-1300)   **" "#var %huntingCritter banshee;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**      DP intercessor (950-1300)   **" "#var %huntingCritter intercessor;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**  Fuligin Umbral Moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH BOAR;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**          Ice Archon (1200-1600)   **" "#var %huntingCritter Ice archon;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**           Jeol Moradu (1300-1750)   **" "#var %huntingCritter jeol moradu;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**       Shadowfrost Moth(1450-1750) **" "#var %huntingCritter SHADOWFROST MOTH;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Void-Black Umbral Moth(1500-1750) **" "#var %huntingCritter VOID MOTH BOAR;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P5Undead:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**       All Forfedhdar Undead       **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 100 then put #link >Hunting "**       Giant blight bat (90-170)   **" "#var %huntingCritter blight bat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Mutant togball (130-165)   **" "#var %huntingCritter Mutant togball;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Rotting deadwood dryad (150-250)   **" "#var %huntingCritter Rotting deadwood dryad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Sickly blightwater nyad(160-250)   **" "#var %huntingCritter blightwater nyad;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Sinuous ice adder (200-300)   **" "#var %huntingCritter ice adder;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**        Icy blue ghast (280-430)   **" "#var %huntingCritter Icy blue ghast;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**    Vile plague wraith (450-630)   **" "#var %huntingCritter Vile plague wraith;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Zombie stomper (460-625)   **" "#var %huntingCritter Zombie stomper;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**         Zombie mauler (500-670)   **" "#var %huntingCritter Zombie mauler;#parse CHOICE MADE!"
	#if $HSKILL = 800 then put #link >Hunting "**         Enraged tusky (500-750)   **" "#var %huntingCritter Enraged tusky;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**  Zombie head-splitter (600-733)   **" "#var %huntingCritter Zombie head-splitter;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P5Constructs:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**     All Forfedhdar Constructs     **"
	put #echo >Hunting "***************************************"
     delay 0.5
	if $HSKILL = 400 then put #link >Hunting "** Black marble gargoyle (300-540)   **" "#var %huntingCritter Black marble gargoyle;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P5Living:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**   All Forfedhdar Living Critters  **"
	put #echo >Hunting "***************************************"
     delay 0.5
     if $HSKILL = 100 then put #link >Hunting "**        Malodorous bucca (50-65)   **" "#var %huntingCritter Stone-throwing imp;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Albino cave fish (50-100)   **" "#var %huntingCritter Albino cave fish;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**      Stone-throwing imp (55-70)   **" "#var %huntingCritter Stone-throwing imp;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Writhing maiden's tress (80-215)   **" "#var %huntingCritter maiden tress;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       Young cave troll (85-170)   **" "#var %huntingCritter Young cave troll;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 100 then put #link >Hunting "**          Young firecat (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Graverobber (100-125)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**   Vela'tohr bloodvine (120-195)   **" "#var %huntingCritter bloodvine;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Retch fiend (125-175)   **" "#var %huntingCritter Retch fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Lithe blight ogre (140-170)   **" "#var %huntingCritter Lithe blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Stumpy blight ogre (150-230)   **" "#var %huntingCritter Stumpy blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Frostweyr bear (175-225)   **" "#var %huntingCritter Frostweyr bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Giant blight ogre (180-250)   **" "#var %huntingCritter blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**      Blue-green pivuh (220-360)   **" "#var %huntingCritter Blue-green pivuh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Cave troll (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 2;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**      Frost angiswaerd (260-340)   **" "#var %huntingCritter Frost angiswaerd;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Armored shalswar (300-400)   **" "#var %huntingCritter shalswar;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Young forest gryphon (300-420)   **" "#var %huntingCritter YOUNG FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Dragon Priest crone (300-425)   **" "#var %huntingCritter Dragon Priest crone;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 400 then put #link >Hunting "**     Supple firecat (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (300-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Dragon Priest purifier (350-490)   **" "#var %huntingCritter Dragon Priest purifier;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Mountain giant (375-530)   **" "#var %huntingCritter Mountain giant;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**         DP juggernaut (400-500)   **" "#var %huntingCritter Dragon Priest juggernaut;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**  Dragon Priest zealot (400-520)   **" "#var %huntingCritter Dragon Priest zealot;#parse CHOICE MADE!"
	#if $HSKILL = 500 then put #link >Hunting "**       Giant snow hawk (460-670)   **" "#var %huntingCritter Giant snow hawk;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**          Black goblin (460-720)   **" "#var %huntingCritter Black goblin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**             Black ape (490-750)   **" "#var %huntingCritter Black ape;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          DP assassin (750-1100)   **" "#var %huntingCritter Dragon Priest assassin;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**Lesser North Wind banshee (900-1300)   **" "#var %huntingCritter banshee;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**       DP intercessor (950-1300)   **" "#var %huntingCritter intercessor;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**  Fuligin Umbral moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH BOAR;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**       Shadowfrost Moth(1450-1750) **" "#var %huntingCritter SHADOWFROST MOTH;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Void-Black umbral moth(1500-1750) **" "#var %huntingCritter VOID MOTH BOAR;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P5Boxes:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**    All Forfedhdar Box Droppers    **"
	put #echo >Hunting "***************************************"
     delay 0.5
     if $HSKILL = 100 then put #link >Hunting "**        Malodorous bucca (50-65)   **" "#var %huntingCritter Stone-throwing imp;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**Writhing maiden's tress (80-215)   **" "#var %huntingCritter maiden tress;#parse CHOICE MADE!"
	#if $HSKILL = 100 then put #link >Hunting "**       Young cave troll (85-170)   **" "#var %huntingCritter Young cave troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Graverobber (100-125)   **" "#var %huntingCritter Graverobber1;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**           Retch fiend (125-175)   **" "#var %huntingCritter Retch fiend;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Lithe blight ogre (140-170)   **" "#var %huntingCritter Lithe blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Stumpy blight ogre (150-230)   **" "#var %huntingCritter Stumpy blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Rotting deadwood dryad (150-250)   **" "#var %huntingCritter Rotting deadwood dryad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**Sickly blightwater nyad(160-250)   **" "#var %huntingCritter blightwater nyad;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Giant blight ogre (180-250)   **" "#var %huntingCritter blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Cave troll (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Armored shalswar (300-400)   **" "#var %huntingCritter shalswar;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Dragon Priest crone (300-425)   **" "#var %huntingCritter Dragon Priest crone;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Black marble gargoyle (300-540)   **" "#var %huntingCritter Black marble gargoyle;#parse CHOICE MADE!"
     if $HSKILL = 400 then put #link >Hunting "**Dragon Priest sentinel (300-460)   **" "#var %huntingCritter Dragon Priest sentinel;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**Dragon Priest purifier (350-490)   **" "#var %huntingCritter Dragon Priest purifier;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**        Mountain giant (375-530)   **" "#var %huntingCritter Mountain giant;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**         DP juggernaut (400-500)   **" "#var %huntingCritter Dragon Priest juggernaut;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**  Dragon Priest zealot (400-520)   **" "#var %huntingCritter Dragon Priest zealot;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**    Vile plague wraith (450-630)   **" "#var %huntingCritter Vile plague wraith;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**        Zombie stomper (460-625)   **" "#var %huntingCritter Zombie stomper;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**          Black goblin (460-720)   **" "#var %huntingCritter Black goblin;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**         Zombie mauler (500-670)   **" "#var %huntingCritter Zombie mauler;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**  Zombie head-splitter (600-733)   **" "#var %huntingCritter Zombie head-splitter;#parse CHOICE MADE!"
	if $HSKILL = 800 then put #link >Hunting "**          DP assassin (750-1100)   **" "#var %huntingCritter Dragon Priest assassin;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "**       DP intercessor (950-1300)   **" "#var %huntingCritter intercessor;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**          Ice archon (1200-1600)   **" "#var %huntingCritter Ice archon;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**    Jeol Moradu (1300-1750)   **" "#var %huntingCritter jeol moradu;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
     
P5Skins:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**     All Forfedhdar Skinnables     **"
	put #echo >Hunting "***************************************"
     delay 0.5
	#if $HSKILL = 100 then put #link >Hunting "**       Young cave troll (85-170)   **" "#var %huntingCritter Young cave troll;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 100 then put #link >Hunting "**          Young firecat (90-140)   **" "#var %huntingCritter Young firecat;#parse CHOICE MADE!"
	if $HSKILL = 100 then put #link >Hunting "**       Giant blight bat (90-170)   **" "#var %huntingCritter blight bat;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Mutant togball (130-165)   **" "#var %huntingCritter Mutant togball;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Lithe blight ogre (140-170)   **" "#var %huntingCritter Lithe blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Stumpy blight ogre (150-230)   **" "#var %huntingCritter Stumpy blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**        Frostweyr bear (175-225)   **" "#var %huntingCritter Frostweyr bear;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Giant blight ogre (180-250)   **" "#var %huntingCritter blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**     Sinuous ice adder (200-300)   **" "#var %huntingCritter ice adder;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**      Blue-green pivuh (220-360)   **" "#var %huntingCritter Blue-green pivuh;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Cave troll (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**   Baby forest gryphon (250-350)   **" "#var %huntingCritter BABY FOREST GRYPHON 2;#parse CHOICE MADE!"
     if $HSKILL = 300 then put #link >Hunting "** Fledg forest gryphon  (250-380)   **" "#var %huntingCritter FLEDGLING FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**        Icy blue ghast (280-430)   **" "#var %huntingCritter Icy blue ghast;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Armored shalswar (300-400)   **" "#var %huntingCritter shalswar;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**  Young forest gryphon (300-420)   **" "#var %huntingCritter YOUNG FOREST GRYPHON 2;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**   Dragon Priest crone (300-425)   **" "#var %huntingCritter Dragon Priest crone;#parse CHOICE MADE!"
	#NEED TO ADD if $HSKILL = 400 then put #link >Hunting "**     Supple firecat (300-450)   **" "#var %huntingCritter Supple firecat;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Black marble gargoyle (300-540)   **" "#var %huntingCritter Black marble gargoyle;#parse CHOICE MADE!"
	#if $HSKILL = 500 then put #link >Hunting "**       Giant snow hawk (460-670)   **" "#var %huntingCritter Giant snow hawk;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**          Black goblin (460-720)   **" "#var %huntingCritter Black goblin;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**             Black ape (490-750)   **" "#var %huntingCritter Black ape;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**  Fuligin Umbral moth(1100-1,500)  **" "#var %huntingCritter FULIGIN MOTH BOAR;#parse CHOICE MADE!"
     if $HSKILL = 1750 then put #link >Hunting "**       Shadowfrost Moth(1450-1750) **" "#var %huntingCritter SHADOWFROST MOTH;#parse CHOICE MADE!"
	if $HSKILL = 1750 then put #link >Hunting "** Void-Black umbral moth(1500-1750) **" "#var %huntingCritter VOID MOTH BOAR;#parse CHOICE MADE!"
	#if $HSKILL = 800 then put #link >Hunting "**         Enraged tusky (500-750)   **" "#var %huntingCritter Enraged tusky;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel
     
P5SANDB:
	put #echo >Hunting
	put #echo >Hunting "***************************************"
	put #echo >Hunting "**All Forfedhdar Skinnables and Boxes**"
	put #echo >Hunting "***************************************"
     delay 0.5
	#if $HSKILL = 100 then put #link >Hunting "**       Young cave troll (85-170)   **" "#var %huntingCritter Young cave troll;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Lithe blight ogre (140-170)   **" "#var %huntingCritter Lithe blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**    Stumpy blight ogre (150-230)   **" "#var %huntingCritter Stumpy blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 200 then put #link >Hunting "**     Giant blight ogre (180-250)   **" "#var %huntingCritter blight ogre;#parse CHOICE MADE!"
	if $HSKILL = 300 then put #link >Hunting "**            Cave troll (240-375)   **" "#var %huntingCritter Cave troll;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "**      Armored shalswar (300-400)   **" "#var %huntingCritter shalswar;#parse CHOICE MADE!"
	if $HSKILL = 400 then put #link >Hunting "** Black marble gargoyle (300-540)   **" "#var %huntingCritter Black marble gargoyle;#parse CHOICE MADE!"
	if $HSKILL = 500 then put #link >Hunting "**          Black goblin (460-720)   **" "#var %huntingCritter Black goblin;#parse CHOICE MADE!"
	put #echo >Hunting "***************************************"
	put #echo >Hunting
	put #echo >Hunting "Choose the monster you are fighting."
	put #echo >Hunting
     put #tvar tlabel CHOICE_END
     delay 0.5
     put #link >Hunting "Or CLICK HERE to return" "#tvar tlabel HRANGE;#parse CHOICE MADE!"
	waitforre ^CHOICE MADE\!
	goto $tlabel

CHOICE_END:
     if "%BACKTRAINCHECK" = "DONE" then goto CHOICE_END_1
     put #clear Hunting
     put #echo >Hunting 
     put #echo >Hunting "****************"
     put #echo >Hunting "**Backtraining**"
     put #echo >Hunting "****************"
     delay 0.5
	put #echo >Hunting
     put #link >Hunting {**     Yes    **} "#tvar Province YES;#parse CHOICE MADE!"
     put #link >Hunting {**     No     **} "#tvar Province NO;#parse CHOICE MADE!"
     put #echo >Hunting "****************" 
	put #echo >Hunting 
     put #echo >Hunting "Please select if you need to choose a backtraining creature."
     put #echo >Hunting 
     waitforre ^CHOICE MADE\!
     var BACKTRAINCHECK DONE
     if ("$Province" = "YES") then 
          {
          var hunting backtrain
          goto Province
          }
CHOICE_END_1:
     var link 1
     var linkCOMBAT.CRITTER $mainCritter
     var linkBACKTRAIN.CRITTER $backtrainCritter
     put #window hide Hunting