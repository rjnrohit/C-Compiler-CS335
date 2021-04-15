#include<stdio.h>

int main(){
    int c = 5;
    int *a = &c;
    double *b;
    b = (long)a;
    printf("%ld,%ld\n",b,a);
    printf("%ld,%ld\n",++b,++a);
    return 0;
}