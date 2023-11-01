#include <stdio.h>

int add_numbers(int a, int b)
{
	int result;
	__asm__ volatile("add %1, %0" : "=r"(result) : "r"(a), "0"(b));
	return result;
}

int main()
{
	int x = 3;
	int y = 4;
	int sum = add_numbers(x, y);
	printf("sum = %d\n", sum);
	return 0;
}
