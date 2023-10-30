#include <stdio.h>
#include <unistd.h>

int main()
{
	pid_t child_pid;

	// Create a new child process
	child_pid = fork();

	if (child_pid == -1) {
		// Fork failed
		perror("Fork failed");
		return 1;
	}

	if (child_pid == 0) {
		// This code is executed by the child process
		printf("Child process: PID = %d, Parent PID = %d\n", getpid(),
		       getppid());
	} else {
		// This code is executed by the parent process
		printf("Parent process: PID = %d, Child PID = %d\n", getpid(),
		       child_pid);
	}

	return 0;
}
