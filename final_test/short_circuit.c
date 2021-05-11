// short circuiting in and/or

int printf(char s[20],int a);
int printf1(char s[20]);
int printf2(char s[20],int a,int b,int c);

int main(){
    int a = 1,b=1,c=1;

    // c will remain 1
    if(a == b || c++){
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }
    else{
        printf1("False\n");
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }

    // c will change to 2
    if(a==b && c++){
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }
    else{
        printf1("False\n");
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }

    // c will change to 3
    if(a != b || c++){
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }
    else{
        printf1("False\n");
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }

    // c will not change
    if(a != b && c++){
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }
    else{
        printf1("False\n");
        printf2("a:%ld b:%ld c:%ld\n",a,b,c);
    }
}