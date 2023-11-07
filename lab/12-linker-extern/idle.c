#include <stdio.h>
#include <unistd.h>

int n = 100;
int nums[100] = {};

int main(int argc, char *argv[])
{
	printf("pid = %d\n", getpid());
	for (int i = 0; i < n; ++i) {
		nums[i] = 0;
	}
	sleep(5 * 60);
	return 0;
}
