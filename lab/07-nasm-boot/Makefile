QEMU   = qemu-system-i386

all: boot.bin

qemu: boot.bin
	$(QEMU) -nographic -fda boot.bin

qemu-debug: boot.bin
	$(QEMU) -s -S -nographic -fda boot.bin

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s

.PHONY: clean qemu
clean:
	-rm -f *.o *.d *.out *.img *.bin
