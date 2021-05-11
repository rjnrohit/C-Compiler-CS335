// different string functions
// strlen, strcpy, strcat, strcmp, strchr, strstr, atol, puts, gets

void printf(char a[20], int c);
char* puts(char* a);
char* gets(char* a);

int atol(char a[20]);
int strlen(char a[20]);
char *strcat(char a[100], char b[100]);
char *strcpy(char a[100], char b[100]);
int strcmp (char str1[50], char str2[50]);

int main() {
    char str1[1000], str2[1000];
    puts("enter string1:");
    gets(str1);
    puts("enter string2:");
    gets(str2);

    puts("length of string1:");
    printf("%ld\n", strlen(str1));

    puts("length of string2:");
    printf("%ld\n", strlen(str2));
    
    // concatenates str1 and str2
    // the resultant string is stored in str1.
    char str3[200];
    strcat(str3, str1);
    strcat(str3, str2);
    
    puts("concatenated string: ");
    puts(str3);

    puts("copy of string1:");
    strcpy(str3, str1);
    puts(str3);

    puts("copy of string2:");
    strcpy(str3, str2);
    puts(str3);

    if(!strcmp(str1, str2)){
        puts("string1 and string2 are same");
    }else{
        puts("string1 and string2 are not same");
    }
    return 0;
}
