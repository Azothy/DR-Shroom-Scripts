#debug 10
# ------------------------------------------------
# Auto Repair Retriever Ver 1.2
# By VTCifer
# ------------------------------------------------


#---------------------------------------
# INCLUDES
#---------------------------------------
include base.cmd
goto SubSkip
#---------------------------------------
# Local Subroutines
#---------------------------------------
SubSkip:

#---------------------------------------
# CONSTANT VARIABLES
#---------------------------------------
	var Repairer.List Ylono|Kamze|Unspiek|Wyla|Ladar|Catrox|Dagul|Granzer

#---------------------------------------
# VARIABLES
#---------------------------------------
	var ItemList
	var NounList
	var MaxItemCount
	var Source
	var ItemCount 1
	var Name
     var Bag backpack
#---------------------------------------
# ACTIONS
#---------------------------------------
	action (sack) var ItemList $1 when ^In the .+ you see (.*)\.

#---------------------------------------
# SCRIPT START
#---------------------------------------
	Start:
		if ("$righthand" = "large sack") then goto Check.Item
		if ("$lefthand" != "Empty") then gosub STOWING
		if ("$righthand" != "Empty") then gosub STOWING
		if matchre("$roomdesc" "(%Repairer.List)") then var Name $0
		if "%Name" = "" then 
		{
			if matchre("$roomobjs" "(%Repairer.List)") then var Name $0
		}

		if "%Name" = "" then goto done.repair

	Get.Ticket:
	pause 0.5
		gosub Get %Name ticket
		pause 0.5
		if ("$righthand" == "Empty") then goto done.repair
	Give.Ticket:
          matchre WaitRepair Well that is almost done|isn't gonna be done
		matchre Check.Item ^You hand (%Repairer.List) your ticket and are handed back
		put give %Name
		matchwait
	WaitRepair:
		pause 15
		goto Give.Ticket
		
	Check.Item:
		action (sack) off
		if ("$righthandnoun" = "ball and chain") then put stow my ball
		pause 0.1
		pause 0.1
          if matchre("$righthand","(sieve|mixing stick|mortar|pestle) then
               {
               put tie $righthand to my alc belt
               pause 0.5
               }
		if ("$righthandnoun" != "sack") then
		{
			put wear my $righthandnoun
			pause 0.2
			put stow my $righthandnoun in my %Bag
			pause 0.3
			goto Get.Ticket
		}
		action (sack) on

		Get.Item.List:
               pause 0.1
			send look in my sack
			waitfor In the
			pause
			gosub Base.ListExtract ItemList NounList MaxItemCount
			goto get2

		Get2:
			if (%ItemCount > %MaxItemCount) then goto CheckSource
			gosub Get %NounList(%ItemCount) from my sack
			put wear my %NounList(%ItemCount)
			put stow my %NounList(%ItemCount)
			pause 0.5
               pause 0.2
			math ItemCount add 1
			goto Get2
	
		CheckSource:
               pause 0.5
               pause 0.5
			match SackDone There is nothing in there.
			match Fail You glance 
			put look in my sack
			put glance
			matchwait

		SackDone:
               pause
			send drop my sack
			goto Get.Ticket
	
	done.repair:
	put #parse REPAIR DONE
	put #parse REPAIR DONE
		exit
	Fail:
		echo ***
		echo ***
		echo Still Items in the sack!
		echo ***
		echo ***
	put #parse REPAIR DONE
		exit

	Dumb: