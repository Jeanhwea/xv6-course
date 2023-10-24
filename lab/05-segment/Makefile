CC     = gcc
LD     = ld
CCFLAG = -m32
LDFLAG = -m elf_i386
GDB    = gdb

all: seg01.out seg02.out


%.o: %.c
	$(CC) $(CCFLAG) -c $< -o $@

%.o: %.S
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@


.PHONY: clean
clean:
	rm *.o *.out
