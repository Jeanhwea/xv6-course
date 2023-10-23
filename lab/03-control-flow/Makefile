all: adder.asm

adder.asm: adder.out
	objdump -d $< > $@

%.out: %.c
	gcc -O0 $< -o $@

clean:
	-rm *.out *.asm *.o
