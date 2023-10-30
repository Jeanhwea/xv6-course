#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	int num = rand() - 10;
	if (num > 0) {
		printf("aaa\n");
	} else {
		printf("bbb\n");
	}
	return 0;
}
