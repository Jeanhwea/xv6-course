all: adder.asm jump.out fcall.out

adder.asm: adder.out
	objdump -d $< > $@

adder.out: adder.c
	gcc -m32 adder.c -o adder.out

jump.out: jump.S
	gcc -m32 -c jump.S
	ld -m elf_i386 jump.o -o jump.out

fcall.out: fcall.S
	gcc -m32 -c fcall.S
	ld -m elf_i386 fcall.o -o fcall.out

clean:
	-rm -f *.out *.asm *.o
