int main()
{
	int n;
	scanf("%d", &n);

	long a, b;
	long long temp;
	
	int d = -5;
	for(;d <= 10; d++){
		a = 0, b = 1;
		int i;
		for(i = 2; i <= d; ++i)
		{
			temp = b;
			b = a + b;
			a = temp;
		}
		printf("%ld\n", b);
	}
	return 0;
}
