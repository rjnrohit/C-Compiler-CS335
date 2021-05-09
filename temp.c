int b = 64;

char a[20] = "%ld \n";
int printf(char s[100],int b);
// int printf(char s[50], int c);
int scanf(char s[100],int a);

float foo(int c, float d){
    //printf(a,c+d);
    return c+d;
}

// int printf(char s[100], int a, int b,int c,int d, long e, char f, float g, int xx);
// int sqrt(int a);
int main(){
    int d = 45;
    int c = 567;
    int x = 56;
    long df = 345435;
    char a = 97;
    float f = 3.456;
    // char s[100] = "%ld %ld  %ld %ld %ld  %c %f %d";
    char s[10] = "%ld \\n";
    // char s1[10] = "abcd";
    // printf(s, d,c, 67, x, df, a, f, 72);
    int i = 0;
    // scanf(s,&i);
    // printf("%ld",&i);
    while(i<10*2){
        if(i % 2 == 0){
        // printf("%ld ",i);
        float q = 3.4;
        //int a = foo(2,3);
        //a = true;
        //int a = 1;
        //a=3;
        printf(s,foo(2,3));
        }
        i++;
    }
    return 0;
}