# version 1.3
# uberwatch.cmd must be in SCRIPTS folder alongside other scripts
# This is a watcher script to make sure uber stays running and better recover from any disconnects

# Trigger to initiate Genie Fuckup subroutine.
action goto GENIE_FUCKUP when ^Your worn items are:
# RECONNECT ACTIONS
action (reconnect) goto RESTART when eval $useridle = 1
action (reconnect) goto RESTART when ^YOU HAVE BEEN IDLE TOO LONG
action (reconnect) goto WATCHERLOOP when ^You look around, taking a moment to get your bearings|^Welcome to DragonRealms
action (reconnect) goto RECONNECT when eval ($connected = 0)
action (reconnect) goto RECONNECT when ^Reconnect aborted|Unable to contact Genie Key server|^Please make sure that your internet connection|Connection closed\.|\(ConnectionTimedOut\)|No user input since last connect
action (reconnect) goto RECONNECT when ^Connection lost|^ConnectionAborted|^Socket Error|^ReceiveCallback Exception|Unable to contact Genie Key server|Unable to get login key\.
action goto RECONNECT_OFF when ^DISCONNECTING\!
action goto RECONNECT_ON when ^DONECONNECT\!
action (reconnect) on

WATCHERLOOP:
     delay 0.001
     if !matchre("$scriptlist", "uber\b") then goto RESTART
     var MODE $UC_Mode
     var CurrentTime $gametime
     delay 35
     if (%CurrentTime = $gametime) then goto WATCHERCHECK
     goto WATCHERLOOP

WATCHERCHECK:
     delay 0.001
     matchre WATCHERLOOP Please check NEWS NEXT|Welcome to DragonRealms|Obvious (paths|exits)|It's pitch|^You also see|^Also here|^Sorry|^You can only
     put look
     matchwait 25
WATCHERRECONNECT:
     put #echo >Log #4dc3ff * Uberwatch detected D/C! - Reconnecting..
     pause 0.1
WATCHERRECONNECT1:
     pause 0.3
     put #connect
     pause 7
     put look
     pause 7
     if ($connected = 0) then goto WATCHERRECONNECT1
     put #parse RECONNECTED!
     goto WATCHERLOOP

RESTART:
     delay 0.0001
     if matchre("$scriptlist", "uber\b") then goto WATCHERLOOP
     put #script abort all except %scriptname
     echo
     echo *** ERROR?? SCRIPT NOT RUNNING! RESTARTING UBER!
     echo *** MODE: %MODE
     echo
     pause 0.1
     pause 0.2
     if !matchre("%MODE", "(?i)NORMAL") then
          {
               put .uber %MODE
          }
     else put .uber
     pause
     goto WATCHERLOOP
    
RECONNECT_OFF:
     action (reconnect) off
     goto WATCHERLOOP
     
RECONNECT_ON:
     action (reconnect) on
     goto WATCHERLOOP

### CONNECT SUB
RECONNECT:
     delay 0.0001
     put #script abort all except %scriptname
     echo
     echo *** Uberwatch Detected Disconnect!
     echo *** Attempting reconnect..
     echo
     gosub CONNECT_NOW
     goto WATCHERLOOP
     
CONNECT:
     delay 0.0001
     var connectloop 0
     pause 300
     goto CONNECT_RETRY
CONNECT_NOW:
     action (reconnect) off
     delay 0.0001
     var connectloop 0
CONNECT_RETRY:
     delay 0.0001
     pause 0.01
     math connectloop add 1
     if (%connectloop > 4) then goto CONNECT_WAIT
     pause 0.1
     put #echo >Log #99ddff * Reconnect Attempt %connectloop
CONNECTING:
     pause 0.1
     pause 0.1
     if ($connected = 1) then goto CONNECTED
     put #connect
     pause 4
     put look
     pause 3
     pause 2
     matchre CONNECTED Please check NEWS NEXT|Welcome to DragonRealms|Obvious (paths|exits)|It's pitch|^You also see|^Also here
     send look
     matchwait 20
     if ($connected = 0) then goto CONNECT_RETRY
     goto CONNECT_RETRY
CONNECTED:
     pause 0.3
     put #echo >Log #4dc3ff  * Reconnected!
     put #parse RECONNECTED!
     pause 2
     unvar connectloop
     # action (reconnect) on
     return
CONNECT_WAIT:
     pause 0.1
     put #echo >Log LightCyan * Reconnect Failed - pausing 5 minutes..
     pause 60
     goto CONNECT
     
GENIE_FUCKUP:
   put #echo >Log #cc00ff * GENIE FUCKUP - ATTEMPTING TO  AUTO RECOVER!! *
RESTART.GENIE:
   action (reconnect) off
   delay 0.0001
   var main_script_cmd $scriptlist(0)
   eval main_script replace("%main_script_cmd", ".cmd", "")
   put /restart $charactername$gamename .%main_script
   put #beep
   put quit
   # put #script abort all
   exit