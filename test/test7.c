// // #include<stdio.h>
int b;

struct A{
    struct A *ptr;
    int a;
};

int main(int argc, char argv[4]){
    
    struct A *d;
    d->a;
    int s = sizeof(d);
    char* str = "aman";
    auto w = 4;
    float cd;
    float a = 3.2, *ptr, c=cd;
    int * ptr3 = &s;
    long** ptr1 = &ptr3;
    int i =0, n = 1000;
    while(i++ < n){
        int sieve[1000];
        int j;
        for(i;j<n;j++){
            sieve[j] = 1;
            if (j%2%3 == 4)break;
            else continue;
        }
        i--;
        int c = i++ + 1;
    }
    return 3.2;
}

