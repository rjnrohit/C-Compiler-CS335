int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

int main(){
    int a = 5,b = 3,c = 4,d = 8;
    // value should be -8 not -2
    printf("%ld\n",-a-b);
    // value should 17 not 32
    printf("%ld\n",a+b*c);
    // value should be 10 not 0
    printf("%ld\n",d/c*a);
    // value should be 13
    printf("%ld\n",a+b*b-a/b%a);

}