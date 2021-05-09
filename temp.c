// int fib(int n){
//     if(n<=1)return n;
//     return fib(n-1) + fib(n-2);
// }

// void printf(char s[20], float c);
// void scanf(char s[20],int *c);
// //ptr = (int*)malloc(n * sizeof(int));
// void free(int *ptr);
// void exit(int a);
// int *malloc(int size);
// int puts(char a[10]);
// float sqrt(float c);
// float cos(float d);
// float ceil(float d);
// int strlen(char a[20]);
// int atol(char a[20]);
// int main(){
   
//     int b = atol("3123");
//     printf("%ld\n", b);
    
//     return 0;
// }

bool is_odd(int n);
bool is_even(int n);

void printf(char s[100],int a);
void scanf(char s[100],int *a);

int main(){
    int n = 0;
    scanf("%ld",&n);
    if(n < 0){
        printf("Enter a positive number\n",0);
        return 0;
    }
    printf("%ld\n",is_odd(n));
}

bool is_odd(int n){
    if( n == 0) return false;
    return is_even(n-1);
}

bool is_even(int n){
    if( n == 0) return true;
    return is_odd(n-1);
}

