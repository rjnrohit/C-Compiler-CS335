// binary search tree
// using malloc

int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);
void *malloc(int size);

struct Node{
    int data;
    struct Node *left, *right;
};

struct Node *root = NULL;

void push(struct Node *root,int data){
    if (root == NULL){
        root = (struct Node*)malloc(sizeof(struct Node));
        root->data = data;
        root->left = NULL;
        root->right = NULL;
    }
    if(root->data > data){
        insert(root->left,data);
    }
    else insert(root->right,data);
}

void inorder(struct Node *root){
    if(root == NULL) return;
    inorder(root->left);
    printf("%ld ",root->data);
    inorder(root->right);
}
void preorder(struct Node *root){
    if(root == NULL) return;
    printf("%ld ",root->data);
    inorder(root->left);
    inorder(root->right);
}
void postorder(struct Node *root){
    if(root == NULL) return;
    inorder(root->left);
    inorder(root->right);
    printf("%ld ",root->data);
}

// struct Node* foo(struct Node *root){
//     if(root== NULL){
//         struct Node *node = (struct Node*)malloc(sizeof(struct Node));
//     }
//     // return node;
// }

int main(){
    printf1("Enter number to insert in BST (stop at -1)\n");
    int n;
    do{
        scanf("%ld",&n);
        if(n == -1) break;
        push(root,n);

    }while(true);
    printf("%ld\n", root);
    inorder(root);
    printf1("\n");
    preorder(root);
    printf1("\n");
    postorder(root);
    printf1("\n");
}