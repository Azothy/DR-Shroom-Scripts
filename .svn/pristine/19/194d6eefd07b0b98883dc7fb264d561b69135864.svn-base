# If including this in another script
# please set %origami, %origamiloc, and %singlefold in the parent
# origami == the pattern name (cat, etc...)
# origamiloc == the origamiInstructions / primer / grimoire location (in my cloak, etc...)
# origcalled == controls how the script ends (return vs. exit)
# singlefold == One complete fold or keep going
var origamiLoc %origamiLoc
var origamiBag $origamiBag
var origami2Bag $origami2Bag
var origcalled no
var singlefold no

InstructionsSet:
    put #var origamiInstructions jackal
    if $Mechanical_Lore.Ranks > 125 then put #var origamiInstructions silverfish
    if $Mechanical_Lore.Ranks > 200 then put #var origamiInstructions cat
    if $Mechanical_Lore.Ranks > 270 then put #var origamiInstructions mouse
    if $Mechanical_Lore.Ranks > 350 then put #var origamiInstructions wolverine
    if $Mechanical_Lore.Ranks > 400 then put #var origamiInstructions raven
    if $Mechanical_Lore.Ranks > 450 then put #var origamiInstructions cow
    if $Mechanical_Lore.Ranks > 500 then put #var origamiInstructions goshawk
    if $Mechanical_Lore.Ranks > 550 then put #var origamiInstructions viper
    if $Mechanical_Lore.Ranks > 575 then put #var origamiInstructions donkey
    if $Mechanical_Lore.Ranks > 625 then put #var origamiInstructions unicorn
    if $Mechanical_Lore.Ranks > 695 then put #var origamiInstructions lion
    if $Mechanical_Lore.Ranks > 730 then put #var origamiInstructions mongoose
    if $Mechanical_Lore.Ranks > 780 then put #var origamiInstructions raccoon
    if $Mechanical_Lore.Ranks > 820 then put #var origamiInstructions cobra
    if $Mechanical_Lore.Ranks > 850 then put #var origamiInstructions welkin
    if $Mechanical_Lore.Ranks > 895 then put #var origamiInstructions scorpion
    if $Mechanical_Lore.Ranks > 945 then put #var origamiInstructions spider
    if $Mechanical_Lore.Ranks > 995 then put #var origamiInstructions phoenix
Set.Global:
    put #var origami %origamiInstructions
    put #var save
origami.start:
     pause 0.1
	if $Mechanical_Lore.LearningRate > 32 then goto origami.done
	if (("$righthand") != ("Empty")) then 
	{
		var rightitem $righthand
		put stow right
	}
	if (("$lefthand") != ("Empty")) then
	{
		var leftitem $lefthand
		put stow left
	}

origami.begin:
     pause 0.1
	matchre origami.begin ^\.\.\.wait|^Sorry\,
	matchre origami.pull.envelope You must be either|What were you
	matchre origami.study You get a|You are already holding that
	put get my paper
	matchwait

origami.pull.envelope:
     pause 0.1
	matchre origami.pull.envelope ^\.\.\.wait|^Sorry\,
	matchre origami.new The envelope is|afraid that you
	matchre origami.get.envelope You must be either
	matchre origami.study You get a|You need to have one hand
	match origami.pull.envelope Roundtime
	put pull my env
	matchwait

origami.new:
	pause 0.5
	put poke my env
	waitforre ^You|^What were you|^I could

origami.get.envelope:
     pause 0.1
	matchre origami.get.envelope ^\.\.\.wait|^Sorry\,
	matchre origami.new ^But that is
	matchre origami.outof.envelopes ^What were you|^I could not
	matchre origami.pull.envelope ^You get|^You pick
	put get env 
	matchwait

origami.outof.envelopes:
	echo **** YOU HAVE RUN OUT OF ENVELOPES, GET MORE ****
	put #echo >Log Orange ***** Out of ORIGAMI ENVELOPES *****
	put #parse ORIGAMI.ENVELOPES.OUT
	goto origami.done

origami.wear.envelope:
	pause 0.5
	put wear my env
	waitfor You attach
	goto origami.begin

origami.study:
     pause 0.001
     pause 0.001
     pause 0.1
     if (("$righthand") = ("wad of paper")) then 
          {
          send drop paper
          pause 0.2
          goto origami.begin
          }
	if "$righthandnoun" = "envelope" then 
	{
          put put env in my %origamiBag
          pause 0.5
          put put env in my %origami2Bag
          pause 0.5
          pause 0.3
	}
     pause 0.2
	if "$righthand" = "Empty" then send swap
	if "%origamiLoc" = "grimoire" then goto origami.grim.get
	matchre origami.study ^\.\.\.wait|^Sorry\,
	matchre origami.start You need to be holding 
	matchre origami.check.exp You study|You've already started
	match origami.study Roundtime
	put study my $origamiInstructions instru
	matchwait

origami.grim.get:
     pause 0.1
	put get my origami grimoire
	waitforre You get|You are
	put open my grimoire
	waitforre open your|already open
	goto origami.grim.study
	
origami.grim.study:
	pause 0.1
	matchre origami.grim.study ^\.\.\.wait|^Sorry\,
	matchre origami.start You need to be holding 
	matchre origami.grim.exp You study|You've already started
	match origami.grim.study Roundtime
	put study my $origamiInstructions instru
	matchwait

origami.grim.exp:
     pause 0.1
	put close my grimoire
	waitforre close your|already closed
	put stow my grimoire
	waitforre You put|What were you|Stow what
	goto origami.check.exp

origami.check.exp:
#	put expe
#	waitfor EXP HELP
	if $Mechanical_Lore.LearningRate > 32 then goto origami.done
	else goto origami.fold

origami.fold:
	pause 0.1
	matchre origami.fold ^\.\.\.wait|^Sorry\,
	matchre origami.start You must|what
     matchre origami.fail ^You need to use origami paper|your project is ruined
	matchre origami.fold.complete You make the final fold|What were you
	match origami.check.exp Roundtime
	put fold my paper
	matchwait

origami.fail:
     put #echo >Log *** DOH! Failed. These origamiInstructionss are too difficult. Switch to an easier one.
     pause 0.1
     send drop paper
     pause 0.2
     pause 0.1
     goto origami.fold.complete.2

origami.fold.complete:
	pause 0.5
	matchre origami.fold.complete ^\.\.\.wait|^Sorry\,
	matchre origami.fold.complete.2 You drop|tattered remains|You crumple up|You slowly|You exhale|Smoking commands are
	if "$righthandnoun" == "mask" then put drop mask
	if "$righthandnoun" == "crown" then put drop crown
	else put exhale my $origamiInstructions
	matchwait 10

origami.fold.complete.2:
          if (($concentration > 99) && ($Arcana.LearningRate < 30)) then 
          {
          pause 0.0001
          pause 0.0001
          send exhale my crystal
          pause 0.2
          }
	if "%singlefold" = "yes" then return
	else goto origami.start

origami.done:
	pause
	if "$righthand" != "Empty" then put stow right
	if "$lefthand" != "Empty" then put stow left
	pause 0.5
	if "%origcalled" = "no"  then
	{
		put glance
		put #parse DONE FOLDING
		put #parse DONE MECH
		exit
	}
	else
	put #parse DONE FOLDING	
	put #parse DONE MECH
	return