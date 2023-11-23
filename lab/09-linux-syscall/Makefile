CC     = gcc
AS     = as
LD     = ld
OD     = objdump
OC     = objcopy
CCFLAG = -g
ASFLAG =
LDFLAG =
ODFLAG = -S
OCFLAG = -S
GDB    = gdb
OBJS   = $(patsubst %.c,%.out,$(wildcard *.c))

all: $(OBJS)

%.o: %.c
	$(CC) $(CCFLAG) -c -o $@ $<

%.out: %.o
	$(CC) $(LDFLAG) $< -o $@


.PRECIOUS: %.o

.PHONY: clean
clean:
	-rm -f *.o *.out *.run *.bin *.asm
