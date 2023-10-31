QEMU   = qemu-system-i386

all: bootsect.bin

qemu: bootsect.bin
	$(QEMU) -nographic -fda bootsect.bin

qemu-debug: bootsect.bin
	$(QEMU) -s -S -nographic -fda bootsect.bin

bootsect.bin: bootsect.s
	nasm -f bin -o bootsect.bin -l bootsect.lst bootsect.s
	ndisasm -b 16 bootsect.bin > bootsect.dis

bootmain.bin: bootmain.c
	gcc -m32 -ffreestanding -c -o bootmain.o bootmain.c
	ld -m32 -o bootmain.bin -Ttext 0x1000 --oformat binary bootmain.o

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm *.dis
