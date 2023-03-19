var skinables antenna|ashu'a|barb|beak|bone|bristle|carapace|catgut|claw|collarbone|ear|eye|eyeball|fang|feather|foreclaw|foreleg|fragment|gland|hair|heart|hide|hoof|horn|impaler|mandible|milk-tooth|mosshair|paw|pelt|pseudopod|quill|rib|sac|scale|scalp|shell|skin|sliver|spine|spinneret|stinger|tail|talon|tentacle|toenail|tongue|tooth|tusk|tusks|vertebra|wing

gosub SKIN.SELL $Container
gosub SKIN.SELL $Container.Box
gosub SKIN.SELL $Container.Backup
gosub SKIN.SELL $Container.Crafting
put #parse SKIN SELLING DONE!
put #parse SKINS DONE!
put #parse SKIN DONE!
put #parse DONE SKINS!
put #parse DONE SELLING SKINS!!
put #parse SKIN SELLING DONE!
exit

SKIN.SELL:
     var bag $0
     pause 0.0001
     echo *** EMPTYING %bag of all skins
     var contents null
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action var contents $1 when ^In the .* you see (.*)\.
     send look in my %bag
     waitforre ^In the .* you see|^There is nothing in there\.|^You rummage|^I could not
     action remove ^In the .* you see (.*)\.|^You rummage through .+ and see (.*)\.
     if "%contents" = "null" then RETURN
     pause 0.0001
     eval contents replace("%contents" , ", " , "|")
     eval contents replace("%contents" , " and a" , "|a")
     eval contents replace("%contents" , " and an" , "|an")
     eval contents replace("%contents" , " and some" , "|some")
     eval contents replace("%contents"," with a miner's lamp on it",  "")
     eval contents replace("%contents"," with a wax label on it",  "")
     eval contents replace("%contents"," on it",  "")
     var contents |%contents|
     eval total count("%contents", "|")
SKIN.SELL.Loop:
     eval item element("%contents", 1)
     eval number count("%contents", "|%item")
     var count 0
     gosub SKIN.SELL.RemoveLoop
     action setvariable item $1 when ^@(?:an?|some).* (\S+)$
     put #parse @%item
     counter set %count
     if matchre("%skinables", "%item") then gosub SKIN.SELL.ItemAction
     if "%contents" != "|" then goto SKIN.SELL.Loop
     RETURN
SKIN.SELL.RemoveLoop:
     eval number count("%contents", "|%item|")
     eval contents replace("%contents" , "|%item|" , "|")
     eval contents replace("%contents" , "||" , "|")
     evalmath count %count + %number
     if !contains("%contents", "|%item|") then RETURN
     goto SKIN.SELL.RemoveLoop
SKIN.SELL.ItemAction:
     gosub SELLSKIN %item
     counter subtract 1
     if (%c < 1) then RETURN
     goto SKIN.SELL.ItemAction
     
SELLSKIN:
    put get my %item from my %bag
    pause 0.4
    put sell my %item
    pause 0.1
    pause 0.1
    RETURN