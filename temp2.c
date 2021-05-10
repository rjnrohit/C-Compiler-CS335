struct A{
    int x;
    int arr[10];
};
int printf(char s[20],int a);
int scanf(char s[20],int *a);

void input_matrix(int a[10][10],int n){
    int i,j;
    for(i = 0;i < n;i++){
        for(j = 0;j<n;j++){
            int b;
            // printf("%ld\n",&a[i][j]);
            scanf("%ld",&a[i][j]);
        }
    }
    // for(i = 0;i < n;i++){
    //     for(j = 0;j<n;j++){
    //         printf("%ld ",a[i][j]);
    //     }
    //     printf("\n",1);
    // }
    // return 0;
}

void foo(){
    printf("%ld\n",3);
}

int main(){
    int a[10][10];
    int b[10][10];
    int c[10][10];
    // struct A a;
    int n;
    scanf("%ld",&n);
    // scanf("%ld",&m);
    // printf("%ld\n",a);
    input_matrix(a,n);
    input_matrix(b,n);
    foo();
    int i,j,k;
    for(i = 0;i<n;i++){
        for(j = 0;j<n;j++){
            c[i][j] = 0;
            for(k = 0;k<n;k++){
                c[i][j] += a[i][k]*b[k][j];
            }
        }
    }
    for(i = 0;i<n;i++){
        for(j = 0;j<n;j++){
            printf("%ld ",c[i][j]);
        }
        printf("\n",1);
    }
    printf("successful\n",1);
    
    // int c[100][100]
    // printf("%ld\n",arr);
    // printf("%ld\n",arr[4]);
    // printf("%ld\n",a.arr[5]);
    return 0;
}