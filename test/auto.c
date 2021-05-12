// auto variable support basic,pointer,structure type
// sizeof working
int printf(char s[20],int a);
int printf1(char s[20],int a,int b);
int printf2(char s[20],int a,int b,int c,float d,int e);

struct A{
    int a;
    int b;
}; 

int main(){
    auto a = 'C';
    // char type sizeof 1
    printf("size %ld\n",sizeof(a));
    auto b = true;
    // bool sizeof 1
    printf("size %ld\n",sizeof(b));
    auto c = a-3;
    // long type as long has higher than char
    // long sizeof 8
    printf("size %ld\n",sizeof(c));
    auto d = 3.4;
    // float size of 4
    printf("size %ld\n",sizeof(d));
    auto e = &c;
    // pointer of size 8
    printf("size %ld\n",sizeof(e));
    struct A a1;
    a1.a = 2;
    a1.b=4;
    auto f = a1; //( = also support struct type)
    // struct of size 16
    printf("size %ld\n",sizeof(f));
    
    printf1("struct a:%ld, b:%ld\n",f.a,f.b);
    printf2("a:%c b:%ld c:%ld d:%f *e:%ld\n",a,b,c,d,*e);
}