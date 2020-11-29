#!/bin/bash

#trap '' SIGINT SIGQUIT SIGTSTP

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

    temp_path=$HOME
    
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
    echo "cat ${list_file}"
    pause
    cat $list_file

    echo ""
    echo -e "${GREEN}Add 'data' command output at the end of ${list_file}${STD}"
    echo "date >> ${list_file}"
    pause
    date >> $list_file

    echo ""
    echo -e "${GREEN}Display ${list_file} using 'cat' command${STD}"
    echo "cat ${list_file}t"
    pause
    cat $list_file

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

chapter_four_rights() {

    
    file=fisier.txt
    echo ""
    echo -e "${GREEN}Create a new file called ${file} to inspect rights${STD}"
    echo "touch ${file}"
    pause
    touch $file

    echo ""
    echo -e "${GREEN}List files with details${STD}"
    echo "ls -l"
    pause
    ls -l $file

    echo ""
    echo -e "${GREEN}Set access rights to 777${STD}"
    echo "chmod 777 ${file}"
    pause
    chmod 777 $file

    echo ""
    echo -e "${GREEN}List files with details${STD}"
    echo "ls -l"
    pause
    ls -l $file
    
    echo ""
    echo -e "${GREEN}Set access rights using literal form${STD}"
    echo "chmod u=rwx,g=r,o- ${file}"
    pause
    chmod u=rwx,g=r,o=- $file

    echo ""
    echo -e "${GREEN}List files with details${STD}"
    echo "ls -l"
    pause
    ls -l $file

}

chapter_four_find() {
    pattern=".bashrc"
    find_path="/home"
    echo ""
    echo -e "${GREEN}Find files matching '${pattern}' in the ${find_path} ${STD}"
    echo "find ${find_path} -name ${pattern}"
    pause
    sudo find $find_path -name $pattern

    find_path="/usr"
    size=+500k
    echo ""
    echo -e "${GREEN}Find files larger '${size}' in the ${find_path} ${STD}"
    echo "find ${find_path} -size ${size}"
    pause
    sudo find $find_path -size $size

    pattern="pwd"
    echo ""
    echo -e "${GREEN}Find files containing '${pattern}' using the 'locate' command ${STD}"
    echo "locate ${pwd}"
    pause
    locate $pattern

    pattern="ls"
    echo ""
    echo -e "${GREEN}Find '${pattern}' using the 'whereis' command ${STD}"
    echo "whereis ${pattern}"
    pause
    whereis $pattern

    pattern="bash"
    echo ""
    echo -e "${GREEN}Find the path of '${pattern}' using the 'which' command ${STD}"
    echo "which ${pattern}"
    pause
    which $pattern

    pattern="cd"
    pattern2="cat"
    echo ""
    echo -e "${GREEN}Determien if '${pattern}/${pattern2}' is a builtin/external/allias command ${STD}"
    echo "type ${pattern}; type ${pattern2}"
    pause
    type $pattern; type $pattern2

    pattern="/bin/id"
    echo ""
    echo -e "${GREEN}Find the file type of '${pattern}' using the 'file' command ${STD}"
    echo "file ${pattern}"
    pause
    file $pattern
}

chapter_four_disc_state() {
    echo ""
    echo -e "${GREEN}Display mounted file systems${STD}"
    echo "mount | more"
    pause
    mount

    echo ""
    echo -e "${GREEN}Display mounted file systems at system startup${STD}"
    echo "sudo cat /etc/mtab"
    pause
    sudo cat /etc/mtab | more

    echo ""
    image="image.img"
    echo -e "${GREEN}Create and empty disk image ${STD}"
    echo "dd if=/dev/zero of=${image} iflag=fullblock bs=1M count=500"
    pause
    sudo dd if=/dev/zero of=$image iflag=fullblock bs=1M count=500 && sync

    echo ""
    loopdev="loop9"
    echo -e "${GREEN}Create a loop device with the newly created disk image as /dev/${loopdev} ${STD}"
    echo "sudo losetup ${loopdev} ${image}"
    pause
    sudo sudo losetup $loopdev $image

    echo ""
    echo -e "${GREEN}Create a new GPT partition table on /dev/${loopdev} using 'parted' command ${STD}"
    echo -e "and a EXT4 partition using the whole disk space${STD}"
    echo "sudo parted --script /dev/${loopdev} \
          mklabel gpt \
          mkpart primary ext4 1MiB 500MB"
    pause
    sudo parted --script /dev/${loopdev} \
         mklabel gpt \
         mkpart primary ext4 1MiB 500MB

    
    echo ""
    echo -e "${GREEN}Format the newly created partition /dev/${loopdev}p1 using ${STD}"
    echo -e "${GREEN}the 'mkfs' command ${STD}"
    echo "sudo mkfs -t ext4 /dev/${loopdev}p1"
    pause
    sudo mkfs -t ext4 /dev/${loopdev}p1

    echo ""
    echo -e "${GREEN}We will mount /dev/${loopdev}p1 to /mnt/loop9 ${STD}"
    echo "sudo mount /dev/${loopdev}p1 /mnt/loop9"
    pause
    sudo mkdir -p /mnt/loop9
    sudo mount /dev/${loopdev}p1 /mnt/loop9

    echo ""
    echo -e "${GREEN}Display mounted file system${STD}"
    echo "mount | grep ${loopdev}"
    pause
    mount

    echo ""
    echo -e "${GREEN}Display disk utilisation${STD}"
    echo "df -h | grep ^/dev"
    pause

    echo ""
    echo -e "${GREEN}To check the filesystem for errors we need to firstly unmount it"
    echo -e "then run the 'fsck' command against it ${STD}"
    echo "umount /dev/${loopdev}p1 or umount /mnt/loop9"
    echo "sudo fsck -t ext4 /dev/${loopdev}p1"
    pause
    sudo umount /dev/${loopdev}p1
    sudo fsck -t ext4 /dev/${loopdev}p1

    echo ""
    echo -e "${GREEN}Cleaning up...${STD}"
    echo "sudo umount /dev/loop9"
    echo "sudo losetup -d /dev/${loopdev}"
    echo "sudo rm  -f image.img"
    echo "sudo rmdir /mnt/loop9"
    pause
    sudo umount /dev/loop9
    sudo losetup -d /dev/${loopdev}
    sudo -f rm $image
    sudo rmdir /mnt/loop9


}

chapter_five_processes() {
    
    echo ""
    echo -e "${GREEN}Display processes using the 'ps' command${STD}"
    echo "ps"
    pause
    ps

    echo ""
    echo -e "${GREEN}Display ALL processes using the 'ps'${STD}"
    echo "ps -A"
    pause
    ps -A

    echo ""
    echo -e "${GREEN}Display processes using the 'ps' command"
    echo -e "just for the 'root' user ${STD}"
    echo "ps -u root"
    pause
    ps -u root

    echo ""
    echo -e "${GREEN}Display processes using the 'ps' command"
    echo -e "with details and formated output${STD}"
    echo "ps -F"
    pause
    ps -F
    
    echo ""
    echo -e "${GREEN}Display process hierarhy using the 'pstree' command ${STD}"
    echo "pstree"
    pause
    pstree

    echo ""
    echo -e "${GREEN}Display processes in realtime using the 'top' command ${STD}"
    echo "top -bn 1 2>&1"
    pause
    toptop -bn 1 2>&1

    echo ""
    echo -e "${GREEN}Display the contents of the '/proc' file system ${STD}"
    echo "ls /proc"
    pause
    ls /proc

    echo ""
    echo -e "${GREEN}Display the contents of the '/proc' file system ${STD}"
    echo "ls /proc"
    pause
    ls /proc

    echo ""
    echo -e "${GREEN}Display cpu, memory, partitions and uptime info from '/proc' ${STD}"
    echo "head /proc/cpuinfo"
    pause
    head /proc/cpuinfo
    echo ""
    echo "head /proc/meminfo"
    pause
    head /proc/meminfo
    echo ""
    pause
    echo "tail /proc/partitions"
    pause
    tail /proc/partitions
    echo ""
    echo "cat /proc/uptime"
}

chapter_five_background() {
    echo ""
    echo -e "${GREEN}Run some processes in the background${STD}"
    echo "sudo updatedb &"
    pause
    sudo updatedb &
    echo "top &"
    pause
    top &
    
    echo ""
    echo -e "${GREEN}Display current jobs${STD}"
    echo "jobs"
    pause
    jobs

    echo ""
    echo -e "${GREEN}Run a process as a daemon${STD}"
    echo "sudo nohup updatedb &"
    pause
    sudo nohup updatedb &

    echo ""
    echo -e "${GREEN}Display all processes${STD}"
    echo "sudo ps ax"
    pause
    sudo ps ax

    echo ""
    echo -e "${GREEN}Display all 'kill' signals${STD}"
    echo "kill -l"
    pause
    kill -l

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
    read choice_sub
    case $choice_sub in
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
    read choice_sub
    case $choice_sub in
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
    read choice_sub
    case $choice_sub in
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

