// code for prefix sum

int a[23];
int n = 23;

int main(){
    int i;
    for(i=0;i<n;i++){
        a[i] = i*i;
    }

    for(i =0;i<n;i++){
        if(i)
            a[i] += a[i-1];
        else continue;
    }

    return 0;
}


