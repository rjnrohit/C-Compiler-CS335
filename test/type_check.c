// operator type checking
// constant folding
int printf(char s[20],int a);
int printf1(char s[20],float a);

int main(){
    // should be 21 not 20 [ 2.2*3+3.1*2-2 = 10.8] if store as int then 20 else 21
    // constant folding
    int a = (2.2*3+3.1*2-2)*2;
    // 21
    printf("%ld\n",a);
    // value of E = 69
    int b = 'E';
    float c = 3.1;
    // 33.4
    printf1("%f\n",c*(b-'A')+a);
    // 33
    printf("%ld\n",c*(b-'A')+a);
    // 33.0
    printf1("%f\n",(int)((b-'A')*c+a));

    char chr = 'B'+24; //chr = 90
    // 'Z'
    printf("%c\n",chr);
    // 'B'
    printf("%c\n",chr-24.0);

    // bool store only 1 or 0 (constant folding)
    bool d = 5;
    printf("%ld\n",d);
}