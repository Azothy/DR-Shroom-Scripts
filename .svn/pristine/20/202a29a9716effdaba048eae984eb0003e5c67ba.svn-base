#############################################
# LOCKPICK CARVING SCRIPT BY SHROOM OF TF 
#############################################
###
### container1 is place to put MASTERS OR BELOW
     var container1 backpack on shelf
### container2 is place to put GRANDMASTERS
     var container2 second back on shelf
### KHRI you want to use
     var khri hasten safe focus sight plunder muse avoidance
     
#############################################################################################################################################
## USAGE - .lockpick  (normal run, will carve lockpicks until out of keyblanks)
##
## .lockpick 70 20 50 (will start script pre-setting TOTAL CARVED - TOTAL MASTERS - TOTAL GMS to those settings) 
## .lockpick <total> <masters> <GMs> 
## (Only used if you are say.. restarting the script after restocking keyblanks, and you want to track the overall total carved)
#############################################################################################################################################

### DONT TOUCH BELOW ##############################################################################################################################

var masters 0
var grandmasters 0
var keyblanks 0

if_1 then var keyblanks %1
if_2 then var masters %2
if_3 then var grandmasters %3

KHRI:
     put khri %khri
     pause 1
     pause 0.5
     
TOP:
     if !matchre("$righthand", "Empty") then send stow right
     if !matchre("$lefthand", "Empty") then send stow left
     pause 0.001
     pause 0.001
     echo
     echo ===========================
     echo * FOR BEST RESULTS CARVING:
     echo * REMOVE ALL ARMOR FIRST! 
     echo * GET ALL WOUNDS HEALED!!
     echo * REDUCE YOUR BURDEN!!!
     echo * MAKE SURE YOU ARE IN TOWN!!!
     echo ============================
     echo
     pause 3
     put smirk $charactername
     pause 0.5
     put get my carving knife
     pause 0.5
     if ("$righthandnoun" != "knife") then
          {
               put get my carving knife from my portal
               pause 0.5              
          }
     if ("$righthandnoun" != "knife") then goto NOKNIFE
     send khri safe hasten sight
     pause 0.5
     pause 0.5
CARVE:
GET.KEY:
     math keyblanks add 1
     pause 0.1
     matchre Carvelock1 You get a|already holding
     match Carvelock1 You need a free hand
     matchre GET.KEY2 I could not find|What were you
     put get my keyblank
     matchwait

GET.KEY2:
     pause 0.001
     matchre Carvelock1 You get a|already holding
     match Carvelock1 You need a free hand
     matchre GET.KEY3 I could not find|What were you
     put get my keyblank from my portal
     matchwait
GET.KEY3:
     pause 0.001
     matchre Carvelock1 You get a|already holding
     match Carvelock1 You need a free hand
     matchre Finish2 I could not find|What were you
     put get my keyblank from my key pocket
     matchwait

CARVELOCK1:
     pause 0.1
     pause 0.1
     matchre Carvelock2 a crude|a rough|a stout|a common|a slim|You need to be holding the keyblank
     matchre Carvelock2 a quality|a high quality|a superior|a professional|^I could not|find yourself holding a master's
     matchre End.GM proudly glance down at a grandmaster's|initials|With the precision and skill shown only by true masters
     matchre End.Master proudly glance down at a master's|It would be better|glance down at
     match Broken snaps like a twig.
     match Carvelock1 Wait
     put carve my keyblank with my car knife
     matchwait

CARVELOCK2:
     pause 0.1
     pause 0.1
     matchre Carvelock2 a crude|a rough|a stout|a common|a slim|You need to be holding the keyblank
     matchre Carvelock2 a quality|a high quality|a superior|a professional|^I could not|find yourself holding a master's
     matchre End.GM grandmaster's|initials|With the precision and skill
     matchre End.Master proudly glance down at a master's|It would be better
     match Broken snap
     match Carvelock2 Wait
     put carve my lock with my car knife
     matchwait

BROKEN:
     pause
     echo **** DOH! Broke one.. 
     goto Carve

End.Master:
     math masters add 1
     echo
     echo **** CARVED A MASTER
     echo
     pause 0.1
     pause 0.1
     put put lock in %container1
     goto Finish

End.GM:
     math grandmasters add 1
     echo
     echo **** CARVED A GRANDMASTER!
     echo
     pause 0.1
     pause 0.1
     put put lock in %container2
     goto Finish

FINISH:
     pause 0.1
     pause 0.1
     put exp
     waitfor Overall state of mind
     pause 0.1
     echo
     echo =================
     echo *** %keyblanks LOCKPICKS CARVED
     echo *** %masters MASTERS
     echo *** %grandmasters GRANDMASTERS
     echo =================
     echo
     pause 0.2
     goto CARVE

NOKNIFE:
     pause 0.1
     echo ==========================
     echo ** NO CARVING KNIFE FOUND! ABORTING
     echo ==========================
     echo
     goto STAND
     
FINISH2:
     pause 0.1
     put exp
     waitfor Overall state of mind
     pause 0.3
     echo
     echo ======================
     echo *** ALL OUT OF KEYBLANKS ****
     echo ======================
     echo
     put stow knife
     pause 0.5
STAND:
     pause 0.3
     pause 0.2
     matchre STAND ^\.\.\.wait|^Sorry\,
     matchre STAND ^Roundtime\:?|^\[Roundtime\:?|^\(Roundtime\:?
     matchre STAND ^The weight of all your possessions prevents you from standing\.
     matchre STAND ^You are overburdened and cannot manage to stand\.
     matchre STAND ^You are so unbalanced
     matchre FINISHED ^You stand (?:back )?up\.
     matchre FINISHED ^You stand up in the water
     matchre FINISHED ^You are already standing\.
     put stand
     matchwait

FINISHED:
     pause 0.001
     put clean $charactername
     pause 0.001
     pause 0.001
     put #echo >Log Lime **** Lockpick Bot: Restocked %keyblanks lockpicks on shelf
     put #echo >Log Lime **** %masters Masters / %grandmasters Grandmasters
     if ("$game" = "DRF") then
          {
               put chatt ** Lockpick Bot Restocked %keyblanks lockpicks on FC shelf
               put chatt ** %masters Masters - %grandmasters GMs
          }
     pause 0.5
     exit