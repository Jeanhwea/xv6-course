void bootmain()
{
	char *video = (char *)0xb8000;
	*video = 'X';
}
