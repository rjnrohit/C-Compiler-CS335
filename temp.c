int b = 64;

char a[20] = "abc";

float foo(int c, float d){
    return c+d;
}

int main(){
    int a = 3, b= 4;
    int c = b/a;
    int n = 46;
    while(n--){
        a += c;
    }
    return 0;
}