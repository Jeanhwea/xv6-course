QEMU   = qemu-system-i386

all: bootsect.bin bootmain.bin

qemu: bootsect.bin
	$(QEMU) -nographic -fda bootsect.bin

qemu-debug: bootsect.bin
	$(QEMU) -s -S -nographic -fda bootsect.bin

bootsect.bin: bootsect.s
	nasm -f bin -o bootsect.bin -l bootsect.lst bootsect.s
	ndisasm -b 16 bootsect.bin > bootsect.dis

entry.o: entry.s
	nasm -f elf -o entry.o entry.s

bootmain.o: bootmain.c
	gcc -m32 -ffreestanding -c -o bootmain.o bootmain.c

bootmain.bin: bootmain.o entry.o
	ld -m elf_i386 -N -e bootmain -Ttext 0x1000 -o bootmain.bin --oformat binary $^

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm *.dis *.lst
