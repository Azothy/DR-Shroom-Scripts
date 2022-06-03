#<=============================================================================================>#
#<                              AFK KEEPALIVE SCRIPT - BY ~PELIC                               >#
#<=============================================================================================>#
# Last Update: 19 November, 2011
#<--------------------------------------------------------------------------------------------->#
ABSOLUTE.TOP:
     gosub BASE.ACTIONS
     gosub STATUSBAR
     var Current.Script afk
#<---------------------------------------------------------------------------------------->#
INIT:
     counter set 0
#<=============================================================================================>#
#<                                      COUNTING LOOP                                          >#
#<=============================================================================================>#
SCRIPT.BEGIN:
LOOP:
     pause 60
     send look
     pause 0.5
     counter add 1
     echo
     echo *** AFK / Keep Alive Script Running
     echo
     put #statusbar 5 Idle %c minutes.
     goto LOOP
#<=============================================================================================>#
#<                                 STATUSBAR UPDATE SUBROUTINE                                 >#
#<=============================================================================================>#
STATUSBAR:
     put #statusbar 2 AFK Keep Alive Script (AFK.Cmd)
     put #statusbar 3 Type STOP to abort script.
     put #statusbar 4
     put #statusbar 5
     return
#<---------------------------------------------------------------------------------------->#
STATUSBAR.CLEAR:
     put #statusbar 2
     put #statusbar 3
     put #statusbar 4
     put #statusbar 5
     return
#<=============================================================================================>#
#<                                     END SCRIPT SUBROUTINE                                   >#
#<=============================================================================================>#
END.SCRIPT:
     action clear
     gosub clear
     pause 0.3
     gosub STATUSBAR.CLEAR
     put #parse SCRIPT ABORTED!
     put #script abort %Current.Script
     exit
#<=============================================================================================>#
#<                                         BASE ACTIONS                                        >#
#<=============================================================================================>#
BASE.ACTIONS:
     action clear
#<---------------------------------------------------------------------------------------->#
#<                                  Trigger to end script.                                >#
#<---------------------------------------------------------------------------------------->#
     action goto END.SCRIPT when ^What do you want to stop\?
#<---------------------------------------------------------------------------------------->#
#<                              Trigger to prevent idling out.                            >#
#<---------------------------------------------------------------------------------------->#
     action send LOOK when eval $useridle = 1
     action send LOOK when ^YOU HAVE BEEN IDLE TOO LONG\. PLEASE RESPOND\.$
#<---------------------------------------------------------------------------------------->#
#<                                Trigger to Feed Caravan.                                >#
#<---------------------------------------------------------------------------------------->#
     action send REMOVE FEEDBAG;send GIVE CARAVAN;send WEAR FEEDBAG when ^The caravan driver watches with satisfaction as the animals in his care finish off the last of their feed\.$
     action send REMOVE FEEDBAG;send GIVE CARAVAN;send WEAR FEEDBAG when ^The driver of your caravan calls over to you\, \"They are done with that last bit of feed, (?:sir|madam)\!\"$
#<---------------------------------------------------------------------------------------->#
#<                       Triggers to initiate Panic Exit subroutine.                      >#
#<---------------------------------------------------------------------------------------->#
     action goto EXIT.NOW when ^(\w+) reaches over and holds your hand\.
     action goto EXIT.NOW when ^(\w+) clasps your hand tenderly\.
     action goto EXIT.NOW when ^(\w+) grabs your arm and drags you.*\.
     action goto EXIT.NOW when ^(\w+) grabs your arm and tries to drag you, but you resist and stand firm\.
     action goto EXIT.NOW when ^\[You're .*\.\]$ .+\.\]$
     action goto EXIT.NOW when eval $dead = 1
     action goto EXIT.NOW when eval $health < 50
     action goto EXIT.NOW when eval $webbed = 1
     action goto EXIT.NOW when eval $stunned = 1
     action goto EXIT.NOW when eval $bleeding = 1
     action goto EXIT.NOW when eval $diseased = 1
     action goto EXIT.NOW when eval $poisoned = 1
     return
#<=============================================================================================>#
#<                                    PANIC EXIT SUBROUTINE                                    >#
#<=============================================================================================>#
EXIT.NOW:
     action clear
     gosub QUIT
     pause 0.3
     echo
     echo
     echo **** PANIC EXIT INITIATED ****
     echo
     echo
     pause 0.3
     put #script abort %Current.Script
     exit
#<=============================================================================================>#
#<                                       QUIT SUBROUTINE                                       >#
#<=============================================================================================>#
QUIT:
     matchre QUIT ^\.\.\.wait\s+\d+\s+sec(?:onds|s)?\.?$
     matchre QUIT ^Sorry,
     matchre RETURN ^\[\d+\:\d+\] Connection closed\.
     put QUIT
     matchwait
#<=============================================================================================>#
#<                                        GENERIC RETURN                                       >#
#<=============================================================================================>#
RETURN:
     return
#<=============================================================================================>#
#<                                         END OF SCRIPT                                       >#
#<=============================================================================================>#
