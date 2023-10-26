CC     = gcc
AS     = as
LD     = ld
CCFLAG = -m32
ASFLAG = -32
LDFLAG = -m elf_i386
GDB    = gdb
OUTS   = $(patsubst %.S,%.out,$(wildcard *.S))
OUTS   += $(patsubst %.c,%.out,$(wildcard *.c))

all: $(OUTS)


%.o: %.S
	$(AS) $(ASFLAG) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAG) -c $< -o $@

%.out: %.o
	$(LD) $(LDFLAG) $< -o $@

# 屏蔽自动删除 .o 文件的规则
.PRECIOUS: %.o

.PHONY: clean
clean:
	-rm *.o *.out
