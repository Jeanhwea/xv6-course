#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	int pid = fork();
	if (pid < 0) {
		printf("fork() failed\n");
		return 0;
	}

	if (pid == 0) {
		exit(0);
	} else {
		sleep(30);
		wait(NULL);
	}
	return 0;
}
