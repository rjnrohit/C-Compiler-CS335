// newton raphson
// floating point support
int printf(char s[20],float a);

// x^3-x^2+2
float func(float x){
    return x*x*x - x*x + 2;
}

float deriv(float x){
    return 3*x*x - 2*x;
}

float newton_raphson(float x,float epsilon,int max_itr){
    int i;
    printf("%f\n",epsilon);
    printf("%f\n",-epsilon);
    for(i = 0;i<max_itr;i++){
        float h = func(x)/deriv(x);
        // float h = func(x);
        // float h1 = deriv(x);
        // h = h1/h;
        if(i < 10) printf("%f\n",h);
        if(h < epsilon && h > -epsilon){
            
            return x;
        }
        x = x - h;
    }
    return x;
}

int main(){
    float a = 2;
    // int b = a/2;
    int c = 2;
    int b = (c <= 3 && c >= 1);
    printf("%f abd\n",b);
    b = (a <= 3.1);
    printf("%f abd\n",b);
    b = (a >= 1.5);
    printf("%f abd\n",b);
    if(a <= 3.1 && a >= 1.5){
        printf("%f abcd\n",a);
    }
    printf("%f\n",newton_raphson(-20,1,100));
    return 0;
}