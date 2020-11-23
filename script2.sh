#!/bin/bash

clear_screen(){
    clear && echo -en "\e[3J"
    RED='\033[0;41;30m'
    STD='\033[0;0;39m'
}

pause(){
    read -p "Press [Enter] key to continue..." fackEnterKey
}

while true
do
  echo "Main Menu"
  PS3=$MAINPROMPT

  select option in "mango (has a sub-menu)" tango rango exit
  do
    case $REPLY in
      1) 
         
         while true
         do
           echo "nmango sub-menu title"
           PS3=$MANGOPROMPT
           select option1 in add substract exit
           do
             case $REPLY in
               1) 
                  echo "You picked [add]"
                  break
                  ;;
               2) echo "You picked [subtract]"
                  break
                  ;;
               3) break 2  # Breaks out 2 levels, the select loop plus the mango while loop, back to the main loop.
                  ;;
               *) echo -e "${RED}[${REPLY}] is not a valid option${STD}"
                  break
                  ;;
             esac
           done
         done
         break
         ;;
      2) # tango
         ;&  # Fall through to #3
      3) #rango
         echo "You picked $option"
         break
         ;;
      4) # exit
         break 2  #  Break out 2 levels, out of the select and the main loop.
         ;;
      *) # Always code for the unexpected.
         echo -e "${RED}[${REPLY}] is not a valid option${STD}"
         break
         ;;
    esac
  done
done
