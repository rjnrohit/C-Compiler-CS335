// quicksort using recusrion and array passing in function
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

void quicksort(int arr[50],int first,int last){
    int i,j,pivot,temp;
    if(first >= last) return;
    pivot = first;
    i = first;
    j = last;
    while(i<j){
        while(arr[i]<=arr[pivot] && i<last)
            i++;
        while(arr[j]>arr[pivot])
            j--;
        if(i<j){
            temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
        }
    }
    temp=arr[pivot];
    arr[pivot]=arr[j];
    arr[j]=temp;
    quicksort(arr,first,j-1);
    quicksort(arr,j+1,last);
}

int main(){
    int n;
    int arr[50];
    scanf("%ld",&n);
    if ( n >= 50 ){
        printf1("array size should be less than 50");
        return -1;
    }
    int i;
    for(i = 0;i<n;i++){
        scanf("%ld",&arr[i]);
    }
    quicksort(arr,0,n-1);
    for(i = 0;i<n;i++){
        printf("%ld ",arr[i]);
    }
    printf1("\n");
    return 0;
}