#!/bin/bash

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