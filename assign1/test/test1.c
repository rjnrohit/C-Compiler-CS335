/* Multiline comment
It'll appear as block comment
token name will be BLOCK_COMMENT*/

//this is an inline comment

void f1(){
    f1();
    return f1();
}

void f2();

int global =0;

long double another_global_variable_WITH_CODE_12387894965 = 34521.;

int main(){
    int* pointer1 = NULL;
    int **pointer2 = &pointer1;
    int hex_num = 0x123ffddffcd;
    *pointer1 = 1e144;
    bool logic1 = true;
    hex_num << 1;
    logic1 = true && false || (logic1 ^0xffffff );
    {
        char a = 'a';
        char str1[345]= "this \0 is a character\t \narray";
    }
    return 0;
}

int f3(){
    char str[] = "check_constant_string";
    {
        long block_var1 = 0;
        {
            double var2 = 1685.34e100;
        }
    }
    return (int).123e120;
}