

/*this is the 
multiline comment
*/


void f(int a, float b, char c){
    // comment inside a function
    void f13();
    int f3();
    int **f3 = f1();
    int**f7();
    if(1)if(2)if(3)if(4)if(5){{{/*block comment in a block*/{}}}};
    struct a{
        int f43;
    };
}


void f(int, float, char);

int*func (int**, int c);

void foo(int a, int b){
    return a= 4;
}


int  bar(){
    return bar();
    return bar();
    f(3,4.5,'c');
    int a;
    for(a=3;bar() > *func(NULL, 0);foo(1,2)){};
}


void fun(int a) 
{ 
    printf("Value of a is %d\n", a); 
} 
  
int main() 
{ 
    // fun_ptr is a pointer to function fun()  
    void (*fun_ptr)(int) = &fun; 
  
    /* The above line is equivalent of following two 
       void (*fun_ptr)(int); 
       fun_ptr = &fun;  
    */
  
    // Invoking fun() using fun_ptr 
    (*fun_ptr)(10); 
  
    return 0; 
} 