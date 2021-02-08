struct data {
    int sum;
    int b[5];
};

int main()
{
    struct data rec1;
    printf("%d", sizeof(rec1));
    rec1.sum=0;
    rec1.b[0]=2;
    rec1.sum=rec1.sum+rec1.b[0];
    return rec1.sum;
}
