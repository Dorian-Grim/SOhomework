#!/bin/bash

#trap '' SIGINT SIGQUIT SIGTSTP

RED='\033[0;41;30m'
STD='\033[0;0;39m'
GREEN='\033[0;32m'

clear_screen() {
    clear && echo -en "\e[3J"
}

pause(){
    read -p "Press [Enter] key to continue..." pressEnterKey
}


clear_screen



chapter_three_manage() {
    echo ""
    echo -e "${GREEN}List passwd contents...${STD}"
    echo "cat /etc/passwd"
    pause
    cat /etc/passwd

    echo ""
    echo -e "${GREEN}List shadow contents...(requires elevation)${STD}"
    echo "sudo cat /etc/shadow"
    pause
    sudo cat /etc/shadow

    echo ""
    echo -e "${GREEN}Get infor about current user...${STD}"
    echo "id $USER"
    pause
    id $USER

    newuser=george
    
    echo ""
    echo -e "${GREEN}Add a new user called 'george' ${STD}"
    echo "sudo adduser $newuser"
    pause
    sudo adduser $newuser

    echo ""
    echo -e "${GREEN}Delete the previously created user '${newuser}' ${STD}"
    echo "sudo deluser ${newuser}"
    pause
    sudo deluser $newuser

    newgroup=students
    echo ""
    echo -e "${GREEN}Create a new user group called '${newgroup}' ${STD}"
    echo "sudo addgroup ${newgroup}"
    pause
    sudo addgroup $newgroup

    echo ""
    echo -e "${GREEN}Delete the previously created group '${newgroup}' ${STD}"
    echo "sudo delgroup ${newgroup}"
    pause
    sudo delgroup $newgroup

    testuser="testu"
    testgroup="testg"
    testgid=9001
    testhome=/home/testh
    testpass="testp1234"

    echo ""
    echo -e "${GREEN}Create a new user '${testuser}' having the new group '${testgroup}' and\nthe home '${testhome}' ${STD}"
    echo "groupadd ${testgroup}"
    echo "sudo useradd --home $testhome -m -g $testgroup --comment "Test" $testuser"
    pause
    sudo groupadd -g $testgid $testgroup
    sudo useradd --home $testhome -m -g $testgroup --comment "Test" $testuser

    echo ""
    echo -e "${GREEN}Set the password for the new user '${testuser}' ${STD}"
    echo "echo "$testuser:$testpass" | chpasswd"
    pause
    echo "${testuser}:${testpass}" | chpasswd

}

chapter_three_packages() {

    package="coreutils"
    echo ""
    echo -e "${GREEN}List the content of the package ${package} ${STD}"
    echo "dpkg -L ${package}"
    pause
    sudo dpkg -L $package | tail

    file="/bin/ps"
    echo ""
    echo -e "${GREEN}Find the package that contains the file ${file} ${STD}"
    echo "dpkg -S ${file}"
    pause
    sudo dpkg -S $file

    new_package="gddrescue"
    echo ""
    echo -e "${GREEN}Install the package ${new_package} ${STD}"
    echo "sudo apt install ${new_package}"
    pause
    sudo apt install $new_package

    echo ""
    echo -e "${GREEN}Remove the package ${new_package} ${STD}"
    echo "sudo apt remove ${new_package}"
    pause
    sudo apt remove $new_package

    echo ""
    echo -e "${GREEN}Clean the local cache... ${STD}"
    echo "sudo apt clean"
    pause
    sudo apt clean

    echo ""
    echo -e "${GREEN}Clean the local cache... ${STD}"
    echo "sudo apt clean"
    pause
    sudo apt clean

    echo ""
    echo -e "${GREEN}Update the package list... ${STD}"
    echo "sudo apt update"
    pause
    sudo apt update

    echo ""
    echo -e "${GREEN}Download and install the available updates... ${STD}"
    echo "sudo apt upgrade"
    pause
    sudo apt upgrade

    echo ""
    echo -e "${GREEN}Remove unneeded packages... ${STD}"
    echo "sudo apt autoremove"
    pause
    sudo apt autoremove

}

chapter_four_files() {

    echo ""
    echo -e "${GREEN}Print the working directory...${STD}"
    echo "pwd"
    pause
    pwd

    echo ""
    echo -e "${GREEN}Create a file...${STD}"
    echo "touch file1.txt"
    pause
    touch file1.txt

    echo ""
    echo -e "${GREEN}List files...${STD}"
    echo "ls -al"
    pause
    ls -al

    echo ""
    echo -e "${GREEN}Copy file...${STD}"
    echo "cp file1.txt file2.txt"
    pause
    cp file1.txt file2.txt

    echo ""
    echo -e "${GREEN}Delete file...${STD}"
    echo "rm file1.txt"
    pause
    rm file1.txt

    echo ""
    echo -e "${GREEN}Rename file...${STD}"
    echo "mv file2.txt newfile.txt"
    pause
    mv file2.txt newfile.txt

    echo ""
    echo -e "${GREEN}Create directory...${STD}"
    echo "mkdir dir1 dir2 dir3"
    pause
    mkdir dir1 dir2 dir3
    
    echo ""
    echo -e "${GREEN}Delete empty dir...${STD}"
    echo "rmdir dir2"
    pause
    rmdir dir2

    echo ""
    echo -e "${GREEN}Create files using relative path...${STD}"
    pause
    echo "touch dir3/test1.txt dir3/test2.txt"
    touch dir3/test1.txt dir3/test2.txt
    echo "ls -a ~/ > dir3/test3.txt"
    ls -a ~/ > dir3/test3.txt

    echo ""
    echo -e "${GREEN}List dir contents recursive...${STD}"
    echo "ls -R"
    pause
    ls -lR

    echo ""
    echo -e "${GREEN}Delete dir recursive...${STD}"
    echo "rm -rf dir3"
    pause
    rm -rf dir3

    temp_path="/etc"
    file_name="new_archive.tar"
    echo ""
    echo -e "${GREEN}Archive files with 'tar'${STD}"
    echo "sudo tar cvf ${file_name} ${temp_path}"
    pause
    sudo tar cvf $file_name $temp_path

    temp_path="/etc"
    file_name2="new_gzip_archive.tar.gz"
    echo ""
    echo -e "${GREEN}Archive files with 'tar' and compressed with 'gzip'${STD}"
    echo "sudo tar cvf ${file_name2} ${temp_path}"
    pause
    sudo tar czvf $file_name2 $temp_path

    temp_path="~/"
    
}
chapter_four_redirection(){
    list_file="listare.txt"
    echo ""
    echo -e "${GREEN}Output 'ls' result to file...${STD}"
    echo "ls > ${list_file}"
    pause
    ls > $list_file

    echo ""
    echo -e "${GREEN}Display ${list_file} using 'cat' command${STD}"
    echo "cat ${list_file}t"
    pause
    cat $list_file

    echo ""
    echo -e "${GREEN}Add 'data' command output at the end of ${list_file}${STD}"
    echo "date >> ${list_file}"
    pause
    date >> $list_file

    error_file="erori.txt"
    echo ""
    echo -e "${GREEN}Store error of 'cp' command to ${error_file}${STD}"
    echo "cp $list_file 2> $error_file"
    pause
    cp $list_file 2> $error_file

    echo ""
    echo -e "${GREEN}Store the result and errors of 'ls' command to ${list_file}${STD}"
    echo "ls fisier1.txt fisier4.txt 2>&1 > ${list_file}"
    pause
    ls fisier1.txt fisier4.txt 2>&1 > $list_file

    echo ""
    echo -e "${GREEN}Display contents of ${list_file} using 'cat' command${STD}"
    echo "cat ${list_file}t"
    pause
    cat $list_file

}


cleanup(){
    rmdir dir1
    rm -f newfile.txt
    sudo deluser testu
    sudo delgroup testg
    sudo rm -rf /home/testh
    rm -f new_archive.tar
    rm -f new_gzip_archive.tar.gz
}

while :
do
echo "Main Menu:"
echo -e "(a) Chapter Three "
echo -e "(b) Chapter Four - File Systems"
echo -e "(z) Exit"
echo
echo -n "Please enter your choice: "
read choice
case $choice in
    "a"|"A")
    while :
    do
    clear_screen
    echo "Chapter Three "
    echo -e "(a) Users and group management"
    echo -e "(b) Package management"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read choice1
    case $choice1 in
        "a"|"A")
        clear_screen
        chapter_three_manage
        pause
        ;;
        "b"|"b")
        clear_screen
        chapter_three_packages
        pause
        ;;
        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice1}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;
    
    "b"|"B")
    while :
    do
    clear_screen
    echo "Chapter Four - File Systems "
    echo -e "(a) Working with files"
    echo -e "(b) Item 2"
    echo -e "(x) Return to main menu"
    echo
    echo -n "Please enter your choice: "
    read choice2
    case $choice2 in
        "a"|"A")
        clear_screen
        chapter_four_files
        pause
        ;;
        "b"|"b")
        clear_screen
        pause
        ;;
        "x"|"X")
        clear_screen
        break
        ;;
        *)
        echo -e "${RED}[${choice2}]${STD} is not a valid option"
        pause
        ;;
    esac
    done
    ;;
    "z"|"Z")
    clear_screen
    echo "Cleaning up..."
    pause
    cleanup
    clear_screen
    echo -e "${GREEN}Thank you!${STD}"
    pause
    clear
    exit
    ;;
        *)
        echo -e "${RED}[${choice}]${STD} is not a valid option"
        pause
        clear_screen
        ;;

esac
done
