CC     = gcc
AS     = as
LD     = ld
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386
GDB    = gdb
OBJS   = $(patsubst %.S,%.out,$(wildcard *.S))

all: $(OBJS)


%.o: %.S
	$(AS) $(ASFLAG) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@


.PHONY: clean
clean:
	-rm *.o *.out
