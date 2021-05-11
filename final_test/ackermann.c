// ackermann recursive function
// works fine for m value till 3 and for m = 4 and n till 1 (slow but) 
// gcc also give seg fault for value bigger than this
int printf(char s[20],int a);
int printf1(char s[20]);
int scanf(char s[20],int *a);

int ackermann(int m,int n){
    if (m == 0){
        return n+1;
    }
    else if( m > 0 && n==0){
        return ackermann(m-1,1);
    }
    else if (m > 0 && n>0){
        return ackermann(m-1,ackermann(m,n-1));
    }
    return -1;
}

int main(){
    int m,n;
    scanf("%ld",&m);
    scanf("%ld",&n);
    if(m < 0 || n<0){
        printf1("Enter positive number");
    }
    printf("%ld\n",ackermann(m,n));

}