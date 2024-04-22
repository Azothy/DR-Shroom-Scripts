############################################
## GETPUT by SHROOM
## USAGE:  .getput $1 $2 $3
## .getput <ITEM> <FROM THIS CONTAINER> <PUT IN THIS CONTAINER>
## .getput leather.pouch backpack rucksack
# Will transfer all "leather pouches" from backpack and put them in rucksack. 
# IF using multiple words for one variable use a period instead of space
# ie  .getput my.sword  my.backpack  rucksack.on.shelf
#
# NOTES - Be specific with item names! 
# Use . instead of spaces for 2 word items
# Use MY when working with possible conflicting containers in the room ex:
#
# .getput rock back.on.shelf my.backpack
# Will get all "rocks" from "backpack on shelf" and put them in "your backpack"
#
# .getput arrow shelf my.quiver
# Get all arrows from a shelf and put in your quiver  


ECHO ==============================================
ECHO ** CORRECT SYNTAX IS .getput <item> <from this container> <put into this container>
ECHO ** .getput $1 $2 $3
ECHO ** 1 = item name,  2 = from this container,  3 = put in this container
ECHO **
ECHO ** USAGE: .getput $1 $2 $3
ECHO ** .getput <ITEM> from <BAG> put it in <BAG>
ECHO ==============================================
if_1 then goto Loop
exit

Loop:
     pause 0.00001
     matchre Loop ^\.\.\.wait|^Sorry\,
     matchre DONE ^What were|^I could
     matchre PUT ^You get
     put get %1 from %2
     matchwait 5
     goto DONE

PUT:
     put put %1 in %3
     pause 0.001
     pause 0.001
     goto Loop

DONE:
echo *** DONE! ***
exit