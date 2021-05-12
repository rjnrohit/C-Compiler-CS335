// coammand line arguments
void puts(char *str);
void printf(char *str,int d);
void printf1(char *str,int d, char*s);
void printfs(char *str);

int  main(int argc, char** argv){
    
    printf("no of args: %ld\n", argc);
    int i=0;
    for(i=0;i<argc;i++){
        printf1("argument no.%ld is %s\n",i+1, argv[i]);
    }
    return 0;
}