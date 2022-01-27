#!/bin/bash
sum_func()
{
    sum=0
    while ! test -z $1; do
    sum=$(($sum + $1))
    shift
    done
}
sum_func 1 2 3 4 5
echo "Sum: $sum"
sum_func 2 3 5 7 11 13 17 19
echo "Sum: $sum"
