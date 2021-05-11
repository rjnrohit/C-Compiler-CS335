// push,pop,search in linked list
// using malloc
// support for NULL
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);
void *malloc(int size);

struct Node{
    int data;
    struct Node *next;
};

struct Node *head = NULL;

void push(int data){
    struct Node *node = (struct Node*)malloc(sizeof(struct Node));
    node->data = data;
    node->next = head;
    head = node;
}

void pop(){
    if (head == NULL){
        printf1("linked list is empty\n");
        return;
    }
    printf("removing node with data %ld\n",head->data);
    head = head->next;
}

void print_list(){
    if (head == NULL){
        printf1("linked list is empty\n");
        return;
    }
    struct Node *node = head;
    while(node != NULL){
        printf("%ld ",node->data);
        node = node->next;
    }
    printf1("\n");

}

void search(int a){
    if (head == NULL){
        printf1("linked list is empty\n");
        return;
    }
    struct Node *node = head;
    while(node != NULL){
        if(node->data == a){
            printf("Element %ld is present in linked list\n",a);
            return;
        }
        node = node->next;
    }
    printf("Element %ld is not in linked list\n",a);
    
}

int main(){
    int i;
    for(i = 0;i<10;i++) push(i*i);
    print_list();
    search(49);
    for(i = 0;i<5;i++) pop();
    print_list();
    search(49);
    for(;i<=10;i++) pop();
    return 0;
}