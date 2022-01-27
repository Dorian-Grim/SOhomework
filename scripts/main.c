#include <stdio.h>
#include "func.h"
#define NUM 10

int main()
{
    printf("Suma (%d) - %d\n",NUM, sum(NUM));
    printf("Suma-alternanta(%d) = %d\n", NUM, sumalt(NUM));
    return 0;
}
