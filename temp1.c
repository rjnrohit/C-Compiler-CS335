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
    int a = 7, b= 3;
    printf("%ld\n", a|b);
}