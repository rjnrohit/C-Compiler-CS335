int main(){
    char operator;
    printf("Enter a bitwise operator (&, |, ^, ~, <, >): ");
    scanf("%c", &operator);

    long a = 0x56a, b = 0x44f;
    bool equal = (a==b);
    printf("%d\n", ((a!=b) == equal));

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
