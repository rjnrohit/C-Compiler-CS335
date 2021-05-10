struct Node{
    int a, b;
    struct Node*next;
};

void *malloc(int d);
int printf(char s[20], int ab, int db, int bd);
int printf1(char s[20],float b);

struct Node *insert(struct Node *head,int a,int b){
    if (head == NULL){
        head = (struct Node*)malloc(sizeof(struct Node));
        head->a = a;
        head->b = b;
        printf("insert complete\n",0,0,0);
        return head;
    }
    head->next = (struct Node*)malloc(sizeof(struct Node));
    head = head->next;
    head->a = a;
    head->b = b;
    printf("insert complete\n",0,0,0);
    return head;
}

struct Node s(struct Node m){
    struct Node n;
    n.a = m.a+3;
    n.b = m.b+4;
    n=m;
    return n;
}

int main(){
    // struct Node a;
    // a.next = 0;
    // a = *(push(&a, 4,5));
    // printf("%ld %ld %ld\n", sizeof(struct Node), a.a, a.b);
    // return 0; 
    printf("here\n", 1,1,1) ;
    struct Node *a = NULL;
    a =  insert(a,4,5);
    a = insert(a,3,2);
    struct Node n;
    n.a = 4;
    n.b = 69;
    n = s(n);
    printf("flag\n",1,11,1);
    printf("%ld %ld\n",n.a,n.b,0);
    float aa = 3;
    float *b = &aa;
    *b = 4.3;
    // printf("%ld\n",(*b)*100000,1,1);
    printf1("%.1f\n",*b);
    n = *a;
    printf("%ld %ld %ld\n", sizeof(struct Node), a->a, a->b);
    printf("%ld %ld\n",n.a,n.b,0);
}