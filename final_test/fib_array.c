// fibonacci using array
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);


int main(){
    int n;
    scanf("%ld",&n);
    if(n < 0){
        printf1("Enter a postive number\n");
        return -1;
    }
    if (n > 50){
        printf1("Number is too large\n");
        return -1;
    }
    int fib[51];
    fib[0] = 0;
    fib[1] = 1;
    int i;
    for(i = 2;i<=n;i++){
        fib[i] = fib[i-1]+fib[i-2];
    }
    printf("%ld\n",fib[n]);
    return 0;
}