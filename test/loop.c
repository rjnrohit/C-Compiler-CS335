// for ,do while, while loop with break and continue support
int printf(char s[50]);
int printf1(char s[50],int a);

int main(){
    int i = 0;
    // supprt for empty in for
    for(;;){
        i++;
        if(i<5) continue;
        if(i>10) break;
        printf1("%ld ",i);
    }
    printf("\n");

    // break in nested loops
    while(true){

        do{
            if(!(i%5)) break;
        }while(i++);

        printf1("%ld ",i);
        if(!(i%7)){
            printf("\n");
            break;
        }
        i++;
    }
}