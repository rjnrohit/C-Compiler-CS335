int fib(int n){
    if(n<=1)return n;
    return fib(n-1) + fib(n-2);
}

void printf(char s[20], int c);
void scanf(char s[20],int *c);
//ptr = (int*)malloc(n * sizeof(int));
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
int main() {
   char str1[100] = "This is ", str2[456] = "programiz.com";

   // concatenates str1 and str2
   // the resultant string is stored in str1.
   strcat(str1, str2);
   if(!strcmp("rohit", "rohit")){
       printf("strings are same\n",3);
   }else{
       printf("they are not same\n",3);
   }
   
   puts(str1);
   puts(str2);

   strcpy(str2, str1);

   puts(str1);
   puts(str2);

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
   fprintf(ptr1, "%s\n",str1);
   fclose(ptr1);
   fclose(ptr2);
   
   return 0;
}

// bool is_odd(int n);
// bool is_even(int n);

// void printf(char s[100],int a);
// void scanf(char s[100],int *a);

// int main(){
//     int n = 0;
//     scanf("%ld",&n);
//     if(n < 0){
//         printf("Enter a positive number\n",0);
//         return 0;
//     }
//     printf("%ld\n",is_odd(n));
// }

// bool is_odd(int n){
//     if( n == 0) return false;
//     return is_even(n-1);
// }

// bool is_even(int n){
//     if( n == 0) return true;
//     return is_odd(n-1);
// }

