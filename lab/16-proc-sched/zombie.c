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
		sleep(10);
		printf("child exiting\n");
		exit(0);
	} else {
		sleep(30);
		wait(NULL);
		printf("parent exiting\n");
	}
	return 0;
}
