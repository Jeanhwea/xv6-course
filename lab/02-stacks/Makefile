CC     = gcc
LD     = ld
CCFLAG = -m32
LDFLAG = -m elf_i386
GDB    = gdb

all: a.out
	$(GDB) ./a.out -ex "lay asm" -ex "lay reg"

main.o: main.S
	$(CC) $(CCFLAG) -c main.S

a.out: main.o
	$(LD) $(LDFLAG) main.o

clean:
	rm *.o *.out
