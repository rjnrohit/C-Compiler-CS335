


struct node {
    int data;
    struct node* left;
    struct node* right;
};

void printf(char a[100], int b);
void printfs(char a[100]);
void *malloc(int s);

struct node* newNode(int data)
{
    struct node* node
        = (struct node*)malloc(sizeof(struct node));
    node->data = data;
    node->left = NULL;
    node->right = NULL;
 
    return (node);
}
 
void printPostorder(struct node* node)
{
    if (node == NULL)
        return;
    printPostorder(node->left);
 
    printPostorder(node->right);
 
    printf("%ld ", node->data);
}
 
void printInorder(struct node* node)
{
    if (node == NULL)
        return;
 
    printInorder(node->left);
    printf("%ld ", node->data);
    printInorder(node->right);
}
 
void printPreorder(struct node* node)
{
    if (node == NULL)
        return;
 
    printf("%ld ", node->data);
    printPreorder(node->left);
    printPreorder(node->right);
}

int main()
{
    struct node* root = newNode(1);
    root->left = newNode(2);
    root->right = newNode(3);
    root->left->left = newNode(4);
    root->left->right = newNode(5);
 
    printfs("Preorder traversal of binary tree is \n");
    printPreorder(root);
 
    printfs("\nInorder traversal of binary tree is \n");
    printInorder(root);
 
    printfs("\nPostorder traversal of binary tree is \n");
    printPostorder(root);
    printfs("\n");
 
    return 0;
}