#!/usr/bin/awk -f
BEGIN {
current_users = 0;
printf "+--------------+--------------------------+\n";
}
{
current_users++;
if (current_users % 5 == 1)
printf "|%-15s|%-25s|\n", $1, $6;
}
END {
printf "+---------------+--------------------------+\n";
}
