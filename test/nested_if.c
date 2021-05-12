// checks nested ifs
int printf(char s[20],int a);
int printf1(char s[200]);
int scanf(char s[20],int *a);
void puts(char*str);

int main(){
    int n;
    printf1("enter a integer: ");
    scanf("%ld", &n);
    if(n%2==0){
        printf1("given number is even\n");
        if(n%3==0){
            puts("given no is divisible by 2,3");
            if(n%5==0){
                puts("given no is divisible by 2,3,5");
                if(n%7==0){
                    puts("given no is divisible by 2,3,5,7");
                    if(n%11==0){
                        printf1("given no is divisible by 2,3,5,7,11\n");
                    }else{
                        printf1("given no is div by 2,3,5,7 but not by 11\n");
                    }
                }else{
                    puts("given no is div by 2,3,5 but not by 7");
                }
            }else{
                puts("given no is div by 2,3 but not by 5");
            }
        }else{
            puts("given no is div by 2 but not by 3");
        }
    }else{
        printf1("given number is odd\n");
    }
}