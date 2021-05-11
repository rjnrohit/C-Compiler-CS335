
// // int gg;
// // int g =34;
// // char str[6] = "string"; //TODO check for <6

// // int wow(int a, int b, float c, long d, int e, float fll, int aa, float dd, int cc, float ddd, int ccc, int ccccc, float x, float xx, float xxx, float xxxx, float xxxxx, float xxxxxx, float xxxxxxxxx, float xxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx){
// // 	a += b;
// // 	return a;
// // }

// // // int f(int a, int b, float c, long d, int e, float fll, int aa, float dd, int cc, float ddd, int ccc, int ccccc, float x, float xx, float xxx, float xxxx, float xxxxx, float xxxxxx, float xxxxxxxxx, float xxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx, float xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx){
// // // 	int xd;
// // // 	xd = 12;
// // // 	xd += 1.0;
// // // 	wow(1,2,3.2,45,4,3.1, 4,3.4,4,4.5,45,66, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1);
// // // 	return 0;
// // // }

// // struct A
// // {
// // 	int a;
// // 	struct A*c;
// // };


// // struct A d;
// // int a[20];

// // int b=0, c=0;
// // long def =1;
// // struct AA
// // {
// // 	int x,y;
// // };

// // // struct AA add = {3,4};

// // int foo(float x, float bx[5]){
// // 	bx[0] = 1.1;
// // 	return x;
// // }

// // int main(int argc, int*argv){
// // 	d.a = 5;
// // 	// bool adx = true;
// // 	// if(adx)adx = false;
// // 	d.c = &d;
// // 	int a, b;
// // 	float c;
// // 	int ff = -1;
// // 	a = 3 + 5;
// // 	b = a + 1.0;
// // 	c = b - 1.1;
// // 	//f(1,2,3.2,45,4,3.1, 4,3.4,4,4.5,45,66, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1);
// // 	float bcc = 2;
// // 	float bx[13];
// // 	foo(bcc, bx);
// // 	return 0;
// // }
// #include<stdio.h>

// int ackermann(int m,int n){
//     if (m == 0){
//         return n+1;
//     }
//     else if( m > 0 && n==0){
//         return ackermann(m-1,1);
//     }
//     else if (m > 0 && n>0){
//         return ackermann(m-1,ackermann(m,n-1));
//     }
//     return -1;
// }

// int main(){
//     int m,n;
//     scanf("%d",&m);
//     scanf("%d",&n);
//     if(m < 0 || n<0){
//         printf("Enter positive number");
//     }
//     printf("%d\n",ackermann(m,n));

// }

// binary search tree
// using malloc

// int printf(char s[20],int a);
// int printf1(char s[20]);
// int scanf(char s[20],int *a);
// void *malloc(int size);
#include<stdio.h>
#include <stdlib.h>

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
    printf("%d ",root->data);
    inorder(root->right);
}
void preorder(struct Node *root){
    if(root == NULL) return;
    printf("%d ",root->data);
    inorder(root->left);
    inorder(root->right);
}
void postorder(struct Node *root){
    if(root == NULL) return;
    inorder(root->left);
    inorder(root->right);
    printf("%d ",root->data);
}

int main(){
    struct Node *root = NULL;
    printf("Enter number to insert in BST (stop at -1)\n");
    int n;
    do{
        scanf("%d",&n);
        if(n == -1) break;
        root = insert(root,n);

    }while(1);
    
    inorder(root);
    preorder(root);
    postorder(root);
}