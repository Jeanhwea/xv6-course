#include <unistd.h>

char msg[] = "12345678\n";

int main()
{
	ssize_t n = read(0, msg, 8);
	write(1, msg, n);
	return 0;
}
