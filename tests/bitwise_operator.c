int main(){
    char operator;
    printf("Enter an bitwise operator (&, |, ^, ~): ");
    scanf("%c",&operator);

    long a = 0x56a, b = 0x44f;
    bool equal = (a==b);
    printf("%d\n", ((a!=b) == equal));

    if(operator=='|'){
        printf("%d", a|b);
    }
    else if(operator=='&'){
        printf("%d", a&b);
    }
    else if(operator=='^'){
        printf("%d", a^b);
    }
    else if(operator=='~'){
        printf("%d %d", ~a, ~b);
    }
    
    printf("\n%d\n%d\n%d\n%d\n%d",a+b,a-b,a*b,a/b,a%b);
}
