     # Tool Repair script by ~PELIC
     # Last update: 2012/04/23
ABSOLUTE.TOP:
     var Current.Script toolrepair
     var Forgemaster NULL
     ##
     include forginglocations.inc
     ##
     action var Repair.Complete YES when ^The .* is not damaged enough to warrant repair\.
     ##
	if def(Tool.List) then var Tool.List $Tool.List
	else var Tool.List HAMMER|TONGS|SHOVEL|BELLOWS
	eval MaxItems count("%Tool.List" , "|")
     #---------------------------------------
     # VARIABLES
     #---------------------------------------
	var CurrentItem -1
BEGIN:
     gosub EMPTY.HANDS
REPAIR.LIST.LOOP:
     math CurrentItem add 1
     if %CurrentItem > %MaxItems || "%Tool.List" = "" then goto BAILER
     gosub Base.Get %Tool.List(%CurrentItem) IN MY $Forging.Container
     if ("$righthand" = "Empty") then goto REPAIR.LIST.LOOP
     eval Tool toupper($righthandnoun)
     var Repair.Complete NO
     gosub REPAIR
     gosub EMPTY.HANDS
     goto REPAIR.LIST.LOOP
REPAIR:
     if ("$righthandnoun" != tolower("%Tool")) then gosub BASE.GET %Tool IN MY $Forging.Container
     gosub BRUSH
     if ("%Repair.Complete" = "YES") then return
     gosub OIL
     goto REPAIR
BRUSH:
     gosub BASE.GET BRUSH IN MY $Forging.Container
     pause 0.3
     if ("$lefthandnoun" = "brush") then goto BRUSH.CONTINUE
     else 
          {
               gosub AUTOMOVE %Tool.Shop
               send order 10
               pause 0.3
               send order 10
               waitforre ^The attendant takes some coins from you and hands you .*\.
          }
BRUSH.CONTINUE:
     gosub BASE.PUT RUB MY %Tool WITH MY BRUSH
     pause 0.1
BRUSH.DONE:
     if ("$lefthandnoun" = "brush") then gosub BASE.PUT.IT BRUSH IN MY $Forging.Container
     return
OIL:
     gosub BASE.GET OIL IN MY $Forging.Container
     pause 0.3
     if ("$lefthandnoun" = "oil") then goto OIL.CONTINUE
     else 
          {
               gosub AUTOMOVE %Tool.Shop
               send order 6
               pause 0.3
               send order 6
               waitforre ^The attendant takes some coins from you and hands you .*\.
          }
OIL.CONTINUE:
     gosub BASE.PUT POUR MY OIL ON MY %Tool
     pause 0.1
OIL.DONE:
     if ("$lefthandnoun" = "oil") then gosub BASE.PUT.IT OIL IN MY $Forging.Container
     return
EMPTY.HANDS:
     if ("$righthand" != "Empty") then 
          {
               eval Item toupper($righthandnoun)
               gosub BASE.PUT.IT %Item IN MY $Forging.Container
          }
     if ("$lefthand" != "Empty") then
          {
               eval Item toupper($lefthandnoun)
               gosub BASE.PUT.IT %Item IN MY $Forging.Container
          }
     return
BAILER:
     put #parse TOOL REPAIRS COMPLETE!
     put #script abort %Current.Script
     exit
##### AUTOMOVE SUBROUTINE #####
AUTOMOVE:
     if "$0" = "$roomid" then return
     else put .AutoMove $0
     waitforre ^AUTOMOVE COMPLETE\!
     return
RETURN:
     return
INCLUDES:
     include base.inc
