#define VGA_CTRL_REG 0x3d4
#define VGA_DATA_REG 0x3d5
#define VGA_ADDR ((char *)0xb8000)
#define MAX_ROWS 25
#define MAX_COLS 80
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

unsigned char port_in(unsigned short port)
{
	unsigned char result;
	__asm__("in %%dx, %%al" : "=a"(result) : "d"(port));
	return result;
}

void port_out(unsigned short port, unsigned char data)
{
	__asm__("out %%al, %%dx" : : "a"(data), "d"(port));
}

int get_cursor()
{
	port_out(VGA_CTRL_REG, 14);
	unsigned char high = port_in(VGA_DATA_REG);
	port_out(VGA_CTRL_REG, 15);
	unsigned char low = port_in(VGA_DATA_REG);
	int offset = (int)(high << 8) + (int)low;
	return offset * 2;
}

void set_cursor(int offset)
{
	offset /= 2;
	unsigned char high = (unsigned char)(offset >> 8);
	unsigned char low = (unsigned char)(offset & 0xff);
	port_out(VGA_CTRL_REG, 14);
	port_out(VGA_DATA_REG, high);
	port_out(VGA_CTRL_REG, 15);
	port_out(VGA_DATA_REG, low);
}
