// newton raphson
// floating point support
// support for math function fabs
int printf(char s[20],float a);
int printf1(char s[20],float a,float b,float c,float d);
int printf2(char s[20],int b);
float fabs(float a);

// x^3-x^2+2
float func(float x){
    return x*x*x - x*x + 2;
}

float deriv(float x){
    return 3*x*x - 2*x;
}


float newton_raphson(float x,float epsilon,int max_itr){
    int i;
    for(i = 0;i<max_itr;i++){
        float h = func(x)/deriv(x);
        if(fabs(h)<epsilon){
            return x;
        }
        x = x - h;
    }
    return x;
}

int main(){
    printf("root: %.3f\n",newton_raphson(-20,0.001,100));
    return 0;
}