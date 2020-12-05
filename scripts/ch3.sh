chapter_three_manage() {

    ch1=([1]="cat /etc/passwd" [2]="List passwd contents...")
    ch2=([1]="sudo cat /etc/shadow" [2]="List shadow contents...(requires elevation)")
    ch3=([1]="id $USER" [2]="Get infor about current user...")
    ch4=([1]="sudo adduser george" [2]="Add a new user called 'george'")
    ch5=([1]="sudo deluser george" [2]="Delete the previously created user 'george'")
    ch6=([1]="sudo addgroup students" [2]="Create a new user group called 'students'")
    ch7=([1]="sudo delgroup students" [2]="Delete the previously created group 'students'")
    ch8=([1]="groupadd testg
    
sudo useradd --home /home/testh -m -g testg --comment \"Test\" testu" [2]="Create a new user 'testu' having the new group 'testg' and\nthe home '/home/testh'")
    ch9=([1]="testu:testp1234 | chpasswd" [2]="Set the password for the new user 'testu'")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    run_command  "${ch8[1]}" "${ch8[2]}"
    run_command  "${ch9[1]}" "${ch9[2]}"
}

chapter_three_packages() {
    ch1=([1]="sudo dpkg -L coreutils | tail" [2]="List the content of the package coreutils ")
    ch2=([1]="sudo dpkg -S /bin/ps" [2]="Find the package that contains the file /bin/ps ")
    ch3=([1]="sudo apt install gddrescue" [2]="Install the package gddrescue ")
    ch4=([1]="sudo apt remove gddrescue" [2]="Remove the package gddrescue ")
    ch5=([1]="sudo apt clean" [2]="Clean the local cache... ")
    ch6=([1]="sudo apt update" [2]="Update the package list... ")
    ch7=([1]="sudo apt upgrade" [2]="Download and install the available updates... ")
    ch8=([1]="sudo apt autoremove" [2]="Remove unneeded packages... ")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    run_command  "${ch8[1]}" "${ch8[2]}"
}

menu_ch3(){
    clear_screen
    echo "Chapter Three "
    echo -e "(a) Users and group management"
    echo -e "(b) Package management"
    echo -e "(x) Return to main menu"
    echo
}

read_opt_ch3(){
    echo -n "Please enter your choice: "
    read choice
    case $choice in 
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
            main_menu
            ;;
        *)
            echo -e "${RED}[${choice_sub}]${STD} is not a valid option"
            pause
            ;;
    esac
}

ch3(){
    while true
	do
		menu_ch3
		read_opt_ch3
	done
}