//fibonacci


int f(int n){
    if(n <= 1)return n;
    return f(n-1) + f(n-2);
}

int main(){
    return f(4);
}