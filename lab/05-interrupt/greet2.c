#include <unistd.h>
#include <stdlib.h>

char msg[] = "Hello from C\n";

int main()
{
	write(1, msg, 13);
	exit(0);
}
