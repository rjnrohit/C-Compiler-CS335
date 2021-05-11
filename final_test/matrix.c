// matrix multiplication
// passing multi dimension array as input to function
//looping multi dimension array

int printf(char s[20],int a);
int printf1(char s[20],int a,int b);
int printf2(char s[30]);
int printf3(char s[20],int a,int b,int c);
int scanf(char s[20],int *a);

void input_matrix(int matrix[100][100],int n,int m){
    printf1("give matrix input of size %ldx%ld\n",n,m);
    int i,j;
    for(i = 0; i < n;i++){
        for(j = 0;j < m;j++){
            scanf("%ld",&matrix[i][j]);
        }
    }
}

int main(){
    int m,n,p;
    printf2("Enter matrix size (less than 100)\n");
    scanf("%ld",&m);
    scanf("%ld",&n);
    scanf("%ld",&p);

    if(m>=100 || n>=100 || p>=100){
        printf2("Invalid size\n");
    }
    
    int a[100][100], b[100][100], c[100][100];
    input_matrix(a,m,n);
    input_matrix(b,n,p);
    int i,j,k;
    for(i = 0;i<m;i++){
        for(j = 0;j<p;j++){
            c[i][j] = 0;
            for(k = 0;k<n;k++){
                c[i][j] += a[i][k]*b[k][j];
            }
        }
    }

    for(i = 0;i<m;i++){
        for(j = 0;j<p;j++){
            printf("%ld ",c[i][j]);
        }
        printf2("\n");
    }
    
}