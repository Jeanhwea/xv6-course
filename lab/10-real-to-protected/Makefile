CC     = gcc
AS     = nasm
LD     = ld
OD     = objdump
OC     = objcopy
CCFLAG = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie -O -nostdinc -I.
LDFLAG = -m elf_i386 -N -e start_kernel -Ttext 0x1000
QEMU   = qemu-system-i386

all: fda.img

qemu: fda.img
	$(QEMU) -boot a -fda fda.img

qemu-nox: fda.img
	$(QEMU) -nographic -boot a -fda fda.img

qemu-debug: fda.img
	$(QEMU) -s -S -nographic -boot a -fda fda.img

bootsect.bin: bootsect.s
	$(AS) -f bin -o bootsect.bin -l bootsect.lst bootsect.s
	ndisasm -b 16 bootsect.bin > bootsect.dis

entry.o: entry.s
	$(AS) -f elf -o entry.o entry.s

bootmain.o: bootmain.c
	$(CC) $(CCFLAG) -c -o bootmain.o bootmain.c

bootmain.bin: bootmain.o entry.o
	$(LD) $(LDFLAG) -o bootmain.bin --oformat binary $^

fda.img: bootsect.bin bootmain.bin
	cat bootsect.bin bootmain.bin > fda.img

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm *.dis *.lst
