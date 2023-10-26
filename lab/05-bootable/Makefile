CC     = gcc
AS     = as
LD     = ld
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386
GDB    = gdb
QEMU   = qemu-system-i386
OBJS   = $(patsubst %.S,%.out,$(wildcard *.S))

all: $(OBJS)


%.o: %.S
	$(AS) $(ASFLAG) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

img:
	dd if=/dev/zero of=hd.img bs=512 count=1

qemu:
	[ -f fda.img ] && \
	$(QEMU) -nographic -fda fda.img -s -S


.PHONY: clean qemu
clean:
	-rm *.o *.out *.img
