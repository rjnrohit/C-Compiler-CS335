struct Node{
    int a, b;
    struct Node*next;
};

void *malloc(int d);
int printf(char s[20], int ab, int db, int bd);

struct Node *insert(struct Node *head,int a,int b){
    if (head == NULL){
        head = (struct Node*)malloc(sizeof(struct Node));
        head->a = a;
        head->b = b;
        return head;
    }
    head->next = (struct Node*)malloc(sizeof(struct Node));
    head = head->next;
    head->a = a;
    head->b = b;
    return head;
}

<<<<<<< HEAD
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
    struct Node *a = NULL;
    a =  insert(a,4,5);
    a = insert(a,3,2);
    struct Node n;
    n.a = 4;
    n.b = 69;
    n = s(n);
    // n = *a;
    printf("%ld %ld %ld\n", sizeof(struct Node), a->a, a->b);
    printf("%ld %ld\n",n.a,n.b,0);
=======
void foo(){
    printf("%ld\n",3);
}

int main(){
    int a[10][10];
    int b[10][10];
    int c[10][10];
    // struct A a;
    int n;
    scanf("%ld",&n);
    // scanf("%ld",&m);
    // printf("%ld\n",a);
    input_matrix(a,n);
    input_matrix(b,n);
    foo();
    int i,j,k;
    for(i = 0;i<n;i++){
        for(j = 0;j<n;j++){
            c[i][j] = 0;
            for(k = 0;k<n;k++){
                c[i][j] += a[i][k]*b[k][j];
            }
        }
    }
    for(i = 0;i<n;i++){
        for(j = 0;j<n;j++){
            printf("%ld ",c[i][j]);
        }
        printf("\n",1);
    }
    printf("successful\n",1);
    
    // int c[100][100]
    // printf("%ld\n",arr);
    // printf("%ld\n",arr[4]);
    // printf("%ld\n",a.arr[5]);
    return 0;
>>>>>>> 2b425cb7a6bc0b0ee17c7c32794c44e4f2401279
}