int b;

struct a{
    int c;
    struct a *p;
};

int main(){
    struct a d;
    struct a *g;
    g->p->c = 5;
    d.p = &d;
    int s = 4<5;
    char a = &g;
    int *l = &d + 5;
    if((int)l >= 5) b = 4;
    int x = &a;
    x += &a;
    x += 5;
    x = -x;
    x = !x;
    x  = *l;
    x = ++l;

}