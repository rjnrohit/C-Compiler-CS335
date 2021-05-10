// int fib(int n){
//     if(n<=1)return n;
//     return fib(n-1) + fib(n-2);
// }
void printf(char s[20], int c);
int many_sum(int a,int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, float l, float m, float n, float o, float p, float q, float r , float s, float t, float u){
    float ss =  a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t+u;
    printf("%ld\n", (int)ss);
    return ss;
}

void scanf(char s[20],int *c);
void free(int *ptr);
void exit(int a);
int *malloc(int size);
int puts(char a[10]);
float sqrt(float c);
float cos(float d);
float ceil(float d);
int strlen(char a[20]);
int atoi(char a[20]);
char *strcat(char a[100], char b[100]);
char *strcpy(char a[100], char b[100]);
int strcmp (char str1[50], char str2[50]);
int* fopen(char a[200], char c[10]);
int fprintf(int *ptr,char a[100], char b[100]);
int fscanf(int *ptr,char a[100], int*d);
int fclose(int*c);
int main(int argc) {
//     printf("%ld\n", argc);
//    char str1[100] = "This is ", str2[456] = "programiz.com";

//    // concatenates str1 and str2
//    // the resultant string is stored in str1.
//    strcat(str1, str2);
//    if(!strcmp("rohit", "rohit")){
//        printf("strings are same\n",3);
//    }else{
//        printf("they are not same\n",3);
//    }
   
//    puts(str1);
//    puts(str2);

//    strcpy(str2, str1);

//    puts(str1);
//    puts(str2);

//    int*ptr1 = fopen("temp1.txt", "w");
//    int*ptr2 = fopen("temp2.txt", "r");
//    if (!(int)ptr1){
//        printf("error\n",1);
//        exit(-1);
//    }
//    if (!(int)ptr2){
//        printf("error\n",1);
//        exit(-1);
//    }
//    int sc;
//    fscanf(ptr2,"%ld", &sc);
//    printf("sc: %ld\n", sc);
//    fprintf(ptr1, "%s\n",str1);
//    fclose(ptr1);
//    fclose(ptr2);
   printf("%ld\n", many_sum(1, 2,3,4,5,6,7,8,9,10,11, 11.7, 12.7, 13, 12,11,1.3, 0.1,0.01,4.999,1));
   return 0;
}


