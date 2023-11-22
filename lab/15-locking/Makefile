CC     = gcc
AS     = as
LD     = ld
OD     = objdump
OC     = objcopy
CCFLAG = -m32 -O0 -pthread -g
ASFLAG =
LDFLAG = -m32 -O0 -pthread
ODFLAG = -S
OCFLAG = -S
GDB    = gdb
OBJS   = $(patsubst %.c,%.out,$(wildcard *.c))
ASMS   = $(patsubst %.c,%.asm,$(wildcard *.c))

all: $(OBJS) $(ASMS)

%.o: %.c
	$(CC) $(CCFLAG) -c -o $@ $<

%.asm: %.o
	$(OD) $(ODFLAG) -d $< > $@

%.out: %.o
	$(CC) $(LDFLAG) $< -o $@


.PRECIOUS: %.o

.PHONY: clean
clean:
	-rm -f *.o *.out *.run *.bin *.asm
