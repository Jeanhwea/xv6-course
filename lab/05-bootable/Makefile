CC     = gcc
AS     = as
LD     = ld
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386 -e start -Ttext 0x7c00
GDB    = gdb
QEMU   = qemu-system-i386
QMFLAG = -nographic -fda fda.img
OBJS   = $(patsubst %.S,%.out,$(wildcard *.S))

# all: $(OBJS)

all: fda.img


%.o: %.S
	$(AS) $(ASFLAG) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

fda.img: seg01.out
	dd if=/dev/zero of=fda.img bs=512 count=1
	dd if=seg01.out of=fda.img conv=notrunc

mbr:
	hexdump -n 512 fda.img

run: fda.img
	$(QEMU) $(QMFLAG)

dbg: fda.img
	$(QEMU) $(QMFLAG) -s -S


.PHONY: clean qemu
clean:
	-rm *.o *.out *.img
