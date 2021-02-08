int x = 10;
char a[10];
static int y = 5;

char f(){
	for(int i = 0;i<10;++i){
		a[i] = 'a' + i;
	}
	return a[5];
}

int main ()
{
    int* p;
    p = (int *) malloc(4);
    *p = 5;
    printf("%d\n", *p);
    printf("%c\n", f());
    
    return y++;
}
