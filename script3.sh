!/bin/bash

#trap '' SIGINT SIGQUIT SIGTSTP

clear_screen() {
    clear && echo -en "\e[3J"
    RED='\033[0;41;30m'
    STD='\033[0;0;39m'
}

pause(){
    read -p "Press [Enter] key to continue..." pressEnterKey
}

clear_screen

while :
do
echo "Main Menu:"
echo -e "(a) More Menu Options "
echo -e "(b) Exit"
echo
echo -n "Please enter your choice: "
read choice
case $choice in
    "a"|"A")
    while :
    do
    clear_screen
    echo "Secondary menu"
    echo -e "(c) Print somethong"
    echo -e "(d) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read choice1
    case $choice1 in
        "c"|"C")
        clear_screen
        echo "Something"
        pause
        ;;
        "d"|"D")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice1}] is not a valid option${STD}"
        pause
        ;;
    esac
    done
    ;;
    "b"|"B")
    
    exit
    ;;
        *)
        echo -e "${RED}Please enter a valid option${STD}"
        pause
        clear_screen
        ;;

esac
done