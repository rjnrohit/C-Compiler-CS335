int a, b,c;

int main();

struct main{
    int f;
    struct main* main;
};


struct Node{
    int a;
    int b;
    struct Node* next, *ptr;
    struct Node* left;
};

void insert(){
    struct Node a;
    struct Node* ptr = &a;
    ptr->a = 45;
    ptr->next = NULL;
}

int* foo(int t, int u, char str[24]){
    while (t--)
    {
        int i;
        i=0;
        for(i=0;i<24;i++)str[i] = (char)('a' + i);
    }
    return (void*)t + u;
}

int zoo(float a, float d){
    return (int)a%(long)d;
}

int ter(int c){
    return a > b ? a:(b %a ? c :c);
}

int main(){

    struct inside{
        int x;
        struct inside *s;
    };

    struct inside main1;

    main1.x= main1.s->x;

    int a[45][50];
    int z;
    z = 0;
    do{
        int j = z + 1;
        a[12][13] = j++;
        if(j == 1000 + (float)1){
            break;
        }else if(j != +23  + (float)23.4)continue;
        z = ++z;
    }while(z < 100);

    int cc = 0;
    for(;;cc += cc%2 + 3.45){
        bool flag = 1;
        if(cc%22 % 34){
            int k;
            for(k = 23;k<46;){
                if((k != 0) && cc == k)flag = 0;
                else break;
            }
            for(;flag!=flag + 3;){
                continue;
                if(flag ^ 3)break;
            }
        }
        if(!flag)continue;
    }

    switch ((long)23)
    {
    case 23: {**a += b;break;}
    default:{
        b += **a || c + 4;
        break;
    }
    }

    return *(foo(4,5,"str24") + (long)&z);
}

