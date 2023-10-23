all: adder.asm simple-jump.out

adder.asm: adder.out
	objdump -d $< > $@

%.out: %.c
	gcc -O0 $< -o $@

simple-jump.out: simple-jump.S
	gcc -m32 -c simple-jump.S
	ld -m elf_i386 simple-jump.o -o simple-jump.out

clean:
	-rm *.out *.asm *.o
