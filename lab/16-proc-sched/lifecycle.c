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
		char *argv[] = { "ls", "-l", NULL };
		char *envs[] = { NULL };
		execve("/bin/ls", argv, envs);
		exit(0);
	} else {
		wait(NULL);
	}
	return 0;
}
