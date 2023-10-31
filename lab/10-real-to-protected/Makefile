QEMU   = qemu-system-i386

all: bootsect.bin

qemu: bootsect.bin
	$(QEMU) -nographic -fda bootsect.bin

qemu-debug: bootsect.bin
	$(QEMU) -s -S -nographic -fda bootsect.bin

bootsect.bin: bootsect.s
	nasm -f bin -o bootsect.bin -l bootsect.lst bootsect.s

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm
