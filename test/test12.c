// play with pointer

void* a(int b){
    return &b;
}

struct node{
    int id;
    char name[20];
};

int c;

void *d = 'c';

void g();

void g(){}

int func(int a);
int printf(char s[10],int d);
int p;

// int *ptr = &p;
// int** ptr1 = &ptr;
// int*** ptr2 = &ptr1;
int**** ptr3;

char *cc = "this is pointer test", b, str[12][4];

int main(){
    void**** vd = ptr3;
    int *c = &main;
    char *s = "char";
    struct node n1,n2;
    n1 = n2;
    *c = 2*3+5-2;
    // 5=3;
    *str[1] = 'g';
    int l = func(1);
    *c = NULL;
    printf("hello",5);
    bool b = 6&&3;
    if ((5>3)&&3);
    return &p;
}


