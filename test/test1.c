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

int main()
{
    int itr, maxmitr;
    float h, x0, x1, allerr;
    
    float x0 = 1, allerr = 0.05;
    int maxmitr = 10000;
    for (itr=1; itr<=maxmitr; itr++)
    {
        h=f(x0)/df(x0);
        x1=x0-h;
        
        if (fabs(h) < allerr)
        {
            return 0;
        }
        x0=x1;
    }
    
    return;
}