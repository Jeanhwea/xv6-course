all: a.out

# -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pic -nostdinc
main.o: main.S
	gcc -m32 -nostdinc -c main.S

a.out: main.o
	ld -m elf_i386 main.o



