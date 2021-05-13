// switch case can use with variable, expression
// break in switch case

int printf(char s[100]);
int printf1(char s[100],int a);

int main(){
    int arr[3];
    arr[0] = 1;
    arr[1] = 'c';
    arr[2] = 3;
    arr[3] = 9;

    int i = 0;
    float b = 3.1;
    while(i<4){
        printf1("test%ld\n",i+1);
        switch(arr[i]){
            case 1:{
                printf("case 1: checking break\n");
                break;
            }
            case 'a'+2:{
                printf("case 2: checking expression in case\n");
            }
            case b:{
                printf("case 3: checking variable in case and type cast\n");
                break;
            }
            case 'c':{
                printf("case 4: checking without break case\n");
            }
            default:{
                printf("default\n");
            }
        }
        i++;
    }
}
