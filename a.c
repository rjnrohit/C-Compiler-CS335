// int ***a, c;
// int  a,**c, d, *****d;

// int **(**b);

// struct A{
//     int x;
//     int y;
//     int z;
// };

// // struct A b;

int main(){
    struct B{
        int a,b;
    };
    struct B c;
    int a;
    int b = 5;
    a = 5*'c';
    a = 5%'c';
    return 0;
    int *ptr = &a;
    int *ptr1 = &b;
    ptr = ptr1+'c';
    ptr = 5+ptr1;
    if(5){
        a = 5.0?b:a;
    }

}
char c = 'a';