// Performing multiple bitwise operations

int main(){
    char operator;
    printf("Enter a bitwise operator (&, |, ^, ~, <, >): ");
    scanf("%c", &operator);

    long a = 0x56a, b = 0x44f;
    bool equal = (a==b);
    long x;
    printf("%d\n", ((a!=b) == equal));

    if(operator == '|'){
        x = a|b;
    }
    else if(operator == '&'){
        x = a&b;
    }
    else if(operator == '^'){
        x = a^b;
    }
    else if(operator == '~'){
        x = ~a;
    }
    else if(operator == '<'){
        x = (a<b);
    }
    else if(operator == '>'){
        x = (a>b);
    }
    
}
