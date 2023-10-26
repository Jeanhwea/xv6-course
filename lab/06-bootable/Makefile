CC     = gcc
AS     = as
LD     = ld
CCFLAG = -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer
ASFLAG = -32
LDFLAG = -m elf_i386 -N -e start -Ttext 0x7c00
GDB    = gdb
QEMU   = qemu-system-i386
QMFLAG = -nographic -fda fda.img
OBJS   = $(patsubst %.S,%.out,$(wildcard *.S))

# all: $(OBJS)

all: fda.img


%.o: %.S
	$(CC) $(CCFLAG) -c -o $@ $<

%.o: %.c
	$(CC) $(CCFLAG) -c -o $@ $<

%.asm: %.o
	$(OD) -S

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

fda.img: boot.out
	dd if=/dev/zero of=fda.img bs=512 count=1
	dd if=boot.out  of=fda.img conv=notrunc

mbr:
	hexdump -n 512 fda.img

run: fda.img
	$(QEMU) $(QMFLAG)

dbg: fda.img
	$(QEMU) $(QMFLAG) -s -S

# Prevent deletion of intermediate files, e.g. cat.o, after first build, so
# that disk image changes after first build are persistent until clean.  More
# details:
# http://www.gnu.org/software/make/manual/html_node/Chained-Rules.html
.PRECIOUS: %.o

.PHONY: clean qemu
clean:
	-rm *.o *.d *.out *.img
