// constant folding
// implemented constant folding optimization
// where most of the constant expression are evaluated ares resolved at run time and no extra memory and register is used
// we create space for all constant in function (including float and string) in global
// so temp memory as not created multiple times
// if 5*3 then space for only 15 is allocated
// constant folding is handle in binary operator,unary operator and ternary operator
// also handled for typecaseing if float a = 5*3 then only fconst@15 is allocated
// created special place for this (fconst@value , lconst@value, scont@value)
// maintaining alloc list

// show 3ac and asm file

int printf(char s[20],int a);
int printf1(char s[20],float a);

int main(){
    int a = 2*3.1+5/2-1+21+(1<3);
    printf("%ld\n",a);
    a = 2*3.2;
    printf("%ld\n",a);
    float b = 3*11;
    printf1("%f\n",b);
    bool c = 23*10+(5&&2);
    printf("%ld\n",c);
    int d = (4%2)?100:200;
    printf("%ld\n",d);

}