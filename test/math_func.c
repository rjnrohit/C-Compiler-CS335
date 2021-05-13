//different math functions
// fabs, pow, sqrt, ceil,floor, cos, sin, tan, exp, log, log10, trunc, round

void printf(char a[200]);
void printfi(char a[20], int b);
void printff(char a[20], float b);

void scanf(char a[20], float*c);
void scanf1(char a[20], float*c, float*d);

float fabs(float a);
float pow(float a, float b);
float sqrt(float a);
float ceil(float a);
float floor(float a);
float cos(float a);
float sin(float a);
float tan(float a);
float exp(float a);
float log(float a);
float log2(float a);
float log10(float a);
int trunc(float a);
int round(float a);

int main(){
    float n;
    printf("enter a number to output absolute: ");
    scanf("%f", &n);
    printff("value: %f\n", fabs(n));
    float p;
    printf("enter a number, power to output pow: ");
    scanf1("%f, %f", &n, &p);
    printff("value: %f\n", pow(n,p));
    printf("enter a number to output square root of it: ");
    scanf("%f", &n);
    printff("value: %f\n", sqrt(n));
    printf("enter a number to output ceil: ");
    scanf("%f", &n);
    printff("value: %f\n", ceil(n));
    printf("enter a number to output floor: ");
    scanf("%f", &n);
    printff("value: %f\n", floor(n));
    printf("enter a number to output cos: ");
    scanf("%f", &n);
    printff("value: %f\n", cos(n));
    printf("enter a number to output sin: ");
    scanf("%f", &n);
    printff("value: %f\n", sin(n));
    printf("enter a number to output tan: ");
    scanf("%f", &n);
    printff("value: %f\n", tan(n));
    printf("enter a number to output exp: ");
    scanf("%f", &n);
    printff("value: %f\n", exp(n));
    printf("enter a number to output log: ");
    scanf("%f", &n);
    printff("value: %f\n", log(n));
    printf("enter a number to output log2: ");
    scanf("%f", &n);
    printff("value: %f\n", log2(n));
    printf("enter a number to output log10: ");
    scanf("%f", &n);
    printff("value: %f\n", log10(n));

    return 0;
}

