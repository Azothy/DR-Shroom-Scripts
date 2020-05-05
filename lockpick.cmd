#############################################
# LOCKPICK CARVING SCRIPT BY SHROOM OF TF 
### container1 is place to put MASTERS OR BELOW
var container1 backpack on shelf
### container2 is place to put GRANDMASTERS
var container2 second back on shelf
###############################################
## USAGE - .lockpick  (normal run, will carve lockpicks until out of keyblanks)
## .lockpick 20 50 70 (will start script pre-setting total masters, GMs and total keyblanks already carved )
## (Only used if you are say, restarting the script after restocking keyblanks, and you want to track the overall total carved)
### DONT TOUCH ################################
var masters 0
var grandmasters 0
var keyblanks 0

if_1 then var masters %1
if_2 then var grandmasters %2
if_3 then var keyblanks %3

TOP:
     echo *******************************************
     echo ** REMOVE ALL ARMOR - GET ALL WOUNDS HEALED!
     echo ** REDUCE YOUR BURDEN - BEFORE CARVING!!
     echo ******************************************
     pause 2
     put smirk $charactername
     pause 0.5
     put get my carving knife
     pause 0.5
     if ("$righthandnoun" != "knife") then goto 

KHRI:
     put khri hasten safe focus sight plunder muse avoidance
     pause 1
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
     pause 0.1
     pause 0.1
     put put lock in %container1
     goto Finish

End.GM:
     math grandmasters add 1
     pause 0.1
     pause 0.1
     put put lock in %container2
     goto Finish

FINISH:
     pause 0.1
     pause 0.1
     put exp
     waitfor Overall state of mind
     echo  
     echo *** %keyblanks lockpicks carved 
     echo *** %masters masters
     echo *** %grandmasters grandmasters
     echo
     goto KHRI

NOKNIFE:
     pause 0.1
     echo *************************************
     echo ** NO CARVING KNIFE FOUND! ABORTING
     echo ************************************
     echo
     goto STAND
     
FINISH2:
     pause 0.1
     put exp
     waitfor Overall state of mind
     pause 0.1
     echo ************************************
     echo ****** ALL OUT OF KEYBLANKS *******
     echo ************************************
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
     put clean $charactername
     put #echo >Log Lime **** Carved %keyblanks lockpicks 
     put #echo >Log Lime **** %masters Masters %grandmasters Grandmasters
     pause 0.5
     exit