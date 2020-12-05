chapter_eleven_1(){
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
chapter_eleven_2(){
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
chapter_eleven_3(){
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
chapter_eleven_4(){
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
chapter_eleven_5(){
    cmd17=([1]="time gcc -o bb-ssa-0 myCscript.c -O0

time gcc -o bb-ssa-1 myCscript.c -O1

time gcc -o bb-ssa-2 myCscript.c -O2

time gcc -o bb-ssa-3 myCscript.c -O3

time gcc -o bb-ssa-s myCscript.c -Os" [2]="Optimising code obtained through -O option. It offers five levels of compiling efficiency or speed. 0 to 3 and s (representing low compiling time, but greatly reduces size).")
    run_command  "${cmd17[1]}" "${cmd17[2]}"
}
chapter_eleven_6(){
    cmd18=([1]="readelf -S my_exec" [2]="Readelf utilitary used for the analysis of an executable file.")
    run_command  "${cmd18[1]}" "${cmd18[2]}"
}
chapter_eleven_7(){
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