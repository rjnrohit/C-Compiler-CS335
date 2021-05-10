// mutual recursion
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