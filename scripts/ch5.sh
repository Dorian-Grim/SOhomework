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