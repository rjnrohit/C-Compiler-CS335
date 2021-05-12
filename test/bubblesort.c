// bubble sort using array and nested loop
// pointer swap in function
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

void swap(int *a,int *b){
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main(){
    int n;
    int arr[50];
    scanf("%ld",&n);
    if ( n >= 50 ){
        printf1("array size should be less than 50\n");
        return -1;
    }
    int i,j;
    for(i = 0;i<n;i++){
        scanf("%ld",&arr[i]);
    }
    for(i  = 0;i<n-1;i++){
        for(j = 0;j<n-i-1;j++){
            if (arr[j] > arr[j+1]) swap(&arr[j],&arr[j+1]);
        }
    }
    for(i = 0;i<n;i++){
        printf("%ld ",arr[i]);
    }
    printf1("\n");
}