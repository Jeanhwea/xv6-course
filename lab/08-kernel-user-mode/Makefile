CC     = gcc
AS     = as
LD     = ld
OD     = objdump
OC     = objcopy
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386 -N -e start -Ttext 0x7c00
ODFLAG = -S -m i8086
OCFLAG = -S -O binary -j .text
GDB    = gdb
QEMU   = qemu-system-i386
QMFLAG = -nographic -fda fda.img
OBJS   = $(patsubst %.S,%.out,$(wildcard *.S))
SIGN   = ../../bin/sign.pl

all: fda.img user.run

%.o: %.S
	$(CC) $(CCFLAG) -c -o $@ $<

%.o: %.c
	$(CC) $(CCFLAG) -c -o $@ $<

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

user.run: user.S
	$(CC) -c user.S
	$(LD) -o user.run user.o

kernel.bin: kernel.out
	$(OD) $(ODFLAG) $< > kernel.asm
	$(OC) $(OCFLAG) $< kernel.bin

fda.img: kernel.bin
	$(SIGN) kernel.bin
	dd if=/dev/zero of=fda.img bs=512 count=1
	dd if=kernel.bin  of=fda.img conv=notrunc

qemu: fda.img
	$(QEMU) $(QMFLAG)

qemu-debug: fda.img
	$(QEMU) $(QMFLAG) -s -S

.PRECIOUS: %.o

.PHONY: clean qemu
clean:
	-rm *.o *.out *.run *.bin *.asm
