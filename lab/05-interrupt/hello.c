#include <stdio.h>

int main (int argc, char *argv[])
{
	printf("Hello World!\n");
	// printf = glibc => syscall(write)
	//        -> int $0x80 write(4)
	//        ->   (linux kernel)
	//           -> BIOS
	//           -> int 0x16/0x13
	//            foreach "Hello world"
	//               single char
	return 0;
}
