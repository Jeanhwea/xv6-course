QEMU   = qemu-system-i386

all: boot.bin

qemu: boot.bin
	$(QEMU) -nographic -fda boot.bin

boot.bin: boot.s
	nasm -f bin -o boot.bin boot.s
