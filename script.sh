#!/bin/bash

clear && echo -en "\e[3J"
RED='\033[0;41;30m'
STD='\033[0;0;39m'

pause(){
    read -p "Press [Enter] key to continue..." fackEnterKey
}

submenu_one() {
    local choiceOne
    show_sub_one(){
        clear
        echo "~~~~~~~~~~~~~~~~~~~~~"	
        echo " Submenu 1"
        echo "~~~~~~~~~~~~~~~~~~~~~"
        echo "1. Option 1"
        echo "2. Option 2"
        echo "0. Return"
   }
    read_options_one(){
		read -p "Enter choice [ 0 - 2] " choiceOne
	    case $choiceOne in
		    1) submenu_one ;;
		    2) submenu_two ;;
		    0) break ;;

		    *) echo -e "${RED}Invalid option...${STD}" && sleep 2
	    esac
    }
    
    while true 
    do
    show_sub_one
    read_options_one
    done
}

submenu_two() {
    clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " Submenu 2"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Option 1"
	echo "2. Option 2"
	echo "0. Return"
}

show_main_menu() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Submenu 1"
	echo "2. Submenu 2"
	echo "0. Exit"
}

read_main_options() {
	local choice
	read -p "Enter choice [ 0 - 2] " choice
	case $choice in
		1) submenu_one ;;
		2) submenu_two ;;
		0) exit 0;;

		*) echo -e "${RED}Invalid option...${STD}" && sleep 2
	esac
}

trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_main_menu
	read_main_options
done