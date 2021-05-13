// support for multi level pointer
// pointer refrencing using [] 
// malloc

int printf(char s[20],int a);
int printf1(char s[20]);
void *malloc(int size);


int main(){
    int **ptr = (int**)malloc(sizeof(int *)*5);
    int i,j;
    for(i=0;i<5;i++){
        ptr[i] = (int*)malloc(sizeof(int)*5);
        for(j = 0;j<5;j++){
            ptr[i][j] = i*10+j;
        }
    }

    for(i=0;i<5;i++){
        for(j = 0;j<5;j++){
            printf("%ld ",ptr[i][j]);
        }
        printf1("\n");
    }

}