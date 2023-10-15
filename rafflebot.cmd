#### RAFFLEBOT SCRIPT
#### by ~PELIC
#### Last Update: Nov 18, 2022 by Shroom
#### Updated for Andreshlew's Hollow's Eve 
####################################################################
########### ATTENTION! LOOK FOR THE LINES FILLED WITH "!" ##########
####################################################################
ABSOLUTE_TOP:
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     # Set the name of the script to resume after the raffle, if you choose to do so.
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     if !def(raffle.ResumeScript) then put #tvar raffle.ResumeScript boggle
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     # If you wish to resume a script after the raffle, set the following variable.  (0 for no, or 1 for yes)
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     if !def(raffle.ResumeAfter) then put #tvar raffle.ResumeAfter 1
     if !def(Log) then put #tvar Log log
     put #tvar raffle.Outside 0
     put #tvar raffle.Done 0
     action instant send look when eval $useridle = 1
     action instant goto RESUME when ^Done\!
     action instant goto GET_THERE when ^Raffles?\?
     action instant goto GET_THERE when ^Raffles?\!
     action instant goto GET_THERE when Raffle time\!
     action instant goto GET_THERE when ^We are ready to start another set of wonderfully free raffles\!
     action instant goto EXIT_NOW when eval $dead = 1
     action instant goto TICKET_CHECK when ^(\w+) gives you a little prod between the shoulder blades\.
     action instant put read board when The winning ticket number for the .* prize
     action instant put read board;goto GET_TICKET when ^Raffle Attendant .* says\, \"Raffle picks are now available for the next drawing\!\"
     action instant put #tvar raffle.Done 1 when ^Raffle\s*Attendant\s*.*\s*exclaims\,\s*\"Congratulations\s*to\s*all\s*our\s*winners\!\s*Please\s*drop\s*your\s*winning\s*tickets\s*on\s*the\s*counter\s*to\s*claim\s*your\s*prize\.\s*That\s*will\s*be\s*our\s*last\s*raffle\s*for\s*the\s*evening\.\s*Thank\s*you\s*for\s*participating\!\"
     action instant put #tvar raffle.Done 1 when ^Raffle\s*Attendant\s*.*\s*says\,\s*\"Congratulations\s*to\s*all\s*our\s*winners\!\s*Please\s*drop\s*your\s*winning\s*tickets\s*on\s*the\s*counter\s*to\s*claim\s*your\s*prize\.\s*That\s*will\s*be\s*our\s*last\s*raffle\s*for\s*the\s*evening\.\s*Thank\s*you\s*for\s*participating\!\"
     action instant put #echo >$Log $1 when ^Raffle Attendant\s*.*\s*examines your ticket and exclaims\, \"Congratulations\!\"  (?:He|She) smiles broadly as s?he takes the ticket and hands you (?:a|an|some) (.*)
     goto TICKET_CHECK
LOOP:
     pause 0.1
     if ($raffle.Done) then goto RESUME
     if matchre("$roomname", "Caught\, Behind the Spider|Caught\, Behind The Spider") then
          {
               pause 30
               goto LOOP
          }
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     # Add your script name to the list below.
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     if matchre("$scriptlist" , "spinneret|tickettasks|darkbox|fishgame|look|afk") then
          {
               pause 30
               goto LOOP
          }
     put fatigue
     pause 30
     goto LOOP
TICKET_CHECK:
     gosub clear
     var LOCATION TICKET_CHECK_1
     pause 0.1
     TICKET_CHECK_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre LOOP ^There is nothing on there\.
     matchre GET_TICKET ^On the .*counter you see a roll of raffle tickets\.
     send look on counter
     matchwait
GET_TICKET:
     gosub clear
     var LOCATION GET_TICKET_1
     pause 0.1
     GET_TICKET_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre WINNER ^$charactername's\s*name\s*appears\s*on\s*the\s*result\s*board\!
     matchre LOSER ^Raffle Attendant \S+ exclaims\, \"Congratulations to all our winners\!\s*Please (?:put|drop) your winning tickets on the counter to claim your prize\.\s*That will be our last raffle for the evening\.\s*Thank you for participating\!\"
     matchre LOSER ^Raffle Attendant \S+ exclaims\, \"Congratulations to all our winners\!\s*Please (?:put|drop) your winning tickets on the counter to claim your prize\.\s*The next raffle will begin shortly\.\"
     matchre LOSER ^Raffle Attendant \S+ says\, \"Congratulations to all our winners\!\s*Please (?:put|drop) your winning tickets on the counter to claim your prize\.\s*That will be our last raffle for the evening\.\s*Thank you for participating\!\"
     matchre LOSER ^Raffle Attendant \S+ says\, \"Congratulations to all our winners\!\s*Please (?:put|drop) your winning tickets on the counter to claim your prize\.\s*The next raffle will begin shortly\.\"
     send get ticket on counter
     matchwait
LOSER:
     var LOCATION LOSER_1
     pause 0.1
     LOSER_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre LOOP ^You
     matchre LOOP ^Perhaps you should be holding that first\.
     send put my ticket in bucket
     matchwait
WINNER:
     var LOCATION WINNER_1
     pause 0.1
     WINNER_1:
     matchre WAIT ^\.\.\.wait|^Sorry\,
     matchre IMMOBILE ^You don't seem to be able to move to do that
     matchre WEBBED ^You can't do that while entangled in a web
     matchre STUNNED ^You are still stunned
     matchre WINNER_STORE ^Raffle\s*Attendant\s*.*\s*examines\s*your\s*ticket\s*and\s*exclaims\,\s*\"Congratulations\!\"\s*(?:He|She)\s*smiles\s*broadly\s*as\s*s?he\s*takes\s*the\s*ticket\s*and\s*hands\s*you\s*.*\.
     send put my ticket on counter
     matchwait
WINNER_STORE:
     gosub STORE_ITEMS
     goto LOOP
STORE_ITEMS:
     pause 0.0001
     if !matchre("$righthand", "Empty") then gosub STOW right
     if !matchre("$lefthand", "Empty") then gosub STOW left
     return
GET_THERE:
     gosub clear
     echo
     echo ===========================
     echo ** RAFFLE BOT TRIGGERED!!
     echo ** GETTING TO RAFFLE!
     echo ===========================
     echo
     put #echo >Log Lime RAFFLEBOT TRIGGERED!
     # put chatter Raffle!
     send #script abort all except %scriptname
     pause 0.5
     pause 0.2
     pause 0.2
     gosub STORE_ITEMS
     if matchre("$roomname", "Boggle Blast") then
          {
               pause 2
               put go door
               pause
               pause 0.5
               put go arch
               pause 
               pause 0.2
               put nw
               pause 0.5
               pause 0.5
               put w
               pause 0.5
               pause 0.2
               
          }
     ## CROSSING AREA
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "11") then gosub AUTOMOVE NTR
     if ("$zoneid" = "1") then
          {
               if matchre("$roomname", "(?i)Sewer") then gosub AUTOMOVE 295
               if matchre("$roomname", "(?i)Warehouse") then gosub AUTOMOVE 437
               if matchre("$roomname", "(?i)Shipyard") then gosub AUTOMOVE 237
          }
     if ("$zoneid" = "1a") then gosub AUTOMOVE cross
     if ("$zoneid" = "2") then gosub AUTOMOVE 2
     if ("$zoneid" = "2d") then gosub AUTOMOVE temple
     if ("$zoneid" = "2a") then gosub AUTOMOVE cross
     if ("$zoneid" = "8a") then gosub AUTOMOVE cross
     if ("$zoneid" = "9b") then gosub AUTOMOVE NTR
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     ## NTR TO XING
     if ("$zoneid" = "11") then gosub AUTOMOVE NTR
     if ("$zoneid" = "2d") then gosub AUTOMOVE temple
     if ("$zoneid" = "14b") then gosub AUTOMOVE NTR
     if ("$zoneid" = "14c") then gosub AUTOMOVE river
     if ("$zoneid" = "13") then gosub AUTOMOVE NTR
     if ("$zoneid" = "11") then gosub AUTOMOVE NTR
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "2a") then gosub AUTOMOVE crossing
     if ("$zoneid" = "4a") then gosub AUTOMOVE crossing
     if ("$zoneid" = "11") then gosub AUTOMOVE NTR
     if ("$zoneid" = "14b") then gosub AUTOMOVE NTR
     if ("$zoneid" = "7a") then gosub AUTOMOVE NTR
     if ("$zoneid" = "13") then gosub AUTOMOVE NTR
     if ("$zoneid" = "12a") then
          {
               gosub LIGHT_SOURCE
               gosub AUTOMOVE NTR
          }
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     if ("$zoneid" = "11") then gosub AUTOMOVE NTR
     ## RIVERHAVEN / MISTWOOD
     if ("$zoneid" = "30a") then gosub AUTOMOVE 57
     if ("$zoneid" = "30b") then gosub AUTOMOVE 14
     if ("$zoneid" = "31b") then gosub AUTOMOVE 5
     if ("$zoneid" = "31a") then
          {
               gosub AUTOMOVE 121
          }
     if ("$zoneid" = "34a") then gosub AUTOMOVE mist
#### DECIDE HERE IF WE WANT TO GO TO THEREN FROM SKY GIANTS (IF FC IS ON)
     if (("$zoneid" = "34") && matchre("$roomname", "In a Ravine")) then
                    {
                         gosub AUTOMOVE 130
                         pause 0.1
                         gosub AUTOMOVE theren
                         pause 0.2
                         if ("$zoneid" = "34") then gosub AUTOMOVE theren
                    }
#### IF IN FOREST GRYPHONS - TAKE THE EASY PATH OUT *Avoid Automapper getting stuck
     if (("$zoneid" = "34") && ($roomid > 89) && ($roomid < 116)) then
          {
               gosub AUTOMOVE 49
               gosub AUTOMOVE 23
          }
     if ("$zoneid" = "34") then
          {
               gosub AUTOMOVE 5
               gosub AUTOMOVE riverhaven
          }
     if ("$zoneid" = "32") then gosub AUTOMOVE 2
     if ("$zoneid" = "31") then gosub AUTOMOVE 2
     if ("$zoneid" = "33a") then gosub AUTOMOVE 30
     if ("$zoneid" = "33") then gosub AUTOMOVE 9
     delay 0.00001
     if ("$zoneid" = "10") then gosub AUTOMOVE NTR
     ## THEREN / LANG / MUSPARI / THRONE
ESCAPE_THEREN:
     if ("$zoneid" = "48") then
          {
               put .travel muspari
               waitforre ^YOU ARRIVED\!
          }
     if ("$zoneid" = "47") then gosub AUTOMOVE 97
     if ("$zoneid" = "35") then gosub AUTOMOVE 149
     if ("$zoneid" = "41") then gosub AUTOMOVE theren
     if ("$zoneid" = "40a") then gosub AUTOMOVE lang
     if ("$zoneid" = "40") then gosub AUTOMOVE theren
     if ("$zoneid" = "48") then gosub AUTOMOVE muspar
     if ("$zoneid" = "41") then
          {
               send .travel theren
               waitforre ^YOU ARRIVED\!
          }
     if ("$zoneid" = "40") then gosub AUTOMOVE 209
     delay 0.00001
     ## LETH / STR / AIN GHAZAL
     if ("$zoneid" = "50") then gosub AUTOMOVE south
     if ("$zoneid" = "58") then gosub AUTOMOVE leth
     if ("$zoneid" = "59") then gosub AUTOMOVE 12
     if ("$zoneid" = "62b") then gosub AUTOMOVE leth
     if ("$zoneid" = "62b") then gosub AUTOMOVE leth
     if ("$zoneid" = "63") then gosub AUTOMOVE STR
     if matchre("$zoneid","(112|62|60)") then
          {
               var hometown LETH
               gosub AUTOMOVE 2
          }
     if ("$zoneid" = "4a") then gosub AUTOMOVE crossing
     if ("$zoneid" = "4") then gosub AUTOMOVE 1
     ## RATHA / AESRY
     if ("$zoneid" = "90a") then gosub AUTOMOVE 2
     if ("$zoneid" = "92") then
          {
               gosub AUTOMOVE 18
               pause 0.1
               pause 0.1
               send southwest
               pause 0.5
               pause 0.5
               if matchre("$roomobjs", "(massive herd of pigs|huge farm wagon)") then
               {
                    echo *** Stupid wagon/pigs.. waiting..
                    pause 20
               }
               if matchre("$roomobjs", "(massive herd of pigs|huge farm wagon)") then
               {
                    echo *** Stupid wagon/pigs.. waiting..
                    pause 20
               }
               if matchre("$roomobjs", "(massive herd of pigs|huge farm wagon)") then
               {
                    echo *** Stupid wagon/pigs.. waiting..
                    pause 30
               }
               if matchre("$roomobjs", "(massive herd of pigs|huge farm wagon)") then
               {
                    echo *** Stupid wagon/pigs.. waiting..
                    pause 30
               }
          }
     if ("$zoneid" = "92") then gosub AUTOMOVE 2
     if ("$zoneid" = "92") then gosub AUTOMOVE 2
     if ("$zoneid" = "95") then gosub AUTOMOVE 2
     if ("$zoneid" = "95") then gosub AUTOMOVE 2
     if ("$zoneid" = "98a") then gosub AUTOMOVE 97
     if ("$zoneid" = "98a") then gosub AUTOMOVE 97
     if ("$zoneid" = "98") then gosub AUTOMOVE 84
     if ("$zoneid" = "98") then gosub AUTOMOVE 84
     ## HIB / BOAR CLAN
     if ("$zoneid" = "127") then
          {
               gosub AUTOMOVE hib
               pause 0.4
          }
     if ("$zoneid" = "127") then
          {
               gosub AUTOMOVE hib
               pause 0.4
          }
     if ("$zoneid" = "126") then gosub AUTOMOVE 47
     if ("$zoneid" = "123") then gosub AUTOMOVE 168
     if ("$zoneid" = "114") then
          {
               send .travel hib
               waitforre ^YOU ARRIVED\!
          }
     if ($roomid = 0) then gosub RANDOMMOVE
     ## SHARD AREA
     if ("$zoneid" = "68") then gosub AUTOMOVE 3
     if ("$zoneid" = "62") then gosub AUTOMOVE leth
     if ("$zoneid" = "62") then gosub AUTOMOVE leth
     if ("$zoneid" = "65") then gosub AUTOMOVE shard
     if ("$zoneid" = "65") then gosub AUTOMOVE shard
     if ("$zoneid" = "68a") then gosub AUTOMOVE shard
     if ("$zoneid" = "68b") then gosub AUTOMOVE shard
     ######################
     if !matchre("$zonename", "Hollow Eve Festival 443") then
          {
               put #tvar raffle.Outside 1
               if ("$zonename" = "Fang Cove") then
                    {
                         gosub AUTOMOVE mammoth
                         pause 0.3
                         send whistle for dolphin transport
                         waitforre Overhead, glowing crystal globes shed|\[Andreshlew, South Dock\]
                         gosub MOVE west
                    }
               else
                    {
                    if ("$zoneid" = "150") then
                         {
                              echo *** ALREADY IN FC!
                              return
                         }
                         if matchre("$zoneid","\b(14c|30a|31|32|33)\b") then gosub AUTOMOVE river
                         if matchre("$zoneid","\b(14c|30a|31|32|33)\b") then gosub AUTOMOVE river
                         if matchre("$zoneid","\b(90a|92|95)\b") then gosub AUTOMOVE ratha
                         if matchre("$zoneid","\b(90a|92|95)\b") then gosub AUTOMOVE ratha
                         if matchre("$zoneid","\b(98a|98)\b") then gosub AUTOMOVE aesry
                         if matchre("$zoneid","\b(98a|98)\b") then gosub AUTOMOVE aesry
                         if ("$zoneid" = "34") then
                              {
                                   put .travel lang
                                   waitforre ^YOU ARRIVED\!
                              }
                         if ("$zoneid" = "69") then gosub AUTOMOVE north
                         if ("$zoneid" = "67") then gosub AUTOMOVE east
                         if ("$zoneid" = "127") then gosub AUTOMOVE south
                         if ("$zoneid" = "126") then gosub AUTOMOVE hib
                         if ("$zoneid" = "123") then gosub AUTOMOVE hib
                         if ("$zoneid" = "112") then gosub AUTOMOVE leth
                         if ("$zoneid" = "4") then gosub AUTOMOVE cross
                         if ("$zoneid" = "7") then gosub AUTOMOVE cross
                         if ("$zoneid" = "67") then gosub AUTOMOVE east
                         if ("$zoneid" = "42") then gosub AUTOMOVE gate
                         # Add your travel stuff to get to a map with a portal here.
                         if matchre("$zoneid", "69|68|65") then gosub AUTOMOVE shard
                         pause 0.5
                         if ("$zoneid" = "67") then gosub automove east
                         gosub AUTMOVE portal
                         pause 0.5
                         send go portal
                         pause 0.5
                         gosub AUTOMOVE mammoth
                         pause 0.3
                         send whistle for dolphin transport
                         waitforre Overhead, glowing crystal globes shed|\[Andreshlew, South Dock\]
                         gosub MOVE west
                    }
         }
     pause 0.3
     if !matchre("$roomname", "Andreshlew's Grand Raffle") then gosub AUTOMOVE raffle
     send look
     waitforre ^\[Andreshlew's Grand Raffle\]
     goto TICKET_CHECK
     ## Hollow Eve Festival
     if !matchre("$roomname", "Andreshlew's Grand Raffle") then gosub AUTOMOVE raffle
     send look
     waitforre ^\[Andreshlew's Grand Raffle\]
     goto TICKET_CHECK
RESUME:
     gosub clear
     put #tvar raffle.Done 0
     if !matchre("$righthand", "Empty") then if matchre("$lefthand", "Empty") then gosub SWAP
     # Jisi's Raffles
     # gosub MOVE go wagon door
     # gosub MOVE east
     # Hollow Eve Festival
     # if ($raffle.Outside) then
          # {
               # gosub AUTOMOVE Clearing
               # send go path
               # waitforre ^Out of the corner of your eye\, you spy a colorfully garbed attendant approaching you\, a silver knife in his hand\.
          # }
     put go arch
     pause 0.5
     pause 0.5
     gosub automove boggle
     if ($raffle.ResumeAfter) then put .$raffle.ResumeScript
     goto LOOP
EXIT_NOW:
     action clear
     gosub QUIT
     pause 0.1
     echo **** PANIC EXIT INITIATED ****
     pause 0.1
     put #script abort %scriptname
     exit
QUIT:
     matchre QUIT ^\.\.\.wait|^Sorry\,
     matchre RETURN ^\[\d+\:\d+\] Connection closed\.
     put QUIT
     matchwait
INCLUDES:
     include utility.inc
     include move.inc
#### END OF SCRIPT