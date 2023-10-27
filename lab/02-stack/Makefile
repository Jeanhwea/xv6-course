CC     = gcc
LD     = ld
CCFLAG = -m32
LDFLAG = -m elf_i386
GDB    = gdb

all: a.out

start: a.out
	-rm -f gdb.log
	$(GDB) ./a.out

main.o: main.S
	$(CC) $(CCFLAG) -c main.S

a.out: main.o
	$(LD) $(LDFLAG) main.o

clean:
	-rm -f *.o *.out
