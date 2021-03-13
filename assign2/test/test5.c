enum day {sunday, monday, tuesday, wednesday, thursday, friday, saturday}; 

int main()
{
	int n;
	scanf("%d", &n);

	long a, b;
	long long temp;
	
	for(int d = sunday; d <= saturday; d++){
		a = 0, b = 1;
		for(int i = 2; i <= d; ++i)
		{
			temp = b;
			b = a + b;
			a = temp;
		}
		printf("%ld\n", b);
	}
	return 0;
}
