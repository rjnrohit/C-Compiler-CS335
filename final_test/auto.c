// auto variable
// sizeof working
int printf(char s[20],int a);
int printf1(char s[20]);
int printf2(char s[20],int a,int b,int c,float d); 

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
    auto d = b+3.4;
    // float size of 4
    printf("size %ld\n",sizeof(d));
    printf2("a:%c b:%ld c:%ld d:%f\n",a,b,c,d);
}