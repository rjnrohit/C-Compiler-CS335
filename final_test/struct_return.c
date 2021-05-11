// struct return type and input
// struct assginment (can do struct = struct)
int printf(char s[20],int a,int b);
int printf1(char s[20]);

struct distance{
    int km;
    int m;
};

struct distance addDistance(struct distance d1, struct distance d2){
    struct distance d;
    d.km = d1.km+d2.km+(d1.m+d2.m)/1000;
    d.m = (d1.m+d2.m)%1000;
    // printf("d1 %ldkm %ldm\n",d1.km,d1.m);
    // printf("d2 %ldkm %ldm\n",d2.km,d2.m);
    printf("%ldkm %ldm\n",d.km,d.m);
    return d;
}

void printDistance(struct distance d){
    printf1("Distance: ");
    printf("%ldkm %ldm\n",d.km,d.m);
}

int main(){
    struct distance d1,d2,d3;
    d1.km = 1;
    d1.m = 500;
    d2.km = 2;
    d2.m = 600;
    d3.km = 1;
    d3.m = 200;
    printf("%ldkm %ldm\n",d1.km,d1.m);
    printf("%ldkm %ldm\n",d2.km,d2.m);
    printf("%ldkm %ldm\n",d3.km,d3.m);
    struct distance d;
    d = addDistance(d1,d2);
    d = addDistance(d,d3);
    printDistance(d);
}