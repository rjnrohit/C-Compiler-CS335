//function with grater than 7 parameters
// support for large expression

void printfi(char a[200], int b);
void printff(char a[200], float b);

//functions with 21 parameter
float many_sum(int a,int b, int c, int d, int e, int f, int g, int h, int i, int j, int k, float l, float m, float n, float o, float p, float q, float r , float s, float t, float u){
    float sum =  a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t+u;
    printfi("a:%ld\n", a);
    printfi("b:%ld\n", b);
    printfi("c:%ld\n", c);
    printfi("d:%ld\n", d);
    printfi("e:%ld\n", e);
    printfi("f:%ld\n", f);
    printfi("g:%ld\n", g);
    printfi("h:%ld\n", h);
    printfi("i:%ld\n", i);
    printfi("j:%ld\n", j);
    printfi("k:%ld\n", k);
    printff("l:%f\n", l);
    printff("m:%f\n", m);
    printff("n:%f\n", n);
    printff("o:%f\n", o);
    printff("p:%f\n", p);
    printff("q:%f\n", q);
    printff("r:%f\n", r);
    printff("s:%f\n", s);
    printff("t:%f\n", t);
    printff("u:%f\n", u);
    return sum;
}

int main(){
    float sum = many_sum(1,2,3,4,5,6,7,7,4,3,4,1.1,0.99,3,1,4.56,99999.9,3,9,-32,-11);
    printff("%f\n", sum);
    return 0;
}