int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);
void *malloc(int size);

struct node {
   int data; 
   struct node *left;
   struct node *right;
};

struct node *root = NULL;

void insert(int data) {
   printf1("hello\n");
   struct node *tempNode = (struct node*) malloc(32);
   struct node *current;
   struct node *parent;
   printf1("hello\n");
   tempNode->data = data;
   tempNode->left = NULL;
   tempNode->right = NULL;

    if(root == NULL) {
        root = tempNode;
        return;
    }
    current = root;
    parent = NULL;
    while(1){
        parent = current;
        if(data < parent->data) {
            current = current->left;
            if(current == NULL) {
               parent->left = tempNode;
               return;
            } 
        }
        else{
            current = current->right;
            if(current == NULL) {
               parent->right = tempNode;
               return;
            } 
        }
    }
}

void inorder_traversal(struct node* root) {
   if(root != NULL) {
      inorder_traversal(root->left);
      printf("%d ",root->data);          
      inorder_traversal(root->right);
   }
}

int main(){
    insert(2);
    insert(7);
    insert(1);
    insert(9);
    insert(-1);
    inorder_traversal(root);

}