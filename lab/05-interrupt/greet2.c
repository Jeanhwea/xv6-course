#include <unistd.h>
#include <stdio.h>

char *msg = "Hello from C\n";

int main()
{
	write(1, msg, 13);
	return 0;
}
