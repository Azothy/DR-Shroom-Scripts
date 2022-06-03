#debug 10
# ------------------------------------------------
# Auto Repairer Ver 1.2
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
	if def(Repair.Item.List) then var Item.List $Repair.Item.List
	else var Item.List 
	eval MaxItems count("%Item.List","|")
#---------------------------------------
# VARIABLES
#---------------------------------------
	Var Name
	var CurrentItem -1
#---------------------------------------
# ACTIONS
#---------------------------------------

#---------------------------------------
# SCRIPT START
#---------------------------------------
	Start:
		if ("$lefthand" != "Empty") then gosub STOWING
		if ("$righthand" != "Empty") then gosub STOWING
		if matchre("$roomdesc" "(%Repairer.List)") then var Name $0
		if "%Name" = "" then 
		{
			if matchre("$roomobjs" "(%Repairer.List)") then var Name $0
		}
		if "%Name" = "" then exit
	Repair.All:
		matchre False.Alarm There isn't a scratch on that|I will not repair something that isn't broken
		#match Repair.List.Loop 
		match NoMoney You will need more coin if I am to be repairing that!
		match Stow.Right Please don't lose this ticket!
		put ask %Name about repair all
		put ask %Name about repair all
		matchwait
		
	Repair.List.Loop:
		math CurrentItem add 1
		if %CurrentItem > %MaxItems || "%Item.List" = "" then goto END.SCRIPT
		gosub Get %Item.List(%CurrentItem)
		if ("$righthand" == "Empty" then goto Repair.List.Loop
	Repair.List.Item:
		match NoMoney You will need more coin if I am to be repairing that!
		match Stow.Right I will not repair something that isn't broken.
		match Stow.Right Please don't lose this ticket!
		put give %Name
		put give %Name
		matchwait
		
	Stow.Right:
		gosub STOWING
		goto Repair.List.Loop
	NoMoney:
	put #parse NO MONEY FOR REPAIR
		exit
	END.SCRIPT:
     put #parse DONE
	put #parse DONE
	exit
	False.Alarm:
	echo
	echo *** False alarm or bad appraisal! No damage to gear no need to repair. 
	echo
     put #parse NONE
	put #parse NONE
	pause 0.1
	pause 0.1
	pause 0.1
	pause 0.1
	goto END.SCRIPT