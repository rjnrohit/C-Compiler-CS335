// binary search tree
// using malloc

int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);
void *malloc(int size);
// #include <stdio.h>
// #include <stdlib.h>
struct Node{
    int data;
    struct Node *left, *right;
};


struct Node *insert(struct Node *root,int data){
    // printf("%ld \n", root);
    // printf("%ld \n", data);
    if (root == NULL){
        struct Node *node = (struct Node*)malloc(sizeof(struct Node));
        node->data = data;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    root->right = insert(root->right,data);
    return root;
}


int main(){
    struct Node *root = NULL;
    root = insert(root,1);
    printf("%ld\n", root->data);
    root = insert(root,2);
    printf("%ld\n", root->right->data);
}