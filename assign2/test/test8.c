int main(){
    char operator;
    int a=2;
    int b=3;
    printf("Enter a bitwise operator (&, |, ^, ~, <, >): ");
    scanf("%c", &operator);
    
    

    if(operator == '|'){
        printf("%d", a|b);
    }
    else if(operator == '&'){
        printf("%d", a&b);
    }
    else if(operator == '^'){
        printf("%d", a^b);
    }
    else if(operator == '~'){
        printf("%d %d", ~a, ~b);
    }
    else if(operator == '<'){
        printf("%d %d", a<<1, b<<2);
    }
    else if(operator == '>'){
        printf("%d %d", a>>1, b>>2);
    }
    
    printf("\n%d\n%d\n%d\n%d\n%d", a+b, a-b, a*b, a/b, a%b);
}