#!/bin/bash

#trap '' SIGINT SIGQUIT SIGTSTP

BLUE='\e[34m'
RED='\033[0;41;30m'
STD='\033[0;0;39m'
GREEN='\033[0;32m'

clear_screen() {
    clear && echo -en "\e[3J" # the second part is a fix for the console scroolbar
}

pause(){
    read -p "Press [Enter] key to continue..." pressEnterKey
}



clear_screen

run_command_prompt(){
    read -e -p "Run this command? [y/n] " YN
    if [[ {$YN,,} =~ "y" || $YN == "" ]]; then true return; else false return; fi;
}

run_command(){
    cmd=$1
    desc=$2

    echo ""
    echo -e "COMMAND: ${BLUE}${cmd}
${GREEN}${desc}${STD}"
    if run_command_prompt == 1; then 
    echo -e "${BLUE}${cmd}${STD}"
    eval "${cmd}"
    echo ""
    echo -e "${GREEN}Done!${STD}"
    else clear_screen;fi
}

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

chapter_four_files() {
    ch1=([1]="pwd" [2]="Print the working directory...")
    ch2=([1]="touch file1.txt" [2]="Create a file...")
    ch3=([1]="ls -al" [2]="List files...")
    ch4=([1]="cp file1.txt file2.txt" [2]="Copy file...")
    ch5=([1]="rm file1.txt" [2]="Delete file...")
    ch6=([1]="mv file2.txt newfile.txt" [2]="Rename file...")
    ch7=([1]="mkdir dir1 dir2 dir3" [2]="Create directory...")
    ch8=([1]="rmdir dir2" [2]="Delete empty dir...")
    ch9=([1]="touch dir3/test1.txt dir3/test2.txt

ls -a ~/ > dir3/test3.txt" [2]="Create files using relative path...")
    ch10=([1]="ls -lR" [2]="List dir contents recursive...")
    ch11=([1]="rm -rf dir3" [2]="Delete dir recursive...")
    ch12=([1]="sudo tar cvf new_archive.tar /etc" [2]="Archive files with 'tar'")
    ch13=([1]="sudo tar czvf new_gzip_archive.tar.gz /etc" [2]="Archive files with 'tar' and compressed with 'gzip'")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    run_command  "${ch8[1]}" "${ch8[2]}"
    run_command  "${ch9[1]}" "${ch9[2]}"
    run_command  "${ch10[1]}" "${ch10[2]}"
    run_command  "${ch11[1]}" "${ch11[2]}"
    run_command  "${ch12[1]}" "${ch12[2]}"
    run_command  "${ch13[1]}" "${ch13[2]}"
    
}
chapter_four_redirection(){
    list_file="listare.txt"
    error_file="erori.txt"
    ch1=([1]="ls > $list_file" [2]="Output 'ls' result to file...")
    ch2=([1]="cat $list_file" [2]="Display ${list_file} using 'cat' command")
    ch3=([1]="date >> $list_file" [2]="Add 'data' command output at the end of ${list_file}")
    ch4=([1]="cat $list_file" [2]="Display ${list_file} using 'cat' command")
    ch5=([1]="cp $list_file 2> $error_file" [2]="Store error of 'cp' command to ${error_file}")
    ch6=([1]="ls fisier1.txt fisier4.txt 2>&1 > $list_file" [2]="Store the result and errors of 'ls' command to ${list_file}")
    ch7=([1]="cat $list_file" [2]="Display contents of ${list_file} using 'cat' command")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"

}

chapter_four_rights() {
    ch1=([1]="touch fisier.txt" [2]="Create a new file called fisier.txt to inspect rights")
    ch2=([1]="ls -l fisier.txt" [2]="List files with details")
    ch3=([1]="chmod 777 fisier.txt" [2]="Set access rights to 777")
    ch4=([1]="ls -l fisier.txt" [2]="List files with details")
    ch5=([1]="chmod u=rwx,g=r,o=- fisier.txt" [2]="Set access rights using literal form")
    ch6=([1]="ls -l fisier.txt" [2]="List files with details")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"

}

chapter_four_find() {
    ch1=([1]="sudo find /home -name .bashrc" [2]="Find files matching '.bashrc' in the /home ")
    ch2=([1]="sudo find/usr -size +500k" [2]="Find files larger '+500k' in the /usr ")
    ch3=([1]="locate pwd" [2]="Find files containing 'pwd' using the 'locate' command ")
    ch4=([1]="whereis ls" [2]="Find 'ls' using the 'whereis' command ")
    ch5=([1]="which bash" [2]="Find the path of 'bash' using the 'which' command ")
    ch6=([1]="type cd; type cat" [2]="Determien if 'cd/cat' is a builtin/external/allias command ")
    ch7=([1]="file /bin/id" [2]="Find the file type of '/bin/id' using the 'file' command ")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    
}

chapter_four_disc_state() {
    loopdev="loop9"
    image="image.img"
    ch1=([1]="mount | more" [2]="Display mounted file systems")
    ch2=([1]="sudo cat /etc/mtab | more" [2]="Display mounted file systems at system startup")
    ch3=([1]="sudo dd if=/dev/zero of=$image iflag=fullblock bs=1M count=500 && sync" [2]="Create and empty disk image ")
    ch4=([1]="sudo sudo losetup $loopdev $image" [2]="Create a loop device with the newly created disk image as /dev/${loopdev} ")
    ch5=([1]="sudo parted --script /dev/${loopdev} \
mklabel gpt \
mkpart primary ext4 1MiB 500MB" [2]="Create a new GPT partition table on /dev/${loopdev} using 'parted' command and a EXT4 partition using the whole disk space")
    ch6=([1]="sudo mkfs -t ext4 /dev/${loopdev}p1" [2]="Format the newly created partition /dev/${loopdev}p1 using the 'mkfs' command ")
    ch7=([1]="sudo mkdir -p /mnt/loop9
sudo mount /dev/${loopdev}p1 /mnt/loop9" [2]="We will mount /dev/${loopdev}p1 to /mnt/loop9 ")
    ch8=([1]="mount | grep ${loopdev}" [2]="Display mounted file system")
    ch9=([1]="df -h | grep ^/dev" [2]="Display disk utilisation")
    ch10=([1]="sudo umount /dev/${loopdev}p1
sudo fsck -t ext4 /dev/${loopdev}p1" [2]="To check the filesystem for errors we need to firstly unmount it then run the 'fsck' command against it ")
    ch11=([1]="sudo umount /dev/loop9
sudo losetup -d /dev/${loopdev}
sudo -f rm $image
sudo rmdir /mnt/loop9" [2]="Cleaning up...")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    run_command  "${ch8[1]}" "${ch8[2]}"
    run_command  "${ch9[1]}" "${ch9[2]}"
    run_command  "${ch10[1]}" "${ch10[2]}"
    run_command  "${ch11[1]}" "${ch11[2]}"
}

chapter_five_processes() {
    ch1=([1]="ps" [2]="Display processes using the 'ps' command")
    ch2=([1]="ps -A" [2]="Display ALL processes using the 'ps'")
    ch3=([1]="ps -u root" [2]="Display processes using the 'ps' command just for the 'root' user ")
    ch4=([1]="ps -F" [2]="Display processes using the 'ps' command with details and formated output")
    ch5=([1]="pstree" [2]="Display process hierarhy using the 'pstree' command ")
    ch6=([1]="toptop -bn 1 2>&1" [2]="Display processes in realtime using the 'top' command ")
    ch7=([1]="ls /proc" [2]="Display the contents of the '/proc' file system ")
    ch8=([1]="head /proc/cpuinfo" [2]="Display cpu from '/proc' ")
    ch9=([1]="head /proc/meminfo" [2]="Display memory from '/proc' ")
    ch10=([1]="tail /proc/partitions" [2]="Display partitions from '/proc' ")
    ch11=([1]="cat /proc/uptime" [2]="Display uptime from '/proc' ")

    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"
    run_command  "${ch7[1]}" "${ch7[2]}"
    run_command  "${ch8[1]}" "${ch8[2]}"
    run_command  "${ch9[1]}" "${ch9[2]}"
    run_command  "${ch10[1]}" "${ch10[2]}"
    run_command  "${ch11[1]}" "${ch11[2]}"

}

chapter_five_background() {
    ch1=([1]="sudo updatedb &" [2]="Run some processes in the background")
    ch2=([1]="top &" [2]="Show the Linux processes")
    ch3=([1]="jobs" [2]="Display current jobs")
    ch4=([1]="sudo nohup updatedb &" [2]="Run a process as a daemon")
    ch5=([1]="sudo ps ax" [2]="Display all processes")
    ch6=([1]="kill -l" [2]="Display all 'kill' signals")
    
    run_command  "${ch1[1]}" "${ch1[2]}"
    run_command  "${ch3[1]}" "${ch2[2]}"
    run_command  "${ch3[1]}" "${ch3[2]}"
    run_command  "${ch4[1]}" "${ch4[2]}"
    run_command  "${ch5[1]}" "${ch5[2]}"
    run_command  "${ch6[1]}" "${ch6[2]}"

}

chapter_elevel_1(){
    aptGet=([1]="apt-get install gcc libc6-dev manpages-dev glibc-doc make" [2]="This will install necessary packages for developing C apps under Ubuntu (gcc, libc6-dev).
It is recomended to install the manual (manpages-dev) and the documentation of the library (glibc-doc).
Also the make utility (make)")
    createC=([1]="echo '#include <stdio.h>

main()
{
    printf(\"My first C script in Linux\");
}' > myCscript.c" [2]="This will create a file named myCscript, with the c extension, along with the contents provided.
It will be used further in chapter 11.")
    compileGCC=([1]="gcc myCscript.c" [2]="This will compile our .c file and creat an executable a.out file.")
    runCompiled=([1]="./a.out" [2]="Run previously obtained executable file.")
    run_command  "${aptGet[1]}" "${aptGet[2]}"
    run_command  "${createC[1]}" "${createC[2]}"
    run_command  "${compileGCC[1]}" "${compileGCC[2]}"
    run_command  "${runCompiled[1]}" "${runCompiled[2]}"
}
chapter_elevel_2(){
    exeAsArg=([1]="gcc myCscript.c -o my_exec" [2]="You can even specify the name of the executable which you desire by using -o followed by the name of the executable.")
    runExec=([1]="./my_exec" [2]="Run previously obtained executable file.")
    oCanBeAnyWhere=([1]="gcc -o my_other_exec myCscript.c" [2]="You can place the -o option anywhere in the command as long as it is followed by the name of the executable file.")
    runOther=([1]="./my_other_exec" [2]="Run previously obtained executable file.")
    demoWall=([1]="gcc -Wall myCscript.c -o my_exec" [2]="The program compiled was intentionally not respecting C standards (main is missing it's type, and the return is absent), by default the compiler won't display
any warning or errors. This can be changed by using the -Wall (warnings all) which tells the compiler to display warning messages for non-standard use of code.")
    run_command  "${exeAsArg[1]}" "${exeAsArg[2]}"
    run_command  "${runExec[1]}" "${runExec[2]}"
    run_command  "${oCanBeAnyWhere[1]}" "${oCanBeAnyWhere[2]}"
    run_command  "${runOther[1]}" "${runOther[2]}"
    run_command  "${demoWall[1]}" "${demoWall[2]}"
}
chapter_elevel_3(){
    multipleSources=([1]="echo '#include <stdio.h>
#include \"func.h\"
#define NUM 10

int main()
{
    printf(\"Suma (%d) - %d\\n\",NUM, sum(NUM));
    printf(\"Suma-alternanta(%d) = %d\\n\", NUM, sumalt(NUM));
    return 0;
}' > main.c

echo '#ifndef FUNC_H_
#define FUNC_H_

int sum(int n);
int sumalt(int n);

#endif' > func.h

echo 'int sum(int n)
{
    int sum = 0;
    for (int i = 1; i <= n; sum += i++);
    return sum;
}' > sum.c

echo '#include \"func.h\"
int sumalt(int n)
{
    int sum = 0;
    for (int i = 1; i <= n; sum += i % 2 == 0 ? i++ * -1 : i++);
    return sum;
}' > sumalt.c

gcc -Wall main.c sum.c sumalt.c -o exec_multiple

./exec_multiple" [2]="This next command demonstrates multiple source files. In this given example main.c contains the main function,
while sum.c and sumalt.c contain the implementations of the functions sum and sumalt. The func.h file hold the headers (declarations) of these functions.

To note, if you choose to execute these commands, the following taks will be performed:
    1. Creation of main.c
    2. Creation of func.h
    3. Creation of sum.c
    4. Creation of sumalt.c
    5. Compiling all files into exec_multiple executable file
    6. Running of the executable file
    
PS: don't worry, they're perfectly safe")
    run_command  "${multipleSources[1]}" "${multipleSources[2]}"
}
chapter_elevel_4(){
    cmd11=([1]="gcc -v -Wall myCscript.c -o ptr" [2]="Verbose type option of the gcc command that shows detailed information of the compiling process.")
    cmd12=([1]="gcc -E myCscript.c -o info.i" [2]="-E makes gcc stop after the the preprocess phase")
    cmd13=([1]="gcc -S myCscript.c" [2]="-S makes gcc stop after the compiling phase")
    cmd14=([1]="gcc -c myCscript.c" [2]="-c makes gcc stop after the assembly phase")
    cmd15=([1]="objdump -d myCscript.o" [2]="Dissasembly operation. Meaning the recovery of mnemonics in assembly language starting with the machine code. Its the inverse operation of the assembly.")
    cmd16=([1]="nm myCscript.o" [2]="Another utilitary used for the same dissasembly purposes is nm.")
    run_command  "${cmd11[1]}" "${cmd11[2]}"
    run_command  "${cmd12[1]}" "${cmd12[2]}"
    run_command  "${cmd13[1]}" "${cmd13[2]}"
    run_command  "${cmd14[1]}" "${cmd14[2]}"
    run_command  "${cmd15[1]}" "${cmd15[2]}"
    run_command  "${cmd16[1]}" "${cmd16[2]}"
}
chapter_elevel_5(){
    cmd17=([1]="time gcc -o bb-ssa-0 myCscript.c -O0

time gcc -o bb-ssa-1 myCscript.c -O1

time gcc -o bb-ssa-2 myCscript.c -O2

time gcc -o bb-ssa-3 myCscript.c -O3

time gcc -o bb-ssa-s myCscript.c -Os" [2]="Optimising code obtained through -O option. It offers five levels of compiling efficiency or speed. 0 to 3 and s (representing low compiling time, but greatly reduces size).")
    run_command  "${cmd17[1]}" "${cmd17[2]}"
}
chapter_elevel_6(){
    cmd18=([1]="readelf -S my_exec" [2]="Readelf utilitary used for the analysis of an executable file.")
    run_command  "${cmd18[1]}" "${cmd18[2]}"
}
chapter_elevel_7(){
    cmd19=([1]="echo 'exec:
	gcc main.c sum.c sumalt.c -o exec' > makefile

make" [2]="Make utilitary to run the command in the file makefile. Makefile is a default name")
    cmd20=([1]="make exec" [2]="Executes the target in the make file")
    cmd21=([1]="echo 'exec:
	gcc main.c sum.c sumalt.c -o exec' > myPersonalMakeFileName

make -f myPersonalMakeFileName" [2]="Executes the custom name makefile")
cmd22=([1]="echo 'CFLAGS = -Wall
exec:
	gcc main.c sum.c sumalt.c -o exec' > myPersonalMakeFileName

make CFLAGS=-Wall exec" [2]="Executes with internal flag variable and the 'exec' targert")
    run_command  "${cmd19[1]}" "${cmd19[2]}"
    run_command  "${cmd20[1]}" "${cmd20[2]}"
    run_command  "${cmd21[1]}" "${cmd21[2]}"
    run_command  "${cmd22[1]}" "${cmd22[2]}"

}

cleanup(){
    echo -e "${GREEN}Cleaning up...${STD}"
    pause
    sudo rmdir dir1
    sudo rm -f newfile.txt
    sudo rm -f listare.txt
    sudo rm -f erori.txt
    sudo deluser testu
    sudo delgroup testg
    sudo rm -rf /home/testh
    sudo rm -f new_archive.tar
    sudo rm -f new_gzip_archive.tar.gz
    sudo rm -f fisier.txt

    sudo umount /dev/loop9
    sudo losetup -d /dev/loop9
    sudo rm -f image.img
    sudo rmdir /mnt/loop9

    sudo rm -f myCscript.c
    sudo rm -f a.out
    sudo rm -f my_exec
    sudo rm -f my_other_exec
    sudo rm -f exec_multiple
    sudo rm -f func.h
    sudo rm -f main.c
    sudo rm -f myCscript.c
    sudo rm -f sum.c
    sudo rm -f sumalt.c

    clear_screen
    echo -e "${GREEN}Done!${STD}"
}


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
        chapter_elevel_1
        pause
        ;;
        "b"|"B"|"2")
        clear_screen
        chapter_eleven_2
        pause
        ;;
        "c"|"C"|"3")
        clear_screen
        chapter_elevel_3
        pause
        ;;
        "d"|"D"|"4")
        clear_screen
        chapter_elevel_4
        pause
        ;;
        "e"|"E"|"5")
        clear_screen
        chapter_elevel_5
        pause
        ;;
        "f"|"F"|"6")
        clear_screen
        chapter_elevel_6
        pause
        ;;
        "g"|"G"|"7")
        clear_screen
        chapter_elevel_7
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

