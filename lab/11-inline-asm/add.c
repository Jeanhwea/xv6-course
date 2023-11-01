#include <stdio.h>

int add_numbers(int a, int b)
{
	int result;

	asm volatile("add %1, %0" // Instruction
		     : "=r"(result) // Outputs
		     : "r"(a), "0"(b) // Inputs
	);

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
