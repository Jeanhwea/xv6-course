#include <stdio.h>
#include <stdlib.h>

// The symbols must have some type, or "gcc -Wall" complains
extern char etext, edata, end;

int main(int argc, char *argv[])
{
	printf("First address past:\n");
	printf("    program text (etext)      %10p\n", &etext);
	printf("    initialized data (edata)  %10p\n", &edata);
	printf("    uninitialized data (end)  %10p\n", &end);

	exit(EXIT_SUCCESS);
}
