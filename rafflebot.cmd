#### RAFFLEBOT SCRIPT
#### by ~PELIC
#### Last Update: 31 May, 2016
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
     echo ===========================
     echo ** RAFFLE BOT TRIGGERED!!
     echo ** GETTING TO RAFFLE!
     echo ===========================
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
     if !matchre("$zonename", "Hollow Eve Festival 428|Hollow Eve Festival 414 \(2014\)") then
          {
               put #tvar raffle.Outside 1
               if ("$zonename" = "Fang Cove") then
                    {
                         gosub AUTOMOVE portal
                         send look
                         waitfor a shimmering EXIT portal
                         gosub MOVE go exit portal
                    }
               else
                    {
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                         # Add your travel stuff to get to a map with a portal here.
                         if matchre("$zoneid", "69|68|65") then gosub AUTOMOVE shard
                         pause 0.5
                         if ("$zoneid" = "67") then gosub automove east
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                         gosub AUTOMOVE portal
                    }
               pause 0.5
               send look
               waitfor a path leading toward a caged blade spider
               send go path
               waitforre ^\[Paasvadh Forest\, Clearing\]
         }
     pause 0.3
     if !matchre("$roomname", "The Massive Metal Arachnid\, Raffle Center") then gosub AUTOMOVE raffle
     send look
     waitforre ^\[The Massive Metal Arachnid\, Raffle Center\]
     goto TICKET_CHECK
     ## Hollow Eve Festival
     if !matchre("$zonename", "Hollow Eve Festival 428|Hollow Eve Festival 414 \(2014\)") then
          {
               put #tvar raffle.Outside 1
               if ("$zonename" = "Fang Cove") then
                    {
                         gosub AUTOMOVE portal
                         send look
                         waitfor a shimmering EXIT portal
                         gosub MOVE go exit portal
                    }
               else
                    {
                         gosub AUTOMOVE portal
                    }
               pause 0.5
               send look
               waitfor a path leading toward a caged blade spider
               send go path
               waitforre ^\[Paasvadh Forest\, Clearing\]
         }
     pause 0.3
     if !matchre("$roomname", "The Massive Metal Arachnid\, Raffle Center") then gosub AUTOMOVE raffle
     send look
     waitforre ^\[The Massive Metal Arachnid\, Raffle Center\]
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