// 屏幕显示
#define VGA_ADDR ((char *)0xb8000)
#define CTRL_REG 0x3d4
#define DATA_REG 0x3d5
#define MAX_ROWS 25
#define MAX_COLS 80

// 颜色
#define RED_ON_BLACK 0x0c
#define GREEN_ON_BLACK 0x0a

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
	port_out(CTRL_REG, 14);
	unsigned char high = port_in(DATA_REG);
	port_out(CTRL_REG, 15);
	unsigned char low = port_in(DATA_REG);
	int offset = (int)(high << 8) + (int)low;
	return offset * 2;
}

void set_cursor(int offset)
{
	offset /= 2;
	unsigned char high = (unsigned char)(offset >> 8);
	unsigned char low = (unsigned char)(offset & 0xff);
	port_out(CTRL_REG, 14);
	port_out(DATA_REG, high);
	port_out(CTRL_REG, 15);
	port_out(DATA_REG, low);
}

int get_offset(int col, int row)
{
	return 2 * (row * MAX_ROWS + col);
}

void clear_screen()
{
	char *video = VGA_ADDR;
	for (int col = 0; col < MAX_COLS; ++col) {
		for (int row = 0; row < MAX_ROWS; ++row) {
			video[get_offset(col, row)] = ' ';
		}
	}
}

void print_char(char ch)
{
	char *video = VGA_ADDR;
	int curr = get_cursor();
	video += curr;
	*video = ch;
	video++;
	*video = RED_ON_BLACK;
}

void start_kernel()
{
	char *video = VGA_ADDR;

	// print_char('X');

	// clear_screen();
	// set_cursor(get_offset(11, 0));

	char *msg = "Hello World\n";
	for (char *p = msg; *p != '\n'; ++p) {
		*video = *p;
		video++;
		*video = GREEN_ON_BLACK;
		video++;
	}

	while (1) {
	}
}
