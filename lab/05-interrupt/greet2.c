#include <unistd.h>

int main (int argc, char *argv[])
{
	char *msg = "Hello from C\n";
	write(1, msg, sizeof(msg));
	return 0;
}
