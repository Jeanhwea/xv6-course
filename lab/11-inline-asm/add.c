#include <stdio.h>

static inline int add(int x, int y)
{
	return x + y;
}

int main(int argc, char *argv[])
{
	int ans = add(1, 3);
	printf("ans = %d\n", ans);
	return 0;
}
