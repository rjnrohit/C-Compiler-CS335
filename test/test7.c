int b;

struct a{
    int c;
    struct a *p;
};

int main(){
    struct a d;
    struct a *g;
    g->p->c = 5;
    d.b = 5;
}