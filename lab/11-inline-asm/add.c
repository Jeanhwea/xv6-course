#include <stdio.h>
int add(int a, int b)
{
	int res;
	asm("add %1, %2;" : "=r"(res) : "r"(a), "0"(b));
	return res;
}

int main()
{
	printf("8+4 == %d\n", add(8, 4)); // prints 8+4 == 12
}
