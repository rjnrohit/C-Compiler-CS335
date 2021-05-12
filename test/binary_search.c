// binary seach using recursion and array

int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

int binary_search(int arr[50],int l,int r,int a){
    if (r < l) return -1;
    int mid = l + (r-l)/2;
    if( arr[mid] == a ) return mid;
    if( arr[mid] > a ) return binary_search(arr,l,mid-1,a);
    return binary_search(arr,mid+1,r,a);
}
int main(){
    int n;
    int arr[50];
    scanf("%ld",&n);
    if ( n >= 50 ){
        printf1("array size should be less than 50\n");
        return -1;
    }
    printf1("Enter array in sorted order\n");
    int i;
    for(i = 0;i<n;i++){
        scanf("%ld",&arr[i]);
    }
    printf1("Enter element to search: ");
    int a;
    scanf("%ld",&a);
    int index = binary_search(arr,0,n-1,a);
    if(index == -1){
        printf1("Element not found\n");
    }
    else printf("Element found at position %ld\n",index+1);
    
}