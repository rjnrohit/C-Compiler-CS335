# C-Compiler-CS335: arcx86
Course Project , C-compiler implemented in Python , CS335, IIT Kanpur
<br>
<!-- [Milestone1 Report (Latex)](https://github.com/RohitRanjangit/C-Compiler-CS335/blob/main/Documentation/CS335_Project_Milestone1.pdf) -->


environment-setup:

**Choose your default version to python3**
```
#upgrade to latest version of pip
python3 -m pip install --upgrade pip
sudo apt-get install graphviz graphviz-dev
pip install -U -r requirements.txt
```


build: 
```
source install.sh
```

usage:
*make sure you've built install.sh*
```
arcx86 [-h] [-o O] [-f F] [-c] [-d] [-a] [-s] [-t] [-l] [-stdc] [-n] source_code

positional arguments:
  source_code  location of source code file

optional arguments:
  -h, --help   show this help message and exit
  -o O         output file name ,default 'a.out'
  -f F         name of file for additional files, default 'a'
  -c           output object file
  -d           output assembly
  -a           output ast
  -s           output symbol table
  -t           output 3 address code
  -l           output lexeme table
  -stdc        linker method, if specified it'll uses custom elf entry else from standard X86-64-linux.so
  -n           only create till asm, do not create executable 
```


Run tests from test/
```
chmod +x test.sh
./test.sh [flags]   (flags same as arcx86)
```
create output in output folder, to run test
```
./output/${file_name}
```


sample source_code with name arg.c:
```
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
```
After running it we get:
```
rohit@bullst:~/C-Compiler-CS335$ arcx86 arg.c 

rohit@bullst:~/C-Compiler-CS335$ ./a.out wah modiji wah
no of args: 4
argument no.1 is ./a.out
argument no.2 is wah
argument no.3 is modiji
argument no.4 is wah
```