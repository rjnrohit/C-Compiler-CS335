// graph using matrix
// array as function input
int printf(char s[20],int a);
int printf1(char s[20]);
int printf2(char s[20],int a,int b);
int scanf(char s[20],int *a);


void dfs(int adj[11][11],int visited[11],int u,int n,int p){
    if (p == -1) printf("Node %ld: new tree\n",u+1);
    else printf2("Node %ld: Parent: %ld\n",u+1,p+1);

    int i;
    for(i = 0;i<n;i++){
        if(adj[u][i] == 1 && visited[i] == 0){
            visited[i] = 1;
            dfs(adj,visited,i,n,u);
        }
    }
}

int main(){
    int adj[11][11];
    int visited[11];
    int i,j;
    for(i = 0;i<11;i++){
        visited[i] = 0;
        for(j = 0;j<11;j++){
            adj[i][j] = 0;
        }
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
            if(v > n || v <= 0){
                printf1("invalid number\n");
                return -1;
            }
            adj[i][v-1] = 1;
        }while(true);
    }
    for(i = 0;i<n;i++){
        if(!visited[i]){
            visited[i] = 1;
            dfs(adj,visited,i,n,-1);
        }
    }
    
}