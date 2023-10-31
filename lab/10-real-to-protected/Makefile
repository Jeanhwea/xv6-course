QEMU   = qemu-system-i386

all: fda.img

qemu: fda.img
	$(QEMU) -nographic -fda fda.img

qemu-debug: fda.img
	$(QEMU) -s -S -nographic -fda fda.img

bootsect.bin: bootsect.s
	nasm -f bin -o bootsect.bin -l bootsect.lst bootsect.s
	ndisasm -b 16 bootsect.bin > bootsect.dis

entry.o: entry.s
	nasm -f elf -o entry.o entry.s

bootmain.o: bootmain.c
	gcc -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie -fno-pic -O -nostdinc -I. -c -o bootmain.o bootmain.c

bootmain.bin: bootmain.o entry.o
	ld -m elf_i386 -N -e bootmain -Ttext 0x1000 -o bootmain.bin --oformat binary $^

fda.img: bootsect.bin bootmain.bin
	cat bootsect.bin bootmain.bin > fda.img

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm *.dis *.lst
