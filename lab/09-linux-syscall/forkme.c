#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
	int pid = fork();
	int wstatus = -1;
	if (pid > 0) {
		printf("parent: child %d\n", pid);
		pid = wait(&wstatus);
		printf("parent: child %d exit, wstatus = %d\n", pid, wstatus);
	} else if (pid == 0) {
		printf("child: starting\n");
		sleep(1);
		printf("child: exiting\n");
		exit(0);
	} else {
		printf("fork error\n");
	}
	return 0;
}
