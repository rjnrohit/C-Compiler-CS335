// Newton-Raphson Method

float f(float x)
{
    return x*x + 3*x - 1.2;
}
float df (float x)
{
    return 2*x + 3;
}
float fabs(float x){
	return x<0?-x:x;
}

void main()
{
    int itr, maxmitr;
    float h, x0, x1, allerr;
    printf("\nEnter x0, allowed error and maximum iterations\n");
    scanf("%f %f %d", &x0, &allerr, &maxmitr);
    for (itr=1; itr<=maxmitr; itr++)
    {
        h=f(x0)/df(x0);
        x1=x0-h;
        printf(" At Iteration no. %3d, x = %f\n", itr, x1);
        if (fabs(h) < allerr)
        {
            printf("After %d iterations, root = %f\n", itr, x1);
            return 0;
        }
        x0=x1;
    }
    printf(" The required solution does not converge or iterations are insufficient\n");
    return;
}