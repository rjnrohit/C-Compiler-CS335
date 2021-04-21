// play with pointer

void* a(int b){
    return &b;
}

int c;

void *d = &c;

void g();

void g(){}

int func(int a);

int p;

int *ptr = &p;
int** ptr1 = &ptr;
int*** ptr2 = &ptr1;
int**** ptr3 = &ptr2;

char *cc = "this is pointer test", b, str[12][4] = {"aham", "hmmm", "braham", "samhi"};

int main(){
    void**** vd = ptr3;
    int *c = &main;
    *c = 2;
    *str[1] = 'g';
    int l = func(1);
    return &p;
}


