#!/bin/bash

#trap '' SIGINT SIGQUIT SIGTSTP

source ./config.sh
source ./ch3.sh
source ./ch4.sh
source ./ch5.sh
source ./ch11.sh
source ./ch12.sh

entrypoint() {
while :
do
echo "Main Menu:"
echo -e "(a) Chapter  3 - Users and packages"
echo -e "(b) Chapter  4 - File Systems"
echo -e "(c) Chapter  5 - Processes"
echo -e "(d) Chapter  6 - System boot & init" 
echo -e "(e) Chapter  7 - Hardware analysis"
echo -e "(f) Chapter  8 - Network config"
echo -e "(g) Chapter  9 - Network services"
echo -e "(h) Chapter 11 - Compiling & linking"
echo -e "(i) Chapter 12 - More shell scripting?"
echo -e "(y) Cleanup!"
echo -e "(z) Exit"
echo
echo -n "Please enter your choice: "

read choice_main
case $choice_main in
    "a"|"A"|"3")
    while :
    do
    clear_screen
    echo "Chapter Three "
    echo -e "(a) Users and group management"
    echo -e "(b) Package management"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read ch3
    case $ch3 in 
        "a"|"A"|"1")
        clear_screen
        chapter_three_manage
        pause
        ;;
        "b"|"B"|"2")
        clear_screen
        chapter_three_packages
        pause
        ;;
        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;
    
    "b"|"B"|"4")
    while :
    do
    clear_screen
    echo "Chapter Four - File Systems "
    echo -e "(a) Working with files"
    echo -e "(b) Output redirection"
    echo -e "(c) Access rights"
    echo -e "(d) Find files"
    echo -e "(e) Drives and mounts"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read ch4
    case $ch4 in
        "a"|"A"|"1")
        clear_screen
        chapter_four_files
        pause
        ;;

        "b"|"B"|"2")
        clear_screen
        chapter_four_redirection
        pause
        ;;

        "c"|"C"|"3")
        clear_screen
        chapter_four_rights
        pause
        ;;

        "d"|"D"|"4")
        clear_screen
        chapter_four_find
        pause
        ;;

        "e"|"E"|"5")
        clear_screen
        chapter_four_disc_state
        pause
        ;;

        "x"|"X"|"0")
        clear_screen
        break
        ;;

        *)
        echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;

    "c"|"C"|"5")
    while :
    do
    clear_screen
    echo "Chapter Five "
    echo -e "(a) Process information"
    echo -e "(b) Jobs, Daemons, Background processes & Signals"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read ch5
    case $ch5 in
        "a"|"A"|"1")
        clear_screen
        chapter_five_processes
        pause
        ;;

        "b"|"B"|"2")
        clear_screen
        chapter_five_background
        pause
        ;;

        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;
    
    "h"|"H"|"11")
    while :
    do
    clear_screen
    echo "Chapter Eleven "
    echo -e "(a) Simple compiling"
    echo -e "(b) Speciying exe name"
    echo -e "(c) Multiple sources compiling"
    echo -e "(d) Compiling stages"
    echo -e "(e) Optimising compression and compiling speed"
    echo -e "(f) Executable file analysis"
    echo -e "(g) Compiling with make"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read ch11
    case $ch11 in
        "a"|"A"|"1")
        clear_screen
        chapter_eleven_1
        pause
        ;;
        "b"|"B"|"2")
        clear_screen
        chapter_eleven_2
        pause
        ;;
        "c"|"C"|"3")
        clear_screen
        chapter_eleven_3
        pause
        ;;
        "d"|"D"|"4")
        clear_screen
        chapter_eleven_4
        pause
        ;;
        "e"|"E"|"5")
        clear_screen
        chapter_eleven_5
        pause
        ;;
        "f"|"F"|"6")
        clear_screen
        chapter_eleven_6
        pause
        ;;
        "g"|"G"|"7")
        clear_screen
        chapter_eleven_7
        pause
        ;;

        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;


    "i"|"I"|"12")
    while :
    do
    clear_screen
    echo "Chapter Twelve "
    echo -e "(a) History and automatic fill"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read ch12
    case $ch12 in
        "a"|"A"|"1")
        clear_screen
        chapter_twelve_1
        pause
        ;;

        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;


    "y"|"Y")
    clear_screen
    cleanup
    pause
    ;;

    "z"|"Z")
    clear_screen
    cleanup
    clear_screen
    echo -e "${GREEN}Thank you for your time!${STD}"
    pause
    clear
    exit 0
    ;;

    *)
    echo -e "${RED}[${choice_main}]${STD} is not a valid option"
    pause
    clear_screen
    ;;

esac
done
}

# Entry point
entrypoint

