// fibonacci using recursive function
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

int fibonacci(int n){
    if(n <=1) return n;
    return fibonacci(n-1)+fibonacci(n-2);
}

int main(){
    int n;
    scanf("%ld",&n);
    if(n < 0){
        printf1("Enter a postive number\n");
        return 0;
    }
    printf("%ld\n",fibonacci(n));
    return 0;
}