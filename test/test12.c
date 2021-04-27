// play with pointer

void* a(int b){
    return &b;
}

int c;

void *d = &c;

void g();

void g(){}

int func(int a);
int printf(char *s,int d);
int p;

int *ptr = &p;
int** ptr1 = &ptr;
int*** ptr2 = &ptr1;
int**** ptr3 = &ptr2;

char *cc = "this is pointer test", b, str[12][4];

int main(){
    void**** vd = ptr3;
    int *c = &main;
    *c = 2;
    *str[1] = 'g';
    int l = func(1);
    *c = NULL;
    printf("hello",5);
    bool b = 6&&3;
    if ((5>3)&&3);
    return &p;
}


