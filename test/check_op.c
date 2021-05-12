// checks multiple if and most of operator
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

int main(){
    char op;
    printf1("Enter operator in {+,-,/,*,%%,&,|,^,>,<,!,~} or 1-8 for {<<,>>,<=,>=,!=,==,&&,||}: ");
    scanf("%c",&op);
    int a,b;
    printf1("Enter 2 numbers\n");
    scanf("%ld",&a);
    scanf("%ld",&b);
    if (op == '+'){
        printf("ans: %ld\n",a+b);
    }
    else if(op == '-'){
        printf("ans: %ld\n",a-b);
    }
    else if(op == '/'){
        printf("ans: %ld\n",a/b);
    }
    else if(op == '*'){
        printf("ans: %ld\n",a*b);
    }
    else if(op == '%'){
        printf("ans: %ld\n",a%b);
    }
    else if(op == '&'){
        printf("ans: %ld\n",a&b);
    }
    else if(op == '|'){
        printf("ans: %ld\n",a|b);
    }
    else if(op == '^'){
        printf("ans: %ld\n",a^b);
    }
    else if(op == '>'){
        printf("ans: %ld\n",a>b);
    }
    else if(op == '<'){
        printf("ans: %ld\n",a<b);
    }
    else if(op == '!'){
        printf("ans: %ld\n",!a);
    }
    else if(op == '~'){
        printf("ans: %ld\n",~a);
    }
    else if(op == '1'){
        printf("ans: %ld\n",a<<b);
    }
    else if(op == '2'){
        printf("ans: %ld\n",a>>b);
    }
    else if(op == '3'){
        printf("ans: %ld\n",a<=b);
    }
    else if(op == '4'){
        printf("ans: %ld\n",a>=b);
    }
    else if(op == '5'){
        printf("ans: %ld\n",a!=b);
    }
    else if(op == '6'){
        printf("ans: %ld\n",a==b);
    }
    else if(op == '7'){
        printf("ans: %ld\n",a&&b);
    }
    else if(op == '8'){
        printf("ans: %ld\n",a||b);
    }
    else{
        printf1("Wrong operator\n");
    }
    return 0;
}