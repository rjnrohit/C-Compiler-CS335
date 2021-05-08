int b = 64;

char a[20] = "abc";

float foo(int c, float d){
    return c+d;
}

int printf(char s[100], int a, int b,int c,int d, long e, char f, float g, int xx);

int main(){
    // int a = 3, b= 4;
    // int c = b/a;
    // int n = 46;
    // int n1 = ~n;
    // int n3 = n1 << 1;
    // while(n--){
    //     a += c;
    // }
    // int d = foo(a, 3.1);
    int d = 45;
    int c = 567;
    int x = 56;
    long df = 345435;
    char a = 97;
    float f = 3.456;
    char s[100] = "%ld %ld  %ld %ld %ld  %c %f %d";
    printf(s, d,c, 67, x, df, a, f, 72);
    return 0;
}