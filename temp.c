struct node
{
    struct node *left;
    int data;
    struct node *right;
};


void insert(struct node **p,int num)
{
    if((*p)==0)
    {
        struct node **y;
        (*p)=y;
        (*p)->left = 0;
        (*p)->right = 0;
        (*p)->data = num;
        return;
    }
    else
    {
        if(num==(*p)->data)        
            return;
        
        if(num<(*p)->data)
            insert(&((*p)->left),num);
        
        else
            insert(&((*p)->right),num);
    }
    return;
}

void inorder(struct node *p)
{
    if(p!=0)
    {
        inorder(p->left);
        inorder(p->right);
    }
    return;
}
 
void preorder(struct node *p)
{
    if(p!=0)
    {
        preorder(p->left);
        preorder(p->right);
    }
    
    return;
}
 
void postorder(struct node *p)
{
    if(p!=0)
    {
        postorder(p->left);
        postorder(p->right);
    }
    
    return;
}

void main()
{
    
    struct node *ptr;
    int no=6,i;

    int arr[5];
    arr[0] = 12;
    arr[1] = 11;
    arr[2] = 13;
    arr[3] = 5;
    arr[4] = 6;
    arr[5] = 7;

 
    ptr = 0;
    ptr->data=0;
 
    for(i=0;i<no;i++)
    {
        insert(&ptr,arr[i]);
    }
 
    inorder(ptr);
    preorder(ptr);
    postorder(ptr);
}