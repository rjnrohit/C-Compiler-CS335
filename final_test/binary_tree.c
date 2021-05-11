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

// struct node *root = NULL;

struct Node *insert(struct Node *root,int data){
    if (root == NULL){
        struct Node *node = (struct Node*)malloc(sizeof(struct Node));
        node->data = data;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    if(root->data > data){
        root->left = insert(root->left,data);
    }
    else root->right = insert(root->right,data);
    return root;
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

int main(){
    struct Node *root = NULL;
    printf1("Enter number to insert in BST (stop at -1)\n");
    int n;
    do{
        scanf("%ld",&n);
        if(n == -1) break;
        root = insert(root,n);

    }while(true);
    
    inorder(root);
    preorder(root);
    postorder(root);
}