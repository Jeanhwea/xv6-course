int vec[16];

int main (int argc, char *argv[])
{
	for (int i = 0; i < 8; ++i) {
		vec[i] = i;
	}
	return vec[3];
}
