// #include<stdio.h>
int b;

struct a{
    int c;
    struct a *p;
    struct a z;
};

int main(){
    struct a d;
    struct a *g;
    // g->p->c = 5;
    d.z.c = 5;
    d.p = &d;
    int s = 4<5;
    char a = &g;
    int *l = &d + 5;
    // if((int)l >= 5) b = 4;
    int q[5][3] = {{'a','b'},{'a','b'}};
    int x = &a;
    x += &a;
    x += 5;
    x = -x;
    x = !x;
    x  = *l;
    x = ++l;
    x = 'a' + 'b';
    // x = "abc"+'d';
    // char c[][2] = {{5.0,&x},{&x,&s}};
    // char c[][2] = {{'a','b'}};
    // printf("%d\n",sizeof(5));
    b = sizeof(5);
    // printf("%c",*((char *)q+1));
    if(0,b,1){
        // printf("true");
        b = 4;
    }
    switch (b)
    {
        case (5) : {a = 'c';
            break;}
        default:
            {a = 'd';
            break;}
    }
    // printf("%c",c[1][1]);

}