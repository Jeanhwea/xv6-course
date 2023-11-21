QEMU   = qemu-system-i386
BOCHS  = bochs
N      = 4

all: boot.bin

qemu: boot.bin
	$(QEMU) -smp $(N) -m 1M -boot a -fda boot.bin

qemu-debug: boot.bin
	$(QEMU) -s -S -smp 1 -m 1M -boot a -fda boot.bin

bochs: boot.bin
	$(BOCHS) -q -f bochsrc.bxrc

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin *.asm
