all: a.out

main.o: main.S
	gcc -m32 -c main.S

a.out: main.o
	ld -m elf_i386 main.o

clean:
	-rm -f *.o *.out *.log
