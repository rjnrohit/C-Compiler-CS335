
int a = 5 < 3;
long b = 34 | 63;

int solve();

int main(int argc, int*argv){
    int n = 25;
    long power_of_2 = 1;
    long ans = 1;
    while(n--){
        ans = ans << 1;
    }
    solve();
    return 0;
}

int min(int a, int b){
    return a>b?b:a;
}

// int max(int a, int b){
//     return a&&b?a:b;
// }

int printf(char* stmt, int d);

int scanf(char* stmt, int*d);


int solve(){
    long n;
    scanf("%ld", &n);
    int c[1000], os[1000], es[1000], mes[1000], mos[1000];
    int i=0;
    for(;i<n;i++){
        scanf("%ld", &c[i]);
    }
    es[0] = c[0], os[1] = c[1], mes[0] = es[0], mos[1] = os[1];
    long ans = c[0]*n + c[1]*n;
    for(i=2;i<n;i++){
        if(i%2){
            os[i] += os[i-2] + c[i];
            mos[i] = c[i];
            mos[i] = min(mos[i], mos[i-2]);
            ans = min(ans, os[i] + es[i-1] + (n-(i+1)/2)*mos[i] + (n-(i+1)/2)*mes[i-1]);
        }else{
            es[i] += es[i-2] + c[i];
            mes[i] = c[i];
            mes[i] = min(mes[i], mes[i-2]);
            ans = min(ans, es[i] + os[i-1] + (n-(i+2)/2)*mes[i] + (n-i/2)*mos[i-1]);
        }
    }
    printf("%ld", ans);
    return -1;
}