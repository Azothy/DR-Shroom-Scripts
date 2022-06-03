#debug 5
#MasterCraft - by Shroom
# A crafting script suite...
#v 0.1.7
#
# Script Usage: .carve <item>					--carves the item from bone
#				.carve <item> <stone size>		--carves the item from the stone size specified (ie pebble, rock, stone, boulder)
#
#   This script is used in conjunction with the mastercraft.cmd script, and is used to carve items from bone and stone.
#
#	To use it with bone, hold the material to be used, study your instructions, then start the script.
#	To use it with stone, have the stone in hand or on the floor, study your instructions, then start the script.
#
#	Due to the dual material nature of carving and the difficulty in managing stone deeds, repeating is not available for CARVE.CMD.
#
#	Be sure to have all the relevant carving tools in your engineering bag, as well as any parts to be assembled. If you have a
#	Maker's Mark, be sure that it is also on you if your character profile in MC INCLUDE.cmd is toggled to mark items.
#
#	If you are holding an unfinished item instead, this script will try to finish it for you.
#

var rock stack
var chisel saw
var current.lore Engineering
if_2 var rock %2
if_1 put #var MC.order.noun %1
var Action carve
var polish.gone 0
include mc_include.cmd


if "%rock" != "stack" then var chisel chisel

action var Action riffler when notice several rough, jagged (shards|edges) protruding|rubbing the .* with a riffler set
action var Action rasp when and determine it is no longer level|has developed an uneven texture|are uneven|is uneven|scraping the .* with a rasp
action var Action polish when some discolored areas on|applying some polish to 
action var Action carve when ^carve .* with my %chisel|^scrape .* with my rasp|^rub .* with my riffler|^apply my polish to .*|appears free of defects that would impede further carving|anything that would prevent carving|ready for further carving
action var Action assemble when ^\[Ingredients can
action (work) goto Retry when \.\.\.wait|type ahead
action goto done when ^Applying the final touches|You cannot figure out how to do that

action (order) var polish.order $1 when (\d+)\)\..*jar of surface polish.*(Lirums|Kronars|Dokoras)
action var polish.gone 1 when ^The polish is all used up, so you toss it away.

action var assemble $1 when another finished \S+ shield (handle)
action var assemble $1 when another finished wooden (hilt|haft)
action var assemble $1 $2 when another finished (long|short|small|large) leather (cord|backing)
action var assemble $1 $2 when another finished (small|large) cloth (padding)
action var assemble $1 $2 when another finished (long|short) wooden (pole)

#fix polish ordering, don't leave room with item in it!

StudyBook:
     pause 0.1
     if (($concentration > 99) && ($Arcana.LearningRate < 30)) then 
          {
          pause 0.0001
          pause 0.0001
          send exhale my crystal
          pause 0.5
          }
     send khri prowess hasten darken strike serenity focus
     pause 2
     pause
     pause 0.1
     pause 0.1
     pause 0.001
     pause 0.001
	send get my carv book
	send study my book
	waitforre Roundtime|You|What
	pause
	pause
	pause 0.5
	send put my book in my %engineering.storage
	pause 0.8
	
unfinished:
	if "%rock" != "stack" then goto first.carve
	send glance
	waitforre ^You glance down (.*)\.$
	pause 1
	if contains("$0", "unfinished") then
	{
	send analyze my $MC.order.noun
	waitforre ^You.*analyze
	pause 0.1
	if !contains("$lefthandnoun", "$MC.order.noun") then send swap
	pause 1
	goto work
	}

first.carve:
	pause 0.1
	pause 0.1
	if contains("$righthandnoun", "%rock") then send swap
	pause 0.5
	if ((contains("$lefthandnoun", "%rock")) && ("%rock" != "stack")) then send drop my $lefthandnoun
	pause 0.5
     pause 0.2
     pause 0.1
	if !contains("$righthandnoun", "%chisel") then
	{
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
      pause 0.2
	 send get my %chisel
	 waitforre ^You get|^You are already
	}
	 matchre excess and place the excess (.+) off to the side|cut off the excess material
	 matchre work Roundtime: \d+
	 send carve my %rock with my %chisel
	matchwait

excess:
	pause
	if "%rock" != "stack" then
	{
	 var extra $0
	 if "%extra" = "pebble" then
	 {
	 send get pebble
	 waitforre ^You pick up|^You are already
	 send put my pebble in my %engineering.storage
	 waitforre ^You put
	 goto work
	 }
	 send get packet
	 wait
	 send push %extra with my packet
	 wait
	 send stow my packet
	 wait
	 send get deed
	 wait
	 send put my deed in my %engineering.storage
	 wait
	 goto work
	}
	else
	{
	 send put my %chisel in my %engineering.storage
	 wait
	 send get stack
	 wait
	 send put my stack in my %engineering.storage
	 wait
	 goto work
	}
	 
work:
action (work) on
save %Action
gosub %Action
goto work

carve:
	pause 0.1
     pause 0.1
	pause 0.1
	if !contains("$righthandnoun", "%chisel") then
	{
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
	 send get my %chisel
	 waitforre ^You get|^You are already
	}
	 send carve $MC.order.noun with my %chisel
	 pause 1
	return

riffler:
	pause 0.1
	pause 0.1
	if !contains("$righthandnoun", "riffler") then
	{
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
	 send get my riffler
	 waitforre ^You get|^You are already
	}
	 send rub $MC.order.noun with my riffler
	 pause 1
	return

rasp:
	pause 0.1
	pause 0.1
	if !contains("$righthandnoun", "rasp") then
	{
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
	 send get my rasp
	 waitforre ^You get|^You are already
	}
	 send scrape $MC.order.noun with my rasp
	 pause 1
	return

polish:
	pause 0.1
	pause 0.1
	if %polish.gone = 1 then gosub new.tool
	if !contains("$righthandnoun", "polish") then
	{
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
	 send get my polish
	 waitforre ^You get|^You are already
	}
	 send apply my polish to $MC.order.noun
	 pause 1
	return

assemble:
	pause 0.1
	if "$righthandnoun" != "%assemble" then
	{
	 pause 1
	 pause 0.1
	 if ("$righthand" != "Empty") then send put my $righthandnoun in my %engineering.storage
	 send get my %assemble
	 waitforre ^You get|^You are already
	}
	 send assemble $MC.order.noun with my %assemble
	 pause 1
	 send analyze $MC.order.noun
	 pause 1
	return

new.tool:
	pause 0.1
	pause 0.1
	if !contains("$scriptlist", "mastercraft.cmd") then return
	 var temp.room $roomid
	 gosub check.location
	if %polish.gone = 1 then
		{
		 gosub automove %tool.room
		 if !("$righthand" = "Empty" || "$lefthand" = "Empty") then send put my $MC.order.noun in my %engineering.storage
		 action (order) on
		 send order
		 pause .5
		 action (order) off
		 gosub purchase order %polish.order
		 pause 0.1
		 send put my polish in my %engineering.storage
		 waitforre ^You put
		 if (("$righthandnoun" != "$MC.order.noun" && "$lefthandnoun" != "$MC.order.noun") && ("%rock" = "stack")) then send get my $MC.order.noun from my %engineering.storage
		 var polish.gone 0
		}
	 gosub automove %temp.room
	 unvar temp.room
	return

purchase:
     var purchase $0
     goto purchase2
purchase.p:
     pause 0.5
purchase2:
     matchre purchase.p type ahead|...wait|Just order it again
	matchre lack.coin you don't have enough coins|you don't have that much
     matchre return pay the sales clerk|takes some coins from you
	put %purchase
    matchwait

lack.coin:
	if contains("$scriptlist", "mastercraft.cmd") then put #parse LACK COIN
	else echo *** You need some startup coin to purchase stuff! Go to the bank and try again!
	exit

Retry:
	pause 1
	var Action %s
	goto work

return:
	return

done:
	pause 0.1
	pause 0.1
	if %polish.gone = 1 then gosub new.tool
	send put my $righthandnoun in my %engineering.storage
	wait
	if "$lefthandnoun" = "$MC.order.noun" then send swap
	pause 1
     put get my %rock
	gosub mark
	put #parse CARVING DONE
	exit
