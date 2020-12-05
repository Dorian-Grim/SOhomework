#!/bin/bash

chapter_twelve_1(){
    cmd1=([1]="\^r" [2]="asd")
    run_command  "${cmd1[1]}" "${cmd1[2]}"
}

menu_ch12(){
    clear_screen
    echo "Chapter Twelve "
    echo -e "(a) History and automatic fill"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch12(){
    echo -n "Please enter your choice: "
    read choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            chapter_twelve_1
            pause
            ;;
        "x"|"X")
            clear_screen
            main_menu
            ;;
        *)
            echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
            pause
            ;;
    esac
}

ch12(){
    while true
	do
		menu_ch12
		read_opt_ch12
	done
}