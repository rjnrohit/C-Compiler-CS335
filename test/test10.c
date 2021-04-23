// only bit operation

int take_and(int a, float b){
    return a&(int)b;
}

int take_or(float a, int b){
    return (long)a | b;
}


// int take_and(int a){
//     return a;
// }
int array[12][13][14];
int main(int argc, int argv[5]){
    int a,b;
    int *ptr;
    int i,j,k;
    i++;
    ptr[5];
    array[0][0][1];
    for(i=0;i<12;i++){
        for(j=i;j<13;j++){
            for(k=j;j<14;j++)array[i][j][k] = ((i + j)%k)*k;
        }
        int b = array[i] + (int)array[j];
    }
    ++*(++*array);
    int d = ***array;
    return 0.1;
}