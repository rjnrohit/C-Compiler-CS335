// Performing simple looping operations

int main()
{
	int n=20;

	long a, b;
	long temp;
	
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
	}
	return 0;
}
