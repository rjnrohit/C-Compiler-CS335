//Binary Tree Insertion and Traversal --- (Inorder, Preorder, Postorder)
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
    void insert(struct node **,int);
    void inorder(struct node *);
    void postorder(struct node *);
    void preorder(struct node *);
 
    struct node *ptr;
    int no,i,num;
 
    ptr = 0;
    ptr->data=0;
    
    scanf("%d",&no);
 
    for(i=0;i<no;i++)
    {
        scanf("%d",&num);
        insert(&ptr,num);
    }
 
    inorder(ptr);
    preorder(ptr);
    postorder(ptr);
}
 