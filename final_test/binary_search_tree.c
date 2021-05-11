//binary search tree with dynamic memory allocation
//sort given inputs using BST
struct node {
    int data;
    struct node* left;
    struct node* right;
};

void printf(char a[100], int b);
void scanf(char a[100], int *b);
void printfs(char a[100]);
void *malloc(int s);

struct node* newNode(int data)
{
    struct node* node = (struct node*)malloc(sizeof(struct node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
 
    return (node);
}
 
 
void printInorder(struct node* node)
{
    if (node == NULL)
        return;
 
    printInorder(node->left);
    printf("%ld ", node->data);
    printInorder(node->right);
}
 
struct node* insert(struct node*root, int b){
    if(root){
        if(b >= root->data){
            root->right = insert(root->right, b);
            return root;
        }
        root->left = insert(root->left, b);
        return root;
    }
    return root = newNode(b);
}

int main(){
    int n;
    printfs("enter number of elements in tree: ");
    scanf("%ld", &n);
    printf("enter %ld ", n);
    printfs("numbers\n");
    struct node*root = NULL;
    while(n--){
        int i;
        scanf("%ld", &i);
        root = insert(root, i);
    }
    printfs("tree: ");
    printInorder(root);
    printfs("\n");
}