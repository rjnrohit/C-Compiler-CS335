struct data {
    int sum;
    int b[5];
};

int main()
{
    struct data rec1;
    struct data*pdata = &rec1;
    printf("%d", sizeof(rec1));
    rec1.sum=0;
    rec1.b[0]=2;   
    rec1.sum=rec1.sum+rec1.b[0];
    pdata->sum = 34l;
    int a =12;
    return rec1.sum;
}
