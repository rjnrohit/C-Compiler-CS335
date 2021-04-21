float f(int a){
    if (a <= 0){
        return 0;
    }
    else{
        return f(a-1)+2;
    }
}

int main(){
    int b = f(5.1);
}