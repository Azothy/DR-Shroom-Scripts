## Reveler's BurgleVariables Script
## v.3.1
## 07/13/2021
## Discord Reveler#6969

## v. 2.1 updates:
## Added option to hide before searches
## Added variable to drop all burgled items if not in your donotpawnthis variable
## Added variable to drop certain burgled items
## v. 3.0 updates:
## Changed var for burgle type to RING|LOCKPICK|ROPE|TOGGLE - with "TOGGLE" will pick the skill with lowest learning rate.  Must have worn lockpick ring for TOGGLE.
## v. 3.1 updated to use global tvars instead of global vars

## THIS IS AN INCLUDED SCRIPT IN THE BURGLE SCRIPT AND MUST BE COMPLETED BEFORE RUNNING .BURGLE.CMD

#debug 10

#Preliminary variables - don't touch these
var skip NULL
var donotpawnthis NULL
var trashall NO
var home Crossing
### Edit below here


## SET YOUR CHARACTER'S NAMES BELOW, IF NOTHING USE NULL
## MAKE SURE TO UPDATE EACH CHARACTERS VARIABLES INDIVIDUALLY BELOW
var CHARACTER1 Shroom
var CHARACTER2 Raidboss
var CHARACTER3 Valgrind
var CHARACTER4 Acidbath
var CHARACTER5 Akios
var CHARACTER6 Idavoll
var CHARACTER7 Drunvalo
var CHARACTER8 Aerithius
var CHARACTER9 Healbitch
var CHARACTER10 Illuminati
var CHARACTER11 Hashish
var CHARACTER12 Fuku

## SET ALL YOUR CUSTOM VARIABLES PER EACH CHARACTER IN THE BLOCKS BELOW THIS!
##### CHARACTER 1 VARIABLES
if ("$charactername" = "%CHARACTER1") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack backpack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick wrist
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype climbing rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you *know* there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 5
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme NO
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings napkin|tankard
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER2") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack lootsack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype hemp rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER3") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack carryall
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype climbing rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis manual|scimitar|opener|arrow
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}
if ("$charactername" = "%CHARACTER4") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack lootsack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick wristcuff
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER5") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack carryall
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method LOCKPICK
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER6") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack bag
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method LOCKPICK
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER7") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack bag
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method LOCKPICK
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis manual|scimitar|opener|arrow
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER8") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack bag
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method LOCKPICK
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER9") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack backpack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
if ("%method" = "RING") then var worn YES
else var worn NO
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}

if ("$charactername" = "%CHARACTER10") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack traveling bag
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
var worn YES
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}
if ("$charactername" = "%CHARACTER11") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack haversack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick ring
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
var worn YES
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis manual|scimitar|opener|arrow
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}
if ("$charactername" = "%CHARACTER12") then 
{
# do you use the temporal eddy for storage of items?  If yes, list the items in an array, with LOOT for burgle loot, ROPE for burgle rope entry, RING for lockpick ring and LOCKPICK for loose lockpicks.  NULL if you don't use the eddy
var eddy NULL
# where do you want to store your stolen items?
var pack haversack
# method can be RING, LOCKPICK, or ROPE; RING (uses lockpick stacker) and LOCKPICK (uses spare lockpicks) teach locks, ROPE teaches athletics. VARIABLE MUST BE IN ALL CAPS
if (($Locksmithing.Ranks < 1750) && ($Athletics.LearningRate >= $Locksmithing.LearningRate)) then var method RING
else var method ROPE
# ringtype is the type of lockpick ring you have.  It can be any of the following: lockpick ring|lockpick case|lockpick ankle-cuff|golden key
var ringtype lockpick wristcuff
# Use your adjective-noun for your rope
# DANCING ROPES DO NOT WORK
var ropetype heavy rope
# Toggle for worn lockpick ring/rope
var worn YES
# Travel location should be the city and the roomid.  Pick a room where you know there will not be a guard, or leave NULL
var travel NULL
# maximum times to try to search surfaces
var maxgrabs 3
# do you want to hide before you search? Will ALWAYS be hidden for first search. ON will attempt to hide before any additional search. WARNING - MAY BE MORE RISKY BECAUSE OF ROUND TIME AND WILL REDUCE NUMBER OF POTENTIAL ROOMS YOU WILL HAVE TIME TO SEARCH
var hideme YES
# pawn YES will try to pawn your stolen goods NOTE - PUT NO IF PAWNING THROUGH UBERCOMBAT
var pawn NO
# put loot you DO NOT wish to sell here if you use pawning within .BURGLE.  The full lootpool variable is in .burgle. Separate with |
var donotpawnthis NULL
# if you want to drop everything EXCEPT the "donotpawnthis" items, put YES here
var trashall NO
# if you want to drop SOME things, put them here
var trashthings NULL
# Rooms you do not want to search.  Choose from following: kitchen|bedroom|workroom|sanctum|armory|library
var skip NULL
# Hometown. Only matters if pawning.  MUST be a location with a pawnshop.  Uses .travel so if .travel won't get you to that location, script will fail
var home NULL
}
######### END USER VARIABLES DON'T TOUCH ANYTHING ELSE
put #var BURGLE.PACK %pack
put #var BURGLE.METHOD %method
put #var BURGLE.RINGTYPE %ringtype
put #var BURGLE.ROPETYPE %ropetype
put #var BURGLE.WORN %worn
put #var BURGLE.TRAVEL %travel
put #var BURGLE.MAXGRABS %maxgrabs
put #var BURGLE.PAWN %pawn
put #var BURGLE.KEEP %donotpawnthis
put #var BURGLE.EDDY %eddy
put #var BURGLE.TRASHALL %trashall
put #var BURGLE.TRASHITEMS %trashthings
put #var BURGLE.SKIP %skip
put #var BURGLE.HOME %home
put #var BURGLE.HIDE %hideme 