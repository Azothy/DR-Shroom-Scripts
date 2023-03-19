var gemPouch black pouch

action (gemprofit) evalmath totalGemsSold %totalGemsSold+1;evalmath totalGemProfit %totalGemProfit+$1;var gemProfitCurrency $2 when hands you (\d+) (Kronars|Lirums|Dokoras)\.$
var totalGemProfit 0
var gemProfitCurrency Dokoras

SELLING_GEMS:
     action (gemprofit) on
     var totalGemsSold 0
     if (("$game" = "DRF") && ($zoneid = 68) || ("$guild" = "Trader")) then gosub SELL_POUCH
     if (($zoneid != 68) && ("$guild" != "Trader")) then gosub SELL_GEMS pouch
     if ($TiePouch) then
          {
               if !matchre("$zoneid", "\b(68|69|34a)\b") then
                    {
                         echo =================================================
                         echo *** NOT IN A LOCATION TO SELL TIED GEM POUCHES! 
                         echo *** Non-Traders can only sell full tied pouches in:
                         echo *** Map 68/69 (Shard area) and 34a (Rossman)
                         echo ==================================================
                         put #echo >Log Orange ** Skipping selling pouches - Not in a location that supports selling tied pouches
                         goto SELL_MISC_GEMS
                    }
          }
     pause 0.2
     put get my %gemPouch
     pause 0.2
     # if ("$guild" = "Trader") then goto TRADER_POUCHES
     gosub GET_SELL_POUCH $UC_Container
     gosub GET_SELL_POUCH $UC_Container.Box
     gosub GET_SELL_POUCH $UC_Container.Backup
     gosub GET_SELL_POUCH $UC_Container.Crafting
     if ($Trading.LearningRate > 33) then goto TRADING_LOCKED
     if (((!$TiePouch) && matchre("$zoneid", "\b(68|69|34a)\b")) || ("$guild" = "Trader")) then
          {
               echo
               echo **** Selling Tied Pouches from GemPouch Container
               echo
               pause 0.2
               send open my $UC_Container.GemPouch
               wait
               pause 0.3
               gosub GET_SELL_POUCH $UC_Container.GemPouch
               PUT close my $UC_Container.GemPouch
               pause 0.2
          }
     goto SELL_GEMS_DONE
TRADING_LOCKED:
     echo ================================
     echo  ** TRADING LOCKED!
     echo  ** SKIPPING REST OF POUCHES
     echo ===============================
     gosub STOW pouch
     goto SELL_GEMS_DONE

GET_SELL_POUCH:
     var number |first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|eleventh|twelfth
     var sellingloop 0
     var pouchnumber 0
     var vessel $0
GET_SELL_POUCH_2:
     action (gemprofit) on
     math sellingloop add 1
     if (%sellingloop > 12) then return
     pause 0.1
     if ("$guild" = "Trader") then
          {
               if ($Trading.LearningRate > 33) then goto TRADING_LOCKED
          }
     # gosub GET %number(%pouchnumber) %gemPouch from my %vessel
     put GET %gemPouch from my %vessel
     pause 0.2
     pause 0.1
     pause 0.1
     if (contains("$righthand $lefthand", "pouch") && ("$guild" != "Trader") && ($zoneid != 68)) then gosub SELL_GEMS pouch
     if ((contains("$righthand $lefthand", "pouch") && ("$guild" = "Trader") || ("$game" = "DRF") && ($zoneid = 68)) then gosub SELL_POUCH
     pause 0.1
     if !contains("$righthand $lefthand", "pouch") then return
     if (contains("$righthand $lefthand", "pouch") && !matchre("$UC_Container.EmptyPouch", "(?i)NULL") && !matchre("%vessel", "$UC_Container.EmptyPouch")) then PUT put pouch in my $UC_Container.EmptyPouch
     pause 0.2
     if (contains("$righthand $lefthand", "pouch") && !matchre("%vessel", "$UC_Container")) then PUT pouch in my $UC_Container
     pause 0.2
     if (contains("$righthand $lefthand", "pouch") && !matchre("%vessel", "$UC_Container.Backup")) then PUT put pouch in my $UC_Container.Backup
     pause 0.2
     if (contains("$righthand $lefthand", "pouch") && !matchre("%vessel", "$UC_Container.Box")) then PUT put pouch in my $UC_Container.Box
     pause 0.2
     if (contains("$righthand $lefthand", "pouch") && !matchre("%vessel", "$UC_Container.Crafting")) then PUT put pouch in my $UC_Container.Crafting
     pause 0.2
     if (("$righthand" != "Empty") || ("$lefthand" != "Empty")) then gosub stowing
     goto GET_SELL_POUCH_2
GET_SELL_POUCH_OLD:
     var numberPouch $1
     pause 0.001
     if (("$guild" = "Trader") && ($Trading.LearningRate > 33)) then goto TRADING_LOCKED
     put get my %numberPouch %gemPouch
     pause 0.2
     pause 0.1
     if (contains("$righthand $lefthand", "pouch") && ("$guild" != "Trader")) then gosub SELL_GEMS pouch
     if (contains("$righthand $lefthand", "pouch") && ("$guild" = "Trader")) then gosub SELL_POUCH
     gosub stowing
     return
SELL_POUCH:
     var fullPouches 1
     math pouchnumber add 1
     pause 0.001
     pause 0.001
     send sell pouch
     pause 0.2
     pause 0.2
     return

SELL_GEMS_DONE:
     action (gemprofit) off
     if (%totalGemProfit = 0) then goto SELL_MISC_GEMS
     if (%fullPouches = 0) then
          {
               echo ==============================================
               echo *** Sold %totalGemsSold gems 
               echo *** Total of %totalGemProfit %gemProfitCurrency
               echo ==============================================
               put #echo >Log Lime *** Sold %totalGemsSold gems - Profit: %totalGemProfit %gemProfitCurrency
          }
     if (%fullPouches = 1) then
          {
               echo ==============================================
               echo *** Sold %totalGemsSold gem pouches
               echo *** Total of %totalGemProfit %gemProfitCurrency
               echo ==============================================
               put #echo >Log Lime *** Sold %totalGemsSold gem pouches - Profit: %totalGemProfit %gemProfitCurrency
          }
     math TotalProfit add %totalGemProfit
     pause

SELL_MISC_GEMS:
     pause 0.1
     var totalGemsSold 0
     var totalGemProfit 0
SELL_NUGS:
     pause 0.2
     action (gemprofit) on
     if (($WornPouch) && contains("$righthandnoun $lefthandnoun", "pouch")) then send wear my pouch
     pause 0.2
     if contains("$righthandnoun $lefthandnoun", "pouch") then gosub STOW my pouch
     pause 0.2
     gosub SELL_NUGGETS
     pause 0.5
SELL_NUGS_DONE:
     action (gemprofit) off
     if (%totalGemProfit = 0) then goto SELL_NUGS_COMPLETE
     echo *** Sold %totalGemsSold nuggets/bars for a total of %totalGemProfit %gemProfitCurrency
     put #echo >Log Lime *** Sold %totalGemsSold nuggets/bars - Profit: %totalGemProfit %gemProfitCurrency
     math TotalProfit add %totalGemProfit
SELL_NUGS_COMPLETE:
     pause 0.2
     exit
        
stowing:
put stow left
put stow right
pause 0.4
return

########################################################################################################
# INDIVIDUAL GEM SELLER BY DASFFION - Robustified by Shroom
# action var gemContainer $1 when \s+gems: .+ (\w+)$
SELL_GEMS:
     var contents null
     var gemContainer $0
     action send open my %gemContainer;send rummage /b my %gemContainer when ^While it's closed\?
     action var contents $1 when ^You rummage through .+ and see (.*)\.
     action send hum ruff off;send stop hum;send rummage my gem pouch when ^You feel about a.+gem pouch\.$
     action send hum ruff off;send stop hum;send sell my $righthandnoun when ^You might want to be visible for that\.$
SellGems2:
     pause 0.1
     # matchre SellGems2 ^\.\.\.wait|^Sorry\,
     # matchre SellGemsNext gems:
     # send store gems
     # matchwait 3
SellGemsNext:
     pause 0.1
     matchre SellGemsNext ^\.\.\.wait|^Sorry\,
     matchre SellGemsParse ^You rummage|^You feel
     matchre SellGemsParse ^I don\'t know|^I could not|nothing in there
     matchre SellGemsParse ^While it\'s closed
     send rummage /g my %gemContainer
     matchwait 9
SellGemsParse:
     eval contents replace("%contents", ", ", "|")
     eval contents replace("%contents", " and ", "|")
     eval contents replacere("%contents", "(?:and (?:an?|some))", "|")
     var contents |%contents|
     eval total count("%contents", "|")
     if contains("%contents", "I don\'t know") || contains("%contents", "I could not") || contains("%contents", "nothing in there") || contains("%contents", "null") || contains("%contents", "it\'s closed") then
          {
              put #parse DONE SELLING GEMS
              echo DONE SELLING POUCH
              action remove ^You might want to be visible for that\.$
              action remove ^You feel about a.+gem pouch\.$
              action remove ^You rummage through .+ and see (.*)\.
              action remove ^While it's closed\?
              return
          }
GemPouchLoop:
    eval item element("%contents", 1)
    eval number count("%contents", "|%item")
    var count 0
    gosub GemPouchRemoveLoop
    action setvariable item $1 when ^@a .* (\S+)$
    put #parse @%item
    counter set %count
    gosub SellSingleGem
    if %contents != "|" then goto GemPouchLoop
    put #parse DONE SELLING GEMS
    echo DONE SELLING GEMS
    action remove ^You might want to be visible for that\.$
    action remove ^You feel about a.+gem pouch\.$
    action remove ^You rummage through .+ and see (.*)\.
    action remove ^While it's closed\?
    return
GemPouchRemoveLoop:
    eval number count("%contents", "|%item|")
    eval contents replace("%contents", "|%item|", "|")
    eval contents replace("%contents", "||" "|")
    evalmath count %count + %number
    if !contains("%contents", "|%item|") then return
    goto GemPouchRemoveLoop
SellSingleGem:
    counter subtract 1
    pause 0.001
    pause 0.001
    pause 0.01
    PUT get my %item from my %gemContainer
    pause 0.001
    pause 0.001
    pause 0.01
    send sell my %item
    pause 0.001
    pause 0.01
    pause 0.1
    if %c = 0 then return
    goto SellSingleGem
#################################################
### SELL NUGGETS AND BARS
################################################
SELL_NUGGETS:
     var sellmetals brass|bronze|coal|copper|covellite|iron|lead|nickel|oravir|pewter|silver|tin|zinc|gold|electrum|platinum|steel
     action (nugget) math $2.$1 add 1 when ^\s+(?:an?|some) (?:\S+ )?(%sellmetals) (nugget|bar|ingot)
     gosub NUGRESET nugget
     gosub NUGRESET bar
     gosub NUGRESET ingot
     send inv $UC_Container
     waitfor INVENTORY
     pause 0.2
     send inv $UC_Container.Boxes
     waitfor INVENTORY
     pause 0.2
     send inv $UC_Container.Backup
     waitfor INVENTORY
     pause 0.2
     send inv $UC_Container.Crafting
     waitfor INVENTORY
     pause 0.2
     pause 0.1
     gosub SELL.CRAP nugget
     gosub SELL.CRAP bar
     if def(MC_FORGING.STORAGE) then put close $UC_MC_FORGING.STORAGE
     gosub SELL.CRAP ingot
     echo =============================================
     echo *** SOLD METALS - PROFIT: %totalGemProfit
     echo =============================================
     pause 0.2
     if def(MC_FORGING.STORAGE) then put open $UC_MC_FORGING.STORAGE
     return

SELL.CRAP:
     var selltype $1
     var sellcount 0
SELL.CRAP_1:
     if ((%sellcount > 15) && (%selltype = ingot)) then return
     if (%sellcount > 16) then return
     if (%%selltype.%sellmetals(%sellcount) > 0) then gosub SELLING
     math sellcount add 1
     goto SELL.CRAP_1

SELLING:
     pause 0.001
     if %%selltype.%sellmetals(%sellcount) < 1 then return
     put GET %sellmetals(%sellcount) %selltype
     pause 0.1
     pause 0.l
     put sell my %sellmetals(%sellcount) %selltype
     pause 0.1
     math %selltype.%sellmetals(%sellcount) subtract 1
     goto SELLING


NUGRESET:
     var nug $1
     var %nug.brass 0
     var %nug.bronze 0
     var %nug.coal 0
     var %nug.copper 0
     var %nug.covellite 0
     var %nug.iron 0
     var %nug.lead 0
     var %nug.nickel 0
     var %nug.oravir 0
     var %nug.pewter 0
     var %nug.silver 0
     var %nug.tin 0
     var %nug.zinc 0
     var %nug.gold 0
     var %nug.electrum 0
     var %nug.platinum 0
     return