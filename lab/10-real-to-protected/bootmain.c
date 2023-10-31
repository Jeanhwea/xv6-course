#define VGA_ADDR ((char *)0xb8000)
#define GREEN 0x0a;

void start_kernel()
{
	char *video = VGA_ADDR;

	char *msg = "Hello World\n";
	for (char *p = msg; *p != '\n'; ++p) {
		*video = *p;
		video++;
		*video = GREEN;
		video++;
	}

	while (1) {
	}
}
