QEMU   = qemu-system-i386
BOCHS  = bochs

all: boot.bin

qemu: boot.bin
	$(QEMU) -fda boot.bin

qemu-debug: boot.bin
	$(QEMU) -s -S -nographic -fda boot.bin

bochs: boot.bin
	$(BOCHS) -q -f bochsrc.bxrc

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm
