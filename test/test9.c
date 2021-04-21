// code for prime numbers (sieve method)

int prime[10000];
int n = 10000;

void sieve(){
    int i =2;
    for(i=2;i*i<=n;i++){
        if(prime[i] == 0)continue;
        int j;
        for(j = i*i;j*j <=n;j += i){
            prime[j] =0;
        }
    }
    return;
}


int main(){
    int i;
    for(i=2;i<10000;i++)prime[i] =1;
    sieve();
    return 0;
}