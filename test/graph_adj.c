// graph using adj list
// referencing array using expression
// using logical !
// using do while loop
int printf(char s[20],int a);
int printf1(char s[20]);
int printf2(char s[20],int a,int b);
int scanf(char s[20],int *a);
void *malloc(int size);

struct Node{
    int v;
    struct Node *next;
};

struct Node *adj[11];
int visited[11];

void dfs(int u,int p){
    visited[u] = 1;
    if (p == -1) printf("Node %ld: new tree\n",u+1);
    else printf2("Node %ld: Parent: %ld\n",u+1,p+1);
    struct Node *node = adj[u];
    while(node != NULL){
        if (!visited[node->v]) dfs(node->v,u);
        node = node->next;
    }
}

void push(int u,int v){
    if(u>=11) return;
    struct Node *node = (struct Node*)malloc(sizeof(struct Node));
    node->v = v;
    node->next = adj[u];
    adj[u] = node;
}

int main(){
    int i;
    for(i = 0;i<11;i++){
        adj[i] = NULL;
        visited[i] = 0;
    }
    int n;
    printf1("Enter number of vertice (<=10)\n");
    scanf("%ld",&n);
    if(n>10 || n<1){
        printf1("invalid number\n");
        return -1;
    }
    for(i = 0;i <n;i++){
        int v;
        do{
            scanf("%ld",&v);
            if(v == -1){
                break;
            }
            push(i,v-1);
        }while(true);
    }
    for(i = 0;i<n;i++){
        if(!visited[i]) dfs(i,-1);
    }

}