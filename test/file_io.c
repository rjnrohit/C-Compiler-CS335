// file io


void printf(char s[20], int c);
void scanfs(char s[20], char *str);

void scanf(char s[20],int *c);

int* fopen(char a[200], char c[10]);
int fprintf(int *ptr,char a[100], char b[100]);
int fscanf(int *ptr,char a[100], int*d);
int fclose(int*c);
void puts(char* str);
void gets(char* str);
int exit(int b);

int main() {
    int*ptr1 = fopen("temp1.txt", "w");
    int*ptr2 = fopen("temp2.txt", "r");
    if (!(int)ptr1){
        printf("error\n",1);
        exit(-1);
    }
    if (!(int)ptr2){
        printf("error\n",1);
        exit(-1);
    }
    int sc;

    fscanf(ptr2,"%ld", &sc);
    printf("sc: %ld\n", sc);
    char str1[200];
    puts("enter a string to write in temp2.txt");
    gets(str1);
    // scanf("%100[0-9a-zA-Z ]", str1);
    fprintf(ptr1, "%s\n",str1);
    fclose(ptr1);
    fclose(ptr2);
    return 0;
}
