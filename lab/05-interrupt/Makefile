CC     = gcc
AS     = as
LD     = ld
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386
GDB    = gdb
OUTS   = $(patsubst %.S,%.out,$(wildcard *.S))
RUNS   = $(patsubst %.c,%.run,$(wildcard *.c))

all: $(OUTS) $(RUNS)


%.o: %.S
	$(AS) $(ASFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

%.run: %.c
	$(CC) $(CCFLAG) $< -o $@


# 屏蔽自动删除 .o 文件的规则
.PRECIOUS: %.o

.PHONY: clean
clean:
	-rm -f *.o *.out *.run *.bin *.asm
