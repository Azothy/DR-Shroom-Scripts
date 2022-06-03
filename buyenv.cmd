counter set 0

START:
pause 0.1
matchre DONE ^You realize you don't
matchre STOW The sales clerk hands|You decide to purchase
send buy env on tab
matchwait 2

STOW:
counter add 1
send put env in back in hav
goto START

DONE:
ECHO *** DONE
ECHO *** Bought %c envelopes
exit