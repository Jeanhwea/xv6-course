CC     = gcc
LD     = ld
CCFLAG = -m32
LDFLAG = -m elf_i386
GDB    = gdb

all: int01.out


%.o: %.S
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@


.PHONY: clean
clean:
	rm *.o *.out
