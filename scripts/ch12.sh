#!/bin/bash

ch12_1(){
    cmd1=([1]=": > out.txt" [2]="This command truncates out.txt or creates it if it doesn't exist")
    cmd2=([1]="> out.txt" [2]="This does the samem thing but in a simpler form")
    cmd3=([1]="alias mygrep='grep --color=tty -d skip'" [2]="Setting an alias for a command")
    cmd4=([1]="time ls" [2]="Internal time command")
    cmd5=([1]="/usr/bin/time ls" [2]="External time command")
    cmd6=([1]="help time" [2]="Help machanisms work only for external commands")
    
    run_command "${cmd1[1]}" "${cmd1[2]}"
    run_command "${cmd2[1]}" "${cmd2[2]}"
    run_command "${cmd3[1]}" "${cmd3[2]}"
    run_command "${cmd4[1]}" "${cmd5[2]}"
    run_command "${cmd5[1]}" "${cmd5[2]}"
    run_command "${cmd6[1]}" "${cmd6[2]}"
}

ch12_2(){
    cmd1=([1]="ls -l | sort" [2]="Two processes are created, one generated by the executable at /bin/ls and the other by /usr/bin/sort")
    run_command "${cmd1[1]}" "${cmd1[2]}"
}

ch12_3(){
    cmd1=([1]="if test 10 -gt 4; then echo 'mai mare'; else echo 'mai mic'; fi" [2]="Sample inline simple script")
    cmd2=([1]="echo 'echo \"Hello World\"' >> out.sh
    
bash out.sh" [2]="Simplest bash file creation and execution")

    run_command "${cmd1[1]}" "${cmd1[2]}"
    run_command "${cmd2[1]}" "${cmd2[2]}"
}
ch12_4(){
    # cmd#=([1]="" [2]="")
    cmd3=([1]="echo -n 'test'" [2]="-n deactivates implicit display of a newline character at the end of the line")
    cmd4=([1]="echo -e -ne 'test\n\t\ttest2\n'" [2]="-e allows interpretation of special characters")
    cmd5=([1]="printf '%s     %03d\n' 'test' 20" [2]="Allows the display of a string of chars at std output")
    run_command "${cmd3[1]}" "${cmd3[2]}"
    run_command "${cmd4[1]}" "${cmd4[2]}"
    run_command "${cmd5[1]}" "${cmd5[2]}"
}
menu_ch12(){
    clear_screen
    echo "Chapter Twelve "
    echo -e "(a) Internal & External Commands"
    echo -e "(b) Command chaining"
    echo -e "(c) Shell scripts"
    echo -e "(d) Simple shell commands"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch12(){
    echo -n "Please enter your choice: "
    read -r choice
    case $choice in 
        "a"|"A"|"1")
            clear_screen
            ch12_1
            pause
            ;;
        "b"|"B"|"2")
            clear_screen
            ch12_2
            pause
            ;;
        "c"|"C"|"3")
            clear_screen
            ch12_3
            pause
            ;;
        "d"|"D"|"4")
            clear_screen
            ch12_4
            pause
            ;;
        "x"|"X")
            clear_screen
            main_menu
            ;;
        *)
            echo -e "${RED}[${choice}]${STD} is not a valid option"
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